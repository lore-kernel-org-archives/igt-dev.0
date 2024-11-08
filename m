Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C839AD6409A
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 22:38:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865BC10E2A3;
	Fri,  8 Nov 2024 22:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QQclDYyo";
	dkim-atps=neutral
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC3210E2A3
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 22:38:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54D95240004;
 Fri,  8 Nov 2024 22:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1731105509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NhWSE5maLpJh/GcGzcyEVq97ylZOG0WTBgLmyZAxH6Q=;
 b=QQclDYyoETlcVgFk6bfMWjjw8qR0rqpd3njZH37kwb7GgdsWir32GeBTib7Th/CCasNtZu
 /hbjTurg1JznbIRVRQOiWQnTNxqDIYBZb3CEwLW9OVRldeZypToPtQpX8eo+Q3bJyLF6im
 beOPR9garyOpx8BJoQYhpQPW8aOuxMNzgb8a7Mqccg+Ps79iWHnlNknmPj1A3g9ofaqUt5
 iZMRj9OJWfaLgn24o2IaatVXgTVfgAHXgOaZ4kPvs2L5txfS1KSg49tWvb0aUMrikSwzME
 qnxjUqS02zkOK4B7j1M90wTd+MTiRZMlEt77AyOVkoXyY5OgciA5qxfeNvqxjA==
Date: Fri, 8 Nov 2024 23:38:26 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com
Subject: Re: [PATCH i-g-t v2 3/5] lib/monitor_edids: Add helper to print all
 available EDID names
Message-ID: <Zy6S4jMsXR4IYwc4@fedora>
References: <20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com>
 <20241022-b4-cv3-02-monitor-edids-v2-3-7634786c21e6@bootlin.com>
 <20241031190415.53o5xi5hgluyorjw@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031190415.53o5xi5hgluyorjw@kamilkon-desk.igk.intel.com>
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

On 31/10/24 - 20:04, Kamil Konieczny wrote:
> Hi Louis,
> On 2024-10-22 at 14:53:12 +0200, Louis Chauvet wrote:
> > During the chamelium v3 configuration, it may be required to know the list
> > of supported EDID names, so add an helper to print them.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  lib/monitor_edids/monitor_edids_helper.c | 10 ++++++++++
> >  lib/monitor_edids/monitor_edids_helper.h |  2 ++
> >  2 files changed, 12 insertions(+)
> > 
> > diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
> > index 0f92ced64d06..ca2f5006eada 100644
> > --- a/lib/monitor_edids/monitor_edids_helper.c
> > +++ b/lib/monitor_edids/monitor_edids_helper.c
> > @@ -170,3 +170,13 @@ struct edid *get_edid_by_name(char *name)
> >  	}
> >  	return NULL;
> >  }
> > +
> 
> Add description.
> 
> > +void list_edid_names(enum igt_log_level level)
> > +{
> > +	for (int i = 0; i < ARRAY_SIZE(ALL_EDIDS); i++) {
> > +		for (int j = 0; j < ALL_EDIDS[i].list_size; j++) {
> > +			igt_log(IGT_LOG_DOMAIN, level, " - \"%s\"\n",
> > +				ALL_EDIDS[i].edid_list[j].name);
> > +		}
> > +	}
> > +}
> > diff --git a/lib/monitor_edids/monitor_edids_helper.h b/lib/monitor_edids/monitor_edids_helper.h
> > index cd0e5a7b2645..50b08530826a 100644
> > --- a/lib/monitor_edids/monitor_edids_helper.h
> > +++ b/lib/monitor_edids/monitor_edids_helper.h
> > @@ -15,6 +15,7 @@
> >  #include <stddef.h>
> >  #include <stdbool.h>
> >  
> > +#include "igt_core.h"
> 
> And now it returns... Why not make this a first patch?

Because I did some cleanup on the first patch to avoid useless dependency, 
but now I need igt_log_level and igt_log... You are right, I will not 
remove it on the first patch.

> >  #include "igt_chamelium.h"
> >  
> >  /* Max Length can be increased as needed, when new EDIDs are added. */
> > @@ -35,5 +36,6 @@ void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid);
> >  struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid);
> >  struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k);
> >  struct edid *get_edid_by_name(char *name);
> > +void list_edid_names(enum igt_log_level level);
> >  
> >  #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */
> > \ No newline at end of file
> 
> Add newline.
> 
> Regards,
> Kamil
> > 
> > -- 
> > 2.46.2
> > 
