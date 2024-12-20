Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23D2E7718B
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 17:31:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819F710E3AF;
	Fri, 20 Dec 2024 17:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GdqsHHBl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E65C10E3AF
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 17:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734715871; x=1766251871;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=s+MRztdGokLK7aepQGZCOgIkP//0NJehUCcP5lu3cMc=;
 b=GdqsHHBlRQNl43VObJ1xtkZRs1PNZ2oMg22KYd+nDxhAG9/blx3cZXjB
 fW9PQ6URtJJo46VijyBdSXKjtEJQvpG/LruyQulX0A+Y+eQR2+nULUaic
 3x/1ECDuXCiD44B71SJGEJ+Ad4q3EoVQNU6opiUM2rYN2+6MBQh6mTVy9
 OLCNwN8Y/eN4u0u6stlzyRhM7FXBzhpe5al0nFtDTVgEFCDfntY21BSws
 ZV1cO3God4SSxd5HcILaIthS74KuhVw1VVnRPbLUlFqahO2Zn/KSMDL0M
 mIXCEXo2NUmGYYGAQTrRs7+QLxhXDGcDZBadmQjyMMUMDhNgoiM07M3wV Q==;
X-CSE-ConnectionGUID: VTCb9dqYTW+ylN/VqpLhAA==
X-CSE-MsgGUID: lep9zE3WTPu60SnSEcXjtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45961658"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="45961658"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 09:31:11 -0800
X-CSE-ConnectionGUID: mjzwDymOTHGoIHK5/DdiIQ==
X-CSE-MsgGUID: gTnQfvusTLm1DlVPtJAGcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135919995"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 09:31:08 -0800
Date: Fri, 20 Dec 2024 18:31:05 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com
Subject: Re: [PATCH i-g-t v3 3/5] lib/monitor_edids: Add helper to print all
 available EDID names
Message-ID: <20241220173105.caot5qotjtxusklz@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com
References: <20241122-b4-cv3-02-monitor-edids-v3-0-1798f58167ef@bootlin.com>
 <20241122-b4-cv3-02-monitor-edids-v3-3-1798f58167ef@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122-b4-cv3-02-monitor-edids-v3-3-1798f58167ef@bootlin.com>
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
On 2024-11-22 at 16:51:36 +0100, Louis Chauvet wrote:
> During the chamelium v3 configuration, it may be required to know the list
> of supported EDID names, so add an helper to print them.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/monitor_edids/monitor_edids_helper.c | 15 +++++++++++++++
>  lib/monitor_edids/monitor_edids_helper.h |  2 ++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
> index 4d739937ede1e8f09eb6e8bf225f047d5c3dfd04..9de8aa06a45c164e928ae3821f841414b437eaac 100644
> --- a/lib/monitor_edids/monitor_edids_helper.c
> +++ b/lib/monitor_edids/monitor_edids_helper.c
> @@ -195,3 +195,18 @@ struct edid *get_edid_by_name(char *name)
>  
>  	return NULL;
>  }
> +
> +
> +/*

Start with '/**'

With this
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> + * list_edid_names() - Print all the EDID available in igt
> + * @level: Log level to write the names on
> + */
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
> index a45dca870eb20f66c9472be6643019d23bc18b9a..04a639f47b49ab176e914f6044bba6769dc84ccb 100644
> --- a/lib/monitor_edids/monitor_edids_helper.h
> +++ b/lib/monitor_edids/monitor_edids_helper.h
> @@ -15,6 +15,7 @@
>  #include <stddef.h>
>  #include <stdbool.h>
>  
> +#include "igt_core.h"
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
> 
> -- 
> 2.47.0
> 
