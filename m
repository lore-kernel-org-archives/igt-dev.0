Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 19 Aug 2020 00:46:50 -0000
Message-ID: <159779801029.23598.354609151993899928@emeril.freedesktop.org>
References: <20200818193528.986926-1-lyude@redhat.com>
In-Reply-To: <20200818193528.986926-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv2=2C1/2=5D_tests/kms=5Fpipe=5Fcrc=5F?=
 =?utf-8?q?basic=3A_Use_igt=5Fdisplay=5Frequire=5Foutput=5Fon=5Fpipe=28=29?=
 =?utf-8?q?_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0159114491=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lyude Paul <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0159114491==
Content-Type: multipart/alternative;
 boundary="===============5546598936464605676=="

--===============5546598936464605676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/2] tests/kms_pipe_crc_basic: Use igt_display_require_output_on_pipe() (rev2)
URL   : https://patchwork.freedesktop.org/series/80759/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8900_full -> IGTPW_4888_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/index.html

New tests
---------

  New tests have been introduced between CI_DRM_8900_full and IGTPW_4888_full:

### New IGT tests (4) ###

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a:
    - Statuses : 7 pass(s)
    - Exec time: [0.33, 1.50] s

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b:
    - Statuses : 7 pass(s)
    - Exec time: [0.39, 2.48] s

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.60] s

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 2.46] s

  

Known issues
------------

  Here are the changes found in IGTPW_4888_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@execbuf:
    - shard-hsw:          [PASS][1] -> [TIMEOUT][2] ([i915#1958])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-hsw6/igt@gem_eio@execbuf.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-hsw6/igt@gem_eio@execbuf.html
    - shard-snb:          [PASS][3] -> [TIMEOUT][4] ([i915#1958])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-snb2/igt@gem_eio@execbuf.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-snb5/igt@gem_eio@execbuf.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][5] -> [FAIL][6] ([i915#454])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [PASS][7] -> [WARN][8] ([i915#1515])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-tglb:         [PASS][9] -> [DMESG-WARN][10] ([i915#1982]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#49])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-iclb:         [PASS][13] -> [FAIL][14] ([i915#83])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-iclb2/igt@kms_panel_fitting@atomic-fastset.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-iclb3/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#1385])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-kbl2/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-kbl6/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109441]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-iclb8/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#62] / [i915#92]) +8 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#1542])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-iclb8/igt@perf@blocking-parameterized.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-iclb8/igt@perf@blocking-parameterized.html

  * igt@perf@create-destroy-userspace-config:
    - shard-glk:          [PASS][25] -> [SKIP][26] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-glk2/igt@perf@create-destroy-userspace-config.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-glk9/igt@perf@create-destroy-userspace-config.html
    - shard-apl:          [PASS][27] -> [SKIP][28] ([fdo#109271] / [i915#1635])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-apl7/igt@perf@create-destroy-userspace-config.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-apl4/igt@perf@create-destroy-userspace-config.html
    - shard-tglb:         [PASS][29] -> [SKIP][30] ([i915#405])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-tglb1/igt@perf@create-destroy-userspace-config.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-tglb3/igt@perf@create-destroy-userspace-config.html
    - shard-kbl:          [PASS][31] -> [SKIP][32] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-kbl6/igt@perf@create-destroy-userspace-config.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-kbl1/igt@perf@create-destroy-userspace-config.html
    - shard-hsw:          [PASS][33] -> [SKIP][34] ([fdo#109271])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-hsw4/igt@perf@create-destroy-userspace-config.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-hsw1/igt@perf@create-destroy-userspace-config.html
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([i915#405])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-iclb7/igt@perf@create-destroy-userspace-config.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-iclb6/igt@perf@create-destroy-userspace-config.html

  * igt@prime_busy@before@vecs0:
    - shard-hsw:          [PASS][37] -> [FAIL][38] ([i915#2258]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-hsw7/igt@prime_busy@before@vecs0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-hsw4/igt@prime_busy@before@vecs0.html

  
#### Possible fixes ####

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-glk:          [DMESG-WARN][39] ([i915#118] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-glk5/igt@gem_ctx_shared@q-smoketest-all.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-glk7/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-snb:          [TIMEOUT][41] ([i915#1958]) -> [PASS][42] +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-snb4/igt@gem_exec_suspend@basic-s3.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-snb2/igt@gem_exec_suspend@basic-s3.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][43] ([i915#1436] / [i915#1635] / [i915#716]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-apl3/igt@gen9_exec_parse@allowed-all.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-apl8/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - shard-tglb:         [DMESG-WARN][45] ([i915#1982]) -> [PASS][46] +4 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-tglb5/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-tglb2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][47] ([i915#79]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-kbl:          [DMESG-WARN][49] ([i915#1982]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [INCOMPLETE][51] ([i915#155]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +8 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane_cursor@pipe-a-primary-size-128:
    - shard-glk:          [DMESG-WARN][55] ([i915#1982]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-glk2/igt@kms_plane_cursor@pipe-a-primary-size-128.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-glk1/igt@kms_plane_cursor@pipe-a-primary-size-128.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][57] ([fdo#109441]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf@oa-exponents:
    - shard-hsw:          [INCOMPLETE][59] ([i915#1958]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-hsw1/igt@perf@oa-exponents.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-hsw7/igt@perf@oa-exponents.html

  * igt@prime_busy@hang-wait@bcs0:
    - shard-hsw:          [FAIL][61] ([i915#2258]) -> [PASS][62] +9 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-hsw4/igt@prime_busy@hang-wait@bcs0.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-hsw8/igt@prime_busy@hang-wait@bcs0.html

  
#### Warnings ####

  * igt@gem_exec_schedule@preemptive-hang:
    - shard-snb:          [TIMEOUT][63] ([i915#1958]) -> [SKIP][64] ([fdo#109271]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-snb4/igt@gem_exec_schedule@preemptive-hang.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-snb4/igt@gem_exec_schedule@preemptive-hang.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-hsw:          [SKIP][65] ([fdo#109271]) -> [TIMEOUT][66] ([i915#1958]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-hsw7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-hsw6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-kbl:          [FAIL][67] ([fdo#108145] / [i915#265]) -> [FAIL][68] ([fdo#108145] / [i915#1385] / [i915#265])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_psr@psr2_basic:
    - shard-snb:          [SKIP][69] ([fdo#109271]) -> [TIMEOUT][70] ([i915#1958]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-snb5/igt@kms_psr@psr2_basic.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-snb5/igt@kms_psr@psr2_basic.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][71], [FAIL][72]) ([i915#1958] / [i915#2283]) -> [FAIL][73] ([i915#2283])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-hsw1/igt@runner@aborted.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-hsw4/igt@runner@aborted.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-hsw8/igt@runner@aborted.html
    - shard-apl:          ([FAIL][74], [FAIL][75]) ([fdo#109271] / [i915#1635] / [i915#2110] / [i915#716]) -> [FAIL][76] ([i915#1635] / [i915#2110])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-apl3/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-apl3/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-apl4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1385]: https://gitlab.freedesktop.org/drm/intel/issues/1385
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2258]: https://gitlab.freedesktop.org/drm/intel/issues/2258
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5769 -> IGTPW_4888
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8900: 3dc196787bc40e012dece11fc052a4dd467bc421 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4888: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/index.html
  IGT_5769: 4e5f76be680b65780204668e302026cf638decc9 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/index.html

--===============5546598936464605676==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/2] tests/kms_pipe_crc_basic: Use igt_display_require_output_on_pipe() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/80759/">https://patchwork.freedesktop.org/series/80759/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8900_full -&gt; IGTPW_4888_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/index.html</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_8900_full and IGTPW_4888_full:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.33, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.39, 2.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 2.46] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4888_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_eio@execbuf:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-hsw6/igt@gem_eio@execbuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-hsw6/igt@gem_eio@execbuf.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-snb2/igt@gem_eio@execbuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-snb5/igt@gem_eio@execbuf.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-iclb1/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1515">i915#1515</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-iclb2/igt@kms_panel_fitting@atomic-fastset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-iclb3/igt@kms_panel_fitting@atomic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/83">i915#83</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-kbl2/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-kbl6/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1385">i915#1385</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-iclb8/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-iclb8/igt@perf@blocking-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-iclb8/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@create-destroy-userspace-config:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-glk2/igt@perf@create-destroy-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-glk9/igt@perf@create-destroy-userspace-config.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-apl7/igt@perf@create-destroy-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-apl4/igt@perf@create-destroy-userspace-config.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-tglb1/igt@perf@create-destroy-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-tglb3/igt@perf@create-destroy-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/405">i915#405</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-kbl6/igt@perf@create-destroy-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-kbl1/igt@perf@create-destroy-userspace-config.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-hsw4/igt@perf@create-destroy-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-hsw1/igt@perf@create-destroy-userspace-config.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-iclb7/igt@perf@create-destroy-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-iclb6/igt@perf@create-destroy-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/405">i915#405</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_busy@before@vecs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-hsw7/igt@prime_busy@before@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-hsw4/igt@prime_busy@before@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_shared@q-smoketest-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-glk5/igt@gem_ctx_shared@q-smoketest-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-glk7/igt@gem_ctx_shared@q-smoketest-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-snb4/igt@gem_exec_suspend@basic-s3.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-snb2/igt@gem_exec_suspend@basic-s3.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-apl3/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-apl8/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-tglb5/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-tglb2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-a-primary-size-128:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-glk2/igt@kms_plane_cursor@pipe-a-primary-size-128.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-glk1/igt@kms_plane_cursor@pipe-a-primary-size-128.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@oa-exponents:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-hsw1/igt@perf@oa-exponents.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-hsw7/igt@perf@oa-exponents.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_busy@hang-wait@bcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-hsw4/igt@prime_busy@hang-wait@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-hsw8/igt@prime_busy@hang-wait@bcs0.html">PASS</a> +9 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_schedule@preemptive-hang:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-snb4/igt@gem_exec_schedule@preemptive-hang.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-snb4/igt@gem_exec_schedule@preemptive-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-hsw7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-hsw6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1385">i915#1385</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-snb5/igt@kms_psr@psr2_basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-snb5/igt@kms_psr@psr2_basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-hsw1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-hsw4/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-hsw8/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8900/shard-apl3/igt@runner@aborted.html">FAIL</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/shard-apl4/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5769 -&gt; IGTPW_4888</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8900: 3dc196787bc40e012dece11fc052a4dd467bc421 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4888: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4888/index.html<br />
  IGT_5769: 4e5f76be680b65780204668e302026cf638decc9 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============5546598936464605676==--

--===============0159114491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0159114491==--
