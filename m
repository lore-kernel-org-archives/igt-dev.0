Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jake Freeland" <jake@technologyfriends.net>
Date: Tue, 16 Aug 2022 09:14:16 -0000
Message-ID: <166064125631.9029.5456407832291909525@emeril.freedesktop.org>
References: <20220816015413.1187415-1-jfree@freebsd.org>
In-Reply-To: <20220816015413.1187415-1-jfree@freebsd.org>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciByZXBs?=
 =?utf-8?q?aced_/bin/bash_shebangs_with_/bin/sh_for_BSD_compatibility?=
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

Series: replaced /bin/bash shebangs with /bin/sh for BSD compatibility
URL   : https://patchwork.freedesktop.org/series/107314/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
0aa9bc7e9074826a60f17abd697f94de2ca4ffbf tests/gem_lmem_swapping: add some coverage for big objects

(runner_test:18135) CRITICAL: Failed assertion: create_job_list(list, settings)
(runner_test:18135) igt_core-INFO: Stack trace:
(runner_test:18135) igt_core-INFO:   #0 ../lib/igt_core.c:1819 __igt_fail_assert()
(runner_test:18135) igt_core-INFO:   #1 ../runner/runner_tests.c:1665 __igt_unique____real_main242()
(runner_test:18135) igt_core-INFO:   #2 ../runner/runner_tests.c:242 main()
(runner_test:18135) igt_core-INFO:   #3 ../csu/libc-start.c:344 __libc_start_main()
(runner_test:18135) igt_core-INFO:   #4 [_start+0x2a]
****  END  ****
sh: 1: /home/cidrm/igt-gpu-tools/build/runner/testdata/abort-simple-e: not found
[8454927.073559] Warning: Adjusting oom score failed.
[8454927.132931] Test exited with IGT_EXIT_ABORT, aborting.
sh: 1: /home/cidrm/igt-gpu-tools/build/runner/testdata/abort-simple-e: not found
[8454927.269674] Warning: Adjusting oom score failed.
[8454927.294249] Test exited with IGT_EXIT_ABORT, aborting.
sh: 1: /home/cidrm/igt-gpu-tools/build/runner/testdata/abort-simple-e: not found
[8454927.445192] Warning: Adjusting oom score failed.
[8454927.466479] Test exited with IGT_EXIT_ABORT, aborting.
sh: 1: /home/cidrm/igt-gpu-tools/build/runner/testdata/abort-simple-e: not found
[8454927.580203] Warning: Adjusting oom score failed.
[8454927.607898] Test exited with IGT_EXIT_ABORT, aborting.
[8454927.609278] Warning: Adjusting oom score failed.
[8454927.629184] Test exited with IGT_EXIT_ABORT, aborting.
[8454927.629946] Warning: Adjusting oom score failed.
[8454927.647708] Test exited with IGT_EXIT_ABORT, aborting.
sh: 1: /home/cidrm/igt-gpu-tools/build/runner/testdata/abort-simple-e: not found
[8454927.777494] Warning: Adjusting oom score failed.
[8454927.812180] Test exited with IGT_EXIT_ABORT, aborting.
sh: 1: /home/cidrm/igt-gpu-tools/build/runner/testdata/abort-simple-e: not found
[8454927.916104] Warning: Adjusting oom score failed.
[8454927.940471] Test exited with IGT_EXIT_ABORT, aborting.
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

330/330 testcase check gem_concurrent_all             OK               4.81s

Summary of Failures:

329/330 runner                                        FAIL             4.37s   exit status 98


Ok:                 326 
Expected Fail:      3   
Fail:               1   
Unexpected Pass:    0   
Skipped:            0   
Timeout:            0   

Full log written to /home/cidrm/igt-gpu-tools/build/meson-logs/testlog.txt
FAILED: meson-test 
/usr/bin/meson test --no-rebuild --print-errorlogs
ninja: build stopped: subcommand failed.

