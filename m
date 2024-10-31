Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349C1D767FA
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 19:04:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E782610E910;
	Thu, 31 Oct 2024 19:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XxFTAAG3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5401110E910
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 19:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730401461; x=1761937461;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=idQ01Qd4xDSTOgTSSZY3d1TpWS2AcCbY0yHde/B2Xuo=;
 b=XxFTAAG31F0XgCxeBcWREXN2/nK9C8lENcIZOlxb1iyPHqLCuHpatpIy
 nIER79/M06vENyrdPPlPoeoSt2uM7F+A+CKMR6u+OI0EsVVBPPkp1pbX+
 RUh6eLu79LdjcEr0OChYiqtU8Ei2yjNke2hL+C9haIsfqc+lXdwFidXFa
 smc/IPy2OLMbP3xzPygDDVgLzlxe7fDf4g96dC/JhtT2IRCOB18/1szMO
 dRLjctl+XCmpJmIP38lD78O7MLbmZfehLkVGy/JDRlbnVDgMKju9aLo3Z
 rp8bjRbxs68AiYW6DHRrXcmx0uOhTEqZMJYpFZw815kQgqb4oVWIpZJC5 Q==;
X-CSE-ConnectionGUID: /O0P2wSWQK6hMdIga8cNww==
X-CSE-MsgGUID: XLOcRWLPTzS2qSRZfV9T4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33850890"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="33850890"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 12:04:21 -0700
X-CSE-ConnectionGUID: hjxOyEUOQ9S2OjdFpJ3RKg==
X-CSE-MsgGUID: 96sIOUL3R2a4BTxgKRaTUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="82633833"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 12:04:18 -0700
Date: Thu, 31 Oct 2024 20:04:15 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com
Subject: Re: [PATCH i-g-t v2 3/5] lib/monitor_edids: Add helper to print all
 available EDID names
Message-ID: <20241031190415.53o5xi5hgluyorjw@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com
References: <20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com>
 <20241022-b4-cv3-02-monitor-edids-v2-3-7634786c21e6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022-b4-cv3-02-monitor-edids-v2-3-7634786c21e6@bootlin.com>
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

Hi Louis,
On 2024-10-22 at 14:53:12 +0200, Louis Chauvet wrote:
> During the chamelium v3 configuration, it may be required to know the list
> of supported EDID names, so add an helper to print them.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/monitor_edids/monitor_edids_helper.c | 10 ++++++++++
>  lib/monitor_edids/monitor_edids_helper.h |  2 ++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
> index 0f92ced64d06..ca2f5006eada 100644
> --- a/lib/monitor_edids/monitor_edids_helper.c
> +++ b/lib/monitor_edids/monitor_edids_helper.c
> @@ -170,3 +170,13 @@ struct edid *get_edid_by_name(char *name)
>  	}
>  	return NULL;
>  }
> +

Add description.

> +void list_edid_names(enum igt_log_level level)
> +{
> +	for (int i = 0; i < ARRAY_SIZE(ALL_EDIDS); i++) {
> +		for (int j = 0; j < ALL_EDIDS[i].list_size; j++) {
> +			igt_log(IGT_LOG_DOMAIN, level, " - \"%s\"\n",
> +				ALL_EDIDS[i].edid_list[j].name);
> +		}
> +	}
> +}
> diff --git a/lib/monitor_edids/monitor_edids_helper.h b/lib/monitor_edids/monitor_edids_helper.h
> index cd0e5a7b2645..50b08530826a 100644
> --- a/lib/monitor_edids/monitor_edids_helper.h
> +++ b/lib/monitor_edids/monitor_edids_helper.h
> @@ -15,6 +15,7 @@
>  #include <stddef.h>
>  #include <stdbool.h>
>  
> +#include "igt_core.h"

And now it returns... Why not make this a first patch?

>  #include "igt_chamelium.h"
>  
>  /* Max Length can be increased as needed, when new EDIDs are added. */
> @@ -35,5 +36,6 @@ void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid);
>  struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid);
>  struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k);
>  struct edid *get_edid_by_name(char *name);
> +void list_edid_names(enum igt_log_level level);
>  
>  #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */
> \ No newline at end of file

Add newline.

Regards,
Kamil
> 
> -- 
> 2.46.2
> 
