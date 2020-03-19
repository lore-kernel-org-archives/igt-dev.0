Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 19 Mar 2020 22:08:26 -0000
Message-ID: <158465570671.17935.10419014802154875777@emeril.freedesktop.org>
References: <20200319193644.7417-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200319193644.7417-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbig=5Ffb=3A_Add_max_HW_stride_length_tests_=28rev2=29?=
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_big_fb: Add max HW stride length tests (rev2)
URL   : https://patchwork.freedesktop.org/series/74883/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8160_full -> IGTPW_4331_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4331_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4331_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4331_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt:
    - shard-hsw:          NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt.html

  * {igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-iclb7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html
    - shard-tglb:         NOTRUN -> [FAIL][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-tglb7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html

  * {igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-iclb5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][5] +4 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-tglb1/igt@kms_hdr@static-toggle-dpms.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8160_full and IGTPW_4331_full:

### New IGT tests (16) ###

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
    - Statuses : 7 pass(s)
    - Exec time: [1.47, 2.05] s

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:
    - Statuses : 6 pass(s)
    - Exec time: [1.31, 2.01] s

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [0.14, 1.96] s

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:
    - Statuses : 2 fail(s) 5 pass(s)
    - Exec time: [0.16, 1.90] s

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - Statuses : 5 pass(s)
    - Exec time: [1.47, 2.13] s

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:
    - Statuses : 7 pass(s)
    - Exec time: [1.37, 2.20] s

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - Statuses : 5 pass(s)
    - Exec time: [1.37, 2.01] s

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:
    - Statuses : 2 pass(s)
    - Exec time: [1.53, 1.66] s

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.05] s

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.47] s

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.98] s

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.10] s

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - Statuses : 4 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.33] s

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.01] s

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4331_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [PASS][6] -> [INCOMPLETE][7] ([i915#1402])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-kbl7/igt@gem_ctx_persistence@close-replace-race.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-kbl1/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#112080]) +13 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-iclb3/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@fifo-bsd1:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#109276]) +9 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb4/igt@gem_exec_schedule@fifo-bsd1.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-iclb6/igt@gem_exec_schedule@fifo-bsd1.html

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#109276] / [i915#677])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-iclb7/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([i915#677]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb5/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#112146]) +4 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [PASS][18] -> [DMESG-WARN][19] ([fdo#110789] / [fdo#111870])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-hsw2/igt@gem_userptr_blits@sync-unmap-after-close.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-hsw1/igt@gem_userptr_blits@sync-unmap-after-close.html
    - shard-snb:          [PASS][20] -> [DMESG-WARN][21] ([fdo#110789] / [fdo#111870] / [i915#478])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-snb4/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][22] -> [FAIL][23] ([i915#413])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb6/igt@i915_pm_rps@reset.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-iclb1/igt@i915_pm_rps@reset.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][24] -> [FAIL][25] ([i915#54])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
    - shard-apl:          [PASS][26] -> [FAIL][27] ([i915#54])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][28] -> [DMESG-WARN][29] ([i915#180]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][30] -> [DMESG-WARN][31] ([i915#180]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-kbl:          [PASS][32] -> [INCOMPLETE][33] ([i915#155])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][34] -> [SKIP][35] ([fdo#109441]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-iclb3/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_universal_plane@universal-plane-pipe-a-functional:
    - shard-kbl:          [PASS][36] -> [FAIL][37] ([i915#331])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-kbl1/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-kbl4/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
    - shard-apl:          [PASS][38] -> [FAIL][39] ([i915#331])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-apl7/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-apl1/igt@kms_universal_plane@universal-plane-pipe-a-functional.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-iclb:         [INCOMPLETE][40] ([i915#1402]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb1/igt@gem_ctx_persistence@close-replace-race.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-iclb2/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_persistence@engines-mixed-process@bcs0:
    - shard-iclb:         [FAIL][42] ([i915#679]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb4/igt@gem_ctx_persistence@engines-mixed-process@bcs0.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-iclb4/igt@gem_ctx_persistence@engines-mixed-process@bcs0.html

  * igt@gem_ctx_persistence@engines-mixed-process@vcs0:
    - shard-iclb:         [INCOMPLETE][44] ([i915#1239]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb4/igt@gem_ctx_persistence@engines-mixed-process@vcs0.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-iclb4/igt@gem_ctx_persistence@engines-mixed-process@vcs0.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@blt:
    - shard-tglb:         [FAIL][46] ([i915#679]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-tglb2/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-tglb1/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox:
    - shard-tglb:         [INCOMPLETE][48] ([i915#1239]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-tglb2/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-tglb1/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][50] ([fdo#112146]) -> [PASS][51] +3 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-iclb6/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][52] ([i915#677]) -> [PASS][53] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-tglb:         [INCOMPLETE][54] ([i915#1318] / [i915#1401]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-tglb1/igt@gem_exec_whisper@basic-fds-forked.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-tglb3/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][56] ([i915#644]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][58] ([i915#447]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-iclb8/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-iclb:         [SKIP][60] ([i915#1316]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb1/igt@i915_pm_rpm@gem-execbuf.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-iclb7/igt@i915_pm_rpm@gem-execbuf.html
    - shard-glk:          [SKIP][62] ([fdo#109271]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-glk3/igt@i915_pm_rpm@gem-execbuf.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-glk4/igt@i915_pm_rpm@gem-execbuf.html
    - shard-tglb:         [SKIP][64] ([i915#1316]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-tglb2/igt@i915_pm_rpm@gem-execbuf.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-tglb3/igt@i915_pm_rpm@gem-execbuf.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][66] ([i915#180]) -> [PASS][67] +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-glk:          [FAIL][68] ([i915#34]) -> [PASS][69] +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-glk4/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-glk6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack:
    - shard-glk:          [FAIL][70] ([i915#49]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][72] ([i915#180]) -> [PASS][73] +6 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][74] ([i915#899]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][76] ([fdo#109441]) -> [PASS][77] +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb8/igt@kms_psr@psr2_dpms.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-iclb2/igt@kms_psr@psr2_dpms.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][78] ([i915#31]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-apl1/igt@kms_setmode@basic.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-apl3/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][80] ([fdo#112080]) -> [PASS][81] +9 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb5/igt@perf_pmu@busy-vcs1.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-iclb4/igt@perf_pmu@busy-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][82] ([fdo#109276]) -> [PASS][83] +11 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt:
    - shard-hsw:          [DMESG-WARN][84] ([fdo#110789] / [i915#478]) -> [DMESG-WARN][85] ([i915#478])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html
    - shard-snb:          [DMESG-WARN][86] ([fdo#110789] / [i915#478]) -> [DMESG-WARN][87] ([i915#478])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][88] ([i915#92]) -> ([FAIL][89], [FAIL][90]) ([i915#1389] / [i915#1402] / [i915#92])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-kbl6/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-kbl1/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/shard-kbl7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1239]: https://gitlab.freedesktop.org/drm/intel/issues/1239
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1318]: https://gitlab.freedesktop.org/drm/intel/issues/1318
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1401]: https://gitlab.freedesktop.org/drm/intel/issues/1401
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5523 -> IGTPW_4331
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8160: 6ba1729e5025761ab74914f6b8aa3288f493e9c7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4331: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/index.html
  IGT_5523: cf6d524007ac51a7d5a48503ea3dd5f01fd4ebab @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4331/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
