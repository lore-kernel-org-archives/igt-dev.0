Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15743C982EE
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 12:58:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5D210E38D;
	Mon, 21 Sep 2026 12:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AHX06vCC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09D310E38D
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 12:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789995476; x=1821531476;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9y2sBupS9xCU5BHnOCcYrwSOj9UuJ2in2WJv8jiNoxs=;
 b=AHX06vCCu1LQeDUo5E3ZlF52zJI8/6SQHV4MqHvY1egiIMuNhQ3NFYMn
 ZitXjBjONiKc4QoP4ubKiyZ1kC9J0gm24y5Ohl8vXhJa5/BI7vYmCmZpN
 QzEjEGN6W943RFXFcZb5Iu62N3y4nxH7g5HxJPe2Q63t5V1E4zGZ8YZai
 jRNdHOl+mFoY//ZLoHY7oisYJrh3kLWnpKAYjWAUg2P4pYGRPdMM+gbBL
 T99XvgKGHaF0Euntm5qK103Nsj//FAcYiMmAfculaKCvXDmb70yKOJyDp
 1XUcn72xVoCrFx6PvWEjU1cb4oealMv06aTuLEhmvXf3KDKlgRKzJgKAo g==;
X-CSE-ConnectionGUID: H7IrpW1xRk+Wp9FdxgpL7Q==
X-CSE-MsgGUID: 5ExF1tdJTtar94/rHfEQXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89431251"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="89431251"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 05:57:55 -0700
X-CSE-ConnectionGUID: cpZ6UcV5Qp2R38G5lptD4A==
X-CSE-MsgGUID: RwY1jf+qQ1uTXdUB4l+UoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="277434763"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 05:57:54 -0700
Date: Mon, 21 Sep 2026 14:57:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Subject: Re: [PATCH v1] intel-ci: blocklist multi-queue tests on BMG, LNL,
 PTL and WCL
Message-ID: <20260921125752.h7wafxd5ddunntrv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 shivtej.eknath.patil@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, nishit.sharma@intel.com,
 smitha.balasubramanyam@intel.com
References: <20260921065255.39530-1-shivtej.eknath.patil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921065255.39530-1-shivtej.eknath.patil@intel.com>
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

Hi shivtej.eknath.patil,
On 2026-09-21 at 06:52:55 +0000, shivtej.eknath.patil@intel.com wrote:
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>
> 
> The multi-queue subtests require xe_has_multi_queue_engine(fd).
> On BMG, LNL, PTL and WCL platforms these tests are expected to skip because
> multi-queue engine support is not available.
> 
> Add blocklist entries to suppress expected CI failures.

They were already blocked by not as efficient as your change,
so please remove other regexes. Before your patch:

grep -E multi.queue tests/intel-ci/*block*

tests/intel-ci/xe.bmg.core.blocklist.txt:igt@xe_exec_multi_queue@.*
tests/intel-ci/xe.bmg.core.blocklist.txt:igt@.*@.*-multi_queue
tests/intel-ci/xe.bmg.core.blocklist.txt:igt@.*@.*multi-queue.*
tests/intel-ci/xe.lnl.core.blocklist.txt:igt@xe_exec_multi_queue@.*
tests/intel-ci/xe.lnl.core.blocklist.txt:igt@.*@.*-multi_queue
tests/intel-ci/xe.lnl.core.blocklist.txt:igt@.*@.*multi-queue.*
tests/intel-ci/xe.nvl.core.blocklist.txt:# Expected skip on NVL due to unsupported multi-queue capability
tests/intel-ci/xe.nvl.core.blocklist.txt:igt@.*multi.queue.*
tests/intel-ci/xe.ptl.core.blocklist.txt:igt@xe_exec_multi_queue@.*
tests/intel-ci/xe.ptl.core.blocklist.txt:igt@.*@.*multi-queue.*
tests/intel-ci/xe.wcl.core.blocklist.txt:igt@xe_exec_multi_queue@.*
tests/intel-ci/xe.wcl.core.blocklist.txt:igt@.*@.*multi-queue.*

Regards,
Kamil

> 
> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
> ---
>  tests/intel-ci/xe.bmg.core.blocklist.txt | 5 +++++
>  tests/intel-ci/xe.lnl.core.blocklist.txt | 5 +++++
>  tests/intel-ci/xe.ptl.core.blocklist.txt | 5 +++++
>  3 files changed, 15 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-ci/xe.bmg.core.blocklist.txt
> index cd38d16f8..80aea12e8 100644
> --- a/tests/intel-ci/xe.bmg.core.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
> @@ -80,3 +80,8 @@ igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
>  ##################################################################
>  igt@xe_pm@d3hot-i2c
>  ##################################################################
> +# Expected skip on BMG due to unsupported multi-queue capability
> +# Multi-queue is not supported on platforms older than xe3p
> +##################################################################
> +igt@.*multi.queue.*
> +##################################################################
> diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
> index c830ac3c8..7975fe126 100644
> --- a/tests/intel-ci/xe.lnl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
> @@ -108,3 +108,8 @@ igt@xe_module_load@force-load
>  #################################################################
>  igt@xe_pm@d3hot-i2c
>  ##################################################################
> +# Expected skip on LNL due to unsupported multi-queue capability
> +# Multi-queue is not supported on platforms older than xe3p
> +##################################################################
> +igt@.*multi.queue.*
> +##################################################################
> diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-ci/xe.ptl.core.blocklist.txt
> index 362711406..3df649a2c 100644
> --- a/tests/intel-ci/xe.ptl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
> @@ -91,3 +91,8 @@ igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
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
