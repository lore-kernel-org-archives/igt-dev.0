Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 13 Feb 2020 05:37:15 -0000
Message-ID: <158157223524.17961.17148783633278626386@emeril.freedesktop.org>
References: <20200213045004.28209-1-sravan.kumar.nedunoori@intel.com>
In-Reply-To: <20200213045004.28209-1-sravan.kumar.nedunoori@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fwrite=5Fread=5Fring=5Fswitch_Removal_of_IGT_Test?=
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
To: Sravan Kumar Nedunoori <sravan.kumar.nedunoori@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_write_read_ring_switch Removal of IGT Test
URL   : https://patchwork.freedesktop.org/series/73391/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7926 -> IGTPW_4142
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/index.html

Known issues
------------

  Here are the changes found in IGTPW_4142 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live_gem_contexts:
    - fi-ivb-3770:        [PASS][1] -> [DMESG-FAIL][2] ([i915#722])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/fi-ivb-3770/igt@i915_selftest@live_gem_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/fi-ivb-3770/igt@i915_selftest@live_gem_contexts.html
    - fi-byt-n2820:       [PASS][3] -> [DMESG-FAIL][4] ([i915#722])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html
    - fi-cfl-guc:         [PASS][5] -> [INCOMPLETE][6] ([CI#80] / [fdo#106070] / [i915#424])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html

  * igt@i915_selftest@live_hangcheck:
    - fi-icl-u3:          [PASS][7] -> [INCOMPLETE][8] ([fdo#108569])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/fi-icl-u3/igt@i915_selftest@live_hangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/fi-icl-u3/igt@i915_selftest@live_hangcheck.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][9] -> [FAIL][10] ([fdo#111407])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7926/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#106070]: https://bugs.freedesktop.org/show_bug.cgi?id=106070
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#722]: https://gitlab.freedesktop.org/drm/intel/issues/722
  [i915#937]: https://gitlab.freedesktop.org/drm/intel/issues/937


Participating hosts (45 -> 46)
------------------------------

  Additional (7): fi-hsw-peppy fi-skl-6770hq fi-bdw-gvtdvm fi-glk-dsi fi-gdg-551 fi-bsw-kefka fi-kbl-r 
  Missing    (6): fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5437 -> IGTPW_4142

  CI-20190529: 20190529
  CI_DRM_7926: 6b2fe829d300abf285e9db8b252ffacd216df3ed @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4142: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/index.html
  IGT_5437: ae42fedfd0c536c560e8e17b06d9c7b94a4e8f0c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

-igt@gem_write_read_ring_switch@blt2bsd
-igt@gem_write_read_ring_switch@blt2bsd-interruptible
-igt@gem_write_read_ring_switch@blt2render
-igt@gem_write_read_ring_switch@blt2render-interruptible
-igt@gem_write_read_ring_switch@blt2vebox
-igt@gem_write_read_ring_switch@blt2vebox-interruptible

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4142/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
