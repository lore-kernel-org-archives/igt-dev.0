Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0357FC98304
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 16:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EDB10F0EC;
	Wed, 23 Sep 2026 16:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R6D8y/55";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12EB010ED3C
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 15:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790179178; x=1821715178;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4kMAkL4d01udIXpkZEttYK0YjnjRrIwmwFZTq4nPrZk=;
 b=R6D8y/55QJe5o48EYOKLXoH5EW2HKs5O84vDHUa6zNUSSiGCYX4xx3Y/
 Wp/wGPBxDdPWNqwiWhccMfyEZIvJoL+SCj743/nVZdS7G7KFuX6f/cdyh
 Yo6S5NGrvRQaJY6LZSvbSp82a0HVcVOiN5XvLGYVC+OyLt/uyqZuOm0Ax
 ml8ybeZvgMHA5OL8IjSVSV2PWCVgKqD9k1IhUAQ+sIImI6sKMl1P8ButA
 9YASRgm8mUiZBZscl8zAG+j6B7ficNJQK6eTOPR5cQbwLh19Q2ie4BY7L
 BkxDI/lVlwCeQeeCdpF/QE+pWABV9AiNbeMiR1Qr+66/48MhmcK5wbMUm Q==;
X-CSE-ConnectionGUID: srwstFTNRjSWwquuGjcX7A==
X-CSE-MsgGUID: U6RsQCHeS5KG+k9zKo/wrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93392293"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="93392293"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 08:59:22 -0700
X-CSE-ConnectionGUID: FX0Fyh3DTnqsP6fSdlsRnA==
X-CSE-MsgGUID: sEFBouF2T9GDHUxEPU9/TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="301604395"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 08:59:20 -0700
Date: Wed, 23 Sep 2026 17:59:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Robert Mazur <robert.mazur@imgtec.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 Alessio Belle <alessio.belle@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>
Subject: Re: [PATCH i-g-t v3 0/3] test/imagination: Add infrastructure and
 SUBMIT_JOBS tests
Message-ID: <20260923155918.mjymon2rr5up6e3c@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>
References: <20260923-b4-imagination-submit-test-v3-0-d70b50b54cdb@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923-b4-imagination-submit-test-v3-0-d70b50b54cdb@imgtec.com>
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

Hi Robert,
On 2026-09-23 at 15:01:48 +0200, Robert Mazur wrote:
> This series adds the basic infrastructure needed for more advanced
> PowerVR driver testing and introduces initial coverage for the
> SUBMIT_JOBS UAPI.
> 
> The first patch adds device configuration support for supported
> PowerVR cores. Configuration data is largely derived from the Mesa
> implementation.
> 
> The second patch introduces GPU memory allocation helpers. These
> helpers simplify test development by providing common functionality
> for GPU memory allocation, virtual address management, object mapping,
> and automatic resource cleanup.
> 
> The third patch adds a set of tests covering the SUBMIT_JOBS UAPI. 
> It tests common submission paths and verify ioctl parameter validation.
> 
> Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>

Applied, thanks!



Regards,
Kamil

> ---
> Changes in v3:
> - Build fixes for armhf.
> - Link to v2: https://lore.kernel.org/r/20260922-b4-imagination-submit-test-v2-0-974e93be5de7@imgtec.com
> 
> Changes in v2:
> - Fixed build issue in the second change, rename PAGE_SIZE into POWERVR_GPU_PAGE_SIZE.
> - Fixed most of checkpatch warnings.
> - Added IGT_IMAGINATION_ prefix to the header guards.
> - Link to v1: https://lore.kernel.org/r/20260921-b4-imagination-submit-test-v1-0-d626d1264641@imgtec.com
> 
> ---
> Donald Robson (1):
>       tests/imagination: Add SUBMIT_JOBS tests
> 
> Robert Mazur (2):
>       lib/imagination: add device configuration support
>       lib/imagination: add GPU memory allocation helpers
> 
>  lib/igt_pvr.c                           | 562 +++++++++++++++++++++++++++
>  lib/igt_pvr.h                           |  42 ++
>  lib/imagination/device_info/axe-1-16m.h | 106 ++++++
>  lib/imagination/device_info/bxe-2-32.h  | 122 ++++++
>  lib/imagination/device_info/bxe-4-32.h  | 122 ++++++
>  lib/imagination/device_info/bxm-4-64.h  | 237 ++++++++++++
>  lib/imagination/device_info/bxs-4-64.h  | 124 ++++++
>  lib/imagination/device_info/g6110.h     | 103 +++++
>  lib/imagination/device_info/ge7800.h    | 102 +++++
>  lib/imagination/device_info/ge8300.h    | 230 +++++++++++
>  lib/imagination/device_info/gx6250.h    | 231 +++++++++++
>  lib/imagination/device_info/gx6650.h    | 120 ++++++
>  lib/imagination/pvr_device_info.c       | 104 +++++
>  lib/imagination/pvr_device_info.h       | 378 ++++++++++++++++++
>  lib/meson.build                         |   1 +
>  tests/imagination/meson.build           |   1 +
>  tests/imagination/pvr_submit_jobs.c     | 655 ++++++++++++++++++++++++++++++++
>  17 files changed, 3240 insertions(+)
> ---
> base-commit: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86
> change-id: 20260921-b4-imagination-submit-test-85c290526bee
> 
> Best regards,
> -- 
> Robert Mazur <robert.mazur@imgtec.com>
> 
