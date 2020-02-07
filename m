Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 07 Feb 2020 13:48:47 -0000
Message-ID: <158108332782.8752.12801351202698060739@emeril.freedesktop.org>
References: <20200207125941.22974-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200207125941.22974-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgZ2VtX2N0?=
 =?utf-8?q?x=5Fcreate=3AAdjusted_test_to_use_=5F=5Ffor=5Feach=5Fphysical?=
 =?utf-8?q?=5Fengine_to_utilize_all_available_engines_=28rev3=29?=
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
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: gem_ctx_create:Adjusted test to use __for_each_physical_engine to utilize all available engines (rev3)
URL   : https://patchwork.freedesktop.org/series/72889/
State : success

== Summary ==

CI Bug Log - changes from IGT_5425 -> IGTPW_4112
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/index.html

Known issues
------------

  Here are the changes found in IGTPW_4112 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [PASS][1] -> [INCOMPLETE][2] ([i915#45])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [PASS][3] -> [DMESG-FAIL][4] ([i915#553] / [i915#725])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gtt:
    - fi-bdw-5557u:       [PASS][5] -> [TIMEOUT][6] ([fdo#112271])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/fi-bdw-5557u/igt@i915_selftest@live_gtt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/fi-bdw-5557u/igt@i915_selftest@live_gtt.html

  * igt@i915_selftest@live_hangcheck:
    - fi-icl-u3:          [PASS][7] -> [INCOMPLETE][8] ([fdo#108569])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/fi-icl-u3/igt@i915_selftest@live_hangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/fi-icl-u3/igt@i915_selftest@live_hangcheck.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_blt:
    - fi-bsw-n3050:       [INCOMPLETE][9] ([i915#392]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/fi-bsw-n3050/igt@i915_selftest@live_blt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/fi-bsw-n3050/igt@i915_selftest@live_blt.html
    - fi-bsw-nick:        [INCOMPLETE][11] ([i915#392]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/fi-bsw-nick/igt@i915_selftest@live_blt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/fi-bsw-nick/igt@i915_selftest@live_blt.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][13] ([fdo#111096] / [i915#323]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-hsw-peppy:       [DMESG-WARN][15] ([i915#44]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html

  
#### Warnings ####

  * igt@gem_exec_parallel@fds:
    - fi-byt-n2820:       [FAIL][17] ([i915#694]) -> [TIMEOUT][18] ([fdo#112271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/fi-byt-n2820/igt@gem_exec_parallel@fds.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/fi-byt-n2820/igt@gem_exec_parallel@fds.html

  
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#392]: https://gitlab.freedesktop.org/drm/intel/issues/392
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725


Participating hosts (53 -> 47)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5425 -> IGTPW_4112

  CI-20190529: 20190529
  CI_DRM_7885: fc2806bc441bfc6b44cf4713f3c6b820d73c3534 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4112: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/index.html
  IGT_5425: ad4542ef1adbaa1227bc9ba9e24bb0e0f6dd408d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_ctx_create@active
+igt@gem_ctx_create@forked-active
+igt@gem_ctx_create@hog
-igt@gem_ctx_create@active-blt
-igt@gem_ctx_create@active-bsd
-igt@gem_ctx_create@active-bsd1
-igt@gem_ctx_create@active-bsd2
-igt@gem_ctx_create@active-default
-igt@gem_ctx_create@active-render
-igt@gem_ctx_create@active-vebox
-igt@gem_ctx_create@forked-active-blt
-igt@gem_ctx_create@forked-active-bsd
-igt@gem_ctx_create@forked-active-bsd1
-igt@gem_ctx_create@forked-active-bsd2
-igt@gem_ctx_create@forked-active-default
-igt@gem_ctx_create@forked-active-render
-igt@gem_ctx_create@forked-active-vebox
-igt@gem_ctx_create@hog-blt
-igt@gem_ctx_create@hog-bsd
-igt@gem_ctx_create@hog-bsd1
-igt@gem_ctx_create@hog-bsd2
-igt@gem_ctx_create@hog-render
-igt@gem_ctx_create@hog-vebox

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
