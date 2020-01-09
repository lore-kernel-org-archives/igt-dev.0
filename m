Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 09 Jan 2020 22:51:51 -0000
Message-ID: <157861031104.4565.11037002975299176428@emeril.freedesktop.org>
References: <20200109222300.1154999-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200109222300.1154999-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdC9p?=
 =?utf-8?q?915=5Fpm=5Frc6=5Fresidency=3A_Check_we_enter_RC6_when_mostly_id?=
 =?utf-8?q?le?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: test/i915_pm_rc6_residency: Check we enter RC6 when mostly idle
URL   : https://patchwork.freedesktop.org/series/71855/
State : success

== Summary ==

CI Bug Log - changes from IGT_5359 -> IGTPW_3912
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/index.html

Known issues
------------

  Here are the changes found in IGTPW_3912 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-cfl-guc:         [PASS][1] -> [INCOMPLETE][2] ([i915#505] / [i915#671])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/fi-cfl-guc/igt@i915_module_load@reload-with-fault-injection.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/fi-cfl-guc/igt@i915_module_load@reload-with-fault-injection.html
    - fi-kbl-x1275:       [PASS][3] -> [INCOMPLETE][4] ([i915#879])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/fi-kbl-x1275/igt@i915_module_load@reload-with-fault-injection.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/fi-kbl-x1275/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-lmem:        [PASS][5] -> [DMESG-WARN][6] ([i915#889]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/fi-skl-lmem/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/fi-skl-lmem/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_sanitycheck:
    - fi-skl-lmem:        [PASS][7] -> [INCOMPLETE][8] ([i915#198])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/fi-skl-lmem/igt@i915_selftest@live_sanitycheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/fi-skl-lmem/igt@i915_selftest@live_sanitycheck.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-icl-u2:          [FAIL][9] ([fdo#103375]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/fi-icl-u2/igt@gem_exec_suspend@basic-s3.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/fi-icl-u2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-icl-u2:          [FAIL][11] ([fdo#111550]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/fi-icl-u2/igt@gem_exec_suspend@basic-s4-devices.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/fi-icl-u2/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-6700k2:      [INCOMPLETE][13] ([i915#671]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html

  
#### Warnings ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-icl-u2:          [FAIL][15] ([fdo#103375]) -> [DMESG-WARN][16] ([IGT#4] / [i915#263])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5359/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  
  [IGT#4]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/4
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#111550]: https://bugs.freedesktop.org/show_bug.cgi?id=111550
  [i915#198]: https://gitlab.freedesktop.org/drm/intel/issues/198
  [i915#263]: https://gitlab.freedesktop.org/drm/intel/issues/263
  [i915#505]: https://gitlab.freedesktop.org/drm/intel/issues/505
  [i915#671]: https://gitlab.freedesktop.org/drm/intel/issues/671
  [i915#879]: https://gitlab.freedesktop.org/drm/intel/issues/879
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889


Participating hosts (46 -> 41)
------------------------------

  Additional (3): fi-hsw-peppy fi-byt-n2820 fi-ivb-3770 
  Missing    (8): fi-ehl-1 fi-byt-squawks fi-bsw-cyan fi-snb-2520m fi-kbl-7500u fi-ctg-p8600 fi-kbl-8809g fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5359 -> IGTPW_3912

  CI-20190529: 20190529
  CI_DRM_7714: b633f28f2de80cdb861d6c1c3b4df6fd2d53239f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3912: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/index.html
  IGT_5359: 28451bcec2245dcc1fd0eb1d4c76335b2b4f97a5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@i915_pm_rc6_residency@rc6-perf

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3912/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
