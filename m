Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 30 Dec 2019 11:39:59 -0000
Message-ID: <157770599935.15512.12778388790892834947@emeril.freedesktop.org>
References: <20191230110650.3749883-1-chris@chris-wilson.co.uk>
In-Reply-To: <20191230110650.3749883-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaW50ZWwt?=
 =?utf-8?q?ci=3A_Drop_gem=5Fworkarounds/basic_from_fast-feedback?=
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

Series: intel-ci: Drop gem_workarounds/basic from fast-feedback
URL   : https://patchwork.freedesktop.org/series/71490/
State : success

== Summary ==

CI Bug Log - changes from IGT_5353 -> IGTPW_3891
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/index.html

Known issues
------------

  Here are the changes found in IGTPW_3891 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [PASS][1] -> [TIMEOUT][2] ([i915#816])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-6770hq:      [PASS][3] -> [INCOMPLETE][4] ([i915#671])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/fi-skl-6770hq/igt@i915_module_load@reload-with-fault-injection.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/fi-skl-6770hq/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_blt:
    - fi-bwr-2160:        [PASS][5] -> [FAIL][6] ([i915#878])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/fi-bwr-2160/igt@i915_selftest@live_blt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/fi-bwr-2160/igt@i915_selftest@live_blt.html
    - fi-hsw-4770r:       [PASS][7] -> [DMESG-FAIL][8] ([i915#725])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [TIMEOUT][9] ([i915#816]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-cml-s:           [DMESG-WARN][11] ([fdo#111764]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/fi-cml-s/igt@gem_exec_suspend@basic-s3.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/fi-cml-s/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_selftest@live_late_gt_pm:
    - fi-bwr-2160:        [FAIL][13] ([i915#878]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/fi-bwr-2160/igt@i915_selftest@live_late_gt_pm.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/fi-bwr-2160/igt@i915_selftest@live_late_gt_pm.html

  * igt@i915_selftest@live_mman:
    - fi-bxt-dsi:         [DMESG-WARN][15] ([i915#889]) -> [PASS][16] +23 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/fi-bxt-dsi/igt@i915_selftest@live_mman.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/fi-bxt-dsi/igt@i915_selftest@live_mman.html

  * igt@i915_selftest@live_reset:
    - fi-bxt-dsi:         [DMESG-FAIL][17] ([i915#889]) -> [PASS][18] +7 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/fi-bxt-dsi/igt@i915_selftest@live_reset.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/fi-bxt-dsi/igt@i915_selftest@live_reset.html

  
#### Warnings ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][19] ([i915#725]) -> [DMESG-FAIL][20] ([i915#553] / [i915#725])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/fi-hsw-4770/igt@i915_selftest@live_blt.html

  
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#671]: https://gitlab.freedesktop.org/drm/intel/issues/671
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#878]: https://gitlab.freedesktop.org/drm/intel/issues/878
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889


Participating hosts (51 -> 37)
------------------------------

  Missing    (14): fi-kbl-soraka fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-kbl-x1275 fi-ivb-3770 fi-skl-lmem fi-blb-e6850 fi-tgl-y fi-byt-clapper fi-bdw-samus fi-kbl-r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5353 -> IGTPW_3891

  CI-20190529: 20190529
  CI_DRM_7653: 608642beeaaad64ac9a722fccd6b5dcdad697267 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3891: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/index.html
  IGT_5353: 2916493afc40c6b68eaaa17033fb34fae4c99588 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
