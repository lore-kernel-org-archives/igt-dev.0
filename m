Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C38D767F9
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 18:53:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0132610E90E;
	Thu, 31 Oct 2024 18:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PTTBmcyK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B5210E90E
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 18:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730400812; x=1761936812;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gtvul2FrpEc2rMyNJKyFoMG74/+oPH/C3Wz3fnuXurI=;
 b=PTTBmcyKzL9eLwSAh+FbwTVobHS4WBV14SgtT2ad44jz48/k8kVtZcIl
 dK0qrKbQcuHV01UeWYmvcpHrWBG5fG34K8hf9TzMTNUjqhAL88yHFQKMr
 dOKU2btAXfA6oTWsQWNqFo/wwsjzE0gt6CCdsJNtAEJ4+lSPZJ14JeKoj
 m88v5UXSmNyQHhohl030B+WE7tlec7Pph+HzoU4NxtDrhmD9bSBNKqvkO
 cm2+th8WmdbHC0Xyo2IRYC1NlXJ60OBoNej7aqsDgAyvArJcvsRDN71D0
 DSeL9ZY5wqJ308cujdBfRQZTeWGx/4Y7i2XY/b3qK5Og5isNXd9bd7ioG Q==;
X-CSE-ConnectionGUID: saOy7bjXTiODwL9x0CqCaQ==
X-CSE-MsgGUID: 2rU5ng2BTjKq5Wxzjxfkbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="29593044"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="29593044"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:53:32 -0700
X-CSE-ConnectionGUID: 01SQqo8lTWC0DTzvAQaqRw==
X-CSE-MsgGUID: gQ4X6CdCRLGzwKsLCKFBEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="86652079"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 11:53:29 -0700
Date: Thu, 31 Oct 2024 19:53:13 +0100
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
 jeremie.dautheribes@bootlin.com, markyacoub@google.com,
 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com
Subject: Re: [PATCH i-g-t v2 1/5] lib/monitor_edids: Add helper functions for
 using monitor_edid objects
Message-ID: <20241031185313.mh74kmwz5iwgq64j@kamilkon-desk.igk.intel.com>
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
 jeremie.dautheribes@bootlin.com, markyacoub@google.com,
 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com
References: <20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com>
 <20241022-b4-cv3-02-monitor-edids-v2-1-7634786c21e6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022-b4-cv3-02-monitor-edids-v2-1-7634786c21e6@bootlin.com>
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
On 2024-10-22 at 14:53:10 +0200, Louis Chauvet wrote:

in you e-mail header I found in cc:

	20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com

Is it correct?

> Introduce the functions edid_from_monitor_edid() and
> get_edids_for_connector_type(). The former converts a monitor_edid object
> to a struct edid, which can then be utilized by igt_kms helpers. The
> latter returns a list of monitor_edid objects for a specific connector
> with certain characteristics
> 

Add here to Cc developer e-mails, found with 'git blame', so +cc

Cc: Mark Yacoub <markyacoub@chromium.org>
Cc: Mark Yacoub <markyacoub@google.com>

> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/monitor_edids/monitor_edids_helper.c | 61 +++++++++++++++++++++++++++++++-
>  lib/monitor_edids/monitor_edids_helper.h |  5 +++
>  2 files changed, 65 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
> index 1cbf1c22f0bb..0e0c2a9badcf 100644
> --- a/lib/monitor_edids/monitor_edids_helper.c
> +++ b/lib/monitor_edids/monitor_edids_helper.c
> @@ -14,7 +14,10 @@
>  #include <string.h>
>  #include <assert.h>
>  
> -#include "igt_core.h"

Nice! igt_core here could be an overkill.

> +#include "igt.h"
> +#include "igt_edid.h"
> +#include "dp_edids.h"
> +#include "hdmi_edids.h"
>  
>  static uint8_t convert_hex_char_to_byte(char c)
>  {
> @@ -90,3 +93,59 @@ void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid)
>  	free(edid);
>  	edid = NULL;
>  }
> +

Add description to each new lib function.

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
> +		igt_warn("The edid size stored in the raw edid is shorter than the edid stored in the table.");

Warn could result in test failure, why not igt_debug()?

> +		new_edid = realloc(raw_edid, edid_get_size((struct edid *)raw_edid));
> +		igt_assert(new_edid);
> +		raw_edid = new_edid;
> +	}
> +
> +	return (struct edid *)raw_edid;
> +}
> +

Same here, add description.

> +struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k)
> +{
> +	if (four_k) {

Do you really need function with 'bool' param?
Why not two functions, one for 4K display and second for non-4K-capable?

> +		switch (type) {
> +		case DRM_MODE_CONNECTOR_DisplayPort:
> +			*count = ARRAY_SIZE(DP_EDIDS_4K);
> +			return DP_EDIDS_4K;

instead of returning here, add

	return *count;

at function end.

> +		case DRM_MODE_CONNECTOR_HDMIA:
> +			*count = ARRAY_SIZE(HDMI_EDIDS_4K);
> +			return HDMI_EDIDS_4K;
> +		default:
> +			igt_assert_f(0, "No 4k EDID for the connector %s\n",
> +				     kmstest_connector_type_str(type));
> +		}
> +	} else {
> +		switch (type) {
> +		case DRM_MODE_CONNECTOR_DisplayPort:
> +			*count = ARRAY_SIZE(DP_EDIDS_NON_4K);
> +			return DP_EDIDS_NON_4K;
> +		case DRM_MODE_CONNECTOR_HDMIA:
> +			*count = ARRAY_SIZE(HDMI_EDIDS_NON_4K);
> +			return HDMI_EDIDS_NON_4K;
> +		default:
> +			igt_assert_f(0, "No EDID for the connector %s\n",
> +				     kmstest_connector_type_str(type));
> +		}
> +	}
> +}
> diff --git a/lib/monitor_edids/monitor_edids_helper.h b/lib/monitor_edids/monitor_edids_helper.h
> index 05679f0897f3..2ec7aee5f13f 100644
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
> +struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid);
> +struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k);
> +
>  #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */
> \ No newline at end of file

Add newline.

Regards,
Kamil

> 
> -- 
> 2.46.2
> 
