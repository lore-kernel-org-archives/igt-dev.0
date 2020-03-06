Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 06 Mar 2020 07:47:29 -0000
Message-ID: <158348084982.3082.6940094546744602756@emeril.freedesktop.org>
References: <1583452975-8507-1-git-send-email-kunal1.joshi@intel.com>
In-Reply-To: <1583452975-8507-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fchamelium=3A_Add_support_to_validate_RGB/YUV_pixel_format?=
 =?utf-8?q?s?=
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

Series: tests/kms_chamelium: Add support to validate RGB/YUV pixel formats
URL   : https://patchwork.freedesktop.org/series/74368/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8074 -> IGTPW_4270
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/index.html

Known issues
------------

  Here are the changes found in IGTPW_4270 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@prime_self_import@basic-with_two_bos:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([CI#94] / [i915#402]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [FAIL][3] ([CI#94]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][5] ([fdo#111096] / [i915#323]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@prime_vgem@basic-gtt:
    - fi-tgl-y:           [DMESG-WARN][7] ([CI#94] / [i915#402]) -> [PASS][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/fi-tgl-y/igt@prime_vgem@basic-gtt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/fi-tgl-y/igt@prime_vgem@basic-gtt.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (50 -> 41)
------------------------------

  Additional (1): fi-kbl-7560u 
  Missing    (10): fi-kbl-soraka fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-gdg-551 fi-byt-clapper fi-bsw-nick fi-bdw-samus fi-kbl-r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5495 -> IGTPW_4270

  CI-20190529: 20190529
  CI_DRM_8074: 0dd63259839ca847514d9999749219635f311015 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4270: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/index.html
  IGT_5495: 22df72de8affcec22d9f354bb6148d77f60cc580 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_chamelium@hdmi-rgb-pixel-format
+igt@kms_chamelium@hdmi-yuv-pixel-format
-igt@kms_chamelium@hdmi-cmp-nv12
-igt@kms_chamelium@hdmi-cmp-nv16
-igt@kms_chamelium@hdmi-cmp-nv21
-igt@kms_chamelium@hdmi-cmp-nv61
-igt@kms_chamelium@hdmi-cmp-yu12
-igt@kms_chamelium@hdmi-cmp-yu16
-igt@kms_chamelium@hdmi-cmp-yv12
-igt@kms_chamelium@hdmi-cmp-yv16
-igt@kms_chamelium@hdmi-crc-abgr8888
-igt@kms_chamelium@hdmi-crc-argb1555
-igt@kms_chamelium@hdmi-crc-argb8888
-igt@kms_chamelium@hdmi-crc-bgr565
-igt@kms_chamelium@hdmi-crc-bgr888
-igt@kms_chamelium@hdmi-crc-rgb565
-igt@kms_chamelium@hdmi-crc-rgb888
-igt@kms_chamelium@hdmi-crc-xbgr8888
-igt@kms_chamelium@hdmi-crc-xrgb1555
-igt@kms_chamelium@hdmi-crc-xrgb8888

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
