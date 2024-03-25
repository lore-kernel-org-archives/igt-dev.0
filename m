Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11266C54E64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 15:19:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BB010E98E;
	Mon, 25 Mar 2024 15:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="acY2cceZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607AF10E986
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 15:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711379962; x=1742915962;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=i5wWJIjmSHbIN7mA5FhdzkWZ3S/8ahz5uz+/+KvDoGo=;
 b=acY2cceZXWpOs6VmLkkwVxIL/UWoRUoh1lmEr03CywXLl96myNY99Onb
 fNqpB1PyOx/ayiKQ8lfhi9pUy34ZIB6C8UxBOAaSL07HvxtfgvyS6m24K
 rWfcTNOez+oF6hJGz5MXJSWTwhUrDz+3aLJLV5PSIbznZe9Rc3XaxbeXv
 rlLc6UB6kMdQF5qk7xWz0cPLb5wB13JbummqgcHKLNHTFk8KPKi0BZOr9
 588LKiTpM+yFehQUqzCZzD9K1mme24kQ4CkL1jWa/mYQHJrVEL4ag30bQ
 kEpUCym89hhXXg3BUEiwlcvmbPo9VEV6W3B+U71F97Lyy4vTrlOocR9gF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="10163841"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="10163841"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 08:18:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="53113873"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 08:18:11 -0700
Date: Mon, 25 Mar 2024 16:18:08 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: Re: [PATCH i-g-t 11/12] tests/intel: Unify functionality for compute
 tests
Message-ID: <20240325151808.jmedbdavtvwosc24@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
References: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
 <20240322124108.1825345-13-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240322124108.1825345-13-katarzyna.piecielska@intel.com>
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
On 2024-03-22 at 12:41:07 +0000, Katarzyna Piecielska wrote:
> Let's clean up functionality for Xe compute tests:
> 
> 	s/compute machine/compute/ for xe_exec_compute_mode.c
> 	s/compute VM bind/VM bind/ for igt@xe_noexec_ping_pong.c
> 	s/compute openCL kernel/openCL kernel/ for xe_compute*.c
----------------------------^
imho this should be OpenCL

With this,
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 	s/ccs_mode user interface/ccs mode/ for xe_compute@ccs-mode-*
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Aditya Chauhan <aditya.chauhan@intel.com>
> Cc: Girotra Himanshu <himanshu.girotra@intel.com>
> ---
>  tests/intel/xe_compute.c           | 6 +++---
>  tests/intel/xe_compute_preempt.c   | 8 +++++---
>  tests/intel/xe_exec_compute_mode.c | 2 +-
>  tests/intel/xe_noexec_ping_pong.c  | 2 +-
>  4 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> index 9cf359383..8d377990c 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -44,7 +44,7 @@ static bool get_num_cslices(u32 gt, u32 *num_slices)
>   * SUBTEST: ccs-mode-basic
>   * GPU requirement: PVC
>   * Description: Validate 'ccs_mode' sysfs uapi
> - * Functionality: ccs_mode user interface
> + * Functionality: ccs mode
>   */
>  static void
>  test_ccs_mode(int num_gt)
> @@ -111,7 +111,7 @@ test_ccs_mode(int num_gt)
>   * SUBTEST: ccs-mode-compute-kernel
>   * GPU requirement: PVC
>   * Description: Validate 'ccs_mode' by running compute kernel
> - * Functionality: CCS mode funtionality
> + * Functionality: ccs mode
>   */
>  static void
>  test_compute_kernel_with_ccs_mode(int num_gt)
> @@ -158,7 +158,7 @@ test_compute_kernel_with_ccs_mode(int num_gt)
>   * Description:
>   *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
>   *	for an input dataset..
> - * Functionality: compute openCL kernel
> + * Functionality: openCL kernel
>   */
>  static void
>  test_compute_square(int fd)
> diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
> index 45aa15c78..a4863c364 100644
> --- a/tests/intel/xe_compute_preempt.c
> +++ b/tests/intel/xe_compute_preempt.c
> @@ -21,17 +21,19 @@
>   * GPU requirement: LNL
>   * Description:
>   *      Exercise compute walker mid thread preemption scenario
> - * Functionality: compute openCL kernel
> + * Functionality: openCL kernel
> + *
>   * SUBTEST: compute-preempt-many
>   * GPU requirement: LNL
>   * Description:
>   *      Exercise multiple walker mid thread preemption scenario
> - * Functionality: compute openCL kernel
> + * Functionality: openCL kernel
> + *
>   * SUBTEST: compute-threadgroup-preempt
>   * GPU requirement: LNL
>   * Description:
>   *      Exercise compute walker threadgroup preemption scenario
> - * Functionality: compute openCL kernel
> + * Functionality: openCL kernel
>   */
>  static void
>  test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe, bool threadgroup_preemption)
> diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
> index c1f703c43..3ec848164 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -7,7 +7,7 @@
>   * TEST: Basic tests for execbuf compute machine functionality
>   * Category: Hardware building block
>   * Sub-category: CMD submission
> - * Functionality: compute machine
> + * Functionality: compute
>   */
>  
>  #include <fcntl.h>
> diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
> index 51f28d9d0..f88f2af9d 100644
> --- a/tests/intel/xe_noexec_ping_pong.c
> +++ b/tests/intel/xe_noexec_ping_pong.c
> @@ -19,7 +19,7 @@
>   * TEST: Expose compute VM's unnecessary rebinds
>   * Category: Hardware building block
>   * Sub-category: Compute
> - * Functionality: compute VM rebind
> + * Functionality: VM rebind
>   * Test category: functionality test
>   *
>   * SUBTEST:
> -- 
> 2.34.1
> 
