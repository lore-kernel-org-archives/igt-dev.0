Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 06 May 2020 05:39:47 -0000
Message-ID: <158874358740.11895.5907322752057176716@emeril.freedesktop.org>
References: <20200506045354.19122-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20200506045354.19122-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fringfill=3AAdjusted_test_to_utilize_all_available_en?=
 =?utf-8?q?gines=2E_=28rev2=29?=
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

Series: tests/i915/gem_ringfill:Adjusted test to utilize all available engines. (rev2)
URL   : https://patchwork.freedesktop.org/series/76772/
State : success

== Summary ==

CI Bug Log - changes from IGT_5635 -> IGTPW_4537
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/index.html

New tests
---------

  New tests have been introduced between IGT_5635 and IGTPW_4537:

### New IGT tests (2) ###

  * igt@gem_ringfill@legacy-forked:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ringfill@legacy-forked@default:
    - Statuses : 38 pass(s)
    - Exec time: [0.03, 0.24] s

  

Known issues
------------

  Here are the changes found in IGTPW_4537 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@active:
    - fi-icl-y:           [PASS][1] -> [DMESG-FAIL][2] ([i915#765])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/fi-icl-y/igt@i915_selftest@live@active.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/fi-icl-y/igt@i915_selftest@live@active.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-x1275:       [SKIP][3] ([fdo#109271]) -> [FAIL][4] ([i915#62])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5635/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#765]: https://gitlab.freedesktop.org/drm/intel/issues/765


Participating hosts (49 -> 43)
------------------------------

  Additional (1): fi-bdw-gvtdvm 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5635 -> IGTPW_4537

  CI-20190529: 20190529
  CI_DRM_8433: db68fed086f2ddcdc30e0d9ca5faaba5e55d0d01 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4537: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/index.html
  IGT_5635: e83abfca61d407d12eee4d25bb0e8686337a7791 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_ringfill@basic-fd
+igt@gem_ringfill@basic-forked
+igt@gem_ringfill@basic-hang
+igt@gem_ringfill@basic-interruptible
+igt@gem_ringfill@bomb
+igt@gem_ringfill@child
+igt@gem_ringfill@legacy-bomb
+igt@gem_ringfill@legacy-child
+igt@gem_ringfill@legacy-default
+igt@gem_ringfill@legacy-fd
+igt@gem_ringfill@legacy-forked
+igt@gem_ringfill@legacy-hang
+igt@gem_ringfill@legacy-interruptible
+igt@gem_ringfill@legacy-s3
+igt@gem_ringfill@legacy-s4
+igt@gem_ringfill@s3
+igt@gem_ringfill@s4
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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4537/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
