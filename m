Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 21 Jan 2020 04:27:09 -0000
Message-ID: <157958082971.11478.8040724631885021740@emeril.freedesktop.org>
References: <20200120220320.17092-1-imre.deak@intel.com>
In-Reply-To: <20200120220320.17092-1-imre.deak@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D_lib/ioctl=5Fwrappers=3A_Query_?=
 =?utf-8?q?if_device_supports_set/get_legacy_tiling?=
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/3] lib/ioctl_wrappers: Query if device supports set/get legacy tiling
URL   : https://patchwork.freedesktop.org/series/72308/
State : success

== Summary ==

CI Bug Log - changes from IGT_5375 -> IGTPW_3956
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/index.html

Known issues
------------

  Here are the changes found in IGTPW_3956 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live_gem_contexts:
    - fi-kbl-x1275:       [PASS][1] -> [DMESG-FAIL][2] ([i915#943])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/fi-kbl-x1275/igt@i915_selftest@live_gem_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/fi-kbl-x1275/igt@i915_selftest@live_gem_contexts.html

  * igt@i915_selftest@live_mman:
    - fi-bxt-dsi:         [PASS][3] -> [DMESG-WARN][4] ([i915#889]) +23 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/fi-bxt-dsi/igt@i915_selftest@live_mman.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/fi-bxt-dsi/igt@i915_selftest@live_mman.html

  * igt@i915_selftest@live_reset:
    - fi-bxt-dsi:         [PASS][5] -> [DMESG-FAIL][6] ([i915#889]) +7 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/fi-bxt-dsi/igt@i915_selftest@live_reset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/fi-bxt-dsi/igt@i915_selftest@live_reset.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@fds:
    - fi-byt-j1900:       [INCOMPLETE][7] ([i915#45]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/fi-byt-j1900/igt@gem_exec_parallel@fds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/fi-byt-j1900/igt@gem_exec_parallel@fds.html

  
#### Warnings ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-n2820:       [FAIL][9] -> [INCOMPLETE][10] ([i915#45])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5375/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/fi-byt-n2820/igt@gem_exec_parallel@contexts.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889
  [i915#937]: https://gitlab.freedesktop.org/drm/intel/issues/937
  [i915#943]: https://gitlab.freedesktop.org/drm/intel/issues/943


Participating hosts (46 -> 43)
------------------------------

  Additional (2): fi-cfl-8109u fi-bwr-2160 
  Missing    (5): fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-bsw-nick 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5375 -> IGTPW_3956

  CI-20190529: 20190529
  CI_DRM_7781: 3f2b341ae1fde67f823aeb715c6f489affdef8b1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3956: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/index.html
  IGT_5375: 6a6f7a50c5b2a62f5294b37a810ec7458aaeb774 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3956/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
