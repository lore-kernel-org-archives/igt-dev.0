Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD30D64098
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 22:38:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A1E10E2A2;
	Fri,  8 Nov 2024 22:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="kaI3vMtf";
	dkim-atps=neutral
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B319B10E2A2
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 22:38:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EAFCCE0002;
 Fri,  8 Nov 2024 22:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1731105509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c0GG3UyvXM39OSBRhMBDrO9fMIpKlvRwgWTuZsWJFck=;
 b=kaI3vMtf9JfeFMF90kcXo6ff+hqKM+PXqxvsoVWX0XktJCoueZHTp46xYElZ+xUt4PLGAO
 K+SlsYYMQw5vLHOZJ4Y3ttH9oZ9GTZVw4FA12UHRBXiLZs5SP5fvZLW/NVI6zXQPU2azzh
 Z4ZWDVgadAx4R4QEb5LzJOtBpV1wOqy94IVmcXFVaD+5drjC+SjMXtPBCyN4u1EWLX8YKr
 DbbFwl9IcmyA5veTmXcLTR39OHfDtTb5JmKMfET+dX9hHv4q2rWKd3t3AqkMNyXetsuAUL
 Y4rNjDzfd04ci0oA485qEAow4uHwaKOPa5LLom3dcAtVtSIu/oLNzh9//PCGpA==
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
 jeremie.dautheribes@bootlin.com, markyacoub@google.com
Subject: Re: [PATCH i-g-t v2 2/5] lib/monitor_edids: Add helper to get an
 EDID by its name
Message-ID: <Zy6S4tOWEiAMdUvh@fedora>
References: <20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com>
 <20241022-b4-cv3-02-monitor-edids-v2-2-7634786c21e6@bootlin.com>
 <20241031185809.r7g5bzgo2ijg7rlh@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031185809.r7g5bzgo2ijg7rlh@kamilkon-desk.igk.intel.com>
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

On 31/10/24 - 19:58, Kamil Konieczny wrote:
> Hi Louis,
> On 2024-10-22 at 14:53:11 +0200, Louis Chauvet wrote:
> 
> same here, in Cc you have:
> 
> 	20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com
> 
> > For testing specific EDID, it is useful to be able to retrieve an EDID by
> > a verbose name.
> > 
> 
> Add Mark here in Cc.
> 
> Cc: Mark Yacoub <markyacoub@chromium.org>
> 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  lib/monitor_edids/dp_edids.h             |  3 +++
> >  lib/monitor_edids/hdmi_edids.h           |  3 +++
> >  lib/monitor_edids/monitor_edids_helper.c | 21 +++++++++++++++++++++
> >  lib/monitor_edids/monitor_edids_helper.h |  1 +
> >  4 files changed, 28 insertions(+)
> > 
> > diff --git a/lib/monitor_edids/dp_edids.h b/lib/monitor_edids/dp_edids.h
> > index 144907558be1..d11a81d167fc 100644
> > --- a/lib/monitor_edids/dp_edids.h
> > +++ b/lib/monitor_edids/dp_edids.h
> > @@ -194,4 +194,7 @@ monitor_edid DP_EDIDS_NON_4K[] = {
> >  
> >   };
> >  
> > +const int DP_EDID_NON_4K_COUNT = ARRAY_SIZE(DP_EDIDS_NON_4K);
> > +const int DP_EDID_4K_COUNT = ARRAY_SIZE(DP_EDIDS_4K);
> > +
> >  #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_DP_EDIDS_H_ */
> > diff --git a/lib/monitor_edids/hdmi_edids.h b/lib/monitor_edids/hdmi_edids.h
> > index 9d75cfa989b6..573e2149d5d3 100644
> > --- a/lib/monitor_edids/hdmi_edids.h
> > +++ b/lib/monitor_edids/hdmi_edids.h
> > @@ -604,4 +604,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
> >  		  "1620582c2500baac4200009e0000006b" },
> >  };
> >  
> > +const int HDMI_EDID_4K_COUNT = ARRAY_SIZE(HDMI_EDIDS_4K);
> > +const int HDMI_EDID_NON_4K_COUNT = ARRAY_SIZE(HDMI_EDIDS_NON_4K);
> > +
> 
> imho better make it a #define

Will do for v2.

What is the reason to use define over const int?

> >  #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_HDMI_EDIDS_H_ */
> > diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
> > index 0e0c2a9badcf..0f92ced64d06 100644
> > --- a/lib/monitor_edids/monitor_edids_helper.c
> > +++ b/lib/monitor_edids/monitor_edids_helper.c
> > @@ -19,6 +19,16 @@
> >  #include "dp_edids.h"
> >  #include "hdmi_edids.h"
> >  
> > +struct {
> > +	struct monitor_edid *edid_list;
> > +	int list_size;
> > +} ALL_EDIDS[] = {
> > +	{DP_EDIDS_NON_4K,	DP_EDID_NON_4K_COUNT},
> > +	{DP_EDIDS_4K,		DP_EDID_4K_COUNT},
> > +	{HDMI_EDIDS_NON_4K,	HDMI_EDID_NON_4K_COUNT},
> > +	{HDMI_EDIDS_4K,		HDMI_EDID_4K_COUNT},
> > +};
> > +
> >  static uint8_t convert_hex_char_to_byte(char c)
> >  {
> >  	if (c >= '0' && c <= '9')
> > @@ -149,3 +159,14 @@ struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count,
> >  		}
> >  	}
> >  }
> > +
> 
> Add description.
>
> > +struct edid *get_edid_by_name(char *name)
> > +{
> > +	for (int i = 0; i < ARRAY_SIZE(ALL_EDIDS); i++) {
> > +		for (int j = 0; j < ALL_EDIDS[i].list_size; j++) {
> > +			if (strcmp(ALL_EDIDS[i].edid_list[j].name, name) == 0)
> > +				return edid_from_monitor_edid(&ALL_EDIDS[i].edid_list[j]);
> > +		}
> > +	}
> 
> Add newline.
> 
> > +	return NULL;
> > +}
> > diff --git a/lib/monitor_edids/monitor_edids_helper.h b/lib/monitor_edids/monitor_edids_helper.h
> > index 2ec7aee5f13f..cd0e5a7b2645 100644
> > --- a/lib/monitor_edids/monitor_edids_helper.h
> > +++ b/lib/monitor_edids/monitor_edids_helper.h
> > @@ -34,5 +34,6 @@ void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid);
> >  
> >  struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid);
> >  struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k);
> > +struct edid *get_edid_by_name(char *name);
> >  
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
