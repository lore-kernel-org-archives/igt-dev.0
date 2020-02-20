Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 20 Feb 2020 19:56:31 -0000
Message-ID: <158222859113.17408.610898952663262@emeril.freedesktop.org>
References: <20200220174155.2162242-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200220174155.2162242-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9p?=
 =?utf-8?q?915=5Fpm=5Frpm=3A_Only_check_for_suspend_failures_after_each_de?=
 =?utf-8?q?bugfs_entry?=
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

Series: i915/i915_pm_rpm: Only check for suspend failures after each debugfs entry
URL   : https://patchwork.freedesktop.org/series/73729/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7975 -> IGTPW_4203
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4203/index.html

Known issues
------------

  Here are the changes found in IGTPW_4203 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_mmap_gtt@basic:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([CI#94] / [i915#402]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-tgl-y/igt@gem_mmap_gtt@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4203/fi-tgl-y/igt@gem_mmap_gtt@basic.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cml-s:           [PASS][3] -> [DMESG-FAIL][4] ([i915#877])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-cml-s/igt@i915_selftest@live_gem_contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4203/fi-cml-s/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - fi-skl-6600u:       [PASS][5] -> [INCOMPLETE][6] ([i915#69])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-skl-6600u/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4203/fi-skl-6600u/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-4770r:       [TIMEOUT][7] ([fdo#112271] / [i915#1084]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-hsw-4770r/igt@gem_close_race@basic-threads.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4203/fi-hsw-4770r/igt@gem_close_race@basic-threads.html
    - fi-byt-n2820:       [INCOMPLETE][9] ([i915#45]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4203/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_execlists:
    - fi-tgl-y:           [INCOMPLETE][11] ([CI#94] / [i915#647]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-tgl-y/igt@i915_selftest@live_execlists.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4203/fi-tgl-y/igt@i915_selftest@live_execlists.html
    - fi-icl-y:           [DMESG-FAIL][13] ([fdo#108569]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-icl-y/igt@i915_selftest@live_execlists.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4203/fi-icl-y/igt@i915_selftest@live_execlists.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-cml-u2:          [FAIL][15] ([i915#262]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4203/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html

  * igt@prime_self_import@basic-llseek-bad:
    - fi-tgl-y:           [DMESG-WARN][17] ([CI#94] / [i915#402]) -> [PASS][18] +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4203/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html

  
#### Warnings ####

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][19] ([fdo#111096] / [i915#323]) -> [FAIL][20] ([fdo#111407])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4203/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#647]: https://gitlab.freedesktop.org/drm/intel/issues/647
  [i915#69]: https://gitlab.freedesktop.org/drm/intel/issues/69
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877


Participating hosts (47 -> 46)
------------------------------

  Additional (5): fi-tgl-dsi fi-glk-dsi fi-bwr-2160 fi-snb-2520m fi-kbl-r 
  Missing    (6): fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5453 -> IGTPW_4203

  CI-20190529: 20190529
  CI_DRM_7975: f66891f7bdc3c60bb6f06fd6bc0718a0bd975896 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4203: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4203/index.html
  IGT_5453: cae9a5881ed2c5be2c2518a255740b612a927f9a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4203/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
