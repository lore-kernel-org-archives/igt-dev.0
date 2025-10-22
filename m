Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6DBCCD195
	for <igt-dev@archiver.kernel.org>; Wed, 22 Oct 2025 10:08:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07F810E731;
	Wed, 22 Oct 2025 10:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gzrR6z/2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CF610E731
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Oct 2025 10:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761127703; x=1792663703;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=N4P0Gx5abKLwW340YzEdj2N2rwjxlIGTnofoNgXwASA=;
 b=gzrR6z/2XzJhAwm1CDePJ3jkwyzBASLL5MogR7qMt8brE3g/I92m37so
 5AC4QmyHN64wrlc7Q3yFIcCvHy/2K1dnDr5qDOBtnmEdrqwkC4M7yY5qL
 RQRLyCITtVqtBOFM2eN+s1lTTEHpNCH8c9LOKxrvZXZMciHbxQMUMVLlN
 9g2EZU4ja5enOIvsa33keICmVP9IdT2w35vh59iyywLXhdWsDiYlVeFX8
 C4vKn8WmunFUdfMUgFlndcrt8Ic6OML6Ic0beMxfoeS+wVr05jEmF05+z
 VPM9hBHthDB5btffi7uA714xjDWrMfmmzrk790pznDy/DB46pLRgfFFeu A==;
X-CSE-ConnectionGUID: k1IdSZ8sQRSmy2epde68Bg==
X-CSE-MsgGUID: yxJfKPveQIS9Qs73J0ujrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63418664"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="63418664"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 03:08:23 -0700
X-CSE-ConnectionGUID: 1pJ+uLe2TbKoYbYFFryWIg==
X-CSE-MsgGUID: mtDYyINiRhGAvIrEXCCCgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="188239947"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 03:08:19 -0700
Date: Wed, 22 Oct 2025 12:08:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Fei Shao <fshao@chromium.org>, Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t v2 5/5] lib/igt_edid: Fix monitor name parsing and
 trim EDID string padding
Message-ID: <20251022100800.lpa2fibl3u662egy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Fei Shao <fshao@chromium.org>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20251021173912.4050926-1-jason-jh.lin@mediatek.com>
 <20251021173912.4050926-6-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251021173912.4050926-6-jason-jh.lin@mediatek.com>
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
On 2025-10-22 at 01:37:53 +0800, Jason-JH Lin wrote:
> Fix the EDID parsing logic by supporting EDID_DETAIL_MONITOR_STRING in
> addition to EDID_DETAIL_MONITOR_NAME. Also, trim the trailing padding
> spaces from the monitor vendor name when parsing the EDID string to
> ensure the monitor name is correctly returned.
> 

+cc Jani

> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  lib/igt_edid.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_edid.c b/lib/igt_edid.c
> index 627201c342df..d98106c3c22d 100644
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

imho better:
	ssize_t n;

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
>  		name[name_size - 1] = '\0';
> +
> +		/* remove the padding space from EDID */
> +		for (n = name_size - 2; n > 0 && isspace(name[n]); n--)

With ssize_t it could be:

		for (n = name_size - 2; n >= 0 && isspace(name[n]); n--)

so following line:

> +			name[n] = '\0';

will actually trim it into empty string.

> +
>  		igt_debug("Monitor name: %s\n", name);

What about informing about empty name here? For example:

  		igt_debug("Monitor name: %s\n", n > 0 ? name : "(empty)");

Regards,
Kamil

>  		return;
>  	}
> -- 
> 2.43.0
> 
