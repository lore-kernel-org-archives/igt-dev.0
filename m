Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E692EE7718A
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 20:40:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED9610E2A1;
	Thu, 19 Dec 2024 20:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZGLtTb/O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E215E10E2A1
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 20:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734640832; x=1766176832;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=l1VY+gHORtoRfmJF0lcUkYWNp+UkUTooq95JTwnCrh0=;
 b=ZGLtTb/OxmT67NXN36J6vbQ8RkSwe3JclZHxGt4g1oAg16oN7K0FshKn
 7syH21Mr3AHyd8vhDRHcl3vYS7lht8bUP3HDRFkJdhpFsNZAryms/TpNq
 aIIGqCT4RqF1dZRqtZa+ocLO/1PaXDi6QYL4HIvu8A3r0UJE0aRl33lE0
 zEN7jUNJ9IUqzB57V7h4NXsxMBqSV07l6uH4Yt7pgDveYWKHs/4+0mKMR
 94Cesq8JxAEa0tAVH2eYOfTapS0ModA/gJn8wXGP8UgGNOIPbhBP8Gbg7
 CZs9DYuQj2eAwYvQO5aA8prSZXQSGbnQmobAWbvlnbgionYlb22q/y4EW Q==;
X-CSE-ConnectionGUID: b9tEHnGlRxWjKJGvXbGtgg==
X-CSE-MsgGUID: OFHCne4+SYGZsaYtOZBoZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34496871"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="34496871"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 12:40:31 -0800
X-CSE-ConnectionGUID: 9ziqKrY0SMi39efUgwr4+w==
X-CSE-MsgGUID: htI2N/5OSLy6iLAdUfPt0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103312299"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 12:40:27 -0800
Date: Thu, 19 Dec 2024 21:40:26 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, igt-dev@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com
Subject: Re: [PATCH i-g-t v3 1/5] lib/monitor_edids: Add helper functions for
 using monitor_edid objects
Message-ID: <20241219204026.o62a3uo2fiqistkb@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
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
 <20241122-b4-cv3-02-monitor-edids-v3-1-1798f58167ef@bootlin.com>
 <87wmgry8ik.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87wmgry8ik.fsf@intel.com>
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

Hi Jani,
On 2024-11-25 at 11:20:35 +0200, Jani Nikula wrote:
> On Fri, 22 Nov 2024, Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> > Introduce the functions edid_from_monitor_edid() and
> > get_edids_for_connector_type(). The former converts a monitor_edid object
> > to a struct edid, which can then be utilized by igt_kms helpers. The
> > latter returns a list of monitor_edid objects for a specific connector
> > with certain characteristics
> >
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  lib/monitor_edids/dp_edids.h             |  4 ++
> >  lib/monitor_edids/hdmi_edids.h           |  4 ++
> >  lib/monitor_edids/monitor_edids_helper.c | 77 ++++++++++++++++++++++++++++++++
> >  lib/monitor_edids/monitor_edids_helper.h |  7 ++-
> >  4 files changed, 91 insertions(+), 1 deletion(-)
> >
> > diff --git a/lib/monitor_edids/dp_edids.h b/lib/monitor_edids/dp_edids.h
> > index 144907558be1faa306b646ce3b47b24c13050968..8192520c89e61d3d38c508ca97a61040cea4ba90 100644
> > --- a/lib/monitor_edids/dp_edids.h
> > +++ b/lib/monitor_edids/dp_edids.h
> > @@ -12,6 +12,7 @@
> >  #ifndef TESTS_CHAMELIUM_MONITOR_EDIDS_DP_EDIDS_H_
> >  #define TESTS_CHAMELIUM_MONITOR_EDIDS_DP_EDIDS_H_
> >  
> > +#include "drmtest.h"
> >  #include "monitor_edids_helper.h"
> >  
> >  monitor_edid DP_EDIDS_4K[] = {
> > @@ -194,4 +195,7 @@ monitor_edid DP_EDIDS_NON_4K[] = {
> >  
> >   };
> >  
> > +#define DP_EDIDS_4K_COUNT = ARRAY_SIZE(DP_EDIDS_4K);
> > +#define DP_EDIDS_NON_4K_COUNT = ARRAY_SIZE(DP_EDIDS_NON_4K);
> > +
> >  #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_DP_EDIDS_H_ */
> > diff --git a/lib/monitor_edids/hdmi_edids.h b/lib/monitor_edids/hdmi_edids.h
> > index f6cfe82ff6e1c4419160bcdcc851a5e28eb08726..23ac04d94b6f672572e34b8059ff1b47d0730839 100644
> > --- a/lib/monitor_edids/hdmi_edids.h
> > +++ b/lib/monitor_edids/hdmi_edids.h
> > @@ -12,6 +12,7 @@
> >  #ifndef TESTS_CHAMELIUM_MONITOR_EDIDS_HDMI_EDIDS_H_
> >  #define TESTS_CHAMELIUM_MONITOR_EDIDS_HDMI_EDIDS_H_
> >  
> > +#include "drmtest.h"
> >  #include "monitor_edids_helper.h"
> >  
> >  monitor_edid HDMI_EDIDS_4K[] = {
> > @@ -604,4 +605,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
> >  		  "1620582c2500baac4200009e0000006b" },
> >  };
> >  
> > +#define HDMI_EDIDS_4K_COUNT = ARRAY_SIZE(HDMI_EDIDS_4K);
> > +#define HDMI_EDIDS_NON_4K_COUNT = ARRAY_SIZE(HDMI_EDIDS_NON_4K);
> > +
> >  #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_HDMI_EDIDS_H_ */
> > diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
> > index 1cbf1c22f0bbc5fb4047ce42bde2042ec8170efb..a7a945659f751be99ecd9d55f9b7307df256d543 100644
> > --- a/lib/monitor_edids/monitor_edids_helper.c
> > +++ b/lib/monitor_edids/monitor_edids_helper.c
> > @@ -15,6 +15,9 @@
> >  #include <assert.h>
> >  
> >  #include "igt_core.h"
> > +#include "igt_edid.h"
> > +#include "dp_edids.h"
> > +#include "hdmi_edids.h"
> >  
> >  static uint8_t convert_hex_char_to_byte(char c)
> >  {
> > @@ -90,3 +93,77 @@ void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid)
> >  	free(edid);
> >  	edid = NULL;
> >  }
> > +
> > +/*
> > + * edid_from_monitor_edid() - Get a struct edid from a monitor_edid
> > + * @mon_edid: Monitor EDId to convert
> > + *
> > + * The caller must free the returned pointer
> > + */
> > +struct edid *edid_from_monitor_edid(const monitor_edid *mon_edid)
> > +{
> > +	uint8_t *raw_edid;
> > +	size_t edid_size;
> > +	int i;
> > +
> > +	edid_size = strlen(mon_edid->edid) / 2; /* each ascii is a nibble. */
> > +	raw_edid = malloc(edid_size);
> > +	igt_assert(raw_edid);
> > +
> > +	for (i = 0; i < edid_size; i++) {
> > +		raw_edid[i] = convert_hex_char_to_byte(mon_edid->edid[i * 2]) << 4 |
> > +			      convert_hex_char_to_byte(mon_edid->edid[i * 2 + 1]);
> > +	}
> > +
> > +	if (edid_get_size((struct edid *)raw_edid) > edid_size) {
> > +		uint8_t *new_edid;
> > +
> > +		igt_debug("The edid size stored in the raw edid is shorter than the edid stored in the table.");
> > +		new_edid = realloc(raw_edid, edid_get_size((struct edid *)raw_edid));
> > +		igt_assert(new_edid);
> > +		raw_edid = new_edid;
> > +	}
> > +
> > +	return (struct edid *)raw_edid;
> > +}
> 
> Only partially related to the patch at hand, IGT seems to be completely
> unaware of the HF-EEODB extension which can indicate a bigger EDID size
> than what edid_get_size() returns.
> 
> The above would reduce the allocation below the actual EDID size in such
> cases. Luckily I don't think anyone in IGT interprets EDIDs according to
> HF-EEODB, so there's no buffer overflow *yet*, but eventually that will
> need to be covered, and basically every single EDID usage needs to be
> amended.
> 
> BR,
> Jani.
> 
> 

Thank you for comments, imho this should be a TODO
in our library.

Regards,
Kamil

> 
> > +
> > +/*
> > + * get_edids_for_connector_type() - Get the list of EDIDS for a
> > + * specific connector type.
> > + *
> > + * @type: The connector type to get the EDIDs from
> > + * @count: Used to store the number of EDIDs in the returned list
> > + * @four_k: Use true to fetch 4k EDIDs, false to fetch non-4k EDIDs
> > + */
> > +struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k)
> > +{
> > +	if (four_k) {
> > +		switch (type) {
> > +		case DRM_MODE_CONNECTOR_DisplayPort:
> > +			*count = DP_EDIDS_4K_COUNT;
> > +			return DP_EDIDS_4K;
> > +		case DRM_MODE_CONNECTOR_HDMIA:
> > +			*count = HDMI_EDIDS_4K_COUNT;
> > +			return HDMI_EDIDS_4K;
> > +		default:
> > +			*count = 0;
> > +			igt_debug("No 4k EDID for the connector %s\n",
> > +				  kmstest_connector_type_str(type));
> > +			return NULL;
> > +		}
> > +	} else {
> > +		switch (type) {
> > +		case DRM_MODE_CONNECTOR_DisplayPort:
> > +			*count = DP_EDIDS_NON_4K_COUNT;
> > +			return DP_EDIDS_NON_4K;
> > +		case DRM_MODE_CONNECTOR_HDMIA:
> > +			*count = HDMI_EDIDS_NON_4K_COUNT;
> > +			return HDMI_EDIDS_NON_4K;
> > +		default:
> > +			*count = 0;
> > +			igt_debug("No EDID for the connector %s\n",
> > +				  kmstest_connector_type_str(type));
> > +			return NULL;
> > +		}
> > +	}
> > +}
> > diff --git a/lib/monitor_edids/monitor_edids_helper.h b/lib/monitor_edids/monitor_edids_helper.h
> > index 05679f0897f3d0618d656cc071b565b48d31da28..e5069868683d97053d8e66666e83692f1b733db3 100644
> > --- a/lib/monitor_edids/monitor_edids_helper.h
> > +++ b/lib/monitor_edids/monitor_edids_helper.h
> > @@ -12,6 +12,8 @@
> >  #define TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_
> >  
> >  #include <stdint.h>
> > +#include <stddef.h>
> > +#include <stdbool.h>
> >  
> >  #include "igt_chamelium.h"
> >  
> > @@ -30,4 +32,7 @@ get_chameleon_edid_from_monitor_edid(struct chamelium *chamelium,
> >  				     const monitor_edid *edid);
> >  void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid);
> >  
> > -#endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */
> > \ No newline at end of file
> > +struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid);
> > +struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k);
> > +
> > +#endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */
> 
> -- 
> Jani Nikula, Intel
