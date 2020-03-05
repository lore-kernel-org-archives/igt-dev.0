Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 05 Mar 2020 11:44:49 -0000
Message-ID: <158340868918.17236.5864229725431586757@emeril.freedesktop.org>
References: <1583379218-30115-1-git-send-email-kunal1.joshi@intel.com>
In-Reply-To: <1583379218-30115-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVGVzdCBw?=
 =?utf-8?q?latform_supported_pixel_formats_through_chamelium=2E_=28rev2=29?=
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

Series: Test platform supported pixel formats through chamelium. (rev2)
URL   : https://patchwork.freedesktop.org/series/74317/
State : success

== Summary ==

CI Bug Log - changes from IGT_5493 -> IGTPW_4262
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/index.html

Known issues
------------

  Here are the changes found in IGTPW_4262 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [PASS][1] -> [FAIL][2] ([CI#94])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][3] -> [FAIL][4] ([fdo#111407])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@vgem_basic@dmabuf-fence:
    - fi-tgl-y:           [PASS][5] -> [DMESG-WARN][6] ([CI#94] / [i915#402]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/fi-tgl-y/igt@vgem_basic@dmabuf-fence.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/fi-tgl-y/igt@vgem_basic@dmabuf-fence.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@active:
    - fi-icl-y:           [DMESG-FAIL][7] ([i915#765]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/fi-icl-y/igt@i915_selftest@live@active.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/fi-icl-y/igt@i915_selftest@live@active.html

  * igt@i915_selftest@live@gem_contexts:
    - fi-cfl-8700k:       [INCOMPLETE][9] ([i915#424]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/fi-cfl-8700k/igt@i915_selftest@live@gem_contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/fi-cfl-8700k/igt@i915_selftest@live@gem_contexts.html

  * igt@prime_vgem@basic-gtt:
    - fi-tgl-y:           [DMESG-WARN][11] ([CI#94] / [i915#402]) -> [PASS][12] +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/fi-tgl-y/igt@prime_vgem@basic-gtt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/fi-tgl-y/igt@prime_vgem@basic-gtt.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#765]: https://gitlab.freedesktop.org/drm/intel/issues/765


Participating hosts (44 -> 43)
------------------------------

  Additional (7): fi-kbl-soraka fi-bdw-5557u fi-cfl-8109u fi-bsw-kefka fi-skl-lmem fi-bsw-nick fi-skl-6600u 
  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-byt-j1900 fi-bsw-cyan fi-ctg-p8600 fi-gdg-551 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5493 -> IGTPW_4262

  CI-20190529: 20190529
  CI_DRM_8068: f8e69af5cca45947ebce78f677b75b0ecc4ba744 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4262: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/index.html
  IGT_5493: 41422f8384047e2ec4c4cb896f6955bf51490f53 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4262/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
