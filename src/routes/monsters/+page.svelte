<script lang="ts">
	import MonsterCard from "$lib/components/monster_card.svelte";
import getDirectusInstance from "$lib/directus";
	import { readItems } from "@directus/sdk";
	import { Spinner } from "flowbite-svelte";

    let directus = getDirectusInstance()
    let monsters = directus.request(readItems('Monsters')) as Promise<Monster[]>

</script>

{#await monsters}
    <Spinner />
{:then monsters} 
    {#each monsters as monster}
        <MonsterCard {monster} />
    {/each}
{/await}