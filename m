Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8059EC54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 12:44:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3E910E1A1;
	Tue,  5 Mar 2024 12:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kr11e3T1";
	dkim-atps=neutral
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078FF10F2D9
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 12:44:36 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-33e1878e357so2732850f8f.3
 for <igt-dev@lists.freedesktop.org>; Tue, 05 Mar 2024 04:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709642675; x=1710247475; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ohKe5QpsZK0i3AuCqx5TvWfw6OJF1JDk3ryOP63EbXM=;
 b=kr11e3T1obwl7j/KwKOwFTcQQUa/kGrMUb+NjavXYMdqHQQVlVdH7YS9i3/vrn15uo
 yWs6k5sZbNzRLgfHH07yTcLaZAWbDQCbXdzbRRDXVIJyXaAK78fUMK2otKfuZTxlWUMN
 oAuYbFIIScwjfe4oWbo9h7sQ2kvKgsi5ZwEgVMdw1xJUyG2+hyGqlNC370OXaO+3SH6E
 Jxy1+LNjzHTWX8QQwON3xVhGfxregckHAI+knUbOxNW0E19dEZAAAByszgpBCpfL3wI2
 D0xgDnmHws09LpdtPjvuJQTQCYeHjTPwWh9Uvv5EUb5+7Fyy6lPy9ngbr12YcGnMz5Dn
 RP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709642675; x=1710247475;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ohKe5QpsZK0i3AuCqx5TvWfw6OJF1JDk3ryOP63EbXM=;
 b=Xa7Hpsnhv3aD9w6F6H+xidvxVglQiOr0Bccyenez0j1zdjjYaBZ55N9ValH4psfW/F
 /KcothXQDmORXvYcN14YzKJD2GP87uPL9FjHfJYaHs2Je5TeFXzucm6b9AIYRrfq+wse
 h0fTCnRD4n00MDTyVp1umf5bLYmCSlUIWNbPP7TQQVu1bEBBYO0qVGIit8qs986ac8zM
 iA+KzMxq4kw0MM7vCn7PF70UX5aqQgNxvIC+eRuh1z3QKur0S9sc/Bd3RmHu3r6iIxRi
 QoK+QfKuXmY3wUx6oX3eRoFenOHjMqHXIwIbNZpR56aUF6IQY/0S5MM9AVuRPJH35JuB
 sURg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXRLSztZZaTZPxZab/cRg1rD/sSmlezSL+13eJANz61R/X6+z0advBPzvdwVTqOQ+BfbKHV4Tt1cqrvVOgYQZgzzRQTe4AEmxBWM3qpw==
X-Gm-Message-State: AOJu0YxPE8qauIKVgnLWeS7XsYme960u0uEqJ4nPF9yFHL7qEnK3hkB5
 /mtlS0SM9CQLeV+Wx7H5AsSeOaX9pORgr8F+lvXV/MLseUoxtxbrxuZXotRyrXKDVg==
X-Google-Smtp-Source: AGHT+IFviaxgXZGtYybZSHUTc2dEbbPOVHvjbpEoL3qDtxClsUyMHMPkOy8pjQ85tAkyGlcaGzmGuA==
X-Received: by 2002:a5d:5443:0:b0:33d:f46f:6384 with SMTP id
 w3-20020a5d5443000000b0033df46f6384mr8386311wrv.23.1709642674489; 
 Tue, 05 Mar 2024 04:44:34 -0800 (PST)
Received: from [0.0.0.0] ([134.134.139.87])
 by smtp.googlemail.com with ESMTPSA id
 l9-20020a056000022900b0033cf2063052sm14801304wrz.111.2024.03.05.04.44.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 04:44:34 -0800 (PST)
Message-ID: <ede35d2e-2490-4a7d-9368-a3ca8eac2649@gmail.com>
Date: Tue, 5 Mar 2024 14:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_atomic: fix musl compilation
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240304164354.112440-1-kamil.konieczny@linux.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240304164354.112440-1-kamil.konieczny@linux.intel.com>
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
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 4.3.2024 18.43, Kamil Konieczny wrote:
> On musl there is already defined PAGE_SIZE and it is casing
> compilation error:
> 
> ../tests/kms_atomic.c: In function 'crtc_invalid_params_fence'
> ../tests/kms_atomic.c:893:25: error: expected identifier or '(' before numeric constant
>    893 |         const ptrdiff_t PAGE_SIZE = sysconf(_SC_PAGE_SIZE);
> 
> Change this variable name in order to fix it.
> 
> Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   tests/kms_atomic.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index 96cd58571..489b0d709 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -890,7 +890,7 @@ static void crtc_invalid_params_fence(data_t *data, igt_output_t *output)
>   {
>   	int timeline, fence_fd;
>   	void *map;
> -	const ptrdiff_t PAGE_SIZE = sysconf(_SC_PAGE_SIZE);
> +	const ptrdiff_t page_size = sysconf(_SC_PAGE_SIZE);
>   	uint64_t old_mode_id = data->pipe->values[IGT_CRTC_MODE_ID];
>   
>   	igt_require_sw_sync();
> @@ -898,28 +898,28 @@ static void crtc_invalid_params_fence(data_t *data, igt_output_t *output)
>   	timeline = sw_sync_timeline_create();
>   
>   	/* invalid out_fence_ptr */
> -	map = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
> +	map = mmap(NULL, page_size, PROT_READ, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
>   	igt_assert(map != MAP_FAILED);
>   
>   	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)map);
>   	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EFAULT);
> -	munmap(map, PAGE_SIZE);
> +	munmap(map, page_size);
>   
>   	/* invalid out_fence_ptr */
> -	map = mmap(NULL, PAGE_SIZE, PROT_EXEC, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
> +	map = mmap(NULL, page_size, PROT_EXEC, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
>   	igt_assert(map != MAP_FAILED);
>   
>   	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)map);
>   	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EFAULT);
> -	munmap(map, PAGE_SIZE);
> +	munmap(map, page_size);
>   
>   	/* invalid out_fence_ptr */
> -	map = mmap(NULL, PAGE_SIZE, PROT_NONE, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
> +	map = mmap(NULL, page_size, PROT_NONE, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
>   	igt_assert(map != MAP_FAILED);
>   
>   	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)map);
>   	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EFAULT);
> -	munmap(map, PAGE_SIZE);
> +	munmap(map, page_size);
>   
>   	/* valid in fence but not allowed prop on crtc */
>   	fence_fd = sw_sync_timeline_create_fence(timeline, 1);

