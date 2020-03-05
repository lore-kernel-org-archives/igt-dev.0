Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 05 Mar 2020 17:33:54 -0000
Message-ID: <158342963473.17237.660632326605481055@emeril.freedesktop.org>
References: <1583396719-4200-1-git-send-email-kunal1.joshi@intel.com>
In-Reply-To: <1583396719-4200-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVGVzdCBw?=
 =?utf-8?q?latform_supported_pixel_formats_through_chamelium?=
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

Series: Test platform supported pixel formats through chamelium
URL   : https://patchwork.freedesktop.org/series/74343/
State : success

== Summary ==

CI Bug Log - changes from IGT_5495 -> IGTPW_4266
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/index.html

Known issues
------------

  Here are the changes found in IGTPW_4266 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [PASS][1] -> [FAIL][2] ([i915#217])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@prime_self_import@basic-with_fd_dup:
    - fi-tgl-y:           [PASS][3] -> [DMESG-WARN][4] ([CI#94] / [i915#402]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/fi-tgl-y/igt@prime_self_import@basic-with_fd_dup.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/fi-tgl-y/igt@prime_self_import@basic-with_fd_dup.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-tgl-y:           [INCOMPLETE][5] ([CI#94] / [i915#529] / [i915#647]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/fi-tgl-y/igt@i915_selftest@live@execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/fi-tgl-y/igt@i915_selftest@live@execlists.html

  * igt@prime_self_import@basic-llseek-bad:
    - fi-tgl-y:           [DMESG-WARN][7] ([CI#94] / [i915#402]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html

  
#### Warnings ####

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][9] ([fdo#111096] / [i915#323]) -> [FAIL][10] ([fdo#111407])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5495/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#647]: https://gitlab.freedesktop.org/drm/intel/issues/647


Participating hosts (52 -> 45)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5495 -> IGTPW_4266

  CI-20190529: 20190529
  CI_DRM_8069: c8673f18b2ca3b343206c2ba65d6f1020a93614c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4266: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/index.html
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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4266/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
