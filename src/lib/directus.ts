import type { FetchFunction } from 'vite';
import { PUBLIC_APIURL } from '$env/static/public';
import { createDirectus, rest } from '@directus/sdk';

function getDirectusInstance(fetch: FetchFunction|null) {
  	const options = fetch ? { globals: { fetch } } : {};
	const directus = createDirectus(PUBLIC_APIURL, options ).with(rest());
	return directus;
}

export default getDirectusInstance;