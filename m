Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113FCE77179
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 16:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC4810F131;
	Fri,  6 Dec 2024 16:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9c2ATdl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8586E10F131
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 16:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733503895; x=1765039895;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nZ8id+gWqaN0NQDLWnEJizhj9a7Y5woqR79WpKUyu1E=;
 b=P9c2ATdlBM4x3DL7rFNNoxhw0KQBfReWDGo4JMCZV15FLBqMBoAKdiQ6
 AAoPCkEgCJTL5UEX0i94SmpjQZzsBntKmvrCJ+1/HUvWKaIlXvzQSTSJc
 4ZaOVx2Y4unXzxPhApTHE2t2d5vJ9OUJ65XIYKyl4WQ0Zf5nkKyvnHWOX
 I0Wdhsz9KESn9pbwL8B/R2jq08SfEhFrNQ6g/acNjQyzHNV8a6P253TBT
 n41z9R48BpiG8vYmYnZ8oHvZU2pyTbQ40BoN5F9zEa7wp6fgItTUVUHFZ
 7sqlAtoc+MhfJwV2GENhmQ77KgDGCLJJ4RFcYbtzWupjdTILeTBusce72 Q==;
X-CSE-ConnectionGUID: XQlx3v8OTs6D6vSYcgdI8A==
X-CSE-MsgGUID: p3yTB4dLS8mrCF4eAXwAxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="33746588"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="33746588"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 08:51:34 -0800
X-CSE-ConnectionGUID: X9yha35jRJaFLBQnxJxnuw==
X-CSE-MsgGUID: pt1StfCmRFOE7tc3NROveA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="125292346"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 08:51:34 -0800
Date: Fri, 6 Dec 2024 17:51:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/xe_exec_sip: increase timeout margin for tests
Message-ID: <20241206165130.boizrw7y3u4xpbfd@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20241206-xe_exec_sip_eudebug_increase_timeout_for_devcoredump-v1-1-6736edd67447@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241206-xe_exec_sip_eudebug_increase_timeout_for_devcoredump-v1-1-6736edd67447@intel.com>
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
On 2024-12-06 at 09:17:48 +0100, Andrzej Hajda wrote:
> In case engine reset happens 4s timeout margin sometimes is not enough
> and test fails. It happens mostly on LNL/BMG due to devcoredump creation.
> On CI it does not pass 5s, let's increase it to 8s to be on safe side.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_exec_sip_eudebug.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_sip_eudebug.c b/tests/intel/xe_exec_sip_eudebug.c
> index d056a14a2d7f..c317112b4154 100644
> --- a/tests/intel/xe_exec_sip_eudebug.c
> +++ b/tests/intel/xe_exec_sip_eudebug.c
> @@ -263,8 +263,8 @@ static void test_sip(enum shader_type shader_type, enum sip_type sip_type,
>  	debugger_enabled = xe_eudebug_debugger_available(fd);
>  	vm_id = xe_vm_create(fd, debugger_enabled ? DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
>  
> -	/* Get timeout for job, and add 4s to ensure timeout processes in subtest. */
> -	timeout = xe_sysfs_get_job_timeout_ms(fd, eci) + 4ull * MSEC_PER_SEC;
> +	/* Get timeout for job, and add 8s for devcoredump processing. */
> +	timeout = xe_sysfs_get_job_timeout_ms(fd, eci) + 8ull * MSEC_PER_SEC;
>  	timeout *= NSEC_PER_MSEC;
>  	timeout *= igt_run_in_simulation() ? 10 : 1;
>  
> 
> ---
> base-commit: e776f39da6b3666a2834f7e02a1eed9a87f21d74
> change-id: 20241206-xe_exec_sip_eudebug_increase_timeout_for_devcoredump-64e46bd9721d
> 
> Best regards,
> -- 
> Andrzej Hajda <andrzej.hajda@intel.com>
> 
