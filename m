Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3924FCCF9F8
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 16:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C731810E295;
	Thu, 30 Oct 2025 16:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jyPm3Mw5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C307D10E295
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 16:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761842077; x=1793378077;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nKndE7XcIbbNJe7ci3MJZ/ZH0nbFTl1o/4CZJeaBO5c=;
 b=jyPm3Mw5vMNtOudnQAGAbsuRyQJBACG/qbNycYbv9Rx16DmJo2is/tk1
 qGwgG99CnW3RRDzhqX0z5ddbAjdnpH2G2YcoDGEFBithQnOOuY7O+fknn
 x2n1VHRXrxSgGTR5r8jz563+b4x1AsLXU9nnU0putlkCMM/9Vz/gI0Se7
 AWKQw1obV6LyVfpUc7uVH9SEmsKuzRL13tZigN04nQL4VhcvljhyDUFq/
 U0lDbfmrdAeHIuLpPvY0Kse6xQ0w6pSwVOv8GFxDVL4wX5B9Do33Wheyf
 uqYboYrJrIx74N/hnqsvnH3FZo3NmKjjbbY52NBTuahcm34AThTpfp+Ef g==;
X-CSE-ConnectionGUID: Ijez7WQfTAuH/M6hDDseVw==
X-CSE-MsgGUID: 9HgHWwqeTlaJ5tfUfjODOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64022891"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="64022891"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 09:34:36 -0700
X-CSE-ConnectionGUID: hI5/pTJ4RnGPV3qHeHcvSA==
X-CSE-MsgGUID: pO3MGOO4TtaQj6/e3ogM9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185265024"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 09:34:33 -0700
Date: Thu, 30 Oct 2025 17:34:15 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t v3 1/1] lib/igt_edid: Fix monitor name parsing and
 trim EDID string padding
Message-ID: <20251030163415.j46y7lucr3jl7x5d@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20251028160738.3624415-1-jason-jh.lin@mediatek.com>
 <20251028160738.3624415-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251028160738.3624415-2-jason-jh.lin@mediatek.com>
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

Hi Jason-JH,
On 2025-10-29 at 00:07:04 +0800, Jason-JH Lin wrote:
> Improve EDID monitor name parsing by supporting both
> EDID_DETAIL_MONITOR_NAME and EDID_DETAIL_MONITOR_STRING types.
> Additionally, remove trailing padding spaces from the monitor name
> extracted from the EDID string to ensure the returned name is accurate.
> Also, fix the assert to guarantee name_size > 1 for '\0' termination.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: Fei Shao <fshao@chromium.org>
> ---
>  lib/igt_edid.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/igt_edid.c b/lib/igt_edid.c
> index 627201c342df..c68ccf671eff 100644
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
> @@ -215,22 +216,33 @@ void edid_get_monitor_name(const struct edid *edid, char *name, size_t name_size
>  	const struct detailed_timing *dt;
>  	const struct detailed_non_pixel *np;
>  	const struct detailed_data_string *ds;
> -	size_t i;
> +	size_t i, n;
>  
> -	assert(name_size > 0);
> +	/* need one char for '\0' */
> +	assert(name_size > 1);
>  	name[0] = '\0';
>  
>  	for (i = 0; i < DETAILED_TIMINGS_LEN; i++) {
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
>  		name[name_size - 1] = '\0';
> -		igt_debug("Monitor name: %s\n", name);
> +
> +		/* remove the padding space from EDID */
> +		for (n = name_size - 1; n > 0; ) {
> +			if (!isspace(name[--n]))
> +				break;
> +
> +			name[n] = '\0';
> +		}
> +
> +		igt_debug("Monitor name: %s\n", name[0] ? name : "(empty)");

Looks ok, maybe something for improvement would be to
continue loop for name search, but this could be done
later if needed.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  		return;
>  	}
>  	igt_debug("No monitor name found in EDID\n");
> -- 
> 2.43.0
> 
