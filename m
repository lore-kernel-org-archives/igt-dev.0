Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Date: Tue, 30 May 2023 13:33:13 -0000
Message-ID: <168545359317.18932.3409951755676072110@emeril.freedesktop.org>
References: <20230529124824.1876093-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230529124824.1876093-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/xe=3A_Add_a_test_for_corner_cases_of_eviction=2E?=
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

Series: tests/xe: Add a test for corner cases of eviction.
URL   : https://patchwork.freedesktop.org/series/118503/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
2f9acfea5e3a93303f71cbda6e80ba64b8d75a4d lib/instdone: GEN12 and XEHP INSTDONE initialization

ninja: Entering directory `/opt/igt/build'
[1/442] Generating version.h with a custom command.
[2/5] Generating xe_tests.rst with a custom command.
FAILED: docs/testplan/xe_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/xe/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /opt/igt/build
Warning: Missing documentation for igt@xe_evicted@multimap-external
Warning: Missing documentation for igt@xe_evicted@multimap-internal
Warning: Missing documentation for igt@xe_evicted@pt-eviction-external
Warning: Missing documentation for igt@xe_evicted@pt-eviction-internal
Warning: Missing documentation for igt@xe_evicted@signal-oom-external
Warning: Missing documentation for igt@xe_evicted@signal-oom-internal
ninja: build stopped: subcommand failed.

