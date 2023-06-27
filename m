Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Date: Tue, 27 Jun 2023 13:07:40 -0000
Message-ID: <168787126069.2458.6321529510071814032@emeril.freedesktop.org>
References: <20230627112244.3847791-1-anshuman.gupta@intel.com>
In-Reply-To: <20230627112244.3847791-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB2cmFt?=
 =?utf-8?q?_d3cold_threshold_test?=
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

Series: vram d3cold threshold test
URL   : https://patchwork.freedesktop.org/series/119914/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
d8dc96b95c60e4737fdfa1664ce9b1dcebfdef60 tests/i915_pm_freq_api: Add a suspend subtest

ninja: Entering directory `/opt/igt/build'
[1/443] Generating version.h with a custom command.
[2/5] Generating xe_tests.rst with a custom command.
FAILED: docs/testplan/xe_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/xe/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /opt/igt/build
Warning: Missing documentation for igt@xe_pm@vram-d3cold-threshold
ninja: build stopped: subcommand failed.

