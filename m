Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EBBC3ABC0
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 07:53:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D0810E15F;
	Wed,  7 May 2025 07:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e1fu1ryf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF4A10E15F
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 07:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746604409; x=1778140409;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=E7SdKC/EDx8eKqI/etQq7NMj3ImwiKJZ9ykGqT3cOmk=;
 b=e1fu1ryfgETIWTynT3s/XYWKmcbgLA11mTtXwO4FC+O/vGEimauSIuJr
 j3bYjA4pxGrjWsGtJtToIPKBUvGCF3LXAgLKh3WdpxvkIzLAUoWtk4YoY
 6nQcV2O7j6a7cAzJoX0BIAQeO4540fTf38MIrUGTumluwooHmDOwCzz5Y
 Q6LunDO6aToo615f/mJmbcn7D9ibgv26otUT0jTCvi91ac3hv9bYhlPFC
 R0pwMpQs9Oh6ypGvz1g6vDoxHInaQMF/i9jQ/WqOZm9yAFrBgMWjAQmgJ
 z1+3sVDYxARYYOY+wKlP06otqzoDPUzgdeBQiF6T9SUg+Ag93os+ScFFQ g==;
X-CSE-ConnectionGUID: WImIuriJQwuimhEJ40SyPQ==
X-CSE-MsgGUID: Xjnn4J4XS8yBK6c+NGPMgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="47417338"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="47417338"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 00:53:27 -0700
X-CSE-ConnectionGUID: JTeqrIJAQCy19aG9BGc9GQ==
X-CSE-MsgGUID: A8K/fuvDRnmKkqBMLRUVyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="140835616"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:53:26 -0700
Date: Wed, 7 May 2025 09:53:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: aditya.chauhan@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Add GPU
 platform PTL for sys allocator tests
Message-ID: <20250507075310.jwdsl47yep4uxtud@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 aditya.chauhan@intel.com, igt-dev@lists.freedesktop.org
References: <20250507062359.61919-1-aditya.chauhan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250507062359.61919-1-aditya.chauhan@intel.com>
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

Hi aditya.chauhan,
On 2025-05-07 at 11:53:59 +0530, aditya.chauhan@intel.com wrote:
> From: Aditya Chauhan <aditya.chauhan@intel.com>
> 
> Add PTL to the list of GPUs applicable for the test
> 
> Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tahvanainen, Jari <jari.tahvanainen@intel.com>

Should be:
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>

this could be corrected at merge so

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_exec_system_allocator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index c2daf3712..bae8144ef 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -9,7 +9,7 @@
>   * Mega feature: USM
>   * Sub-category: System allocator
>   * Functionality: fault mode, system allocator
> - * GPU: LNL, BMG, PVC
> + * GPU: LNL, BMG, PVC, PTL
>   */
>  
>  #include <fcntl.h>
> -- 
> 2.34.1
> 
