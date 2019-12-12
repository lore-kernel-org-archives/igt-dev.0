Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 12 Dec 2019 13:42:08 -0000
Message-ID: <157615812899.32008.6270337906410690173@emeril.freedesktop.org>
References: <20191212123301.23827-1-stanislav.lisovskiy@intel.com>
In-Reply-To: <20191212123301.23827-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaWd0L3Rl?=
 =?utf-8?q?sts=3A_kms=5Fplane=5Fstress=3A_Add_plane_stress_test_=28rev21?=
 =?utf-8?q?=29?=
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
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: igt/tests: kms_plane_stress: Add plane stress test (rev21)
URL   : https://patchwork.freedesktop.org/series/58524/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7549 -> IGTPW_3856
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/index.html

Known issues
------------

  Here are the changes found in IGTPW_3856 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_wait@basic-wait-all:
    - fi-ivb-3770:        [PASS][1] -> [FAIL][2] ([i915#777])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-ivb-3770/igt@gem_wait@basic-wait-all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/fi-ivb-3770/igt@gem_wait@basic-wait-all.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-byt-j1900:       [PASS][3] -> [INCOMPLETE][4] ([i915#45])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-byt-j1900/igt@i915_selftest@live_gem_contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/fi-byt-j1900/igt@i915_selftest@live_gem_contexts.html
    - fi-hsw-peppy:       [PASS][5] -> [INCOMPLETE][6] ([i915#694])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html
    - fi-byt-n2820:       [PASS][7] -> [INCOMPLETE][8] ([i915#45])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - {fi-tgl-u}:         [INCOMPLETE][9] ([fdo#111593]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-tgl-u/igt@gem_exec_gttfill@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/fi-tgl-u/igt@gem_exec_gttfill@basic.html

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [DMESG-FAIL][11] ([i915#563]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/fi-ivb-3770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_hangcheck:
    - fi-icl-u3:          [INCOMPLETE][13] ([fdo#108569] / [i915#140]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-icl-u3/igt@i915_selftest@live_hangcheck.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/fi-icl-u3/igt@i915_selftest@live_hangcheck.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][15] ([fdo#111096] / [i915#323]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-kbl-x1275:       [DMESG-WARN][17] ([i915#62] / [i915#92]) -> [DMESG-WARN][18] ([i915#62] / [i915#92] / [i915#95]) +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-kbl-x1275/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/fi-kbl-x1275/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - fi-kbl-x1275:       [DMESG-WARN][19] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][20] ([i915#62] / [i915#92]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#777]: https://gitlab.freedesktop.org/drm/intel/issues/777
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (48 -> 46)
------------------------------

  Additional (3): fi-kbl-soraka fi-hsw-4770r fi-cfl-guc 
  Missing    (5): fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5346 -> IGTPW_3856

  CI-20190529: 20190529
  CI_DRM_7549: 9573e1b7d1cb54cc984cf5c4f93a743641d868da @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3856: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/index.html
  IGT_5346: 466b0e6cbcbaccff012b484d1fd7676364b37b93 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@i915_pipe_stress@stress-xrgb8888-untiled

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
