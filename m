Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Jan 2020 13:37:47 -0000
Message-ID: <157978666773.1146.1791838051499413403@emeril.freedesktop.org>
References: <20200123122711.1390696-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200123122711.1390696-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?dumb=5Fbuffer=3A_Try_to_compute_the_largest_possible_dumb_buffe?=
 =?utf-8?q?r?=
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

Series: tests/dumb_buffer: Try to compute the largest possible dumb buffer
URL   : https://patchwork.freedesktop.org/series/72463/
State : success

== Summary ==

CI Bug Log - changes from IGT_5380 -> IGTPW_3978
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/index.html

Known issues
------------

  Here are the changes found in IGTPW_3978 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@fds:
    - fi-byt-n2820:       [PASS][1] -> [TIMEOUT][2] ([fdo#112271])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/fi-byt-n2820/igt@gem_exec_parallel@fds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/fi-byt-n2820/igt@gem_exec_parallel@fds.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-guc:         [PASS][3] -> [FAIL][4] ([i915#579])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [PASS][5] -> [DMESG-FAIL][6] ([i915#553] / [i915#725])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/fi-hsw-4770r/igt@i915_selftest@live_blt.html
    - fi-hsw-4770:        [PASS][7] -> [DMESG-FAIL][8] ([i915#725])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-guc:         [PASS][9] -> [INCOMPLETE][10] ([fdo#106070] / [i915#424])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][11] -> [FAIL][12] ([fdo#111407])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@fbdev@mmap:
    - fi-tgl-y:           [SKIP][13] ([CI#94]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/fi-tgl-y/igt@fbdev@mmap.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/fi-tgl-y/igt@fbdev@mmap.html

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [INCOMPLETE][15] ([i915#45]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_parallel@contexts:
    - fi-byt-n2820:       [TIMEOUT][17] ([fdo#112271]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/fi-byt-n2820/igt@gem_exec_parallel@contexts.html

  * igt@gem_exec_parallel@fds:
    - fi-hsw-peppy:       [INCOMPLETE][19] -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/fi-hsw-peppy/igt@gem_exec_parallel@fds.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/fi-hsw-peppy/igt@gem_exec_parallel@fds.html

  * igt@gem_exec_suspend@basic-s0:
    - fi-tgl-y:           [INCOMPLETE][21] ([CI#94] / [i915#456] / [i915#472]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/fi-tgl-y/igt@gem_exec_suspend@basic-s0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/fi-tgl-y/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [DMESG-FAIL][23] ([i915#770]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5380/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/fi-ivb-3770/igt@i915_selftest@live_blt.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#106070]: https://bugs.freedesktop.org/show_bug.cgi?id=106070
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770


Participating hosts (51 -> 45)
------------------------------

  Additional (1): fi-bsw-kefka 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5380 -> IGTPW_3978

  CI-20190529: 20190529
  CI_DRM_7801: 6e1cfbab49286533a902e0c265249b80e5cf71da @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3978: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/index.html
  IGT_5380: 50c31d6423d37633dae5d36c7aaea10162baa63d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3978/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
