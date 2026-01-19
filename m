Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E973CCF2DB
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 10:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C368E10E3E5;
	Mon, 19 Jan 2026 10:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQFoTpul";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5CC10E3E5
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 10:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768818992; x=1800354992;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KAtpYb7SB7xUH8iEXOlFHUT/eD9Wy218tUeokyIx3cY=;
 b=AQFoTpulnkKM04OhjL36QV+7cxhkA4N0rC7zWtmCnLpcesfsjhBMKLF7
 Zm+ozk0V5JeYKx7AJeZjSGijHENpvW946EafThehVvcyFhfFOr4G5jWbY
 K5UZ3VbiKE9lGuDPIfyjPmWWCkL0LrEIu9pmkR697mmP6BsLNqQxLrw4+
 zLoHUxNe4OV+/vb+ywtWzRjFfPAhwcoJAmVld/W0/T7bL0nSjrFEwXNct
 eDraehlHLQalBxLhGrGXrNJrBWsMv9vyFxqHMGz60ejeEvyAalUThiMqx
 OrosLB2OGYUMj3KI+7Jo6vPjzz/fN5M3TxGf2cnjcc8xyjduY87rZhyje A==;
X-CSE-ConnectionGUID: 8me6EpHnRveInBHJ4Nef2Q==
X-CSE-MsgGUID: CioSD/d8S6+jQjPmgSArAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="81140615"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="81140615"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 02:36:32 -0800
X-CSE-ConnectionGUID: 33vR9pOFRI6Dfwfe+kTYJA==
X-CSE-MsgGUID: g40IlLU3Q163JVXBMpacjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="205454066"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.56])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 02:36:29 -0800
Date: Mon, 19 Jan 2026 11:36:27 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Xin Wang <x.wang@intel.com>, igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ravi Kumar V <ravi.kumar.vodapalli@intel.com>
Subject: Re: [PATCH v10 1/2] lib/xe/xe_query: Get runtime xe device graphics
 version from GMD_ID
Message-ID: <gt6bnphnrhub64xwn67xgx6aom7245osaqvqq3la5o4qt3hny3@zoqteqp6fd4e>
References: <20260112191732.672297-1-x.wang@intel.com>
 <20260112191732.672297-2-x.wang@intel.com>
 <viv6pwhicr6jjm5d4hoznn7w4h7ixamqdwalpx3eb3aoc5fgbr@2rrcrdhe7rsn>
 <20260116213358.GJ458797@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260116213358.GJ458797@mdroper-desk1.amr.corp.intel.com>
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

On Fri, Jan 16, 2026 at 01:33:58PM -0800, Matt Roper wrote:
> On Thu, Jan 15, 2026 at 09:00:53AM +0100, Zbigniew Kempczyński wrote:
> > On Mon, Jan 12, 2026 at 07:17:31PM +0000, Xin Wang wrote:
> > > This allows IGT to query the exact IP version for xe platforms.
> > > 
> > > Key changes:
> > > - Add xe_device_ipver field to xe_device structure
> > > - set the graphics versions based on the GMD_ID
> > > - Cache device ipver in global map indexed by devid for efficient lookup
> > > - Implement xe_ipver_cache_lookup() to retrieve cached ipver by devid
> > > - Clean up cached device ipver when xe_device is released
> > > 
> > > V2:
> > > - add new struct xe_device_ipver to hold the ipver info
> > > - separate cache map to eliminate collision (Roper, Matthew D)
> > > - changed function name to xe_ipver_cache_lookup() to avoid
> > >   confusion (Roper, Matthew D)
> > > 
> > > V3:
> > > - optimize the coding style. (Summers, Stuart)
> > > 
> > > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Signed-off-by: Xin Wang <x.wang@intel.com>
> > > Reviewed-by: Ravi Kumar V <ravi.kumar.vodapalli@intel.com>
> > > ---
> > >  lib/intel_chipset.h |  6 +++++
> > >  lib/xe/xe_query.c   | 54 ++++++++++++++++++++++++++++++++++++++++++++-
> > >  lib/xe/xe_query.h   |  4 ++++
> > >  3 files changed, 63 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> > > index cc2225110..424811f7c 100644
> > > --- a/lib/intel_chipset.h
> > > +++ b/lib/intel_chipset.h
> > > @@ -100,6 +100,12 @@ struct intel_device_info {
> > >  	const char *codename;
> > >  };
> > >  
> > > +struct xe_device_ipver {
> > > +	uint32_t devid;
> > > +	uint16_t graphics_ver;
> > > +	uint16_t graphics_rel;
> > > +};
> > > +
> > >  const struct intel_device_info *intel_get_device_info(uint16_t devid) __attribute__((pure));
> > >  
> > >  const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid) __attribute__((pure));
> > > diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> > > index 981d76948..823a29f2d 100644
> > > --- a/lib/xe/xe_query.c
> > > +++ b/lib/xe/xe_query.c
> > > @@ -210,6 +210,22 @@ static struct xe_device_cache {
> > >  	struct igt_map *map;
> > >  } cache;
> > >  
> > > +static struct xe_ipver_cache {
> > > +	pthread_mutex_t mutex;
> > > +	struct igt_map *map;
> > > +} xe_ipver;
> > > +
> > > +struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid)
> > > +{
> > > +	struct xe_device_ipver *ipver;
> > > +
> > > +	pthread_mutex_lock(&xe_ipver.mutex);
> > > +	ipver = igt_map_search(xe_ipver.map, &devid);
> > > +	pthread_mutex_unlock(&xe_ipver.mutex);
> > > +
> > > +	return ipver;
> > > +}
> > > +
> > 
> > Please forgive me for sharing my thoughts only now.
> > 
> > I wondered about this a bit and according to current code shape
> > I don't like this design - especially ip_ver cache in xe_query.
> > I mean I don't like to use external cache which might or might not
> > be filled at time of calling intel_get_device_info().
> > 
> > At the moment I see following options:
> > 
> > 1. Provide update function intel_device_info_update(devid, ver, rel)
> >    allowing to update rel field during xe_device_get(). This still
> >    keeps intel_device_info.c independent but rel field might be
> >    incorrect. BTW I would set it in static definition to -1 (max
> >    unsigned) to catch it is not set/updated properly during
> >    intel_get_device_info().
> > 
> > 2. Add new function intel_get_device_info_by_fd() which will support
> >    passing fd instead devid and migrate code to use it. Most of our code
> >    uses fd to acquire device id before calling intel_get_device_info()
> >    [exception is igt_device_scan which uses pci devid directly]. This
> >    will break intel_device_info.c independency because we start calling
> >    driver functions, but maybe it is time to do this (GMD_ID).
> > 
> >    Digression: It seems when INTEL_DEVID_OVERRIDE won't work properly
> >    but I wouldn't care about it for now.
> > 
> > 3. Mix 1 and 2 but build hash map from intel_device_match[] in the
> >    constructor and update it during xe_device_get(). Pros of this
> >    is we could stop using 'static __thread' for caching last info.
> 
> The problem is that "graphics version" and "media version" are not
> supposed to be a characteristic of a general device type anymore.  An
> individual device will have some version number, but another device of
> the same "type" with the same PCI ID can can potentially have a
> different IP version.  We've been lucky enough so far to still have
> unique PCI IDs for cases where the version numbers are different (at
> least for production parts), but this is not something that we're
> supposed to be relying on since the IP disaggregation happened around
> the MTL timeframe.  Personally I think that hacks that keep treating
> versions as something associated with a device type are just making the
> problem harder to untangle.

Thanks for explaining this. I wasn't aware same PCI ID may map to
different IP versions. If I'm not wrong atm kernel also doesn't have
this addressed yet (pciidlist[] still maps PCI ID to some device
characteristics). Is it possible the opossite that same ver/rel may map
to different PCI IDs? This would complicate things even more, especially
we heavily depend on some flags set for device (has_flatccs, etc). Or
ver/rel will uniquely determine other device characteristics? If yes
may we replace PCI ID to ver/rel as a key for device info?

> 
> For a proper solution, I think we really need to separate the concept of
> "traits associated with a type of device" (which is the stuff we have in
> the device info structure which can be accurately looked up by PCI ID)
> from "IP version associated with a specific device instance" (which on
> modern platforms can only be accurately looked up in the context of a
> specific device handle such as a FD).

I'm not sure what you've written is equal to my previous comment? I mean
ver/rel is a device characteristic key?

--
Zbigniew

> 
> So aside from a few special cases, we want IGT to stop translating PCI
> IDs into version numbers and instead start translating fd's into version
> numbers.  The special case exceptions I can think of that don't really
> have a way to do fd-based lookups are: 
> 
>  * tools/tests that bypass the driver entirely (possibly running without
>    the driver loaded) and just use libpciaccess for direct BAR access.
>    Most of these either don't have version-based conditions or only have
>    version conditions matching against very old platforms (where a
>    PCIID-based lookup is "safe")
> 
>  * the old i915-era error dump decoder tool just reads its information
>    (including PCI ID) from a dump file on disk.  The tool might be
>    executed on a completely different machine from where the dump was
>    originally captured.  I don't think this tool has been updated since
>    gen8 (everyone switched over to using the Mesa tool instead), and I
>    don't think it would function at all on any of our modern platforms.
>    So if this tool is still useful at all, it would only be on ancient
>    i915 platforms where a PCIID-based lookup is "safe."
> 
> 
> The solution I suggested during an earlier review of this series was:
> 
>  * Create separate "version from PCI ID" APIs that can be used in the
>    few special cases listed above, and migrate those uses over.
> 
>  * Change the signature of intel_gen / intel_graphics_ver to take an FD
>    rather than a PCI ID; when running on Xe this would do the lookup via
>    the query ioctl to get an accurate value.
> 
>  * Update intel_gen / intel_graphics_ver:
>      - If running on i915, fall back to the device_info lookup that
>        we've always used.  That's safe for all i915 platforms except
>        MTL/ARL, and we were lucky enough that they never created any
>        production MTL/ARL platforms where a single PCI ID had different
>        possible versions, so it winds up being safe there too.
> 
>     - If running on Xe, use the query ioctl to obtain the version
>       number.  This will return the proper value for all platforms
>       officially supported by Xe (i.e., Xe2 and later).  It will return
>       0 on pre-MTL platforms (which aren't officially supported), but in
>       that case IGT can fall back to the i915 approach above.
> 
> I did a mockup of the first two parts several months ago:
> 
>   https://github.com/mattrope/intel-gpu-tools/commits/forupstream/version_query/
> 
> Since the function interface is changing, it's a lot of churn, but most
> of it can be auto-converted quickly via Coccinelle.
> 
> 
> Matt
> 
> > 
> > --
> > Zbigniew
> > 
> > >  static struct xe_device *find_in_cache_unlocked(int fd)
> > >  {
> > >  	return igt_map_search(cache.map, &fd);
> > > @@ -270,6 +286,24 @@ struct xe_device *xe_device_get(int fd)
> > >  	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
> > >  		xe_dev->gt_mask |= (1ull << xe_dev->gt_list->gt_list[gt].gt_id);
> > >  
> > > +	/*
> > > +	 * Set graphics_ver and graphics_rel based on the main GT's GMD_ID.
> > > +	 * We should use the hardcoded value for the non-GMD_ID platforms (ip_ver_major == 0)
> > > +	 */
> > > +	xe_dev->ipver.devid = 0;
> > > +	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++) {
> > > +		if (xe_dev->gt_list->gt_list[gt].type == DRM_XE_QUERY_GT_TYPE_MAIN &&
> > > +		    xe_dev->gt_list->gt_list[gt].ip_ver_major) {
> > > +			igt_debug("Setting graphics_ver to %u and graphics_rel to %u\n",
> > > +				  xe_dev->gt_list->gt_list[gt].ip_ver_major,
> > > +				  xe_dev->gt_list->gt_list[gt].ip_ver_minor);
> > > +			xe_dev->ipver.graphics_ver = xe_dev->gt_list->gt_list[gt].ip_ver_major;
> > > +			xe_dev->ipver.graphics_rel = xe_dev->gt_list->gt_list[gt].ip_ver_minor;
> > > +			xe_dev->ipver.devid = xe_dev->dev_id;
> > > +			break;
> > > +		}
> > > +	}
> > > +
> > >  	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
> > >  	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
> > >  		xe_dev->tile_mask |= (1ull << xe_dev->gt_list->gt_list[gt].tile_id);
> > > @@ -304,6 +338,11 @@ struct xe_device *xe_device_get(int fd)
> > >  	prev = find_in_cache_unlocked(fd);
> > >  	if (!prev) {
> > >  		igt_map_insert(cache.map, &xe_dev->fd, xe_dev);
> > > +		if (xe_dev->ipver.devid) {
> > > +			pthread_mutex_lock(&xe_ipver.mutex);
> > > +			igt_map_insert(xe_ipver.map, &xe_dev->ipver.devid, &xe_dev->ipver);
> > > +			pthread_mutex_unlock(&xe_ipver.mutex);
> > > +		}
> > >  	} else {
> > >  		xe_device_free(xe_dev);
> > >  		xe_dev = prev;
> > > @@ -315,7 +354,15 @@ struct xe_device *xe_device_get(int fd)
> > >  
> > >  static void delete_in_cache(struct igt_map_entry *entry)
> > >  {
> > > -	xe_device_free((struct xe_device *)entry->data);
> > > +	struct xe_device *xe_dev = (struct xe_device *)entry->data;
> > > +
> > > +	if (xe_dev->ipver.devid) {
> > > +		pthread_mutex_lock(&xe_ipver.mutex);
> > > +		igt_map_remove(xe_ipver.map, &xe_dev->ipver.devid, NULL);
> > > +		pthread_mutex_unlock(&xe_ipver.mutex);
> > > +	}
> > > +
> > > +	xe_device_free(xe_dev);
> > >  }
> > >  
> > >  /**
> > > @@ -365,13 +412,18 @@ static void xe_device_destroy_cache(void)
> > >  	pthread_mutex_lock(&cache.cache_mutex);
> > >  	igt_map_destroy(cache.map, delete_in_cache);
> > >  	pthread_mutex_unlock(&cache.cache_mutex);
> > > +	pthread_mutex_lock(&xe_ipver.mutex);
> > > +	igt_map_destroy(xe_ipver.map, NULL);
> > > +	pthread_mutex_unlock(&xe_ipver.mutex);
> > >  }
> > >  
> > >  static void xe_device_cache_init(void)
> > >  {
> > >  	pthread_mutex_init(&cache.cache_mutex, NULL);
> > > +	pthread_mutex_init(&xe_ipver.mutex, NULL);
> > >  	xe_device_destroy_cache();
> > >  	cache.map = igt_map_create(igt_map_hash_32, igt_map_equal_32);
> > > +	xe_ipver.map = igt_map_create(igt_map_hash_32, igt_map_equal_32);
> > >  }
> > >  
> > >  #define xe_dev_FN(_NAME, _FIELD, _TYPE) \
> > > diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> > > index d7a9f95f9..19690cff3 100644
> > > --- a/lib/xe/xe_query.h
> > > +++ b/lib/xe/xe_query.h
> > > @@ -74,6 +74,9 @@ struct xe_device {
> > >  
> > >  	/** @dev_id: Device id of xe device */
> > >  	uint16_t dev_id;
> > > +
> > > +	/** @ipver: Device ip version */
> > > +	struct xe_device_ipver ipver;
> > >  };
> > >  
> > >  #define xe_for_each_engine(__fd, __hwe) \
> > > @@ -181,6 +184,7 @@ static inline void *xe_query_device(int fd, uint32_t type, uint32_t *size)
> > >  }
> > >  
> > >  struct xe_device *xe_device_get(int fd);
> > > +struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid);
> > >  void xe_device_put(int fd);
> > >  
> > >  int xe_query_eu_count(int fd, int gt);
> > > -- 
> > > 2.43.0
> > > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
