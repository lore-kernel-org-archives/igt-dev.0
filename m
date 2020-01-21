Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 21 Jan 2020 13:20:06 -0000
Message-ID: <157961280606.11480.381994556686962847@emeril.freedesktop.org>
References: <20200121123120.27148-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200121123120.27148-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fnop=3AAdjusted_test_to_utilize_all_available_engine?=
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
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_exec_nop:Adjusted test to utilize all available engines
URL   : https://patchwork.freedesktop.org/series/72334/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7783 -> IGTPW_3958
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_3958 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3958, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3958:

### IGT changes ###

#### Warnings ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-j1900:       [INCOMPLETE][1] ([i915#45] / [i915#999]) -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-byt-j1900/igt@gem_exec_parallel@contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/fi-byt-j1900/igt@gem_exec_parallel@contexts.html

  
Known issues
------------

  Here are the changes found in IGTPW_3958 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-lmem:        [PASS][3] -> [DMESG-WARN][4] ([i915#889])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6600u:       [PASS][5] -> [DMESG-WARN][6] ([i915#889]) +23 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [PASS][7] -> [DMESG-FAIL][8] ([i915#725])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gt_lrc:
    - fi-skl-6600u:       [PASS][9] -> [DMESG-FAIL][10] ([i915#889]) +7 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-cfl-8700k:       [DMESG-WARN][11] ([i915#889]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html
    - fi-kbl-x1275:       [DMESG-WARN][13] ([i915#889]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-kbl-x1275/igt@i915_module_load@reload-with-fault-injection.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/fi-kbl-x1275/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-x1275:       [INCOMPLETE][15] ([i915#151]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html

  
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889
  [i915#999]: https://gitlab.freedesktop.org/drm/intel/issues/999


Participating hosts (44 -> 42)
------------------------------

  Additional (5): fi-glk-dsi fi-gdg-551 fi-bsw-kefka fi-bsw-nick fi-snb-2600 
  Missing    (7): fi-ilk-m540 fi-ehl-1 fi-byt-squawks fi-bsw-cyan fi-bwr-2160 fi-ctg-p8600 fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5376 -> IGTPW_3958

  CI-20190529: 20190529
  CI_DRM_7783: 3ee976286895f0bd54388efc16b12f62c624ff19 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3958: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/index.html
  IGT_5376: 5cf58d947a02379d2885d6dd4f8bb487cfc3eed2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_exec_nop@poll
+igt@gem_exec_nop@preempt
+igt@gem_exec_nop@signal
+igt@gem_exec_nop@single
-igt@gem_exec_nop@blt
-igt@gem_exec_nop@bsd
-igt@gem_exec_nop@bsd1
-igt@gem_exec_nop@bsd2
-igt@gem_exec_nop@default
-igt@gem_exec_nop@poll-blt
-igt@gem_exec_nop@poll-bsd
-igt@gem_exec_nop@poll-bsd1
-igt@gem_exec_nop@poll-bsd2
-igt@gem_exec_nop@poll-default
-igt@gem_exec_nop@poll-render
-igt@gem_exec_nop@poll-vebox
-igt@gem_exec_nop@preempt-blt
-igt@gem_exec_nop@preempt-bsd
-igt@gem_exec_nop@preempt-bsd1
-igt@gem_exec_nop@preempt-bsd2
-igt@gem_exec_nop@preempt-default
-igt@gem_exec_nop@preempt-render
-igt@gem_exec_nop@preempt-vebox
-igt@gem_exec_nop@render
-igt@gem_exec_nop@signal-blt
-igt@gem_exec_nop@signal-bsd
-igt@gem_exec_nop@signal-bsd1
-igt@gem_exec_nop@signal-bsd2
-igt@gem_exec_nop@signal-default
-igt@gem_exec_nop@signal-render
-igt@gem_exec_nop@signal-vebox
-igt@gem_exec_nop@vebox

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3958/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
