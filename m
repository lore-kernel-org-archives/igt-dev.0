Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CB2C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 19:18:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68A810E3D1;
	Mon, 29 Jul 2024 19:18:36 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7AC10E3CF;
 Mon, 29 Jul 2024 19:18:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Test_coverage_for_GPU_deb?=
 =?utf-8?q?ug_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Christoph Manszewski" <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 29 Jul 2024 19:18:35 -0000
Message-ID: <172228071591.425887.12617434841009058501@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
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
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

== Series Details ==

Series: Test coverage for GPU debug support
URL   : https://patchwork.freedesktop.org/series/136623/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
0f02dc176959e6296866b1bafd3982e277a5e44b tests/core_hotunplug: Fix inline comment on missing device nodes

Tail of build.log:
  138 |          xe_eudebug_trigger_fn fn);
      |          ~~~~~~~~~~~~~~~~~~~~~~^~
../../../usr/src/igt-gpu-tools/tests/intel/xe_eudebug_online.c: In function ‘test_many_sessions_on_tiles’:
../../../usr/src/igt-gpu-tools/tests/intel/xe_eudebug_online.c:1954:44: error: ‘DRM_XE_EUDEBUG_EVENT_EU_ATTENTION’ undeclared (first use in this function); did you mean ‘XE_EUDEBUG_FILTER_EVENT_EU_ATTENTION’?
 1954 |   xe_eudebug_debugger_add_trigger(s[i]->d, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
      |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                            XE_EUDEBUG_FILTER_EVENT_EU_ATTENTION
../../../usr/src/igt-gpu-tools/tests/intel/xe_eudebug_online.c:1955:7: warning: passing argument 3 of ‘xe_eudebug_debugger_add_trigger’ from incompatible pointer type [-Wincompatible-pointer-types]
 1955 |       eu_attention_debug_trigger);
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
      |       |
      |       void (*)(struct xe_eudebug_debugger *, struct drm_xe_eudebug_event *)
In file included from ../../../usr/src/igt-gpu-tools/tests/intel/xe_eudebug_online.c:15:
../../../usr/src/igt-gpu-tools/lib/xe/xe_eudebug.h:138:32: note: expected ‘xe_eudebug_trigger_fn’ {aka ‘void (*)(struct xe_eudebug_debugger *, struct drm_xe_eudebug_event *)’} but argument is of type ‘void (*)(struct xe_eudebug_debugger *, struct drm_xe_eudebug_event *)’
  138 |          xe_eudebug_trigger_fn fn);
      |          ~~~~~~~~~~~~~~~~~~~~~~^~
../../../usr/src/igt-gpu-tools/tests/intel/xe_eudebug_online.c:1957:7: warning: passing argument 3 of ‘xe_eudebug_debugger_add_trigger’ from incompatible pointer type [-Wincompatible-pointer-types]
 1957 |       save_first_exception_trigger);
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |       |
      |       void (*)(struct xe_eudebug_debugger *, struct drm_xe_eudebug_event *)
In file included from ../../../usr/src/igt-gpu-tools/tests/intel/xe_eudebug_online.c:15:
../../../usr/src/igt-gpu-tools/lib/xe/xe_eudebug.h:138:32: note: expected ‘xe_eudebug_trigger_fn’ {aka ‘void (*)(struct xe_eudebug_debugger *, struct drm_xe_eudebug_event *)’} but argument is of type ‘void (*)(struct xe_eudebug_debugger *, struct drm_xe_eudebug_event *)’
  138 |          xe_eudebug_trigger_fn fn);
      |          ~~~~~~~~~~~~~~~~~~~~~~^~
../../../usr/src/igt-gpu-tools/tests/intel/xe_eudebug_online.c:1958:44: error: ‘DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE’ undeclared (first use in this function); did you mean ‘XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE’?
 1958 |   xe_eudebug_debugger_add_trigger(s[i]->d, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
      |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                            XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE
../../../usr/src/igt-gpu-tools/tests/intel/xe_eudebug_online.c:1959:7: warning: passing argument 3 of ‘xe_eudebug_debugger_add_trigger’ from incompatible pointer type [-Wincompatible-pointer-types]
 1959 |       ufence_ack_trigger);
      |       ^~~~~~~~~~~~~~~~~~
      |       |
      |       void (*)(struct xe_eudebug_debugger *, struct drm_xe_eudebug_event *)
In file included from ../../../usr/src/igt-gpu-tools/tests/intel/xe_eudebug_online.c:15:
../../../usr/src/igt-gpu-tools/lib/xe/xe_eudebug.h:138:32: note: expected ‘xe_eudebug_trigger_fn’ {aka ‘void (*)(struct xe_eudebug_debugger *, struct drm_xe_eudebug_event *)’} but argument is of type ‘void (*)(struct xe_eudebug_debugger *, struct drm_xe_eudebug_event *)’
  138 |          xe_eudebug_trigger_fn fn);
      |          ~~~~~~~~~~~~~~~~~~~~~~^~
../../../usr/src/igt-gpu-tools/tests/intel/xe_eudebug_online.c:1978:13: error: dereferencing pointer to incomplete type ‘struct drm_xe_eudebug_event_eu_attention’
 1978 |          eus->client_handle, eus->exec_queue_handle,
      |             ^~
../../../usr/src/igt-gpu-tools/tests/intel/xe_eudebug_online.c: In function ‘eu_ctl_interrupt_all’:
../../../usr/src/igt-gpu-tools/tests/intel/xe_eudebug_online.c:327:1: error: control reaches end of non-void function [-Werror=return-type]
  327 | }
      | ^
cc1: some warnings being treated as errors
[694/1764] Compiling C object 'tests/59830eb@@perf_pmu@exe/intel_perf_pmu.c.o'.
[695/1764] Compiling C object 'tests/59830eb@@gem_exec_schedule@exe/intel_gem_exec_schedule.c.o'.
[696/1764] Compiling C object 'tests/59830eb@@perf@exe/intel_perf.c.o'.
ninja: build stopped: subcommand failed.


