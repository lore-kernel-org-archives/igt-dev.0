Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E098C54E64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 14:48:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236AC10E94A;
	Mon, 25 Mar 2024 14:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UkhLRb83";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A7C10E94A
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 14:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711378103; x=1742914103;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OVou1cha6xqjawLjaTvlQLQ5BVfO7rK/WHkboJbMn70=;
 b=UkhLRb83CryOgclw7G3VpVRg472jXAZ7akMlj/qtNJ/lfe6Hkvcn5j1M
 TlB479luB0h44z9bnI1yXnfvOma80dZ/fvKlqW6LldO3HMaBN/sg3BdCV
 2yXJYQF94iOVh/M40AWn9NMsoF/LmwVx+QpOy+kAcKXNFyD3ntx68grIR
 hfjtbm890wDP9uEnh0z9LW8RNW4HsvWz96c1aSuucmwMx+BXywKfEF/k+
 YpeiRW4iFP8EvX1sVSjpbM/8Zg+N7fckGws2T8QZV1ugwwh+kx4z1SYPV
 WhIh0m0qmWxDGaqD6IVSRKf0s1ctM+nrE4GoETdzWzFe2FL303yxNCEKR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="10157462"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="10157462"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 07:48:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="46790880"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 07:48:21 -0700
Date: Mon, 25 Mar 2024 15:48:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: Re: [PATCH i-g-t 02/12] tests/intel: Introduce CMD submission
 Sub-category for XE
Message-ID: <20240325144818.tzplezllbgybznoy@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
References: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
 <20240322124108.1825345-3-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240322124108.1825345-3-katarzyna.piecielska@intel.com>
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

Hi Katarzyna,
On 2024-03-22 at 12:40:57 +0000, Katarzyna Piecielska wrote:
> Let's introduce 'CMD submission' subcategory in Xe. So far 'execbuf'
> subcategory was used.
> Also let's move xe_exec_store to CMD submission subcategory
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Aditya Chauhan <aditya.chauhan@intel.com>
> Cc: Girotra Himanshu <himanshu.girotra@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_exec_balancer.c     | 2 +-
>  tests/intel/xe_exec_basic.c        | 2 +-
>  tests/intel/xe_exec_compute_mode.c | 2 +-
>  tests/intel/xe_exec_fault_mode.c   | 2 +-
>  tests/intel/xe_exec_reset.c        | 2 +-
>  tests/intel/xe_exec_store.c        | 2 +-
>  tests/intel/xe_exec_threads.c      | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
> index 02edd389d..6e467e34a 100644
> --- a/tests/intel/xe_exec_balancer.c
> +++ b/tests/intel/xe_exec_balancer.c
> @@ -6,7 +6,7 @@
>  /**
>   * TEST: Basic tests for execbuf functionality for virtual and parallel exec_queues
>   * Category: Hardware building block
> - * Sub-category: execbuf
> + * Sub-category: CMD submission
>   * Functionality: virtual and parallel exec_queues
>   * Test category: functionality test
>   */
> diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
> index e6f8db5b0..06be502d6 100644
> --- a/tests/intel/xe_exec_basic.c
> +++ b/tests/intel/xe_exec_basic.c
> @@ -6,7 +6,7 @@
>  /**
>   * TEST: Basic tests for execbuf functionality
>   * Category: Hardware building block
> - * Sub-category: execbuf
> + * Sub-category: CMD submission
>   * Functionality: exec_queues
>   */
>  
> diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
> index 2ba94d2c6..c1f703c43 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -6,7 +6,7 @@
>  /**
>   * TEST: Basic tests for execbuf compute machine functionality
>   * Category: Hardware building block
> - * Sub-category: execbuf
> + * Sub-category: CMD submission
>   * Functionality: compute machine
>   */
>  
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index 20a7cf8fe..72a7bd4fd 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -6,7 +6,7 @@
>  /**
>   * TEST: Basic tests for execbuf functionality for virtual and parallel exec_queues
>   * Category: Hardware building block
> - * Sub-category: execbuf
> + * Sub-category: CMD submission
>   * Functionality: fault mode
>   * GPU requirements: GPU needs support for DRM_XE_VM_CREATE_FLAG_FAULT_MODE
>   */
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index a39e5860e..22735688a 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -6,7 +6,7 @@
>  /**
>   * TEST: Basic tests for execbuf functionality for virtual and parallel exec_queues
>   * Category: Hardware building block
> - * Sub-category: execbuf
> + * Sub-category: CMD submission
>   * Functionality: reset
>   * Test category: functionality test
>   */
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> index 55354e688..c57bcb852 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -15,7 +15,7 @@
>  /**
>   * TEST: Tests to verify store dword functionality.
>   * Category: Software building block
> - * Sub-category: HW
> + * Sub-category: CMD submission
>   * Functionality: intel-bb
>   * Test category: functionality test
>   */
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index 977e8c600..05ea1d35a 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -6,7 +6,7 @@
>  /**
>   * TEST: Basic tests for execbuf functionality
>   * Category: Hardware building block
> - * Sub-category: execbuf
> + * Sub-category: CMD submission
>   * Functionality: multi-threads
>   * Test category: functionality test
>   */
> -- 
> 2.34.1
> 
