Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 21 May 2021 19:24:48 -0000
Message-ID: <162162508826.6036.6986262046994557981@emeril.freedesktop.org>
References: <20210521190641.623110-1-jason@jlekstrand.net>
In-Reply-To: <20210521190641.623110-1-jason@jlekstrand.net>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBBZGQg?=
 =?utf-8?q?tests_for_sync=5Ffile_import/export?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add tests for sync_file import/export
URL   : https://patchwork.freedesktop.org/series/90433/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
d87087c321da07035d4f96d98c34e451b3ccb809 tests/i915: test pass for no caching case

302/305 assembler test/rndz                     OK       0.08 s 
303/305 assembler test/lzd                      OK       0.05 s 
304/305 assembler test/not                      OK       0.02 s 
305/305 assembler test/immediate                OK       0.04 s 

OK:       304
FAIL:       1
SKIP:       0
TIMEOUT:    0


The output from the failed tests:

 34/305 testcase check dmabuf_sync_file         FAIL     0.47 s (exit status 1)

--- command ---
/home/cidrm/igt-gpu-tools/tests/igt_command_line.sh dmabuf_sync_file
--- stdout ---
tests/dmabuf_sync_file:
  Checking invalid option handling...
  Checking valid option handling...
  Checking subtest enumeration...
    test does not exit with 0 or 79 with --list-subtests!
FAIL: tests/dmabuf_sync_file
--- stderr ---
skipping is allowed only in fixtures, subtests or igt_simple_main
please refer to lib/igt_core documentation
dmabuf_sync_file: ../lib/igt_core.c:363: internal_assert: Assertion `0' failed.
Received signal SIGABRT.
Stack trace: 
 #0 [fatal_sig_handler+0xd6]
 #1 [killpg+0x40]
 #2 [gsignal+0xc7]
 #3 [abort+0x141]
 #4 [uselocale+0x33a]
 #5 [__assert_fail+0x42]
 #6 [internal_assert+0x101]
 #7 [igt_skip+0xdc]
 #8 [__igt_skip_check+0x1cd]
 #9 [igt_require_sw_sync+0x8f]
 #10 [__real_main328+0x2fc]
 #11 [main+0x27]
 #12 [__libc_start_main+0xe7]
 #13 [_start+0x2a]
-------

Full log written to /home/cidrm/igt-gpu-tools/build/meson-logs/testlog.txt
FAILED: meson-test 
/usr/bin/python3 -u /usr/bin/meson test --no-rebuild --print-errorlogs
ninja: build stopped: subcommand failed.


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
