Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48053C61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 08:49:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB83A10E7B9;
	Thu, 12 Jun 2025 08:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aleCIh5X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070E210E7B9
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 08:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749718147; x=1781254147;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SoTFR5+nuRBFql23WmnhT2Vzz5I97wbf1IdkMv7J27Q=;
 b=aleCIh5Xv2/yhBv8sJfMCaSVO3eF+iPX3sUbLaj8t8Cf5JtGaNwjkhdD
 O49NbrDPvph3jYTjvqJCs14odY5Z8RtPDqeN/bMcGwlGy79y+6QasRWyl
 8sfUb1p+ZFCOoCf9uHn1Zv2cjCJ0v3B7IrwMDIEKu7vX4b6VqeAATwP6t
 05VUBwjnsflwuwz+bN/T2+hEj6LHsrSuqYO2fgvOlsEKACOPTLBllz1sJ
 d2WufDkJO+pQMGVk8cQlvjR5xcW6RAfMEUt/F4CNiQud8/zb6U2PwY0+y
 jTT++36VDMUiU9iqOpZYnKge3Mo8ECVCzQ0cIkZZjcw6JNXgXJ8GMvp1l g==;
X-CSE-ConnectionGUID: mJZI+v8KTLqVlXHtdtaZEw==
X-CSE-MsgGUID: o5BbQ1b1Qe2/CoUc+RR2TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51107450"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51107450"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 01:48:58 -0700
X-CSE-ConnectionGUID: azn2XwCuQ9WQ+09s+JAFcg==
X-CSE-MsgGUID: EH1LbGi/RvCplsPRKAUj8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="178365425"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 01:48:56 -0700
Date: Thu, 12 Jun 2025 10:48:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/intel/xe_exec_compute_mode: Fix assertion of batch
 buffer size
Message-ID: <20250612084835.45k2ziw5t6uk4loc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250612075843.3697019-1-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250612075843.3697019-1-shuicheng.lin@intel.com>
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

Hi Shuicheng,
On 2025-06-12 at 07:58:43 +0000, Shuicheng Lin wrote:
> The batch buffer pointer is data[EXEC_DATA] not data. Correct it in the assertion.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Nice catch,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_exec_compute_mode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
> index 8fba9daef..f321e1d76 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -393,7 +393,7 @@ static void non_block(int fd, int expect)
>  	data[EXEC_DATA].batch[b++] = sdi_addr >> 32;
>  	data[EXEC_DATA].batch[b++] = value;
>  	data[EXEC_DATA].batch[b++] = MI_BATCH_BUFFER_END;
> -	igt_assert(b <= ARRAY_SIZE(data->batch));
> +	igt_assert(b <= ARRAY_SIZE(data[EXEC_DATA].batch));
>  
>  	sync[0].addr = addr + (char *)&data[EXEC_DATA].exec_sync - (char *)data;
>  	exec.num_syncs = 0;
> -- 
> 2.25.1
> 
