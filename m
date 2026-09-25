Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF924C9830D
	for <igt-dev@archiver.kernel.org>; Fri, 25 Sep 2026 06:23:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A74110F864;
	Fri, 25 Sep 2026 06:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ToCM7zxH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 832D610F867
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Sep 2026 06:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790317380; x=1821853380;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZFxQZR7QbAuPaQYOU+J8E+miDJ/HhQq1dZHiZITTngI=;
 b=ToCM7zxHdS/aZcVN73dy5mdNFVVqXo2QLXfCbHoesEmGIPF6qM6UxEWZ
 CDGO3DlvrqV41LT/Qs4RZoWqnu5o0gq2hUKEmBNVoIA8vYefofoueKT8e
 A4dMjsNyJsWzFtwoXKT+trLq0VyyYOT09y4MLNUMtWOHF12WXTgUo864h
 4FcQMc77MQuLSoNMgI5nqnI8FDL9C9vydXuukojNJeqblpGNuevd/V/5r
 COuhMSTWwaYnIridfwIHrIL9dxXWg4suW2P5uQSW8Jt+q+vA/G9XCnYAh
 TEpxgP9SJUxn8HAbRqzinfbE6uGICTH/LgtAgVaMhkDnqsh2jYJdnm5gX Q==;
X-CSE-ConnectionGUID: vAHbTy7HRgaK6294qthNOA==
X-CSE-MsgGUID: Qug/dfV0QpCUJit/renqDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="116626424"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="116626424"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 23:23:00 -0700
X-CSE-ConnectionGUID: vExcWWxATLyutYCYaIcVFQ==
X-CSE-MsgGUID: 1BztEy2kS0mKr/DqPHRbWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="282331093"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.42])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 23:22:58 -0700
Date: Fri, 25 Sep 2026 08:22:56 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Xin Wang <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.d.roper@intel.com, 
 kamil.konieczny@linux.intel.com, ravi.kumar.vodapalli@intel.com,
 stuart.summers@intel.com
Subject: Re: [PATCH i-g-t v13 2/4] lib/intel_device_info: make device info
 cache process-wide
Message-ID: <h7okgr6ybc2qayx2srdopir4prtg6r6sbm6hrlszn5soyex3r7@2sx63agh4e5p>
References: <20260924035545.710985-1-x.wang@intel.com>
 <20260924035545.710985-3-x.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924035545.710985-3-x.wang@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Wed, Sep 23, 2026 at 08:55:38PM -0700, Xin Wang wrote:
> intel_get_device_info() caches the last looked-up entry in per-thread
> variables that point into the static, read-only PCI-ID table. Such a
> cache cannot carry data that is updated at runtime, e.g. the graphics
> IP version reported by GMD_ID on Xe platforms.
> 
> Replace it with a process-wide cache keyed by devid which holds a
> mutable copy of the matching static table entry. The cache is protected
> by a statically initialized mutex, the map is created lazily on the
> first lookup so it does not depend on constructor ordering, and it is
> torn down via igt_destructor. If a cache entry cannot be allocated,
> fall back to the static table entry.

Generally series looks correct, but I got few nits. Returning static
entry is incorrect, especially when patch 4/4 drops rel field.

> 
> Also link igt_map.c into libigt_chipset to provide the map implementation.
> 
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  lib/intel_device_info.c | 106 ++++++++++++++++++++++++++++++++++------
>  lib/meson.build         |   1 +
>  2 files changed, 92 insertions(+), 15 deletions(-)
> 
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index ae316bfcab..a7ba40ed2b 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -1,8 +1,11 @@
>  #include "intel_chipset.h"
>  #include "pciids.h"
>  #include "i915_pciids_local.h"
> +#include "igt_core.h"
> +#include "igt_map.h"
>  
>  #include <ctype.h>
> +#include <pthread.h>
>  #include <strings.h> /* ffs() */
>  
>  static const struct intel_device_info intel_generic_info = {
> @@ -716,6 +719,59 @@ static const struct pci_id_match intel_device_match[] = {
>  
>  #undef INTEL_PCI_ID_INIT
>  
> +/*
> + * Process-wide cache of per-devid copies of the static PCI-ID table entries.
> + * Entries can be updated at runtime, e.g. by xe_device_get() with the graphics
> + * IP version reported by GMD_ID. The cache is keyed by PCI device ID, so all
> + * devices sharing a device ID share one entry.
> + *
> + * The map is created lazily on first lookup, so lookups do not depend on
> + * constructor ordering.
> + */
> +static struct {
> +	pthread_mutex_t mutex;
> +	struct igt_map *map;
> +} devinfo_cache = {
> +	.mutex = PTHREAD_MUTEX_INITIALIZER,
> +};
> +
> +static void free_device_info(struct igt_map_entry *entry)
> +{
> +	free(entry->data);
> +	free((void *)entry->key);
> +}
> +
> +igt_destructor
> +{
> +	pthread_mutex_lock(&devinfo_cache.mutex);
> +	igt_map_destroy(devinfo_cache.map, free_device_info);
> +	devinfo_cache.map = NULL;
> +	pthread_mutex_unlock(&devinfo_cache.mutex);
> +}

Imo this destructor path is not necessary here. There's no other
cleanups than memory release what will happen during process exit
anyway.

> +
> +/* Caller must hold devinfo_cache.mutex. */
> +static struct intel_device_info *devinfo_cache_search(uint16_t devid)
> +{
> +	uint32_t key = devid;
> +
> +	if (!devinfo_cache.map)
> +		return NULL;
> +
> +	return igt_map_search(devinfo_cache.map, &key);
> +}
> +
> +static const struct intel_device_info *devinfo_table_lookup(uint16_t devid)
> +{
> +	int i;
> +
> +	for (i = 0; intel_device_match[i].device_id != PCI_MATCH_ANY; i++) {
> +		if (devid == intel_device_match[i].device_id)
> +			break;
> +	}
> +
> +	return (const struct intel_device_info *)intel_device_match[i].match_data;
> +}
> +
>  /**
>   * intel_get_device_info:
>   * @devid: pci device id
> @@ -727,24 +783,44 @@ static const struct pci_id_match intel_device_match[] = {
>   */
>  const struct intel_device_info *intel_get_device_info(uint16_t devid)
>  {
> -	static __thread const struct intel_device_info *cache = &intel_generic_info;
> -	static __thread uint16_t cached_devid;
> -	int i;
> -
> -	if (cached_devid == devid)
> -		goto out;
> -
> -	/* XXX Presort table and bsearch! */
> -	for (i = 0; intel_device_match[i].device_id != PCI_MATCH_ANY; i++) {
> -		if (devid == intel_device_match[i].device_id)
> -			break;
> +	const struct intel_device_info *table_info;
> +	struct intel_device_info *info, *new_info;
> +	uint32_t *new_key;
> +
> +	pthread_mutex_lock(&devinfo_cache.mutex);
> +	info = devinfo_cache_search(devid);
> +	pthread_mutex_unlock(&devinfo_cache.mutex);
> +	if (info)
> +		return info;
> +
> +	table_info = devinfo_table_lookup(devid);
> +
> +	new_key = malloc(sizeof(*new_key));
> +	new_info = malloc(sizeof(*new_info));

This part should report allocation failure, otherwise we use static
entry and we even don't know about it. And with 4/4 patch it is useless
anyway.

--
Zbigniew

> +	if (new_key && new_info) {
> +		*new_key = devid;
> +		*new_info = *table_info;
> +
> +		pthread_mutex_lock(&devinfo_cache.mutex);
> +		if (!devinfo_cache.map)
> +			devinfo_cache.map = igt_map_create(igt_map_hash_32,
> +							   igt_map_equal_32);
> +		/* Another thread may have inserted while we were allocating. */
> +		info = devinfo_cache_search(devid);
> +		if (!info && devinfo_cache.map &&
> +		    igt_map_insert(devinfo_cache.map, new_key, new_info)) {
> +			info = new_info;
> +			new_key = NULL;
> +			new_info = NULL;
> +		}
> +		pthread_mutex_unlock(&devinfo_cache.mutex);
>  	}
>  
> -	cached_devid = devid;
> -	cache = (void *)intel_device_match[i].match_data;
> +	free(new_info);
> +	free(new_key);
>  
> -out:
> -	return cache;
> +	/* Without a cache entry, fall back to the static table entry. */
> +	return info ?: table_info;
>  }
>  
>  static bool char_eq(char c1, char c2)
> diff --git a/lib/meson.build b/lib/meson.build
> index 2ac6327587..7d1502ef48 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -397,6 +397,7 @@ igt_deps = [ lib_igt ] + lib_deps
>  lin_igt_chipset_build = static_library('igt_chipset',
>                                         ['intel_chipset.c',
>  					'intel_device_info.c',
> +					'igt_map.c',
>  					'intel_cmds_info.c'],
>                                         include_directories : inc)
>  
> -- 
> 2.43.0
> 
