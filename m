Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC80CAC5A7
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 15:00:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BBE10E1D3;
	Tue, 23 Sep 2025 15:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LyAo3od3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D47510E1C9
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 15:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758639645; x=1790175645;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BpxvYmcA58gSHiui5OwGgIJ3FF7fByWEqjJJ7CZlSfs=;
 b=LyAo3od3AryJY4/cE71ig0St1t8ZRgKf5EBxIGHubmlg9BqG+Buy7Ods
 QXs0sJWlQODZN607OYY2uqtj3X7+I5wo/I43a4pYsPvY5ODlpzWcLLBVM
 ogOkxANlt47evRfJ/S2YXoXnuho+xk8hhUBJRj7XKocVslmvUEHwiYoAm
 xtJX7hynx+V/vZIf55bEpB3uMmk9L0mgWlD29i74arWUUL8CKO6Rw+34a
 ey8nJBNCbCMwu7K9LnEC8fFDT4DBqr39FuG/LyKh7+TrZ26sZFNqPtDDd
 nIScBUeqqA26GA9+HPVQpo7Ek0OsccjZkIPSmAIJnw/bBPyJ0A5FBK6bk Q==;
X-CSE-ConnectionGUID: Isrw099hRXSC+eGZPlIbAA==
X-CSE-MsgGUID: /BKdne2VTaq7jgJ1/QBh7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64748866"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="64748866"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 08:00:44 -0700
X-CSE-ConnectionGUID: MHpJ5VdZSC+u9/BegM1lrw==
X-CSE-MsgGUID: kbmyYOR5S0CZsfCGetF9SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="176725786"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.246.115])
 ([10.245.246.115])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 08:00:43 -0700
Message-ID: <e89d8039-f066-4c77-af79-549b01a3067c@intel.com>
Date: Tue, 23 Sep 2025 17:00:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 i-g-t 2/6] lib/xe_eudebug: Don't fail in __wait_token
 if pipe was broken
To: =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
References: <20250923131002.24708-1-dominik.karol.piatkowski@intel.com>
 <20250923131002.24708-3-dominik.karol.piatkowski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250923131002.24708-3-dominik.karol.piatkowski@intel.com>
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

On 23.09.2025 15:09, Dominik Karol Piątkowski wrote:
> If safe_pipe_read returns -EPIPE, print it and let the upper layer
> decide if this is acceptable. This will allow for debugging if something
> goes wrong, while reducing the false tripping of tests in which a dead
> client can occur.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>   lib/xe/xe_eudebug.c | 25 +++++++++++++++++++++++--
>   lib/xe/xe_eudebug.h |  2 ++
>   2 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 8e5664496..deaea25cd 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -296,12 +296,18 @@ static void pipe_close(int pipe[2])
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
> +	if (ret == -EPIPE) {
> +		igt_info("safe_pipe_read returned -EPIPE!\n");
> +		return DEAD_CLIENT;
> +	}
>   	igt_assert_f(ret > 0,
>   		     "Pipe read timeout waiting for token '%s:(%" PRId64 ")'\n",
>   		     token_to_str(token), token);

I don't want to sneak in unrelated changes, but since you are altering 
the return value of 'safe_pipe_read' and adding code that interprets the 
new values you could also fix this printout so it prints:
1. ("Pipe read failed with error: %d waiting for token", -errno) if (ret 
< 0)
2. "Pipe read failed: EOF" if (ret == 0)

Regards,
Christoph


> @@ -309,6 +315,10 @@ static uint64_t __wait_token(int pipe[2], const uint64_t token, int timeout_ms)
>   	igt_assert_eq(in, token);
>   
>   	ret = safe_pipe_read(pipe, &in, sizeof(in), timeout_ms);
> +	if (ret == -EPIPE) {
> +		igt_info("safe_pipe_read returned -EPIPE!\n");
> +		return DEAD_CLIENT;
> +	}
>   	igt_assert_f(ret > 0,
>   		     "Pipe read timeout waiting for token value '%s:(%" PRId64 ")'\n",
>   		     token_to_str(token), token);
> @@ -318,12 +328,22 @@ static uint64_t __wait_token(int pipe[2], const uint64_t token, int timeout_ms)
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
> @@ -1402,6 +1422,7 @@ struct xe_eudebug_client *xe_eudebug_client_create(int master_fd, xe_eudebug_cli
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

