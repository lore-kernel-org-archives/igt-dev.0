Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Mon, 01 May 2023 23:10:02 -0000
Message-ID: <168298260271.29669.5010413749615613205@emeril.freedesktop.org>
References: <20230501230416.3210262-1-matthew.brost@intel.com>
In-Reply-To: <20230501230416.3210262-1-matthew.brost@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBJR1Qg?=
 =?utf-8?q?updates_for_upstreaming_prep?=
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

Series: IGT updates for upstreaming prep
URL   : https://patchwork.freedesktop.org/series/117177/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
1cb3507f3ff28d11bd5cfabcde576fe78ddab571 intel-ci/xe-fast-feedback.testlist: Add eviction tests

ninja: Entering directory `/opt/igt/build'
[1/436] Generating version.h with a custom command.
[2/4] Generating xe_tests.rst with a custom command.
FAILED: docs/testplan/xe_tests.rst 
/usr/src/igt-gpu-tools/scripts/igt_doc.py --config /usr/src/igt-gpu-tools/tests/xe/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --igt-build-path /opt/igt/build
Warning: Missing documentation for igt@xe_exec_threads@threads-hang-rebind-err
Warning: Missing documentation for igt@xe_exec_threads@threads-hang-userptr-rebind-err
Warning: Missing documentation for igt@xe_exec_threads@threads-rebind-err
Warning: Missing documentation for igt@xe_exec_threads@threads-userptr-rebind-err
ninja: build stopped: subcommand failed.

