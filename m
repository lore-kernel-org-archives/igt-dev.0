Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 02 Jul 2021 14:55:23 -0000
Message-ID: <162523772366.22028.473684128230322494@emeril.freedesktop.org>
References: <20210702115234.6256-1-andrzej.turko@linux.intel.com>
In-Reply-To: <20210702115234.6256-1-andrzej.turko@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgS2VlcCB0?=
 =?utf-8?q?ests_working_without_relocations_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0884219797=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0884219797==
Content-Type: multipart/alternative;
 boundary="===============0301383750971816800=="

--===============0301383750971816800==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Keep tests working without relocations (rev4)
URL   : https://patchwork.freedesktop.org/series/90049/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10302_full -> IGTPW_5977_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5977_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5977_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5977_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_softpin@evict-many-engines@bcs0} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-snb7/igt@gem_softpin@evict-many-engines@bcs0.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-apl:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-apl7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-iclb:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-iclb7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10302_full and IGTPW_5977_full:

### New IGT tests (7) ###

  * igt@gem_softpin@evict-many-all-engines:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [1.32, 37.15] s

  * igt@gem_softpin@evict-many-engines:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_softpin@evict-many-engines@bcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [1.81, 45.79] s

  * igt@gem_softpin@evict-many-engines@rcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [1.38, 39.88] s

  * igt@gem_softpin@evict-many-engines@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [26.69, 41.56] s

  * igt@gem_softpin@evict-many-engines@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [26.73, 27.77] s

  * igt@gem_softpin@evict-many-engines@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [26.77, 42.40] s

  

Known issues
------------

  Here are the changes found in IGTPW_5977_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-clear:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#3160])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-glk2/igt@gem_create@create-clear.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-glk6/igt@gem_create@create-clear.html

  * igt@gem_create@create-massive:
    - shard-apl:          NOTRUN -> [DMESG-WARN][7] ([i915#3002])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-apl2/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@engines-persistence:
    - shard-snb:          NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#1099]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-snb6/igt@gem_ctx_persistence@engines-persistence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#2846])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-kbl3/igt@gem_exec_fair@basic-deadline.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-kbl2/igt@gem_exec_fair@basic-deadline.html
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#2846])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-glk2/igt@gem_exec_fair@basic-deadline.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-glk5/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#2842]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-glk2/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-glk2/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-apl:          [PASS][15] -> [SKIP][16] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-apl7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-apl7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-kbl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-kbl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][19] ([i915#2842])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][20] -> [SKIP][21] ([fdo#109271])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_params@secure-non-master:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([fdo#112283])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-tglb5/igt@gem_exec_params@secure-non-master.html
    - shard-iclb:         NOTRUN -> [SKIP][23] ([fdo#112283])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb3/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-iclb:         [PASS][24] -> [INCOMPLETE][25] ([i915#1895])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-iclb6/igt@gem_exec_whisper@basic-fds-forked.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb4/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#2190])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-apl3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap_gtt@big-copy-xy:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#307])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-glk1/igt@gem_mmap_gtt@big-copy-xy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-glk5/igt@gem_mmap_gtt@big-copy-xy.html

  * igt@gem_mmap_gtt@cpuset-big-copy-xy:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#307])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-iclb4/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy-xy.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#644])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([i915#768])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb4/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> [FAIL][34] ([i915#3318])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-apl3/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_render_linear_blits:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#109289])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-tglb2/igt@gen3_render_linear_blits.html
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#109289])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb4/igt@gen3_render_linear_blits.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [PASS][37] -> [DMESG-WARN][38] ([i915#3698])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-iclb3/igt@i915_pm_dc@dc5-psr.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb7/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#1937])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-apl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#111644] / [i915#1397] / [i915#2411])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#110892])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#110725] / [fdo#111614])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#111615])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-tglb3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([i915#3689]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-tglb6/igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs.html

  * igt@kms_chamelium@dp-crc-single:
    - shard-snb:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-snb5/igt@kms_chamelium@dp-crc-single.html

  * igt@kms_chamelium@hdmi-cmp-planar-formats:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb3/igt@kms_chamelium@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +22 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-apl6/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_color_chamelium@pipe-c-ctm-blue-to-red:
    - shard-glk:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-glk3/igt@kms_color_chamelium@pipe-c-ctm-blue-to-red.html
    - shard-kbl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-kbl4/igt@kms_color_chamelium@pipe-c-ctm-blue-to-red.html
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-tglb3/igt@kms_color_chamelium@pipe-c-ctm-blue-to-red.html

  * igt@kms_content_protection@uevent:
    - shard-apl:          NOTRUN -> [FAIL][51] ([i915#2105])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-apl1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109278] / [fdo#109279])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#109279] / [i915#3359])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-apl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [i915#533]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-apl2/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109274]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb6/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#111825]) +8 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-tglb5/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-apl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [i915#2672])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-apl6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109280]) +7 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-glk:          NOTRUN -> [SKIP][59] ([fdo#109271]) +18 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-glk5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][60] -> [SKIP][61] ([i915#433])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b:
    - shard-glk:          [PASS][62] -> [FAIL][63] ([i915#53])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-glk3/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-glk9/igt@kms_pipe_crc_basic@read-crc-pipe-b.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][64] -> [DMESG-WARN][65] ([i915#180]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-apl:          [PASS][66] -> [DMESG-WARN][67] ([i915#180]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][68] ([fdo#108145] / [i915#265]) +3 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#2920]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-tglb1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html
    - shard-glk:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#658])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-glk2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html
    - shard-iclb:         NOTRUN -> [SKIP][71] ([i915#658])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-apl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#658]) +8 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-apl2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:
    - shard-kbl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#658]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-kbl1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html
    - shard-iclb:         NOTRUN -> [SKIP][74] ([i915#2920])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][75] -> [SKIP][76] ([fdo#109441]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb5/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          NOTRUN -> [FAIL][77] ([IGT#2])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-apl2/igt@kms_sysfs_edid_timing.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][78] ([fdo#109271]) +20 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-kbl1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html
    - shard-snb:          NOTRUN -> [SKIP][79] ([fdo#109271]) +81 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-snb6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#109278]) +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb4/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][81] -> [DMESG-WARN][82] ([i915#180] / [i915#295])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
    - shard-apl:          NOTRUN -> [SKIP][83] ([fdo#109271]) +263 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-apl7/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html

  * igt@nouveau_crc@pipe-b-source-outp-inactive:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([i915#2530])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb7/igt@nouveau_crc@pipe-b-source-outp-inactive.html
    - shard-tglb:         NOTRUN -> [SKIP][85] ([i915#2530]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-tglb7/igt@nouveau_crc@pipe-b-source-outp-inactive.html

  * igt@nouveau_crc@pipe-d-source-outp-complete:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109278] / [i915#2530])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb6/igt@nouveau_crc@pipe-d-source-outp-complete.html

  * igt@prime_vgem@coherency-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([fdo#111656])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-tglb7/igt@prime_vgem@coherency-gtt.html
    - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#109292])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb7/igt@prime_vgem@coherency-gtt.html

  * igt@sysfs_clients@create:
    - shard-glk:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#2994])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-glk6/igt@sysfs_clients@create.html
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#2994])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-tglb5/igt@sysfs_clients@create.html
    - shard-apl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#2994]) +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-apl7/igt@sysfs_clients@create.html
    - shard-iclb:         NOTRUN -> [SKIP][92] ([i915#2994])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb4/igt@sysfs_clients@create.html
    - shard-kbl:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#2994])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-kbl6/igt@sysfs_clients@create.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [FAIL][94] ([i915#2842]) -> [PASS][95] +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [SKIP][96] ([fdo#109271]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-kbl:          [FAIL][98] ([i915#2842]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs0.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][100] ([i915#2849]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-snb:          [INCOMPLETE][102] ([i915#2055]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-snb5/igt@gem_fenced_exec_thrash@no-spare-fences.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-snb5/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][104] ([i915#2190]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-tglb7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][106] ([i915#180]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-apl6/igt@gem_workarounds@suspend-resume-context.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-apl6/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-iclb:         [FAIL][108] -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-iclb5/igt@i915_suspend@fence-restore-untiled.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb2/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [DMESG-WARN][110] ([i915#118] / [i915#95]) -> [PASS][111] +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-glk2/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled:
    - shard-glk:          [FAIL][112] -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-glk3/igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-glk5/igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][114] ([i915#2122]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-glk2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-glk9/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][116] ([fdo#109441]) -> [PASS][117] +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-iclb4/igt@kms_psr@psr2_cursor_blt.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  
#### Warnings ####

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [FAIL][118] ([i915#2851]) -> [FAIL][119] ([i915#2842])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][120] ([i915#454]) -> [DMESG-WARN][121] ([i915#3698])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][122] ([i915#1804] / [i915#2684]) -> [WARN][123] ([i915#2684])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
    - shard-iclb:         [SKIP][124] ([i915#2920]) -> [SKIP][125] ([i915#658]) +1 similar issue
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:
    - shard-iclb:         [SKIP][126] ([i915#658]) -> [SKIP][127] ([i915#2920])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][128], [FAIL][129]) ([i915#3002] / [i915#3363]) -> ([FAIL][130], [FAIL][131], [FAIL][132], [FAIL][133], [FAIL][134]) ([i915#180] / [i915#1814] / [i915#3002] / [i915#3363] / [i915#602])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-kbl2/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-kbl7/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-kbl1/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-kbl4/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-kbl7/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-kbl4/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-kbl3/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][135], [FAIL][136], [FAIL][137]) ([i915#1814] / [i915#3002]) -> ([FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141]) ([i915#1814] / [i915#3002] / [i915#3702])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-iclb6/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-iclb1/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-iclb7/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb5/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb4/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb7/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb1/igt@runner@aborted.html
    - shard-apl:          ([FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145]) ([fdo#109271] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363]) -> ([FAIL][146], [FAIL][147], [FAIL][148], [FAIL][149]) ([fdo#109271] / [i915#1814] / [i915#3002] / [i915#3363])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-apl8/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-apl1/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-apl8/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-apl6/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-apl7/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-apl1/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-apl2/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-apl8/igt@runner@aborted.html

  
  {name}: This element is

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/index.html

--===============0301383750971816800==
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
<tr><td><b>Series:</b></td><td>Keep tests working without relocations (rev4=
)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/90049/">https://patchwork.freedesktop.org/series/90049/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5977/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10302_full -&gt; IGTPW_5977_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5977_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5977_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5977=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_softpin@evict-many-engines@bcs0} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-snb7/igt@gem_softpin@evict-many-engines@bcs0=
.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-apl7/igt@kms_addfb_basic@invalid-smem-bo-on-=
discrete.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-iclb7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate=
-180-hflip-async-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5977/shard-iclb1/igt@kms_big_fb@y-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip-async-flip.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10302_full and IGTPW_5977_=
full:</p>
<h3>New IGT tests (7)</h3>
<ul>
<li>
<p>igt@gem_softpin@evict-many-all-engines:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [1.32, 37.15] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-many-engines:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-many-engines@bcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [1.81, 45.79] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-many-engines@rcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [1.38, 39.88] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-many-engines@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [26.69, 41.56] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-many-engines@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [26.73, 27.77] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-many-engines@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [26.77, 42.40] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5977_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-clear:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-glk2/igt@gem_create@create-clear.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-glk6/ig=
t@gem_create@create-clear.html">FAIL</a> ([i915#3160])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-apl2/igt@gem_create@create-massive.html">DME=
SG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-persistence:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-snb6/igt@gem_ctx_persistence@engines-persist=
ence.html">SKIP</a> ([fdo#109271] / [i915#1099]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10302/shard-kbl3/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-kbl=
2/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10302/shard-glk2/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-glk=
5/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-glk2/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/sh=
ard-glk2/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]=
) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-apl7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/s=
hard-apl7/igt@gem_exec_fair@basic-none-share@rcs0.html">SKIP</a> ([fdo#1092=
71])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-kbl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/sh=
ard-kbl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]=
)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html=
">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-=
kbl1/igt@gem_exec_fair@basic-pace@vecs0.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-tglb5/igt@gem_exec_params@secure-non-master.h=
tml">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-iclb3/igt@gem_exec_params@secure-non-master.h=
tml">SKIP</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-iclb6/igt@gem_exec_whisper@basic-fds-forked.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/sh=
ard-iclb4/igt@gem_exec_whisper@basic-fds-forked.html">INCOMPLETE</a> ([i915=
#1895])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-apl3/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy-xy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-glk1/igt@gem_mmap_gtt@big-copy-xy.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-glk5/i=
gt@gem_mmap_gtt@big-copy-xy.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-xy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-iclb4/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shar=
d-iclb6/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@flink-and-close-vma-leak:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/sh=
ard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html">FAIL</a> ([i915#644])=
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-iclb4/igt@gem_render_copy@y-tiled-mc-ccs-to-=
vebox-yf-tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-apl3/igt@gem_userptr_blits@vma-merge.html">F=
AIL</a> ([i915#3318])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-tglb2/igt@gen3_render_linear_blits.html">SKIP=
</a> ([fdo#109289])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-iclb4/igt@gen3_render_linear_blits.html">SKIP=
</a> ([fdo#109289])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-iclb3/igt@i915_pm_dc@dc5-psr.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb7/igt@i=
915_pm_dc@dc5-psr.html">DMESG-WARN</a> ([i915#3698])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-apl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.h=
tml">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp-stress=
-no-wait.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress=
-no-wait.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-iclb7/igt@kms_big_fb@x-tiled-16bpp-rotate-27=
0.html">SKIP</a> ([fdo#110725] / [fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-tglb3/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-0.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-tglb6/igt@kms_ccs@pipe-b-bad-rotation-90-yf_=
tiled_ccs.html">SKIP</a> ([i915#3689]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-single:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-snb5/igt@kms_chamelium@dp-crc-single.html">S=
KIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-iclb3/igt@kms_chamelium@hdmi-cmp-planar-form=
ats.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-apl6/igt@kms_chamelium@hdmi-edid-change-duri=
ng-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +22 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-glk3/igt@kms_color_chamelium@pipe-c-ctm-blue-=
to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-kbl4/igt@kms_color_chamelium@pipe-c-ctm-blue-=
to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-tglb3/igt@kms_color_chamelium@pipe-c-ctm-blue=
-to-red.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-apl1/igt@kms_content_protection@uevent.html"=
>FAIL</a> ([i915#2105])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-512x51=
2-sliding.html">SKIP</a> ([fdo#109278] / [fdo#109279])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-512x51=
2-sliding.html">SKIP</a> ([fdo#109279] / [i915#3359])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-apl2/igt@kms_cursor_legacy@pipe-d-torture-bo=
.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-iclb6/igt@kms_flip@2x-blocking-wf_vblank.htm=
l">SKIP</a> ([fdo#109274]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-tglb5/igt@kms_flip@2x-plain-flip-ts-check.ht=
ml">SKIP</a> ([fdo#111825]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-apl6/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-spr-indfb-onoff.html">SKIP</a> ([fdo#109280]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-glk5/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-spr-indfb-draw-pwrite.html">SKIP</a> ([fdo#109271]) +18 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-t=
glb6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-b:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-glk3/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/sh=
ard-glk9/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">FAIL</a> ([i915#53])<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5977/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG=
-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5977/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">DMESG=
-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-=
basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-tglb1/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-1.html">SKIP</a> ([i915#2920]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-glk2/igt@kms_psr2_sf@overlay-primary-update-s=
f-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-iclb6/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-1.html">SKIP</a> ([i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-apl2/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +8 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-kbl1/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-5.html">SKIP</a> ([i915#2920])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard=
-iclb5/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> ([fdo#109441]) +1 =
similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-apl2/igt@kms_sysfs_edid_timing.html">FAIL</a=
> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-kbl1/igt@kms_universal_plane@disable-primary-=
vs-flip-pipe-d.html">SKIP</a> ([fdo#109271]) +20 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-snb6/igt@kms_universal_plane@disable-primary-=
vs-flip-pipe-d.html">SKIP</a> ([fdo#109271]) +81 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-iclb4/igt@kms_universal_plane@disable-primary=
-vs-flip-pipe-d.html">SKIP</a> ([fdo#109278]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5977/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-W=
ARN</a> ([i915#180] / [i915#295])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-apl7/igt@nouveau_crc@pipe-b-ctx-flip-skip-cu=
rrent-frame.html">SKIP</a> ([fdo#109271]) +263 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-inactive:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-iclb7/igt@nouveau_crc@pipe-b-source-outp-inac=
tive.html">SKIP</a> ([i915#2530])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-tglb7/igt@nouveau_crc@pipe-b-source-outp-inac=
tive.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-outp-complete:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-iclb6/igt@nouveau_crc@pipe-d-source-outp-com=
plete.html">SKIP</a> ([fdo#109278] / [i915#2530])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-tglb7/igt@prime_vgem@coherency-gtt.html">SKIP=
</a> ([fdo#111656])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-iclb7/igt@prime_vgem@coherency-gtt.html">SKIP=
</a> ([fdo#109292])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@create:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-glk6/igt@sysfs_clients@create.html">SKIP</a> =
([fdo#109271] / [i915#2994])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-tglb5/igt@sysfs_clients@create.html">SKIP</a>=
 ([i915#2994])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-apl7/igt@sysfs_clients@create.html">SKIP</a> =
([fdo#109271] / [i915#2994]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-iclb4/igt@sysfs_clients@create.html">SKIP</a>=
 ([i915#2994])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-kbl6/igt@sysfs_clients@create.html">SKIP</a> =
([fdo#109271] / [i915#2994])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> =
([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5977/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> +1 sim=
ilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html">SKIP</a> (=
[fdo#109271]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5977/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (=
[i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5977/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL<=
/a> ([i915#2849]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5977/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-snb5/igt@gem_fenced_exec_thrash@no-spare-fences.html">I=
NCOMPLETE</a> ([i915#2055]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5977/shard-snb5/igt@gem_fenced_exec_thrash@no-spare-fences=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2=
190]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/=
shard-tglb7/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-apl6/igt@gem_workarounds@suspend-resume-context.html">D=
MESG-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5977/shard-apl6/igt@gem_workarounds@suspend-resume-context.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-iclb5/igt@i915_suspend@fence-restore-untiled.html">FAIL=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/s=
hard-iclb2/igt@i915_suspend@fence-restore-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-glk2/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG=
-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5977/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-=
180.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-glk3/igt@kms_draw_crc@draw-method-xrgb8888-render-ytile=
d.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5977/shard-glk5/igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-glk2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le@ab-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#2122]) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-glk9/igt@kms_flip@2x-pla=
in-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-iclb4/igt@kms_psr@psr2_cursor_blt.html">SKIP</a> ([fdo#=
109441]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_59=
77/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a> +1 similar issue<=
/li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL<=
/a> ([i915#2851]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5977/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a=
> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454]=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shar=
d-iclb4/igt@i915_pm_dc@dc6-psr.html">DMESG-WARN</a> ([i915#3698])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a>=
 ([i915#1804] / [i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5977/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html"=
>WARN</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-=
4.html">SKIP</a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5977/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-s=
f-dmg-area-4.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-=
4.html">SKIP</a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5977/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-4.html">SKIP</a> ([i915#2920])</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-kbl7/igt@runner@abo=
rted.html">FAIL</a>) ([i915#3002] / [i915#3363]) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-kbl1/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_59=
77/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-kbl7/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shar=
d-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5977/shard-kbl3/igt@runner@aborted.html">FAIL</a>)=
 ([i915#180] / [i915#1814] / [i915#3002] / [i915#3363] / [i915#602])</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-iclb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-iclb1/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10302/shard-iclb7/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / =
[i915#3002]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5977/shard-iclb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb4/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_59=
77/shard-iclb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-iclb1/igt@runner@aborted.html">=
FAIL</a>) ([i915#1814] / [i915#3002] / [i915#3702])</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10302/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-apl1/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_10302/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/shard-apl6/igt@runner@aborte=
d.html">FAIL</a>) ([fdo#109271] / [i915#180] / [i915#1814] / [i915#3002] / =
[i915#3363]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5977/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/shard-apl1/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977=
/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_5977/shard-apl8/igt@runner@aborted.html">FAIL=
</a>) ([fdo#109271] / [i915#1814] / [i915#3002] / [i915#3363])</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is</p>

</body>
</html>

--===============0301383750971816800==--

--===============0884219797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0884219797==--
