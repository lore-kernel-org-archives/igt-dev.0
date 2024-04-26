Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC665C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 11:05:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5D811218D;
	Fri, 26 Apr 2024 11:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="CQT6g14I";
	dkim-atps=neutral
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B0411218D
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 11:05:20 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-34a3e0b31e6so1457475f8f.1
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 04:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1714129518; x=1714734318;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e4RONkB9QEva0kc3sbjo8wGv07qBKdU4mT/XU5XhxsE=;
 b=CQT6g14ICvftjufsFCMNyW2QRxZC4QHj84s7/8APmbIOd5/tE/cmnNYwQznksG8iWj
 NWXyvb5VQXDt/p4hK0Z3dwSlFGT2aEUV+wJ4nNRCgtG8NpDRYtmXKgizVcRo4vtVIHUY
 TBoDZ4e0d6TZQ6gGsXrIi2AAEnBrC0hUWZMWiprxLY7KX3bJjx77xQNYrZ36vWVXv++G
 lxrQKpZ1pZ+m3gjoCE/zLf6aLJ/baMkuFdmBQ4XUp+5HS2z4TJlqJiEQ7rNs2jX8JwDu
 R2J5rlbTPy0NROUqIxS4TcGc13U82J/GZ8xYAwrKm6daxQa0Mtt/XSgB+aKe70A5rr82
 0adg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714129518; x=1714734318;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e4RONkB9QEva0kc3sbjo8wGv07qBKdU4mT/XU5XhxsE=;
 b=LjkhuQw+L2JbQIalZ150kiSNH+mIyMkpxRIfNZjCfoCq5NUy27atSjWuIzdhBfgXNr
 k5LRnWN2YIWR8FZflggYgWF1rI8MuQ1MU8oOBUtlGF5Wpw5fZme+0aTsywMGwm4HTRig
 cgFw9wxU00onYHppV2M+w+2QNi2lZG6S5Y24EF+UJE1VJwwVt/W5FGV8xXosD0FEDbUQ
 m1qvrTCVkQ6EHhEPHESaFTYfhUph/kZM0CXmnPIFk8u/+1X2vzhon31tEHPw3rCeCHZU
 W7UZrK5pl368SHcBOi7JLV3J72W1UUH7OakCOfs74xFP6UIO0xKpTgFPzcsN5A2vwyDC
 Bjuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBqKFx7EuWJzI3fdiodL/lImw16n8xSduDgZb/iiGrrrmPnzrqzWhJMJ2Rr4joR5b1eRT3nr6lcJFGeHJtRytuTje+AVxOIVi+DXeccw==
X-Gm-Message-State: AOJu0Yy8ADSQDp4X0SR5jjZQ6Wxux93U578SWAN6gJV+MCZydH5oV771
 nOq0bGxAuvPfH39d23klMZlN8DDOeojR+hi8zwMXh7MSQ+vPQ7XRtXx2UppeHcM=
X-Google-Smtp-Source: AGHT+IF56iSTy2yibsZRn18X8TY+Qzsp5MYfzAIOFdg/vWCjdvqYxdqy0CklF0qvQYwNLWcw5yYk+g==
X-Received: by 2002:a5d:530b:0:b0:34b:4d4e:c680 with SMTP id
 e11-20020a5d530b000000b0034b4d4ec680mr1649765wrv.36.1714129518187; 
 Fri, 26 Apr 2024 04:05:18 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a5d6442000000b003479bec98cesm22037491wrw.115.2024.04.26.04.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 04:05:17 -0700 (PDT)
Message-ID: <1a611857-7c01-44b1-8181-5120d80fcde4@ursulin.net>
Date: Fri, 26 Apr 2024 12:05:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 14/21] lib/igt_drm_clients: Move engine fields to
 substruct
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240423234431.1959354-1-lucas.demarchi@intel.com>
 <20240423234431.1959354-15-lucas.demarchi@intel.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240423234431.1959354-15-lucas.demarchi@intel.com>
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
> Instead of keep adding arrays, move all the arrays indexed by engine to
> a substruct.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   lib/igt_drm_clients.c | 19 ++++++++-----------
>   lib/igt_drm_clients.h |  6 ++++--
>   tools/gputop.c        |  2 +-
>   tools/intel_gpu_top.c | 14 +++++++-------
>   4 files changed, 20 insertions(+), 21 deletions(-)
> 
> diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
> index 940c95381..71a938b18 100644
> --- a/lib/igt_drm_clients.c
> +++ b/lib/igt_drm_clients.c
> @@ -109,13 +109,13 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
>   	for (i = 0; i <= c->engines->max_engine_id; i++) {
>   		assert(i < ARRAY_SIZE(info->busy));
>   
> -		if (info->busy[i] < c->last_busy[i])
> +		if (info->busy[i] < c->u[i].last_busy)
>   			continue; /* It will catch up soon. */
>   
>   		c->total_runtime += info->busy[i];
> -		c->delta_busy[i] = info->busy[i] - c->last_busy[i];
> -		c->last_runtime += c->delta_busy[i];
> -		c->last_busy[i] = info->busy[i];
> +		c->u[i].delta_busy = info->busy[i] - c->u[i].last_busy;

Another tiny bike shed to consider c->util, or c->utilization. I find 
'u' needlessly short but no big deal either way.

Regards,

Tvrtko

> +		c->last_runtime += c->u[i].delta_busy;
> +		c->u[i].last_busy = info->busy[i];
>   	}
>   
>   	/* Memory regions */
> @@ -183,11 +183,9 @@ igt_drm_client_add(struct igt_drm_clients *clients,
>   		c->engines->max_engine_id = i;
>   	}
>   
> -	c->delta_busy = calloc(c->engines->max_engine_id + 1,
> -			       sizeof(*c->delta_busy));
> -	c->last_busy = calloc(c->engines->max_engine_id + 1,
> -			      sizeof(*c->last_busy));
> -	assert(c->delta_busy && c->last_busy);
> +	c->u = calloc(c->engines->max_engine_id + 1,
> +		      sizeof(*c->u));
> +	assert(c->u);
>   
>   	/* Memory regions */
>   	c->regions = calloc(1, sizeof(*c->regions));
> @@ -225,8 +223,7 @@ void igt_drm_client_free(struct igt_drm_client *c, bool clear)
>   	}
>   	free(c->engines);
>   
> -	free(c->delta_busy);
> -	free(c->last_busy);
> +	free(c->u);
>   
>   	if (c->regions) {
>   		for (i = 0; i <= c->regions->max_region_id; i++)
> diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
> index 06b29cfd1..5c6130ff1 100644
> --- a/lib/igt_drm_clients.h
> +++ b/lib/igt_drm_clients.h
> @@ -65,8 +65,10 @@ struct igt_drm_client {
>   	unsigned int samples; /* Count of times scanning updated this client. */
>   	unsigned long total_runtime; /* Aggregate busyness on all engines since client start. */
>   	unsigned long last_runtime; /* Aggregate busyness on all engines since previous scan. */
> -	unsigned long *delta_busy; /* Array of engine busyness data, relative to previous scan. */
> -	uint64_t *last_busy; /* Array of engine busyness data as parsed from fdinfo. */
> +	struct igt_drm_client_utilization {
> +		unsigned long delta_busy; /* Engine busyness data, relative to previous scan. */
> +		uint64_t last_busy; /* Engine busyness data as parsed from fdinfo. */
> +	} *u; /* Array of engine utilization */
>   	struct drm_client_meminfo *memory; /* Array of region memory utilisation as parsed from fdinfo. */
>   };
>   
> diff --git a/tools/gputop.c b/tools/gputop.c
> index 2946aaa5e..bca7f4bc7 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -208,7 +208,7 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
>   		if (!c->engines->capacity[i])
>   			continue;
>   
> -		pct = (double)c->delta_busy[i] / period_us / 1e3 * 100 /
> +		pct = (double)c->u[i].delta_busy / period_us / 1e3 * 100 /
>   		      c->engines->capacity[i];
>   
>   		/*
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index adc95a95e..a4aa8414b 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -893,9 +893,9 @@ static struct igt_drm_clients *display_clients(struct igt_drm_clients *clients)
>   			strcpy(ac->pid_str, c->pid_str);
>   			strcpy(ac->print_name, c->print_name);
>   			ac->engines = c->engines;
> -			ac->delta_busy = calloc(c->engines->max_engine_id + 1,
> -						sizeof(ac->delta_busy[0]));
> -			assert(ac->delta_busy);
> +			ac->u = calloc(c->engines->max_engine_id + 1,
> +				       sizeof(*ac->u));
> +			assert(ac->u);
>   			ac->regions = c->regions;
>   			ac->memory = calloc(c->regions->max_region_id + 1,
>   					    sizeof(ac->memory[0]));
> @@ -912,7 +912,7 @@ static struct igt_drm_clients *display_clients(struct igt_drm_clients *clients)
>   		ac->last_runtime += c->last_runtime;
>   
>   		for (i = 0; i <= c->engines->max_engine_id; i++)
> -			ac->delta_busy[i] += c->delta_busy[i];
> +			ac->u[i].delta_busy += c->u[i].delta_busy;
>   
>   		for (i = 0; i <= c->regions->max_region_id; i++) {
>   			ac->memory[i].total += c->memory[i].total;
> @@ -946,7 +946,7 @@ static void free_display_clients(struct igt_drm_clients *clients)
>   	 * or borrowed fields which we don't want the library to try and free.
>   	 */
>   	igt_for_each_drm_client(clients, c, tmp) {
> -		free(c->delta_busy);
> +		free(c->u);
>   		free(c->memory);
>   	}
>   
> @@ -2161,7 +2161,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
>   				continue;
>   			}
>   
> -			pct = (double)c->delta_busy[i] / period_us / 1e3 * 100;
> +			pct = (double)c->u[i].delta_busy / period_us / 1e3 * 100;
>   
>   			/*
>   			 * Guard against possible time-drift between sampling
> @@ -2235,7 +2235,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
>   					 iclients->classes.names[i]);
>   				pops->open_struct(buf);
>   
> -				pct = (double)c->delta_busy[i] / period_us / 1e3 * 100;
> +				pct = (double)c->u[i].delta_busy / period_us / 1e3 * 100;
>   				snprintf(buf, sizeof(buf), "%f", pct);
>   				__json_add_member("busy", buf);
>   
