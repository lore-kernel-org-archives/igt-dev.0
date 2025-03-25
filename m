Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFEDC35FFC
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 10:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EB110E064;
	Tue, 25 Mar 2025 10:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bRaZ+gEC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0A210E064
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 10:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742897799; x=1774433799;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w+BcbIIzeqsOE/s+zh9KxLQuHczbyfZGu948PpPv3Bo=;
 b=bRaZ+gECyL4+jhEU7R+6wWHcpxr+NRh74U685pZ9MwB6u1o8IUjbq8RM
 EfGxKjR7q3W3XSuDD+askAbjpurvdmlx/2B5itLAawpKHoEiLYPCgSxW/
 meZUEXTkcFGOcU7rD0rAvZuFWU9sh/2jEH70y9ETfuaiMIQYed2fbpImJ
 WQIP6WGuw5D/VQshhuAyrQq+fcAXMJMoJ2JKWbU7wt6ufVH0vOsfUc7Da
 NS1MDowBASO94ApkHO8DUlcI1DWFBjhTOCsGWz79knuTO1Jzmko8X/GNr
 phgPw1bOfrK3iTpHy1U3e6v+RIWY/9itYmD/7gj9RgJHGEkaVHFJh9TOx Q==;
X-CSE-ConnectionGUID: 9s5e+ml0QhG6dcRqU2NIkw==
X-CSE-MsgGUID: R6zsEn4hTZiZEZzG1S08Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44024560"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="44024560"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 03:16:39 -0700
X-CSE-ConnectionGUID: 5fxXW06NQuit+l8t4emHlQ==
X-CSE-MsgGUID: +m3x0Ex4R62ejzB7BUiedQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="129152578"
Received: from artdev273.igk.intel.com ([172.28.176.8])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 03:16:38 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel/xe_*: Add missing test documentation
Date: Tue, 25 Mar 2025 10:15:44 +0000
Message-Id: <20250325101544.178430-1-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add missing Mega features, Sub-categories and Functionality
tags to various eu debug tests.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
---
 tests/intel/xe_eudebug.c          | 77 ++++++++++++++++++++++++++++---
 tests/intel/xe_eudebug_online.c   | 42 +++++++++++++++++
 tests/intel/xe_eudebug_sriov.c    |  6 +++
 tests/intel/xe_exec_sip_eudebug.c | 12 +++++
 4 files changed, 130 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 76870805c..bf9178a67 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -28,6 +28,8 @@
 
 /**
  * SUBTEST: sysfs-toggle
+ * Sub-category: EUdebug framework
+ * Functionality: enable
  * Description:
  *	Exercise the debugger enable/disable sysfs toggle logic
  */
@@ -542,6 +544,8 @@ static int __debug_connect(int fd, int *debugfd, struct drm_xe_eudebug_connect *
 
 /**
  * SUBTEST: basic-connect
+ * Sub-category: EUdebug framework
+ * Functionality: attach
  * Description:
  *	Exercise XE_EUDEBUG_CONNECT ioctl with passing
  *	valid and invalid params.
@@ -622,6 +626,8 @@ static void switch_user(__uid_t uid, __gid_t gid)
 
 /**
  * SUBTEST: connect-user
+ * Sub-category: EUdebug framework
+ * Functionality: attach
  * Description:
  *	Verify unprivileged XE_EUDEBUG_CONNECT ioctl.
  *	Check:
@@ -758,6 +764,8 @@ static void test_connect_user(int fd)
 
 /**
  * SUBTEST: basic-close
+ * Sub-category: EUdebug framework
+ * Functionality: attach
  * Description:
  *	Test whether eudebug can be reattached after closure.
  */
@@ -786,6 +794,8 @@ static void test_close(int fd)
 
 /**
  * SUBTEST: basic-read-event
+ * Sub-category: EUdebug framework
+ * Functionality: events
  * Description:
  *	Synchronously exercise eu debugger event polling and reading.
  */
@@ -881,50 +891,69 @@ static void test_read_event(int fd)
 
 /**
  * SUBTEST: basic-client
+ * Sub-category: EUdebug framework
+ * Functionality: attach
  * Description:
  *	Attach the debugger to process which opens and closes xe drm client.
  *
  * SUBTEST: basic-client-th
+ * Sub-category: EUdebug framework
+ * Functionality: attach
  * Description:
  *	Create client basic resources (vms) in multiple threads
  *
  * SUBTEST: multiple-sessions
+ * Sub-category: EUdebug framework
+ * Functionality: multisessions
  * Description:
  *	Simultaneously attach many debuggers to many processes.
  *	Each process opens and closes xe drm client and creates few resources.
  *
- * SUBTEST: basic-%s
+ * SUBTEST: basic-exec-queues
+ * Sub-category: EUdebug framework
+ * Functionality: exec queues events
  * Description:
- *	Attach the debugger to process which creates and destroys a few %arg[1].
+ *	Attach the debugger to process which creates and destroys a few exec-queues.
+ *
+ * SUBTEST: basic-vms
+ * Sub-category: EUdebug framework
+ * Functionality: VM events
+ * Description:
+ *	Attach the debugger to process which creates and destroys a few vms.
  *
  * SUBTEST: basic-vm-bind
+ * Sub-category: EUdebug framework
+ * Functionality: VM bind event
  * Description:
  *	Attach the debugger to a process that performs synchronous vm bind
  *	and vm unbind.
  *
  * SUBTEST: basic-vm-bind-vm-destroy
+ * Sub-category: EUdebug framework
+ * Functionality: VM bind event
  * Description:
  *	Attach the debugger to a process that performs vm bind, and destroys
  *	the vm without unbinding. Make sure that we don't get unbind events.
  *
  * SUBTEST: basic-vm-bind-extended
+ * Sub-category: EUdebug framework
+ * Functionality: VM bind event
  * Description:
  *	Attach the debugger to a process that performs bind, bind array, rebind,
  *	partial unbind, unbind and unbind all operations.
  *
  * SUBTEST: multigpu-basic-client
+ * Sub-category: EUdebug framework
+ * Functionality: attach multiGPU
  * Description:
  *	Attach the debugger to process which opens and closes xe drm client on all Xe devices.
  *
  * SUBTEST: multigpu-basic-client-many
+ * Sub-category: EUdebug framework
+ * Functionality: attach multiGPU
  * Description:
  *	Simultaneously attach many debuggers to many processes on all Xe devices.
  *	Each process opens and closes xe drm client and creates few resources.
- *
- * arg[1]:
- *
- * @vms: vms
- * @exec-queues: exec queues
  */
 
 static void test_basic_sessions(int fd, unsigned int flags, int count, bool match_opposite)
@@ -951,22 +980,30 @@ static void test_basic_sessions(int fd, unsigned int flags, int count, bool matc
 
 /**
  * SUBTEST: basic-vm-bind-discovery
+ * Sub-category: EUdebug framework
+ * Functionality: VM bind event
  * Description:
  *	Attach the debugger to a process that performs vm-bind before attaching
  *	and check if the discovery process reports it.
  *
  * SUBTEST: basic-vm-bind-metadata-discovery
+ * Sub-category: EUdebug framework
+ * Functionality: VM bind event
  * Description:
  *	Attach the debugger to a process that performs vm-bind with metadata attached
  *	before attaching and check if the discovery process reports it.
  *
  * SUBTEST: basic-vm-bind-vm-destroy-discovery
+ * Sub-category: EUdebug framework
+ * Functionality: VM bind event
  * Description:
  *	Attach the debugger to a process that performs vm bind, and destroys
  *	the vm without unbinding before attaching. Make sure that we don't get
  *	any bind/unbind and vm create/destroy events.
  *
  * SUBTEST: basic-vm-bind-extended-discovery
+ * Sub-category: EUdebug framework
+ * Functionality: VM bind event
  * Description:
  *	Attach the debugger to a process that performs bind, bind array, rebind,
  *	partial unbind, and unbind all operations before attaching. Ensure that
@@ -1077,6 +1114,8 @@ static void run_discovery_client(struct xe_eudebug_client *c)
 
 /**
  * SUBTEST: discovery-%s
+ * Sub-category: EUdebug framework
+ * Functionality: event discovery
  * Description: Race discovery against %arg[1] and the debugger dettach.
  *
  * arg[1]:
@@ -1562,12 +1601,16 @@ static void vm_trigger(struct xe_eudebug_debugger *d,
 
 /**
  * SUBTEST: basic-vm-access
+ * Sub-category: EUdebug framework
+ * Functionality: VM access
  * Description:
  *      Exercise XE_EUDEBUG_VM_OPEN with pread and pwrite into the
  *      vm fd, concerning many different offsets inside the vm,
  *      and many virtual addresses of the vm_bound object.
  *
  * SUBTEST: basic-vm-access-userptr
+ * Sub-category: EUdebug framework
+ * Functionality: VM access
  * Description:
  *      Exercise XE_EUDEBUG_VM_OPEN with pread and pwrite into the
  *      vm fd, concerning many different offsets inside the vm,
@@ -1713,11 +1756,15 @@ static void vm_trigger_access_parameters(struct xe_eudebug_debugger *d,
 
 /**
  * SUBTEST: basic-vm-access-parameters
+ * Sub-category: EUdebug framework
+ * Functionality: VM access
  * Description:
  *      Check negative scenarios of VM_OPEN ioctl and pread/pwrite usage
  *      with bo backing storage.
  *
  * SUBTEST: basic-vm-access-parameters-userptr
+ * Sub-category: EUdebug framework
+ * Functionality: VM access
  * Description:
  *      Check negative scenarios of VM_OPEN ioctl and pread/pwrite usage
  *      with userptr backing storage.
@@ -1845,6 +1892,8 @@ static void metadata_read_on_vm_bind_trigger(struct xe_eudebug_debugger *d,
 
 /**
  * SUBTEST: read-metadata
+ * Sub-category: EUdebug framework
+ * Functionality: metadata
  * Description:
  *      Exercise DRM_XE_EUDEBUG_IOCTL_READ_METADATA and debug metadata create|destroy events.
  */
@@ -1857,6 +1906,8 @@ static void test_metadata_read(int fd, unsigned int flags, int num_clients)
 
 /**
  * SUBTEST: attach-debug-metadata
+ * Sub-category: EUdebug framework
+ * Functionality: metadata
  * Description:
  *      Read debug metadata when vm_bind has it attached.
  */
@@ -2073,19 +2124,27 @@ static int wait_for_ufence_events(struct ufence_priv *priv, int timeout_ms)
 
 /**
  * SUBTEST: basic-vm-bind-ufence
+ * Sub-category: EUdebug framework
+ * Functionality: VM bind event
  * Description:
  *      Give user fence in application and check if ufence ack works
  *
  * SUBTEST: basic-vm-bind-ufence-delay-ack
+ * Sub-category: EUdebug framework
+ * Functionality: VM bind event
  * Description:
  *	Give user fence in application and check if delayed ufence ack works
  *
  * SUBTEST: basic-vm-bind-ufence-reconnect
+ * Sub-category: EUdebug framework
+ * Functionality: VM bind event
  * Description:
  *	Give user fence in application, hold it, drop the debugger connection and check if anything
  *	breaks. Expect that held acks are released when connection is dropped.
  *
  * SUBTEST: basic-vm-bind-ufence-sigint-client
+ * Sub-category: EUdebug framework
+ * Functionality: SIGINT
  * Description:
  *	Give user fence in application, hold it, send SIGINT to client and check if anything breaks.
  */
@@ -2395,6 +2454,8 @@ static void vm_bind_clear_ack_trigger(struct xe_eudebug_debugger *d,
 
 /**
  * SUBTEST: vm-bind-clear
+ * Sub-category: EUdebug framework
+ * Functionality: memory access
  * Description:
  *      Check that fresh buffers we vm_bind into the ppGTT are always clear.
  */
@@ -2610,6 +2671,8 @@ static void vma_ufence_trigger(struct xe_eudebug_debugger *d,
 
 /**
  * SUBTEST: vma-ufence
+ * Sub-category: EUdebug framework
+ * Functionality: check ufence blocking
  * Description:
  *      Intercept vm bind after receiving ufence event, then access target vm and write to it.
  *      Then check on client side if the write was successful.
diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 84ba748c1..c4409f8a5 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1430,21 +1430,29 @@ static void pagefault_trigger(struct xe_eudebug_debugger *d,
 
 /**
  * SUBTEST: basic-breakpoint
+ * Sub-category: EUdebug online
+ * Functionality: EU attention event
  * Description:
  *	Check whether KMD sends attention events
  *	for workload in debug mode stopped on breakpoint.
  *
  * SUBTEST: breakpoint-not-in-debug-mode
+ * Sub-category: EUdebug online
+ * Functionality: EU attention event
  * Description:
  *	Check whether KMD resets the GPU when it spots an attention
  *	coming from workload not in debug mode.
  *
  * SUBTEST: stopped-thread
+ * Sub-category: EUdebug online
+ * Functionality: EU attention event
  * Description:
  *	Hits breakpoint on runalone workload and
  *	reads attention for fixed time.
  *
  * SUBTEST: resume-%s
+ * Sub-category: EUdebug online
+ * Functionality: EU control
  * Description:
  *	Resumes stopped on a breakpoint workload
  *	with granularity of %arg[1].
@@ -1479,6 +1487,8 @@ static void test_basic_online(int fd, struct drm_xe_engine_class_instance *hwe,
 
 /**
  * SUBTEST: set-breakpoint
+ * Sub-category: EUdebug online
+ * Functionality: dynamic breakpoint
  * Description:
  *	Checks for attention after setting a dynamic breakpoint in the ufence event.
  */
@@ -1603,11 +1613,15 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 
 /**
  * SUBTEST: pagefault-read
+ * Sub-category: EUdebug online
+ * Functionality: page faults
  * Description:
  *     Check whether KMD sends pagefault event for workload in debug mode that
  *     triggers a read pagefault.
  *
  * SUBTEST: pagefault-write
+ * Sub-category: EUdebug online
+ * Functionality: page faults
  * Description:
  *     Check whether KMD sends pagefault event for workload in debug mode that
  *     triggers a write pagefault.
@@ -1646,6 +1660,8 @@ static void test_pagefault_online(int fd, struct drm_xe_engine_class_instance *h
 
 /**
  * SUBTEST: preempt-breakpoint
+ * Sub-category: EUdebug online
+ * Functionality: EUdebug preemption timeout
  * Description:
  *	Verify that eu debugger disables preemption timeout to
  *	prevent reset of workload stopped on breakpoint.
@@ -1691,6 +1707,8 @@ static void test_preemption(int fd, struct drm_xe_engine_class_instance *hwe)
 
 /**
  * SUBTEST: reset-with-attention
+ * Sub-category: EUdebug online
+ * Functionality: EUdebug preemption timeout
  * Description:
  *	Check whether GPU is usable after resetting with attention raised
  *	(stopped on breakpoint) by running the same workload again.
@@ -1728,12 +1746,16 @@ static void test_reset_with_attention_online(int fd, struct drm_xe_engine_class_
 
 /**
  * SUBTEST: interrupt-all
+ * Sub-category: EUdebug online
+ * Functionality: EU control
  * Description:
  *	Schedules EU workload which should last about a few seconds, then
  *	interrupts all threads, checks whether attention event came, and
  *	resumes stopped threads back.
  *
  * SUBTEST: interrupt-all-set-breakpoint
+ * Sub-category: EUdebug online
+ * Functionality: dynamic breakpoint
  * Description:
  *	Schedules EU workload which should last about a few seconds, then
  *	interrupts all threads, once attention event come it sets breakpoint on
@@ -1815,12 +1837,16 @@ static void reset_debugger_log(struct xe_eudebug_debugger *d)
 
 /**
  * SUBTEST: interrupt-other-debuggable
+ * Sub-category: EUdebug online
+ * Functionality: EU control
  * Description:
  *	Schedules EU workload in runalone mode with never ending loop, while
  *	it is not under debug, tries to interrupt all threads using the different
  *	client attached to debugger.
  *
  * SUBTEST: interrupt-other
+ * Sub-category: EUdebug online
+ * Functionality: EU control
  * Description:
  *	Schedules EU workload with a never ending loop and, while it is not
  *	configured for debugging, tries to interrupt all threads using the client
@@ -1909,6 +1935,8 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
 
 /**
  * SUBTEST: tdctl-parameters
+ * Sub-category: EUdebug online
+ * Functionality: EU control
  * Description:
  *	Schedules EU workload which should last about a few seconds, then
  *	checks negative scenarios of EU_THREADS ioctl usage, interrupts all threads,
@@ -2061,6 +2089,8 @@ static void eu_attention_debugger_detach_trigger(struct xe_eudebug_debugger *d,
 
 /**
  * SUBTEST: interrupt-reconnect
+ * Sub-category: EUdebug online
+ * Functionality: reopen connection
  * Description:
  *	Schedules EU workload which should last about a few seconds,
  *	interrupts all threads and detaches debugger when attention is
@@ -2134,12 +2164,16 @@ static void test_interrupt_reconnect(int fd, struct drm_xe_engine_class_instance
 
 /**
  * SUBTEST: single-step
+ * Sub-category: EUdebug online
+ * Functionality: EU control
  * Description:
  *	Schedules EU workload with 16 nops after breakpoint, then single-steps
  *	through the shader, advances all threads each step, checking if all
  *	threads advanced every step.
  *
  * SUBTEST: single-step-one
+ * Sub-category: EUdebug online
+ * Functionality: EU control
  * Description:
  *	Schedules EU workload with 16 nops after breakpoint, then single-steps
  *	through the shader, advances one thread each step, checking if one
@@ -2191,6 +2225,8 @@ static void eu_attention_debugger_ndetach_trigger(struct xe_eudebug_debugger *d,
 
 /**
  * SUBTEST: debugger-reopen
+ * Sub-category: EUdebug online
+ * Functionality: reopen connection
  * Description:
  *	Check whether the debugger is able to reopen the connection and
  *	capture the events of already running client.
@@ -2221,6 +2257,8 @@ static void test_debugger_reopen(int fd, struct drm_xe_engine_class_instance *hw
 
 /**
  * SUBTEST: writes-caching-%s-bb-%s-target-%s
+ * Sub-category: EUdebug online
+ * Functionality: cache coherency
  * Description:
  *	Write incrementing values to 2-page-long target surface, poisoning the data one breakpoint
  *	before each write instruction and restoring it when the poisoned instruction breakpoint
@@ -2346,12 +2384,16 @@ static uint64_t timespecs_diff_us(struct timespec *ts1, struct timespec *ts2)
 
 /**
  * SUBTEST: breakpoint-many-sessions-single-tile
+ * Sub-category: EUdebug online
+ * Functionality: multisession
  * Description:
  *	Schedules EU workload with preinstalled breakpoint on every compute engine
  *	available on the tile. Checks if the contexts hit breakpoint in sequence
  *	and resumes them.
  *
  * SUBTEST: breakpoint-many-sessions-tiles
+ * Sub-category: EUdebug online
+ * Functionality: multisession multiTile
  * Description:
  *	Schedules EU workload with preinstalled breakpoint on selected compute
  *      engines, with one per tile. Checks if each context hit breakpoint and
diff --git a/tests/intel/xe_eudebug_sriov.c b/tests/intel/xe_eudebug_sriov.c
index eb13981bc..4f20a3e49 100644
--- a/tests/intel/xe_eudebug_sriov.c
+++ b/tests/intel/xe_eudebug_sriov.c
@@ -37,6 +37,9 @@ static bool has_vf_enable_eudebug_attr(int fd, unsigned int vf_num)
 
 /**
  * SUBTEST: deny-eudebug
+ * Mega feature: EUdebug
+ * Sub-category: EUdebug framework
+ * Functionality: EU debug and SR-IOV
  * Description:
  *	Check that eudebug toggle is not available for VFs, and that enabling
  *	eudebug with VFs enabled is not permitted.
@@ -74,6 +77,9 @@ static void test_deny_eudebug(int fd)
 
 /**
  * SUBTEST: deny-sriov
+ * Mega feature: EUdebug
+ * Sub-category: EUdebug framework
+ * Functionality: EU debug and SR-IOV
  * Description:
  *	Check that VFs cannot be enabled when eudebug is enabled.
  */
diff --git a/tests/intel/xe_exec_sip_eudebug.c b/tests/intel/xe_exec_sip_eudebug.c
index c317112b4..e5b8ba418 100644
--- a/tests/intel/xe_exec_sip_eudebug.c
+++ b/tests/intel/xe_exec_sip_eudebug.c
@@ -217,22 +217,34 @@ xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
 
 /**
  * SUBTEST: wait-writesip-nodebug
+ * Sub-category: EUdebug HW
+ * Functionality: EU debugger SIP interaction
  * Description: verify that we don't enter SIP after wait with debugging disabled.
  *
  * SUBTEST: breakpoint-writesip-nodebug
+ * Sub-category: EUdebug HW
+ * Functionality: EU debugger SIP interaction
  * Description: verify that we don't enter SIP after hitting breakpoint in shader
  *		when debugging is disabled.
  *
  * SUBTEST: breakpoint-writesip
+ * Sub-category: EUdebug HW
+ * Functionality: EU debugger SIP interaction
  * Description: Test that we enter SIP after hitting breakpoint in shader.
  *
  * SUBTEST: breakpoint-writesip-twice
+ * Sub-category: EUdebug HW
+ * Functionality: EU debugger SIP interaction
  * Description: Test twice that we enter SIP after hitting breakpoint in shader.
  *
  * SUBTEST: breakpoint-waitsip
+ * Sub-category: EUdebug HW
+ * Functionality: EU debugger SIP interaction
  * Description: Test that we reset after seeing the attention without the debugger.
  *
  * SUBTEST: breakpoint-waitsip-heavy
+ * Sub-category: EUdebug HW
+ * Functionality: EU debugger SIP interaction
  * Description:
  *	Test that we reset after seeing the attention from heavy SIP, that resembles
  *	the production one, without the debugger.
-- 
2.34.1

