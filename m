Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B72CFF8873
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 07:23:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D4E10E303;
	Tue, 28 Apr 2026 07:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LnLMOZD2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB61F10E303
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 07:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777360985; x=1808896985;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=QpfX30ryDUD9lN2AmPC30aSbw3cRIDqs/Kz2LwGKjRg=;
 b=LnLMOZD2KW0MuQWYhhL/OARNLjV48ytAcDsbpcrNOehm//Nsat+IlCHK
 EP0uQS4jFGSVTsspsIwR3AKvgJikmZf/mtf5dDp28tP0bDcdLSAx7td85
 6bj+9eLkws+MAsRNpqPUGEiRe4VbEg8t6CfbxsGjQiEY3KC3wcJriLsWJ
 b5geKoo8DzmpfKBpKx/hTjlYXWv5QcJWJtTxr08VPkjT3UAf/sx4jADwY
 6AD7Y87JPKxmoloWU1Y5xp0f7wlEAdmXS4fs4la5UqJbFHxnhzZnaUoYd
 rnypSm7j1PN4GOusdOpsHD0Al5lGuNZNRxFT4PRB3r4CTWGI2fBNaFqGA Q==;
X-CSE-ConnectionGUID: Bgi+3uZaT3GbbLF6USDVIg==
X-CSE-MsgGUID: 7+LRC1i4QbOsqyJZNXcXKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78281617"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78281617"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 00:23:05 -0700
X-CSE-ConnectionGUID: k16IuSJ2RnCunOyayHc3nw==
X-CSE-MsgGUID: 76grh7k7TnWLdfrq1R1+Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="237828722"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.208])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 00:23:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>, igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>, Kory
 Maincent <kory.maincent@bootlin.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH i-g-t v1 07/25] lib/monitor_edids: Add helper to get an
 EDID by its name
In-Reply-To: <20260428044644.257001-8-mohammed.bilal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260428044644.257001-1-mohammed.bilal@intel.com>
 <20260428044644.257001-8-mohammed.bilal@intel.com>
Date: Tue, 28 Apr 2026 10:23:00 +0300
Message-ID: <ff00392f7c3994d5e1483193dddfa28d84837292@intel.com>
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

On Tue, 28 Apr 2026, Mohammed Bilal <mohammed.bilal@intel.com> wrote:
> From: Louis Chauvet <louis.chauvet@bootlin.com>
>
> For testing specific EDID, it is useful to be able to retrieve an EDID by
> a verbose name.
>
> Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/monitor_edids/monitor_edids_helper.c | 30 ++++++++++++++++++++++++
>  lib/monitor_edids/monitor_edids_helper.h |  1 +
>  2 files changed, 31 insertions(+)
>
> diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
> index 6043e7a08..01feb34a5 100644
> --- a/lib/monitor_edids/monitor_edids_helper.c
> +++ b/lib/monitor_edids/monitor_edids_helper.c
> @@ -20,6 +20,16 @@
>  #include "drmtest.h"
>  #include "hdmi_edids.h"
>  
> +struct {
> +	struct monitor_edid *edid_list;
> +	int list_size;
> +} ALL_EDIDS[] = {
> +	{DP_EDIDS_NON_4K,	DP_EDIDS_NON_4K_COUNT},
> +	{DP_EDIDS_4K,		DP_EDIDS_4K_COUNT},
> +	{HDMI_EDIDS_NON_4K,	HDMI_EDIDS_NON_4K_COUNT},
> +	{HDMI_EDIDS_4K,		HDMI_EDIDS_4K_COUNT},
> +};

static const?

> +
>  static uint8_t convert_hex_char_to_byte(char c)
>  {
>  	if (c >= '0' && c <= '9')
> @@ -170,3 +180,23 @@ struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count,
>  		}
>  	}
>  }
> +
> +/**
> + * get_edid_by_name:
> + * @name: Name to search in available EDIDs
> + *
> + * Return the struct edid associated with a specific name. As with edid_from_monitor_edid, the
> + * caller must ensure to free the EDID after use. If no EDID with the exact name is found, returns
> + * NULL.
> + */
> +struct edid *get_edid_by_name(const char *name)

const?

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
> index e50698686..6d9e3fc89 100644
> --- a/lib/monitor_edids/monitor_edids_helper.h
> +++ b/lib/monitor_edids/monitor_edids_helper.h
> @@ -34,5 +34,6 @@ void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid);
>  
>  struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid);
>  struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k);
> +struct edid *get_edid_by_name(const char *name);
>  
>  #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */

-- 
Jani Nikula, Intel
