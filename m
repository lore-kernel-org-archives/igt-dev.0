Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 07 Feb 2020 12:54:05 -0000
Message-ID: <158108004595.8755.6530120151859574726@emeril.freedesktop.org>
References: <20200207115834.26620-1-mika.kahola@intel.com>
In-Reply-To: <20200207115834.26620-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fccs=3A_Simplify_FB_width_check?=
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_ccs: Simplify FB width check
URL   : https://patchwork.freedesktop.org/series/73136/
State : success

== Summary ==

CI Bug Log - changes from IGT_5425 -> IGTPW_4111
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/index.html

Known issues
------------

  Here are the changes found in IGTPW_4111 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-peppy:       [PASS][1] -> [TIMEOUT][2] ([fdo#112271] / [i915#1084])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/fi-hsw-peppy/igt@gem_close_race@basic-threads.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6770hq:      [PASS][3] -> [FAIL][4] ([i915#178])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [PASS][5] -> [DMESG-FAIL][6] ([i915#725])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/fi-ivb-3770/igt@i915_selftest@live_blt.html
    - fi-hsw-4770:        [PASS][7] -> [DMESG-FAIL][8] ([i915#553] / [i915#725])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/fi-hsw-4770/igt@i915_selftest@live_blt.html
    - fi-hsw-4770r:       [PASS][9] -> [DMESG-FAIL][10] ([i915#770])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-n2820:       [FAIL][11] ([i915#694]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
    - fi-byt-j1900:       [FAIL][13] ([i915#694]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/fi-byt-j1900/igt@gem_exec_parallel@contexts.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/fi-byt-j1900/igt@gem_exec_parallel@contexts.html

  * igt@i915_selftest@live_blt:
    - fi-bsw-n3050:       [INCOMPLETE][15] ([i915#392]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/fi-bsw-n3050/igt@i915_selftest@live_blt.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/fi-bsw-n3050/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_execlists:
    - fi-icl-y:           [DMESG-FAIL][17] ([fdo#108569]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/fi-icl-y/igt@i915_selftest@live_execlists.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/fi-icl-y/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-byt-j1900:       [DMESG-FAIL][19] ([i915#1052]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/fi-byt-j1900/igt@i915_selftest@live_gem_contexts.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/fi-byt-j1900/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][21] ([fdo#111096] / [i915#323]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-hsw-peppy:       [DMESG-WARN][23] ([i915#44]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html

  
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1052]: https://gitlab.freedesktop.org/drm/intel/issues/1052
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#178]: https://gitlab.freedesktop.org/drm/intel/issues/178
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#392]: https://gitlab.freedesktop.org/drm/intel/issues/392
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770


Participating hosts (53 -> 48)
------------------------------

  Additional (2): fi-kbl-7560u fi-pnv-d510 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5425 -> IGTPW_4111

  CI-20190529: 20190529
  CI_DRM_7885: fc2806bc441bfc6b44cf4713f3c6b820d73c3534 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4111: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/index.html
  IGT_5425: ad4542ef1adbaa1227bc9ba9e24bb0e0f6dd408d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4111/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
