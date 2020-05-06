Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 06 May 2020 16:16:28 -0000
Message-ID: <158878178874.11898.15249592072350325089@emeril.freedesktop.org>
References: <20200506150218.3811-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20200506150218.3811-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fringfill=3A_Adjusted_test_to_utilize_all_available_e?=
 =?utf-8?q?ngines=2E?=
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
To: sai gowtham <sai.gowtham.ch@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_ringfill: Adjusted test to utilize all available engines.
URL   : https://patchwork.freedesktop.org/series/77001/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8434 -> IGTPW_4539
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/index.html

New tests
---------

  New tests have been introduced between CI_DRM_8434 and IGTPW_4539:

### New IGT tests (2) ###

  * igt@gem_ringfill@legacy-basic-forked:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ringfill@legacy-basic-forked@default:
    - Statuses : 38 pass(s)
    - Exec time: [0.03, 0.24] s

  

Known issues
------------

  Here are the changes found in IGTPW_4539 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-glk-dsi:         [PASS][1] -> [INCOMPLETE][2] ([i915#58] / [k.org#198133])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/fi-glk-dsi/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/fi-glk-dsi/igt@i915_selftest@live@execlists.html

  
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (50 -> 42)
------------------------------

  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-bwr-2160 fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5635 -> IGTPW_4539

  CI-20190529: 20190529
  CI_DRM_8434: 2951bac393beb4f095468de8b7cc53c8e3a092c2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4539: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/index.html
  IGT_5635: e83abfca61d407d12eee4d25bb0e8686337a7791 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_ringfill@basic
+igt@gem_ringfill@basic-fd
+igt@gem_ringfill@basic-forked
+igt@gem_ringfill@basic-hang
+igt@gem_ringfill@basic-interruptible
+igt@gem_ringfill@bomb
+igt@gem_ringfill@child
+igt@gem_ringfill@legacy-basic
+igt@gem_ringfill@legacy-basic-fd
+igt@gem_ringfill@legacy-basic-forked
+igt@gem_ringfill@legacy-basic-hang
+igt@gem_ringfill@legacy-basic-interruptible
+igt@gem_ringfill@legacy-bomb
+igt@gem_ringfill@legacy-child
+igt@gem_ringfill@legacy-s3
+igt@gem_ringfill@legacy-s4
+igt@gem_ringfill@s3
+igt@gem_ringfill@s4
-igt@gem_ringfill@basic-default
-igt@gem_ringfill@basic-default-fd
-igt@gem_ringfill@basic-default-forked
-igt@gem_ringfill@basic-default-hang
-igt@gem_ringfill@basic-default-interruptible
-igt@gem_ringfill@blt
-igt@gem_ringfill@blt-bomb
-igt@gem_ringfill@blt-child
-igt@gem_ringfill@blt-fd
-igt@gem_ringfill@blt-forked
-igt@gem_ringfill@blt-hang
-igt@gem_ringfill@blt-interruptible
-igt@gem_ringfill@blt-s3
-igt@gem_ringfill@blt-s4
-igt@gem_ringfill@bsd
-igt@gem_ringfill@bsd1
-igt@gem_ringfill@bsd1-bomb
-igt@gem_ringfill@bsd1-child
-igt@gem_ringfill@bsd1-fd
-igt@gem_ringfill@bsd1-forked
-igt@gem_ringfill@bsd1-hang
-igt@gem_ringfill@bsd1-interruptible
-igt@gem_ringfill@bsd1-s3
-igt@gem_ringfill@bsd1-s4
-igt@gem_ringfill@bsd2
-igt@gem_ringfill@bsd2-bomb
-igt@gem_ringfill@bsd2-child
-igt@gem_ringfill@bsd2-fd
-igt@gem_ringfill@bsd2-forked
-igt@gem_ringfill@bsd2-hang
-igt@gem_ringfill@bsd2-interruptible
-igt@gem_ringfill@bsd2-s3
-igt@gem_ringfill@bsd2-s4
-igt@gem_ringfill@bsd-bomb
-igt@gem_ringfill@bsd-child
-igt@gem_ringfill@bsd-fd
-igt@gem_ringfill@bsd-forked
-igt@gem_ringfill@bsd-hang
-igt@gem_ringfill@bsd-interruptible
-igt@gem_ringfill@bsd-s3
-igt@gem_ringfill@bsd-s4
-igt@gem_ringfill@default-bomb
-igt@gem_ringfill@default-child
-igt@gem_ringfill@default-s3
-igt@gem_ringfill@default-s4
-igt@gem_ringfill@render
-igt@gem_ringfill@render-bomb
-igt@gem_ringfill@render-child
-igt@gem_ringfill@render-fd
-igt@gem_ringfill@render-forked
-igt@gem_ringfill@render-hang
-igt@gem_ringfill@render-interruptible
-igt@gem_ringfill@render-s3
-igt@gem_ringfill@render-s4
-igt@gem_ringfill@vebox
-igt@gem_ringfill@vebox-bomb
-igt@gem_ringfill@vebox-child
-igt@gem_ringfill@vebox-fd
-igt@gem_ringfill@vebox-forked
-igt@gem_ringfill@vebox-hang
-igt@gem_ringfill@vebox-interruptible
-igt@gem_ringfill@vebox-s3
-igt@gem_ringfill@vebox-s4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4539/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
