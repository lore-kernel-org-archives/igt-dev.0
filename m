Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D6DD767FA
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 18:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3309610E910;
	Thu, 31 Oct 2024 18:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uwit01wO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F321810E90E
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 18:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730401095; x=1761937095;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UxA/fyO7TJecSy56WiedgkiKP67m9zNcMq6PsNc77Bs=;
 b=Uwit01wOILFgq6aOopapFstTj7b33Qkvw0YcW7pj8l9/drQP24UjQlV9
 72mi/vre1+QRP+dIPde5A5wjH1m7mQgUudy6/jqKeFe4HyTGPkXS0vxko
 yiyuEomqI7P9DGiNAaJv+jqvpUYRt3RGx9ZXKPFNNi66GhQPW+XPkO7se
 o5XBuUA1sFzofMmoI/2s5FG6+/ZcI25L839c5kU3p2Ki23n02+SmmgpJV
 6KQghNg0hwpHpBY5PSiem0+JwdkAD37u4PEHVN6QtLjOYx0WzS1n7SVOl
 qoheTT0jwPE0b2D6CYw2IOxNyPeBQt+VW61rBaOZkYN7bynVpGc/7SQBe Q==;
X-CSE-ConnectionGUID: tJtybyIwTGKJXgLojffpCQ==
X-CSE-MsgGUID: cBZZyI3tS+mLOjWifQihoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30266541"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="30266541"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:58:15 -0700
X-CSE-ConnectionGUID: 09knmiCARvSGR4/7lTrMFg==
X-CSE-MsgGUID: K3tfNaa1TDWz0EQdpuYClQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="87853568"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 11:58:12 -0700
Date: Thu, 31 Oct 2024 19:58:09 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com
Subject: Re: [PATCH i-g-t v2 2/5] lib/monitor_edids: Add helper to get an
 EDID by its name
Message-ID: <20241031185809.r7g5bzgo2ijg7rlh@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com
References: <20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com>
 <20241022-b4-cv3-02-monitor-edids-v2-2-7634786c21e6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022-b4-cv3-02-monitor-edids-v2-2-7634786c21e6@bootlin.com>
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
On 2024-10-22 at 14:53:11 +0200, Louis Chauvet wrote:

same here, in Cc you have:

	20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com

> For testing specific EDID, it is useful to be able to retrieve an EDID by
> a verbose name.
> 

Add Mark here in Cc.

Cc: Mark Yacoub <markyacoub@chromium.org>

> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/monitor_edids/dp_edids.h             |  3 +++
>  lib/monitor_edids/hdmi_edids.h           |  3 +++
>  lib/monitor_edids/monitor_edids_helper.c | 21 +++++++++++++++++++++
>  lib/monitor_edids/monitor_edids_helper.h |  1 +
>  4 files changed, 28 insertions(+)
> 
> diff --git a/lib/monitor_edids/dp_edids.h b/lib/monitor_edids/dp_edids.h
> index 144907558be1..d11a81d167fc 100644
> --- a/lib/monitor_edids/dp_edids.h
> +++ b/lib/monitor_edids/dp_edids.h
> @@ -194,4 +194,7 @@ monitor_edid DP_EDIDS_NON_4K[] = {
>  
>   };
>  
> +const int DP_EDID_NON_4K_COUNT = ARRAY_SIZE(DP_EDIDS_NON_4K);
> +const int DP_EDID_4K_COUNT = ARRAY_SIZE(DP_EDIDS_4K);
> +
>  #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_DP_EDIDS_H_ */
> diff --git a/lib/monitor_edids/hdmi_edids.h b/lib/monitor_edids/hdmi_edids.h
> index 9d75cfa989b6..573e2149d5d3 100644
> --- a/lib/monitor_edids/hdmi_edids.h
> +++ b/lib/monitor_edids/hdmi_edids.h
> @@ -604,4 +604,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
>  		  "1620582c2500baac4200009e0000006b" },
>  };
>  
> +const int HDMI_EDID_4K_COUNT = ARRAY_SIZE(HDMI_EDIDS_4K);
> +const int HDMI_EDID_NON_4K_COUNT = ARRAY_SIZE(HDMI_EDIDS_NON_4K);
> +

imho better make it a #define

>  #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_HDMI_EDIDS_H_ */
> diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
> index 0e0c2a9badcf..0f92ced64d06 100644
> --- a/lib/monitor_edids/monitor_edids_helper.c
> +++ b/lib/monitor_edids/monitor_edids_helper.c
> @@ -19,6 +19,16 @@
>  #include "dp_edids.h"
>  #include "hdmi_edids.h"
>  
> +struct {
> +	struct monitor_edid *edid_list;
> +	int list_size;
> +} ALL_EDIDS[] = {
> +	{DP_EDIDS_NON_4K,	DP_EDID_NON_4K_COUNT},
> +	{DP_EDIDS_4K,		DP_EDID_4K_COUNT},
> +	{HDMI_EDIDS_NON_4K,	HDMI_EDID_NON_4K_COUNT},
> +	{HDMI_EDIDS_4K,		HDMI_EDID_4K_COUNT},
> +};
> +
>  static uint8_t convert_hex_char_to_byte(char c)
>  {
>  	if (c >= '0' && c <= '9')
> @@ -149,3 +159,14 @@ struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count,
>  		}
>  	}
>  }
> +

Add description.

> +struct edid *get_edid_by_name(char *name)
> +{
> +	for (int i = 0; i < ARRAY_SIZE(ALL_EDIDS); i++) {
> +		for (int j = 0; j < ALL_EDIDS[i].list_size; j++) {
> +			if (strcmp(ALL_EDIDS[i].edid_list[j].name, name) == 0)
> +				return edid_from_monitor_edid(&ALL_EDIDS[i].edid_list[j]);
> +		}
> +	}

Add newline.

> +	return NULL;
> +}
> diff --git a/lib/monitor_edids/monitor_edids_helper.h b/lib/monitor_edids/monitor_edids_helper.h
> index 2ec7aee5f13f..cd0e5a7b2645 100644
> --- a/lib/monitor_edids/monitor_edids_helper.h
> +++ b/lib/monitor_edids/monitor_edids_helper.h
> @@ -34,5 +34,6 @@ void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid);
>  
>  struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid);
>  struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k);
> +struct edid *get_edid_by_name(char *name);
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
