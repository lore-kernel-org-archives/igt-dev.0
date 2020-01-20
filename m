Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 20 Jan 2020 12:56:53 -0000
Message-ID: <157952501338.681.2350954923383370491@emeril.freedesktop.org>
References: <20200120101817.5273-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20200120101817.5273-1-krishnaiah.bommu@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fctx=5Fpersistence=3A_Set_context_with_supported_engi?=
 =?utf-8?q?nes_=28rev2=29?=
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
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_ctx_persistence: Set context with supported engines (rev2)
URL   : https://patchwork.freedesktop.org/series/71810/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7777 -> IGTPW_3949
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/index.html

Known issues
------------

  Here are the changes found in IGTPW_3949 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-6700k2:      [PASS][1] -> [DMESG-WARN][2] ([i915#889])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6700k2:      [PASS][3] -> [INCOMPLETE][4] ([i915#151])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/fi-skl-6700k2/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/fi-skl-6700k2/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-byt-j1900:       [PASS][5] -> [DMESG-FAIL][6] ([i915#722])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/fi-byt-j1900/igt@i915_selftest@live_gem_contexts.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/fi-byt-j1900/igt@i915_selftest@live_gem_contexts.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-peppy:       [DMESG-FAIL][7] ([i915#553] / [i915#725]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/fi-hsw-peppy/igt@i915_selftest@live_blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/fi-hsw-peppy/igt@i915_selftest@live_blt.html
    - fi-byt-j1900:       [DMESG-FAIL][9] ([i915#725]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/fi-byt-j1900/igt@i915_selftest@live_blt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/fi-byt-j1900/igt@i915_selftest@live_blt.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-icl-u2:          [FAIL][11] ([fdo#109635] / [i915#217]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/fi-icl-u2/igt@kms_chamelium@dp-edid-read.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/fi-icl-u2/igt@kms_chamelium@dp-edid-read.html

  
#### Warnings ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][13] ([i915#553] / [i915#725]) -> [DMESG-FAIL][14] ([i915#725])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/fi-hsw-4770/igt@i915_selftest@live_blt.html

  
  [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=109635
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#722]: https://gitlab.freedesktop.org/drm/intel/issues/722
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889


Participating hosts (40 -> 42)
------------------------------

  Additional (7): fi-kbl-soraka fi-snb-2520m fi-ilk-650 fi-elk-e7500 fi-skl-lmem fi-skl-6600u fi-snb-2600 
  Missing    (5): fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-icl-y fi-kbl-7560u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5372 -> IGTPW_3949

  CI-20190529: 20190529
  CI_DRM_7777: 7d2e349542ee3d682a98cc12c3ebdd4677d00d71 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3949: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/index.html
  IGT_5372: 0d00a27fbbd4d4a77d24499ea9811e07e65eb0ac @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_ctx_persistence@legacy-bcs0-cleanup
+igt@gem_ctx_persistence@legacy-bcs0-hostile
+igt@gem_ctx_persistence@legacy-bcs0-hostile-preempt
+igt@gem_ctx_persistence@legacy-bcs0-mixed
+igt@gem_ctx_persistence@legacy-bcs0-mixed-process
+igt@gem_ctx_persistence@legacy-bcs0-persistence
+igt@gem_ctx_persistence@legacy-bcs0-queued
+igt@gem_ctx_persistence@legacy-rcs0-cleanup
+igt@gem_ctx_persistence@legacy-rcs0-hostile
+igt@gem_ctx_persistence@legacy-rcs0-hostile-preempt
+igt@gem_ctx_persistence@legacy-rcs0-mixed
+igt@gem_ctx_persistence@legacy-rcs0-mixed-process
+igt@gem_ctx_persistence@legacy-rcs0-persistence
+igt@gem_ctx_persistence@legacy-rcs0-queued
+igt@gem_ctx_persistence@legacy-vcs0-cleanup
+igt@gem_ctx_persistence@legacy-vcs0-hostile
+igt@gem_ctx_persistence@legacy-vcs0-hostile-preempt
+igt@gem_ctx_persistence@legacy-vcs0-mixed
+igt@gem_ctx_persistence@legacy-vcs0-mixed-process
+igt@gem_ctx_persistence@legacy-vcs0-persistence
+igt@gem_ctx_persistence@legacy-vcs0-queued
+igt@gem_ctx_persistence@legacy-vcs1-cleanup
+igt@gem_ctx_persistence@legacy-vcs1-hostile
+igt@gem_ctx_persistence@legacy-vcs1-hostile-preempt
+igt@gem_ctx_persistence@legacy-vcs1-mixed
+igt@gem_ctx_persistence@legacy-vcs1-mixed-process
+igt@gem_ctx_persistence@legacy-vcs1-persistence
+igt@gem_ctx_persistence@legacy-vcs1-queued
+igt@gem_ctx_persistence@legacy-vcs2-cleanup
+igt@gem_ctx_persistence@legacy-vcs2-hostile
+igt@gem_ctx_persistence@legacy-vcs2-hostile-preempt
+igt@gem_ctx_persistence@legacy-vcs2-mixed
+igt@gem_ctx_persistence@legacy-vcs2-mixed-process
+igt@gem_ctx_persistence@legacy-vcs2-persistence
+igt@gem_ctx_persistence@legacy-vcs2-queued
+igt@gem_ctx_persistence@legacy-vecs0-cleanup
+igt@gem_ctx_persistence@legacy-vecs0-hostile
+igt@gem_ctx_persistence@legacy-vecs0-hostile-preempt
+igt@gem_ctx_persistence@legacy-vecs0-mixed
+igt@gem_ctx_persistence@legacy-vecs0-mixed-process
+igt@gem_ctx_persistence@legacy-vecs0-persistence
+igt@gem_ctx_persistence@legacy-vecs0-queued

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
