Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 24 Nov 2020 17:14:01 -0000
Message-ID: <160623804165.10862.6994339740290812877@emeril.freedesktop.org>
References: <20201124123251.4147819-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201124123251.4147819-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQ2FzdCBu?=
 =?utf-8?q?egative_debugfs_values_to_u64_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2146925998=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2146925998==
Content-Type: multipart/alternative;
 boundary="===============5764591090542970759=="

--===============5764591090542970759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Cast negative debugfs values to u64 (rev2)
URL   : https://patchwork.freedesktop.org/series/84214/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9382_full -> IGTPW_5217_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5217_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5217_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5217_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb8/igt@i915_pm_dc@dc5-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-iclb2/igt@i915_pm_dc@dc5-dpms.html
    - shard-glk:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk8/igt@i915_pm_dc@dc5-dpms.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-glk6/igt@i915_pm_dc@dc5-dpms.html
    - shard-kbl:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl3/igt@i915_pm_dc@dc5-dpms.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-kbl6/igt@i915_pm_dc@dc5-dpms.html
    - shard-tglb:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb6/igt@i915_pm_dc@dc5-dpms.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-tglb1/igt@i915_pm_dc@dc5-dpms.html

  * igt@perf_pmu@rc6-runtime-pm-long:
    - shard-iclb:         [PASS][9] -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb6/igt@perf_pmu@rc6-runtime-pm-long.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-iclb7/igt@perf_pmu@rc6-runtime-pm-long.html

  
Known issues
------------

  Here are the changes found in IGTPW_5217_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#2389])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#644])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#1635])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl1/igt@i915_pm_dc@dc5-dpms.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-apl8/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         [PASS][17] -> [WARN][18] ([i915#2681])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb7/igt@i915_pm_rc6_residency@rc6-fence.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-tglb3/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-kbl:          [PASS][19] -> [SKIP][20] ([fdo#109271]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl4/igt@i915_pm_rpm@dpms-non-lpsp.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-kbl1/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl7/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-kbl1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_color@pipe-b-legacy-gamma:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#71])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl3/igt@kms_color@pipe-b-legacy-gamma.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-kbl7/igt@kms_color@pipe-b-legacy-gamma.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#1635] / [i915#71])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl4/igt@kms_color@pipe-b-legacy-gamma.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-apl6/igt@kms_color@pipe-b-legacy-gamma.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge:
    - shard-glk:          [PASS][27] -> [DMESG-WARN][28] ([i915#1982]) +6 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk3/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-glk6/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#1635] / [i915#1982]) +4 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl4/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-apl6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [PASS][31] -> [FAIL][32] ([i915#2598])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#79]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][35] -> [INCOMPLETE][36] ([i915#155])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
    - shard-apl:          [PASS][37] -> [INCOMPLETE][38] ([i915#1635] / [i915#2635])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - shard-iclb:         [PASS][39] -> [INCOMPLETE][40] ([i915#1373])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb8/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-iclb2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          [PASS][41] -> [INCOMPLETE][42] ([i915#2635])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-glk6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-vga1:
    - shard-hsw:          [PASS][43] -> [INCOMPLETE][44] ([i915#2055] / [i915#2637])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-iclb:         [PASS][45] -> [DMESG-WARN][46] ([i915#1982]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-tglb:         [PASS][47] -> [DMESG-WARN][48] ([i915#1982]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#109642] / [fdo#111068])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-iclb8/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109441]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb2/igt@kms_psr@psr2_basic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-iclb3/igt@kms_psr@psr2_basic.html

  * igt@kms_vblank@pipe-c-accuracy-idle:
    - shard-glk:          [PASS][53] -> [FAIL][54] ([i915#43])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk6/igt@kms_vblank@pipe-c-accuracy-idle.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-glk4/igt@kms_vblank@pipe-c-accuracy-idle.html

  * igt@perf_pmu@rc6-runtime-pm-long:
    - shard-apl:          [PASS][55] -> [SKIP][56] ([fdo#109271] / [i915#1635]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl7/igt@perf_pmu@rc6-runtime-pm-long.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-apl8/igt@perf_pmu@rc6-runtime-pm-long.html
    - shard-glk:          [PASS][57] -> [SKIP][58] ([fdo#109271]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk8/igt@perf_pmu@rc6-runtime-pm-long.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-glk5/igt@perf_pmu@rc6-runtime-pm-long.html
    - shard-hsw:          [PASS][59] -> [SKIP][60] ([fdo#109271]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw2/igt@perf_pmu@rc6-runtime-pm-long.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-hsw5/igt@perf_pmu@rc6-runtime-pm-long.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-kbl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_eio@in-flight-1us:
    - shard-snb:          [FAIL][63] -> [PASS][64] +25 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb5/igt@gem_eio@in-flight-1us.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-snb2/igt@gem_eio@in-flight-1us.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-iclb:         [FAIL][65] -> [PASS][66] +26 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb5/igt@gem_eio@in-flight-contexts-1us.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-iclb5/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_eio@in-flight-internal-10ms:
    - shard-hsw:          [FAIL][67] -> [PASS][68] +27 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw1/igt@gem_eio@in-flight-internal-10ms.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-hsw4/igt@gem_eio@in-flight-internal-10ms.html

  * igt@gem_eio@in-flight-internal-immediate:
    - shard-tglb:         [FAIL][69] -> [PASS][70] +27 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb1/igt@gem_eio@in-flight-internal-immediate.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-tglb1/igt@gem_eio@in-flight-internal-immediate.html

  * igt@gem_eio@in-flight-suspend:
    - shard-snb:          [WARN][71] -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb7/igt@gem_eio@in-flight-suspend.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-snb4/igt@gem_eio@in-flight-suspend.html
    - shard-hsw:          [WARN][73] -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw4/igt@gem_eio@in-flight-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-hsw2/igt@gem_eio@in-flight-suspend.html
    - shard-kbl:          [WARN][75] -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl1/igt@gem_eio@in-flight-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-kbl3/igt@gem_eio@in-flight-suspend.html
    - shard-apl:          [WARN][77] ([i915#1635]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl4/igt@gem_eio@in-flight-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-apl1/igt@gem_eio@in-flight-suspend.html
    - shard-glk:          [WARN][79] -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk4/igt@gem_eio@in-flight-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-glk8/igt@gem_eio@in-flight-suspend.html
    - shard-iclb:         [WARN][81] -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb6/igt@gem_eio@in-flight-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-iclb5/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@unwedge-stress:
    - shard-glk:          [FAIL][83] -> [PASS][84] +25 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk9/igt@gem_eio@unwedge-stress.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-glk8/igt@gem_eio@unwedge-stress.html

  * igt@gem_eio@wait-1us:
    - shard-kbl:          [FAIL][85] -> [PASS][86] +27 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl3/igt@gem_eio@wait-1us.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-kbl3/igt@gem_eio@wait-1us.html

  * igt@gem_exec_capture@capture@rcs0:
    - shard-apl:          [FAIL][87] ([i915#1635]) -> [PASS][88] +26 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl3/igt@gem_exec_capture@capture@rcs0.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-apl1/igt@gem_exec_capture@capture@rcs0.html

  * {igt@gem_exec_capture@pi@rcs0}:
    - shard-iclb:         [INCOMPLETE][89] ([i915#2369] / [i915#2559]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb1/igt@gem_exec_capture@pi@rcs0.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-iclb4/igt@gem_exec_capture@pi@rcs0.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - shard-iclb:         [SKIP][91] -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb6/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-iclb7/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html

  * igt@i915_hangman@error-state-basic:
    - shard-snb:          [TIMEOUT][93] -> [PASS][94] +2 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb2/igt@i915_hangman@error-state-basic.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-snb4/igt@i915_hangman@error-state-basic.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][95] ([i915#454]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * {igt@kms_async_flips@test-time-stamp}:
    - shard-tglb:         [FAIL][97] ([i915#2597]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb8/igt@kms_async_flips@test-time-stamp.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-tglb5/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge:
    - shard-glk:          [DMESG-WARN][99] ([i915#1982]) -> [PASS][100] +5 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1:
    - shard-apl:          [DMESG-WARN][101] ([i915#1635] / [i915#1982]) -> [PASS][102] +4 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl1/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-apl1/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1:
    - shard-kbl:          [DMESG-WARN][103] ([i915#1982]) -> [PASS][104] +5 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-kbl3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [DMESG-WARN][105] ([i915#1982]) -> [PASS][106] +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence:
    - shard-hsw:          [DMESG-WARN][107] ([i915#1982]) -> [PASS][108] +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw6/igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-hsw2/igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][109] ([fdo#109441]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb4/igt@kms_psr@psr2_dpms.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-iclb2/igt@kms_psr@psr2_dpms.html

  * igt@perf@disabled-read-error:
    - shard-glk:          [SKIP][111] ([fdo#109271]) -> [PASS][112] +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk5/igt@perf@disabled-read-error.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-glk7/igt@perf@disabled-read-error.html
    - shard-apl:          [SKIP][113] ([fdo#109271] / [i915#1635]) -> [PASS][114] +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl8/igt@perf@disabled-read-error.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-apl3/igt@perf@disabled-read-error.html
    - shard-kbl:          [SKIP][115] ([fdo#109271]) -> [PASS][116] +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl4/igt@perf@disabled-read-error.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-kbl1/igt@perf@disabled-read-error.html
    - shard-tglb:         [SKIP][117] -> [PASS][118] +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb6/igt@perf@disabled-read-error.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-tglb7/igt@perf@disabled-read-error.html
    - shard-hsw:          [SKIP][119] ([fdo#109271]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw1/igt@perf@disabled-read-error.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-hsw5/igt@perf@disabled-read-error.html

  * igt@prime_vgem@coherency-blt:
    - shard-tglb:         [INCOMPLETE][121] -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb1/igt@prime_vgem@coherency-blt.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-tglb3/igt@prime_vgem@coherency-blt.html

  
#### Warnings ####

  * igt@gem_eio@in-flight-suspend:
    - shard-tglb:         [DMESG-FAIL][123] ([i915#2411]) -> [DMESG-WARN][124] ([i915#1037] / [i915#2411])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb2/igt@gem_eio@in-flight-suspend.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-tglb6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-snb:          [TIMEOUT][125] -> [SKIP][126] ([fdo#109271]) +2 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb2/igt@gem_exec_schedule@preempt-queue.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-snb4/igt@gem_exec_schedule@preempt-queue.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][127] ([i915#2684]) -> [WARN][128] ([i915#2681] / [i915#2684])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         [SKIP][129] ([fdo#111644] / [i915#1397] / [i915#2411]) -> [SKIP][130] ([i915#579])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb8/igt@i915_pm_rpm@dpms-non-lpsp.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-tglb8/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         [SKIP][131] ([fdo#110892]) -> [SKIP][132] ([i915#579])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb4/igt@i915_pm_rpm@dpms-non-lpsp.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-iclb7/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_suspend@sysfs-reader:
    - shard-tglb:         [INCOMPLETE][133] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411] / [i915#456]) -> [DMESG-WARN][134] ([i915#2411])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb7/igt@i915_suspend@sysfs-reader.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-tglb5/igt@i915_suspend@sysfs-reader.html

  * igt@kms_color_chamelium@pipe-b-ctm-negative:
    - shard-snb:          [TIMEOUT][135] -> [SKIP][136] ([fdo#109271] / [fdo#111827])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb2/igt@kms_color_chamelium@pipe-b-ctm-negative.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-snb4/igt@kms_color_chamelium@pipe-b-ctm-negative.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - shard-tglb:         [DMESG-WARN][137] ([i915#2411]) -> [DMESG-WARN][138] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb3/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:
    - shard-tglb:         [DMESG-WARN][139] ([i915#2411]) -> [INCOMPLETE][140] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#2248])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb3/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][141] ([i915#2295]) -> [FAIL][142] ([i915#2295] / [i915#483])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl7/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-kbl1/igt@runner@aborted.html
    - shard-glk:          ([FAIL][143], [FAIL][144]) ([i915#1814] / [i915#2295] / [i915#483] / [k.org#202321]) -> ([FAIL][145], [FAIL][146]) ([i915#2295] / [i915#483] / [k.org#202321])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk7/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk8/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-glk6/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-glk7/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150]) ([i915#1602] / [i915#1814] / [i915#2295] / [i915#2426] / [i915#409]) -> ([FAIL][151], [FAIL][152]) ([i915#2248] / [i915#2295])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb5/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb6/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb1/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb7/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-tglb7/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-tglb1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1037]: https://gitlab.freedesktop.org/drm/intel/issues/1037
  [i915#1373]: https://gitlab.freedesktop.org/drm/intel/issues/1373
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2248]: https://gitlab.freedesktop.org/drm/intel/issues/2248
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2369]: https://gitlab.freedesktop.org/drm/intel/issues/2369
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2559]: https://gitlab.freedesktop.org/drm/intel/issues/2559
  [i915#2597]: https://gitlab.freedesktop.org/drm/intel/issues/2597
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
  [i915#43]: https://gitlab.freedesktop.org/drm/intel/issues/43
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5869 -> IGTPW_5217
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9382: ac60f3f3090115d21f028bffa2dcfb67f695c4f2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5217: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/index.html
  IGT_5869:

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/index.html

--===============5764591090542970759==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>Cast negative debugfs values to u64 (rev2)</=
td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84214/">https://patchwork.freedesktop.org/series/84214/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5217/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5217/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9382_full -&gt; IGTPW_5217_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5217_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5217_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5217=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc5-dpms:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-iclb8/igt@i915_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-iclb2/igt@i9=
15_pm_dc@dc5-dpms.html">FAIL</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-glk8/igt@i915_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-glk6/igt@i915=
_pm_dc@dc5-dpms.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-kbl3/igt@i915_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-kbl6/igt@i915=
_pm_dc@dc5-dpms.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-tglb6/igt@i915_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-tglb1/igt@i9=
15_pm_dc@dc5-dpms.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-runtime-pm-long:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb6/igt@perf_pmu@rc6-runtime-pm-long.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-ic=
lb7/igt@perf_pmu@rc6-runtime-pm-long.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5217_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/=
shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@flink-and-close-vma-leak:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/sha=
rd-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/644">i915#644</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-apl1/igt@i915_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-apl8/igt@i91=
5_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb7/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard=
-tglb3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-kbl4/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-kbl1/i=
gt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-kbl7/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/sha=
rd-kbl1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +=
3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-legacy-gamma:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-kbl3/igt@kms_color@pipe-b-legacy-gamma.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-kbl=
7/igt@kms_color@pipe-b-legacy-gamma.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/71">i915#71</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-apl4/igt@kms_color@pipe-b-legacy-gamma.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-apl=
6/igt@kms_color@pipe-b-legacy-gamma.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/71">i915#71</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-glk3/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5217/shard-glk6/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982=
">i915#1982</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-apl4/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-u=
ntiled.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5217/shard-apl6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gt=
t-untiled.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
a-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5217/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2598">i915#2598</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
217/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a=
>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5217/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/155=
">i915#155</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5217/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/163=
5">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2635">i915#2635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb8/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5217/shard-iclb2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1373">i915#1373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-glk6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a=
1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5217/shard-glk6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2635">i915#2635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-vga1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5217/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2055">i915#2055</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2637">i915#2637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pr=
i-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5217/shard-iclb3/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombus=
y.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5217/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-iclb8/i=
gt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb2/igt@kms_psr@psr2_basic.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-iclb3/igt@km=
s_psr@psr2_basic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-accuracy-idle:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-glk6/igt@kms_vblank@pipe-c-accuracy-idle.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-=
glk4/igt@kms_vblank@pipe-c-accuracy-idle.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/43">i915#43</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-runtime-pm-long:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-apl7/igt@perf_pmu@rc6-runtime-pm-long.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-apl8=
/igt@perf_pmu@rc6-runtime-pm-long.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +1 similar i=
ssue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-glk8/igt@perf_pmu@rc6-runtime-pm-long.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-glk5=
/igt@perf_pmu@rc6-runtime-pm-long.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</=
p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-hsw2/igt@perf_pmu@rc6-runtime-pm-long.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-hsw5=
/igt@perf_pmu@rc6-runtime-pm-long.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</=
p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vecs0.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5217/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vecs0.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-1us:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-snb5/igt@gem_eio@in-flight-1us.html">FAIL</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-snb2/igt@g=
em_eio@in-flight-1us.html">PASS</a> +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb5/igt@gem_eio@in-flight-contexts-1us.html">FAIL</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-=
iclb5/igt@gem_eio@in-flight-contexts-1us.html">PASS</a> +26 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-internal-10ms:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-hsw1/igt@gem_eio@in-flight-internal-10ms.html">FAIL</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-=
hsw4/igt@gem_eio@in-flight-internal-10ms.html">PASS</a> +27 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-internal-immediate:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb1/igt@gem_eio@in-flight-internal-immediate.html">FAI=
L</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/=
shard-tglb1/igt@gem_eio@in-flight-internal-immediate.html">PASS</a> +27 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-snb7/igt@gem_eio@in-flight-suspend.html">WARN</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-snb4/ig=
t@gem_eio@in-flight-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-hsw4/igt@gem_eio@in-flight-suspend.html">WARN</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-hsw2/ig=
t@gem_eio@in-flight-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-kbl1/igt@gem_eio@in-flight-suspend.html">WARN</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-kbl3/ig=
t@gem_eio@in-flight-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-apl4/igt@gem_eio@in-flight-suspend.html">WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-a=
pl1/igt@gem_eio@in-flight-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-glk4/igt@gem_eio@in-flight-suspend.html">WARN</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-glk8/ig=
t@gem_eio@in-flight-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-iclb6/igt@gem_eio@in-flight-suspend.html">WARN</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-iclb5/=
igt@gem_eio@in-flight-suspend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-glk9/igt@gem_eio@unwedge-stress.html">FAIL</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-glk8/igt@=
gem_eio@unwedge-stress.html">PASS</a> +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@wait-1us:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-kbl3/igt@gem_eio@wait-1us.html">FAIL</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-kbl3/igt@gem_=
eio@wait-1us.html">PASS</a> +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-apl3/igt@gem_exec_capture@capture@rcs0.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/sh=
ard-apl1/igt@gem_exec_capture@capture@rcs0.html">PASS</a> +26 similar issue=
s</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_capture@pi@rcs0}:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb1/igt@gem_exec_capture@pi@rcs0.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2369">i915#2369=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2559">i91=
5#2559</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5217/shard-iclb4/igt@gem_exec_capture@pi@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb6/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html"=
>SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
217/shard-iclb7/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">PASS</a>=
 +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@error-state-basic:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-snb2/igt@i915_hangman@error-state-basic.html">TIMEOUT</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shar=
d-snb4/igt@i915_hangman@error-state-basic.html">PASS</a> +2 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-iclb8/ig=
t@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@test-time-stamp}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb8/igt@kms_async_flips@test-time-stamp.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2597">i915#259=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217=
/shard-tglb5/igt@kms_async_flips@test-time-stamp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5217/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-64x64-right-e=
dge.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-apl1/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5217/shard-apl1/igt@kms_flip@absolute-wf_vblank-inte=
rruptible@a-dp1.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-kbl7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5217/shard-kbl3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.ht=
ml">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-stridechange.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5217/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-stridechange.=
html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-hsw6/igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequen=
ce.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5217/shard-hsw2/igt@kms_pipe_crc_basic@read-crc-pipe-b-f=
rame-sequence.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb4/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-iclb2=
/igt@kms_psr@psr2_dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@disabled-read-error:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-glk5/igt@perf@disabled-read-error.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-=
glk7/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-apl8/igt@perf@disabled-read-error.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/=
shard-apl3/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-kbl4/igt@perf@disabled-read-error.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-=
kbl1/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-tglb6/igt@perf@disabled-read-error.html">SKIP</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-tglb7/i=
gt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-hsw1/igt@perf@disabled-read-error.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-=
hsw5/igt@perf@disabled-read-error.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-blt:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb1/igt@prime_vgem@coherency-blt.html">INCOMPLETE</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-=
tglb3/igt@prime_vgem@coherency-blt.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb2/igt@gem_eio@in-flight-suspend.html">DMESG-FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#241=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217=
/shard-tglb6/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1037">i915#1037</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-snb2/igt@gem_exec_schedule@preempt-queue.html">TIMEOUT</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/sha=
rd-snb4/igt@gem_exec_schedule@preempt-queue.html">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +2 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#268=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217=
/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)=
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-tglb8/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111644">fdo#111644</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#13=
97</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i=
915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5217/shard-tglb8/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-iclb4/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110892">fdo#110892</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shar=
d-iclb7/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb7/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#143=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i9=
15#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/18=
87">i915#1887</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2411">i915#2411</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/456">i915#456</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5217/shard-tglb5/igt@i915_suspend@sysfs-reader.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411=
">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-negative:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-snb2/igt@kms_color_chamelium@pipe-b-ctm-negative.html">T=
IMEOUT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5217/shard-snb4/igt@kms_color_chamelium@pipe-b-ctm-negative.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">=
fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb3/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5217/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible=
@a-edp1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1887">i915#1887</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb3/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5217/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible=
@b-edp1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1798">i915#1798</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1982">i915#1982</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2248">i915#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-kbl7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-kbl1/igt@run=
ner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-glk7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk8/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/483">i915#483</a> / <a href=3D"https://bugzilla.kernel.org/=
show_bug.cgi?id=3D202321">k.org#202321</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-glk6/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/sh=
ard-glk7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/483">i915#483</a> / <a href=3D"https://b=
ugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb6/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_9382/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb7/igt@runner@aborte=
d.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2426">i915#2426</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/409">i915#409</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/shard-tglb7/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217=
/shard-tglb1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2248">i915#2248</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5869 -&gt; IGTPW_5217</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9382: ac60f3f3090115d21f028bffa2dcfb67f695c4f2 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5217: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5217/index.htm=
l<br />
  IGT_5869:</p>

</body>
</html>

--===============5764591090542970759==--

--===============2146925998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2146925998==--
