Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4C3C25B75
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 17:29:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDFCF10E1BE;
	Wed, 15 May 2024 17:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ex4Dienk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D7A10E1BE
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 17:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715794159; x=1747330159;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KJUEM0pDPzF+//Hajo2MUGwRQGv48WIkhyXO4d4LXzQ=;
 b=Ex4DienkK+EgPI2Fbp4RzqL78ddY+9SRY4KdQ4gUda+7Cqi5WK1VWe4P
 2N2x8Jfok1YunncuBnsIpPa4kuE1/xks+N3fCxLSJMiSipLaYDZkVSsBs
 N48SOsSlVXZmLS6JHeeo9IcR0jNygeEzJ0Vc829TU/RkdTuLxb5vqfIe4
 t6RVzxgNxJy9CPAD9iulaPnj/Zf7QrwFZF8+ohi+hi5I+zU0UWXIXNfXR
 0DXBL4nGvp3MPh53NbMI+9SufSj9S1vap1JeoDZUq+4h0R5pX6lJiTulB
 641UhKcBpTDPBIZy6BjY+HNHrf+f1u513aPpXdz4+g0AFdbm9eGdpcYaP A==;
X-CSE-ConnectionGUID: LBjO8OcoSLW2LxE896qbZg==
X-CSE-MsgGUID: SZUYo+GoRL2qc4hQBhljrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22999369"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="22999369"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 10:29:18 -0700
X-CSE-ConnectionGUID: vOOSV/F/Sf6PjLGmN5D1Xw==
X-CSE-MsgGUID: 3L8OGX96Rea5wb3BhbU5Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="31136395"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 10:29:17 -0700
Date: Wed, 15 May 2024 19:29:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Subject: Re: [PATCH i-g-t v2 00/10] helper function
Message-ID: <20240515172914.bhrwloj3du4mhr2z@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>
References: <20240514071026.748257-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240514071026.748257-1-krishnaiah.bommu@intel.com>
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

Hi Bommu,
On 2024-05-14 at 12:40:16 +0530, Bommu Krishnaiah wrote:
> Introduce helper functions for object creation, binding, submission,
> and destruction, applicable for SVM and other tests
> 
> xe-basic test is validating the helper function introduced in 'lib/xe/xe_util: helper function'
> 
> svm test cases:
> svm-basic-malloc
> svm-basic-mmap
> svm-random-access
> svm-huge-page
> svm-atomic-access
> svm-atomic-access
> svm_invalid_va
---- ^
No underscores in tests names.

> svm-mprotect
> svm-benchmark
> svm-sparse-access
> 
> svm kernel implimentation:
> https://gitlab.freedesktop.org/oak/xe-kernel-driver-svm.git
> branch: origin/drm-xe-next-svm-unify-userptr
> 

Please improve and then resend with another subject, 'helper function'
is misleading. What about 'Add tests for Shared Virtual Memory (SVM)'?

> 
> Bommu Krishnaiah (10):
>   lib/xe/xe_util: Introduce helper functions for buffer creation and
>     command submission etc
>   tests/intel/xe_svm: basic xe_svm test
>   tests/xe_svm: basic svm test
>   tests/intel/xe_svm: svm_random_access
-------------------------- ^
svm-random-access

>   tests/intel/xe_svm: svm-huge-page
>   tests/intel/xe_svm: svm_atomic_access
-------------------------- ^
svm-atomic-access

>   tests/intel/xe_svm: svm-invalid-va
>   tests/intel/xe_svm: svm_benchmark

svm-benchmark

>   tests/intel/xe_svm: svm_mprotect

svm-mprotect

>   tests/intel/xe_svm: svm-sparse-access

Regards,
Kamil

> 
>  include/drm-uapi/xe_drm.h |   2 +
>  lib/xe/xe_util.c          | 186 +++++++++++++++++
>  lib/xe/xe_util.h          |  40 ++++
>  tests/intel/xe_svm.c      | 427 ++++++++++++++++++++++++++++++++++++++
>  tests/meson.build         |   1 +
>  5 files changed, 656 insertions(+)
>  create mode 100644 tests/intel/xe_svm.c
> 
> -- 
> 2.25.1
> 
