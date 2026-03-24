Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94826E9A758
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 10:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279C410E64A;
	Tue, 24 Mar 2026 10:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBLXhY6W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5542B10E12B
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 10:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774347323; x=1805883323;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PN0kcMaMauhX5akoBWW4mlzEusV00up1DkIqTxpGlIc=;
 b=GBLXhY6Wfa0hCS49sXguQYHdoxJXCT2AOEBYXEdyXBpoiHW+1O1rHflO
 CVK9mFByq5OUhg+7PV9yOCFRaHkqlAJeQpFWAKMa2cr1/5TuL0yY5Mqi8
 HHgUqR4wjJgxusm+tnnB08jZmwPKlYPYAJe1yWulVeA/6K+2n4/bW92dG
 +2PkHOAA5YeBvefcSWJVkZ7q61lL7M1JJyJeoocmLr40evAaWZf0puh8M
 VVuozs3NZ/8pIKbcmGSeZs0Mf98j7EAIcNeQLW7DFCLpPD1qG5sjezI7H
 yyf7mp34lMxd7Ar2Jks8X1jaCRDMR6TcEAT6d+u8XemPtP6GdTpl156eT A==;
X-CSE-ConnectionGUID: 7vCf8ndkTLCmFrU8yiB3Vw==
X-CSE-MsgGUID: 5YAT4mxhRYe36oNEF39YMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74542373"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="74542373"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 03:15:22 -0700
X-CSE-ConnectionGUID: I/PUW9uiT3S6QMw0Iv2xqg==
X-CSE-MsgGUID: IhL2x+qhQeSzZ+RRUKdBaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="219874955"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 03:15:20 -0700
Date: Tue, 24 Mar 2026 11:15:17 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, kory.maincent@bootlin.com,
 markyacoub@google.com, khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v9 15/49] lib/monitor_edids: Add helper functions
 for using monitor_edid objects
Message-ID: <20260324101517.jmxyfubljamsoyrs@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, kory.maincent@bootlin.com,
 markyacoub@google.com, khaled.almahallawy@intel.com
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-15-a01dffc3b0cb@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316-unigraf-integration-v9-15-a01dffc3b0cb@bootlin.com>
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
On 2026-03-16 at 17:17:36 +0100, Louis Chauvet wrote:
> Introduce the functions edid_from_monitor_edid() and
> get_edids_for_connector_type(). The former converts a monitor_edid object
> to a struct edid, which can then be utilized by igt_kms helpers. The
> latter returns a list of monitor_edid objects for a specific connector
> with certain characteristics
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  lib/monitor_edids/dp_edids.h             |  3 ++
>  lib/monitor_edids/hdmi_edids.h           |  3 ++
>  lib/monitor_edids/monitor_edids_helper.c | 80 ++++++++++++++++++++++++++++++++
>  lib/monitor_edids/monitor_edids_helper.h |  7 ++-
>  4 files changed, 92 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/monitor_edids/dp_edids.h b/lib/monitor_edids/dp_edids.h
> index 144907558be1..07793381257e 100644
> --- a/lib/monitor_edids/dp_edids.h
> +++ b/lib/monitor_edids/dp_edids.h
> @@ -194,4 +194,7 @@ monitor_edid DP_EDIDS_NON_4K[] = {
>  
>   };
>  
> +#define DP_EDIDS_4K_COUNT ARRAY_SIZE(DP_EDIDS_4K)
> +#define DP_EDIDS_NON_4K_COUNT ARRAY_SIZE(DP_EDIDS_NON_4K)
> +
>  #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_DP_EDIDS_H_ */
> diff --git a/lib/monitor_edids/hdmi_edids.h b/lib/monitor_edids/hdmi_edids.h
> index f6cfe82ff6e1..3984241775c3 100644
> --- a/lib/monitor_edids/hdmi_edids.h
> +++ b/lib/monitor_edids/hdmi_edids.h
> @@ -604,4 +604,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
>  		  "1620582c2500baac4200009e0000006b" },
>  };
>  
> +#define HDMI_EDIDS_4K_COUNT ARRAY_SIZE(HDMI_EDIDS_4K)
> +#define HDMI_EDIDS_NON_4K_COUNT ARRAY_SIZE(HDMI_EDIDS_NON_4K)
> +
>  #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_HDMI_EDIDS_H_ */
> diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
> index 1cbf1c22f0bb..6043e7a084b3 100644
> --- a/lib/monitor_edids/monitor_edids_helper.c
> +++ b/lib/monitor_edids/monitor_edids_helper.c
> @@ -15,6 +15,10 @@
>  #include <assert.h>
>  
>  #include "igt_core.h"
> +#include "igt_edid.h"
> +#include "dp_edids.h"
> +#include "drmtest.h"

Why do you need drmtest.h header?

> +#include "hdmi_edids.h"
>  
>  static uint8_t convert_hex_char_to_byte(char c)
>  {
> @@ -90,3 +94,79 @@ void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid)
>  	free(edid);
>  	edid = NULL;
>  }
> +
> +/**
> + * edid_from_monitor_edid:
> + * @mon_edid: Monitor EDID to convert
> + *
> + * Get a struct edid from a monitor_edid. This returns a pointer to a newly allocated struct edid.
> + * The caller is in charge to free this pointer when required.
> + */
> +struct edid *edid_from_monitor_edid(const monitor_edid *mon_edid)
> +{
> +	uint8_t *raw_edid;
> +	size_t edid_size;
> +	int i;
> +
> +	edid_size = strlen(mon_edid->edid) / 2; /* each ascii is a nibble. */
> +	raw_edid = malloc(edid_size);
> +	igt_assert(raw_edid);
> +
> +	for (i = 0; i < edid_size; i++) {
> +		raw_edid[i] = convert_hex_char_to_byte(mon_edid->edid[i * 2]) << 4 |
> +			      convert_hex_char_to_byte(mon_edid->edid[i * 2 + 1]);
> +	}
> +
> +	if (edid_get_size((struct edid *)raw_edid) > edid_size) {
> +		uint8_t *new_edid;
> +
> +		igt_debug("The edid size stored in the raw edid is longer than the edid stored in the table.");
> +		new_edid = realloc(raw_edid, edid_get_size((struct edid *)raw_edid));
> +		igt_assert(new_edid);
> +		raw_edid = new_edid;
> +	}
> +
> +	return (struct edid *)raw_edid;
> +}
> +
> +/**
> + * get_edids_for_connector_type:
> + * @type: The connector type to get the EDIDs from
> + * @count: Used to store the number of EDIDs in the returned list
> + * @four_k: Use true to fetch 4k EDIDs, false to fetch non-4k EDIDs
> + *
> + * Get the list of EDIDS for a specific connector type. This returns a pointer to a static list,
> + * so no need to free the pointer.
> + */
> +struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k)
> +{
> +	if (four_k) {
> +		switch (type) {
> +		case DRM_MODE_CONNECTOR_DisplayPort:
> +			*count = DP_EDIDS_4K_COUNT;
> +			return DP_EDIDS_4K;
> +		case DRM_MODE_CONNECTOR_HDMIA:
> +			*count = HDMI_EDIDS_4K_COUNT;
> +			return HDMI_EDIDS_4K;
> +		default:
> +			*count = 0;
> +			igt_debug("No 4k EDID for the connector %s\n",
> +				  kmstest_connector_type_str(type));
> +			return NULL;
> +		}
> +	} else {
> +		switch (type) {
> +		case DRM_MODE_CONNECTOR_DisplayPort:
> +			*count = DP_EDIDS_NON_4K_COUNT;
> +			return DP_EDIDS_NON_4K;
> +		case DRM_MODE_CONNECTOR_HDMIA:
> +			*count = HDMI_EDIDS_NON_4K_COUNT;
> +			return HDMI_EDIDS_NON_4K;
> +		default:
> +			*count = 0;
> +			igt_debug("No EDID for the connector %s\n",
> +				  kmstest_connector_type_str(type));
> +			return NULL;
> +		}
> +	}
> +}
> diff --git a/lib/monitor_edids/monitor_edids_helper.h b/lib/monitor_edids/monitor_edids_helper.h
> index 05679f0897f3..e5069868683d 100644
> --- a/lib/monitor_edids/monitor_edids_helper.h
> +++ b/lib/monitor_edids/monitor_edids_helper.h
> @@ -12,6 +12,8 @@
>  #define TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_
>  
>  #include <stdint.h>
> +#include <stddef.h>
> +#include <stdbool.h>

Place them before stdint.h

Regards,
Kamil

>  
>  #include "igt_chamelium.h"
>  
> @@ -30,4 +32,7 @@ get_chameleon_edid_from_monitor_edid(struct chamelium *chamelium,
>  				     const monitor_edid *edid);
>  void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid);
>  
> -#endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */
> \ No newline at end of file
> +struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid);
> +struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k);
> +
> +#endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */
> 
> -- 
> 2.52.0
> 
