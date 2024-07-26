Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97959C3DA7F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 11:45:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E73110E238;
	Fri, 26 Jul 2024 11:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tx6rb3Xh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA1910E238
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2024 11:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721994319; x=1753530319;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=f/++PPzz5wtwzL1ZduVDznas2ypO3JCAzI0g8tVrhk4=;
 b=Tx6rb3XhecZrUl4m+2qLs10gqhVNB220LtUH3OMPhpi3IpT1G9FbniQ3
 KPBsOiOaI3XR6aouh9ykAUX/pNQVo4MfwPnSzbTitD3YpmtjS8yyStQCk
 ZNxAiG1emra6YZ/mmAqHhTgaETFR3tmvVPijgAR8ljc83HMjjV3JrAoCg
 cP7tiAMZMlYSWmv2opgjR5N35wPxqLbJXvYwnS1L+yuE9JipO/wKH035V
 XFh+Lk2uCTA54q7ysq5vA+L3OnPnBNNa8+7BOCWk/4Px53c5wTfsdaJDy
 Alkq4ve2Vr49WO+sfTbCmjgVs3wjYbfu3+i5d9zjrGU05sxdXxgAVL1tk A==;
X-CSE-ConnectionGUID: Z/Gpj89+TGeF/ul3O8vBnw==
X-CSE-MsgGUID: Z+4NeqnITW2tiNcoNAg8Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19922227"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="19922227"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 04:45:18 -0700
X-CSE-ConnectionGUID: ZcPPIYDcRrSuODeHYJTBcQ==
X-CSE-MsgGUID: WOhsIPKkT2msQXho4nyA3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="90723331"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 04:45:18 -0700
Date: Fri, 26 Jul 2024 13:45:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH] tests/intel/xe_exec_threads: decrease number of batches
 for simulation
Message-ID: <20240726114514.bf2wflgjdmqf7fll@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <20240726-xe_exec_threads_limit_simul-v1-1-4c3f6e8da448@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240726-xe_exec_threads_limit_simul-v1-1-4c3f6e8da448@intel.com>
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

Hi Andrzej,
On 2024-07-26 at 10:24:19 +0200, Andrzej Hajda wrote:
> Tests like threads-mixed-shared-vm-rebind takes significantly longer time
> on simulation due to high number of batches - 6-8 minutes vs few seconds
> on hw. As a result CI tests frequently fails due to timeout.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_exec_threads.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index e7a0a7cd0692..9a37730a9615 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -944,6 +944,7 @@ static void *thread(void *data)
>  
>  static void threads(int fd, int flags)
>  {
> +	int n_execs = igt_run_in_simulation() ? 256 : 1024;
>  	struct thread_data *threads_data;
>  	struct drm_xe_engine_class_instance *hwe;
>  	uint64_t addr = 0x1a0000;
> @@ -1002,8 +1003,7 @@ static void threads(int fd, int flags)
>  		threads_data[i].eci = hwe;
>  #define N_EXEC_QUEUE	16
>  		threads_data[i].n_exec_queue = N_EXEC_QUEUE;
> -#define N_EXEC		1024
> -		threads_data[i].n_exec = N_EXEC;
> +		threads_data[i].n_exec = n_execs;
>  		threads_data[i].flags = flags;
>  		if (flags & MIXED_MODE) {
>  			threads_data[i].flags &= ~MIXED_MODE;
> @@ -1050,7 +1050,7 @@ static void threads(int fd, int flags)
>  						vm_legacy_mode;
>  					threads_data[i].class = class;
>  					threads_data[i].n_exec_queue = N_EXEC_QUEUE;
> -					threads_data[i].n_exec = N_EXEC;
> +					threads_data[i].n_exec = n_execs;
>  					threads_data[i].flags = flags;
>  					threads_data[i].flags &= ~BALANCER;
>  					threads_data[i].flags |= *data_flags;
> 
> ---
> base-commit: 0471a1097444389a901d78b260c24eaf4fc2d7df
> change-id: 20240726-xe_exec_threads_limit_simul-3dc20e0deac3
> 
> Best regards,
> -- 
> Andrzej Hajda <andrzej.hajda@intel.com>
> 
