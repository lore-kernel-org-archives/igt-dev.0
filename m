Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721D4C8303D
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 16:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1051010E2BA;
	Fri,  4 Jul 2025 16:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KN2iD85N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1D310E2BA
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 16:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751645464; x=1783181464;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DgP70vcJeAJPMXAq9cVZVldZeoHrKQO543SnryhrNSc=;
 b=KN2iD85N4cwRRNPLxdkD/XAOzArwF44/pRi6np+gmJXcHmFoFhgoZZE7
 llYJbCzb+qaTpYYeKZsqH2wqCeXIMTO1nK+3H7LOngqypSwrOki+JIA9t
 0dwS5+sZ9sGKWXPthPRWnW2MCt6wPqg+wx84sjlOPCmP1rW5deidDoRaZ
 5wyzPA+E7HknmIupCOqU2gtcSvbYMrwJh7cEfsfxBSdG6oR3/GIJzOzrk
 Luir0x3TolIl9jsC2dV5mCsBH8EDfCsKKiBVoN5HFD5HOnsyKCqYqKA3e
 lpam7iGwty3ajUyZPFixz5+D2Jcu0+upZcuN91VMS2SC54nnt0w7DpDMZ A==;
X-CSE-ConnectionGUID: huOtsO6HQBGQsnjmTNM6QA==
X-CSE-MsgGUID: V/mVCfyVSy+NQKbaYKxOjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="53701939"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="53701939"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 09:11:03 -0700
X-CSE-ConnectionGUID: RaslA7riSISPN/r2ep5UbQ==
X-CSE-MsgGUID: /6+Clr9rR/mRBJAPRUhABw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="154420060"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 09:11:03 -0700
Date: Fri, 4 Jul 2025 18:11:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH i-g-t v2 0/9] msm: recovery and mapping updates
Message-ID: <20250704161100.k27itcxbiprtr3a4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>,
 igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
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

Hi Rob,
On 2025-07-02 at 12:02:40 -0700, Rob Clark wrote:
> Mostly updates to address flakes, and updates related to newer kernels.
> Plus a few additional sub-tests.

Thank you, I merged it.

Regards,
Kamil

> 
> Rob Clark (9):
>   tests/msm/msm_mapping: Fix memory leak
>   tests/msm/msm_recovery: Wait for devcore
>   tests/msm/msm_recovery: add iova-fault-stress test
>   tests/msm/msm_mapping: update for sparse
>   tests/msm/msm_mapping: Handle BO names with spaces
>   tests/msm/msm_mapping: Add additional subtests
>   tests/msm/msm_mapping: Wait for devcore
>   tests/msm/msm_mapping: Handle larger gmem file size
>   tests/msm/msm_mapping: Add wait for stall-on-fault to re-arm
> 
>  tests/msm/msm_mapping.c  | 93 +++++++++++++++++++++++++++++++++++-----
>  tests/msm/msm_recovery.c | 38 +++++++++++-----
>  2 files changed, 110 insertions(+), 21 deletions(-)
> 
> -- 
> 2.50.0
> 
