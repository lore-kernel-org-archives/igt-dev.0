Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 30 Jan 2020 17:07:12 -0000
Message-ID: <158040403256.21032.8904627229395025269@emeril.freedesktop.org>
References: <1580401532-24828-1-git-send-email-nidhi1.gupta@intel.com>
In-Reply-To: <1580401532-24828-1-git-send-email-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIGVE?=
 =?utf-8?q?P_support_in_Link_Layer_Compliance_Tool?=
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
To: Nidhi Gupta <nidhi1.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add eDP support in Link Layer Compliance Tool
URL   : https://patchwork.freedesktop.org/series/72783/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7844 -> IGTPW_4044
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4044 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4044, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4044/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4044:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live_gem_contexts:
    - fi-icl-guc:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/fi-icl-guc/igt@i915_selftest@live_gem_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4044/fi-icl-guc/igt@i915_selftest@live_gem_contexts.html

  * igt@runner@aborted:
    - fi-hsw-peppy:       NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4044/fi-hsw-peppy/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4044 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-peppy:       [PASS][4] -> [TIMEOUT][5] ([fdo#112271] / [i915#1084])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4044/fi-hsw-peppy/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_gtt:
    - fi-bdw-5557u:       [PASS][6] -> [TIMEOUT][7] ([fdo#112271])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/fi-bdw-5557u/igt@i915_selftest@live_gtt.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4044/fi-bdw-5557u/igt@i915_selftest@live_gtt.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [TIMEOUT][8] ([fdo#112271] / [i915#1084] / [i915#816]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4044/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6770hq:      [FAIL][10] ([i915#178]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4044/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html

  
#### Warnings ####

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][12] ([fdo#111096] / [i915#323]) -> [FAIL][13] ([fdo#111407])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4044/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@runner@aborted:
    - fi-byt-n2820:       [FAIL][14] ([i915#816]) -> [FAIL][15] ([i915#999])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/fi-byt-n2820/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4044/fi-byt-n2820/igt@runner@aborted.html

  
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#178]: https://gitlab.freedesktop.org/drm/intel/issues/178
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#999]: https://gitlab.freedesktop.org/drm/intel/issues/999


Participating hosts (46 -> 48)
------------------------------

  Additional (8): fi-glk-dsi fi-ilk-650 fi-whl-u fi-ivb-3770 fi-cfl-8109u fi-blb-e6850 fi-skl-6600u fi-kbl-r 
  Missing    (6): fi-icl-1065g7 fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5407 -> IGTPW_4044

  CI-20190529: 20190529
  CI_DRM_7844: 47faa2a989ef89a15089190a5f942a2d2a34fda5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4044: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4044/index.html
  IGT_5407: a9d69f51dadbcbc53527671f87572d05c3370cba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4044/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
