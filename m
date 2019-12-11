Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 11 Dec 2019 21:15:37 -0000
Message-ID: <157609893721.30626.14287121769343536060@emeril.freedesktop.org>
References: <20191211204636.16222-1-sunpeng.li@amd.com>
In-Reply-To: <20191211204636.16222-1-sunpeng.li@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcolor=3A_Add_10bpc_frame_buffer_parameterization_to_subte?=
 =?utf-8?q?sts?=
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
To: sunpeng.li@amd.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_color: Add 10bpc frame buffer parameterization to subtests
URL   : https://patchwork.freedesktop.org/series/70782/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7543 -> IGTPW_3850
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3850 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3850, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3850/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3850:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live_hangcheck:
    - fi-hsw-4770r:       NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3850/fi-hsw-4770r/igt@i915_selftest@live_hangcheck.html

  
Known issues
------------

  Here are the changes found in IGTPW_3850 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live_blt:
    - fi-byt-j1900:       [PASS][2] -> [DMESG-FAIL][3] ([i915#725])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/fi-byt-j1900/igt@i915_selftest@live_blt.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3850/fi-byt-j1900/igt@i915_selftest@live_blt.html

  * igt@kms_busy@basic-flip-pipe-a:
    - fi-icl-u2:          [PASS][4] -> [TIMEOUT][5] ([i915#449])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/fi-icl-u2/igt@kms_busy@basic-flip-pipe-a.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3850/fi-icl-u2/igt@kms_busy@basic-flip-pipe-a.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - {fi-tgl-u}:         [INCOMPLETE][6] ([fdo#111593]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/fi-tgl-u/igt@gem_exec_gttfill@basic.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3850/fi-tgl-u/igt@gem_exec_gttfill@basic.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6770hq:      [FAIL][8] ([i915#178]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3850/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_requests:
    - fi-ivb-3770:        [INCOMPLETE][10] ([i915#773]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/fi-ivb-3770/igt@i915_selftest@live_requests.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3850/fi-ivb-3770/igt@i915_selftest@live_requests.html
    - fi-hsw-4770:        [INCOMPLETE][12] ([i915#773]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/fi-hsw-4770/igt@i915_selftest@live_requests.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3850/fi-hsw-4770/igt@i915_selftest@live_requests.html

  * igt@kms_busy@basic-flip-pipe-a:
    - fi-kbl-soraka:      [DMESG-WARN][14] ([i915#95]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/fi-kbl-soraka/igt@kms_busy@basic-flip-pipe-a.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3850/fi-kbl-soraka/igt@kms_busy@basic-flip-pipe-a.html

  
#### Warnings ####

  * igt@kms_busy@basic-flip-pipe-a:
    - fi-kbl-x1275:       [DMESG-WARN][16] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][17] ([i915#62] / [i915#92]) +4 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/fi-kbl-x1275/igt@kms_busy@basic-flip-pipe-a.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3850/fi-kbl-x1275/igt@kms_busy@basic-flip-pipe-a.html

  * igt@kms_busy@basic-flip-pipe-b:
    - fi-kbl-x1275:       [DMESG-WARN][18] ([i915#62] / [i915#92]) -> [DMESG-WARN][19] ([i915#62] / [i915#92] / [i915#95]) +5 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7543/fi-kbl-x1275/igt@kms_busy@basic-flip-pipe-b.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3850/fi-kbl-x1275/igt@kms_busy@basic-flip-pipe-b.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
  [i915#178]: https://gitlab.freedesktop.org/drm/intel/issues/178
  [i915#449]: https://gitlab.freedesktop.org/drm/intel/issues/449
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#773]: https://gitlab.freedesktop.org/drm/intel/issues/773
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (51 -> 46)
------------------------------

  Additional (3): fi-hsw-4770r fi-tgl-guc fi-tgl-y 
  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-skl-lmem fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5345 -> IGTPW_3850

  CI-20190529: 20190529
  CI_DRM_7543: 91752f80df9b582561be6bbac12ef780b12f606c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3850: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3850/index.html
  IGT_5345: 9e0c82b6d70065db894ececf2be8de372e983cf0 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_color@pipe-a-10bpc-ctm-0-5
+igt@kms_color@pipe-a-10bpc-ctm-0-25
+igt@kms_color@pipe-a-10bpc-ctm-0-75
+igt@kms_color@pipe-a-10bpc-ctm-blue-to-red
+igt@kms_color@pipe-a-10bpc-ctm-green-to-red
+igt@kms_color@pipe-a-10bpc-ctm-max
+igt@kms_color@pipe-a-10bpc-ctm-negative
+igt@kms_color@pipe-a-10bpc-ctm-red-to-blue
+igt@kms_color@pipe-a-10bpc-degamma
+igt@kms_color@pipe-a-10bpc-gamma
+igt@kms_color@pipe-a-10bpc-legacy-gamma
+igt@kms_color@pipe-b-10bpc-ctm-0-5
+igt@kms_color@pipe-b-10bpc-ctm-0-25
+igt@kms_color@pipe-b-10bpc-ctm-0-75
+igt@kms_color@pipe-b-10bpc-ctm-blue-to-red
+igt@kms_color@pipe-b-10bpc-ctm-green-to-red
+igt@kms_color@pipe-b-10bpc-ctm-max
+igt@kms_color@pipe-b-10bpc-ctm-negative
+igt@kms_color@pipe-b-10bpc-ctm-red-to-blue
+igt@kms_color@pipe-b-10bpc-degamma
+igt@kms_color@pipe-b-10bpc-gamma
+igt@kms_color@pipe-b-10bpc-legacy-gamma
+igt@kms_color@pipe-c-10bpc-ctm-0-5
+igt@kms_color@pipe-c-10bpc-ctm-0-25
+igt@kms_color@pipe-c-10bpc-ctm-0-75
+igt@kms_color@pipe-c-10bpc-ctm-blue-to-red
+igt@kms_color@pipe-c-10bpc-ctm-green-to-red
+igt@kms_color@pipe-c-10bpc-ctm-max
+igt@kms_color@pipe-c-10bpc-ctm-negative
+igt@kms_color@pipe-c-10bpc-ctm-red-to-blue
+igt@kms_color@pipe-c-10bpc-degamma
+igt@kms_color@pipe-c-10bpc-gamma
+igt@kms_color@pipe-c-10bpc-legacy-gamma
+igt@kms_color@pipe-d-10bpc-ctm-0-5
+igt@kms_color@pipe-d-10bpc-ctm-0-25
+igt@kms_color@pipe-d-10bpc-ctm-0-75
+igt@kms_color@pipe-d-10bpc-ctm-blue-to-red
+igt@kms_color@pipe-d-10bpc-ctm-green-to-red
+igt@kms_color@pipe-d-10bpc-ctm-max
+igt@kms_color@pipe-d-10bpc-ctm-negative
+igt@kms_color@pipe-d-10bpc-ctm-red-to-blue
+igt@kms_color@pipe-d-10bpc-degamma
+igt@kms_color@pipe-d-10bpc-gamma
+igt@kms_color@pipe-d-10bpc-legacy-gamma
+igt@kms_color@pipe-e-10bpc-ctm-0-5
+igt@kms_color@pipe-e-10bpc-ctm-0-25
+igt@kms_color@pipe-e-10bpc-ctm-0-75
+igt@kms_color@pipe-e-10bpc-ctm-blue-to-red
+igt@kms_color@pipe-e-10bpc-ctm-green-to-red
+igt@kms_color@pipe-e-10bpc-ctm-max
+igt@kms_color@pipe-e-10bpc-ctm-negative
+igt@kms_color@pipe-e-10bpc-ctm-red-to-blue
+igt@kms_color@pipe-e-10bpc-degamma
+igt@kms_color@pipe-e-10bpc-gamma
+igt@kms_color@pipe-e-10bpc-legacy-gamma
+igt@kms_color@pipe-f-10bpc-ctm-0-5
+igt@kms_color@pipe-f-10bpc-ctm-0-25
+igt@kms_color@pipe-f-10bpc-ctm-0-75
+igt@kms_color@pipe-f-10bpc-ctm-blue-to-red
+igt@kms_color@pipe-f-10bpc-ctm-green-to-red
+igt@kms_color@pipe-f-10bpc-ctm-max
+igt@kms_color@pipe-f-10bpc-ctm-negative
+igt@kms_color@pipe-f-10bpc-ctm-red-to-blue
+igt@kms_color@pipe-f-10bpc-degamma
+igt@kms_color@pipe-f-10bpc-gamma
+igt@kms_color@pipe-f-10bpc-legacy-gamma

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3850/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
