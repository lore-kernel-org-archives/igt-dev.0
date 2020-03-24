Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 24 Mar 2020 22:03:04 -0000
Message-ID: <158508738426.5747.7576218354286134960@emeril.freedesktop.org>
References: <20200324202930.30231-1-jose.souza@intel.com>
In-Reply-To: <20200324202930.30231-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv6=2C1/7=5D_tests/kms=5Ffrontbuffer?=
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

Series: series starting with [i-g-t,v6,1/7] tests/kms_frontbuffer_tracking: Add tiling to test_mode
URL   : https://patchwork.freedesktop.org/series/75036/
State : success

== Summary ==

CI Bug Log - changes from IGT_5536 -> IGTPW_4348
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/index.html

Known issues
------------

  Here are the changes found in IGTPW_4348 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-cfl-8109u:       [PASS][1] -> [INCOMPLETE][2] ([i915#656])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/fi-cfl-8109u/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/fi-cfl-8109u/igt@i915_selftest@live@execlists.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-icl-y:           [DMESG-FAIL][3] ([fdo#108569]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/fi-icl-y/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/fi-icl-y/igt@i915_selftest@live@execlists.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - fi-skl-6700k2:      [INCOMPLETE][5] ([i915#146] / [i915#69]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/fi-skl-6700k2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/fi-skl-6700k2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
#### Warnings ####

  * igt@i915_selftest@live@gem_contexts:
    - fi-skl-lmem:        [DMESG-FAIL][7] ([i915#933]) -> [INCOMPLETE][8] ([i915#424])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5536/fi-skl-lmem/igt@i915_selftest@live@gem_contexts.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/fi-skl-lmem/igt@i915_selftest@live@gem_contexts.html

  
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#69]: https://gitlab.freedesktop.org/drm/intel/issues/69
  [i915#933]: https://gitlab.freedesktop.org/drm/intel/issues/933


Participating hosts (48 -> 42)
------------------------------

  Additional (1): fi-hsw-4770r 
  Missing    (7): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5536 -> IGTPW_4348

  CI-20190529: 20190529
  CI_DRM_8184: 1a72c9d9d3140e92190485d766b9d165932c5b86 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4348: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/index.html
  IGT_5536: bf17da7fdd7f1d3b4b2f21bccd2a4d17813e5ba7 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4348/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
