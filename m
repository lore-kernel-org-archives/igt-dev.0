Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 07 Apr 2020 14:08:12 -0000
Message-ID: <158626849228.26325.2110003050545457439@emeril.freedesktop.org>
References: <20200407131633.1350311-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200407131633.1350311-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/7=5D_tests/kms=5Fvblank=3A_Make_sur?=
 =?utf-8?q?e_that_we_have_a_mode_set?=
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/7] tests/kms_vblank: Make sure that we have a mode set
URL   : https://patchwork.freedesktop.org/series/75615/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5574 -> IGTPW_4425
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4425 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4425, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4425/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4425:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_psr@cursor_plane_move:
    - fi-icl-u2:          [PASS][1] -> [SKIP][2] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/fi-icl-u2/igt@kms_psr@cursor_plane_move.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4425/fi-icl-u2/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@sprite_plane_onoff:
    - fi-tgl-y:           [PASS][3] -> [SKIP][4] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/fi-tgl-y/igt@kms_psr@sprite_plane_onoff.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4425/fi-tgl-y/igt@kms_psr@sprite_plane_onoff.html
    - fi-icl-guc:         [PASS][5] -> [SKIP][6] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/fi-icl-guc/igt@kms_psr@sprite_plane_onoff.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4425/fi-icl-guc/igt@kms_psr@sprite_plane_onoff.html
    - fi-cml-s:           [PASS][7] -> [SKIP][8] +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/fi-cml-s/igt@kms_psr@sprite_plane_onoff.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4425/fi-cml-s/igt@kms_psr@sprite_plane_onoff.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_psr@primary_mmap_gtt:
    - {fi-tgl-u}:         [SKIP][9] ([i915#668]) -> [SKIP][10] +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/fi-tgl-u/igt@kms_psr@primary_mmap_gtt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4425/fi-tgl-u/igt@kms_psr@primary_mmap_gtt.html

  
Known issues
------------

  Here are the changes found in IGTPW_4425 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - fi-skl-6770hq:      [PASS][11] -> [FAIL][12] ([i915#220]) +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/fi-skl-6770hq/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4425/fi-skl-6770hq/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@cursor_plane_move:
    - fi-kbl-r:           [PASS][13] -> [SKIP][14] ([fdo#109271]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/fi-kbl-r/igt@kms_psr@cursor_plane_move.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4425/fi-kbl-r/igt@kms_psr@cursor_plane_move.html
    - fi-kbl-soraka:      [PASS][15] -> [SKIP][16] ([fdo#109271]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/fi-kbl-soraka/igt@kms_psr@cursor_plane_move.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4425/fi-kbl-soraka/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@primary_mmap_gtt:
    - fi-cml-u2:          [PASS][17] -> [SKIP][18] ([fdo#110189]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/fi-cml-u2/igt@kms_psr@primary_mmap_gtt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4425/fi-cml-u2/igt@kms_psr@primary_mmap_gtt.html

  * igt@kms_psr@primary_page_flip:
    - fi-skl-6600u:       [PASS][19] -> [SKIP][20] ([fdo#109271]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/fi-skl-6600u/igt@kms_psr@primary_page_flip.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4425/fi-skl-6600u/igt@kms_psr@primary_page_flip.html

  
#### Possible fixes ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-cml-u2:          [DMESG-WARN][21] ([IGT#4]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4425/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  
#### Warnings ####

  * igt@kms_psr@cursor_plane_move:
    - fi-whl-u:           [SKIP][23] ([fdo#109271] / [i915#668]) -> [SKIP][24] ([fdo#109271]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5574/fi-whl-u/igt@kms_psr@cursor_plane_move.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4425/fi-whl-u/igt@kms_psr@cursor_plane_move.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#4]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/4
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [i915#220]: https://gitlab.freedesktop.org/drm/intel/issues/220
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668


Participating hosts (53 -> 47)
------------------------------

  Additional (1): fi-kbl-7560u 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5574 -> IGTPW_4425

  CI-20190529: 20190529
  CI_DRM_8264: e0104585f880a64d4a9b40803cf4fb51ab499f7c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4425: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4425/index.html
  IGT_5574: 15e8ffecfd55d3d632491b73ed981e4467145a4b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_chamelium@dp-hpd-enable-disable-mode
+igt@kms_chamelium@dp-hpd-with-enabled-mode
+igt@kms_chamelium@hdmi-hpd-enable-disable-mode
+igt@kms_chamelium@hdmi-hpd-with-enabled-mode
+igt@kms_chamelium@vga-hpd-enable-disable-mode
+igt@kms_chamelium@vga-hpd-with-enabled-mode

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4425/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
