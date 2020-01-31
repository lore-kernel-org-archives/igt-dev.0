Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 31 Jan 2020 10:29:30 -0000
Message-ID: <158046657036.13120.3458808383781722276@emeril.freedesktop.org>
References: <20200131092603.24223-1-mika.kahola@intel.com>
In-Reply-To: <20200131092603.24223-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgRml4IENS?=
 =?utf-8?q?C_mismatch_=28rev3=29?=
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Fix CRC mismatch (rev3)
URL   : https://patchwork.freedesktop.org/series/72625/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7850 -> IGTPW_4055
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4055 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4055, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4055/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4055:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-bsw-n3050:       NOTRUN -> [TIMEOUT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4055/fi-bsw-n3050/igt@gem_exec_suspend@basic-s0.html

  
Known issues
------------

  Here are the changes found in IGTPW_4055 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@prime_self_import@basic-with_fd_dup:
    - fi-tgl-y:           [PASS][2] -> [DMESG-WARN][3] ([CI#94] / [i915#402]) +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7850/fi-tgl-y/igt@prime_self_import@basic-with_fd_dup.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4055/fi-tgl-y/igt@prime_self_import@basic-with_fd_dup.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [TIMEOUT][4] ([fdo#112271] / [i915#1084] / [i915#816]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7850/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4055/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_store@basic-all:
    - fi-apl-guc:         [TIMEOUT][6] ([fdo#112271]) -> [PASS][7] +8 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7850/fi-apl-guc/igt@gem_exec_store@basic-all.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4055/fi-apl-guc/igt@gem_exec_store@basic-all.html

  * igt@gem_tiled_fence_blits@basic:
    - fi-apl-guc:         [SKIP][8] ([fdo#109271]) -> [PASS][9] +47 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7850/fi-apl-guc/igt@gem_tiled_fence_blits@basic.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4055/fi-apl-guc/igt@gem_tiled_fence_blits@basic.html

  * igt@kms_addfb_basic@bad-pitch-32:
    - fi-tgl-y:           [DMESG-WARN][10] ([CI#94] / [i915#402]) -> [PASS][11] +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7850/fi-tgl-y/igt@kms_addfb_basic@bad-pitch-32.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4055/fi-tgl-y/igt@kms_addfb_basic@bad-pitch-32.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][12] ([fdo#111407]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7850/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4055/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816


Participating hosts (43 -> 47)
------------------------------

  Additional (11): fi-bdw-5557u fi-bsw-n3050 fi-byt-j1900 fi-skl-6770hq fi-snb-2520m fi-whl-u fi-gdg-551 fi-ivb-3770 fi-elk-e7500 fi-kbl-r fi-snb-2600 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5407 -> IGTPW_4055

  CI-20190529: 20190529
  CI_DRM_7850: ae66f2257648ce52c51298506977baa32873c9d5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4055: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4055/index.html
  IGT_5407: a9d69f51dadbcbc53527671f87572d05c3370cba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4055/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
