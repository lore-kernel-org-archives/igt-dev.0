Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B6CC5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 15:25:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E8911225F;
	Mon,  4 Mar 2024 15:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OIogrDp8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F2611225F
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 15:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709565952; x=1741101952;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0I8fVYXO8cdiXaSdkYLlGrTpcZW8hykFyS5OiCMuOqM=;
 b=OIogrDp8uZcHcMaIss4X2QmmZ6t7P8lgCxB2PyhWJWKk4G/umPFm29bY
 BarHZDBaa4lc4FA8Pq7SljMF+bEIRTkCZ5TUz41o/bD/5ShahjXtWtTmV
 sBLnjIN7STKIi+bzxNXbSv0c6oHsUuvyr7Vi2QwCvMzKumCeT4M91DVYH
 TBX7n9BwGowqMP4ffGsndh4Q4MLYEh+t9yrmhE34AlI5QBBqHC5XaWF7p
 GS7PZk48HxGnldbvYUrMMM1YsD7UB/LOhQolq9I2SpjNoUlUK1rIw+kM7
 ZipffTJYh2bOmzCELV0vi4UOdcGp/H3Wcec+LbtejKAUTVMMU2UFO7Kcz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4227748"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4227748"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:25:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="39879573"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:25:42 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 65AAF580960;
 Mon,  4 Mar 2024 07:25:39 -0800 (PST)
Date: Mon, 4 Mar 2024 16:25:36 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Lukasz Laguna <lukasz.laguna@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 23/24] tests: Add missing documentation fields for
 SRIOV and Display
Message-ID: <20240304162536.0cf930bc@maurocar-mobl2>
In-Reply-To: <20240304111617.849785-24-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-24-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon,  4 Mar 2024 11:16:16 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> Add missing documentation fields for:
> 
>  tests/intel/i915_pipe_stress.c - add Category, Sub-category, Functionality to
> KMS test
>  tests/sriov_basic.c - add missing functionality


LGTM, but better to have someone from kms team to look into it.

Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>


> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/i915_pipe_stress.c | 11 ++++++++---
>  tests/sriov_basic.c            |  1 +
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/i915_pipe_stress.c b/tests/intel/i915_pipe_stress.c
> index 79f83d266..a487f70de 100644
> --- a/tests/intel/i915_pipe_stress.c
> +++ b/tests/intel/i915_pipe_stress.c
> @@ -20,9 +20,14 @@
>  #include "i915/gem.h"
>  /**
>   * TEST: i915 pipe stress
> - * Description:
> - *   Stress test how gpu and cpu behaves if maximum amount of planes, cpu and gpu utilization is
> - *   achieved in order to reveal possible bandwidth/watermark and similar problems.
> + * Category: Display
> + * Description: Stress test how gpu and cpu behaves if maximum amount of
> + *              planes, cpu and gpu utilization is achieved in order to reveal
> + *              possible bandwidth/watermark and similar problems.
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Sub-category: Display
> + * Test category: stress test
>   * Run type: FULL
>   *
>   * SUBTEST: stress-xrgb8888-untiled
> diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
> index bc7c09e1c..b2b63c702 100644
> --- a/tests/sriov_basic.c
> +++ b/tests/sriov_basic.c
> @@ -14,6 +14,7 @@ IGT_TEST_DESCRIPTION("Basic tests for enabling SR-IOV Virtual Functions");
>   * Category: Software building block
>   * Mega feature: SR-IOV
>   * Sub-category: VFs enabling
> + * Functionality: configure / enable VFs
>   * Description: Validate SR-IOV VFs enabling
>   */
>  
