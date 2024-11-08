Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D464D64097
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 22:38:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1142710E29E;
	Fri,  8 Nov 2024 22:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TA2IYYfu";
	dkim-atps=neutral
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A419810E29E
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 22:38:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22B7EE0003;
 Fri,  8 Nov 2024 22:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1731105509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uLARbYzvWDUxauLZgik5TL0b0YEnRyA8pE8zqnk+LpQ=;
 b=TA2IYYfuB8ikUHy3OoiZASkiafZ6pC/J7y1oBUp6akTMcOqHfbw8r7ZV5Ay1LfaW54i9jU
 eOHS3B/mKhCmxWV7hPijj+ZKekY15Jf7BWlHIoxjwag7tOxO3PKY4ORhiICHpGlJ5vSmMF
 M1V641XDGZMEfa/6meXuqTsm4msje4C8vfjgAnhN4dISN7xHgoaeeM1bwVDGNrLTSq0MqN
 v9Rn18qN21EoimNL8CZDzIaZ+79UxbqqJGY0exH6w8/kngYBq+KzSA1GMvfYlwxmQStbFa
 KvosXYHHNvW4Ua02xjcSXvIflAK15JKL7xwsBizoayMq504FWF5XIVVYq3D1GQ==
Date: Fri, 8 Nov 2024 23:38:26 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Mark Yacoub <markyacoub@chromium.org>,
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
Message-ID: <Zy6S4iYmK4_lqv13@fedora>
References: <20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com>
 <20241022-b4-cv3-02-monitor-edids-v2-1-7634786c21e6@bootlin.com>
 <20241031185313.mh74kmwz5iwgq64j@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031185313.mh74kmwz5iwgq64j@kamilkon-desk.igk.intel.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 31/10/24 - 19:53, Kamil Konieczny wrote:
> Hi Louis,
> On 2024-10-22 at 14:53:10 +0200, Louis Chauvet wrote:
> 
> in you e-mail header I found in cc:
> 
> 	20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com
> 
> Is it correct?

It is a bug in b4, I will check if my fix was merged.
 
> > Introduce the functions edid_from_monitor_edid() and
> > get_edids_for_connector_type(). The former converts a monitor_edid object
> > to a struct edid, which can then be utilized by igt_kms helpers. The
> > latter returns a list of monitor_edid objects for a specific connector
> > with certain characteristics
> > 
> 
> Add here to Cc developer e-mails, found with 'git blame', so +cc
> 
> Cc: Mark Yacoub <markyacoub@chromium.org>
> Cc: Mark Yacoub <markyacoub@google.com>

He is already in my cover, I will ensure fthat he is in the CC for the v2, 
sorry.

> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  lib/monitor_edids/monitor_edids_helper.c | 61 +++++++++++++++++++++++++++++++-
> >  lib/monitor_edids/monitor_edids_helper.h |  5 +++
> >  2 files changed, 65 insertions(+), 1 deletion(-)
> > 
> > diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
> > index 1cbf1c22f0bb..0e0c2a9badcf 100644
> > --- a/lib/monitor_edids/monitor_edids_helper.c
> > +++ b/lib/monitor_edids/monitor_edids_helper.c
> > @@ -14,7 +14,10 @@
> >  #include <string.h>
> >  #include <assert.h>
> >  
> > -#include "igt_core.h"
> 
> Nice! igt_core here could be an overkill.
> 
> > +#include "igt.h"
> > +#include "igt_edid.h"
> > +#include "dp_edids.h"
> > +#include "hdmi_edids.h"
> >  
> >  static uint8_t convert_hex_char_to_byte(char c)
> >  {
> > @@ -90,3 +93,59 @@ void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid)
> >  	free(edid);
> >  	edid = NULL;
> >  }
> > +
> 
> Add description to each new lib function.
>
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
> > +		igt_warn("The edid size stored in the raw edid is shorter than the edid stored in the table.");
> 
> Warn could result in test failure, why not igt_debug()?

Because I tought it was the log level, and in this case it seems important 
to signal this issue.

There is nothing higher than debug for this kind of informations?
 
> > +		new_edid = realloc(raw_edid, edid_get_size((struct edid *)raw_edid));
> > +		igt_assert(new_edid);
> > +		raw_edid = new_edid;
> > +	}
> > +
> > +	return (struct edid *)raw_edid;
> > +}
> > +
> 
> Same here, add description.
>
> > +struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k)
> > +{
> > +	if (four_k) {
> 
> Do you really need function with 'bool' param?
> Why not two functions, one for 4K display and second for non-4K-capable?

For my first implementation of chamelium tests, it was more practical to 
have a boolean parameter than two different function.

I can change it for the v2 if you prefer, but having a bool may avoid this 
kind of code in tests:

	if (data->test_4k)
		edid = get4k(...);
	else
		edid = getnon4k(...);

> > +		switch (type) {
> > +		case DRM_MODE_CONNECTOR_DisplayPort:
> > +			*count = ARRAY_SIZE(DP_EDIDS_4K);
> > +			return DP_EDIDS_4K;
> 
> instead of returning here, add
> 
> 	return *count;
> 
> at function end.

I am not sure to follow you, this function return a pointer to an array, 
not the size.

> > +		case DRM_MODE_CONNECTOR_HDMIA:
> > +			*count = ARRAY_SIZE(HDMI_EDIDS_4K);
> > +			return HDMI_EDIDS_4K;
> > +		default:
> > +			igt_assert_f(0, "No 4k EDID for the connector %s\n",
> > +				     kmstest_connector_type_str(type));

For the v2 I will also replace this igt_assert_f with a igt_debug + return 
NULL.

> > +		}
> > +	} else {
> > +		switch (type) {
> > +		case DRM_MODE_CONNECTOR_DisplayPort:
> > +			*count = ARRAY_SIZE(DP_EDIDS_NON_4K);
> > +			return DP_EDIDS_NON_4K;
> > +		case DRM_MODE_CONNECTOR_HDMIA:
> > +			*count = ARRAY_SIZE(HDMI_EDIDS_NON_4K);
> > +			return HDMI_EDIDS_NON_4K;
> > +		default:
> > +			igt_assert_f(0, "No EDID for the connector %s\n",
> > +				     kmstest_connector_type_str(type));
> > +		}
> > +	}
> > +}
> > diff --git a/lib/monitor_edids/monitor_edids_helper.h b/lib/monitor_edids/monitor_edids_helper.h
> > index 05679f0897f3..2ec7aee5f13f 100644
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
> > +struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid);
> > +struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k);
> > +
> >  #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */
> > \ No newline at end of file
> 
> Add newline.
>
> Regards,
> Kamil
> 
> > 
> > -- 
> > 2.46.2
> > 
