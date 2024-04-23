<script lang="ts">
	import { ArrowKeyDown, ArrowKeyUp, Button, Popover } from "flowbite-svelte";

    export let skill: Skill;
    export let expanded = false;

</script>

<Popover placement="bottom-start" class="drop-shadow-2xl max-w-96">
    <svelte:fragment slot="title">
        <div class="flex gap-x-2 text-lg font-bold text-black dark:text-white">
            <p>{skill.Name}</p>
            {#if skill.Properties}
                <p>(
                    {#each skill.Properties as prop}
                        {prop+' '}
                    {/each}
                )
                </p>
            {/if}
        </div>
    </svelte:fragment>
    {@html skill.short_desc}
    {#if skill.long_description}
        {#if expanded}
            {@html skill.long_description}
        {/if}
        <div class="flex justify-center">
            <Button color="none" on:click={()=>expanded=(!expanded)}>
                {#if !expanded}
                    <ArrowKeyDown/>
                {:else}
                    <ArrowKeyUp/>
                {/if}
            </Button>
        </div>
    {/if}
</Popover>