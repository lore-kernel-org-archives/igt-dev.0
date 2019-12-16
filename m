Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 16 Dec 2019 13:31:39 -0000
Message-ID: <157650309908.5611.1154659044283706100@emeril.freedesktop.org>
References: <20191216093433.2517697-1-chris@chris-wilson.co.uk>
In-Reply-To: <20191216093433.2517697-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9w?=
 =?utf-8?q?erf=3A_Skip_OA_testing_on_systems_too_old?=
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

Series: i915/perf: Skip OA testing on systems too old
URL   : https://patchwork.freedesktop.org/series/70973/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7573 -> IGTPW_3864
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/index.html

Known issues
------------

  Here are the changes found in IGTPW_3864 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [PASS][1] -> [TIMEOUT][2] ([i915#816])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/fi-byt-j1900/igt@gem_close_race@basic-threads.html
    - fi-byt-n2820:       [PASS][3] -> [TIMEOUT][4] ([i915#816])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][5] -> [FAIL][6] ([fdo#111096] / [i915#323])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-hsw-peppy:       [PASS][7] -> [DMESG-WARN][8] ([i915#44])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0:
    - {fi-tgl-guc}:       [INCOMPLETE][9] ([i915#456] / [i915#472]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/fi-tgl-guc/igt@gem_exec_suspend@basic-s0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/fi-tgl-guc/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_sync@basic-store-each:
    - {fi-tgl-u}:         [INCOMPLETE][11] ([i915#435] / [i915#472]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/fi-tgl-u/igt@gem_sync@basic-store-each.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/fi-tgl-u/igt@gem_sync@basic-store-each.html

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [DMESG-FAIL][13] ([i915#725]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/fi-ivb-3770/igt@i915_selftest@live_blt.html
    - fi-hsw-4770r:       [DMESG-FAIL][15] ([i915#553] / [i915#725]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - fi-icl-y:           [INCOMPLETE][17] ([i915#140]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/fi-icl-y/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/fi-icl-y/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-kbl-x1275:       [DMESG-WARN][19] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][20] ([i915#62] / [i915#92]) +7 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-kbl-x1275:       [DMESG-WARN][21] ([i915#62] / [i915#92]) -> [DMESG-WARN][22] ([i915#62] / [i915#92] / [i915#95]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/fi-kbl-x1275/igt@i915_pm_rpm@basic-pci-d3-state.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/fi-kbl-x1275/igt@i915_pm_rpm@basic-pci-d3-state.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (53 -> 46)
------------------------------

  Additional (1): fi-kbl-guc 
  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5349 -> IGTPW_3864

  CI-20190529: 20190529
  CI_DRM_7573: 5f2c1ea1bfb34f9777b829eec98a974edd82b885 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3864: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/index.html
  IGT_5349: 048f58513d8b8ec6bb307a939f0ac959bc0f0e10 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
