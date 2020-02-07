Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 07 Feb 2020 23:40:00 -0000
Message-ID: <158111880082.8753.10625318690422400113@emeril.freedesktop.org>
References: <20200207221503.2928585-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200207221503.2928585-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fflush=3A_Drop_assertion_the_object_is_not_moved?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_exec_flush: Drop assertion the object is not moved
URL   : https://patchwork.freedesktop.org/series/73181/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7889 -> IGTPW_4115
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4115 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4115, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4115/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4115:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live_gtt:
    - fi-bwr-2160:        NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4115/fi-bwr-2160/igt@i915_selftest@live_gtt.html

  
Known issues
------------

  Here are the changes found in IGTPW_4115 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [PASS][2] -> [INCOMPLETE][3] ([i915#45])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7889/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4115/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [PASS][4] -> [DMESG-FAIL][5] ([i915#725])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7889/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4115/fi-hsw-4770r/igt@i915_selftest@live_blt.html
    - fi-hsw-4770:        [PASS][6] -> [DMESG-FAIL][7] ([i915#553] / [i915#725])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7889/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4115/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-8700k:       [PASS][8] -> [INCOMPLETE][9] ([i915#424])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7889/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4115/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html
    - fi-hsw-peppy:       [PASS][10] -> [DMESG-FAIL][11] ([i915#722])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7889/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4115/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-cml-u2:          [PASS][12] -> [FAIL][13] ([i915#217] / [i915#976])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7889/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4115/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-icl-u2:          [PASS][14] -> [FAIL][15] ([fdo#109635] / [i915#217])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7889/fi-icl-u2/igt@kms_chamelium@hdmi-crc-fast.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4115/fi-icl-u2/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-hsw-peppy:       [PASS][16] -> [DMESG-WARN][17] ([i915#44])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7889/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4115/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - fi-skl-6770hq:      [DMESG-WARN][18] ([i915#92]) -> [PASS][19] +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7889/fi-skl-6770hq/igt@i915_module_load@reload.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4115/fi-skl-6770hq/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-hsw-4770:        [SKIP][20] ([fdo#109271]) -> [PASS][21] +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7889/fi-hsw-4770/igt@i915_pm_rpm@basic-rte.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4115/fi-hsw-4770/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [DMESG-FAIL][22] ([i915#725]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7889/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4115/fi-ivb-3770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_execlists:
    - fi-icl-y:           [DMESG-FAIL][24] ([fdo#108569]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7889/fi-icl-y/igt@i915_selftest@live_execlists.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4115/fi-icl-y/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-byt-n2820:       [DMESG-FAIL][26] ([i915#1052]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7889/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4115/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html

  * igt@i915_selftest@live_gt_contexts:
    - fi-bwr-2160:        [INCOMPLETE][28] -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7889/fi-bwr-2160/igt@i915_selftest@live_gt_contexts.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4115/fi-bwr-2160/igt@i915_selftest@live_gt_contexts.html

  * igt@i915_selftest@live_gtt:
    - fi-skl-lmem:        [TIMEOUT][30] ([fdo#111732] / [fdo#112271]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7889/fi-skl-lmem/igt@i915_selftest@live_gtt.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4115/fi-skl-lmem/igt@i915_selftest@live_gtt.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [FAIL][32] ([i915#217]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7889/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4115/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - fi-skl-6770hq:      [SKIP][34] ([fdo#109271]) -> [PASS][35] +5 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7889/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4115/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b:
    - fi-skl-6770hq:      [DMESG-WARN][36] ([i915#106] / [i915#188]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7889/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4115/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-b.html

  
#### Warnings ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-n2820:       [TIMEOUT][38] ([fdo#112271] / [i915#1084]) -> [FAIL][39] ([i915#694])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7889/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4115/fi-byt-n2820/igt@gem_exec_parallel@contexts.html

  
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=109635
  [fdo#111732]: https://bugs.freedesktop.org/show_bug.cgi?id=111732
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1052]: https://gitlab.freedesktop.org/drm/intel/issues/1052
  [i915#106]: https://gitlab.freedesktop.org/drm/intel/issues/106
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#188]: https://gitlab.freedesktop.org/drm/intel/issues/188
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#722]: https://gitlab.freedesktop.org/drm/intel/issues/722
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#976]: https://gitlab.freedesktop.org/drm/intel/issues/976


Participating hosts (52 -> 45)
------------------------------

  Additional (1): fi-kbl-7560u 
  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-bdw-gvtdvm fi-bsw-cyan fi-kbl-guc fi-ctg-p8600 fi-pnv-d510 fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5426 -> IGTPW_4115

  CI-20190529: 20190529
  CI_DRM_7889: d0dffc86bf0eadc65efcf624045a9df79e0591d1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4115: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4115/index.html
  IGT_5426: 973bbbff388b555ac647777460ee8db043380fe5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4115/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
