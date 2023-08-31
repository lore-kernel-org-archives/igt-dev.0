Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 31 Aug 2023 13:30:40 -0000
Message-ID: <169348864017.12507.1517995832396214608@emeril.freedesktop.org>
References: <20230831125823.464595-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230831125823.464595-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBzY3Jp?=
 =?utf-8?q?pts/test=5Flist=2Epy=3A_enforce_mandatory_fields_to_be_filled?=
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

Series: scripts/test_list.py: enforce mandatory fields to be filled
URL   : https://patchwork.freedesktop.org/series/123111/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
30b4034ea562952039ba6af58106791d5c39999e tests/i915/kms_big_fb: Fix testplan documentation

Tail of build.log:
[1613/1633] Linking target runner/runner_test.
[1614/1633] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1615/1633] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
[1616/1633] Linking target lib/libi915_perf.so.1.5.
[1617/1633] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so.1.5.symbols'.
[1618/1633] Linking target tools/i915-perf/i915-perf-configs.
[1619/1633] Linking target tools/i915-perf/i915-perf-reader.
[1620/1633] Linking target tools/i915-perf/i915-perf-recorder.
[1621/1633] Linking target tests/gem_barrier_race.
[1622/1633] Linking target tests/core_hotunplug.
[1623/1633] Linking target tests/perf.
[1624/1633] Generating core_hotunplug.testlist with a meson_exe.py custom command.
[1625/1633] Generating gem_barrier_race.testlist with a meson_exe.py custom command.
[1626/1633] Generating perf.testlist with a meson_exe.py custom command.
[1627/1633] Generating xe_tests.rst with a custom command.
FAILED: docs/testplan/xe_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/xe/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /opt/igt/build
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
Warning: igt@xe_sysfs_tile@physical_vram_size_bytes Run type documentation is missing
Warning: igt@xe_sysfs_tile@physical_vram_size_bytes Category documentation is missing
Warning: igt@xe_uevent@fake_reset_uevent_listener Run type documentation is missing
Warning: igt@xe_uevent@fake_reset_uevent_listener Category documentation is missing
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
[1628/1633] Generating kms_tests.rst with a custom command.
[1629/1633] Generating i915_tests.rst with a custom command.
ninja: build stopped: subcommand failed.



