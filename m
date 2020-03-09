Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 09 Mar 2020 08:42:19 -0000
Message-ID: <158374333925.9450.15023492112879328870@emeril.freedesktop.org>
References: <20200307211751.22125-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200307211751.22125-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?/kms=3A_Add_support_for_display_with_non-contiguous_pipes?=
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
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: test/kms: Add support for display with non-contiguous pipes
URL   : https://patchwork.freedesktop.org/series/74431/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
2e23cf6f63fc6ba1d9543f8327698d6f21813cec i915/gem_exec_nop: One more parallel nop variant

  Checking invalid option handling...
  Checking valid option handling...
  Checking subtest enumeration...
    test does seem to be using igt_main() (should have subtests) and yet --list-subtests is empty!
FAIL: tests/kms_plane_alpha_blend
-------

 72/283 testcase check: kms_plane_cursor        FAIL     0.22 s (exit status 1)

--- command ---
/home/cidrm/igt-gpu-tools/tests/igt_command_line.sh kms_plane_cursor
--- stdout ---
tests/kms_plane_cursor:
  Checking invalid option handling...
  Checking valid option handling...
  Checking subtest enumeration...
    test does seem to be using igt_main() (should have subtests) and yet --list-subtests is empty!
FAIL: tests/kms_plane_cursor
-------

 73/283 testcase check: kms_plane_lowres        FAIL     0.17 s (exit status 1)

--- command ---
/home/cidrm/igt-gpu-tools/tests/igt_command_line.sh kms_plane_lowres
--- stdout ---
tests/kms_plane_lowres:
  Checking invalid option handling...
  Checking valid option handling...
  Checking subtest enumeration...
    test does seem to be using igt_main() (should have subtests) and yet --list-subtests is empty!
FAIL: tests/kms_plane_lowres
-------

 74/283 testcase check: kms_plane_multiple      FAIL     0.16 s (exit status 1)

--- command ---
/home/cidrm/igt-gpu-tools/tests/igt_command_line.sh kms_plane_multiple
--- stdout ---
tests/kms_plane_multiple:
  Checking invalid option handling...
  Checking valid option handling...
  Checking subtest enumeration...
    test does seem to be using igt_main() (should have subtests) and yet --list-subtests is empty!
FAIL: tests/kms_plane_multiple
-------

Full log written to /home/cidrm/igt-gpu-tools/build/meson-logs/testlog.txt
FAILED: meson-test 
/usr/bin/python3 -u /usr/bin/meson test --no-rebuild --print-errorlogs
ninja: build stopped: subcommand failed.

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
