Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C99C28B30
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 13:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A0A10E60E;
	Thu, 20 Mar 2025 13:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jIkNtg29";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0D210E60E
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 13:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742477761; x=1774013761;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mQYR26OIUmrv7poRa3Avt7ZgSa2gZzPqGZzPZe8BdBg=;
 b=jIkNtg29JZRo4IUSV94e7CHNsS2w8Gs8Y1eQpJqpZfiJEzscD+h2vF1N
 kQno4CHZ2x12evUKmVWjJmidVxlus5Jt02p8wi/hflI/SbEG/FTSl9Xzf
 lwvtRCKr1resm9F5qPhAk6fPrYk8g9NGJFWKyofLNjyrjEpBVXgfIPhwD
 DK+Vb66Y4ZnDJOTq4i++jNnSYObUzy6pzbc6FlvZwHDlXzf+3/WIctqoc
 tkStdq16XCmXJA5UpBl9MK+g38KLHQeI3h1coqFVmKtPDr2zHDvq25RF5
 XCB2JRCbwQvYGHWhBnf2HXCdmSjUYolfXhOaAwilJ6sbXS/qv8gJEcR0t w==;
X-CSE-ConnectionGUID: zdMvR9TtTUSISeHeLdrH0A==
X-CSE-MsgGUID: pTswr9hAQdub3PG1NPFY5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="55085857"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="55085857"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 06:36:01 -0700
X-CSE-ConnectionGUID: sKHWqcZ7Rj2H+RgYgbuM2g==
X-CSE-MsgGUID: bMT0sT9FRTO2pFmlCnYbUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="122813904"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 06:35:59 -0700
Date: Thu, 20 Mar 2025 14:35:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2] tests/intel-ci/xe: Block
 kms_display_modes@mst-extended-mode-negative test
Message-ID: <20250320133541.3lkne36aa7zox4cd@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250306121311.431289-1-mohammed.thasleem@intel.com>
 <20250313114832.15472-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313114832.15472-1-mohammed.thasleem@intel.com>
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

Hi Mohammed,
On 2025-03-13 at 17:18:32 +0530, Mohammed Thasleem wrote:
> This negative test was designed to validate ENOSPC errors with 2k-4k or
> 4k-4k monitors connected via MST, addressing bandwidth issues in MST
> configurations.
> 
> However, it is not applicable to current bandwidths, as DP 1.4 supports
> 4 × 8.1 Gbps, and DP 2.1 has increased this to 4 × 20 Gbps, offering
> significantly greater display capabilities.
> 
> v2: Add blacklist for i915.
> 

+cc Swati and Karthik

> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel-ci/blacklist.txt    | 4 ++++
>  tests/intel-ci/xe.blocklist.txt | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index 9917bf46a..507c14d58 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -83,6 +83,10 @@ igt@gem_exec_alignment@pi-shared
>  ###############################################
>  igt@kms_frontbuffer_tracking@.*drrs.*
>  ###############################################
> +#Test is removed, so block it on CI

Add space before 'Test':

# Test is removed, so block it on CI

> +###############################################
> +igt@kms_display_modes@mst-extended-mode-negative
> +###############################################
>  # Tends to generate invalid configurations
>  # using CCS planes or configurations that
>  # exceed HW capabilities resulting in sporadic
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 80ceba9a5..06506f590 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -92,6 +92,7 @@ igt@kms_sysfs_edid_timing
>  # KMS: Non-Intel tests
>  ##################################################################
>  igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot

Add new section here, as this one is for Non-Intel tests

Regards,
Kamil

> +igt@kms_display_modes@mst-extended-mode-negative
>  ##################################################################
>  # SR-IOV tests too stressful or time-consuming
>  # to execute all dynamic subtests at once.
> -- 
> 2.43.0
> 
