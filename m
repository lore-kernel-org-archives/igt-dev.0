Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 09 Mar 2020 15:13:47 -0000
Message-ID: <158376682727.9451.3062876816043486720@emeril.freedesktop.org>
References: <1583719347-32199-1-git-send-email-kunal1.joshi@intel.com>
In-Reply-To: <1583719347-32199-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fchamelium=3A_Add_support_to_validate_RGB/YUV_pixel_format?=
 =?utf-8?q?s_=28rev2=29?=
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_chamelium: Add support to validate RGB/YUV pixel formats (rev2)
URL   : https://patchwork.freedesktop.org/series/74368/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8093_full -> IGTPW_4278_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4278_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4278_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4278_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_chamelium@hdmi-crc-nonplanar-formats} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-tglb7/igt@kms_chamelium@hdmi-crc-nonplanar-formats.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt}:
    - shard-hsw:          NOTRUN -> [DMESG-WARN][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-hsw8/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8093_full and IGTPW_4278_full:

### New IGT tests (2) ###

  * igt@kms_chamelium@hdmi-cmp-planar-formats:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium@hdmi-crc-nonplanar-formats:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4278_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112080]) +15 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-iclb5/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110841])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@implicit-write-read-bsd2:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276] / [i915#677])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb4/igt@gem_exec_schedule@implicit-write-read-bsd2.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-iclb7/igt@gem_exec_schedule@implicit-write-read-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +6 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#109276]) +18 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-iclb7/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#644])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#716])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-glk4/igt@gen9_exec_parse@allowed-all.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-glk9/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-iclb:         [PASS][21] -> [FAIL][22] ([i915#370])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb5/igt@i915_pm_rps@min-max-config-loaded.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-iclb4/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing:
    - shard-snb:          [PASS][23] -> [SKIP][24] ([fdo#109271]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-snb2/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-snb6/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#407])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-glk2/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-glk1/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109642] / [fdo#111068])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-iclb8/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-iclb5/igt@kms_psr@psr2_cursor_plane_onoff.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [SKIP][35] ([fdo#112080]) -> [PASS][36] +8 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb5/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-iclb1/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [INCOMPLETE][37] ([fdo#103665]) -> [PASS][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-kbl1/igt@gem_ctx_persistence@close-replace-race.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-kbl1/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][39] ([fdo#110854]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb7/igt@gem_exec_balancer@smoke.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-iclb4/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][41] ([fdo#109276] / [i915#677]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][43] ([i915#677]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-iclb7/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][45] ([fdo#112146]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-iclb8/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][47] ([i915#644]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-tglb:         [FAIL][49] ([i915#644]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-tglb7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-tglb6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rpm@fences:
    - shard-tglb:         [SKIP][51] ([i915#1316]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-tglb7/igt@i915_pm_rpm@fences.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-tglb8/igt@i915_pm_rpm@fences.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-iclb:         [SKIP][53] ([i915#1316]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb4/igt@i915_pm_rpm@system-suspend-execbuf.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-iclb6/igt@i915_pm_rpm@system-suspend-execbuf.html
    - shard-hsw:          [SKIP][55] ([fdo#109271]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-hsw4/igt@i915_pm_rpm@system-suspend-execbuf.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-hsw4/igt@i915_pm_rpm@system-suspend-execbuf.html
    - shard-glk:          [SKIP][57] ([fdo#109271]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-glk4/igt@i915_pm_rpm@system-suspend-execbuf.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-glk8/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][59] ([i915#413]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb4/igt@i915_pm_rps@reset.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-iclb8/igt@i915_pm_rps@reset.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62] +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [FAIL][63] ([i915#96]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-kbl:          [DMESG-WARN][65] ([i915#1297]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-kbl2/igt@kms_flip@absolute-wf_vblank.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-kbl6/igt@kms_flip@absolute-wf_vblank.html
    - shard-apl:          [DMESG-WARN][67] ([i915#1297]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-apl8/igt@kms_flip@absolute-wf_vblank.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-apl4/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@modeset-vs-vblank-race:
    - shard-apl:          [FAIL][69] ([i915#407]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-apl3/igt@kms_flip@modeset-vs-vblank-race.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-apl3/igt@kms_flip@modeset-vs-vblank-race.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-kbl:          [FAIL][71] ([i915#34]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-kbl3/igt@kms_flip@plain-flip-fb-recreate.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-kbl3/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +4 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][75] ([i915#899]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][77] ([fdo#109441]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb5/igt@kms_psr@psr2_no_drrs.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][79] ([fdo#109276]) -> [PASS][80] +17 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb3/igt@prime_busy@hang-bsd2.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-iclb1/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-apl:          [TIMEOUT][81] ([i915#1340]) -> [INCOMPLETE][82] ([fdo#103927] / [i915#1402])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-apl2/igt@gem_ctx_persistence@close-replace-race.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-apl1/igt@gem_ctx_persistence@close-replace-race.html
    - shard-glk:          [INCOMPLETE][83] ([i915#58] / [k.org#198133]) -> [INCOMPLETE][84] ([i915#1402] / [i915#58] / [k.org#198133])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-glk5/igt@gem_ctx_persistence@close-replace-race.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-glk3/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_linear_blits@normal:
    - shard-apl:          [TIMEOUT][85] ([fdo#111732]) -> [TIMEOUT][86] ([fdo#111732] / [i915#1322])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-apl4/igt@gem_linear_blits@normal.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-apl6/igt@gem_linear_blits@normal.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-kbl:          [INCOMPLETE][87] ([fdo#103665] / [i915#879]) -> [INCOMPLETE][88] ([i915#879])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-kbl3/igt@i915_module_load@reload-with-fault-injection.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-kbl4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][89] ([i915#468]) -> [FAIL][90] ([i915#454])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-tglb7/igt@i915_pm_dc@dc6-psr.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][91], [FAIL][92]) ([i915#1389] / [i915#92]) -> [FAIL][93] ([i915#92])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-kbl3/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-kbl1/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-kbl4/igt@runner@aborted.html
    - shard-apl:          [FAIL][94] ([fdo#103927]) -> ([FAIL][95], [FAIL][96]) ([fdo#103927] / [i915#1402])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-apl2/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-apl2/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-apl1/igt@runner@aborted.html
    - shard-glk:          [FAIL][97] ([k.org#202321]) -> ([FAIL][98], [FAIL][99]) ([i915#1402] / [k.org#202321])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-glk5/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-glk3/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-glk9/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111732]: https://bugs.freedesktop.org/show_bug.cgi?id=111732
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1322]: https://gitlab.freedesktop.org/drm/intel/issues/1322
  [i915#1340]: https://gitlab.freedesktop.org/drm/intel/issues/1340
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#370]: https://gitlab.freedesktop.org/drm/intel/issues/370
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#879]: https://gitlab.freedesktop.org/drm/intel/issues/879
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5499 -> IGTPW_4278
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8093: 0d201b03b62aacbd13fd104a371bd45ee2060277 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4278: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/index.html
  IGT_5499: 2e23cf6f63fc6ba1d9543f8327698d6f21813cec @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
