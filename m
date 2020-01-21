Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 21 Jan 2020 00:38:34 -0000
Message-ID: <157956711489.11479.12165987884720176087@emeril.freedesktop.org>
References: <20200120173959.4177379-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200120173959.4177379-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Ffence=3A_Fix_fence_leak_for_gen9-cmdparser?=
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

Series: i915/gem_exec_fence: Fix fence leak for gen9-cmdparser
URL   : https://patchwork.freedesktop.org/series/72300/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7781 -> IGTPW_3954
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/index.html

Known issues
------------

  Here are the changes found in IGTPW_3954 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [DMESG-FAIL][1] ([i915#553] / [i915#725]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/fi-hsw-4770r/igt@i915_selftest@live_blt.html
    - fi-hsw-4770:        [DMESG-FAIL][3] ([i915#725]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/fi-hsw-4770/igt@i915_selftest@live_blt.html

  
#### Warnings ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-n2820:       [TIMEOUT][5] ([fdo#112271]) -> [INCOMPLETE][6] ([i915#45])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/fi-byt-n2820/igt@gem_exec_parallel@contexts.html

  
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725


Participating hosts (50 -> 39)
------------------------------

  Missing    (11): fi-ilk-m540 fi-ehl-1 fi-hsw-4200u fi-hsw-peppy fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-gdg-551 fi-byt-clapper fi-bsw-nick fi-snb-2600 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5374 -> IGTPW_3954

  CI-20190529: 20190529
  CI_DRM_7781: 3f2b341ae1fde67f823aeb715c6f489affdef8b1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3954: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/index.html
  IGT_5374: 83c32e859202e43ff6a8cca162c76fcd90ad6e3b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
