<script lang="ts">
	import { directus } from "$lib/store";
	import { readItem } from "@directus/sdk";
	import { Card } from "flowbite-svelte";
	import ItemModal from "./item_modal.svelte";
    

    async function getSkill(id: number) {
        return $directus.request(readItem('Skills',id)) as Promise<Skill>;
    }


    export let item: Item;
    export let open = true;

    const skills = (item.skills == null) ? null : item.skills.map((id) => getSkill(id));

</script>

<Card class="max-h-40 cursor-pointer bg-slate-100 hover:text-slate-600 text-gray-900 dark:hover:text-gray-400 dark:text-white border-black dark:border-gray-400" on:click={() => open=true}>
    <h3 class="font-jacquard text-4xl font-semibold tracking-tight">{item.Name}</h3>
    {#if item.Qualities || item.skills}
        <div class="flex justify-start p-1 flex-nowrap gap-x-2 align-middle">
            {#if item.Qualities}
                {#each item.Qualities as quality}
                    <div class="rounded-xl dark:bg-slate-700 bg-white px-2 size-max border-2 border-black dark:border-white">{quality}</div>
                {/each}    
            {/if}
            {#if skills}
                {#each skills as skill}
                    {#await skill then skill}
                        <div class="rounded-xl dark:bg-slate-700 bg-white px-2 size-max border-2 border-black dark:border-white">{skill.Name}</div>
                    {/await}
                {/each}
            {/if}
        </div>
    {/if}
    <p class="font-bold">{@html item.Description}</p>
</Card>
<ItemModal {item} bind:open {skills}/>