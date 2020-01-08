Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 08 Jan 2020 06:04:47 -0000
Message-ID: <157846348705.23226.296079445947892990@emeril.freedesktop.org>
References: <20200108053437.6268-1-petri.latvala@intel.com>
In-Reply-To: <20200108053437.6268-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fbasic=3A_Use_dynamic_subtests?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_exec_basic: Use dynamic subtests
URL   : https://patchwork.freedesktop.org/series/71733/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7699 -> IGTPW_3904
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/index.html

New tests
---------

  New tests have been introduced between CI_DRM_7699 and IGTPW_3904:

### New IGT tests (6) ###

  * igt@gem_exec_basic@basic:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@gem_exec_basic@basic@bcs0:
    - Statuses : 34 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_exec_basic@basic@rcs0:
    - Statuses : 39 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_basic@basic@vcs0:
    - Statuses : 36 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_exec_basic@basic@vcs1:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_basic@basic@vecs0:
    - Statuses : 30 pass(s)
    - Exec time: [0.0, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_3904 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-cfl-8700k:       [PASS][1] -> [DMESG-WARN][2] ([i915#889])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@module-reload:
    - fi-cfl-8700k:       [PASS][3] -> [INCOMPLETE][4] ([i915#148])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [PASS][5] -> [DMESG-FAIL][6] ([i915#725])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/fi-hsw-4770r/igt@i915_selftest@live_blt.html
    - fi-hsw-4770:        [PASS][7] -> [DMESG-FAIL][8] ([i915#770])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_execlists:
    - fi-glk-dsi:         [PASS][9] -> [DMESG-WARN][10] ([i915#889]) +23 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/fi-glk-dsi/igt@i915_selftest@live_execlists.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/fi-glk-dsi/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@live_gt_engines:
    - fi-glk-dsi:         [PASS][11] -> [DMESG-FAIL][12] ([i915#889]) +7 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/fi-glk-dsi/igt@i915_selftest@live_gt_engines.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/fi-glk-dsi/igt@i915_selftest@live_gt_engines.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6770hq:      [FAIL][13] ([i915#178]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_gt_heartbeat:
    - fi-bxt-dsi:         [DMESG-FAIL][15] ([fdo#112406]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/fi-bxt-dsi/igt@i915_selftest@live_gt_heartbeat.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/fi-bxt-dsi/igt@i915_selftest@live_gt_heartbeat.html

  
  [fdo#112406]: https://bugs.freedesktop.org/show_bug.cgi?id=112406
  [i915#148]: https://gitlab.freedesktop.org/drm/intel/issues/148
  [i915#178]: https://gitlab.freedesktop.org/drm/intel/issues/178
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889


Participating hosts (49 -> 40)
------------------------------

  Additional (3): fi-byt-j1900 fi-skl-lmem fi-skl-6600u 
  Missing    (12): fi-ilk-m540 fi-hsw-4200u fi-hsw-peppy fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-gdg-551 fi-cfl-8109u fi-tgl-y fi-byt-clapper fi-bdw-samus fi-snb-2600 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5358 -> IGTPW_3904

  CI-20190529: 20190529
  CI_DRM_7699: 9aa67e1d77888cf258597d5009a6ab1762418ef6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3904: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/index.html
  IGT_5358: c6fc013f414b806175dc4143c58ab445e5235ea5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_exec_basic@basic
+igt@gem_exec_basic@gtt
+igt@gem_exec_basic@readonly
-igt@gem_exec_basic@basic-all
-igt@gem_exec_basic@basic-bcs0
-igt@gem_exec_basic@basic-rcs0
-igt@gem_exec_basic@basic-vcs0
-igt@gem_exec_basic@basic-vcs1
-igt@gem_exec_basic@basic-vcs2
-igt@gem_exec_basic@basic-vecs0
-igt@gem_exec_basic@gtt-all
-igt@gem_exec_basic@gtt-bcs0
-igt@gem_exec_basic@gtt-rcs0
-igt@gem_exec_basic@gtt-vcs0
-igt@gem_exec_basic@gtt-vcs1
-igt@gem_exec_basic@gtt-vcs2
-igt@gem_exec_basic@gtt-vecs0
-igt@gem_exec_basic@readonly-all
-igt@gem_exec_basic@readonly-bcs0
-igt@gem_exec_basic@readonly-rcs0
-igt@gem_exec_basic@readonly-vcs0
-igt@gem_exec_basic@readonly-vcs1
-igt@gem_exec_basic@readonly-vcs2
-igt@gem_exec_basic@readonly-vecs0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
