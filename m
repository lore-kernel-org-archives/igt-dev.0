Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EA6C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 19:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40F410ED04;
	Fri,  7 Jun 2024 19:06:03 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6AEA10ED01;
 Fri,  7 Jun 2024 19:06:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_lib/xe=3A_Use_synchrono?=
 =?utf-8?q?us_gt_resets_when_needed_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 07 Jun 2024 19:06:00 -0000
Message-ID: <171778716074.28075.11579216012655388615@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240605171055.2772175-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240605171055.2772175-1-jonathan.cavitt@intel.com>
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

Series: lib/xe: Use synchronous gt resets when needed (rev3)
URL   : https://patchwork.freedesktop.org/series/134509/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1194190 for the overview.

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59523873):
  [429/1807] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_registers_tglgt2.c.o'.
  [430/1807] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_registers_adl.c.o'.
  [431/1807] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_registers_rkl.c.o'.
  [432/1807] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_cnl.c.o'.
  [433/1807] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_registers_dg1.c.o'.
  [434/1807] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_tglgt1.c.o'.
  [435/1807] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_icl.c.o'.
  [436/1807] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_rkl.c.o'.
  [437/1807] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_tglgt2.c.o'.
  [438/1807] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_adl.c.o'.
  [439/1807] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_registers_mtlgt2.c.o'.
  [440/1807] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_dg1.c.o'.
  [441/1807] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_registers_acmgt1.c.o'.
  [442/1807] Compiling C object 'lib/76b5a35@@i915_perf@sha/i915_perf_data_reader.c.o'.
  section_end:1717611132:step_script
  section_start:1717611132:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717611134:cleanup_file_variables
  ERROR: Job failed: exit code 137

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1194190
