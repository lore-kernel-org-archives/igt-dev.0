Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 14 May 2020 09:16:40 -0000
Message-ID: <158944780021.2827.14682269018957814746@emeril.freedesktop.org>
References: <20200514074412.962179-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200514074412.962179-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2k5?=
 =?utf-8?q?15=3A_Reset_all_engine_properties_to_defaults_prior_to_the_star?=
 =?utf-8?q?t_of_a_test_=28rev2=29?=
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

Series: lib/i915: Reset all engine properties to defaults prior to the start of a test (rev2)
URL   : https://patchwork.freedesktop.org/series/76951/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8483 -> IGTPW_4568
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/index.html

Known issues
------------

  Here are the changes found in IGTPW_4568 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-tgl-y:           [PASS][1] -> [INCOMPLETE][2] ([i915#1803])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/fi-tgl-y/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/fi-tgl-y/igt@i915_selftest@live@execlists.html
    - fi-kbl-soraka:      [PASS][3] -> [INCOMPLETE][4] ([CI#80] / [i915#656])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/fi-kbl-soraka/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/fi-kbl-soraka/igt@i915_selftest@live@execlists.html
    - fi-kbl-guc:         [PASS][5] -> [INCOMPLETE][6] ([CI#80] / [i915#656])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/fi-kbl-guc/igt@i915_selftest@live@execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/fi-kbl-guc/igt@i915_selftest@live@execlists.html

  
#### Warnings ####

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      [DMESG-FAIL][7] ([i915#1744]) -> [DMESG-FAIL][8] ([i915#1886])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [i915#1744]: https://gitlab.freedesktop.org/drm/intel/issues/1744
  [i915#1803]: https://gitlab.freedesktop.org/drm/intel/issues/1803
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656


Participating hosts (50 -> 45)
------------------------------

  Additional (1): fi-skl-6600u 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5654 -> IGTPW_4568

  CI-20190529: 20190529
  CI_DRM_8483: eb8997678b25cb3ca507e02cb4e8bfd9c42b4268 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4568: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/index.html
  IGT_5654: 5637a466a0b09535517751608f5525a8b468a76b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
