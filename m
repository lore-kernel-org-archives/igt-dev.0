Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA20C98302
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 16:01:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3675910EDE9;
	Tue, 22 Sep 2026 16:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gbEtUGO7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013F510EDCA
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 16:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790092816; x=1821628816;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uS80UNJh/eCMKdFa+jCNbJ52rFJJQL0Pug//fzNnx5M=;
 b=gbEtUGO7lr1q5LvEWhmQ2CzO5nCbQ5Czrv+Zqn+oCWOpe/po/8wMgzHJ
 uwRw6aYbUYvLn4WcObn+ok5r+tofv2bAd1jpoFB7jkrcRNtwxvo/z/05X
 8uHOV4FTnrvbmdB5EG4tMFOJLK8h8m7P1mlosiWLIbaPwxouWCg96uek0
 BdW5qhiKRIXQlsHcJkjAtGXR/IchhbIOIFe+80e3At6vsMS5uHIuUHgKG
 6V+T+qSBr8wqyYXsNvSraVjFHiissPvIWQaR7odGgrfYsTUY4s2PoXJAt
 HW6OCmmbJU3ikPqg3gMQ29+JPFGk9pMGY+vzdS3rhHkBoSWKafMe3hcom Q==;
X-CSE-ConnectionGUID: meiNw6/9Rme3mXBHhoWgRA==
X-CSE-MsgGUID: XKl8ZUDoReOPOBWj5TJp/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90733708"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="90733708"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 09:00:16 -0700
X-CSE-ConnectionGUID: lxlR99rbQTio/WmFD0OkNw==
X-CSE-MsgGUID: 8ztROExmRtiundeFcYvfCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="4272134"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 09:00:15 -0700
Date: Tue, 22 Sep 2026 18:00:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Subject: Re: [PATCH v2] intel-ci: blocklist multi-queue tests on BMG, LNL,
 PTL and WCL
Message-ID: <20260922160012.iui3uyofw65vzbjt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 shivtej.eknath.patil@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, nishit.sharma@intel.com,
 smitha.balasubramanyam@intel.com
References: <20260922051921.24701-1-shivtej.eknath.patil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922051921.24701-1-shivtej.eknath.patil@intel.com>
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
On 2026-09-22 at 05:19:21 +0000, shivtej.eknath.patil@intel.com wrote:
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>
> 
> The multi-queue subtests require xe_has_multi_queue_engine(fd).
> On BMG, LNL, PTL and WCL platforms these tests are expected to skip because
> multi-queue engine support is not available.
> 
> Add blocklist entries to suppress expected CI failures.

Sorry for 2nd mail, one more nit.

> 
> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
> ---
>  tests/intel-ci/xe.bmg.core.blocklist.txt |  8 +++++---
>  tests/intel-ci/xe.lnl.core.blocklist.txt |  8 +++++---
>  tests/intel-ci/xe.ptl.core.blocklist.txt | 10 +++++-----
>  3 files changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-ci/xe.bmg.core.blocklist.txt
> index cd38d16f8..84f401570 100644
> --- a/tests/intel-ci/xe.bmg.core.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
> @@ -41,10 +41,7 @@ igt@xe_vm@.*export.*
>  ##################################################################
>  # Tests not applicable for the platform
>  ##################################################################
> -igt@xe_exec_multi_queue@.*
>  igt@xe_evict@.*multi(-)?queue.*

Why this one was left here?

> -igt@.*@.*-multi_queue
> -igt@.*@.*multi-queue.*
>  ##################################################################
>  # Expected skips, Kernel support not available
>  ##################################################################
> @@ -80,3 +77,8 @@ igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
>  ##################################################################
>  igt@xe_pm@d3hot-i2c
>  ##################################################################
> +# Expected skip on BMG due to unsupported multi-queue capability
> +# Multi-queue is not supported on platforms older than xe3p
> +##################################################################
> +igt@.*multi.queue.*

Please make this change only in one place, do not write it in two
different places.

Same apply for other GPUs blocklists.

Regards,
Kamil

> +##################################################################
> diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
> index c830ac3c8..67f8ad8df 100644
> --- a/tests/intel-ci/xe.lnl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
> @@ -84,9 +84,6 @@ igt@xe_vm@.*export.*
>  # Tests not applicable for the platform
>  ##################################################################
>  igt@xe_evict@.*multiqueue.*
> -igt@xe_exec_multi_queue@.*
> -igt@.*@.*-multi_queue
> -igt@.*@.*multi-queue.*
>  ##################################################################
>  # Kernel support not available
>  ##################################################################
> @@ -108,3 +105,8 @@ igt@xe_module_load@force-load
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
