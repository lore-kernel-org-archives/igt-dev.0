Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A69CD98F0
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 12:40:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9602310E263;
	Wed, 17 Jun 2026 12:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9fUPJio";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5772D10E263
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 12:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781700020; x=1813236020;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vx5rjzRBM6zQ50W1076mFu/qZWyPJEUw1aZrHcWfj5U=;
 b=V9fUPJioY+E7lodCcWfri9TxV3BzJMttxfAW3WpJfC9bPbuWfB2tfYIC
 N5iTvt1ajQYpIlaOTAvuQXWmhitdwJjF/cBYA/m7nwIOjOn901EGP3dUi
 Oi/N6MzgzaCMc4ZB5TkyCw/cCaI/tXfs1cw6ffHClNNhRTbFo9Ib9ksF+
 gKobGZ3rLLQpXVpCNeV0S5j/YR77fujdfr7jGwJ7SGgpjsn6XAhMyvtC6
 6VbBuUvVVhBLI30VLM8zAGlsF5IRbPv1VVvKMgPigOS79ShCclz59Ff9g
 igoGcMgvR/O43qZL0C1SXUZaUxaOM+/Dqbas5Yw/wJwE6fcnMsD97jwmy w==;
X-CSE-ConnectionGUID: L9h54CsxQVqoeENiHlZ+DQ==
X-CSE-MsgGUID: v855aRpGRaGIlnEPMIKWPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82583646"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="82583646"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 05:40:20 -0700
X-CSE-ConnectionGUID: m+NM/uyvRRq7YvCOD0bapQ==
X-CSE-MsgGUID: 7pu+FcmCSraWoK/wgDHG4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="253172779"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 05:40:19 -0700
Date: Wed, 17 Jun 2026 14:40:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: priyanka.dandamudi@intel.com
Cc: ramadevi.gandi@intel.com, niranjana.vishwanathapura@intel.com,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe*.c: Add documentation to
 multi-queue tests and subtests.
Message-ID: <20260617124016.emwqjlqsqvaziiln@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 priyanka.dandamudi@intel.com, ramadevi.gandi@intel.com,
 niranjana.vishwanathapura@intel.com, igt-dev@lists.freedesktop.org
References: <20260617083549.1347431-4-priyanka.dandamudi@intel.com>
 <20260617083549.1347431-6-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260617083549.1347431-6-priyanka.dandamudi@intel.com>
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

Hi Priyanka,
On 2026-06-17 at 14:05:52 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Add Mega feature and Sub-category fields to multi-queue tests and subtests.
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/intel/xe_evict.c           | 72 ++++++++++++++++++++++------
>  tests/intel/xe_exec_fault_mode.c | 81 ++++++++++++++++++++++----------
>  tests/intel/xe_exec_reset.c      | 28 +++++++++++
>  tests/intel/xe_exec_threads.c    | 44 ++++++++++-------
>  4 files changed, 167 insertions(+), 58 deletions(-)
> 
> diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
> index 82a6cde0a9..70cfa11bbb 100644
> --- a/tests/intel/xe_evict.c
> +++ b/tests/intel/xe_evict.c
> @@ -559,11 +559,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>   * arg[1]:
>   *
>   * @small:			small
> - * @small-multi-queue:		small multi queue
> - * @small-multi-queue-priority:
> - * 				small multi queue priority
>   * @small-external:		small external
> - * @small-external-multi-queue: small external multi queue
>   * @small-multi-vm:		small multi VM
>   * @beng-small:			small bind exec_queue
>   * @beng-small-external:	small external bind exec_queue
> @@ -593,12 +589,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>   * arg[1]:
>   *
>   * @small-cm:			small compute machine
> - * @small-multi-queue-cm:	small multi queue compute machine
> - * @small-multi-queue-priority-cm:
> - * 				small multi queue priority compute machine
>   * @small-external-cm:		small external compute machine
> - * @small-external-multi-queue-cm:
> - * 				small external compute machine multi queue
>   * @small-multi-vm-cm:		small multi VM compute machine
>   * @beng-small-cm:		small bind exec_queue compute machine
>   * @beng-small-external-cm:	small external bind exec_queue compute machine
> @@ -629,8 +620,6 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>   * arg[1]:
>   *
>   * @mixed-threads-small:	mixed threads small
> - * @mixed-threads-small-multi-queue:
> - * 				mixed threads small multi queue
>   * @mixed-many-threads-small:	mixed many threads small
>   * @mixed-threads-small-multi-vm:
>   * 				mixed threads small multi vm
> @@ -668,8 +657,6 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>   *
>   * arg[1]:
>   * @cm-threads-small:		compute mode threads small
> - * @cm-threads-small-multi-queue:
> - * 				compute mode threads small multi queue
>   * @cm-threads-small-multi-vm:	compute mode threads small multi vm
>   * @beng-cm-threads-small:	bind exec_queue compute mode threads small
>   * @beng-cm-threads-small-multi-vm:
> @@ -700,7 +687,6 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>   *
>   * @threads-small:		threads small
>   * @beng-threads-small:		bind exec_queue threads small
> - * @threads-small-multi-queue:	threads small multi queue
>   * @threads-small-multi-vm:	threads small multi vm
>   * @beng-threads-small-multi-vm:
>   *				bind exec_queue threads small multi vm
> @@ -722,6 +708,64 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>   * @beng-threads-large:		bind exec_queue threads large
>   *
>   */
> +/**
> + * SUBTEST: evict-%s
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
> + * Description:  %arg[1] evict test.
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @small-multi-queue:		small multi queue
> + * @small-multi-queue-priority:	small multi queue priority
> + * @small-external-multi-queue: small external multi queue
> + *
> + * SUBTEST: evict-%s
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
> + * Description:  %arg[1] evict test.
> + * Feature: compute machine
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @small-multi-queue-cm:	small multi queue compute machine
> + * @small-multi-queue-priority-cm:	small multi queue priority compute machine
> + * @small-external-multi-queue-cm:	small external compute machine multi queue
> + *
> + * SUBTEST: evict-%s

This should be a simple name, no parameter needed, see below.

> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
> + * Description:  %arg[1] evict test.
> + * Feature: mixed threads
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @mixed-threads-small-multi-queue:	mixed threads small multi queue

Please do not make single params, it is better to directly
code it like:

 * SUBTEST: evict-mixed-threads-small-multi-queue

> + *
> + * SUBTEST: evict-%s

Same here.

> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
> + * Description:  %arg[1] evict test.
> + * Feature: compute mode threads
> + * Test category: functionality test
> + *
> + * arg[1]:
> + * @cm-threads-small-multi-queue:	compute mode threads small multi queue
> + *
> + * SUBTEST: evict-%s

Same here.

> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
> + * Description:  %arg[1] evict test.
> + * Feature: threads
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @threads-small-multi-queue:	threads small multi queue
> + */
>  
>  /*
>   * Table driven test that attempts to cover all possible scenarios of eviction
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index 3e92dfbd9a..23a1c31301 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -78,14 +78,6 @@
>   *					bindexecqueue userptr invalidate
>   * @bindexecqueue-userptr-invalidate-race:
>   *					bindexecqueue userptr invalidate race
> - * @multi-queue:			multi-queue
> - * @multi-queue-userptr:		multi-queue userptr
> - * @multi-queue-rebind:			multi-queue rebind
> - * @multi-queue-userptr-rebind:		multi-queue userptr rebind
> - * @multi-queue-userptr-invalidate:
> - *					multi-queue userptr invalidate
> - * @multi-queue-userptr-invalidate-race:
> - *					multi-queue userptr invalidate race
>   * @basic-imm:				basic imm
>   * @userptr-imm:			userptr imm
>   * @rebind-imm:				rebind imm
> @@ -101,15 +93,6 @@
>   *					bindexecqueue userptr invalidate imm
>   * @bindexecqueue-userptr-invalidate-race-imm:
>   *					bindexecqueue userptr invalidate race imm
> - * @multi-queue-imm:			multi-queue imm
> - * @multi-queue-userptr-imm:		multi-queue userptr imm
> - * @multi-queue-rebind-imm:		multi-queue rebind imm
> - * @multi-queue-userptr-rebind-imm:
> - *					multi-queue userptr rebind imm
> - * @multi-queue-userptr-invalidate-imm:
> - *					multi-queue userptr invalidate imm
> - * @multi-queue-userptr-invalidate-race-imm:
> - *					multi-queue userptr invalidate race imm
>   * @basic-prefetch:			basic prefetch
>   * @userptr-prefetch:			userptr prefetch
>   * @rebind-prefetch:			rebind prefetch
> @@ -124,17 +107,63 @@
>   *					bindexecqueue userptr invalidate prefetch
>   * @bindexecqueue-userptr-invalidate-race-prefetch:
>   *					bindexecqueue userptr invalidate race prefetch
> - * @multi-queue-prefetch:		multi-queue prefetch
> - * @multi-queue-userptr-prefetch:	multi-queue userptr prefetch
> - * @multi-queue-rebind-prefetch:	multi-queue rebind prefetch
> - * @multi-queue-userptr-rebind-prefetch:	multi-queue userptr rebind prefetch
> - * @multi-queue-userptr-invalidate-prefetch:
> - *					multi-queue userptr invalidate prefetch
> - * @multi-queue-userptr-invalidate-race-prefetch:
> - *					multi-queue userptr invalidate race prefetch
>   * @invalid-fault:			invalid fault
>   * @invalid-userptr-fault:		invalid userptr fault
> - * @multi-queue-invalid-fault:		multi-queue invalid fault
> + */
> +/**
> + * SUBTEST: once-%s
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
> + * Description: Run %arg[1] fault mode test only once
> + * Test category: functionality test
> + *
> + * SUBTEST: twice-%s
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
> + * Description: Run %arg[1] fault mode test twice
> + * Test category: functionality test
> + *
> + * SUBTEST: many-%s
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
> + * Description: Run %arg[1] fault mode test many times
> + * Test category: stress test
> + *
> + * SUBTEST: many-execqueues-%s
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
> + * Description: Run %arg[1] fault mode test on many exec_queues
> + * Test category: stress test
> + *
> + * arg[1]:
> + *
> + * @multi-queue:                        multi-queue
> + * @multi-queue-userptr:                multi-queue userptr
> + * @multi-queue-rebind:                 multi-queue rebind
> + * @multi-queue-userptr-rebind:         multi-queue userptr rebind
> + * @multi-queue-userptr-invalidate:
> + *                                      multi-queue userptr invalidate
> + * @multi-queue-userptr-invalidate-race:
> + *                                      multi-queue userptr invalidate race
> + * @multi-queue-imm:                    multi-queue imm
> + * @multi-queue-userptr-imm:            multi-queue userptr imm
> + * @multi-queue-rebind-imm:             multi-queue rebind imm
> + * @multi-queue-userptr-rebind-imm:
> + *                                      multi-queue userptr rebind imm
> + * @multi-queue-userptr-invalidate-imm:
> + *                                      multi-queue userptr invalidate imm
> + * @multi-queue-userptr-invalidate-race-imm:
> + *                                      multi-queue userptr invalidate race imm
> + * @multi-queue-prefetch:               multi-queue prefetch
> + * @multi-queue-userptr-prefetch:       multi-queue userptr prefetch
> + * @multi-queue-rebind-prefetch:        multi-queue rebind prefetch
> + * @multi-queue-userptr-rebind-prefetch:
> + *                                      multi-queue userptr rebind prefetch
> + * @multi-queue-userptr-invalidate-prefetch:
> + *                                      multi-queue userptr invalidate prefetch
> + * @multi-queue-userptr-invalidate-race-prefetch:
> + *                                      multi-queue userptr invalidate race prefetch
> + * @multi-queue-invalid-fault:          multi-queue invalid fault
>   * @multi-queue-invalid-userptr-fault:  multi-queue invalid userptr fault
>   */
>  
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 9f5fde1a74..e41c663342 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -350,9 +350,13 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>   * Description: Test long spinners with many preemptable jobs, use queues again spinners complete on media GT
>   *
>   * SUBTEST: multi-queue-long-spin-many-queue-switch
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
>   * Description: Test long spinners with many jobs with multi-queue switching
>   *
>   * SUBTEST: multi-queue-long-spin-reuse-many-queue-switch
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
>   * Description: Test long spinners with many jobs with multi-queue switching, use queues again once spinners complete
>   *
>   * SUBTEST: gt-reset
> @@ -383,42 +387,66 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>   * Description: Test compute mode close exec_queues close fd
>   *
>   * SUBTEST: multi-queue-cat-error
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
>   * Description: Test cat error with multi_queue

Nit:
s/multi_queue/Multi-Queue/

>   *

Can we compact this a little here?
 */
 /*
  * SUBTEST: %arg[1]-queue-%arg[2]
  * Mega feature: Multi-Queue
  * Sub-category: Multi-Queue tests
  * Description: Test %arg[2] with %arg[1]
  *
  * arg[1]:
  *
  * @multi:
  * @cm-multi: compute mode
  *
  * arg[2]:
  *
  * @cat-error-on-secondary: description here
  * @cancel: description here
  * @gt-reset: description here
  * ...

with other params follows here.

>   * SUBTEST: multi-queue-cat-error-on-secondary
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
>   * Description: Test cat error with multi_queue
>   *              on a secondary queue
>   *
>   * SUBTEST: multi-queue-gt-reset
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
>   * Description: Test GT reset with multi_queue
>   *
>   * SUBTEST: multi-queue-cancel
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
>   * Description: Test engine reset with multi_queue
>   *
>   * SUBTEST: multi-queue-cancel-on-secondary
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
>   * Description: Test engine reset with multi_queue
>   *              on a secondary queue
>   *
>   * SUBTEST: multi-queue-close-fd
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
>   * Description: Test close fd with multi_queue
>   *
>   * SUBTEST: multi-queue-close-execqueues
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
>   * Description: Test close execqueues with multi_queue
>   *
>   * SUBTEST: cm-multi-queue-cat-error
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
>   * Description: Test compute mode cat error with multi_queue
>   *
>   * SUBTEST: cm-multi-queue-cat-error-on-secondary
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
>   * Description: Test compute mode cat error with multi_queue
>   *              on a secondary queue
>   *
>   * SUBTEST: cm-multi-queue-gt-reset
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
>   * Description: Test compute mode GT reset with multi_queue
>   *
>   * SUBTEST: cm-multi-queue-close-fd
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
>   * Description: Test compute mode close fd with multi_queue
>   *
>   * SUBTEST: cm-multi-queue-close-execqueues
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
>   * Description: Test compute mode close execqueues with multi_queue
>   */
>  
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index 2f44d5555d..894fa49bff 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -1203,6 +1203,14 @@ static void *thread(void *data)
>   *	balancer mixed fd userptr invalidate
>   * @bal-mixed-fd-userptr-invalidate-race:
>   *	balancer mixed fd userptr invalidate race
> + */
> +/**
> + * SUBTEST: threads-%s
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
> + * Description: Run threads %arg[1] test with multi threads

imho s/multi threads/Multi-Queue/

> + *
> + * arg[1]:
>   * @multi-queue-basic:
>   *	multi-queue basic
>   * @multi-queue-userptr:
> @@ -1244,49 +1252,49 @@ static void *thread(void *data)
>   * @multi-queue-fd-userptr-invalidate-race:
>   *	multi-queue fd userptr invalidate race
>   * @multi-queue-hang-basic:
> - *     multi-queue hang basic
> + *	multi-queue hang basic

Do we need this whitespace changes here and below?

Regards,
Kamil

>   * @multi-queue-hang-fd-userptr-invalidate-race:
>   *	multi-queue hang fd userptr invalidate race
>   * @multi-queue-mixed-basic:
>   *	multi-queue mixed basic
>   * @multi-queue-mixed-userptr:
> - *	multi-queue-mixed userptr
> + *	multi-queue mixed userptr
>   * @multi-queue-mixed-rebind:
> - *	multi-queue-mixed rebind
> + *	multi-queue mixed rebind
>   * @multi-queue-mixed-userptr-rebind:
> - *	multi-queue-mixed userptr rebind
> + *	multi-queue mixed userptr rebind
>   * @multi-queue-mixed-userptr-invalidate:
> - *	multi-queue-mixed userptr invalidate
> + *	multi-queue mixed userptr invalidate
>   * @multi-queue-mixed-userptr-invalidate-race:
> - *	multi-queue-mixed userptr invalidate race
> + *	multi-queue mixed userptr invalidate race
>   * @multi-queue-mixed-shared-vm-basic:
>   *	multi-queue mixed shared vm basic
>   * @multi-queue-mixed-shared-vm-userptr:
> - *	multi-queue-mixed shared vm userptr
> + *	multi-queue mixed shared vm userptr
>   * @multi-queue-mixed-shared-vm-rebind:
> - *	multi-queue-mixed shared vm rebind
> + *	multi-queue mixed shared vm rebind
>   * @multi-queue-mixed-shared-vm-userptr-rebind:
> - *	multi-queue-mixed shared vm userptr rebind
> + *	multi-queue mixed shared vm userptr rebind
>   * @multi-queue-mixed-shared-vm-userptr-invalidate:
> - *	multi-queue-mixed shared vm userptr invalidate
> + *	multi-queue mixed shared vm userptr invalidate
>   * @multi-queue-mixed-shared-vm-userptr-invalidate-race:
> - *	multi-queue-mixed shared vm userptr invalidate race
> + *	multi-queue mixed shared vm userptr invalidate race
>   * @multi-queue-mixed-fd-basic:
>   *	multi-queue mixed fd basic
>   * @multi-queue-mixed-fd-userptr:
> - *	multi-queue-mixed fd userptr
> + *	multi-queue mixed fd userptr
>   * @multi-queue-mixed-fd-rebind:
> - *	multi-queue-mixed fd rebind
> + *	multi-queue mixed fd rebind
>   * @multi-queue-mixed-fd-userptr-rebind:
> - *	multi-queue-mixed fd userptr rebind
> + *	multi-queue mixed fd userptr rebind
>   * @multi-queue-mixed-fd-userptr-invalidate:
> - *	multi-queue-mixed fd userptr invalidate
> + *	multi-queue mixed fd userptr invalidate
>   * @multi-queue-mixed-fd-userptr-invalidate-race:
> - *	multi-queue-mixed fd userptr invalidate race
> + *	multi-queue mixed fd userptr invalidate race
>   * @multi-queue-cm-basic:
> - * 	multi-queue cm basic
> + *	multi-queue cm basic
>   * @multi-queue-cm-fd-basic:
> - * 	multi-queue cm fd basic
> + *	multi-queue cm fd basic
>   * @multi-queue-cm-userptr:
>   *	multi-queue compute mode userptr
>   * @multi-queue-cm-rebind:
> -- 
> 2.43.0
> 
