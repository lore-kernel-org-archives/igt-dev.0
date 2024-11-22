Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67D2E65D36
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 08:55:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FED810E1E2;
	Fri, 22 Nov 2024 08:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="U87NEUb9";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C367410E1E2
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 08:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QKtA26KWwWdTf+rEtUq87Ulwl5xxwKi20vFMqeaIfEw=; b=U87NEUb90hZ9SClelIJzt6AIvb
 mzZLATfG6t8/7v4DH6/p1E5q4UG/RC3fgk8sN2rABbR9hhKsGVFKJMhTZQOjccRkfTJgsEDlUQ4uA
 7BQrwfHn7jiTcJZkp0dpBvs4hqcm9baFQq179iflYbvkK27r92sr73u5iYeW1vy3sIy/rmZ9LN3pn
 x/LPOJn/Wv05aiWIx4gJMEYEER0Ueyv6050y3WPA1ppOIyjsjzCkMX3DrvP2h7WibQvbEPG4ZsOYO
 VXKZh3pq6LLDtWCuvtYHw/LJmSEiOCo0cP4hreQCNWNq205AebWxOWQD/YnRoXojMTyKjNHhUM0hj
 O/IPtVGA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tEPRK-00ArVM-E2; Fri, 22 Nov 2024 09:54:58 +0100
Message-ID: <693bcca3-3969-44a0-ba96-c26fe4bd70c7@igalia.com>
Date: Fri, 22 Nov 2024 08:54:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] gputop: Add memory only utilization type
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 tursulin@igalia.com, Christian Gmeiner <cgmeiner@igalia.com>
References: <20241121093822.3863544-1-christian.gmeiner@gmail.com>
 <861e015e-48d9-4a91-8da3-efcae38e1d0a@igalia.com>
 <CAH9NwWeLHGMS8sXt47ctLczfXD1ggg9x2pc3tnKszqJZ=CPdvQ@mail.gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <CAH9NwWeLHGMS8sXt47ctLczfXD1ggg9x2pc3tnKszqJZ=CPdvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 21/11/2024 18:35, Christian Gmeiner wrote:
> Hi Tvrtko
> 
>>> From: Christian Gmeiner <cgmeiner@igalia.com>
>>>
>>> Add special handling for drivers that only provide memory utilization
>>> fdinfo.
>>
>> To check I am following correctly - special in this context means avoid
>> displaying empty fields, or avoid a crash, or?
> 
> - Avoid early return in print_client(..) -> no output show.
> - Avoid a crash in strcmp(..).
> 
>>
>>> Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
>>> ---
>>>    tools/gputop.c | 20 ++++++++++++++++++++
>>>    1 file changed, 20 insertions(+)
>>>
>>> diff --git a/tools/gputop.c b/tools/gputop.c
>>> index 43b01f566..4135d84c1 100644
>>> --- a/tools/gputop.c
>>> +++ b/tools/gputop.c
>>> @@ -35,6 +35,7 @@
>>>    enum utilization_type {
>>>        UTILIZATION_TYPE_ENGINE_TIME,
>>>        UTILIZATION_TYPE_TOTAL_CYCLES,
>>> +     UTILIZATION_TYPE_MEMORY_ONLY,
>>>    };
>>>
>>>    static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
>>> @@ -141,6 +142,9 @@ engines_identical(const struct igt_drm_client *c,
>>>            c->engines->max_engine_id != pc->engines->max_engine_id)
>>>                return false;
>>>
>>> +     if (!c->engines->num_engines && !pc->engines->num_engines)
>>> +             return true;
>>
>> strcmp() below crashes?
>>
> 
> Correct.
> 
>> I would move the check you added to be first in this function. I think
>> that makes most sense from the flow wise - checking it before max_engine_id.
>>
> 
> Will do in v2.
> 
>> With this fixed what remains broken?
>>
> 
> Show any output :)

I totally missed it. Shows the value of commit messages. ;)

Okay.. I wonder if we can get away without adding 
UTILIZATION_TYPE_MEMORY_ONLY and instead make the code skip unavailable 
data.

Would something like this work:

diff --git a/tools/gputop.c b/tools/gputop.c
index 43b01f566ac8..9639a7f5fde8 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -137,6 +137,9 @@ engines_identical(const struct igt_drm_client *c,
  {
  	unsigned int i;

+	if (!c->engines->num_engines && !pc->engines->num_engines)
+		return true;
+
  	if (c->engines->num_engines != pc->engines->num_engines ||
  	    c->engines->max_engine_id != pc->engines->max_engine_id)
  		return false;
@@ -188,27 +191,20 @@ print_client(struct igt_drm_client *c, struct 
igt_drm_client **prevc,
  	uint64_t sz;
  	int len;

+	if (c->samples < 2)
+		return 0;
+
  	if (c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_TOTAL_CYCLES &&
-	    c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_CYCLES)
+	    c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_CYCLES) {
  		utilization_type = UTILIZATION_TYPE_TOTAL_CYCLES;
-	else if (c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_ENGINE_TIME)
+		/* Filter out idle clients. */
+		if (c->engines->num_engines && !c->total_total_cycles)
+			return 0;
+	} else if (c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_ENGINE_TIME) {
  		utilization_type = UTILIZATION_TYPE_ENGINE_TIME;
-	else
-		return 0;
-
-	if (c->samples < 2)
-		return 0;
-
-	/* Filter out idle clients. */
-	switch (utilization_type) {
-	case UTILIZATION_TYPE_ENGINE_TIME:
-	       if (!c->total_engine_time)
-		       return 0;
-	       break;
-	case UTILIZATION_TYPE_TOTAL_CYCLES:
-	       if (!c->total_total_cycles)
-		       return 0;
-	       break;
+		/* Filter out idle clients. */
+		if (c->engines->num_engines && !c->total_engine_time)
+			return 0;
  	}

  	/* Print header when moving to a different DRM card. */
@@ -234,7 +230,9 @@ print_client(struct igt_drm_client *c, struct 
igt_drm_client **prevc,

  	lines++;

-	for (i = 0; c->samples > 1 && i <= c->engines->max_engine_id; i++) {
+	for (i = 0;
+	     c->engines->num_engines && i <= c->engines->max_engine_id;
+	     i++) {
  		double pct;

  		if (!c->engines->capacity[i])

Regards,

Tvrtko

>> The loop in print_client() should ideally be skipped but even as is I
>> think exits on the capacity check, no? At the moment it seems like this
>> could be enough but maybe I am missing something.
>>
> 
> You are correct - it works without the goto thing.
> 
>> Regards,
>>
>> Tvrtko
>>
>>> +
>>>        for (i = 0; i <= c->engines->max_engine_id; i++)
>>>                if (c->engines->capacity[i] != pc->engines->capacity[i] ||
>>>                    !!c->engines->names[i] != !!pc->engines->names[i] ||
>>> @@ -193,6 +197,8 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
>>>                utilization_type = UTILIZATION_TYPE_TOTAL_CYCLES;
>>>        else if (c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_ENGINE_TIME)
>>>                utilization_type = UTILIZATION_TYPE_ENGINE_TIME;
>>> +     else if (c->regions->num_regions)
>>> +             utilization_type = UTILIZATION_TYPE_MEMORY_ONLY;
>>>        else
>>>                return 0;
>>>
>>> @@ -209,6 +215,13 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
>>>               if (!c->total_total_cycles)
>>>                       return 0;
>>>               break;
>>> +     case UTILIZATION_TYPE_MEMORY_ONLY:
>>> +             for (sz = 0, i = 0; i <= c->regions->max_region_id; i++)
>>> +                     sz += c->memory[i].total;
>>> +
>>> +             if (sz == 0)
>>> +                     return 0;
>>> +             break;
>>>        }
>>>
>>>        /* Print header when moving to a different DRM card. */
>>> @@ -234,6 +247,9 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
>>>
>>>        lines++;
>>>
>>> +     if (utilization_type == UTILIZATION_TYPE_MEMORY_ONLY)
>>> +             goto print_name;
>>> +
>>>        for (i = 0; c->samples > 1 && i <= c->engines->max_engine_id; i++) {
>>>                double pct;
>>>
>>> @@ -249,6 +265,9 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
>>>                        pct = (double)c->utilization[i].delta_cycles / c->utilization[i].delta_total_cycles * 100 /
>>>                                c->engines->capacity[i];
>>>                        break;
>>> +             case UTILIZATION_TYPE_MEMORY_ONLY:
>>> +                     /* Nothing to do. */
>>> +                     break;
>>>                }
>>>
>>>                /*
>>> @@ -262,6 +281,7 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
>>>                len += *engine_w;
>>>        }
>>>
>>> +print_name:
>>>        printf(" %-*s\n", con_w - len - 1, c->print_name);
>>>
>>>        return lines;
> 
> 
> 
