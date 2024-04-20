<script lang="ts">
	import { ArrowKeyDown, Button, Img, Modal, Popover } from "flowbite-svelte";
	import SkillPopover from "../skill_popover.svelte";

    export let item: Item;
    export let skills: Promise<Skill>[] | null;
    export let open = false;
    export let tdi = "";
    export let type_img = "";

</script>


<Modal bind:open outsideclose>
    <svelte:fragment slot="header">
        <div class="flex flex-col text-black dark:text-white">
            <div class="flex flex-row items-center gap-x-2">
                <Img size="size-10" class="block dark:invert" src="{type_img}"/>
                <h2 class="font-jacquard text-6xl font-semibold">{item.Name} {tdi}</h2>
            </div>
            {#if item.Qualities || item.skills}
                <div class="flex justify-start p-1 flex-nowrap gap-x-1 align-middle">
                    {#if item.Qualities}
                        {#each item.Qualities as quality}
                            <p class="text-gray-900  dark:text-white font-bold text-lg">| {quality} </p>
                        {/each}    
                    {/if}
                    {#if skills}
                        {#each skills as skill}
                            {#await skill then skill}
                                <p class="text-gray-900  dark:text-white font-bold text-lg">| {skill.Name}</p>
                                <SkillPopover {skill} />
                            {/await}
                        {/each}
                    {/if}
                    <p class="text-gray-900  dark:text-white font-bold text-lg">|</p>
                </div>
            {/if}
        </div>
    </svelte:fragment>
    {@html item.Description}
</Modal>