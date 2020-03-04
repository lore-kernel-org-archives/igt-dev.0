Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 04 Mar 2020 19:59:08 -0000
Message-ID: <158335194879.429.12385629355148856264@emeril.freedesktop.org>
References: <1583324295-22013-1-git-send-email-kunal1.joshi@intel.com>
In-Reply-To: <1583324295-22013-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fchamelium=3A_Add_support_to_validate_YUV_pixel_formats?=
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

Series: tests/kms_chamelium: Add support to validate YUV pixel formats
URL   : https://patchwork.freedesktop.org/series/74283/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8066 -> IGTPW_4259
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/index.html

Known issues
------------

  Here are the changes found in IGTPW_4259 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@prime_vgem@basic-sync-default:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([CI#94] / [i915#402]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/fi-tgl-y/igt@prime_vgem@basic-sync-default.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/fi-tgl-y/igt@prime_vgem@basic-sync-default.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - fi-icl-guc:         [DMESG-FAIL][3] ([i915#922]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/fi-icl-guc/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/fi-icl-guc/igt@i915_selftest@live@workarounds.html

  * igt@prime_self_import@basic-llseek-bad:
    - fi-tgl-y:           [DMESG-WARN][5] ([CI#94] / [i915#402]) -> [PASS][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#922]: https://gitlab.freedesktop.org/drm/intel/issues/922


Participating hosts (45 -> 45)
------------------------------

  Additional (6): fi-bwr-2160 fi-kbl-7500u fi-cfl-8109u fi-skl-lmem fi-blb-e6850 fi-kbl-r 
  Missing    (6): fi-icl-1065g7 fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5491 -> IGTPW_4259

  CI-20190529: 20190529
  CI_DRM_8066: 9e1454777a07902c85ce3febcc9648837a2224fd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4259: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/index.html
  IGT_5491: d52794b426ae16630cc1e0354ae435ec98f6174b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_chamelium@hdmi-yuv
-igt@kms_chamelium@hdmi-cmp-nv12
-igt@kms_chamelium@hdmi-cmp-nv16
-igt@kms_chamelium@hdmi-cmp-nv21
-igt@kms_chamelium@hdmi-cmp-nv61
-igt@kms_chamelium@hdmi-cmp-yu12
-igt@kms_chamelium@hdmi-cmp-yu16
-igt@kms_chamelium@hdmi-cmp-yv12
-igt@kms_chamelium@hdmi-cmp-yv16

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
