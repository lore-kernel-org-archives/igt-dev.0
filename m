Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 01 Apr 2020 17:27:22 -0000
Message-ID: <158576204210.25628.4581750128004292113@emeril.freedesktop.org>
References: <20200401165508.366950-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200401165508.366950-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv2=2C1/2=5D_lib/i915/perf=3A_remove_g?=
 =?utf-8?q?eneration_code_for_mathml_render?=
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,v2,1/2] lib/i915/perf: remove generation code for mathml render
URL   : https://patchwork.freedesktop.org/series/75375/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5554 -> IGTPW_4393
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4393 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4393, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4393/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4393:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-cml-u2:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/fi-cml-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4393/fi-cml-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  
Known issues
------------

  Here are the changes found in IGTPW_4393 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-x1275:       [PASS][3] -> [SKIP][4] ([fdo#109271])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4393/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@execlists:
    - fi-glk-dsi:         [PASS][5] -> [INCOMPLETE][6] ([i915#58] / [i915#656] / [k.org#198133])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/fi-glk-dsi/igt@i915_selftest@live@execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4393/fi-glk-dsi/igt@i915_selftest@live@execlists.html
    - fi-bxt-dsi:         [PASS][7] -> [INCOMPLETE][8] ([i915#656])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/fi-bxt-dsi/igt@i915_selftest@live@execlists.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4393/fi-bxt-dsi/igt@i915_selftest@live@execlists.html

  * igt@kms_force_connector_basic@force-edid:
    - fi-kbl-x1275:       [PASS][9] -> [DMESG-WARN][10] ([i915#62] / [i915#92]) +9 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4393/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-kbl-x1275:       [PASS][11] -> [DMESG-WARN][12] ([i915#62] / [i915#92] / [i915#95]) +4 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/fi-kbl-x1275/igt@prime_vgem@basic-fence-flip.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4393/fi-kbl-x1275/igt@prime_vgem@basic-fence-flip.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-icl-dsi:         [INCOMPLETE][13] ([i915#1580]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/fi-icl-dsi/igt@i915_selftest@live@hangcheck.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4393/fi-icl-dsi/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-cml-u2:          [DMESG-WARN][15] ([IGT#4]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4393/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  
  [IGT#4]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/4
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1580]: https://gitlab.freedesktop.org/drm/intel/issues/1580
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (49 -> 44)
------------------------------

  Additional (2): fi-skl-guc fi-bwr-2160 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5554 -> IGTPW_4393

  CI-20190529: 20190529
  CI_DRM_8233: 0862243a5514a9da625520bd4f554f8348077594 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4393: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4393/index.html
  IGT_5554: f3ba9eca8b0a1c0074bd43b0ee5dbebe833f5f09 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4393/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
