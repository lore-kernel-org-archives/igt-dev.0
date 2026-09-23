Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D49C9830C
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 13:47:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDCC10E0E0;
	Wed, 23 Sep 2026 13:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TdSooyxR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D28A10E0E0
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 13:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790171205; x=1821707205;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IJpfQoUEUUbBSgdBMtysYhw6ErEi54eGSfy9eQk1R1Y=;
 b=TdSooyxRy4hGEtq+uhCNBIg8Th1sYoqMSPvS3lifb7l6lzKZM64zF5A8
 U767v2xXD3ohPI9XVOVxflIqyO0W4VKVFGNe2UwZwJaWq4kZXw/QAbcdF
 sJNP4LUHBcXJjqdUOxm42IfG7U3hbBSHyaDoYC+hI6b6Ns3c5xe0xiSzX
 Yx+0EQA9xAyKLidJubnfB8boU7TfPq4MOCia7vrZwg1FT2RwaJlsLbZoz
 wCmjTgX+/8OwF4ruWkTnkNrR6lU5Lod99k3YCLFl8M62A5kmkgYCsTBMx
 lde1K0+ntVe9WCaBVNf1LRKdXPsnGLXp/sZTCUR/h+HyHiXsC4AQ1ncVS Q==;
X-CSE-ConnectionGUID: XMygkP7WT/iBcLkm+pxnnA==
X-CSE-MsgGUID: ND1CuK1ESfq51r9dp6akSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="116390270"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="116390270"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 06:46:45 -0700
X-CSE-ConnectionGUID: iHSJLa20Q+a8o/p5v68d2g==
X-CSE-MsgGUID: foJqHjl9Rm6Qykm0QpXcdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="301549089"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 06:46:43 -0700
Date: Wed, 23 Sep 2026 15:46:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com,
 Ramadevi Gandi <ramadevi.gandi@intel.com>
Subject: Re: [PATCH v3] intel-ci: blocklist multi-queue tests on BMG, LNL,
 PTL and WCL
Message-ID: <20260923134641.vaayj4jhcjlz7byk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 shivtej.eknath.patil@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, nishit.sharma@intel.com,
 smitha.balasubramanyam@intel.com,
 Ramadevi Gandi <ramadevi.gandi@intel.com>
References: <20260923045308.13972-1-shivtej.eknath.patil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923045308.13972-1-shivtej.eknath.patil@intel.com>
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

Hi Shivtej,
On 2026-09-23 at 04:53:08 +0000, shivtej.eknath.patil@intel.com wrote:
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>
> 
> The multi-queue subtests require xe_has_multi_queue_engine(fd).
> On BMG, LNL, PTL and WCL platforms these tests are expected to skip because
> multi-queue engine support is not available.
> 
> Add blocklist entries to suppress expected CI failures.
> 

+cc Ramadevi Gandi <ramadevi.gandi@intel.com>

> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel-ci/xe.bmg.core.blocklist.txt | 12 +++++-------
>  tests/intel-ci/xe.lnl.core.blocklist.txt | 12 +++++-------
>  tests/intel-ci/xe.ptl.core.blocklist.txt | 10 +++++-----
>  3 files changed, 15 insertions(+), 19 deletions(-)
> 
> diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-ci/xe.bmg.core.blocklist.txt
> index cd38d16f8..f83b544cb 100644
> --- a/tests/intel-ci/xe.bmg.core.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
> @@ -39,13 +39,6 @@ igt@xe_compute@ccs-mode-basic
>  ##################################################################
>  igt@xe_vm@.*export.*
>  ##################################################################
> -# Tests not applicable for the platform
> -##################################################################
> -igt@xe_exec_multi_queue@.*
> -igt@xe_evict@.*multi(-)?queue.*
> -igt@.*@.*-multi_queue
> -igt@.*@.*multi-queue.*
> -##################################################################
>  # Expected skips, Kernel support not available
>  ##################################################################
>  igt@xe_eudebug@.*
> @@ -80,3 +73,8 @@ igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
>  ##################################################################
>  igt@xe_pm@d3hot-i2c
>  ##################################################################
> +# Expected skip on BMG due to unsupported multi-queue capability
> +# Multi-queue is not supported on platforms older than xe3p
> +##################################################################
> +igt@.*multi.queue.*
> +##################################################################
> diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
> index c830ac3c8..88115ec22 100644
> --- a/tests/intel-ci/xe.lnl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
> @@ -81,13 +81,6 @@ igt@xe_compute@ccs-mode-compute-kernel
>  ##################################################################
>  igt@xe_vm@.*export.*
>  ##################################################################
> -# Tests not applicable for the platform
> -##################################################################
> -igt@xe_evict@.*multiqueue.*
> -igt@xe_exec_multi_queue@.*
> -igt@.*@.*-multi_queue
> -igt@.*@.*multi-queue.*
> -##################################################################
>  # Kernel support not available
>  ##################################################################
>  igt@xe_eudebug@.*
> @@ -108,3 +101,8 @@ igt@xe_module_load@force-load
>  #################################################################
>  igt@xe_pm@d3hot-i2c
>  ##################################################################
> +# Expected skip on LNL due to unsupported multi-queue capability
> +# Multi-queue is not supported on platforms older than xe3p
> +##################################################################
> +igt@.*multi.queue.*
> +##################################################################
> diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-ci/xe.ptl.core.blocklist.txt
> index 362711406..35def6ffe 100644
> --- a/tests/intel-ci/xe.ptl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
> @@ -65,11 +65,6 @@ igt@xe_pm@d3hot-i2c
>  igt@xe_compute@ccs-mode-basic
>  igt@xe_compute@ccs-mode-compute-kernel
>  #################################################################
> -# Tests not applicable for the platform
> -##################################################################
> -igt@xe_exec_multi_queue@.*
> -igt@.*@.*multi-queue.*
> -##################################################################
>  # Expected skips as the tests are not supported on PTL
>  ##################################################################
>  igt@xe_access_counter@.*
> @@ -91,3 +86,8 @@ igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
>  ##################################################################
>  igt@.*survivability.*
>  #################################################################
> +# Expected skip on PTL/WCL due to unsupported multi-queue capability
> +# Multi-queue is not supported on platforms older than xe3p
> +##################################################################
> +igt@.*multi.queue.*
> +##################################################################
> -- 
> 2.43.0
> 
