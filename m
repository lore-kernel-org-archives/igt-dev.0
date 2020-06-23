Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 23 Jun 2020 21:56:11 -0000
Message-ID: <159294937142.4210.655819478255951970@emeril.freedesktop.org>
References: <20200623135342.7046-1-stanislav.lisovskiy@intel.com>
In-Reply-To: <20200623135342.7046-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaWd0L3Rl?=
 =?utf-8?q?sts=3A_Clear_pipes_properly_in_kms=5Fatomic=5Ftransition?=
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
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: igt/tests: Clear pipes properly in kms_atomic_transition
URL   : https://patchwork.freedesktop.org/series/78741/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8657_full -> IGTPW_4695_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4695_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4695_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4695_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][1] ([i915#31]) -> [WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-hsw1/igt@kms_setmode@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-hsw1/igt@kms_setmode@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_4695_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#1635] / [i915#95]) +38 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-apl4/igt@gem_exec_flush@basic-wb-rw-before-default.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-apl6/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_whisper@basic-contexts-priority:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#118] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-glk5/igt@gem_exec_whisper@basic-contexts-priority.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-glk5/igt@gem_exec_whisper@basic-contexts-priority.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-snb:          [PASS][7] -> [TIMEOUT][8] ([i915#1958]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-snb4/igt@gem_partial_pwrite_pread@write-uncached.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-snb1/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#1436] / [i915#716])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-apl2/igt@gen9_exec_parse@allowed-all.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-apl4/igt@gen9_exec_parse@allowed-all.html
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1436] / [i915#716])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-kbl1/igt@gen9_exec_parse@allowed-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-kbl3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-hsw:          [PASS][13] -> [SKIP][14] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-hsw1/igt@i915_pm_rpm@dpms-non-lpsp.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-hsw4/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-tglb:         [PASS][15] -> [DMESG-WARN][16] ([i915#402])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-tglb8/igt@i915_pm_rpm@reg-read-ioctl.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-tglb5/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-glk:          [PASS][17] -> [DMESG-FAIL][18] ([i915#118] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-glk7/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [PASS][19] -> [DMESG-FAIL][20] ([i915#54] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen:
    - shard-hsw:          [PASS][21] -> [TIMEOUT][22] ([i915#1958]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-hsw4/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-hsw4/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html

  * igt@kms_flip_tiling@flip-to-x-tiled:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-kbl1/igt@kms_flip_tiling@flip-to-x-tiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-kbl4/igt@kms_flip_tiling@flip-to-x-tiled.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-tglb:         [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-tglb2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-tglb1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][27] -> [SKIP][28] ([i915#433])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [PASS][31] -> [DMESG-FAIL][32] ([i915#1635] / [i915#95]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-apl8/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
    - shard-kbl:          [PASS][33] -> [DMESG-FAIL][34] ([i915#95]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-kbl1/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          [PASS][35] -> [FAIL][36] ([IGT#2])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-apl6/igt@kms_sysfs_edid_timing.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-apl1/igt@kms_sysfs_edid_timing.html
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([IGT#2])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-kbl6/igt@kms_sysfs_edid_timing.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-kbl1/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@invalid:
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#93] / [i915#95]) +39 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-kbl4/igt@kms_vblank@invalid.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-kbl3/igt@kms_vblank@invalid.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-contexts-all:
    - shard-glk:          [DMESG-WARN][41] ([i915#118] / [i915#95]) -> [PASS][42] +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-glk8/igt@gem_exec_whisper@basic-contexts-all.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-glk6/igt@gem_exec_whisper@basic-contexts-all.html

  * igt@gem_shrink@reclaim:
    - shard-hsw:          [SKIP][43] ([fdo#109271]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-hsw1/igt@gem_shrink@reclaim.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-hsw4/igt@gem_shrink@reclaim.html

  * igt@gem_userptr_blits@create-destroy-sync:
    - shard-hsw:          [TIMEOUT][45] ([i915#1958]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-hsw1/igt@gem_userptr_blits@create-destroy-sync.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-hsw1/igt@gem_userptr_blits@create-destroy-sync.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][47] ([i915#1904]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-tglb6/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-tglb3/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][49] ([i915#454]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-iclb1/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-kbl:          [INCOMPLETE][51] ([i915#151] / [i915#155]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-kbl4/igt@i915_pm_rpm@system-suspend-execbuf.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-kbl6/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-iclb:         [INCOMPLETE][53] ([i915#1185]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-iclb3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-iclb8/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_atomic_transition@plane-all-transition-fencing@edp-1-pipe-d:
    - shard-tglb:         [DMESG-WARN][55] ([i915#1982]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-tglb8/igt@kms_atomic_transition@plane-all-transition-fencing@edp-1-pipe-d.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-tglb2/igt@kms_atomic_transition@plane-all-transition-fencing@edp-1-pipe-d.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [DMESG-WARN][57] ([i915#93] / [i915#95]) -> [PASS][58] +37 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-kbl1/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-kbl6/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [DMESG-FAIL][59] ([i915#54] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-FAIL][61] ([i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][63] ([i915#79]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][65] -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-apl:          [DMESG-FAIL][67] ([i915#1635] / [i915#95]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][69] ([fdo#108145] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [DMESG-FAIL][71] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +4 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm:
    - shard-apl:          [DMESG-WARN][75] ([i915#1635] / [i915#95]) -> [PASS][76] +32 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-apl7/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-apl8/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][77] ([i915#1820]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-kbl3/igt@perf_pmu@semaphore-busy@rcs0.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-kbl3/igt@perf_pmu@semaphore-busy@rcs0.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-apl:          [FAIL][79] ([i915#1930]) -> [DMESG-FAIL][80] ([i915#1635] / [i915#95])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-apl3/igt@gem_exec_reloc@basic-concurrent0.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-apl4/igt@gem_exec_reloc@basic-concurrent0.html
    - shard-kbl:          [FAIL][81] ([i915#1930]) -> [DMESG-FAIL][82] ([i915#95])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-kbl6/igt@gem_exec_reloc@basic-concurrent0.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-kbl3/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [FAIL][83] ([i915#1930]) -> [TIMEOUT][84] ([i915#1958])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-snb4/igt@gem_exec_reloc@basic-concurrent16.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-snb1/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
    - shard-apl:          [SKIP][85] ([fdo#109271]) -> [SKIP][86] ([fdo#109271] / [i915#1635]) +18 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-apl7/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-apl7/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][87] ([i915#454]) -> [SKIP][88] ([i915#468])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-tglb3/igt@i915_pm_dc@dc6-dpms.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [DMESG-WARN][89] ([i915#93] / [i915#95]) -> [DMESG-WARN][90] ([i915#180])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-kbl4/igt@i915_suspend@sysfs-reader.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-kbl3/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-hsw:          [TIMEOUT][91] ([i915#1958]) -> [SKIP][92] ([fdo#109271]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-hsw1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-hsw1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_chamelium@dp-hpd:
    - shard-apl:          [SKIP][93] ([fdo#109271] / [fdo#111827]) -> [SKIP][94] ([fdo#109271] / [fdo#111827] / [i915#1635])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-apl2/igt@kms_chamelium@dp-hpd.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-apl4/igt@kms_chamelium@dp-hpd.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          [SKIP][95] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][96] ([fdo#109271] / [fdo#111827])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-apl4/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-apl1/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-snb:          [SKIP][97] ([fdo#109271]) -> [TIMEOUT][98] ([i915#1958]) +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html
    - shard-hsw:          [SKIP][99] ([fdo#109271]) -> [TIMEOUT][100] ([i915#1958]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-hsw4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-hsw4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-apl:          [SKIP][101] ([fdo#109271] / [i915#1635]) -> [SKIP][102] ([fdo#109271]) +11 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8657/shard-apl1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/shard-apl4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  
  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5717 -> IGTPW_4695
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8657: 4e7208fe65d467e37dbc3f506ae2398ca4207c36 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4695: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/index.html
  IGT_5717: 725bf2dae51f0087eaa64f1931a2ef9d22f070dd @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4695/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
