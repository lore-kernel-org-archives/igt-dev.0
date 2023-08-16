Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Erik Kurzinger" <ekurzinger@nvidia.com>
Date: Wed, 16 Aug 2023 18:23:48 -0000
Message-ID: <169221022886.10286.15613455279958691866@emeril.freedesktop.org>
References: <7a8c0a3f-df18-ba3f-9c92-d341f2cb5a7d@nvidia.com>
In-Reply-To: <7a8c0a3f-df18-ba3f-9c92-d341f2cb5a7d@nvidia.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBzeW5j?=
 =?utf-8?q?obj=5Ftimeline=3A_don=27t_expect_EINVAL_for_WAIT=5FUNSUBMITTED_?=
 =?utf-8?q?=7C_WAIT=5FAVAILABLE?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: syncobj_timeline: don't expect EINVAL for WAIT_UNSUBMITTED | WAIT_AVAILABLE
URL   : https://patchwork.freedesktop.org/series/122525/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
152bb04fd1297075b5d0b1c4487dac8e9a70d070 tests/amdgpu: fix cs nop test when no GFX IP

Tail of build.log:
Warning: igt@xe_exercise_blt@fast-copy-emit Category documentation is missing
Warning: igt@xe_media_fill@media-fill Functionality documentation is missing
Warning: igt@xe_media_fill@media-fill Sub-category documentation is missing
Warning: igt@xe_media_fill@media-fill Category documentation is missing
Warning: igt@xe_pm@vram-d3cold-threshold Functionality documentation is missing
Warning: igt@xe_sysfs_scheduler@job_timeout_ms-invalid Category documentation is missing
Warning: igt@xe_sysfs_scheduler@job_timeout_ms-min-max Category documentation is missing
Warning: igt@xe_sysfs_scheduler@job_timeout_ms-nonprivileged-user Category documentation is missing
Warning: igt@xe_sysfs_scheduler@preempt_timeout_us-invalid Category documentation is missing
Warning: igt@xe_sysfs_scheduler@preempt_timeout_us-min-max Category documentation is missing
Warning: igt@xe_sysfs_scheduler@preempt_timeout_us-nonprivileged-user Category documentation is missing
Warning: igt@xe_sysfs_scheduler@timeslice_duration_us-invalid Category documentation is missing
Warning: igt@xe_sysfs_scheduler@timeslice_duration_us-min-max Category documentation is missing
Warning: igt@xe_sysfs_scheduler@timeslice_duration_us-nonprivileged-user Category documentation is missing
Warning: igt@xe_sysfs_tile@physical_vram_size_bytes Category documentation is missing
Warning: igt@xe_sysfs_tile@physical_vram_size_bytes Run type documentation is missing
Warning: igt@xe_uevent@fake_reset_uevent_listener Category documentation is missing
Warning: igt@xe_uevent@fake_reset_uevent_listener Run type documentation is missing
Warning: igt@xe_vm@mmap-style-bind-all Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-either-side-full Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-either-side-partial Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-either-side-partial-hammer Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-either-side-partial-large-page-hammer Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-end Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-front Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-many-all Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-many-either-side-partial Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-one-partial Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-userptr-all Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-userptr-either-side-full Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-userptr-either-side-partial Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-userptr-one-partial Functionality documentation is missing
[1617/1622] Generating i915_tests.rst with a custom command.
FAILED: docs/testplan/i915_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/i915/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path /opt/igt/build
Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted
Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-signaled
Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted
Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted-signaled
Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-available-unsubmitted
Warning: Missing documentation for igt@syncobj_timeline@etime-single-wait-all-available-unsubmitted
Warning: Missing documentation for igt@syncobj_timeline@etime-single-wait-available-unsubmitted
Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-signaled
Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted
Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted-signaled
[1618/1622] Generating kms_tests.rst with a custom command.
[1619/1622] Generating xe_tests.html with a custom command.
ninja: build stopped: subcommand failed.

