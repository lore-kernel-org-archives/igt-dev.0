Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 27 Jan 2020 14:48:11 -0000
Message-ID: <158013649155.9685.401756340794273476@emeril.freedesktop.org>
References: <20200127110431.30712-1-ramalingam.c@intel.com>
In-Reply-To: <20200127110431.30712-1-ramalingam.c@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fcreate=3A_Modify_the_page_nonaligned_tests?=
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
To: Ramalingam C <ramalingam.c@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_create: Modify the page nonaligned tests
URL   : https://patchwork.freedesktop.org/series/72614/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7817 -> IGTPW_4003
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4003/index.html

Known issues
------------

  Here are the changes found in IGTPW_4003 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-icl-guc:         [PASS][1] -> [DMESG-WARN][2] ([i915#109])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7817/fi-icl-guc/igt@i915_module_load@reload-with-fault-injection.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4003/fi-icl-guc/igt@i915_module_load@reload-with-fault-injection.html
    - fi-cfl-8700k:       [PASS][3] -> [INCOMPLETE][4] ([i915#505])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7817/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4003/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html
    - fi-skl-6600u:       [PASS][5] -> [INCOMPLETE][6] ([i915#671] / [i915#69])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7817/fi-skl-6600u/igt@i915_module_load@reload-with-fault-injection.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4003/fi-skl-6600u/igt@i915_module_load@reload-with-fault-injection.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-peppy:       [INCOMPLETE][7] -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7817/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4003/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
    - fi-byt-j1900:       [INCOMPLETE][9] ([i915#45]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7817/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4003/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_parallel@fds:
    - fi-byt-n2820:       [TIMEOUT][11] ([fdo#112271]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7817/fi-byt-n2820/igt@gem_exec_parallel@fds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4003/fi-byt-n2820/igt@gem_exec_parallel@fds.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][13] ([i915#553] / [i915#725]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7817/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4003/fi-hsw-4770/igt@i915_selftest@live_blt.html

  
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#109]: https://gitlab.freedesktop.org/drm/intel/issues/109
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#505]: https://gitlab.freedesktop.org/drm/intel/issues/505
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#671]: https://gitlab.freedesktop.org/drm/intel/issues/671
  [i915#69]: https://gitlab.freedesktop.org/drm/intel/issues/69
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725


Participating hosts (44 -> 45)
------------------------------

  Additional (5): fi-kbl-7560u fi-bdw-gvtdvm fi-ilk-650 fi-skl-lmem fi-blb-e6850 
  Missing    (4): fi-ctg-p8600 fi-byt-squawks fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5387 -> IGTPW_4003

  CI-20190529: 20190529
  CI_DRM_7817: dfddafaf7e0940549825bafa5ea0f274235b8e5d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4003: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4003/index.html
  IGT_5387: 2e04a36cb5eba1a979bce80b58c35687f324f066 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

-igt@gem_create@create-invalid-nonaligned

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4003/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
