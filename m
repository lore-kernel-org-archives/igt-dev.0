Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48787E77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 17:56:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0595E10F021;
	Fri, 20 Dec 2024 17:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lOg+DGCm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B01410F01F
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 17:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734717390; x=1766253390;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AnQn9MOBs9uTTgZe6Gu7HYZ+QYrUFNmfFnMZcMEXXY8=;
 b=lOg+DGCmidMqkfbPwoTwdjvoagje2ZDg0msyVJCSSiE4xecdWyVcmXTX
 YhNaTV5ceHoJ8M36Huz95LTbjzuZHQ7CFYWedIRYcBzj/AjDs35SznNGt
 V7J8PQE9B+V08MF9in73iTzn2ZGwg92YyejSQ5zkXI2TE5io3xsypoUyR
 hRQkF4zz2R8qScWnjb0XwwA6Wun2z84qpNt8SxxS4HYNMWydFxvjhmj2Q
 qBlCHqTBeC9st8N/PQv+Xj6qoAd3lbYVk7ZkQEvFv5VVrKUetcvu9Q32h
 lPG8dMF+udkdKy0Z8laPo0O2jiQs3xVHdAFExtC/NHq7CaqC+38SLycf+ A==;
X-CSE-ConnectionGUID: 3A2Ui3MzSZuUT+wsoUo9Pg==
X-CSE-MsgGUID: LhL5sps1TP6IAr9eNapR5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="22864194"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="22864194"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 09:56:30 -0800
X-CSE-ConnectionGUID: kbB13gXfRcysgWGNgnshyQ==
X-CSE-MsgGUID: XMVwwZe8Rj6hI7IpUvbp8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135925446"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 09:56:28 -0800
Date: Fri, 20 Dec 2024 18:56:24 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com
Subject: Re: [PATCH i-g-t v3 1/5] lib/monitor_edids: Add helper functions for
 using monitor_edid objects
Message-ID: <20241220175624.37p2auricwcstiqk@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com
References: <20241122-b4-cv3-02-monitor-edids-v3-0-1798f58167ef@bootlin.com>
 <20241122-b4-cv3-02-monitor-edids-v3-1-1798f58167ef@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122-b4-cv3-02-monitor-edids-v3-1-1798f58167ef@bootlin.com>
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
On 2024-11-22 at 16:51:34 +0100, Louis Chauvet wrote:
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

Why do you need this include here? Imho proper place
is in .c helper

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

Same here.

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

Start with '/**', also function names in description ends with ':'
without any '()' - please look into lib/drmtest.c for example

/**
 * edid_from_monitor_edid:
 * @mon_edid: Monitor EDID to convert
 *
 * Get a pointer to struct edid from a monitor_edid
 *
 * The caller must free the returned pointer
 */

Sorry I missed that in my few previous mails, please
reformat your descriptions like above.

> + * edid_from_monitor_edid() - Get a struct edid from a monitor_edid
> + * @mon_edid: Monitor EDId to convert
> + *
> + * The caller must free the returned pointer

Describe what you return.

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

Isn't it opposite here? raw edid size is bigger then edid_size,
not shorter? Why not:

	if (edid_get_size((struct edid *)raw_edid) != edid_size) {

> +		new_edid = realloc(raw_edid, edid_get_size((struct edid *)raw_edid));

Isn't it a bug here or in that 'for' loop above?
Could you first decode data up to point where you could
call edid_get_size() and then decide if you have correct data
in mon_edid?

> +		igt_assert(new_edid);
> +		raw_edid = new_edid;
> +	}
> +
> +	return (struct edid *)raw_edid;
> +}
> +
> +/*

Same here.

> + * get_edids_for_connector_type() - Get the list of EDIDS for a

Same here.

Regards,
Kamil

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
> 
> -- 
> 2.47.0
> 
