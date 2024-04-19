<script lang="ts">
	import MonsterCard from "$lib/components/monsters/monster_card.svelte";
    import getDirectusInstance from "$lib/directus";
	import { readItems } from "@directus/sdk";
	import { Alert, Span, Spinner } from "flowbite-svelte";

    let directus = getDirectusInstance()
    let monsters = directus.request(readItems('Monsters')) as Promise<Monster[]>

</script>

<div class="p-4">
    {#await monsters}
        <div class="text-center">
            <div class="h-96" />
            <Spinner size={24} color="gray"/>
        </div>    
    {:then monsters}
        <div class="flex flex-wrap justify-evenly gap-6">
            {#each monsters as monster}
                <MonsterCard {monster} />
            {/each}
        </div>
    {:catch e}
        <Alert>An unexpected error occured: {JSON.stringify(e)}</Alert>
    {/await}
</div>