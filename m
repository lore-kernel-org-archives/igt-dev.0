Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 05 Mar 2020 02:30:52 -0000
Message-ID: <158337545242.17236.13905504777873651508@emeril.freedesktop.org>
References: <20200304092901.2347-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200304092901.2347-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/query=3A_Do_not_assert_engine_info_rsvd_being_zero?=
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

Series: tests/i915/query: Do not assert engine info rsvd being zero
URL   : https://patchwork.freedesktop.org/series/74250/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8062_full -> IGTPW_4253_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4253_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4253_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4253_full:

### IGT changes ###

#### Warnings ####

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][1], [FAIL][2], [FAIL][3], [FAIL][4], [FAIL][5], [FAIL][6]) ([fdo#111870] / [i915#226]) -> ([FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14]) ([fdo#111870])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw5/igt@runner@aborted.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw5/igt@runner@aborted.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw8/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw7/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw7/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw8/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-hsw5/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-hsw7/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-hsw6/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-hsw8/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-hsw1/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-hsw5/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-hsw8/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-hsw7/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4253_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-mixed-process@bcs0:
    - shard-glk:          [PASS][15] -> [INCOMPLETE][16] ([i915#1197] / [i915#58] / [k.org#198133])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-glk7/igt@gem_ctx_persistence@engines-mixed-process@bcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-glk1/igt@gem_ctx_persistence@engines-mixed-process@bcs0.html

  * igt@gem_ctx_persistence@engines-mixed-process@rcs0:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#679])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-glk7/igt@gem_ctx_persistence@engines-mixed-process@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-glk1/igt@gem_ctx_persistence@engines-mixed-process@rcs0.html

  * igt@gem_ctx_persistence@engines-mixed-process@vcs1:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#679])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-kbl1/igt@gem_ctx_persistence@engines-mixed-process@vcs1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-kbl6/igt@gem_ctx_persistence@engines-mixed-process@vcs1.html

  * igt@gem_ctx_persistence@engines-mixed-process@vecs0:
    - shard-kbl:          [PASS][21] -> [INCOMPLETE][22] ([fdo#103665] / [i915#1197])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-kbl1/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-kbl6/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109276] / [i915#677]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109276]) +16 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb2/igt@gem_exec_schedule@out-order-bsd2.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-iclb8/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#112146]) +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [PASS][29] -> [DMESG-WARN][30] ([fdo#111870])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw5/igt@gem_userptr_blits@sync-unmap-after-close.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-hsw8/igt@gem_userptr_blits@sync-unmap-after-close.html
    - shard-snb:          [PASS][31] -> [DMESG-WARN][32] ([fdo#111870] / [i915#478])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-snb4/igt@gem_userptr_blits@sync-unmap-after-close.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#54])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#54])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-glk7/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([i915#54])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][39] -> [FAIL][40] ([i915#96])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw5/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-hsw5/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_fence_pin_leak:
    - shard-hsw:          [PASS][41] -> [DMESG-WARN][42] ([i915#478])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw7/igt@kms_fence_pin_leak.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-hsw7/igt@kms_fence_pin_leak.html
    - shard-snb:          [PASS][43] -> [DMESG-WARN][44] ([i915#478])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-snb6/igt@kms_fence_pin_leak.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-snb4/igt@kms_fence_pin_leak.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][45] -> [SKIP][46] ([i915#433])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][47] -> [DMESG-WARN][48] ([i915#180]) +6 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][49] -> [FAIL][50] ([i915#899])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][51] -> [FAIL][52] ([i915#173])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb6/igt@kms_psr@no_drrs.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][53] -> [SKIP][54] ([fdo#109441])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-iclb6/igt@kms_psr@psr2_sprite_render.html

  * igt@perf_pmu@init-sema-vcs1:
    - shard-iclb:         [PASS][55] -> [SKIP][56] ([fdo#112080]) +7 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb1/igt@perf_pmu@init-sema-vcs1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-iclb5/igt@perf_pmu@init-sema-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@default:
    - shard-glk:          [FAIL][57] ([i915#679]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-glk5/igt@gem_ctx_persistence@legacy-engines-mixed-process@default.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-glk6/igt@gem_ctx_persistence@legacy-engines-mixed-process@default.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@render:
    - shard-glk:          [INCOMPLETE][59] ([i915#58] / [k.org#198133]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-glk5/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-glk6/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][61] ([fdo#110854]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb6/igt@gem_exec_balancer@smoke.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-iclb1/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-write-read-bsd2:
    - shard-iclb:         [SKIP][63] ([fdo#109276] / [i915#677]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb6/igt@gem_exec_schedule@implicit-write-read-bsd2.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-iclb1/igt@gem_exec_schedule@implicit-write-read-bsd2.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][65] ([i915#677]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-iclb5/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][67] ([fdo#109276]) -> [PASS][68] +12 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [SKIP][69] ([fdo#112146]) -> [PASS][70] +4 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb4/igt@gem_exec_schedule@wide-bsd.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-iclb5/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][71] ([i915#644]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-apl:          [FAIL][73] ([i915#644]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-hsw:          [DMESG-WARN][75] ([fdo#111870]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw8/igt@gem_userptr_blits@dmabuf-unsync.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-hsw7/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-snb:          [DMESG-WARN][77] ([fdo#111870] / [i915#478]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-snb2/igt@gem_userptr_blits@dmabuf-unsync.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-snb4/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +4 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-apl6/igt@gem_workarounds@suspend-resume-context.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-apl6/igt@gem_workarounds@suspend-resume-context.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][81] ([i915#180]) -> [PASS][82] +6 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][83] -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@fences:
    - shard-hsw:          [DMESG-WARN][85] ([i915#478]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-hsw5/igt@i915_pm_rpm@fences.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-hsw7/igt@i915_pm_rpm@fences.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-iclb:         [INCOMPLETE][87] ([i915#189]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb2/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-iclb4/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-glk:          [FAIL][89] ([i915#1119]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-glk9/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-glk7/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          [DMESG-WARN][91] ([i915#478]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [FAIL][93] ([fdo#103375]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_setmode@basic:
    - shard-glk:          [FAIL][95] ([i915#31]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-glk7/igt@kms_setmode@basic.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-glk4/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [SKIP][97] ([fdo#112080]) -> [PASS][98] +8 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb6/igt@perf_pmu@busy-check-all-vcs1.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-iclb1/igt@perf_pmu@busy-check-all-vcs1.html

  
#### Warnings ####

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [INCOMPLETE][99] -> [SKIP][100] ([i915#677])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb6/igt@gem_exec_schedule@pi-userfault-bsd.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-iclb4/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@pi-userfault-bsd2:
    - shard-iclb:         [INCOMPLETE][101] -> [SKIP][102] ([fdo#109276]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd2.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-iclb3/igt@gem_exec_schedule@pi-userfault-bsd2.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][103] -> [SKIP][104] ([i915#588])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][105], [FAIL][106], [FAIL][107], [FAIL][108], [FAIL][109], [FAIL][110]) ([fdo#111870] / [i915#1077] / [i915#698]) -> ([FAIL][111], [FAIL][112], [FAIL][113], [FAIL][114], [FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118]) ([fdo#111870] / [i915#1077])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-snb2/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-snb4/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-snb6/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-snb6/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-snb4/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8062/shard-snb4/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-snb6/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-snb2/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-snb6/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-snb4/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-snb5/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-snb4/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-snb4/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/shard-snb4/igt@runner@aborted.html

  
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1197]: https://gitlab.freedesktop.org/drm/intel/issues/1197
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#189]: https://gitlab.freedesktop.org/drm/intel/issues/189
  [i915#226]: https://gitlab.freedesktop.org/drm/intel/issues/226
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5490 -> IGTPW_4253
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8062: 9c57d926e26eb7f9ededcdf356aef74b135af03e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4253: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/index.html
  IGT_5490: f98b33cbd5b57bae52b8e2fae2039e89ac877822 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4253/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
