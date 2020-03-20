Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 20 Mar 2020 23:32:24 -0000
Message-ID: <158474714477.11036.3262384186023712967@emeril.freedesktop.org>
References: <20200320224621.55102-1-jose.souza@intel.com>
In-Reply-To: <20200320224621.55102-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv4=2C1/7=5D_tests/kms=5Ffrontbuffer?=
 =?utf-8?q?=5Ftracking=3A_Add_tiling_to_test=5Fmode?=
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

Series: series starting with [i-g-t,v4,1/7] tests/kms_frontbuffer_tracking: Add tiling to test_mode
URL   : https://patchwork.freedesktop.org/series/74934/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8167 -> IGTPW_4337
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/index.html

Known issues
------------

  Here are the changes found in IGTPW_4337 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-skl-lmem:        [PASS][1] -> [INCOMPLETE][2] ([i915#656])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/fi-skl-lmem/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/fi-skl-lmem/igt@i915_selftest@live@execlists.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [PASS][3] -> [FAIL][4] ([fdo#109635] / [i915#217])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  
#### Possible fixes ####

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-icl-u2:          [FAIL][5] ([fdo#109635] / [i915#217]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/fi-icl-u2/igt@kms_chamelium@hdmi-crc-fast.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/fi-icl-u2/igt@kms_chamelium@hdmi-crc-fast.html

  
  [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=109635
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656


Participating hosts (49 -> 39)
------------------------------

  Missing    (10): fi-ilk-m540 fi-bxt-dsi fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-cfl-8700k fi-ctg-p8600 fi-tgl-y fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5526 -> IGTPW_4337

  CI-20190529: 20190529
  CI_DRM_8167: b51a7e7f4f72cf780661a1e4b479e2b27ddbafc8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4337: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/index.html
  IGT_5526: f49ebeee9f54d6f23c60a842f75f65561d452ab0 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
