Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403D6C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 11:11:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0AB1122A5;
	Fri, 26 Apr 2024 11:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="BBXNzqZn";
	dkim-atps=neutral
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4F21121F6
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 11:11:35 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-418e4cd2196so15750395e9.1
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 04:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1714129894; x=1714734694;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xt2b7CELmCPjJu2+Xw6vvIPmRNvxxqIJDyiRL4NKPkQ=;
 b=BBXNzqZnteafD5kNcjkwuWpR9T9kGZpKAtXYQ5o94EQPOIp9yCA27iks5SYd28RyfT
 DUy4hUYNhClTrfPDjXuR7p3sk0qjL83FnP459BvONPqyjxuffj9Thx4M/PT522QVZyAM
 ZlHeoX544r/znaFslnMYnLWlfAsSqU5XbIZbDqKKohjJJOY1XddVcBTobh75Wrs2oAWE
 76RsdTcX4ypzfurMH7+dVWLCnFixpbh7L9HYcWGLeoq59WQS0kObnEZtq9EzXJXEPHES
 FLfoiIDjQFoeosJEtvkiNahVh43lkidaa5TQ1f1s+Ybm1Jlu0uWGwKTXiBghoUFqFfHV
 Dhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714129894; x=1714734694;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xt2b7CELmCPjJu2+Xw6vvIPmRNvxxqIJDyiRL4NKPkQ=;
 b=asp5A3iOwmqh3f4UlC2u34QnWkNdI7pbnQQdVe5QI6DrveRFGz+k+PgFnySaa3uCjH
 eL3ZQwwahM02e/sraTL+vO0xwnNdStL8jhvj+5NNbTvPhnP6YJdSkbqUMCIVASW9g0er
 6rSyOG50Gat60rQnStPS05QC4TP8dyjUiO+XMcbT0TNPR/X+DKoAUDHlPj3C7EDe76gR
 xnf8ae7gG9sENx3ECR1lJ343Phn5Bm3lXcR84GN8mkWvP1HOEWpeTb1eE+yIDXhmYGv5
 nxHxPh/IARSxaoNkT8U7pVwPLSG56Kh9ASQ1GZlt9kc+9FZyq11NgRV+QCEefwU08EhC
 oZyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa0wY+yfgQ+j/G47ZfnIkN31k+7JMj7h2ySwKE+Lvya4A0xvnixM7COZxXrfb/VpqinJHdTQ55pNkQuLIyRobmboT1YbHXpNejfOI2ww==
X-Gm-Message-State: AOJu0Ywllo4z85D1fjByjN7f4DNjWdFrXVoeSntH1bJqRS2rad94bCMf
 bq2EWoQbMGtoXr8P8nRcSBqKDb3Z782nUvgRKv5FqMoyKYWcTGOgRabdeie0nPp9sZ0AGfUMVZf
 z
X-Google-Smtp-Source: AGHT+IEmhXqEhJEine6tvgleIN7Kkt5NJ1d4Ipx1nRuKmi6lcwOCOEbd2UwBgh3sxa0W043blu3BMQ==
X-Received: by 2002:a05:600c:5493:b0:418:16c3:499 with SMTP id
 iv19-20020a05600c549300b0041816c30499mr1833107wmb.37.1714129894062; 
 Fri, 26 Apr 2024 04:11:34 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a05600c4f4200b004186eb69a55sm30518162wmq.25.2024.04.26.04.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 04:11:33 -0700 (PDT)
Message-ID: <15803a05-9979-4481-b8c6-13c6fd58d10b@ursulin.net>
Date: Fri, 26 Apr 2024 12:11:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 15/21] lib/igt_drm_clients: Record total cycles
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240423234431.1959354-1-lucas.demarchi@intel.com>
 <20240423234431.1959354-16-lucas.demarchi@intel.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240423234431.1959354-16-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 24/04/2024 00:44, Lucas De Marchi wrote:
> If the fdinfo data indicates there's drm-total-cycles, use it to
> propagate the engine utilization. Also add an assert in intel_gpu_top
> since it only knows how to deal with with engine time busyness.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   lib/igt_drm_clients.c | 47 +++++++++++++++++++++++++++++++++++--------
>   lib/igt_drm_clients.h |  7 +++++--
>   lib/igt_drm_fdinfo.c  |  2 ++
>   tools/intel_gpu_top.c |  1 +
>   4 files changed, 47 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
> index 71a938b18..8b1959ae1 100644
> --- a/lib/igt_drm_clients.c
> +++ b/lib/igt_drm_clients.c
> @@ -106,16 +106,41 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
>   	c->last_runtime = 0;
>   	c->total_runtime = 0;
>   
> +	/*
> +	 * Make sure utilization type doesn't change between any 2 samples,
> +	 * otherwise the units don't match
> +	 */
> +	assert(c->dcut | info->dcut);
> +
>   	for (i = 0; i <= c->engines->max_engine_id; i++) {
>   		assert(i < ARRAY_SIZE(info->busy));
> -
> -		if (info->busy[i] < c->u[i].last_busy)
> -			continue; /* It will catch up soon. */
> -
> -		c->total_runtime += info->busy[i];
> -		c->u[i].delta_busy = info->busy[i] - c->u[i].last_busy;
> -		c->last_runtime += c->u[i].delta_busy;
> -		c->u[i].last_busy = info->busy[i];
> +		assert(i < ARRAY_SIZE(info->cycles));
> +		assert(i < ARRAY_SIZE(info->total_cycles));
> +
> +		switch (c->dcut) {
> +		case DCUT_ENGINE_TIME:
> +			if (info->busy[i] < c->u[i].last_busy)
> +				continue; /* It will catch up soon. */
> +
> +			c->total_runtime += info->busy[i];
> +			c->u[i].delta_busy = info->busy[i] - c->u[i].last_busy;
> +			c->last_runtime += c->u[i].delta_busy;
> +			c->u[i].last_busy = info->busy[i];
> +			break;
> +		case DCUT_GPU_TOTAL_CYCLES:
> +			if (info->cycles[i] < c->u[i].last_busy)
> +				continue; /* It will catch up soon. */
> +
> +			c->total_runtime += info->cycles[i];
> +			c->u[i].delta_busy = info->cycles[i] - c->u[i].last_busy;
> +			c->last_runtime += c->u[i].delta_busy;
> +			c->u[i].last_busy = info->cycles[i];
> +
> +			c->u[i].delta_total_cycles = info->total_cycles[i]
> +							- c->u[i].last_total_cycles;
> +			c->u[i].last_total_cycles = info->total_cycles[i];
> +			break;
> +		}
>   	}
>   
>   	/* Memory regions */
> @@ -207,6 +232,12 @@ igt_drm_client_add(struct igt_drm_clients *clients,
>   	c->memory = calloc(c->regions->max_region_id + 1, sizeof(*c->memory));
>   	assert(c->memory);
>   
> +	/* Prefer using GPU_TOTAL_CYCLES if available */
> +	if (info->dcut & DCUT_GPU_TOTAL_CYCLES)
> +		c->dcut = DCUT_GPU_TOTAL_CYCLES;
> +	else
> +		c->dcut = DCUT_ENGINE_TIME;

Hmm I have a feeling igt_drm_client shouldn't be making this decision 
but just tracking all available keys.

As such I would suggest making these flags instead of types.

(And with "dcut" naming spreading now I really think it is too obscure 
to stay.)

Something like:

if (info->utilisation_type & DRM_FDINFO_UTILISATION_TOTAL_CYCLES)
	c->utilisation_type |= DRM_CLIENT_TOTAL_CYCLES;
if (info->utilisation_type & DRM_FDINFO_UTILISATION_TIME)
	c->utilisation_type |= DRM_CLIENT_ENGINE_TIME;

Intel_gpu_top and gputop then pick when they know to work with, with the 
priority the application chooses.

Regards,

Tvrtko

> +
>   	igt_drm_client_update(c, pid, name, info);
>   }
>   
> diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
> index 5c6130ff1..5ab6f6e2e 100644
> --- a/lib/igt_drm_clients.h
> +++ b/lib/igt_drm_clients.h
> @@ -65,9 +65,12 @@ struct igt_drm_client {
>   	unsigned int samples; /* Count of times scanning updated this client. */
>   	unsigned long total_runtime; /* Aggregate busyness on all engines since client start. */
>   	unsigned long last_runtime; /* Aggregate busyness on all engines since previous scan. */
> +	enum drm_client_utilization_type dcut; /* Select method to calculate engine utiliazation */
>   	struct igt_drm_client_utilization {
> -		unsigned long delta_busy; /* Engine busyness data, relative to previous scan. */
> -		uint64_t last_busy; /* Engine busyness data as parsed from fdinfo. */
> +		unsigned long delta_busy; /* Engine busyness (either drm-cycles or drm-engine data), relative to previous scan. */
> +		unsigned long delta_total_cycles; /* Total engine cycles, relative to previous scan. */
> +		uint64_t last_busy; /* Engine busyness (either drm-cycles or drm-engine data) as parsed from fdinfo. */
> +		uint64_t last_total_cycles; /* Total engin cycles as parsed from fdinfo */
>   	} *u; /* Array of engine utilization */
>   	struct drm_client_meminfo *memory; /* Array of region memory utilisation as parsed from fdinfo. */
>   };
> diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
> index 7a1485c66..292c7e4d8 100644
> --- a/lib/igt_drm_fdinfo.c
> +++ b/lib/igt_drm_fdinfo.c
> @@ -270,10 +270,12 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>   			idx = parse_engine(l + keylen, info,
>   					   name_map, map_entries, &val);
>   			UPDATE_ENGINE(idx, cycles, val);
> +			has_cycles = true;
>   		} else if (strstartswith(l, "drm-total-cycles-", &keylen)) {
>   			idx = parse_engine(l + keylen, info,
>   					   name_map, map_entries, &val);
>   			UPDATE_ENGINE(idx, total_cycles, val);
> +			has_total_cycles = true;
>   		} else if (strstartswith(l, "drm-total-", &keylen)) {
>   			idx = parse_region(l + keylen, info,
>   					   region_map, region_entries, &val);
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index a4aa8414b..abbc30006 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -880,6 +880,7 @@ static struct igt_drm_clients *display_clients(struct igt_drm_clients *clients)
>   			break;
>   
>   		assert(c->status == IGT_DRM_CLIENT_ALIVE);
> +		assert(c->dcut == DCUT_ENGINE_TIME);
>   
>   		if (!cp || c->pid != cp->pid) {
>   			ac = &aggregated->client[num++];
