Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15698CCA476
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 08:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B5C10E3ED;
	Mon, 13 Oct 2025 08:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVFnpsJz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039F510E3ED
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 08:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760342623; x=1791878623;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=SqtUf3uTwcuilnSpVFexiakhKcUUcG/ZQYFJHuFYRCE=;
 b=JVFnpsJzSZVg4UKjokwUAk6e/Y09eyPzv1Z8ze3h1cNqJVhm+ZSNfVYb
 ebzbMRrJjfA8EQFWRp62Vywj5OWQZWkqLjsrUJNecEb/FQW9pNB24ABjp
 RhYBHqqj8CDhM6VdUdCZtqCo+wDNuOIOJIPxXem8TGVLHhM6SuODk14ch
 0l7rOvly0Eq0Mad12ZeFCfjhJz45TLnjyZwGfteUXtgLSiVRXHVpeLdZT
 HgZ+yagu/u5+gWq2OF9TwQ93ynWOIaIl76Zm+QQLjlwzz7wMNIpLmJwd6
 8PiqO2vwtuWfgG3ubmbX97g7PJ0GJK8f6C5R5V3Vs4uEU2RdeWAVJtnp+ A==;
X-CSE-ConnectionGUID: zWO1F88BRCWh8C6HAN5kjg==
X-CSE-MsgGUID: b8v8bPvpT/OwNPNboBCphg==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62630631"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="62630631"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 01:03:42 -0700
X-CSE-ConnectionGUID: B+a4kiMlSD6NtDiFgxjuHw==
X-CSE-MsgGUID: eoA3k6v7QESzMerTz/tD2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="186633027"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.253])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 01:03:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, igt-dev@lists.freedesktop.org
Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Paul-PL
 Chen <paul-pl.chen@mediatek.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t 6/6] lib/igt_edid: Fix monitor name parsing and
 trim EDID string padding
In-Reply-To: <20251012171459.3773990-7-jason-jh.lin@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
 <20251012171459.3773990-7-jason-jh.lin@mediatek.com>
Date: Mon, 13 Oct 2025 11:03:36 +0300
Message-ID: <1543d4867d6055090309f653da5e74c9097322ae@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 13 Oct 2025, Jason-JH Lin <jason-jh.lin@mediatek.com> wrote:
> Fix the EDID parsing logic by supporting EDID_DETAIL_MONITOR_STRING in
> addition to EDID_DETAIL_MONITOR_NAME. Also, trim the trailing padding
> spaces from the monitor vendor name when parsing the EDID string to
> ensure the monitor name is correctly returned.
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  lib/igt_edid.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/lib/igt_edid.c b/lib/igt_edid.c
> index 627201c342df..56ddfd07279a 100644
> --- a/lib/igt_edid.c
> +++ b/lib/igt_edid.c
> @@ -26,6 +26,7 @@
>  #include "config.h"
>  
>  #include <assert.h>
> +#include <ctype.h>
>  #include <string.h>
>  #include <stdint.h>
>  #include <time.h>
> @@ -215,7 +216,7 @@ void edid_get_monitor_name(const struct edid *edid, char *name, size_t name_size
>  	const struct detailed_timing *dt;
>  	const struct detailed_non_pixel *np;
>  	const struct detailed_data_string *ds;
> -	size_t i;
> +	size_t i, n;
>  
>  	assert(name_size > 0);
>  	name[0] = '\0';
> @@ -224,12 +225,18 @@ void edid_get_monitor_name(const struct edid *edid, char *name, size_t name_size
>  		dt = &edid->detailed_timings[i];
>  		np = &dt->data.other_data;
>  
> -		if (np->type != EDID_DETAIL_MONITOR_NAME)
> +		if (np->type != EDID_DETAIL_MONITOR_NAME &&
> +		    np->type != EDID_DETAIL_MONITOR_STRING)
>  			continue;
>  
>  		ds = &np->data.string;
>  		strncpy(name, ds->str, name_size - 1);
> -		name[name_size - 1] = '\0';
> +
> +		/* remove the padding space from EDID */
> +		n = strlen(ds->str);

It's not NUL terminated.

BR,
Jani.

> +		while (n > 0 && isspace((unsigned char)name[n - 1]))
> +			name[--n] = '\0';
> +
>  		igt_debug("Monitor name: %s\n", name);
>  		return;
>  	}

-- 
Jani Nikula, Intel
