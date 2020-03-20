Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 20 Mar 2020 10:15:22 -0000
Message-ID: <158469932251.11039.7739158180371549976@emeril.freedesktop.org>
References: <20200320090340.27836-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20200320090340.27836-1-ankit.k.nautiyal@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcontent=5Fprotection=3A_Bifurcate_tests_into_HDCP1=2E4_?=
 =?utf-8?b?JiAyLjI=?=
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
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_content_protection: Bifurcate tests into HDCP1.4 & 2.2
URL   : https://patchwork.freedesktop.org/series/74911/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8163 -> IGTPW_4334
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4334 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4334, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4334:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gtt:
    - fi-kbl-soraka:      [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/fi-kbl-soraka/igt@i915_selftest@live@gtt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/fi-kbl-soraka/igt@i915_selftest@live@gtt.html

  
Known issues
------------

  Here are the changes found in IGTPW_4334 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-glk-dsi:         [PASS][3] -> [INCOMPLETE][4] ([i915#58] / [i915#656] / [k.org#198133])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/fi-glk-dsi/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/fi-glk-dsi/igt@i915_selftest@live@execlists.html
    - fi-cml-u2:          [PASS][5] -> [INCOMPLETE][6] ([i915#1430] / [i915#283] / [i915#656])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/fi-cml-u2/igt@i915_selftest@live@execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/fi-cml-u2/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gem_contexts:
    - fi-cml-s:           [PASS][7] -> [DMESG-FAIL][8] ([i915#877])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/fi-cml-s/igt@i915_selftest@live@gem_contexts.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/fi-cml-s/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@hangcheck:
    - fi-icl-y:           [PASS][9] -> [INCOMPLETE][10] ([fdo#108569])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/fi-icl-y/igt@i915_selftest@live@hangcheck.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/fi-icl-y/igt@i915_selftest@live@hangcheck.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - fi-cfl-8109u:       [FAIL][11] ([fdo#103375]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/fi-cfl-8109u/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/fi-cfl-8109u/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [i915#1430]: https://gitlab.freedesktop.org/drm/intel/issues/1430
  [i915#283]: https://gitlab.freedesktop.org/drm/intel/issues/283
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#647]: https://gitlab.freedesktop.org/drm/intel/issues/647
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (41 -> 41)
------------------------------

  Additional (3): fi-skl-6770hq fi-skl-6600u fi-elk-e7500 
  Missing    (3): fi-byt-squawks fi-bsw-cyan fi-cfl-guc 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5523 -> IGTPW_4334

  CI-20190529: 20190529
  CI_DRM_8163: 710b3af22d17146897a55f01868d8e2d867895d3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4334: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/index.html
  IGT_5523: cf6d524007ac51a7d5a48503ea3dd5f01fd4ebab @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_content_protection@hdcp-1_4
+igt@kms_content_protection@hdcp-2_2
-igt@kms_content_protection@atomic
-igt@kms_content_protection@atomic-dpms
-igt@kms_content_protection@content_type_change
-igt@kms_content_protection@legacy
-igt@kms_content_protection@lic
-igt@kms_content_protection@mei_interface
-igt@kms_content_protection@srm
-igt@kms_content_protection@type1
-igt@kms_content_protection@uevent

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
