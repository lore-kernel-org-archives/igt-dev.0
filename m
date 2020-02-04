Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 04 Feb 2020 23:13:49 -0000
Message-ID: <158085802923.25088.7075648583946916355@emeril.freedesktop.org>
References: <20200204215337.7837-1-antonio.argenziano@intel.com>
In-Reply-To: <20200204215337.7837-1-antonio.argenziano@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fctx=5Fsseu=3A_Extend_the_mmapped_paramaters_test?=
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
To: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_ctx_sseu: Extend the mmapped paramaters test
URL   : https://patchwork.freedesktop.org/series/72994/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7866 -> IGTPW_4096
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4096/index.html

Known issues
------------

  Here are the changes found in IGTPW_4096 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-peppy:       [PASS][1] -> [INCOMPLETE][2] ([i915#694] / [i915#816])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7866/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4096/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
    - fi-byt-j1900:       [PASS][3] -> [INCOMPLETE][4] ([i915#45])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7866/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4096/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [PASS][5] -> [DMESG-FAIL][6] ([i915#553])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7866/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4096/fi-hsw-4770r/igt@i915_selftest@live_blt.html
    - fi-ivb-3770:        [PASS][7] -> [DMESG-FAIL][8] ([i915#770])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7866/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4096/fi-ivb-3770/igt@i915_selftest@live_blt.html
    - fi-hsw-4770:        [PASS][9] -> [DMESG-FAIL][10] ([i915#770])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7866/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4096/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_hangcheck:
    - fi-icl-guc:         [PASS][11] -> [INCOMPLETE][12] ([fdo#108569])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7866/fi-icl-guc/igt@i915_selftest@live_hangcheck.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4096/fi-icl-guc/igt@i915_selftest@live_hangcheck.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [INCOMPLETE][13] ([i915#45]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7866/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4096/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-kbl-x1275:       [DMESG-FAIL][15] ([i915#943]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7866/fi-kbl-x1275/igt@i915_selftest@live_gem_contexts.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4096/fi-kbl-x1275/igt@i915_selftest@live_gem_contexts.html

  
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#943]: https://gitlab.freedesktop.org/drm/intel/issues/943


Participating hosts (46 -> 46)
------------------------------

  Additional (6): fi-skl-6770hq fi-ilk-650 fi-icl-u3 fi-kbl-8809g fi-icl-dsi fi-bsw-nick 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5417 -> IGTPW_4096

  CI-20190529: 20190529
  CI_DRM_7866: bd8251861a5c1ac11e3510355f503675a05d26e6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4096: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4096/index.html
  IGT_5417: 33cc93c8ba5daa0b7498f297a4f626844d895d06 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_ctx_sseu@mmapped-args
-igt@gem_ctx_sseu@ggtt-args

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4096/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
