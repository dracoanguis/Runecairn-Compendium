<script lang="ts">
	import { Button, Modal, Popover } from "flowbite-svelte";

    export let item: Item;
    export let skills: Promise<Skill>[] | null;
    export let open = false;

</script>


<Modal bind:open outsideclose>
    <svelte:fragment slot="header">
        <div class="flex flex-col text-black dark:text-white">
            <h2 class="font-jacquard text-6xl font-semibold">{item.Name}</h2>
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
                                <Button id={skill.id} class="cursor-pointer rounded-xl dark:bg-slate-700 bg-white px-2 size-max border-2 border-black dark:border-white">{skill.Name}</Button>
                                <Popover></Popover>
                            {/await}
                        {/each}
                    {/if}
                </div>
            {/if}
        </div>
    </svelte:fragment>
</Modal>