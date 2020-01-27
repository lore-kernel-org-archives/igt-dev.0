Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 27 Jan 2020 20:26:11 -0000
Message-ID: <158015677125.9685.16447363725494228640@emeril.freedesktop.org>
References: <20200127192859.20029-1-bob.j.paauwe@intel.com>
In-Reply-To: <20200127192859.20029-1-bob.j.paauwe@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2Nv?=
 =?utf-8?q?lor=5Fencoding=3A_Fix_up_support_for_XYUV_format?=
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
To: Bob Paauwe <bob.j.paauwe@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/color_encoding: Fix up support for XYUV format
URL   : https://patchwork.freedesktop.org/series/72636/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7826 -> IGTPW_4011
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4011/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4011:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - {fi-kbl-7560u}:     NOTRUN -> [DMESG-WARN][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4011/fi-kbl-7560u/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
Known issues
------------

  Here are the changes found in IGTPW_4011 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [PASS][2] -> [INCOMPLETE][3] ([i915#45])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7826/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4011/fi-byt-j1900/igt@gem_close_race@basic-threads.html
    - fi-byt-n2820:       [PASS][4] -> [INCOMPLETE][5] ([i915#45])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7826/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4011/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_execlists:
    - fi-glk-dsi:         [PASS][6] -> [DMESG-WARN][7] ([i915#889]) +23 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7826/fi-glk-dsi/igt@i915_selftest@live_execlists.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4011/fi-glk-dsi/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@live_gt_engines:
    - fi-glk-dsi:         [PASS][8] -> [DMESG-FAIL][9] ([i915#889]) +7 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7826/fi-glk-dsi/igt@i915_selftest@live_gt_engines.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4011/fi-glk-dsi/igt@i915_selftest@live_gt_engines.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-peppy:       [INCOMPLETE][10] ([i915#816]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7826/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4011/fi-hsw-peppy/igt@gem_close_race@basic-threads.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-cfl-8700k:       [DMESG-WARN][12] ([i915#889]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7826/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4011/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html
    - fi-skl-lmem:        [DMESG-WARN][14] ([i915#889]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7826/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4011/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@module-reload:
    - fi-cfl-8700k:       [INCOMPLETE][16] ([i915#148] / [i915#971]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7826/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4011/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html
    - fi-skl-6700k2:      [DMESG-WARN][18] ([i915#889]) -> [PASS][19] +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7826/fi-skl-6700k2/igt@i915_pm_rpm@module-reload.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4011/fi-skl-6700k2/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][20] ([i915#770]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7826/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4011/fi-hsw-4770/igt@i915_selftest@live_blt.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-kbl-guc:         [FAIL][22] ([i915#704]) -> [SKIP][23] ([fdo#109271])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7826/fi-kbl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4011/fi-kbl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [DMESG-FAIL][24] ([i915#553] / [i915#725]) -> [DMESG-FAIL][25] ([i915#725])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7826/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4011/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#148]: https://gitlab.freedesktop.org/drm/intel/issues/148
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#704]: https://gitlab.freedesktop.org/drm/intel/issues/704
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889
  [i915#971]: https://gitlab.freedesktop.org/drm/intel/issues/971


Participating hosts (46 -> 45)
------------------------------

  Additional (3): fi-kbl-7560u fi-skl-6600u fi-bsw-n3050 
  Missing    (4): fi-ctg-p8600 fi-byt-squawks fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5389 -> IGTPW_4011

  CI-20190529: 20190529
  CI_DRM_7826: 04d0421c09d70ea76da8a3685347740df9f84aaf @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4011: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4011/index.html
  IGT_5389: 966c58649dee31bb5bf2fad92f75ffd365968b81 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4011/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
