Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 12 Mar 2020 00:40:14 -0000
Message-ID: <158397361480.4950.15183624785698779799@emeril.freedesktop.org>
References: <20200311235447.195238-1-jose.souza@intel.com>
In-Reply-To: <20200311235447.195238-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bv3=2C1/4=5D_tests/kms=5Ffrontbuffer=5Ftrackin?=
 =?utf-8?q?g=3A_Add_tiling_to_test=5Fmode?=
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
To: "Souza, Jose" <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [v3,1/4] tests/kms_frontbuffer_tracking: Add tiling to test_mode
URL   : https://patchwork.freedesktop.org/series/74606/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8124 -> IGTPW_4292
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4292/index.html

Known issues
------------

  Here are the changes found in IGTPW_4292 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - fi-icl-u2:          [PASS][1] -> [INCOMPLETE][2] ([fdo#108569])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8124/fi-icl-u2/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4292/fi-icl-u2/igt@i915_selftest@live@hangcheck.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - fi-skl-6770hq:      [PASS][3] -> [SKIP][4] ([fdo#109271]) +24 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8124/fi-skl-6770hq/igt@kms_flip@basic-flip-vs-dpms.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4292/fi-skl-6770hq/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-pnv-d510:        [PASS][5] -> [FAIL][6] ([i915#34])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8124/fi-pnv-d510/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4292/fi-pnv-d510/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gem_contexts:
    - fi-cml-s:           [DMESG-FAIL][7] ([i915#877]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8124/fi-cml-s/igt@i915_selftest@live@gem_contexts.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4292/fi-cml-s/igt@i915_selftest@live@gem_contexts.html
    - fi-skl-lmem:        [INCOMPLETE][9] ([i915#424]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8124/fi-skl-lmem/igt@i915_selftest@live@gem_contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4292/fi-skl-lmem/igt@i915_selftest@live@gem_contexts.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [FAIL][11] ([i915#217]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8124/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4292/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Warnings ####

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][13] ([i915#323]) -> [FAIL][14] ([fdo#111407])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8124/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4292/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877


Participating hosts (46 -> 42)
------------------------------

  Additional (1): fi-gdg-551 
  Missing    (5): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5505 -> IGTPW_4292

  CI-20190529: 20190529
  CI_DRM_8124: b720e4b68d27d8d72bbe56abfcdc91ef2bebc2c3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4292: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4292/index.html
  IGT_5505: 8973d811f3fdfb4ace4aabab2095ce0309881648 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear
+igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y
+igt@kms_frontbuffer_tracking@fbcpsrdrrs-tiling-linear
+igt@kms_frontbuffer_tracking@fbcpsrdrrs-tiling-y
+igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear
+igt@kms_frontbuffer_tracking@fbcpsr-tiling-y
+igt@kms_frontbuffer_tracking@fbc-tiling-linear
+igt@kms_frontbuffer_tracking@fbc-tiling-y
-igt@kms_frontbuffer_tracking@fbcdrrs-tilingchange
-igt@kms_frontbuffer_tracking@fbcpsrdrrs-tilingchange
-igt@kms_frontbuffer_tracking@fbcpsr-tilingchange
-igt@kms_frontbuffer_tracking@fbc-tilingchange

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4292/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
