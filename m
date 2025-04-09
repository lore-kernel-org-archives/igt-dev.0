Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49B8C36002
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 08:24:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9367A10E807;
	Wed,  9 Apr 2025 08:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WYbGbWu5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0D710E807
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 08:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744187043; x=1775723043;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QEsfsGuqwK9Dy/zxN/baZqGdJO+oZtPwgxOOpwKQz58=;
 b=WYbGbWu5reFHoXBxoGKfmGHHjFwpGDkR0XJy0Ypoo9p4QxTvhLS1MoRD
 wvkv+o/01nunRlysYe5JD2ZniD4VDZ4sCOlC85RgeC75pNnK3m/+Wsqj3
 9a0o+DDYvEQGFQr4VQ8CM3qBUiyFLmtg5VyOhxhr1w36qt1ZDZ7ZhYHOf
 s/v9QSbNVjz+RdwgQMaNJxWXlR3dT4WH8mJ88NFUcPYxUUX7p+3kzDME1
 srd7CJDfuYF7RUJazETn+TQtltlp8G0vwOY5PCy9xmqgQmw9M4MToqg0I
 XD8i4jemFOfDl16OYKC+PP+LHn1inDiFeDfTnO6k46B556t6YNSemV5d0 Q==;
X-CSE-ConnectionGUID: 2pfmZUKSQ/qN+zBu/PK7Lw==
X-CSE-MsgGUID: 7NIywPv4T5uJoJ9SNNvOag==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="63047956"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="63047956"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 01:24:03 -0700
X-CSE-ConnectionGUID: OIEmUUdsSP+gcgphdQ6ISg==
X-CSE-MsgGUID: gQhhdj6gTEmzFtUQ1tFfNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="129031035"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.219])
 ([10.245.246.219])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 01:24:01 -0700
Message-ID: <056c9090-0513-4e11-ab4b-2a152d3624dc@intel.com>
Date: Wed, 9 Apr 2025 10:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/1] tests/intel/xe_*: Add missing test
 documentation
To: Jan Sokolowski <jan.sokolowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20250407072635.286850-1-jan.sokolowski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250407072635.286850-1-jan.sokolowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Jan

On 7.04.2025 09:26, Jan Sokolowski wrote:
> Add missing Mega features, Sub-categories and Functionality
> tags to various eu debug tests.
> 
> v2: Updated according to comments on v1 made by Katarzyna Piecielska
> v3: Updated according to comments on v1 made by Cristoph Manszewski
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> Reviewed-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

I don't recall adding Reviewed-by to this change. Please don't force it 
into a commit without my approval.

Christoph


> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>   tests/intel/xe_eudebug.c          | 48 +++++++++++++++++++++++++------
>   tests/intel/xe_eudebug_online.c   | 26 +++++++++++++++--
>   tests/intel/xe_eudebug_sriov.c    |  6 ++++
>   tests/intel/xe_exec_sip_eudebug.c | 12 ++++++++
>   4 files changed, 82 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index 76870805c..d1583fd84 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -7,7 +7,7 @@
>    * TEST: Test EU Debugger functionality
>    * Category: Core
>    * Mega feature: EUdebug
> - * Sub-category: EUdebug tests
> + * Sub-category: EUdebug framework
>    * Functionality: eu debugger framework
>    * Test category: functionality test
>    */
> @@ -28,6 +28,7 @@
>   
>   /**
>    * SUBTEST: sysfs-toggle
> + * Functionality: enable
>    * Description:
>    *	Exercise the debugger enable/disable sysfs toggle logic
>    */
> @@ -542,6 +543,7 @@ static int __debug_connect(int fd, int *debugfd, struct drm_xe_eudebug_connect *
>   
>   /**
>    * SUBTEST: basic-connect
> + * Functionality: attach
>    * Description:
>    *	Exercise XE_EUDEBUG_CONNECT ioctl with passing
>    *	valid and invalid params.
> @@ -622,6 +624,7 @@ static void switch_user(__uid_t uid, __gid_t gid)
>   
>   /**
>    * SUBTEST: connect-user
> + * Functionality: attach
>    * Description:
>    *	Verify unprivileged XE_EUDEBUG_CONNECT ioctl.
>    *	Check:
> @@ -758,6 +761,7 @@ static void test_connect_user(int fd)
>   
>   /**
>    * SUBTEST: basic-close
> + * Functionality: attach
>    * Description:
>    *	Test whether eudebug can be reattached after closure.
>    */
> @@ -786,6 +790,7 @@ static void test_close(int fd)
>   
>   /**
>    * SUBTEST: basic-read-event
> + * Functionality: events
>    * Description:
>    *	Synchronously exercise eu debugger event polling and reading.
>    */
> @@ -881,50 +886,59 @@ static void test_read_event(int fd)
>   
>   /**
>    * SUBTEST: basic-client
> + * Functionality: attach
>    * Description:
>    *	Attach the debugger to process which opens and closes xe drm client.
>    *
>    * SUBTEST: basic-client-th
> + * Functionality: attach
>    * Description:
>    *	Create client basic resources (vms) in multiple threads
>    *
>    * SUBTEST: multiple-sessions
> + * Functionality: multisessions
>    * Description:
>    *	Simultaneously attach many debuggers to many processes.
>    *	Each process opens and closes xe drm client and creates few resources.
>    *
> - * SUBTEST: basic-%s
> + * SUBTEST: basic-exec-queues
> + * Functionality: exec queues events
>    * Description:
> - *	Attach the debugger to process which creates and destroys a few %arg[1].
> + *	Attach the debugger to process which creates and destroys a few exec-queues.
> + *
> + * SUBTEST: basic-vms
> + * Functionality: VM events
> + * Description:
> + *	Attach the debugger to process which creates and destroys a few vms.
>    *
>    * SUBTEST: basic-vm-bind
> + * Functionality: VM bind event
>    * Description:
>    *	Attach the debugger to a process that performs synchronous vm bind
>    *	and vm unbind.
>    *
>    * SUBTEST: basic-vm-bind-vm-destroy
> + * Functionality: VM bind event
>    * Description:
>    *	Attach the debugger to a process that performs vm bind, and destroys
>    *	the vm without unbinding. Make sure that we don't get unbind events.
>    *
>    * SUBTEST: basic-vm-bind-extended
> + * Functionality: VM bind event
>    * Description:
>    *	Attach the debugger to a process that performs bind, bind array, rebind,
>    *	partial unbind, unbind and unbind all operations.
>    *
>    * SUBTEST: multigpu-basic-client
> + * Functionality: attach multiGPU
>    * Description:
>    *	Attach the debugger to process which opens and closes xe drm client on all Xe devices.
>    *
>    * SUBTEST: multigpu-basic-client-many
> + * Functionality: attach multiGPU
>    * Description:
>    *	Simultaneously attach many debuggers to many processes on all Xe devices.
>    *	Each process opens and closes xe drm client and creates few resources.
> - *
> - * arg[1]:
> - *
> - * @vms: vms
> - * @exec-queues: exec queues
>    */
>   
>   static void test_basic_sessions(int fd, unsigned int flags, int count, bool match_opposite)
> @@ -951,22 +965,26 @@ static void test_basic_sessions(int fd, unsigned int flags, int count, bool matc
>   
>   /**
>    * SUBTEST: basic-vm-bind-discovery
> + * Functionality: VM bind event
>    * Description:
>    *	Attach the debugger to a process that performs vm-bind before attaching
>    *	and check if the discovery process reports it.
>    *
>    * SUBTEST: basic-vm-bind-metadata-discovery
> + * Functionality: VM bind metadata
>    * Description:
>    *	Attach the debugger to a process that performs vm-bind with metadata attached
>    *	before attaching and check if the discovery process reports it.
>    *
>    * SUBTEST: basic-vm-bind-vm-destroy-discovery
> + * Functionality: VM bind event
>    * Description:
>    *	Attach the debugger to a process that performs vm bind, and destroys
>    *	the vm without unbinding before attaching. Make sure that we don't get
>    *	any bind/unbind and vm create/destroy events.
>    *
>    * SUBTEST: basic-vm-bind-extended-discovery
> + * Functionality: VM bind event
>    * Description:
>    *	Attach the debugger to a process that performs bind, bind array, rebind,
>    *	partial unbind, and unbind all operations before attaching. Ensure that
> @@ -1077,6 +1095,7 @@ static void run_discovery_client(struct xe_eudebug_client *c)
>   
>   /**
>    * SUBTEST: discovery-%s
> + * Functionality: event discovery
>    * Description: Race discovery against %arg[1] and the debugger dettach.
>    *
>    * arg[1]:
> @@ -1562,12 +1581,14 @@ static void vm_trigger(struct xe_eudebug_debugger *d,
>   
>   /**
>    * SUBTEST: basic-vm-access
> + * Functionality: VM access
>    * Description:
>    *      Exercise XE_EUDEBUG_VM_OPEN with pread and pwrite into the
>    *      vm fd, concerning many different offsets inside the vm,
>    *      and many virtual addresses of the vm_bound object.
>    *
>    * SUBTEST: basic-vm-access-userptr
> + * Functionality: VM access
>    * Description:
>    *      Exercise XE_EUDEBUG_VM_OPEN with pread and pwrite into the
>    *      vm fd, concerning many different offsets inside the vm,
> @@ -1713,11 +1734,13 @@ static void vm_trigger_access_parameters(struct xe_eudebug_debugger *d,
>   
>   /**
>    * SUBTEST: basic-vm-access-parameters
> + * Functionality: VM access
>    * Description:
>    *      Check negative scenarios of VM_OPEN ioctl and pread/pwrite usage
>    *      with bo backing storage.
>    *
>    * SUBTEST: basic-vm-access-parameters-userptr
> + * Functionality: VM access
>    * Description:
>    *      Check negative scenarios of VM_OPEN ioctl and pread/pwrite usage
>    *      with userptr backing storage.
> @@ -1845,6 +1868,7 @@ static void metadata_read_on_vm_bind_trigger(struct xe_eudebug_debugger *d,
>   
>   /**
>    * SUBTEST: read-metadata
> + * Functionality: metadata
>    * Description:
>    *      Exercise DRM_XE_EUDEBUG_IOCTL_READ_METADATA and debug metadata create|destroy events.
>    */
> @@ -1857,6 +1881,7 @@ static void test_metadata_read(int fd, unsigned int flags, int num_clients)
>   
>   /**
>    * SUBTEST: attach-debug-metadata
> + * Functionality: metadata
>    * Description:
>    *      Read debug metadata when vm_bind has it attached.
>    */
> @@ -2073,19 +2098,23 @@ static int wait_for_ufence_events(struct ufence_priv *priv, int timeout_ms)
>   
>   /**
>    * SUBTEST: basic-vm-bind-ufence
> + * Functionality: VM bind event
>    * Description:
>    *      Give user fence in application and check if ufence ack works
>    *
>    * SUBTEST: basic-vm-bind-ufence-delay-ack
> + * Functionality: VM bind event
>    * Description:
>    *	Give user fence in application and check if delayed ufence ack works
>    *
>    * SUBTEST: basic-vm-bind-ufence-reconnect
> + * Functionality: VM bind event
>    * Description:
>    *	Give user fence in application, hold it, drop the debugger connection and check if anything
>    *	breaks. Expect that held acks are released when connection is dropped.
>    *
>    * SUBTEST: basic-vm-bind-ufence-sigint-client
> + * Functionality: SIGINT
>    * Description:
>    *	Give user fence in application, hold it, send SIGINT to client and check if anything breaks.
>    */
> @@ -2395,6 +2424,7 @@ static void vm_bind_clear_ack_trigger(struct xe_eudebug_debugger *d,
>   
>   /**
>    * SUBTEST: vm-bind-clear
> + * Functionality: memory access
>    * Description:
>    *      Check that fresh buffers we vm_bind into the ppGTT are always clear.
>    */
> @@ -2610,6 +2640,7 @@ static void vma_ufence_trigger(struct xe_eudebug_debugger *d,
>   
>   /**
>    * SUBTEST: vma-ufence
> + * Functionality: check ufence blocking
>    * Description:
>    *      Intercept vm bind after receiving ufence event, then access target vm and write to it.
>    *      Then check on client side if the write was successful.
> @@ -2647,6 +2678,7 @@ static void test_vma_ufence(int fd, unsigned int flags)
>   
>   /**
>    * SUBTEST: basic-exec-queues-enable
> + * Functionality: exec queues events
>    * Description:
>    *      Test the exec queue property of enabling eudebug
>    */
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 84ba748c1..582a26dca 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -7,7 +7,7 @@
>    * TEST: Tests for eudebug online functionality
>    * Category: Core
>    * Mega feature: EUdebug
> - * Sub-category: EUdebug tests
> + * Sub-category: EUdebug online
>    * Functionality: eu kernel debug
>    * Test category: functionality test
>    */
> @@ -1430,23 +1430,27 @@ static void pagefault_trigger(struct xe_eudebug_debugger *d,
>   
>   /**
>    * SUBTEST: basic-breakpoint
> + * Functionality: EU attention event
>    * Description:
>    *	Check whether KMD sends attention events
>    *	for workload in debug mode stopped on breakpoint.
>    *
>    * SUBTEST: breakpoint-not-in-debug-mode
> + * Functionality: EU attention event
>    * Description:
>    *	Check whether KMD resets the GPU when it spots an attention
>    *	coming from workload not in debug mode.
>    *
>    * SUBTEST: stopped-thread
> + * Functionality: EU attention event
>    * Description:
>    *	Hits breakpoint on runalone workload and
>    *	reads attention for fixed time.
>    *
>    * SUBTEST: resume-%s
> + * Functionality: EU control
>    * Description:
> - *	Resumes stopped on a breakpoint workload
> + *	Workload stopped on a breakpoint is resumed
>    *	with granularity of %arg[1].
>    *
>    *
> @@ -1479,6 +1483,7 @@ static void test_basic_online(int fd, struct drm_xe_engine_class_instance *hwe,
>   
>   /**
>    * SUBTEST: set-breakpoint
> + * Functionality: dynamic breakpoint
>    * Description:
>    *	Checks for attention after setting a dynamic breakpoint in the ufence event.
>    */
> @@ -1511,6 +1516,7 @@ static void test_set_breakpoint_online(int fd, struct drm_xe_engine_class_instan
>   
>   /**
>    * SUBTEST: set-breakpoint-sigint-debugger
> + * Functionality: SIGINT
>    * Description:
>    *	A variant of set-breakpoint that sends SIGINT to the debugger thread with random timing
>    *	and checks if nothing breaks, exercising the scenario multiple times.
> @@ -1603,11 +1609,13 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
>   
>   /**
>    * SUBTEST: pagefault-read
> + * Functionality: page faults
>    * Description:
>    *     Check whether KMD sends pagefault event for workload in debug mode that
>    *     triggers a read pagefault.
>    *
>    * SUBTEST: pagefault-write
> + * Functionality: page faults
>    * Description:
>    *     Check whether KMD sends pagefault event for workload in debug mode that
>    *     triggers a write pagefault.
> @@ -1646,6 +1654,7 @@ static void test_pagefault_online(int fd, struct drm_xe_engine_class_instance *h
>   
>   /**
>    * SUBTEST: preempt-breakpoint
> + * Functionality: EUdebug preemption timeout
>    * Description:
>    *	Verify that eu debugger disables preemption timeout to
>    *	prevent reset of workload stopped on breakpoint.
> @@ -1691,6 +1700,7 @@ static void test_preemption(int fd, struct drm_xe_engine_class_instance *hwe)
>   
>   /**
>    * SUBTEST: reset-with-attention
> + * Functionality: EUdebug preemption timeout
>    * Description:
>    *	Check whether GPU is usable after resetting with attention raised
>    *	(stopped on breakpoint) by running the same workload again.
> @@ -1728,12 +1738,14 @@ static void test_reset_with_attention_online(int fd, struct drm_xe_engine_class_
>   
>   /**
>    * SUBTEST: interrupt-all
> + * Functionality: EU control
>    * Description:
>    *	Schedules EU workload which should last about a few seconds, then
>    *	interrupts all threads, checks whether attention event came, and
>    *	resumes stopped threads back.
>    *
>    * SUBTEST: interrupt-all-set-breakpoint
> + * Functionality: dynamic breakpoint
>    * Description:
>    *	Schedules EU workload which should last about a few seconds, then
>    *	interrupts all threads, once attention event come it sets breakpoint on
> @@ -1815,12 +1827,14 @@ static void reset_debugger_log(struct xe_eudebug_debugger *d)
>   
>   /**
>    * SUBTEST: interrupt-other-debuggable
> + * Functionality: EU control
>    * Description:
>    *	Schedules EU workload in runalone mode with never ending loop, while
>    *	it is not under debug, tries to interrupt all threads using the different
>    *	client attached to debugger.
>    *
>    * SUBTEST: interrupt-other
> + * Functionality: EU control
>    * Description:
>    *	Schedules EU workload with a never ending loop and, while it is not
>    *	configured for debugging, tries to interrupt all threads using the client
> @@ -1909,6 +1923,7 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
>   
>   /**
>    * SUBTEST: tdctl-parameters
> + * Functionality: EU control
>    * Description:
>    *	Schedules EU workload which should last about a few seconds, then
>    *	checks negative scenarios of EU_THREADS ioctl usage, interrupts all threads,
> @@ -2061,6 +2076,7 @@ static void eu_attention_debugger_detach_trigger(struct xe_eudebug_debugger *d,
>   
>   /**
>    * SUBTEST: interrupt-reconnect
> + * Functionality: reopen connection
>    * Description:
>    *	Schedules EU workload which should last about a few seconds,
>    *	interrupts all threads and detaches debugger when attention is
> @@ -2134,12 +2150,14 @@ static void test_interrupt_reconnect(int fd, struct drm_xe_engine_class_instance
>   
>   /**
>    * SUBTEST: single-step
> + * Functionality: EU control
>    * Description:
>    *	Schedules EU workload with 16 nops after breakpoint, then single-steps
>    *	through the shader, advances all threads each step, checking if all
>    *	threads advanced every step.
>    *
>    * SUBTEST: single-step-one
> + * Functionality: EU control
>    * Description:
>    *	Schedules EU workload with 16 nops after breakpoint, then single-steps
>    *	through the shader, advances one thread each step, checking if one
> @@ -2191,6 +2209,7 @@ static void eu_attention_debugger_ndetach_trigger(struct xe_eudebug_debugger *d,
>   
>   /**
>    * SUBTEST: debugger-reopen
> + * Functionality: reopen connection
>    * Description:
>    *	Check whether the debugger is able to reopen the connection and
>    *	capture the events of already running client.
> @@ -2221,6 +2240,7 @@ static void test_debugger_reopen(int fd, struct drm_xe_engine_class_instance *hw
>   
>   /**
>    * SUBTEST: writes-caching-%s-bb-%s-target-%s
> + * Functionality: cache coherency
>    * Description:
>    *	Write incrementing values to 2-page-long target surface, poisoning the data one breakpoint
>    *	before each write instruction and restoring it when the poisoned instruction breakpoint
> @@ -2346,12 +2366,14 @@ static uint64_t timespecs_diff_us(struct timespec *ts1, struct timespec *ts2)
>   
>   /**
>    * SUBTEST: breakpoint-many-sessions-single-tile
> + * Functionality: multisession
>    * Description:
>    *	Schedules EU workload with preinstalled breakpoint on every compute engine
>    *	available on the tile. Checks if the contexts hit breakpoint in sequence
>    *	and resumes them.
>    *
>    * SUBTEST: breakpoint-many-sessions-tiles
> + * Functionality: multisession multiTile
>    * Description:
>    *	Schedules EU workload with preinstalled breakpoint on selected compute
>    *      engines, with one per tile. Checks if each context hit breakpoint and
> diff --git a/tests/intel/xe_eudebug_sriov.c b/tests/intel/xe_eudebug_sriov.c
> index eb13981bc..4f20a3e49 100644
> --- a/tests/intel/xe_eudebug_sriov.c
> +++ b/tests/intel/xe_eudebug_sriov.c
> @@ -37,6 +37,9 @@ static bool has_vf_enable_eudebug_attr(int fd, unsigned int vf_num)
>   
>   /**
>    * SUBTEST: deny-eudebug
> + * Mega feature: EUdebug
> + * Sub-category: EUdebug framework
> + * Functionality: EU debug and SR-IOV
>    * Description:
>    *	Check that eudebug toggle is not available for VFs, and that enabling
>    *	eudebug with VFs enabled is not permitted.
> @@ -74,6 +77,9 @@ static void test_deny_eudebug(int fd)
>   
>   /**
>    * SUBTEST: deny-sriov
> + * Mega feature: EUdebug
> + * Sub-category: EUdebug framework
> + * Functionality: EU debug and SR-IOV
>    * Description:
>    *	Check that VFs cannot be enabled when eudebug is enabled.
>    */
> diff --git a/tests/intel/xe_exec_sip_eudebug.c b/tests/intel/xe_exec_sip_eudebug.c
> index c317112b4..e5b8ba418 100644
> --- a/tests/intel/xe_exec_sip_eudebug.c
> +++ b/tests/intel/xe_exec_sip_eudebug.c
> @@ -217,22 +217,34 @@ xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
>   
>   /**
>    * SUBTEST: wait-writesip-nodebug
> + * Sub-category: EUdebug HW
> + * Functionality: EU debugger SIP interaction
>    * Description: verify that we don't enter SIP after wait with debugging disabled.
>    *
>    * SUBTEST: breakpoint-writesip-nodebug
> + * Sub-category: EUdebug HW
> + * Functionality: EU debugger SIP interaction
>    * Description: verify that we don't enter SIP after hitting breakpoint in shader
>    *		when debugging is disabled.
>    *
>    * SUBTEST: breakpoint-writesip
> + * Sub-category: EUdebug HW
> + * Functionality: EU debugger SIP interaction
>    * Description: Test that we enter SIP after hitting breakpoint in shader.
>    *
>    * SUBTEST: breakpoint-writesip-twice
> + * Sub-category: EUdebug HW
> + * Functionality: EU debugger SIP interaction
>    * Description: Test twice that we enter SIP after hitting breakpoint in shader.
>    *
>    * SUBTEST: breakpoint-waitsip
> + * Sub-category: EUdebug HW
> + * Functionality: EU debugger SIP interaction
>    * Description: Test that we reset after seeing the attention without the debugger.
>    *
>    * SUBTEST: breakpoint-waitsip-heavy
> + * Sub-category: EUdebug HW
> + * Functionality: EU debugger SIP interaction
>    * Description:
>    *	Test that we reset after seeing the attention from heavy SIP, that resembles
>    *	the production one, without the debugger.

