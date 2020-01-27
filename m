Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 27 Jan 2020 17:38:10 -0000
Message-ID: <158014669007.9687.14363651071109099620@emeril.freedesktop.org>
References: <20200127121818.2492460-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200127121818.2492460-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/5=5D_i915=3A_Start_putting_the_mmio?=
 =?utf-8?q?=5Fbase_to_wider_use?=
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

Series: series starting with [i-g-t,1/5] i915: Start putting the mmio_base to wider use
URL   : https://patchwork.freedesktop.org/series/72620/
State : success

== Summary ==

CI Bug Log - changes from IGT_5389 -> IGTPW_4005
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/index.html

Known issues
------------

  Here are the changes found in IGTPW_4005 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-6700k2:      [PASS][1] -> [DMESG-WARN][2] ([i915#889])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [PASS][3] -> [DMESG-FAIL][4] ([i915#725])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gt_engines:
    - fi-cfl-8700k:       [PASS][5] -> [DMESG-FAIL][6] ([i915#889]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/fi-cfl-8700k/igt@i915_selftest@live_gt_engines.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/fi-cfl-8700k/igt@i915_selftest@live_gt_engines.html

  * igt@i915_selftest@live_gt_pm:
    - fi-cfl-8700k:       [PASS][7] -> [DMESG-WARN][8] ([i915#889]) +10 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/fi-cfl-8700k/igt@i915_selftest@live_gt_pm.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/fi-cfl-8700k/igt@i915_selftest@live_gt_pm.html

  * igt@i915_selftest@live_mman:
    - fi-cfl-8700k:       [PASS][9] -> [INCOMPLETE][10] ([i915#971])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/fi-cfl-8700k/igt@i915_selftest@live_mman.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/fi-cfl-8700k/igt@i915_selftest@live_mman.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-peppy:       [INCOMPLETE][11] ([i915#816]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/fi-hsw-peppy/igt@gem_close_race@basic-threads.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-kbl-7500u:       [INCOMPLETE][13] ([i915#879]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/fi-kbl-7500u/igt@i915_module_load@reload-with-fault-injection.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/fi-kbl-7500u/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [DMESG-FAIL][15] ([i915#725]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/fi-hsw-4770r/igt@i915_selftest@live_blt.html
    - fi-ivb-3770:        [DMESG-FAIL][17] ([i915#770]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/fi-ivb-3770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_hangcheck:
    - fi-icl-guc:         [INCOMPLETE][19] ([fdo#108569] / [i915#140]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/fi-icl-guc/igt@i915_selftest@live_hangcheck.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/fi-icl-guc/igt@i915_selftest@live_hangcheck.html

  
#### Warnings ####

  * igt@gem_exec_parallel@fds:
    - fi-byt-n2820:       [TIMEOUT][21] ([fdo#112271]) -> [INCOMPLETE][22] ([i915#45])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/fi-byt-n2820/igt@gem_exec_parallel@fds.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/fi-byt-n2820/igt@gem_exec_parallel@fds.html

  
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#879]: https://gitlab.freedesktop.org/drm/intel/issues/879
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889
  [i915#971]: https://gitlab.freedesktop.org/drm/intel/issues/971


Participating hosts (50 -> 44)
------------------------------

  Missing    (6): fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5389 -> IGTPW_4005

  CI-20190529: 20190529
  CI_DRM_7824: 43e5c192e3b36a8caef56e8d8f3c4e67433aa223 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4005: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/index.html
  IGT_5389: 966c58649dee31bb5bf2fad92f75ffd365968b81 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@sysfs_heartbeat_interval@idempotent
+igt@sysfs_heartbeat_interval@invalid
+igt@sysfs_heartbeat_interval@long
+igt@sysfs_heartbeat_interval@mixed
+igt@sysfs_heartbeat_interval@nopreempt
+igt@sysfs_heartbeat_interval@off
+igt@sysfs_heartbeat_interval@precise
+igt@sysfs_preempt_timeout@idempotent
+igt@sysfs_preempt_timeout@invalid
+igt@sysfs_preempt_timeout@off
+igt@sysfs_preempt_timeout@timeout
+igt@sysfs_timeslice_duration@duration
+igt@sysfs_timeslice_duration@idempotent
+igt@sysfs_timeslice_duration@invalid
+igt@sysfs_timeslice_duration@off
+igt@sysfs_timeslice_duration@timeout

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
