<script lang="ts">
	import { directus } from "$lib/store";
	import { readItem } from "@directus/sdk";
	import { Card, Img } from "flowbite-svelte";
	import ItemModal from "./item_modal.svelte";

    export let item: Item;
    export let open = false;

    async function getSkill(id: number) {
        return $directus.request(readItem('Skills',id)) as Promise<Skill>;
    }

    const skills = (item.skills == null) ? null : item.skills.map((id) => getSkill(id));
    const tdi = (item.Type == undefined) ? "" : ((x) => { switch (x) {
        case "armour":
            return "+"+item.TDI;
        case "shield":
            return "+"+item.TDI;
        case "weapon":
            return "D"+item.TDI;
        default:
            return "";
    }})(item.Type[0])

    const type_img = ((item.Type == undefined) ? "/apple_32_" : ((x) => {switch(x){
        case "armour":
            return "/helmet_32_";
        case "shield":
            return "/shield_32_";
        case "weapon":
            return "/swords_32_";
        default:
            return "/apple_32_";
    }})(item.Type[0])) +"black.png";
</script>

<Card class="max-h-44 cursor-pointer bg-slate-100 hover:text-slate-600 text-gray-900 dark:hover:text-gray-400 dark:text-white border-black dark:border-gray-400" on:click={() => open=true}>
    <div class="flex flex-row items-center gap-x-2">
        <Img class="max-w-7 max-h-7 block dark:invert" src="{type_img}"/>
        <h3 class="font-jacquard text-4xl font-semibold tracking-tight">{item.Name} {tdi}</h3>
    </div>
    {#if item.Qualities || item.skills}
        <div class="flex justify-start p-1 flex-wrap gap-x-1 align-middle">
            {#if item.Qualities}
                {#each item.Qualities as quality}
                    <!-- <div class="rounded-xl dark:bg-slate-700 bg-white px-2 size-max border-2 border-black dark:border-white  text-gray-900  dark:text-white">{quality}</div> -->
                    <p class="text-gray-900  dark:text-white font-bold text-lg">| {quality} </p>
                {/each}    
            {/if}
            {#if skills}
                {#each skills as skill}
                    {#await skill then skill}
                        <!-- <div class="rounded-xl dark:bg-slate-700 bg-white px-2 size-max border-2 border-black dark:border-white  text-gray-900  dark:text-white">{skill.Name}</div> -->
                        <p class="text-gray-900  dark:text-white font-bold text-lg">| {skill.Name}</p>
                    {/await}
                {/each}
            {/if}
            <p class="text-gray-900  dark:text-white font-bold text-lg">|</p>
        </div>
    {/if}
    <!-- <p class="font-bold my-1">{@html item.Description}</p> -->
</Card>
<ItemModal {item} bind:open {skills} {tdi} {type_img}/>