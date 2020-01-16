Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 16 Jan 2020 15:03:38 -0000
Message-ID: <157918701869.12912.15318810871183334603@emeril.freedesktop.org>
References: <1579155598-4024-1-git-send-email-kunal1.joshi@intel.com>
In-Reply-To: <1579155598-4024-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdmFsaWRh?=
 =?utf-8?q?te_color_tests_using_chamelium=2E_=28rev2=29?=
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: validate color tests using chamelium. (rev2)
URL   : https://patchwork.freedesktop.org/series/72006/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7754 -> IGTPW_3927
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/index.html

Known issues
------------

  Here are the changes found in IGTPW_3927 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-cml-s:           [PASS][1] -> [FAIL][2] ([fdo#103375])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/fi-cml-s/igt@gem_exec_suspend@basic-s0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/fi-cml-s/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-6770hq:      [PASS][3] -> [INCOMPLETE][4] ([i915#671])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/fi-skl-6770hq/igt@i915_module_load@reload-with-fault-injection.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/fi-skl-6770hq/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_execlists:
    - fi-kbl-soraka:      [PASS][5] -> [DMESG-FAIL][6] ([i915#656])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/fi-kbl-soraka/igt@i915_selftest@live_execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/fi-kbl-soraka/igt@i915_selftest@live_execlists.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-cml-s:           [DMESG-WARN][7] ([fdo#111764]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/fi-cml-s/igt@gem_exec_suspend@basic-s3.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/fi-cml-s/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [DMESG-FAIL][9] ([i915#770]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/fi-ivb-3770/igt@i915_selftest@live_blt.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][11] ([fdo#111096] / [i915#323]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#671]: https://gitlab.freedesktop.org/drm/intel/issues/671
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770


Participating hosts (48 -> 45)
------------------------------

  Additional (3): fi-hsw-4770r fi-byt-n2820 fi-snb-2520m 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-tgl-y fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5370 -> IGTPW_3927

  CI-20190529: 20190529
  CI_DRM_7754: 4db14301dfa813d24cd2ad46552af83d493c5d12 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3927: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/index.html
  IGT_5370: a98fb02cc2816a48eec374392d9b6941abb6af2c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_color_chamelium@pipe-a-ctm-0-5
+igt@kms_color_chamelium@pipe-a-ctm-0-25
+igt@kms_color_chamelium@pipe-a-ctm-0-75
+igt@kms_color_chamelium@pipe-a-ctm-blue-to-red
+igt@kms_color_chamelium@pipe-a-ctm-green-to-red
+igt@kms_color_chamelium@pipe-a-ctm-limited-range
+igt@kms_color_chamelium@pipe-a-ctm-max
+igt@kms_color_chamelium@pipe-a-ctm-negative
+igt@kms_color_chamelium@pipe-a-ctm-red-to-blue
+igt@kms_color_chamelium@pipe-a-degamma
+igt@kms_color_chamelium@pipe-a-gamma
+igt@kms_color_chamelium@pipe-b-ctm-0-5
+igt@kms_color_chamelium@pipe-b-ctm-0-25
+igt@kms_color_chamelium@pipe-b-ctm-0-75
+igt@kms_color_chamelium@pipe-b-ctm-blue-to-red
+igt@kms_color_chamelium@pipe-b-ctm-green-to-red
+igt@kms_color_chamelium@pipe-b-ctm-limited-range
+igt@kms_color_chamelium@pipe-b-ctm-max
+igt@kms_color_chamelium@pipe-b-ctm-negative
+igt@kms_color_chamelium@pipe-b-ctm-red-to-blue
+igt@kms_color_chamelium@pipe-b-degamma
+igt@kms_color_chamelium@pipe-b-gamma
+igt@kms_color_chamelium@pipe-c-ctm-0-5
+igt@kms_color_chamelium@pipe-c-ctm-0-25
+igt@kms_color_chamelium@pipe-c-ctm-0-75
+igt@kms_color_chamelium@pipe-c-ctm-blue-to-red
+igt@kms_color_chamelium@pipe-c-ctm-green-to-red
+igt@kms_color_chamelium@pipe-c-ctm-limited-range
+igt@kms_color_chamelium@pipe-c-ctm-max
+igt@kms_color_chamelium@pipe-c-ctm-negative
+igt@kms_color_chamelium@pipe-c-ctm-red-to-blue
+igt@kms_color_chamelium@pipe-c-degamma
+igt@kms_color_chamelium@pipe-c-gamma
+igt@kms_color_chamelium@pipe-d-ctm-0-5
+igt@kms_color_chamelium@pipe-d-ctm-0-25
+igt@kms_color_chamelium@pipe-d-ctm-0-75
+igt@kms_color_chamelium@pipe-d-ctm-blue-to-red
+igt@kms_color_chamelium@pipe-d-ctm-green-to-red
+igt@kms_color_chamelium@pipe-d-ctm-limited-range
+igt@kms_color_chamelium@pipe-d-ctm-max
+igt@kms_color_chamelium@pipe-d-ctm-negative
+igt@kms_color_chamelium@pipe-d-ctm-red-to-blue
+igt@kms_color_chamelium@pipe-d-degamma
+igt@kms_color_chamelium@pipe-d-gamma
+igt@kms_color_chamelium@pipe-e-ctm-0-5
+igt@kms_color_chamelium@pipe-e-ctm-0-25
+igt@kms_color_chamelium@pipe-e-ctm-0-75
+igt@kms_color_chamelium@pipe-e-ctm-blue-to-red
+igt@kms_color_chamelium@pipe-e-ctm-green-to-red
+igt@kms_color_chamelium@pipe-e-ctm-limited-range
+igt@kms_color_chamelium@pipe-e-ctm-max
+igt@kms_color_chamelium@pipe-e-ctm-negative
+igt@kms_color_chamelium@pipe-e-ctm-red-to-blue
+igt@kms_color_chamelium@pipe-e-degamma
+igt@kms_color_chamelium@pipe-e-gamma
+igt@kms_color_chamelium@pipe-f-ctm-0-5
+igt@kms_color_chamelium@pipe-f-ctm-0-25
+igt@kms_color_chamelium@pipe-f-ctm-0-75
+igt@kms_color_chamelium@pipe-f-ctm-blue-to-red
+igt@kms_color_chamelium@pipe-f-ctm-green-to-red
+igt@kms_color_chamelium@pipe-f-ctm-limited-range
+igt@kms_color_chamelium@pipe-f-ctm-max
+igt@kms_color_chamelium@pipe-f-ctm-negative
+igt@kms_color_chamelium@pipe-f-ctm-red-to-blue
+igt@kms_color_chamelium@pipe-f-degamma
+igt@kms_color_chamelium@pipe-f-gamma
+igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes
+igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes
+igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
