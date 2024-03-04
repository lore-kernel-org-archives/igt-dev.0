Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193B4C5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 15:21:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A1011229D;
	Mon,  4 Mar 2024 15:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CBEqlcN6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCA5112294
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 15:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709565715; x=1741101715;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/iHbQQsn/vSpMuhnYLmnzKdWc4EK+z8XZRxzzg+y6To=;
 b=CBEqlcN62F2Z8X0/buYK8hl8DcY8BcEDZLgZgH3d5f18Ue63Nqdqe8y6
 dfn8mRG3AhQJ8ztGpExE8RZ3731q+uScCM76x4CKBjbG+ukSbz74Kh9oE
 8fMjpHSvbV912wDb5RbCmTQv+lntI10vzyUGgJMbEQiXHuSSEwdayZ9qI
 CsX3AgN0WDNVCAH84m1+DQ/gRNdIMj1xRieFIi4eGrw0PUlegieqiig84
 O7nHGNSO833sMyDgRPKM6kEeevBM/reNjcpw1c3blaPHw4diZmWeITlHw
 ZYyEWs7uqf3Xvhky2cG+MJ0IfMIpuDDzlixpo5bE/CPzAZbsGISBOLqOv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="21523049"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="21523049"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:21:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="13609450"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:21:53 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id AC7B4580960;
 Mon,  4 Mar 2024 07:21:51 -0800 (PST)
Date: Mon, 4 Mar 2024 16:21:48 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 17/24] tests: Introduce Core subcategory
Message-ID: <20240304162148.3f1db094@maurocar-mobl2>
In-Reply-To: <20240304111617.849785-18-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-18-katarzyna.piecielska@intel.com>
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

On Mon,  4 Mar 2024 11:16:10 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> Let's have Core subcategory instead of 'i915' or 'drm'.

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> ---
>  tests/dmabuf_sync_file.c | 18 ++++++++++++++++++
>  tests/intel/i915_pciid.c |  2 +-
>  tests/vgem_basic.c       |  1 +
>  3 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/dmabuf_sync_file.c b/tests/dmabuf_sync_file.c
> index cfa73117b..57f1ce2bc 100644
> --- a/tests/dmabuf_sync_file.c
> +++ b/tests/dmabuf_sync_file.c
> @@ -10,6 +10,24 @@
>  
>  IGT_TEST_DESCRIPTION("Tests for sync_file support in dma-buf");
>  
> +/**
> + * TEST: dmabuf_sync_file
> + * Category: Infrastructure
> + * Description: Tests for sync_file support in dma-buf
> + * Functionality: dmabuf
> + * Sub-category: Core
> + * Run type: FULL
> + *
> + * SUBTEST: export-basic
> + * SUBTEST: export-before-signal
> + * SUBTEST: export-multiwait
> + * SUBTEST: export-wait-after-attach
> + * SUBTEST: import-basic
> + * SUBTEST: import-multiple-read-only
> + * SUBTEST: import-multiple-read-write

We need to add descriptions for them later on.

> + *
> + */
> +
>  static void test_export_basic(int fd)
>  {
>  	struct vgem_bo bo;
> diff --git a/tests/intel/i915_pciid.c b/tests/intel/i915_pciid.c
> index 8322bd564..436acdaeb 100644
> --- a/tests/intel/i915_pciid.c
> +++ b/tests/intel/i915_pciid.c
> @@ -35,7 +35,7 @@
>   * Feature: core
>   * Functionality: device management
>   * Run type: BAT
> - * Sub-category: i915
> + * Sub-category: Core
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST:
> diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
> index 6cfb02e82..fe201908c 100644
> --- a/tests/vgem_basic.c
> +++ b/tests/vgem_basic.c
> @@ -36,6 +36,7 @@
>   * Category: Infrastructure
>   * Description: Basic sanity check of Virtual GEM module (vGEM).
>   * Functionality: mock device
> + * Sub-category: Core
>   * Test category: GEM_Legacy
>   * Feature: vgem
>   * Run type: FULL
