Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 02 Jul 2020 09:35:48 -0000
Message-ID: <159368254884.5655.14799178929766667026@emeril.freedesktop.org>
References: <20200702045307.19202-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200702045307.19202-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fkms=3A_Add_support_for_display_with_=28rev4=29?=
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
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_kms: Add support for display with (rev4)
URL   : https://patchwork.freedesktop.org/series/78482/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8691_full -> IGTPW_4726_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4726_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4726_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4726_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-fences-interruptible@a-hdmi-a1:
    - shard-hsw:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-hsw7/igt@kms_flip@flip-vs-fences-interruptible@a-hdmi-a1.html

  * igt@kms_lease@simple_lease:
    - shard-apl:          [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl4/igt@kms_lease@simple_lease.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-apl8/igt@kms_lease@simple_lease.html
    - shard-iclb:         [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-iclb8/igt@kms_lease@simple_lease.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-iclb3/igt@kms_lease@simple_lease.html
    - shard-glk:          [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-glk8/igt@kms_lease@simple_lease.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-glk9/igt@kms_lease@simple_lease.html
    - shard-hsw:          [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-hsw1/igt@kms_lease@simple_lease.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-hsw6/igt@kms_lease@simple_lease.html
    - shard-kbl:          [PASS][10] -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl4/igt@kms_lease@simple_lease.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-kbl6/igt@kms_lease@simple_lease.html
    - shard-snb:          [PASS][12] -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-snb4/igt@kms_lease@simple_lease.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-snb4/igt@kms_lease@simple_lease.html
    - shard-tglb:         [PASS][14] -> [FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-tglb7/igt@kms_lease@simple_lease.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-tglb2/igt@kms_lease@simple_lease.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-iclb:         NOTRUN -> [SKIP][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-iclb3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  
#### Warnings ####

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglb:         [SKIP][17] ([i915#1839]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-tglb2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-tglb8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  
Known issues
------------

  Here are the changes found in IGTPW_4726_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@throttle:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#93] / [i915#95]) +42 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl1/igt@gem_eio@throttle.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-kbl3/igt@gem_eio@throttle.html

  * igt@gem_exec_balancer@individual:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1635] / [i915#95]) +32 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl7/igt@gem_exec_balancer@individual.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-apl6/igt@gem_exec_balancer@individual.html

  * igt@gem_exec_whisper@basic-queues:
    - shard-glk:          [PASS][23] -> [DMESG-WARN][24] ([i915#118] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-glk2/igt@gem_exec_whisper@basic-queues.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-glk6/igt@gem_exec_whisper@basic-queues.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [PASS][25] -> [DMESG-WARN][26] ([i915#402]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-tglb3/igt@i915_module_load@reload.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-tglb3/igt@i915_module_load@reload.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-iclb:         [PASS][27] -> [INCOMPLETE][28] ([i915#926])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-iclb6/igt@i915_module_load@reload-with-fault-injection.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-iclb2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [PASS][29] -> [SKIP][30] ([i915#1904])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-hsw:          [PASS][31] -> [WARN][32] ([i915#1519])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-hsw8/igt@i915_pm_rc6_residency@rc6-fence.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-hsw4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-apl:          [PASS][33] -> [DMESG-FAIL][34] ([i915#1635] / [i915#95]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:
    - shard-glk:          [PASS][35] -> [TIMEOUT][36] ([i915#1958] / [i915#2119]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-glk4/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-glk4/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled:
    - shard-apl:          [PASS][37] -> [DMESG-WARN][38] ([i915#1982])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-apl6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][39] -> [DMESG-FAIL][40] ([fdo#108145] / [i915#54] / [i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][41] -> [DMESG-FAIL][42] ([fdo#108145] / [i915#1635] / [i915#54] / [i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1:
    - shard-kbl:          [PASS][43] -> [DMESG-WARN][44] ([i915#1982])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-kbl6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][45] -> [DMESG-WARN][46] ([i915#180]) +4 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         [PASS][47] -> [SKIP][48] ([i915#668]) +4 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][49] -> [DMESG-FAIL][50] ([i915#95]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][51] -> [INCOMPLETE][52] ([i915#155] / [i915#648])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_universal_plane@universal-plane-pipe-d-sanity:
    - shard-tglb:         [PASS][53] -> [DMESG-WARN][54] ([i915#1982])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-tglb1/igt@kms_universal_plane@universal-plane-pipe-d-sanity.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-tglb3/igt@kms_universal_plane@universal-plane-pipe-d-sanity.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@engines-mixed-process@vecs0:
    - shard-kbl:          [FAIL][55] ([i915#1528]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl7/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-kbl3/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [FAIL][57] ([i915#1930]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-glk8/igt@gem_exec_reloc@basic-concurrent0.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-glk8/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-glk:          [DMESG-WARN][59] ([i915#118] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-glk5/igt@gem_exec_whisper@basic-forked.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-glk1/igt@gem_exec_whisper@basic-forked.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy:
    - shard-hsw:          [TIMEOUT][61] ([i915#1958] / [i915#2119]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-hsw2/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-hsw4/igt@gem_mmap_gtt@cpuset-basic-small-copy.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-tglb:         [DMESG-WARN][63] ([i915#402]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-tglb5/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-tglb3/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@kms_addfb_basic@size-max:
    - shard-kbl:          [DMESG-WARN][65] ([i915#93] / [i915#95]) -> [PASS][66] +44 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl7/igt@kms_addfb_basic@size-max.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-kbl7/igt@kms_addfb_basic@size-max.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [DMESG-FAIL][67] ([i915#118] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-glk2/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][69] ([i915#1982]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl6/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-apl4/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-apl:          [DMESG-WARN][71] ([i915#1635] / [i915#95]) -> [PASS][72] +36 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [DMESG-FAIL][73] ([i915#54] / [i915#95]) -> [PASS][74] +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-random:
    - shard-glk:          [DMESG-FAIL][75] ([i915#1982] / [i915#54]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-hsw:          [FAIL][77] ([i915#57]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@pipe-a-single-bo:
    - shard-glk:          [DMESG-WARN][79] ([i915#1982]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-glk4/igt@kms_cursor_legacy@pipe-a-single-bo.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-glk5/igt@kms_cursor_legacy@pipe-a-single-bo.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled:
    - shard-glk:          [DMESG-FAIL][81] ([i915#118] / [i915#1982] / [i915#54] / [i915#95]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-glk4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-glk4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-iclb:         [INCOMPLETE][83] ([i915#1185]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-iclb2/igt@kms_fbcon_fbt@psr-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-iclb5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
    - shard-apl:          [FAIL][85] ([i915#79]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack:
    - shard-tglb:         [DMESG-WARN][87] ([i915#1982]) -> [PASS][88] +5 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack.html
    - shard-kbl:          [DMESG-WARN][89] ([i915#1982]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-iclb:         [DMESG-WARN][91] ([i915#1982]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-glk:          [DMESG-FAIL][93] ([i915#118] / [i915#1982] / [i915#49] / [i915#95]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-iclb:         [INCOMPLETE][95] ([i915#1185] / [i915#250]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-iclb5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [DMESG-FAIL][97] ([i915#1635] / [i915#95]) -> [PASS][98] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-apl2/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
    - shard-kbl:          [DMESG-FAIL][99] ([i915#95]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][101] ([fdo#109441]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-iclb8/igt@kms_psr@psr2_no_drrs.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][103] ([i915#31]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-hsw4/igt@kms_setmode@basic.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-hsw8/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][105] ([i915#180]) -> [PASS][106] +3 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@busy-double-start@vcs0:
    - shard-hsw:          [FAIL][107] ([i915#1958]) -> [PASS][108] +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-hsw2/igt@perf_pmu@busy-double-start@vcs0.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-hsw2/igt@perf_pmu@busy-double-start@vcs0.html

  * igt@perf_pmu@busy-double-start@vecs0:
    - shard-hsw:          [DMESG-FAIL][109] ([i915#2119]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-hsw2/igt@perf_pmu@busy-double-start@vecs0.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-hsw2/igt@perf_pmu@busy-double-start@vecs0.html

  * igt@sysfs_timeslice_duration@timeout@vecs0:
    - shard-glk:          [INCOMPLETE][111] ([i915#58] / [k.org#198133]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-glk4/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-glk2/igt@sysfs_timeslice_duration@timeout@vecs0.html
    - shard-apl:          [FAIL][113] ([i915#1732]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl6/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-apl6/igt@sysfs_timeslice_duration@timeout@vecs0.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-glk:          [INCOMPLETE][115] ([i915#1958] / [i915#58] / [k.org#198133]) -> [TIMEOUT][116] ([i915#1958] / [i915#2119])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-glk4/igt@gem_exec_reloc@basic-concurrent16.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-glk4/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-apl:          [SKIP][117] ([fdo#109271]) -> [SKIP][118] ([fdo#109271] / [i915#1635]) +15 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl3/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-apl6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         [SKIP][119] ([fdo#109278] / [fdo#112010] / [i915#1149]) -> [SKIP][120] ([fdo#109278] / [i915#1149]) +7 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-iclb6/igt@kms_color@pipe-d-ctm-0-25.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-iclb4/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [TIMEOUT][121] ([i915#1319] / [i915#2119]) -> [TIMEOUT][122] ([i915#1319] / [i915#1958] / [i915#2119])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl6/igt@kms_content_protection@lic.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-kbl7/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [FAIL][123] ([fdo#110321]) -> [DMESG-FAIL][124] ([fdo#110321] / [i915#1635] / [i915#95])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl4/igt@kms_content_protection@srm.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-apl7/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:
    - shard-iclb:         [SKIP][125] ([fdo#109279]) -> [SKIP][126] ([fdo#109278] / [fdo#109279]) +21 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
    - shard-iclb:         [SKIP][127] ([fdo#109278] / [fdo#112010] / [i915#508]) -> [SKIP][128] ([fdo#109278])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-iclb5/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-iclb:         [SKIP][129] ([fdo#109274]) -> [SKIP][130] ([fdo#109274] / [fdo#109278]) +23 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-iclb8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-iclb6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@pipe-d-single-move:
    - shard-iclb:         [SKIP][131] ([fdo#109278] / [fdo#112010]) -> [SKIP][132] ([fdo#109278]) +69 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-iclb4/igt@kms_cursor_legacy@pipe-d-single-move.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-iclb1/igt@kms_cursor_legacy@pipe-d-single-move.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - shard-tglb:         [FAIL][133] ([i915#1928]) -> [DMESG-WARN][134] ([i915#1982])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-tglb6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-tglb3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-farfromfence:
    - shard-apl:          [SKIP][135] ([fdo#109271] / [i915#1635]) -> [SKIP][136] ([fdo#109271]) +8 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl7/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-apl3/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-glk:          [SKIP][137] ([fdo#109271]) -> [TIMEOUT][138] ([i915#1958] / [i915#2119])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-glk8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-glk4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-none:
    - shard-hsw:          [TIMEOUT][139] ([i915#1958] / [i915#2119]) -> [SKIP][140] ([fdo#109271]) +1 similar issue
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-hsw2/igt@kms_plane_multiple@atomic-pipe-d-tiling-none.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-hsw4/igt@kms_plane_multiple@atomic-pipe-d-tiling-none.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         [SKIP][141] ([fdo#112025] / [fdo#112054]) -> [SKIP][142] ([fdo#112054])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-tglb6/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-tglb2/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-tglb:         [SKIP][143] ([fdo#111825] / [fdo#112015]) -> [SKIP][144] ([fdo#111825])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-tglb3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-tglb6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][145], [FAIL][146]) ([i915#2110]) -> [FAIL][147] ([i915#1436] / [i915#2110])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-hsw7/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-hsw7/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-hsw1/igt@runner@aborted.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#112010]: https://bugs.freedesktop.org/show_bug.cgi?id=112010
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112025]: https://bugs.freedesktop.org/show_bug.cgi?id=112025
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1732]: https://gitlab.freedesktop.org/drm/intel/issues/1732
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1904]: https://gitlab.freedesktop.or

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
