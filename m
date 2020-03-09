Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 09 Mar 2020 12:26:12 -0000
Message-ID: <158375677240.9451.5426812502869606033@emeril.freedesktop.org>
References: <1583719347-32199-1-git-send-email-kunal1.joshi@intel.com>
In-Reply-To: <1583719347-32199-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fchamelium=3A_Add_support_to_validate_RGB/YUV_pixel_format?=
 =?utf-8?q?s_=28rev2=29?=
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

Series: tests/kms_chamelium: Add support to validate RGB/YUV pixel formats (rev2)
URL   : https://patchwork.freedesktop.org/series/74368/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8093 -> IGTPW_4278
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/index.html

Known issues
------------

  Here are the changes found in IGTPW_4278 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@mmap:
    - fi-kbl-7500u:       [PASS][1] -> [SKIP][2] ([fdo#109271])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/fi-kbl-7500u/igt@fbdev@mmap.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/fi-kbl-7500u/igt@fbdev@mmap.html

  * igt@i915_selftest@live@gem_contexts:
    - fi-cml-s:           [PASS][3] -> [DMESG-FAIL][4] ([i915#877])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/fi-cml-s/igt@i915_selftest@live@gem_contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/fi-cml-s/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@gt_contexts:
    - fi-byt-j1900:       [PASS][5] -> [DMESG-FAIL][6] ([i915#666])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/fi-byt-j1900/igt@i915_selftest@live@gt_contexts.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/fi-byt-j1900/igt@i915_selftest@live@gt_contexts.html

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-icl-u2:          [PASS][7] -> [DMESG-WARN][8] ([i915#289])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/fi-icl-u2/igt@kms_chamelium@dp-hpd-fast.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/fi-icl-u2/igt@kms_chamelium@dp-hpd-fast.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#289]: https://gitlab.freedesktop.org/drm/intel/issues/289
  [i915#666]: https://gitlab.freedesktop.org/drm/intel/issues/666
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877


Participating hosts (41 -> 32)
------------------------------

  Additional (4): fi-skl-6770hq fi-bsw-nick fi-bwr-2160 fi-snb-2600 
  Missing    (13): fi-tgl-dsi fi-hsw-4200u fi-hsw-peppy fi-byt-squawks fi-bsw-cyan fi-ilk-650 fi-gdg-551 fi-ivb-3770 fi-elk-e7500 fi-skl-lmem fi-blb-e6850 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5499 -> IGTPW_4278

  CI-20190529: 20190529
  CI_DRM_8093: 0d201b03b62aacbd13fd104a371bd45ee2060277 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4278: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/index.html
  IGT_5499: 2e23cf6f63fc6ba1d9543f8327698d6f21813cec @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_chamelium@hdmi-cmp-planar-formats
+igt@kms_chamelium@hdmi-crc-nonplanar-formats
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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
