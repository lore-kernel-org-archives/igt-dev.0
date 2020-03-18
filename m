Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 18 Mar 2020 19:04:28 -0000
Message-ID: <158455826849.25102.1148614315378850083@emeril.freedesktop.org>
References: <20200318144102.19377-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200318144102.19377-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdC9r?=
 =?utf-8?q?ms=3A_Use_bare_number_of_crtc_index_to_get_a_pipe_=28rev2=29?=
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

Series: test/kms: Use bare number of crtc index to get a pipe (rev2)
URL   : https://patchwork.freedesktop.org/series/74833/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8148_full -> IGTPW_4321_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4321_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4321_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4321_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-iclb:         [PASS][1] -> [CRASH][2] +19 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-iclb2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-iclb7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_color@pipe-c-ctm-0-5:
    - shard-glk:          [PASS][3] -> [CRASH][4] +6 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-glk3/igt@kms_color@pipe-c-ctm-0-5.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-glk7/igt@kms_color@pipe-c-ctm-0-5.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [PASS][5] -> [CRASH][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-kbl1/igt@kms_mmap_write_crc@main.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-kbl1/igt@kms_mmap_write_crc@main.html

  * igt@kms_universal_plane@universal-plane-pipe-b-functional:
    - shard-hsw:          [PASS][7] -> [CRASH][8] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-hsw1/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-hsw1/igt@kms_universal_plane@universal-plane-pipe-b-functional.html

  * igt@kms_universal_plane@universal-plane-pipe-b-sanity:
    - shard-tglb:         [PASS][9] -> [CRASH][10] +31 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-tglb8/igt@kms_universal_plane@universal-plane-pipe-b-sanity.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-tglb5/igt@kms_universal_plane@universal-plane-pipe-b-sanity.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-glk:          [TIMEOUT][11] ([i915#1320]) -> [CRASH][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-glk8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-glk1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-iclb:         [SKIP][13] ([fdo#110725] / [fdo#111614]) -> [CRASH][14] +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-iclb8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-iclb1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-tglb:         [SKIP][15] ([fdo#111614]) -> [CRASH][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-tglb6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-tglb5/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:
    - shard-iclb:         [SKIP][17] ([fdo#109278]) -> [CRASH][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-iclb3/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-iclb1/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html

  
Known issues
------------

  Here are the changes found in IGTPW_4321_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#112080]) +13 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-iclb2/igt@gem_busy@busy-vcs1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-iclb6/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [PASS][21] -> [INCOMPLETE][22] ([i915#1402])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-kbl6/igt@gem_ctx_persistence@close-replace-race.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-kbl3/igt@gem_ctx_persistence@close-replace-race.html
    - shard-apl:          [PASS][23] -> [INCOMPLETE][24] ([fdo#103927] / [i915#1402])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-apl4/igt@gem_ctx_persistence@close-replace-race.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-apl1/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([i915#677]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-iclb3/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-chain-bsd:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#112146]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-iclb3/igt@gem_exec_schedule@preempt-queue-chain-bsd.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-iclb2/igt@gem_exec_schedule@preempt-queue-chain-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#644])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#644])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-kbl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_selftest@live@execlists:
    - shard-apl:          [PASS][33] -> [INCOMPLETE][34] ([fdo#103927] / [i915#656])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-apl2/igt@i915_selftest@live@execlists.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-apl4/igt@i915_selftest@live@execlists.html

  * igt@kms_color@pipe-b-ctm-max:
    - shard-iclb:         [PASS][35] -> [CRASH][36] ([i915#1149])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-iclb5/igt@kms_color@pipe-b-ctm-max.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-iclb7/igt@kms_color@pipe-b-ctm-max.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][39] -> [FAIL][40] ([i915#72])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][41] -> [FAIL][42] ([i915#57])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-hsw5/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-hsw5/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109349])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-iclb3/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][45] -> [DMESG-WARN][46] ([i915#180]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][47] -> [FAIL][48] ([i915#899])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#109441]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109276]) +17 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-iclb2/igt@prime_busy@hang-bsd2.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-iclb6/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-apl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-apl6/igt@gem_ctx_isolation@rcs0-s3.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-apl1/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][55] ([fdo#110841]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@implicit-both-bsd2:
    - shard-iclb:         [SKIP][57] ([fdo#109276] / [i915#677]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-iclb8/igt@gem_exec_schedule@implicit-both-bsd2.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd1:
    - shard-iclb:         [SKIP][59] ([fdo#109276]) -> [PASS][60] +9 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-iclb3/igt@gem_exec_schedule@pi-common-bsd1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][61] ([i915#677]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][63] ([fdo#112146]) -> [PASS][64] +5 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-iclb5/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][65] ([fdo#111870] / [i915#478]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-snb4/igt@gem_userptr_blits@dmabuf-sync.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-hsw:          [DMESG-WARN][67] ([fdo#111870]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-hsw1/igt@gem_userptr_blits@dmabuf-sync.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-hsw5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [DMESG-WARN][69] ([i915#180]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-kbl6/igt@gem_workarounds@suspend-resume-context.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-kbl3/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-kbl:          [INCOMPLETE][71] ([i915#151] / [i915#155]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-kbl3/igt@i915_pm_rpm@system-suspend-modeset.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-kbl7/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [FAIL][73] ([i915#79]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-glk5/igt@kms_flip@flip-vs-expired-vblank.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-glk3/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][75] ([fdo#109642] / [fdo#111068]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-iclb8/igt@kms_psr2_su@page_flip.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][77] ([fdo#109441]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-iclb6/igt@kms_psr@psr2_primary_page_flip.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:
    - shard-tglb:         [SKIP][79] ([fdo#112015]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-tglb8/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-hsw:          [SKIP][81] ([fdo#109271]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-hsw2/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-hsw2/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-glk:          [SKIP][83] ([fdo#109271]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-glk4/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-glk2/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [SKIP][85] ([fdo#112080]) -> [PASS][86] +10 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-iclb3/igt@perf_pmu@busy-check-all-vcs1.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-iclb2/igt@perf_pmu@busy-check-all-vcs1.html

  
#### Warnings ####

  * igt@kms_color@pipe-c-ctm-0-75:
    - shard-tglb:         [FAIL][87] ([i915#1149] / [i915#315]) -> [CRASH][88] ([i915#1149]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-tglb2/igt@kms_color@pipe-c-ctm-0-75.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-tglb1/igt@kms_color@pipe-c-ctm-0-75.html
    - shard-iclb:         [FAIL][89] ([i915#1149] / [i915#315]) -> [CRASH][90] ([i915#1149])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-iclb6/igt@kms_color@pipe-c-ctm-0-75.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-iclb7/igt@kms_color@pipe-c-ctm-0-75.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][91] ([i915#92]) -> ([FAIL][92], [FAIL][93]) ([i915#1389] / [i915#1402] / [i915#92])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-kbl3/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-kbl3/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-kbl4/igt@runner@aborted.html
    - shard-apl:          [FAIL][94] ([fdo#103927]) -> ([FAIL][95], [FAIL][96], [FAIL][97]) ([fdo#103927] / [i915#1402] / [i915#529])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8148/shard-apl8/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-apl1/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-apl4/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/shard-apl8/igt@runner@aborted.html

  
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1320]: https://gitlab.freedesktop.org/drm/intel/issues/1320
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5522 -> IGTPW_4321
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8148: 461a6f2c7c0296c282114ac8c0e63536e9f7d095 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4321: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/index.html
  IGT_5522: bd2b01af69c9720d54e68a8702a23e4ff3637746 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4321/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
