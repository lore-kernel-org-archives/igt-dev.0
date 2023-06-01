Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6030024394938062362=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Thu, 01 Jun 2023 15:13:56 -0000
Message-ID: <168563243659.16227.18342547958599885208@emeril.freedesktop.org>
References: <20230531074530.367036-1-swati2.sharma@intel.com>
In-Reply-To: <20230531074530.367036-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbnYxMiBj?=
 =?utf-8?q?rc_sanity_check?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============6030024394938062362==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: nv12 crc sanity check
URL   : https://patchwork.freedesktop.org/series/118633/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13204_full -> IGTPW_9077_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/index.html

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9077_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_mmap_offset@clear@smem0:
    - {shard-dg1}:        NOTRUN -> [DMESG-FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-dg1-14/igt@gem_mmap_offset@clear@smem0.html

  * igt@kms_plane@pixel-format@pipe-b-planes:
    - {shard-dg1}:        [PASS][2] -> [FAIL][3] +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-dg1-12/igt@kms_plane@pixel-format@pipe-b-planes.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-dg1-17/igt@kms_plane@pixel-format@pipe-b-planes.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13204_full and IGTPW_9077_full:

### New IGT tests (40) ###

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9077_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@multigpu-basic-process:
    - shard-apl:          NOTRUN -> [SKIP][4] ([fdo#109271]) +8 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-apl7/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#2846])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-glk8/igt@gem_exec_fair@basic-deadline.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-glk6/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#2842]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-glk6/igt@gem_exec_fair@basic-pace@vcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-glk2/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@i915_module_load@load:
    - shard-glk:          NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#6227])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-glk1/igt@i915_module_load@load.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][10] -> [SKIP][11] ([fdo#109271])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-apl2/igt@i915_pm_dc@dc9-dpms.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-apl4/igt@i915_pm_dc@dc9-dpms.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][12] -> [ABORT][13] ([i915#180])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-glk:          [PASS][14] -> [SKIP][15] ([fdo#109271])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-glk1/igt@kms_hdmi_inject@inject-audio.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-glk3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:
    - shard-glk:          [PASS][16] -> [FAIL][17] ([i915#1623]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-glk7/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-glk1/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-c-dp-1:
    - shard-apl:          NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#4579]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-apl1/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-c-dp-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][19] ([fdo#109271]) +16 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-snb2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-3 (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][20] ([i915#5235]) +5 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-dg1-13/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-hdmi-a-1:
    - shard-snb:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#4579]) +11 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-snb1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-3 (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][22] ([i915#4579] / [i915#5235]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-3.html

  * igt@kms_selftest@all-tests:
    - shard-glk:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#4579]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-glk3/igt@kms_selftest@all-tests.html

  * igt@vc4/vc4_wait_bo@used-bo-0ns:
    - shard-glk:          NOTRUN -> [SKIP][24] ([fdo#109271]) +4 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-glk9/igt@vc4/vc4_wait_bo@used-bo-0ns.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@virtual-idle:
    - {shard-rkl}:        [FAIL][25] ([i915#7742]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-rkl-2/igt@drm_fdinfo@virtual-idle.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-rkl-3/igt@drm_fdinfo@virtual-idle.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - {shard-tglu}:       [FAIL][27] ([i915#6268]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-tglu-10/igt@gem_ctx_exec@basic-nohangcheck.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-tglu-9/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_eio@hibernate:
    - {shard-tglu}:       [ABORT][29] ([i915#7975] / [i915#8213] / [i915#8398]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-tglu-10/igt@gem_eio@hibernate.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-tglu-8/igt@gem_eio@hibernate.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - {shard-tglu}:       [FAIL][31] ([i915#2842]) -> [PASS][32] +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-tglu-6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-tglu-7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - {shard-rkl}:        [FAIL][33] ([i915#2842]) -> [PASS][34] +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-rkl-6/igt@gem_exec_fair@basic-pace@rcs0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-rkl-2/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_userptr_blits@huge-split:
    - shard-apl:          [FAIL][35] ([i915#3318]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-apl3/igt@gem_userptr_blits@huge-split.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-apl1/igt@gem_userptr_blits@huge-split.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [ABORT][37] ([i915#5566]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-apl6/igt@gen9_exec_parse@allowed-single.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-apl7/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - {shard-rkl}:        [SKIP][39] ([i915#1397]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-rkl-3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - {shard-dg1}:        [SKIP][41] ([i915#1397]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-dg1-17/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - {shard-rkl}:        [FAIL][43] ([i915#3743]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-rkl-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-rkl-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][45] ([i915#2346]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-to-y:
    - shard-glk:          [INCOMPLETE][47] -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-glk7/igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-to-y.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-glk6/igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-to-y.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - {shard-rkl}:        [ABORT][49] ([i915#8311]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-rkl-4/igt@kms_rotation_crc@multiplane-rotation.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-rkl-3/igt@kms_rotation_crc@multiplane-rotation.html

  
#### Warnings ####

  * igt@kms_hdmi_inject@inject-audio:
    - shard-snb:          [FAIL][51] ([IGT#3]) -> [SKIP][52] ([fdo#109271])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-snb6/igt@kms_hdmi_inject@inject-audio.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-snb6/igt@kms_hdmi_inject@inject-audio.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1623]: https://gitlab.freedesktop.org/drm/intel/issues/1623
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2876]: https://gitlab.freedesktop.org/drm/intel/issues/2876
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4275]: https://gitlab.freedesktop.org/drm/intel/issues/4275
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5234]: https://gitlab.freedesktop.org/drm/intel/issues/5234
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6786]: https://gitlab.freedesktop.org/drm/intel/issues/6786
  [i915#6806]: https://gitlab.freedesktop.org/drm/intel/issues/6806
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7951]: https://gitlab.freedesktop.org/drm/intel/issues/7951
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
  [i915#8211]: https://gitlab.freedesktop.org/drm/intel/issues/8211
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8234]: https://gitlab.freedesktop.org/drm/intel/issues/8234
  [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
  [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
  [i915#8311]: https://gitlab.freedesktop.org/drm/intel/issues/8311
  [i915#8398]: https://gitlab.freedesktop.org/drm/intel/issues/8398
  [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
  [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502
  [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7311 -> IGTPW_9077
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_13204: 83a048e62ecf7838b583389e60c1defa530a5668 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9077: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/index.html
  IGT_7311: c031030f39aff973330668a5a2f1593408da78ae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/index.html

--===============6030024394938062362==
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
<tr><td><b>Series:</b></td><td>nv12 crc sanity check</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/118633/">https://patchwork.freedesktop.org/series/118633/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13204_full -&gt; IGTPW_9077_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/index.html</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9077_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_mmap_offset@clear@smem0:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-dg1-14/igt@gem_mmap_offset@clear@smem0.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-planes:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-dg1-12/igt@kms_plane@pixel-format@pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-dg1-17/igt@kms_plane@pixel-format@pipe-b-planes.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13204_full and IGTPW_9077_full:</p>
<h3>New IGT tests (40)</h3>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9077_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-apl7/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-glk8/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-glk6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-glk6/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-glk2/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-glk1/igt@i915_module_load@load.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6227">i915#6227</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-apl2/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-apl4/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-glk1/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-glk3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-glk7/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-glk1/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1623">i915#1623</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-apl1/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-c-dp-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-snb2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-3 (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-dg1-13/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-snb1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-3 (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@all-tests:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-glk3/igt@kms_selftest@all-tests.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_bo@used-bo-0ns:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-glk9/igt@vc4/vc4_wait_bo@used-bo-0ns.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@virtual-idle:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-rkl-2/igt@drm_fdinfo@virtual-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-rkl-3/igt@drm_fdinfo@virtual-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-tglu-10/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-tglu-9/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-tglu-10/igt@gem_eio@hibernate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8398">i915#8398</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-tglu-8/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-tglu-6/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-tglu-7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-rkl-6/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-rkl-2/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@huge-split:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-apl3/igt@gem_userptr_blits@huge-split.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3318">i915#3318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-apl1/igt@gem_userptr_blits@huge-split.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-apl6/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-apl7/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-rkl-3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-dg1-17/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-rkl-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-rkl-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-to-y:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-glk7/igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-to-y.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-glk6/igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-rkl-4/igt@kms_rotation_crc@multiplane-rotation.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8311">i915#8311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-rkl-3/igt@kms_rotation_crc@multiplane-rotation.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_hdmi_inject@inject-audio:<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13204/shard-snb6/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/shard-snb6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7311 -&gt; IGTPW_9077</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13204: 83a048e62ecf7838b583389e60c1defa530a5668 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9077: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9077/index.html<br />
  IGT_7311: c031030f39aff973330668a5a2f1593408da78ae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============6030024394938062362==--
