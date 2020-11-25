Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 25 Nov 2020 12:29:31 -0000
Message-ID: <160630737106.8877.5187383009964718068@emeril.freedesktop.org>
References: <20201124232751.445582-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201124232751.445582-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tools/intel=5Fgpu=5Ftop=3A_Inc?=
 =?utf-8?q?lude_total_package_power_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1476398009=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1476398009==
Content-Type: multipart/alternative;
 boundary="===============6311333452931284674=="

--===============6311333452931284674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tools/intel_gpu_top: Include total package power (rev2)
URL   : https://patchwork.freedesktop.org/series/84235/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9389_full -> IGTPW_5224_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_5224_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5224_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5224_full:

### IGT changes ###

#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][1] ([i915#2681]) -> [WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html

  
Known issues
------------

  Here are the changes found in IGTPW_5224_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [PASS][3] -> [FAIL][4] ([i915#2389])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-iclb:         [PASS][5] -> [INCOMPLETE][6] ([i915#1185] / [i915#2369])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb2/igt@gem_exec_suspend@basic-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-iclb3/igt@gem_exec_suspend@basic-s3.html
    - shard-glk:          [PASS][7] -> [INCOMPLETE][8] ([i915#2369] / [i915#2635])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk7/igt@gem_exec_suspend@basic-s3.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-glk8/igt@gem_exec_suspend@basic-s3.html
    - shard-hsw:          [PASS][9] -> [INCOMPLETE][10] ([i915#1888] / [i915#2369] / [i915#2637])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw5/igt@gem_exec_suspend@basic-s3.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-hsw7/igt@gem_exec_suspend@basic-s3.html
    - shard-kbl:          [PASS][11] -> [INCOMPLETE][12] ([i915#155] / [i915#2369])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl6/igt@gem_exec_suspend@basic-s3.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-kbl2/igt@gem_exec_suspend@basic-s3.html
    - shard-apl:          [PASS][13] -> [INCOMPLETE][14] ([i915#1635] / [i915#2369] / [i915#2635])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl4/igt@gem_exec_suspend@basic-s3.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-apl6/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          [PASS][15] -> [INCOMPLETE][16] ([i915#2635])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk4/igt@i915_suspend@debugfs-reader.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-glk4/igt@i915_suspend@debugfs-reader.html
    - shard-apl:          [PASS][17] -> [INCOMPLETE][18] ([i915#1635] / [i915#2635])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl6/igt@i915_suspend@debugfs-reader.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-apl1/igt@i915_suspend@debugfs-reader.html
    - shard-iclb:         [PASS][19] -> [INCOMPLETE][20] ([i915#1185])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb8/igt@i915_suspend@debugfs-reader.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-iclb4/igt@i915_suspend@debugfs-reader.html
    - shard-kbl:          [PASS][21] -> [INCOMPLETE][22] ([i915#155])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl7/igt@i915_suspend@debugfs-reader.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-kbl6/igt@i915_suspend@debugfs-reader.html
    - shard-hsw:          [PASS][23] -> [INCOMPLETE][24] ([i915#2637])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw8/igt@i915_suspend@debugfs-reader.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-hsw2/igt@i915_suspend@debugfs-reader.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge:
    - shard-glk:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk7/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-glk7/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][27] -> [FAIL][28] ([i915#96])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#1982]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl6/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-kbl6/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#1635] / [i915#1982]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl1/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-apl7/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-tglb:         [PASS][33] -> [FAIL][34] ([i915#2346])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglb:         [PASS][35] -> [DMESG-WARN][36] ([i915#1982]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_plane_lowres@pipe-b-tiling-x:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#165] / [i915#78])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl6/igt@kms_plane_lowres@pipe-b-tiling-x.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-kbl2/igt@kms_plane_lowres@pipe-b-tiling-x.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-iclb4/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_universal_plane@universal-plane-pipe-a-functional:
    - shard-kbl:          [PASS][41] -> [FAIL][42] ([i915#331])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl2/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-kbl4/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
    - shard-apl:          [PASS][43] -> [FAIL][44] ([i915#1635] / [i915#331])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl2/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-apl4/igt@kms_universal_plane@universal-plane-pipe-a-functional.html

  * igt@kms_vblank@pipe-b-query-forked-busy:
    - shard-kbl:          [PASS][45] -> [DMESG-WARN][46] ([i915#78])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl7/igt@kms_vblank@pipe-b-query-forked-busy.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-kbl2/igt@kms_vblank@pipe-b-query-forked-busy.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-glk:          [INCOMPLETE][47] ([i915#2283] / [i915#2405]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk2/igt@device_reset@unbind-reset-rebind.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-glk5/igt@device_reset@unbind-reset-rebind.html
    - shard-apl:          [INCOMPLETE][49] ([i915#1635] / [i915#2283] / [i915#2405]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl6/igt@device_reset@unbind-reset-rebind.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-apl7/igt@device_reset@unbind-reset-rebind.html
    - shard-kbl:          [INCOMPLETE][51] ([i915#2283] / [i915#2405]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl6/igt@device_reset@unbind-reset-rebind.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-kbl1/igt@device_reset@unbind-reset-rebind.html
    - shard-tglb:         [INCOMPLETE][53] ([i915#1602] / [i915#750]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb3/igt@device_reset@unbind-reset-rebind.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-tglb7/igt@device_reset@unbind-reset-rebind.html
    - shard-iclb:         [INCOMPLETE][55] ([i915#2283] / [i915#2405]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb8/igt@device_reset@unbind-reset-rebind.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-iclb3/igt@device_reset@unbind-reset-rebind.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][57] ([i915#658]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb1/igt@feature_discovery@psr2.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-glk:          [DMESG-WARN][59] ([i915#118] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk4/igt@gem_exec_whisper@basic-fds-forked.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-glk1/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@i915_pm_backlight@fade_with_suspend:
    - shard-iclb:         [DMESG-WARN][61] -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb7/igt@i915_pm_backlight@fade_with_suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-iclb4/igt@i915_pm_backlight@fade_with_suspend.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][63] ([i915#454]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-iclb1/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-glk:          [SKIP][65] ([fdo#109271]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk6/igt@i915_pm_rpm@gem-execbuf-stress.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-glk8/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-apl:          [SKIP][67] ([fdo#109271] / [i915#1635]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl1/igt@i915_pm_rpm@gem-execbuf-stress.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-apl1/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-kbl:          [SKIP][69] ([fdo#109271]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl1/igt@i915_pm_rpm@gem-execbuf-stress.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-kbl3/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-hsw:          [SKIP][71] ([fdo#109271]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw4/igt@i915_pm_rpm@gem-execbuf-stress.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-hsw2/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@kms_busy@basic-modeset-pipe-c:
    - shard-hsw:          [DMESG-WARN][73] ([i915#44]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw4/igt@kms_busy@basic-modeset-pipe-c.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-hsw4/igt@kms_busy@basic-modeset-pipe-c.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:
    - shard-apl:          [DMESG-WARN][75] ([i915#1635] / [i915#1982]) -> [PASS][76] +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl3/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-apl7/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - shard-glk:          [DMESG-WARN][77] ([i915#1982]) -> [PASS][78] +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-glk6/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-glk:          [FAIL][79] ([i915#64]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk6/igt@kms_fbcon_fbt@fbc.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-glk1/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1:
    - shard-kbl:          [DMESG-WARN][81] ([i915#62]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl2/igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-kbl7/igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-tglb:         [DMESG-WARN][83] ([i915#1982]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][85] ([fdo#109441]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_vblank@pipe-b-wait-forked-busy:
    - shard-kbl:          [DMESG-WARN][87] ([i915#1982]) -> [PASS][88] +5 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl1/igt@kms_vblank@pipe-b-wait-forked-busy.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-kbl4/igt@kms_vblank@pipe-b-wait-forked-busy.html

  * igt@perf_pmu@module-unload:
    - shard-apl:          [DMESG-WARN][89] ([i915#1635] / [i915#1982] / [i915#262]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl3/igt@perf_pmu@module-unload.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-apl1/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-hsw:          [INCOMPLETE][91] ([i915#2283] / [i915#2405]) -> [WARN][92] ([i915#2283])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw6/igt@device_reset@unbind-reset-rebind.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-hsw5/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-tglb:         [DMESG-WARN][93] ([i915#2411]) -> [INCOMPLETE][94] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2369] / [i915#2411])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb2/igt@gem_exec_suspend@basic-s3.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-tglb7/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_pm_backlight@fade_with_suspend:
    - shard-tglb:         [DMESG-WARN][95] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -> [DMESG-WARN][96] ([i915#2411])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb5/igt@i915_pm_backlight@fade_with_suspend.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-tglb6/igt@i915_pm_backlight@fade_with_suspend.html

  * igt@i915_suspend@debugfs-reader:
    - shard-tglb:         [DMESG-WARN][97] ([i915#2411]) -> [INCOMPLETE][98] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411] / [i915#456])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb7/igt@i915_suspend@debugfs-reader.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-tglb5/igt@i915_suspend@debugfs-reader.html

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][99] ([i915#2283] / [i915#2295]) -> ([FAIL][100], [FAIL][101]) ([i915#2295])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw6/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-hsw7/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-hsw2/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][102], [FAIL][103], [FAIL][104]) ([i915#1814] / [i915#2283] / [i915#2295] / [i915#483]) -> ([FAIL][105], [FAIL][106], [FAIL][107]) ([i915#2295])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb3/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb8/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb7/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-iclb3/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-iclb2/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-iclb4/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][108], [FAIL][109], [FAIL][110]) ([i915#2295]) -> ([FAIL][111], [FAIL][112], [FAIL][113]) ([i915#1602] / [i915#2295])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb5/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb3/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb6/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-tglb8/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-tglb7/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-tglb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2369]: https://gitlab.freedesktop.org/drm/intel/issues/2369
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2597]: https://gitlab.freedesktop.org/drm/intel/issues/2597
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#750]: https://gitlab.freedesktop.org/drm/intel/issues/750
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5870 -> IGTPW_5224
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9389: b0c2cf3ad04abd9e7a44abe12e736bb5ab587393 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5224: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/index.html
  IGT_5870: 08b13995b85df26a77212e4fb21fd772976ef33c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/index.html

--===============6311333452931284674==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tools/intel=
_gpu_top: Include total package power (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84235/">https://patchwork.freedesktop.org/series/84235/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5224/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5224/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9389_full -&gt; IGTPW_5224_full</h=
1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_5224_full need to be verified<br=
 />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5224_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5224=
_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@i915_pm_rc6_residency@rc6-idle:<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/=
shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5224_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/=
shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9389/shard-iclb2/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-iclb3/=
igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1185">i915#1185</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2369">i915#2369</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9389/shard-glk7/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-glk8/ig=
t@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2369">i915#2369</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9389/shard-hsw5/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-hsw7/ig=
t@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1888">i915#1888</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2369">i915#2369</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9389/shard-kbl6/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-kbl2/ig=
t@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/155">i915#155</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2369">i915#2369</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9389/shard-apl4/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-apl6/ig=
t@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2369">i915#2369</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9389/shard-glk4/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-glk4/=
igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9389/shard-apl6/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-apl1/=
igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9389/shard-iclb8/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-iclb=
4/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9389/shard-kbl7/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-kbl6/=
igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9389/shard-hsw8/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-hsw2/=
igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-glk7/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5224/shard-glk7/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/19=
82">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5224/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/96=
">i915#96</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-kbl6/igt@kms_cursor_legacy@basic-flip-after-cursor-atomi=
c.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5224/shard-kbl6/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-apl1/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5224/shard-apl7/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5224/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346=
">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-sp=
r-indfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5224/shard-tglb5/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-spr-indfb-draw-mmap-gtt.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-x:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-kbl6/igt@kms_plane_lowres@pipe-b-tiling-x.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard=
-kbl2/igt@kms_plane_lowres@pipe-b-tiling-x.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard=
-iclb4/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> (<a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 simila=
r issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-a-functional:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9389/shard-kbl2/igt@kms_universal_plane@universal-plane-pipe-a-funct=
ional.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5224/shard-kbl4/igt@kms_universal_plane@universal-plane-pipe-a-fu=
nctional.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/331">i915#331</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9389/shard-apl2/igt@kms_universal_plane@universal-plane-pipe-a-funct=
ional.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5224/shard-apl4/igt@kms_universal_plane@universal-plane-pipe-a-fu=
nctional.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/331">i915#331</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-query-forked-busy:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-kbl7/igt@kms_vblank@pipe-b-query-forked-busy.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/sh=
ard-kbl2/igt@kms_vblank@pipe-b-query-forked-busy.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9389/shard-glk2/igt@device_reset@unbind-reset-rebind.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i91=
5#2283</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/240=
5">i915#2405</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5224/shard-glk5/igt@device_reset@unbind-reset-rebind.html">PASS</a><=
/p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9389/shard-apl6/igt@device_reset@unbind-reset-rebind.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i91=
5#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/228=
3">i915#2283</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2405">i915#2405</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5224/shard-apl7/igt@device_reset@unbind-reset-rebind.html">PAS=
S</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9389/shard-kbl6/igt@device_reset@unbind-reset-rebind.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i91=
5#2283</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/240=
5">i915#2405</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5224/shard-kbl1/igt@device_reset@unbind-reset-rebind.html">PASS</a><=
/p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9389/shard-tglb3/igt@device_reset@unbind-reset-rebind.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i9=
15#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/75=
0">i915#750</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5224/shard-tglb7/igt@device_reset@unbind-reset-rebind.html">PASS</a><=
/p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9389/shard-iclb8/igt@device_reset@unbind-reset-rebind.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i9=
15#2283</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/24=
05">i915#2405</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5224/shard-iclb3/igt@device_reset@unbind-reset-rebind.html">PASS</a=
></p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-iclb1/igt@feature_discovery@psr2.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-iclb=
2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-glk4/igt@gem_exec_whisper@basic-fds-forked.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i9=
15#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95"=
>i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5224/shard-glk1/igt@gem_exec_whisper@basic-fds-forked.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade_with_suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-iclb7/igt@i915_pm_backlight@fade_with_suspend.html">DMES=
G-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5224/shard-iclb4/igt@i915_pm_backlight@fade_with_suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-iclb1/ig=
t@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9389/shard-glk6/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/=
shard-glk8/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9389/shard-apl1/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i91=
5#1635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5224/shard-apl1/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9389/shard-kbl1/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/=
shard-kbl3/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9389/shard-hsw4/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/=
shard-hsw2/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-modeset-pipe-c:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-hsw4/igt@kms_busy@basic-modeset-pipe-c.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/44">i915#44=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/=
shard-hsw4/igt@kms_busy@basic-modeset-pipe-c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-apl3/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5224/shard-apl7/igt@kms_cursor_edge_walk@pipe-c-256x25=
6-left-edge.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-glk1/igt@kms_cursor_legacy@basic-flip-before-cursor-lega=
cy.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5224/shard-glk6/igt@kms_cursor_legacy@basic-flip-before-=
cursor-legacy.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-glk6/igt@kms_fbcon_fbt@fbc.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/64">i915#64</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-glk1/igt@kms=
_fbcon_fbt@fbc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-kbl2/igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/62">i915#62</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5224/shard-kbl7/igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pr=
i-indfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-tglb3/igt@kms_frontbuffer_t=
racking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/=
shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> +1 similar issu=
e</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-wait-forked-busy:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-kbl1/igt@kms_vblank@pipe-b-wait-forked-busy.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">=
i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5224/shard-kbl4/igt@kms_vblank@pipe-b-wait-forked-busy.html">PASS</a> +=
5 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-apl3/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1=
982</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/262">i=
915#262</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5224/shard-apl1/igt@perf_pmu@module-unload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-hsw6/igt@device_reset@unbind-reset-rebind.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i9=
15#2283</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/24=
05">i915#2405</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5224/shard-hsw5/igt@device_reset@unbind-reset-rebind.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#228=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-tglb2/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#241=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224=
/shard-tglb7/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#188=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2369">i9=
15#2369</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/24=
11">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade_with_suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-tglb5/igt@i915_pm_backlight@fade_with_suspend.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436=
">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1887">i915#1887</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5224/shard-tglb6/igt@i915_pm_backlight@fade_with_su=
spend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-tglb7/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2=
411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
24/shard-tglb5/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1887">i915=
#1887</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411=
">i915#2411</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/456">i915#456</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9389/shard-hsw6/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-hsw7/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5224/shard-hsw2/igt@runner@aborted.html">FAIL</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)<=
/p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-iclb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb8/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_9389/shard-iclb7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/s=
hard-iclb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5224/shard-iclb2/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-=
iclb4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2295">i915#2295</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9389/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb3/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_9389/shard-tglb6/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-tglb8/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5224/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/shard-tglb5/igt@runner=
@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2295">i915#2295</a>)</p>
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
<li>IGT: IGT_5870 -&gt; IGTPW_5224</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9389: b0c2cf3ad04abd9e7a44abe12e736bb5ab587393 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5224: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5224/index.htm=
l<br />
  IGT_5870: 08b13995b85df26a77212e4fb21fd772976ef33c @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============6311333452931284674==--

--===============1476398009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1476398009==--
