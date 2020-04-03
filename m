Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 03 Apr 2020 23:16:40 -0000
Message-ID: <158595580030.13349.15437988201142269360@emeril.freedesktop.org>
References: <20200403132414.920346-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200403132414.920346-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliOiBC?=
 =?utf-8?q?ump_estimates_for_object_overhead?=
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

Series: lib: Bump estimates for object overhead
URL   : https://patchwork.freedesktop.org/series/75462/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8245_full -> IGTPW_4404_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4404_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4404_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4404_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd2:
    - shard-tglb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-tglb3/igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd2.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-tglb8/igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd2.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8245_full and IGTPW_4404_full:

### New IGT tests (9) ###

  * igt@perf_pmu@faulting-read:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_busy@after:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_busy@after-wait:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_busy@before:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_busy@hang:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_busy@hang-wait:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_vgem@busy:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_vgem@fence-wait:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_vgem@sync:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_4404_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-mixed-process@rcs0:
    - shard-apl:          [PASS][3] -> [FAIL][4] ([i915#1528])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-apl7/igt@gem_ctx_persistence@engines-mixed-process@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-apl4/igt@gem_ctx_persistence@engines-mixed-process@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-iclb:         [PASS][5] -> [INCOMPLETE][6] ([i915#1318])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-iclb4/igt@gem_exec_whisper@basic-contexts-forked.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-iclb7/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@gem_mmap_gtt@hang:
    - shard-iclb:         [PASS][7] -> [FAIL][8] ([i915#1621])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-iclb1/igt@gem_mmap_gtt@hang.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-iclb8/igt@gem_mmap_gtt@hang.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-apl:          [PASS][9] -> [FAIL][10] ([i915#1618])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-apl4/igt@gem_tiled_swapping@non-threaded.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-apl7/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          [PASS][11] -> [INCOMPLETE][12] ([i915#155])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-kbl4/igt@gem_workarounds@suspend-resume.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-kbl3/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#716])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-glk9/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#454])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-snb:          [PASS][17] -> [FAIL][18] ([i915#1066])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-snb5/igt@i915_pm_rc6_residency@rc6-idle.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-snb5/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@cursor-dpms:
    - shard-tglb:         [PASS][19] -> [SKIP][20] ([i915#1316] / [i915#579])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-tglb6/igt@i915_pm_rpm@cursor-dpms.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-tglb8/igt@i915_pm_rpm@cursor-dpms.html
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([i915#1316] / [i915#579])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-iclb3/igt@i915_pm_rpm@cursor-dpms.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-iclb2/igt@i915_pm_rpm@cursor-dpms.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#1119] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-apl6/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-apl1/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#1119] / [i915#93] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-kbl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-kbl1/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#54] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
    - shard-apl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180]) +4 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-top-edge:
    - shard-hsw:          [PASS][35] -> [INCOMPLETE][36] ([i915#61])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-hsw6/igt@kms_cursor_edge_walk@pipe-c-256x256-top-edge.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-hsw4/igt@kms_cursor_edge_walk@pipe-c-256x256-top-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][37] -> [FAIL][38] ([i915#57])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [PASS][39] -> [FAIL][40] ([i915#52] / [i915#54]) +5 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][41] -> [FAIL][42] ([i915#52] / [i915#54] / [i915#95]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [PASS][43] -> [FAIL][44] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-glk:          [PASS][45] -> [FAIL][46] ([i915#49])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-apl:          [PASS][47] -> [FAIL][48] ([i915#53] / [i915#95])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-apl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-apl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [PASS][49] -> [FAIL][50] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [PASS][51] -> [FAIL][52] ([fdo#108145] / [i915#265] / [i915#95])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][53] -> [SKIP][54] ([fdo#109441])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-iclb8/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][55] -> [FAIL][56] ([i915#31])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-apl4/igt@kms_setmode@basic.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-apl6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:
    - shard-hsw:          [PASS][57] -> [SKIP][58] ([fdo#109271]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-hsw6/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-hsw4/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-glk:          [PASS][59] -> [SKIP][60] ([fdo#109271]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-glk3/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-glk9/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-iclb:         [PASS][61] -> [SKIP][62] ([fdo#109278])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-iclb7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-iclb2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-tglb:         [PASS][63] -> [SKIP][64] ([fdo#112015])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-tglb5/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-tglb8/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@vcs0}:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-apl:          [INCOMPLETE][67] ([i915#1291]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-apl1/igt@gem_ctx_persistence@close-replace-race.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-apl3/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [FAIL][69] ([i915#1277]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-tglb1/igt@gem_exec_balancer@hang.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-tglb6/igt@gem_exec_balancer@hang.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-glk:          [FAIL][71] ([i915#307]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-glk4/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-glk5/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-apl:          [FAIL][73] ([i915#307]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-apl6/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-apl1/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-hsw:          [FAIL][75] ([i915#1618]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-hsw1/igt@gem_tiled_swapping@non-threaded.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-hsw2/igt@gem_tiled_swapping@non-threaded.html
    - shard-kbl:          [FAIL][77] ([i915#1618]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-kbl4/igt@gem_tiled_swapping@non-threaded.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-kbl6/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [FAIL][79] ([i915#1066]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
    - shard-kbl:          [FAIL][81] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
    - shard-apl:          [FAIL][83] ([i915#54] / [i915#95]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:
    - shard-kbl:          [FAIL][85] ([i915#54]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
    - shard-apl:          [FAIL][87] ([i915#54]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled:
    - shard-glk:          [FAIL][89] ([i915#52] / [i915#54]) -> [PASS][90] +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [FAIL][91] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [FAIL][93] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-glk:          [FAIL][95] ([i915#49]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-apl:          [DMESG-WARN][97] ([i915#180]) -> [PASS][98] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-apl1/igt@kms_hdr@bpc-switch-suspend.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-apl3/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][99] ([fdo#109441]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-iclb4/igt@kms_psr@psr2_cursor_render.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_universal_plane@universal-plane-pipe-c-functional:
    - shard-glk:          [FAIL][101] ([i915#331]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-glk2/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-glk2/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
    - shard-kbl:          [FAIL][103] ([i915#331]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-kbl6/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-kbl3/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
    - shard-apl:          [FAIL][105] ([i915#331]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-apl1/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-apl7/igt@kms_universal_plane@universal-plane-pipe-c-functional.html

  * {igt@perf@blocking-parameterized}:
    - shard-hsw:          [FAIL][107] ([i915#1542]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-hsw6/igt@perf@blocking-parameterized.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-hsw2/igt@perf@blocking-parameterized.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [FAIL][109] ([i915#1085]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-tglb5/igt@perf@gen12-mi-rpc.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-tglb8/igt@perf@gen12-mi-rpc.html

  
#### Warnings ####

  * igt@i915_pm_rpm@gem-pread:
    - shard-snb:          [SKIP][111] ([fdo#109271]) -> [INCOMPLETE][112] ([i915#82])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-snb2/igt@i915_pm_rpm@gem-pread.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-snb4/igt@i915_pm_rpm@gem-pread.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][113] ([i915#180]) -> [DMESG-WARN][114] ([i915#180] / [i915#93] / [i915#95])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-kbl:          [FAIL][115] ([fdo#108145] / [i915#265]) -> [FAIL][116] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
    - shard-apl:          [FAIL][117] ([fdo#108145] / [i915#265]) -> [FAIL][118] ([fdo#108145] / [i915#265] / [i915#95])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [i915#1066]: https://gitlab.freedesktop.org/drm/intel/issues/1066
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#1291]: https://gitlab.freedesktop.org/drm/intel/issues/1291
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1318]: https://gitlab.freedesktop.org/drm/intel/issues/1318
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1618]: https://gitlab.freedesktop.org/drm/intel/issues/1618
  [i915#1621]: https://gitlab.freedesktop.org/drm/intel/issues/1621
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#307]: https://gitlab.freedesktop.org/drm/intel/issues/307
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5562 -> IGTPW_4404
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8245: 94d1039c46f041c764a8f620b7bd0f9ccac2a2b9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4404: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/index.html
  IGT_5562: 4770480c8c1f105ff9225e8eb07b652ca954e06a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
