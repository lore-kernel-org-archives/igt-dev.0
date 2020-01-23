Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Jan 2020 15:34:16 -0000
Message-ID: <157979365660.1144.8110272416037115372@emeril.freedesktop.org>
References: <20200123124306.18857-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200123124306.18857-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fengine=5Ftopology=3A_Introduce_and_use_gem=5Fcontext=5Fclo?=
 =?utf-8?q?ne=5Fwith=5Fengines_=28rev2=29?=
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_engine_topology: Introduce and use gem_context_clone_with_engines (rev2)
URL   : https://patchwork.freedesktop.org/series/72464/
State : success

== Summary ==

CI Bug Log - changes from IGT_5382 -> IGTPW_3979
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3979/index.html

Known issues
------------

  Here are the changes found in IGTPW_3979 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@fds:
    - fi-byt-n2820:       [PASS][1] -> [INCOMPLETE][2] ([i915#45])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/fi-byt-n2820/igt@gem_exec_parallel@fds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3979/fi-byt-n2820/igt@gem_exec_parallel@fds.html

  * igt@prime_self_import@basic-with_fd_dup:
    - fi-tgl-y:           [PASS][3] -> [DMESG-WARN][4] ([CI#94] / [i915#402])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/fi-tgl-y/igt@prime_self_import@basic-with_fd_dup.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3979/fi-tgl-y/igt@prime_self_import@basic-with_fd_dup.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [INCOMPLETE][5] ([i915#45]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3979/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [FAIL][7] ([CI#94]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3979/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [DMESG-FAIL][9] ([i915#553] / [i915#725]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3979/fi-hsw-4770r/igt@i915_selftest@live_blt.html
    - fi-ivb-3770:        [DMESG-FAIL][11] ([i915#725]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3979/fi-ivb-3770/igt@i915_selftest@live_blt.html
    - fi-hsw-4770:        [DMESG-FAIL][13] ([i915#725]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3979/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-hsw-peppy:       [DMESG-FAIL][15] ([i915#722]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3979/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-hsw-peppy:       [DMESG-WARN][17] ([i915#44]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3979/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html

  
#### Warnings ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-n2820:       [FAIL][19] ([i915#694]) -> [TIMEOUT][20] ([fdo#112271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3979/fi-byt-n2820/igt@gem_exec_parallel@contexts.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-lmem:        [INCOMPLETE][21] ([i915#671] / [i915#971]) -> [DMESG-WARN][22] ([i915#889])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3979/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1017]: https://gitlab.freedesktop.org/drm/intel/issues/1017
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#671]: https://gitlab.freedesktop.org/drm/intel/issues/671
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#722]: https://gitlab.freedesktop.org/drm/intel/issues/722
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889
  [i915#971]: https://gitlab.freedesktop.org/drm/intel/issues/971


Participating hosts (53 -> 45)
------------------------------

  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5382 -> IGTPW_3979

  CI-20190529: 20190529
  CI_DRM_7802: cd932df72f11bdff93423a8d4a9e0e9ccb0985d7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3979: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3979/index.html
  IGT_5382: 8dbe5ce61baa2d563d4dd7c56a018bb1e1077467 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3979/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
