Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DFED3B7F5
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 09:20:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718EE10E087;
	Mon, 25 Nov 2024 09:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jcb/GZ7o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FB310E087
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 09:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732526443; x=1764062443;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Vrkj2DiiACZvceVb7zG4HRN/Y4lKP+TzmqlJVZlnRpM=;
 b=Jcb/GZ7oGlN5Y6leO156BbdvT/f3IiExLZD5hr61QW/o4IRe643Klxw6
 XDPNUVlrTc3D+SFWTQkPc0Wy018Q8sG9UvQtgVYlefQ0htmXChdbouD4n
 7WpIJc7PI/va1fl5+v8O0gFxe5iklau8OK3orXhSpSnc+SrZQXY5mnkyx
 LVQwyOjSu+vcN/JwGNAUhTl5Gvqg04de4epwQ7SZ/C0H65ON2jZI/7kDX
 n7nZHjjoctmo+cC4lE2F9NKcTgf4Z6OL6nt7B9hmsgmdP0gqb2Nbf9TS6
 6XhDR2WwyWIsvsGca2cyVsWyJjWKKMUAEfRWX9EYYP/iaIZ4OEkWLBSW6 Q==;
X-CSE-ConnectionGUID: kJop89eQS1yJEF2K6PH0nA==
X-CSE-MsgGUID: ragmf//gSEKsTjtYzWUPYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="32480008"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="32480008"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 01:20:43 -0800
X-CSE-ConnectionGUID: ywaOEicXQNG83Zruuh7tDQ==
X-CSE-MsgGUID: fFxKRiK3Q6SfDC30mzH74Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="96264304"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.243])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 01:20:39 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com,
 seanpaul@google.com, jeremie.dautheribes@bootlin.com,
 markyacoub@google.com, Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t v3 1/5] lib/monitor_edids: Add helper functions
 for using monitor_edid objects
In-Reply-To: <20241122-b4-cv3-02-monitor-edids-v3-1-1798f58167ef@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241122-b4-cv3-02-monitor-edids-v3-0-1798f58167ef@bootlin.com>
 <20241122-b4-cv3-02-monitor-edids-v3-1-1798f58167ef@bootlin.com>
Date: Mon, 25 Nov 2024 11:20:35 +0200
Message-ID: <87wmgry8ik.fsf@intel.com>
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

On Fri, 22 Nov 2024, Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> Introduce the functions edid_from_monitor_edid() and
> get_edids_for_connector_type(). The former converts a monitor_edid object
> to a struct edid, which can then be utilized by igt_kms helpers. The
> latter returns a list of monitor_edid objects for a specific connector
> with certain characteristics
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/monitor_edids/dp_edids.h             |  4 ++
>  lib/monitor_edids/hdmi_edids.h           |  4 ++
>  lib/monitor_edids/monitor_edids_helper.c | 77 ++++++++++++++++++++++++++++++++
>  lib/monitor_edids/monitor_edids_helper.h |  7 ++-
>  4 files changed, 91 insertions(+), 1 deletion(-)
>
> diff --git a/lib/monitor_edids/dp_edids.h b/lib/monitor_edids/dp_edids.h
> index 144907558be1faa306b646ce3b47b24c13050968..8192520c89e61d3d38c508ca97a61040cea4ba90 100644
> --- a/lib/monitor_edids/dp_edids.h
> +++ b/lib/monitor_edids/dp_edids.h
> @@ -12,6 +12,7 @@
>  #ifndef TESTS_CHAMELIUM_MONITOR_EDIDS_DP_EDIDS_H_
>  #define TESTS_CHAMELIUM_MONITOR_EDIDS_DP_EDIDS_H_
>  
> +#include "drmtest.h"
>  #include "monitor_edids_helper.h"
>  
>  monitor_edid DP_EDIDS_4K[] = {
> @@ -194,4 +195,7 @@ monitor_edid DP_EDIDS_NON_4K[] = {
>  
>   };
>  
> +#define DP_EDIDS_4K_COUNT = ARRAY_SIZE(DP_EDIDS_4K);
> +#define DP_EDIDS_NON_4K_COUNT = ARRAY_SIZE(DP_EDIDS_NON_4K);
> +
>  #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_DP_EDIDS_H_ */
> diff --git a/lib/monitor_edids/hdmi_edids.h b/lib/monitor_edids/hdmi_edids.h
> index f6cfe82ff6e1c4419160bcdcc851a5e28eb08726..23ac04d94b6f672572e34b8059ff1b47d0730839 100644
> --- a/lib/monitor_edids/hdmi_edids.h
> +++ b/lib/monitor_edids/hdmi_edids.h
> @@ -12,6 +12,7 @@
>  #ifndef TESTS_CHAMELIUM_MONITOR_EDIDS_HDMI_EDIDS_H_
>  #define TESTS_CHAMELIUM_MONITOR_EDIDS_HDMI_EDIDS_H_
>  
> +#include "drmtest.h"
>  #include "monitor_edids_helper.h"
>  
>  monitor_edid HDMI_EDIDS_4K[] = {
> @@ -604,4 +605,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
>  		  "1620582c2500baac4200009e0000006b" },
>  };
>  
> +#define HDMI_EDIDS_4K_COUNT = ARRAY_SIZE(HDMI_EDIDS_4K);
> +#define HDMI_EDIDS_NON_4K_COUNT = ARRAY_SIZE(HDMI_EDIDS_NON_4K);
> +
>  #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_HDMI_EDIDS_H_ */
> diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
> index 1cbf1c22f0bbc5fb4047ce42bde2042ec8170efb..a7a945659f751be99ecd9d55f9b7307df256d543 100644
> --- a/lib/monitor_edids/monitor_edids_helper.c
> +++ b/lib/monitor_edids/monitor_edids_helper.c
> @@ -15,6 +15,9 @@
>  #include <assert.h>
>  
>  #include "igt_core.h"
> +#include "igt_edid.h"
> +#include "dp_edids.h"
> +#include "hdmi_edids.h"
>  
>  static uint8_t convert_hex_char_to_byte(char c)
>  {
> @@ -90,3 +93,77 @@ void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid)
>  	free(edid);
>  	edid = NULL;
>  }
> +
> +/*
> + * edid_from_monitor_edid() - Get a struct edid from a monitor_edid
> + * @mon_edid: Monitor EDId to convert
> + *
> + * The caller must free the returned pointer
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
> +		igt_debug("The edid size stored in the raw edid is shorter than the edid stored in the table.");
> +		new_edid = realloc(raw_edid, edid_get_size((struct edid *)raw_edid));
> +		igt_assert(new_edid);
> +		raw_edid = new_edid;
> +	}
> +
> +	return (struct edid *)raw_edid;
> +}

Only partially related to the patch at hand, IGT seems to be completely
unaware of the HF-EEODB extension which can indicate a bigger EDID size
than what edid_get_size() returns.

The above would reduce the allocation below the actual EDID size in such
cases. Luckily I don't think anyone in IGT interprets EDIDs according to
HF-EEODB, so there's no buffer overflow *yet*, but eventually that will
need to be covered, and basically every single EDID usage needs to be
amended.

BR,
Jani.



> +
> +/*
> + * get_edids_for_connector_type() - Get the list of EDIDS for a
> + * specific connector type.
> + *
> + * @type: The connector type to get the EDIDs from
> + * @count: Used to store the number of EDIDs in the returned list
> + * @four_k: Use true to fetch 4k EDIDs, false to fetch non-4k EDIDs
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
> index 05679f0897f3d0618d656cc071b565b48d31da28..e5069868683d97053d8e66666e83692f1b733db3 100644
> --- a/lib/monitor_edids/monitor_edids_helper.h
> +++ b/lib/monitor_edids/monitor_edids_helper.h
> @@ -12,6 +12,8 @@
>  #define TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_
>  
>  #include <stdint.h>
> +#include <stddef.h>
> +#include <stdbool.h>
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

-- 
Jani Nikula, Intel
