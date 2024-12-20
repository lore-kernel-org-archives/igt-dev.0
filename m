Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9381AE77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 17:29:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42EBE10E2CC;
	Fri, 20 Dec 2024 17:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Svb+w1i1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F43210E2CC
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 17:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734715748; x=1766251748;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nNHNzXPaMWSHUo/g+l7wYBcZRmm7W2ireTgKujVeaLU=;
 b=Svb+w1i1Ffs6iLWMW1gqEpwqoOeYf3w6nuc6pwh9o7tFCgtcl+dwLsUx
 UP12xd786vNDoc1FNiRqin8U82PpzE/q/2mtiIX81iji8KNbPTRCet2jL
 OWaXROG9rmGJuRz6aLvhIIv1/aPxcdxY3jkjyIiBMvH+kNdu3yzxbsIq/
 FXylrUozuubtwa+eohhBqIlj79XkbJJDDJxVm0w8rSVLkSwyBLS6IE1VK
 i2IgR3NdbRf3jHazqYbyThjZspH1yOodmvVzTWsMYCsI1xIUuZb/RXTw5
 LFJ3PYQzdnAsqg2HF50c47lKLv2ts348skefhqCTkEUM6aCCkxwklbZNp w==;
X-CSE-ConnectionGUID: 1e3WF8eGT5uIZsta3nVtXA==
X-CSE-MsgGUID: 89WTmdLPQWamZAH0UI3/cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="52795209"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="52795209"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 09:29:08 -0800
X-CSE-ConnectionGUID: EUNNExjIQFumEY1xstRz6w==
X-CSE-MsgGUID: f2Hvn4/1RQWbBuKsGe9oXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103177666"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 09:29:05 -0800
Date: Fri, 20 Dec 2024 18:29:02 +0100
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
Subject: Re: [PATCH i-g-t v3 2/5] lib/monitor_edids: Add helper to get an
 EDID by its name
Message-ID: <20241220172902.jrf7zbdtm3wnraum@kamilkon-desk.igk.intel.com>
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
 <20241122-b4-cv3-02-monitor-edids-v3-2-1798f58167ef@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122-b4-cv3-02-monitor-edids-v3-2-1798f58167ef@bootlin.com>
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
On 2024-11-22 at 16:51:35 +0100, Louis Chauvet wrote:
> For testing specific EDID, it is useful to be able to retrieve an EDID by
> a verbose name.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/monitor_edids/monitor_edids_helper.c | 28 ++++++++++++++++++++++++++++
>  lib/monitor_edids/monitor_edids_helper.h |  1 +
>  2 files changed, 29 insertions(+)
> 
> diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
> index a7a945659f751be99ecd9d55f9b7307df256d543..4d739937ede1e8f09eb6e8bf225f047d5c3dfd04 100644
> --- a/lib/monitor_edids/monitor_edids_helper.c
> +++ b/lib/monitor_edids/monitor_edids_helper.c
> @@ -19,6 +19,16 @@
>  #include "dp_edids.h"
>  #include "hdmi_edids.h"
>  
> +struct {

Consider adding here list name.

> +	struct monitor_edid *edid_list;
> +	int list_size;
> +} ALL_EDIDS[] = {
> +	{DP_EDIDS_NON_4K,	DP_EDIDS_NON_4K_COUNT},
> +	{DP_EDIDS_4K,		DP_EDIDS_4K_COUNT},
> +	{HDMI_EDIDS_NON_4K,	HDMI_EDIDS_NON_4K_COUNT},
> +	{HDMI_EDIDS_4K,		HDMI_EDIDS_4K_COUNT},
> +};
> +
>  static uint8_t convert_hex_char_to_byte(char c)
>  {
>  	if (c >= '0' && c <= '9')
> @@ -167,3 +177,21 @@ struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count,
>  		}
>  	}
>  }
> +
> +/*

Start with '/**', for example look into lib/drmtest.c

> + * get_edid_by_name() - Return the struct associated with a specific
> + *                      name
> + * @name: Name to search in available EDIDs

Add empty line ' *' here.

With above
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> + * Returns NULL if no edid are found
> + */
> +struct edid *get_edid_by_name(char *name)
> +{
> +	for (int i = 0; i < ARRAY_SIZE(ALL_EDIDS); i++) {
> +		for (int j = 0; j < ALL_EDIDS[i].list_size; j++) {
> +			if (strcmp(ALL_EDIDS[i].edid_list[j].name, name) == 0)
> +				return edid_from_monitor_edid(&ALL_EDIDS[i].edid_list[j]);
> +		}
> +	}
> +
> +	return NULL;
> +}
> diff --git a/lib/monitor_edids/monitor_edids_helper.h b/lib/monitor_edids/monitor_edids_helper.h
> index e5069868683d97053d8e66666e83692f1b733db3..a45dca870eb20f66c9472be6643019d23bc18b9a 100644
> --- a/lib/monitor_edids/monitor_edids_helper.h
> +++ b/lib/monitor_edids/monitor_edids_helper.h
> @@ -34,5 +34,6 @@ void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid);
>  
>  struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid);
>  struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k);
> +struct edid *get_edid_by_name(char *name);
>  
>  #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */
> 
> -- 
> 2.47.0
> 
