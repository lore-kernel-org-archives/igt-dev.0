Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E311C3ABC3
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 13:12:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B756810E25F;
	Fri,  9 May 2025 13:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ka+Sax+P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B237E10E25F
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 13:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746796323; x=1778332323;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tZzkciUUl0QHvGammNNJhIRR2CgS9CeHRcxxnEXd16w=;
 b=ka+Sax+PEmlgDRkLphx7gxzziErbH6xsOv+hbc7mC9IaoKFMxw3gNals
 8gtdIOACFeRo7oR3qlOT/+kjljCpoTLOS387sl7FFfgjcRi7tYDsNHR9L
 1kcJFL9Ned68INv784Hl9h832YCQeEz4Sl0uWthM7IvNZGvEcm/w3mj8q
 cO7b1TevRaApZ6ILf25Cd0NcneVuXuZnHpWXM2/2hv0lY0VcxDBG6KNil
 Qp/Hk++eVOsndwSYndx/gmzad2OEAWNIHFNUenMfCnCwckLBzEKPzXllw
 YgSy9FKOtsWE++L8NJmRpK6fkR2YzHYHuhroB2XM0Prf9r5C9aBGR2bYN A==;
X-CSE-ConnectionGUID: L4d2sCGfTCeOufBPiPSjfQ==
X-CSE-MsgGUID: XxJ8AGE2SZCk3D3xwS8lCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="60026301"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="60026301"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 06:12:03 -0700
X-CSE-ConnectionGUID: KpyFnu7BSBeQbWzV6G7C1Q==
X-CSE-MsgGUID: y9Xr8K6VSBmMxTAwmkt/qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="141530023"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 06:12:01 -0700
Date: Fri, 9 May 2025 15:11:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org, kunal1.joshi@intel.com,
 suraj.kandpal@intel.com, mohammed.thasleem@intel.com
Subject: Re: [PATCH i-g-t v1 1/2] lib/igt_whitelist: Add Hdcp Whitelist support
Message-ID: <20250509131149.gylrxqyh2uioucj5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org, kunal1.joshi@intel.com,
 suraj.kandpal@intel.com, mohammed.thasleem@intel.com
References: <20250506172337.2985430-1-santhosh.reddy.guddati@intel.com>
 <20250506172337.2985430-2-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506172337.2985430-2-santhosh.reddy.guddati@intel.com>
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

Hi Santhosh,
On 2025-05-06 at 22:53:36 +0530, Santhosh Reddy Guddati wrote:
> This introduces a mechanism to handle specific panels
> like emulators/dummies that are known to face issues with certain
> features like HDCP.
> 
> Tests are skipped for those outputs connected to prevent false negatives
> and unnecessary debugging,
> 
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  lib/igt_edid.c      | 27 ++++++++++++++++++++
>  lib/igt_edid.h      |  1 +
>  lib/igt_whitelist.c | 61 +++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_whitelist.h | 15 +++++++++++

imho this should be named lib/igt_panel.[ch]

as this is panel (display) block.

>  lib/meson.build     |  1 +
>  5 files changed, 105 insertions(+)
>  create mode 100644 lib/igt_whitelist.c
>  create mode 100644 lib/igt_whitelist.h
> 
> diff --git a/lib/igt_edid.c b/lib/igt_edid.c
> index 80dcea112..627201c34 100644
> --- a/lib/igt_edid.c
> +++ b/lib/igt_edid.c
> @@ -210,6 +210,33 @@ void edid_get_mfg(const struct edid *edid, char out[static 3])
>  	out[2] = (edid->mfg_id[1] & 0x1F) + '@';
>  }
>  
> +void edid_get_monitor_name(const struct edid *edid, char *name, size_t name_size)
> +{
> +	const struct detailed_timing *dt;
> +	const struct detailed_non_pixel *np;
> +	const struct detailed_data_string *ds;
> +	size_t i;
> +
> +	assert(name_size > 0);
> +	name[0] = '\0';
> +
> +	for (i = 0; i < DETAILED_TIMINGS_LEN; i++) {
> +		dt = &edid->detailed_timings[i];
> +		np = &dt->data.other_data;
> +
> +		if (np->type != EDID_DETAIL_MONITOR_NAME)
> +			continue;
> +
> +		ds = &np->data.string;
> +		strncpy(name, ds->str, name_size - 1);
> +		name[name_size - 1] = '\0';
> +		igt_debug("Monitor name: %s\n", name);
> +		return;
> +	}
> +	igt_debug("No monitor name found in EDID\n");
> +	name[0] = '\0';

Use perl script checkpatch.pl from Linux kernel for some whitespace
and code style problems.

> +}
> +
>  static void edid_set_mfg(struct edid *edid, const char mfg[static 3])
>  {
>  	edid->mfg_id[0] = (mfg[0] - '@') << 2 | (mfg[1] - '@') >> 3;
> diff --git a/lib/igt_edid.h b/lib/igt_edid.h
> index 02645345f..be0ccf529 100644
> --- a/lib/igt_edid.h
> +++ b/lib/igt_edid.h
> @@ -456,5 +456,6 @@ void *dispid_block_tiled(void *ptr,
>  			 int htile, int vtile,
>  			 int hsize, int vsize,
>  			 const char *topology_id);
> +void edid_get_monitor_name(const struct edid *edid, char *name, size_t name_size);
>  
>  #endif
> diff --git a/lib/igt_whitelist.c b/lib/igt_whitelist.c
> new file mode 100644
> index 000000000..6a210406f
> --- /dev/null
> +++ b/lib/igt_whitelist.c
> @@ -0,0 +1,61 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <stdbool.h>
> +#include <string.h>
> +
> +#include "drmtest.h"
> +#include "igt_whitelist.h"
> +
> +/**
> + * Blacklist array for HDCP.

s/Blacklist/Blocklist/

or maybe:

 * List od panels which should not run HDCP tests

> + *
> + * This array is used to identify and handle scenarios where the test is
> + * executed on dummy monitors, such as those found on shard machines.
> + * Since these dummy monitors are not real and always the test is not consistent,
> + * the test is skipped in such cases to avoid false negatives or
> + * irrelevant test results.
> + */
> +static const char *const hdcp_blacklist[] = {
> +	"DPF90435", // Example monitor name

Use C-style comments:

	"DPF90435", /* Example monitor name */

> +	// Add more monitor names here as needed

Same here

> +};
> +
> +/**
> + * is_in_blacklist - Checks if a given vendor name is present in a blacklist.

better function name: igt_is_panel_blocked_in_hdcp

If you think more panels should be blocked, consider checking
IGT_PANEL_BLOCKED enviroment var with panels listed like:
IGT_PANEL_BLOCKED=one,two,three

or make name more generic (no only for HDCP but for other features)

igt_is_panel_blocked()

> + *
> + * @vendor_name: The name of the vendor to check for in the blacklist.
> + * @blacklist: An array of strings representing the blacklist.

s/black/block/

> + * @blacklist_size: The number of entries in the blacklist array.

s/black/block/

> + *
> + * Returns:
> + * true if the vendor name is found in the blacklist, false otherwise.

s/black/block/

> + */
> +static bool is_in_blacklist(const char *vendor_name,

is_panel_in_blocked_list()

Same s/[Bb]lack/[Bb]lock/ to apply below.

> +			    const char *const blacklist[],
> +			    size_t blacklist_size)
> +{
> +	int i;
> +
> +	for (i = 0; i < blacklist_size; i++) {
> +		if (strstr(blacklist[i], vendor_name) != NULL)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +/**
> + * is_panel_blacklisted_hdcp - Checks if a panel vendor is blacklisted for HDCP.
> + * @vendor_name: The name of the panel vendor to check.
> + *
> + * Returns:
> + * true if the vendor is blacklisted for HDCP, false otherwise.
> + */
> +bool is_panel_blacklisted_hdcp(const char *vendor_name)

igt_is_panel_blocked_hdcp()


Regards,
Kamil

> +{
> +	return is_in_blacklist(vendor_name, hdcp_blacklist,
> +			       ARRAY_SIZE(hdcp_blacklist));
> +}
> diff --git a/lib/igt_whitelist.h b/lib/igt_whitelist.h
> new file mode 100644
> index 000000000..3ffa35db9
> --- /dev/null
> +++ b/lib/igt_whitelist.h
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef IGT_WHITELIST_H
> +#define IGT_WHITELIST_H
> +
> +#include <stdbool.h>
> +#include <string.h>
> +
> +bool is_panel_blacklisted_hdcp(const char *vendor_name);
> +
> +#endif
> +
> diff --git a/lib/meson.build b/lib/meson.build
> index b58976a43..130c01336 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -112,6 +112,7 @@ lib_sources = [
>  	'igt_msm.c',
>  	'igt_dsc.c',
>  	'igt_hook.c',
> +	'igt_whitelist.c',
>  	'xe/xe_gt.c',
>  	'xe/xe_ioctl.c',
>  	'xe/xe_mmio.c',
> -- 
> 2.34.1
> 
