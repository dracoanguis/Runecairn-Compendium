<script lang="ts">
	import MonsterCard from "$lib/components/monster_card.svelte";
    import getDirectusInstance from "$lib/directus";
	import { readItems } from "@directus/sdk";
	import { Span, Spinner } from "flowbite-svelte";

    let directus = getDirectusInstance()
    let monsters = directus.request(readItems('Monsters')) as Promise<Monster[]>

</script>

<div>
    {#await monsters}
        <div class="text-center">
            <div class="h-96" />
            <Spinner size={24} color="gray"/>
        </div>    
    {:then monsters}
        <div class="grid grid-cols-4 gap-5 p-4">
            {#each monsters as monster}
                <MonsterCard {monster} />
            {/each}
        </div>
    {/await}
</div>