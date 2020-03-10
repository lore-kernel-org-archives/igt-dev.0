Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 10 Mar 2020 16:43:31 -0000
Message-ID: <158385861186.5456.15621011488784164043@emeril.freedesktop.org>
References: <20200309183256.2590-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200309183256.2590-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgUGVyIGNs?=
 =?utf-8?q?ient_intel=5Fgpu=5Ftop?=
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Per client intel_gpu_top
URL   : https://patchwork.freedesktop.org/series/74465/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8106_full -> IGTPW_4283_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4283_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt}:
    - shard-hsw:          [DMESG-WARN][1] ([i915#478]) -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw4/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html

  
Known issues
------------

  Here are the changes found in IGTPW_4283_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs0-s3:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl1/igt@gem_ctx_isolation@vcs0-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-kbl1/igt@gem_ctx_isolation@vcs0-s3.html

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112080]) +11 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb1/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-iclb5/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_ctx_persistence@engines-mixed-process@vecs0:
    - shard-tglb:         [PASS][7] -> [FAIL][8] ([i915#679])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-tglb1/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-tglb3/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#110854])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb1/igt@gem_exec_balancer@smoke.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-iclb5/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276] / [i915#677]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#677]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#112146]) +4 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109276]) +12 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-hsw:          [PASS][19] -> [DMESG-WARN][20] ([fdo#111870])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw7/igt@gem_userptr_blits@dmabuf-unsync.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-hsw7/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-snb:          [PASS][21] -> [DMESG-WARN][22] ([fdo#111870] / [i915#478])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb4/igt@gem_userptr_blits@dmabuf-unsync.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-snb4/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][23] -> [DMESG-WARN][24] ([i915#716])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-glk5/igt@gen9_exec_parse@allowed-all.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-glk1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [PASS][25] -> [INCOMPLETE][26] ([i915#1390])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-tglb2/igt@i915_module_load@reload.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-tglb8/igt@i915_module_load@reload.html
    - shard-snb:          [PASS][27] -> [INCOMPLETE][28] ([i915#82])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb2/igt@i915_module_load@reload.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-snb5/igt@i915_module_load@reload.html
    - shard-iclb:         [PASS][29] -> [INCOMPLETE][30] ([i915#140])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb8/igt@i915_module_load@reload.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-iclb8/igt@i915_module_load@reload.html
    - shard-kbl:          [PASS][31] -> [INCOMPLETE][32] ([i915#1390])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl2/igt@i915_module_load@reload.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-kbl7/igt@i915_module_load@reload.html
    - shard-hsw:          [PASS][33] -> [INCOMPLETE][34] ([i915#1312] / [i915#61])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw5/igt@i915_module_load@reload.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-hsw5/igt@i915_module_load@reload.html
    - shard-glk:          [PASS][35] -> [INCOMPLETE][36] ([i915#1390] / [i915#58] / [k.org#198133])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-glk7/igt@i915_module_load@reload.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-glk5/igt@i915_module_load@reload.html
    - shard-apl:          [PASS][37] -> [INCOMPLETE][38] ([fdo#103927] / [i915#1390])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl6/igt@i915_module_load@reload.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-apl3/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-tglb:         [PASS][39] -> [SKIP][40] ([i915#1316])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-tglb7/igt@i915_pm_rpm@modeset-lpsp.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-tglb8/igt@i915_pm_rpm@modeset-lpsp.html
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([i915#1316])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb5/igt@i915_pm_rpm@modeset-lpsp.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-iclb3/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-apl:          [PASS][43] -> [FAIL][44] ([i915#129])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl3/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-apl3/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding:
    - shard-apl:          [PASS][45] -> [FAIL][46] ([i915#54]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html
    - shard-kbl:          [PASS][47] -> [FAIL][48] ([i915#54]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][49] -> [FAIL][50] ([i915#79])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-glk5/igt@kms_flip@flip-vs-expired-vblank.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-glk7/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [PASS][51] -> [DMESG-WARN][52] ([i915#180])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl8/igt@kms_flip@flip-vs-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-apl2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-apl:          [PASS][53] -> [FAIL][54] ([i915#49])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
    - shard-kbl:          [PASS][55] -> [FAIL][56] ([i915#49])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [PASS][57] -> [FAIL][58] ([i915#899])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][59] -> [SKIP][60] ([fdo#109642] / [fdo#111068])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-iclb4/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][61] -> [SKIP][62] ([fdo#109441]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-iclb6/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][63] -> [FAIL][64] ([i915#31])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl1/igt@kms_setmode@basic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-apl4/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl1/igt@gem_ctx_isolation@rcs0-s3.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@processes:
    - shard-kbl:          [FAIL][67] ([i915#570] / [i915#679]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl2/igt@gem_ctx_persistence@processes.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-kbl7/igt@gem_ctx_persistence@processes.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [FAIL][69] ([i915#1277]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-tglb1/igt@gem_exec_balancer@hang.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-tglb6/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [SKIP][71] ([i915#677]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-iclb6/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@implicit-both-bsd2:
    - shard-iclb:         [SKIP][73] ([fdo#109276] / [i915#677]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb7/igt@gem_exec_schedule@implicit-both-bsd2.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-iclb2/igt@gem_exec_schedule@implicit-both-bsd2.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][75] ([fdo#112146]) -> [PASS][76] +6 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-glk:          [DMESG-WARN][77] ([i915#118] / [i915#95]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-glk2/igt@gem_exec_whisper@basic-queues-forked.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-glk1/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@i915_suspend@sysfs-reader:
    - shard-snb:          [DMESG-WARN][79] ([i915#42]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb4/igt@i915_suspend@sysfs-reader.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-snb2/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen:
    - shard-apl:          [FAIL][81] ([i915#54]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][83] ([i915#79]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][85] ([i915#180] / [i915#56]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [INCOMPLETE][87] -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-x:
    - shard-hsw:          [DMESG-WARN][89] ([i915#478]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw7/igt@kms_plane_multiple@atomic-pipe-c-tiling-x.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-hsw5/igt@kms_plane_multiple@atomic-pipe-c-tiling-x.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][91] ([fdo#109642] / [fdo#111068]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb1/igt@kms_psr2_su@page_flip.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][93] ([fdo#109441]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb5/igt@kms_psr@psr2_dpms.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-iclb2/igt@kms_psr@psr2_dpms.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][95] ([i915#31]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl7/igt@kms_setmode@basic.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-kbl1/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][97] ([i915#180]) -> [PASS][98] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-apl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][99] ([fdo#112080]) -> [PASS][100] +12 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb7/igt@perf_pmu@busy-vcs1.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-iclb4/igt@perf_pmu@busy-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][101] ([fdo#109276]) -> [PASS][102] +18 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb5/igt@prime_busy@hang-bsd2.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-iclb4/igt@prime_busy@hang-bsd2.html

  * igt@prime_vgem@basic-gtt:
    - shard-snb:          [DMESG-WARN][103] ([i915#478]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb4/igt@prime_vgem@basic-gtt.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-snb4/igt@prime_vgem@basic-gtt.html

  
#### Warnings ####

  * igt@gem_linear_blits@normal:
    - shard-apl:          [TIMEOUT][105] ([i915#1322]) -> [TIMEOUT][106] ([fdo#111732] / [i915#1322])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl4/igt@gem_linear_blits@normal.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-apl8/igt@gem_linear_blits@normal.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][107] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][108] ([fdo#111870] / [i915#478])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-snb4/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-hsw:          [DMESG-WARN][109] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][110] ([fdo#111870])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw8/igt@gem_userptr_blits@dmabuf-sync.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-hsw5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_pm_rpm@fences:
    - shard-snb:          [INCOMPLETE][111] ([i915#82]) -> [SKIP][112] ([fdo#109271])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb4/igt@i915_pm_rpm@fences.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-snb2/igt@i915_pm_rpm@fences.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][113], [FAIL][114], [FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118], [FAIL][119], [FAIL][120], [FAIL][121]) ([fdo#111870]) -> ([FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125], [FAIL][126], [FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130]) ([fdo#111870] / [k.org#204565])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw1/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw1/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw4/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw7/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw8/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw4/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw5/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw4/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw7/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-hsw5/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-hsw7/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-hsw1/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-hsw8/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-hsw2/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-hsw5/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-hsw2/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-hsw5/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-hsw2/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][131], [FAIL][132]) ([i915#1389] / [i915#1402] / [i915#92]) -> ([FAIL][133], [FAIL][134], [FAIL][135]) ([i915#1389] / [i915#1402] / [i915#92] / [k.org#204565])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl7/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl4/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-kbl7/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-kbl4/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-kbl3/igt@runner@aborted.html
    - shard-apl:          ([FAIL][136], [FAIL][137]) ([fdo#103927] / [i915#1402]) -> ([FAIL][138], [FAIL][139]) ([i915#1402] / [k.org#204565])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl1/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl2/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-apl8/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-apl3/igt@runner@aborted.html
    - shard-glk:          [FAIL][140] ([i915#1402] / [k.org#202321]) -> ([FAIL][141], [FAIL][142], [FAIL][143]) ([i915#1402] / [k.org#202321] / [k.org#204565])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-glk6/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-glk2/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-glk1/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-glk5/igt@runner@aborted.html
    - shard-snb:          ([FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150], [FAIL][151], [FAIL][152]) ([fdo#111870] / [i915#1077]) -> ([FAIL][153], [FAIL][154], [FAIL][155], [FAIL][156], [FAIL][157], [FAIL][158], [FAIL][159], [FAIL][160], [FAIL][161]) ([fdo#111870] / [i915#1077] / [k.org#204565])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb6/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb4/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb6/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb2/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb5/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb5/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb6/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb6/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb4/igt@runner@aborted.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-snb6/igt@runner@aborted.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-snb5/igt@runner@aborted.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-snb6/igt@runner@aborted.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-snb4/igt@runner@aborted.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-snb4/igt@runner@aborted.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-snb4/igt@runner@aborted.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-snb4/igt@runner@aborted.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-snb6/igt@runner@aborted.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/shard-snb4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111732]: https://bugs.freedesktop.org/show_bug.cgi?id=111732
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#1312]: https://gitlab.freedesktop.org/drm/intel/issues/1312
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1322]: https://gitlab.freedesktop.org/drm/intel/issues/1322
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1390]: https://gitlab.freedesktop.org/drm/intel/issues/1390
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#56]: https://gitlab.freedesktop.org/drm/intel/issues/56
  [i915#570]: https://gitlab.freedesktop.org/drm/intel/issues/570
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321
  [k.org#204565]: https://bugzilla.kernel.org/show_bug.cgi?id=204565


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5504 -> IGTPW_4283
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8106: 5b0076e8066ea8218e7857ee1aa28b0670acde94 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4283: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/index.html
  IGT_5504: d6788bf0404f76b66170e18eb26c85004b5ccb25 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4283/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
