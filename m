Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E116D6E2A4
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 10:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3FC10E3EC;
	Thu, 21 Nov 2024 10:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="i/OyDyPO";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DCE10E3EC
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 10:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BQ2te8zo2d2oROAL5Sbdk67rSqeDkrTkWNCYV+VetZI=; b=i/OyDyPOOE/xfLxy/nbbFLhxGS
 if9fRD/9cdnJYFhMO45dhAphMaWAr5qY/sjYTHo2H8bEQhwQeFRNTjqkqwmhd6mZVGN7ZSESgi//a
 sNlP2lW7lzbMPo6roBVhNTxKx6lyPfdjNS90yGQS3Q9LUjpFF0MWQwJblPQ6TpRqsipv0/8RtIkYw
 0W0YWLTnoIB5VLWz4AdiPbbrpa3jGh2Vb0MKn065SvfwWcw2Uhzzo1Bt6ZjsAoFCCBLxmwlF00Um9
 JR/ENsAtdA9R8J6p5BhfqZHrYI2tilwZ9rf+cNaysxkMYHS8NXqFzS5CoBJfbKAPB82w3YU9lFYGH
 O+8P+NEA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tE42G-00AM5R-SQ; Thu, 21 Nov 2024 11:03:40 +0100
Message-ID: <861e015e-48d9-4a91-8da3-efcae38e1d0a@igalia.com>
Date: Thu, 21 Nov 2024 10:03:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] gputop: Add memory only utilization type
To: Christian Gmeiner <christian.gmeiner@gmail.com>,
 igt-dev@lists.freedesktop.org
Cc: kernel-dev@igalia.com, tursulin@igalia.com,
 Christian Gmeiner <cgmeiner@igalia.com>
References: <20241121093822.3863544-1-christian.gmeiner@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20241121093822.3863544-1-christian.gmeiner@gmail.com>
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


On 21/11/2024 09:38, Christian Gmeiner wrote:
> From: Christian Gmeiner <cgmeiner@igalia.com>
> 
> Add special handling for drivers that only provide memory utilization
> fdinfo.

To check I am following correctly - special in this context means avoid 
displaying empty fields, or avoid a crash, or?

> Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
> ---
>   tools/gputop.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/tools/gputop.c b/tools/gputop.c
> index 43b01f566..4135d84c1 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -35,6 +35,7 @@
>   enum utilization_type {
>   	UTILIZATION_TYPE_ENGINE_TIME,
>   	UTILIZATION_TYPE_TOTAL_CYCLES,
> +	UTILIZATION_TYPE_MEMORY_ONLY,
>   };
>   
>   static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
> @@ -141,6 +142,9 @@ engines_identical(const struct igt_drm_client *c,
>   	    c->engines->max_engine_id != pc->engines->max_engine_id)
>   		return false;
>   
> +	if (!c->engines->num_engines && !pc->engines->num_engines)
> +		return true;

strcmp() below crashes?

I would move the check you added to be first in this function. I think 
that makes most sense from the flow wise - checking it before max_engine_id.

With this fixed what remains broken?

The loop in print_client() should ideally be skipped but even as is I 
think exits on the capacity check, no? At the moment it seems like this 
could be enough but maybe I am missing something.

Regards,

Tvrtko

> +
>   	for (i = 0; i <= c->engines->max_engine_id; i++)
>   		if (c->engines->capacity[i] != pc->engines->capacity[i] ||
>   		    !!c->engines->names[i] != !!pc->engines->names[i] ||
> @@ -193,6 +197,8 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
>   		utilization_type = UTILIZATION_TYPE_TOTAL_CYCLES;
>   	else if (c->utilization_mask & IGT_DRM_CLIENT_UTILIZATION_ENGINE_TIME)
>   		utilization_type = UTILIZATION_TYPE_ENGINE_TIME;
> +	else if (c->regions->num_regions)
> +		utilization_type = UTILIZATION_TYPE_MEMORY_ONLY;
>   	else
>   		return 0;
>   
> @@ -209,6 +215,13 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
>   	       if (!c->total_total_cycles)
>   		       return 0;
>   	       break;
> +	case UTILIZATION_TYPE_MEMORY_ONLY:
> +		for (sz = 0, i = 0; i <= c->regions->max_region_id; i++)
> +			sz += c->memory[i].total;
> +
> +		if (sz == 0)
> +			return 0;
> +		break;
>   	}
>   
>   	/* Print header when moving to a different DRM card. */
> @@ -234,6 +247,9 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
>   
>   	lines++;
>   
> +	if (utilization_type == UTILIZATION_TYPE_MEMORY_ONLY)
> +		goto print_name;
> +
>   	for (i = 0; c->samples > 1 && i <= c->engines->max_engine_id; i++) {
>   		double pct;
>   
> @@ -249,6 +265,9 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
>   			pct = (double)c->utilization[i].delta_cycles / c->utilization[i].delta_total_cycles * 100 /
>   				c->engines->capacity[i];
>   			break;
> +		case UTILIZATION_TYPE_MEMORY_ONLY:
> +			/* Nothing to do. */
> +			break;
>   		}
>   
>   		/*
> @@ -262,6 +281,7 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
>   		len += *engine_w;
>   	}
>   
> +print_name:
>   	printf(" %-*s\n", con_w - len - 1, c->print_name);
>   
>   	return lines;
