Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 10 Aug 2023 14:45:37 -0000
Message-ID: <169167873785.4959.10689695207034393318@emeril.freedesktop.org>
References: <20230810123402.969597-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230810123402.969597-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBWYWxp?=
 =?utf-8?q?date_Xe_field_descriptions_at_build_time?=
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
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Validate Xe field descriptions at build time
URL   : https://patchwork.freedesktop.org/series/122285/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
85557af77f06ffef7e909c6008788ac34a011b65 tests/intel-ci: fix xe-fast-feedback.testlist

Tail of build.log:
Warning: igt@xe_ccs@ctrl-surf-copy-new-ctx Functionality documentation is missing
Warning: igt@xe_ccs@ctrl-surf-copy-new-ctx Sub-category documentation is missing
Warning: igt@xe_ccs@suspend-resume Category documentation is missing
Warning: igt@xe_ccs@suspend-resume Functionality documentation is missing
Warning: igt@xe_ccs@suspend-resume Sub-category documentation is missing
Warning: igt@xe_exercise_blt@fast-copy Category documentation is missing
Warning: igt@xe_exercise_blt@fast-copy Functionality documentation is missing
Warning: igt@xe_exercise_blt@fast-copy Sub-category documentation is missing
Warning: igt@xe_exercise_blt@fast-copy-emit Category documentation is missing
Warning: igt@xe_exercise_blt@fast-copy-emit Functionality documentation is missing
Warning: igt@xe_exercise_blt@fast-copy-emit Sub-category documentation is missing
Warning: igt@xe_media_fill@media-fill Category documentation is missing
Warning: igt@xe_media_fill@media-fill Functionality documentation is missing
Warning: igt@xe_media_fill@media-fill Sub-category documentation is missing
Warning: igt@xe_sysfs_scheduler@job_timeout_ms-invalid Category documentation is missing
Warning: igt@xe_sysfs_scheduler@job_timeout_ms-min-max Category documentation is missing
Warning: igt@xe_sysfs_scheduler@job_timeout_ms-nonprivileged-user Category documentation is missing
Warning: igt@xe_sysfs_scheduler@preempt_timeout_us-invalid Category documentation is missing
Warning: igt@xe_sysfs_scheduler@preempt_timeout_us-min-max Category documentation is missing
Warning: igt@xe_sysfs_scheduler@preempt_timeout_us-nonprivileged-user Category documentation is missing
Warning: igt@xe_sysfs_scheduler@timeslice_duration_us-invalid Category documentation is missing
Warning: igt@xe_sysfs_scheduler@timeslice_duration_us-min-max Category documentation is missing
Warning: igt@xe_sysfs_scheduler@timeslice_duration_us-nonprivileged-user Category documentation is missing
Warning: igt@xe_sysfs_tile@physical_vram_size_bytes Run type documentation is missing
Warning: igt@xe_sysfs_tile@physical_vram_size_bytes Category documentation is missing
Warning: igt@xe_sysfs_tile@physical_vram_size_bytes Functionality documentation is missing
Warning: igt@xe_sysfs_tile@physical_vram_size_bytes Sub-category documentation is missing
Warning: igt@xe_uevent@fake_reset_uevent_listener Run type documentation is missing
Warning: igt@xe_uevent@fake_reset_uevent_listener Category documentation is missing
Warning: igt@xe_uevent@fake_reset_uevent_listener Functionality documentation is missing
Warning: igt@xe_uevent@fake_reset_uevent_listener Sub-category documentation is missing
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
[1618/1622] Generating kms_tests.html with a custom command.
[1619/1622] Generating i915_tests.rst with a custom command.
ninja: build stopped: subcommand failed.



