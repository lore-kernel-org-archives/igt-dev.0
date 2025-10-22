Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95859CCD1AB
	for <igt-dev@archiver.kernel.org>; Wed, 22 Oct 2025 12:08:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D2D10E008;
	Wed, 22 Oct 2025 12:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQZHC6rX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9922E10E008
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Oct 2025 12:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761134909; x=1792670909;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9iHbfPiuxMsJeyx90zI/E+6oRQqjl3HkIru9g3gzxak=;
 b=DQZHC6rXFtiwgemfVC6ZgNOadG8dPqGA4UYTwqEHdBxf63z5uqqD2xbJ
 qTptouy7/oU45ViQ7/PL13xebY+5hLP+PvTqwIGJP6nS9k2unVWdUKyKn
 Mebbmdq+yRGVn4QavIGEehqERywfqEJVs+bvPCTfSQZG01azpzCUzK569
 Ok5b3HN4qaWg9Q6EUxbWhINceb3Z3wAzNp706FGzcUOd3haAyddys5uSH
 or/mjHk23fVR8fUV1H1iSiOKWRt74BkemzIEChJVmE42tSWOF54D0JmtZ
 YMEgpwz2vPwU7CoCmlzm2ty8vqbbDEIEaA8V4GrQ4atGFyskzZlmq5Pvd w==;
X-CSE-ConnectionGUID: 8an4ZEs5Sj6F+bKek2rZ1Q==
X-CSE-MsgGUID: JJG76q7UQzCfB88fplmSsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63201137"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63201137"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 05:08:29 -0700
X-CSE-ConnectionGUID: GRZZ/ni9TqSYoZNHGsU5Ew==
X-CSE-MsgGUID: 3CxSzq4URemIcCCiAUe2Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="183443410"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.180.164])
 ([172.28.180.164])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 05:08:29 -0700
Message-ID: <bc476d7f-8ddb-4744-a3f5-7da2b5edad00@linux.intel.com>
Date: Wed, 22 Oct 2025 14:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_reset: Fix uninitialized var
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20251022114655.70478-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20251022114655.70478-1-kamil.konieczny@linux.intel.com>
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


On 10/22/2025 1:46 PM, Kamil Konieczny wrote:
> Fix var used without initialization.
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   tests/intel/xe_exec_reset.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 9bed79af5..591e3e448 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -719,7 +719,7 @@ static void threads(int fd, int n_exec_queues, int n_execs, unsigned int flags)
>   	struct drm_xe_engine_class_instance *hwe;
>   	pthread_mutex_t mutex;
>   	pthread_cond_t cond;
> -	int n_engines = 0, i;
> +	int n_engines = 0, i = 0;
>   	bool go = false;
>   
>   	xe_for_each_engine(fd, hwe) {

LGTM,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

