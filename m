Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A24DCAC5B0
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 11:29:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF13410E147;
	Mon, 29 Sep 2025 11:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X5ilHizy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB5410E147
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 11:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759145373; x=1790681373;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CGNPvwy8weJWw0tsrR3LisXq/LjAUNINGgDi5ykQ3d8=;
 b=X5ilHizy0jC5cKtqfDtRlq/J3LvHdooxZfJxOBu9ER7GIdmM2UDPIxrD
 aaCTJOVg4V0LzO6CoW+sA86UD9fah1MOXpiSgRhdrW1GnDelbOHCXFt7a
 1ab9pBA9rzPgy+7Bg2blq74XCIbedRQCBEFKpwDxiDtnIPeJKaJ95Efw1
 du2FrLnSRHsn0rPU0ep8wkTHjojpEzXR+p2DXDnXVwKcAKkNy7RyZLo25
 YHtIPHw9tI3NHRrfuZ7WBqCz+Zjzn10xzqTZXksevByPCgsSXDmNUIezW
 vVotjW1eHDsiHPw2LgmbP52gVNBI971ZgXhHCkK6TwRfXWPTslkR9Vc8c w==;
X-CSE-ConnectionGUID: jV/hLTDHRsmMc5QJSa6o0Q==
X-CSE-MsgGUID: rNA5LR8QRiiPmTuJgW19Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="60595442"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="60595442"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 04:29:32 -0700
X-CSE-ConnectionGUID: bRQJYVFpTD29l59vj21kcg==
X-CSE-MsgGUID: hcPDMXN2RcKPj8FHob4/0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="177817073"
Received: from cmanszew-mobl2.igk.intel.com (HELO [172.28.180.190])
 ([172.28.180.190])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 04:29:31 -0700
Message-ID: <3efd46f4-43a4-4dfd-b5fb-c2807eeb4f4b@intel.com>
Date: Mon, 29 Sep 2025 13:29:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 i-g-t 2/9] lib/xe_eudebug: Don't fail in __wait_token
 if pipe was broken
To: =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
References: <20250926074801.9031-1-dominik.karol.piatkowski@intel.com>
 <20250926074801.9031-3-dominik.karol.piatkowski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250926074801.9031-3-dominik.karol.piatkowski@intel.com>
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

Hi Dominik,

On 26.09.2025 09:47, Dominik Karol Piątkowski wrote:
> If safe_pipe_read returns -errno, print it and let the upper layer
> decide if this is acceptable. This will allow for debugging if something
> goes wrong, while reducing the false tripping of tests in which a dead
> client can occur.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>   lib/xe/xe_eudebug.c | 39 +++++++++++++++++++++++++++++++--------
>   lib/xe/xe_eudebug.h |  2 ++
>   2 files changed, 33 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index d29c82857..0c3262c41 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -296,34 +296,56 @@ static void pipe_close(int pipe[2])
>   		close(pipe[1]);
>   }
>   
> +#define DEAD_CLIENT 0xccccdead
> +
>   static uint64_t __wait_token(int pipe[2], const uint64_t token, int timeout_ms)
>   {
>   	uint64_t in;
>   	int ret;
>   
>   	ret = safe_pipe_read(pipe, &in, sizeof(in), timeout_ms);
> -	igt_assert_f(ret > 0,
> -		     "Pipe read timeout waiting for token '%s:(%" PRId64 ")'\n",
> -		     token_to_str(token), token);
> +	if (ret < 0) {
> +		igt_info("Pipe read failed with error: %d waiting for token '%s:(%" PRId64 ")'\n",
> +			 ret, token_to_str(token), token);

igt_info seems quite loud considering that this error may be expected 
and will get passed down to another library function to decide what to 
do with it.

Nit: I think "Pipe poll" would be better here, with "Pipe read" bellow. 
Or just use the function name in both cases that is 'safe_pipe_read'.

With that:
Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Regards,
Christoph


> +		return DEAD_CLIENT;
> +	} else if (ret == 0) {
> +		igt_info("Pipe read failed: EOF\n");
> +		return DEAD_CLIENT;
> +	}
>   
>   	igt_assert_eq(in, token);
>   
>   	ret = safe_pipe_read(pipe, &in, sizeof(in), timeout_ms);
> -	igt_assert_f(ret > 0,
> -		     "Pipe read timeout waiting for token value '%s:(%" PRId64 ")'\n",
> -		     token_to_str(token), token);
> +	if (ret < 0) {
> +		igt_info("Pipe read failed with error: %d waiting for token '%s:(%" PRId64 ")'\n",
> +			 ret, token_to_str(token), token);
> +		return DEAD_CLIENT;
> +	} else if (ret == 0) {
> +		igt_info("Pipe read failed: EOF\n");
> +		return DEAD_CLIENT;
> +	}
>   
>   	return in;
>   }
>   
>   static uint64_t client_wait_token(struct xe_eudebug_client *c, const uint64_t token)
>   {
> -	return __wait_token(c->p_in, token, c->timeout_ms);
> +	uint64_t ret = __wait_token(c->p_in, token, c->timeout_ms);
> +
> +	if (ret == DEAD_CLIENT)
> +		igt_assert(c->allow_dead_client);
> +
> +	return ret;
>   }
>   
>   static uint64_t wait_from_client(struct xe_eudebug_client *c, const uint64_t token)
>   {
> -	return __wait_token(c->p_out, token, c->timeout_ms);
> +	uint64_t ret = __wait_token(c->p_out, token, c->timeout_ms);
> +
> +	if (ret == DEAD_CLIENT)
> +		igt_assert(c->allow_dead_client);
> +
> +	return ret;
>   }
>   
>   static void token_signal(int pipe[2], const uint64_t token, const uint64_t value)
> @@ -1402,6 +1424,7 @@ struct xe_eudebug_client *xe_eudebug_client_create(int master_fd, xe_eudebug_cli
>   	c->ptr = data;
>   	c->master_fd = master_fd;
>   	c->timeout_ms = XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * MSEC_PER_SEC;
> +	c->allow_dead_client = false;
>   	pthread_mutex_init(&c->lock, NULL);
>   
>   	igt_fork(child, 1) {
> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
> index 3adde5f6c..8f7f66220 100644
> --- a/lib/xe/xe_eudebug.h
> +++ b/lib/xe/xe_eudebug.h
> @@ -66,6 +66,8 @@ struct xe_eudebug_client {
>   
>   	int timeout_ms;
>   
> +	bool allow_dead_client;
> +
>   	pthread_mutex_t lock;
>   };
>   

