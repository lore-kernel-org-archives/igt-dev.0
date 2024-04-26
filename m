Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22E6C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 11:03:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47AF411218D;
	Fri, 26 Apr 2024 11:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="wYeiy8S7";
	dkim-atps=neutral
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782B011218D
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 11:03:55 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2dd6c14d000so23026851fa.0
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 04:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1714129433; x=1714734233;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zBSkt9ArBtkSDGMIAsjZMTp7fs3/e6UL3yFZZuu5UDY=;
 b=wYeiy8S7D0KZbnSUN5eAgkYChlx98efykRD23l9/QbeReJLP/xrB0y1P3jFN8utS9r
 HIJRY/Gobg+5TyX8LfBCWPG0L+xxWtIE/8uX3oTEb93Kncu08pRbq+zeLbQvUsrM/VWp
 gAEtu7sbm8nt/rqKoibvbclwdCkbqtAsTYZheG2LPW2IkNYPE7YLXNiVBQaqwDVdp2IJ
 H5ZROXGCHahwgms2RGz7eUSlLr4cjrRZ5l/lmZL5G4O9Hg5lqqQZMjMA829wWlduHL5P
 sC0PVo9jYzuGQZABKEDPORMiotQxBHQji2s1SH6JmSF3/T3wy29a+rU/VBqUkMtPUQoc
 lV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714129433; x=1714734233;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zBSkt9ArBtkSDGMIAsjZMTp7fs3/e6UL3yFZZuu5UDY=;
 b=Jdq0rZyn9ixs8YHd/wN7U/tNzAfTJKb6Dcq6rJLyLKpG/hge6PNNc+rUfajdxdyePC
 VhUEei4nb2FBi/SxP1ECYQmx48aCitjZOpoKO5DGNXmpRo8AxIxtf7v2yQWVHWG+RwCB
 dh7bFW80XmxEWf3RGxm6ZvSjWTJDFHizUlA0Wytu9zQoV64gGuzYo7YpVwrO0riRP0KO
 d0u/6tQ3JOjk0OuIvRmdDbwQrOW1GjRt2YcX7sbtyQiWkpmHzACmeqjordNQzIXYwvHX
 RT0SBFI1fUi2EXMrh56VyJJNcMtnfETgPJeaO/QCscgreJa044E4Va+pIvTEj6tYwlQJ
 PD1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH3vX+w1mEmJ8c0m64FcChD7EnMF/5UfS3kR0bN/4d2Ju1PCL6mKbOh8rAa81W+hTsGvElbwOdNKCofP2LbRDPmvcUwAyz6L0NhFfR1A==
X-Gm-Message-State: AOJu0YwwVFMNxb+onMPXE7HAYkryf0I/ZuKpdn8oNnGpJsRTmDHQCZAv
 bPcz/Ys1AVxV+/CTQvC2wKDAD2oUpcRMauoRD1ZX+iSPfZlOzs5sMSZm2zte5ck=
X-Google-Smtp-Source: AGHT+IHQRIXJ9KlPGrICVcplNp6QnTXRNUEsEms/0xAyQ7U3YC5BcoMrdBG68fgpeA0iEeC7F5Yofw==
X-Received: by 2002:a2e:9e07:0:b0:2de:4cb4:2601 with SMTP id
 e7-20020a2e9e07000000b002de4cb42601mr1520400ljk.43.1714129433275; 
 Fri, 26 Apr 2024 04:03:53 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c3b8600b0041892e839bcsm30848597wms.33.2024.04.26.04.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 04:03:52 -0700 (PDT)
Message-ID: <22e0e26a-8ecd-480b-926a-97334d1d61c8@ursulin.net>
Date: Fri, 26 Apr 2024 12:03:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 12/21] lib/igt_drm_fdinfo: Parse drm-total-cycles
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240423234431.1959354-1-lucas.demarchi@intel.com>
 <20240423234431.1959354-13-lucas.demarchi@intel.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240423234431.1959354-13-lucas.demarchi@intel.com>
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
> Parse drm-total-cycles and annotate what are the possible engine
> utilization types that can be used. Currently there are 2 possible ways
> to calculate utilization:
> 
> 1) via drm-engine, that uses the time and derive the utilization by
>     comparing to the CPU time
> 2) via drm-cycles + drm-total-cycles, that uses the GPU time
> 
> igt_drm_fdinfo just marks the presence of the keys, letting the caller
> decide which method to use.
> 
> It is assumed that if any drm-engine, drm-cycles or drm-total-cycles is
> available, it's available for all engines with non-zero utilization.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   lib/igt_drm_fdinfo.c | 9 +++++++++
>   lib/igt_drm_fdinfo.h | 8 ++++++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
> index 723e2e340..7a1485c66 100644
> --- a/lib/igt_drm_fdinfo.c
> +++ b/lib/igt_drm_fdinfo.c
> @@ -218,6 +218,7 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>   		       const char **name_map, unsigned int map_entries,
>   		       const char **region_map, unsigned int region_entries)
>   {
> +	bool has_cycles = false, has_total_cycles = false;
>   	bool regions_found[DRM_CLIENT_FDINFO_MAX_REGIONS] = { };
>   	bool engines_found[DRM_CLIENT_FDINFO_MAX_ENGINES] = { };
>   	unsigned int good = 0, num_capacity = 0;
> @@ -264,10 +265,15 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>   			idx = parse_engine(l + keylen, info,
>   					   name_map, map_entries, &val);
>   			UPDATE_ENGINE(idx, busy, val);
> +			info->dcut |= DCUT_ENGINE_TIME;
>   		} else if (strstartswith(l, "drm-cycles-", &keylen)) {
>   			idx = parse_engine(l + keylen, info,
>   					   name_map, map_entries, &val);
>   			UPDATE_ENGINE(idx, cycles, val);
> +		} else if (strstartswith(l, "drm-total-cycles-", &keylen)) {
> +			idx = parse_engine(l + keylen, info,
> +					   name_map, map_entries, &val);
> +			UPDATE_ENGINE(idx, total_cycles, val);
>   		} else if (strstartswith(l, "drm-total-", &keylen)) {
>   			idx = parse_region(l + keylen, info,
>   					   region_map, region_entries, &val);
> @@ -294,6 +300,9 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>   	if (good < 2 || (!info->num_engines && !info->num_regions))
>   		return 0; /* fdinfo format not as expected */
>   
> +	if (has_cycles && has_total_cycles)
> +		info->dcut |= DCUT_GPU_TOTAL_CYCLES;
> +
>   	return good + info->num_engines + num_capacity + info->num_regions;
>   }
>   
> diff --git a/lib/igt_drm_fdinfo.h b/lib/igt_drm_fdinfo.h
> index 17a47f94a..4fbd7fe08 100644
> --- a/lib/igt_drm_fdinfo.h
> +++ b/lib/igt_drm_fdinfo.h
> @@ -41,6 +41,11 @@ struct drm_client_meminfo {
>   	uint64_t active;
>   };
>   
> +enum drm_client_utilization_type {
> +	DCUT_ENGINE_TIME	= 1U << 0,
> +	DCUT_GPU_TOTAL_CYCLES	= 1U << 1,
> +};

Liking the series so far but of course bike shed moment to maybe 
consider being verbose and call these DRM_CLIENT_FDINFO_...

Regards,

Tvrtko

> +
>   struct drm_client_fdinfo {
>   	char driver[128];
>   	char pdev[128];
> @@ -51,10 +56,13 @@ struct drm_client_fdinfo {
>   	unsigned int capacity[DRM_CLIENT_FDINFO_MAX_ENGINES];
>   	char names[DRM_CLIENT_FDINFO_MAX_ENGINES][256];
>   
> +	enum drm_client_utilization_type dcut;
>   	/* drm-engine-<engine> values */
>   	uint64_t busy[DRM_CLIENT_FDINFO_MAX_ENGINES];
>   	/* drm-cycles-<engine> values */
>   	uint64_t cycles[DRM_CLIENT_FDINFO_MAX_ENGINES];
> +	/* drm-total-cycles-<engine> values */
> +	uint64_t total_cycles[DRM_CLIENT_FDINFO_MAX_ENGINES];
>   
>   	unsigned int num_regions;
>   	unsigned int last_region_index;
