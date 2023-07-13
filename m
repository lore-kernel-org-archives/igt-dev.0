Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 13 Jul 2023 09:10:49 -0000
Message-ID: <168923944999.14984.11437753285020251113@emeril.freedesktop.org>
References: <20230713075054.970457-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230713075054.970457-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBNYWtl?=
 =?utf-8?q?_test=5Flist=2Epy_more_generic?=
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

Series: Make test_list.py more generic
URL   : https://patchwork.freedesktop.org/series/120655/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
39f5aba75797f2c00a93ff9ee22cafd5526457cf test/i915/gem_create: Skip the test if the PAT index is set on a non MTL device

Installing tools/i915-perf/i915-perf-recorder to /opt/igt/bin
Installing tools/i915-perf/i915-perf-control to /opt/igt/bin
Installing tools/i915-perf/i915-perf-reader to /opt/igt/bin
Installing runner/igt_runner to /opt/igt/bin
Installing runner/igt_resume to /opt/igt/bin
Installing runner/igt_results to /opt/igt/bin
Installing runner/igt_comms_decoder to /opt/igt/bin
Installing assembler/intel-gen4asm to /opt/igt/bin
Installing assembler/intel-gen4disasm to /opt/igt/bin
Installing overlay/intel-gpu-overlay to /opt/igt/bin
Installing man/intel_audio_dump.1.gz to /opt/igt/share/man/man1
Installing man/intel_bios_dumper.1.gz to /opt/igt/share/man/man1
Installing man/intel_error_decode.1.gz to /opt/igt/share/man/man1
Installing man/intel_gpu_frequency.1.gz to /opt/igt/share/man/man1
Installing man/intel_gpu_top.1.gz to /opt/igt/share/man/man1
Installing man/intel_gtt.1.gz to /opt/igt/share/man/man1
Installing man/intel_infoframes.1.gz to /opt/igt/share/man/man1
Installing man/intel_lid.1.gz to /opt/igt/share/man/man1
Installing man/intel_panel_fitter.1.gz to /opt/igt/share/man/man1
Installing man/intel_reg.1.gz to /opt/igt/share/man/man1
Installing man/intel_stepping.1.gz to /opt/igt/share/man/man1
Installing man/intel_upload_blit_large.1.gz to /opt/igt/share/man/man1
Installing man/intel_upload_blit_large_gtt.1.gz to /opt/igt/share/man/man1
Installing man/intel_upload_blit_large_map.1.gz to /opt/igt/share/man/man1
Installing man/intel_upload_blit_small.1.gz to /opt/igt/share/man/man1
Installing man/intel_vbt_decode.1.gz to /opt/igt/share/man/man1
Installing /usr/src/igt-gpu-tools/lib/igt_list.h to /opt/igt/include/i915-perf
Installing /usr/src/igt-gpu-tools/lib/intel_chipset.h to /opt/igt/include/i915-perf
Installing /usr/src/igt-gpu-tools/lib/i915/perf.h to /opt/igt/include/i915-perf
Installing /usr/src/igt-gpu-tools/lib/i915/perf_data.h to /opt/igt/include/i915-perf
Installing /usr/src/igt-gpu-tools/lib/i915/perf_data_reader.h to /opt/igt/include/i915-perf
Installing /opt/igt/build/lib/i915-perf.pc to /opt/igt/lib/x86_64-linux-gnu/pkgconfig
Installing /usr/src/igt-gpu-tools/tests/1080p-left.png to /opt/igt/share/igt-gpu-tools
Installing /usr/src/igt-gpu-tools/tests/1080p-right.png to /opt/igt/share/igt-gpu-tools
Installing /usr/src/igt-gpu-tools/tests/pass.png to /opt/igt/share/igt-gpu-tools
Installing /usr/src/igt-gpu-tools/tests/intel-ci/fast-feedback.testlist to /opt/igt/share/igt-gpu-tools
Installing /usr/src/igt-gpu-tools/tests/intel-ci/meta.testlist to /opt/igt/share/igt-gpu-tools
Installing /usr/src/igt-gpu-tools/tests/intel-ci/README to /opt/igt/share/igt-gpu-tools
Installing /usr/src/igt-gpu-tools/tests/intel-ci/blacklist.txt to /opt/igt/share/igt-gpu-tools
Installing /usr/src/igt-gpu-tools/tests/intel-ci/blacklist-pre-merge.txt to /opt/igt/share/igt-gpu-tools
Installing /usr/src/igt-gpu-tools/tests/intel-ci/xe-fast-feedback.testlist to /opt/igt/share/igt-gpu-tools
Installing /usr/src/igt-gpu-tools/tests/intel-ci/xe.blocklist.txt to /opt/igt/share/igt-gpu-tools
Installing /usr/src/igt-gpu-tools/tools/intel_gpu_abrt to /opt/igt/bin
Installing /usr/src/igt-gpu-tools/tools/intel-gfx-fw-info to /opt/igt/bin
Installing /opt/igt/build/assembler/intel-gen4asm.pc to /opt/igt/lib/x86_64-linux-gnu/pkgconfig
Installing /usr/src/igt-gpu-tools/scripts/code_cov_capture to /opt/igt/bin
Installing /usr/src/igt-gpu-tools/scripts/code_cov_gather_on_build to /opt/igt/bin
Installing /usr/src/igt-gpu-tools/scripts/code_cov_gather_on_test to /opt/igt/bin
Installing /usr/src/igt-gpu-tools/scripts/code_cov_gen_report to /opt/igt/bin
Installing /usr/src/igt-gpu-tools/scripts/code_cov_parse_info to /opt/igt/bin



