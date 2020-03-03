Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 03 Mar 2020 12:03:59 -0000
Message-ID: <158323703956.15377.2126213739909486916@emeril.freedesktop.org>
References: <20200303090225.7192-1-satyavathi.k@intel.com>
In-Reply-To: <20200303090225.7192-1-satyavathi.k@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fringfill=3AAdded_=5F=5Ffor=5Feach=5Fphysical=5Fengin?=
 =?utf-8?q?e_to_utilize_all_available_engines=2E_=28rev6=29?=
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
To: satyavat <satyavathi.k@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_ringfill:Added __for_each_physical_engine to utilize all available engines. (rev6)
URL   : https://patchwork.freedesktop.org/series/73463/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8054 -> IGTPW_4246
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/index.html

New tests
---------

  New tests have been introduced between CI_DRM_8054 and IGTPW_4246:

### New IGT tests (6) ###

  * igt@gem_ringfill@basic-forked:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ringfill@basic-forked@bcs0:
    - Statuses : 38 pass(s)
    - Exec time: [0.02, 0.21] s

  * igt@gem_ringfill@basic-forked@rcs0:
    - Statuses : 42 pass(s)
    - Exec time: [0.03, 0.22] s

  * igt@gem_ringfill@basic-forked@vcs0:
    - Statuses : 38 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@gem_ringfill@basic-forked@vcs1:
    - Statuses : 12 pass(s)
    - Exec time: [0.02, 0.20] s

  * igt@gem_ringfill@basic-forked@vecs0:
    - Statuses : 33 pass(s)
    - Exec time: [0.03, 0.25] s

  

Known issues
------------

  Here are the changes found in IGTPW_4246 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [PASS][1] -> [FAIL][2] ([CI#94])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch:
    - fi-tgl-y:           [PASS][3] -> [DMESG-WARN][4] ([CI#94] / [i915#402]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/fi-tgl-y/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/fi-tgl-y/igt@kms_addfb_basic@addfb25-x-tiled-mismatch.html

  
#### Possible fixes ####

  * igt@gem_flink_basic@bad-open:
    - fi-tgl-y:           [DMESG-WARN][5] ([CI#94] / [i915#402]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/fi-tgl-y/igt@gem_flink_basic@bad-open.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/fi-tgl-y/igt@gem_flink_basic@bad-open.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-icl-u2:          [FAIL][7] ([i915#217]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][9] ([fdo#111096] / [i915#323]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (51 -> 46)
------------------------------

  Additional (2): fi-skl-6770hq fi-kbl-7560u 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5484 -> IGTPW_4246

  CI-20190529: 20190529
  CI_DRM_8054: 00395f50bbdc5b9eb3e287e85465566d1ec094a6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4246: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/index.html
  IGT_5484: 91b36b61e76901a2bd09fe93ac7bf7b8a60f258c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_ringfill@basic
+igt@gem_ringfill@basic-fd
+igt@gem_ringfill@basic-forked
+igt@gem_ringfill@basic-hang
+igt@gem_ringfill@basic-interruptible
+igt@gem_ringfill@bomb
+igt@gem_ringfill@child
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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
