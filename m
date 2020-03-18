Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 18 Mar 2020 07:15:56 -0000
Message-ID: <158451575615.25100.17148065689540140143@emeril.freedesktop.org>
References: <20200318004659.236341-1-lyude@redhat.com>
In-Reply-To: <20200318004659.236341-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=3A_Generate_reference_CRCs_for_partial_coverage_too?=
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
To: Lyude Paul <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_plane: Generate reference CRCs for partial coverage too
URL   : https://patchwork.freedesktop.org/series/74806/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8145_full -> IGTPW_4315_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/index.html

Known issues
------------

  Here are the changes found in IGTPW_4315_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [PASS][1] -> [FAIL][2] ([i915#1277])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-tglb1/igt@gem_exec_balancer@hang.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-tglb5/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-hsw:          [PASS][3] -> [DMESG-WARN][4] ([i915#478])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-hsw1/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-hsw5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
    - shard-snb:          [PASS][5] -> [DMESG-WARN][6] ([i915#478])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-snb6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-snb2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_schedule@implicit-both-bsd2:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276] / [i915#677]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-iclb3/igt@gem_exec_schedule@implicit-both-bsd2.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +10 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-iclb4/igt@gem_exec_schedule@out-order-bsd2.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-iclb7/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +6 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-iclb5/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([i915#1316])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-iclb4/igt@i915_pm_rpm@gem-execbuf.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-iclb3/igt@i915_pm_rpm@gem-execbuf.html
    - shard-glk:          [PASS][17] -> [SKIP][18] ([fdo#109271]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-glk9/igt@i915_pm_rpm@gem-execbuf.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-glk1/igt@i915_pm_rpm@gem-execbuf.html
    - shard-tglb:         [PASS][19] -> [SKIP][20] ([i915#1316])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-tglb8/igt@i915_pm_rpm@gem-execbuf.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-tglb5/igt@i915_pm_rpm@gem-execbuf.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#54])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding.html

  * igt@kms_flip@basic-plain-flip:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#1297])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-apl8/igt@kms_flip@basic-plain-flip.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-apl7/igt@kms_flip@basic-plain-flip.html
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#1297])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-kbl3/igt@kms_flip@basic-plain-flip.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-kbl6/igt@kms_flip@basic-plain-flip.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109642] / [fdo#111068])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-iclb4/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][31] -> [FAIL][32] ([i915#173])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-iclb3/igt@kms_psr@no_drrs.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-iclb2/igt@kms_psr@psr2_basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-iclb6/igt@kms_psr@psr2_basic.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#31])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-apl8/igt@kms_setmode@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-apl2/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109278])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-iclb1/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-iclb3/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html
    - shard-hsw:          [PASS][39] -> [SKIP][40] ([fdo#109271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-hsw1/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-hsw1/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html
    - shard-tglb:         [PASS][41] -> [SKIP][42] ([fdo#112015])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-tglb6/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-tglb5/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][43] -> [FAIL][44] ([i915#1085])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-tglb2/igt@perf@gen12-mi-rpc.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-tglb3/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#112080]) +12 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-iclb3/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [SKIP][47] ([fdo#112080]) -> [PASS][48] +10 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-iclb8/igt@gem_ctx_isolation@vcs1-none.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-iclb4/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-apl:          [INCOMPLETE][49] ([fdo#103927] / [i915#1402]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-apl4/igt@gem_ctx_persistence@close-replace-race.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-apl8/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][51] ([fdo#110841]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][53] ([fdo#110854]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-iclb7/igt@gem_exec_balancer@smoke.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-iclb1/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][55] ([i915#677]) -> [PASS][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][57] ([fdo#109276]) -> [PASS][58] +19 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [SKIP][59] ([fdo#112146]) -> [PASS][60] +5 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-iclb2/igt@gem_exec_schedule@wide-bsd.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-iclb3/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-hsw:          [DMESG-WARN][61] ([fdo#111870]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-hsw6/igt@gem_userptr_blits@dmabuf-unsync.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-hsw5/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-snb:          [DMESG-WARN][63] ([fdo#111870] / [i915#478]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-snb2/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +4 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_rpm@fences-dpms:
    - shard-tglb:         [SKIP][67] ([i915#1316]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-tglb5/igt@i915_pm_rpm@fences-dpms.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-tglb8/igt@i915_pm_rpm@fences-dpms.html
    - shard-iclb:         [SKIP][69] ([i915#1316]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-iclb2/igt@i915_pm_rpm@fences-dpms.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-iclb1/igt@i915_pm_rpm@fences-dpms.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][71] ([i915#413]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-iclb7/igt@i915_pm_rps@waitboost.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-iclb6/igt@i915_pm_rps@waitboost.html

  * igt@kms_color@pipe-a-legacy-gamma:
    - shard-apl:          [FAIL][73] ([fdo#108145] / [i915#71]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-apl8/igt@kms_color@pipe-a-legacy-gamma.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-apl8/igt@kms_color@pipe-a-legacy-gamma.html
    - shard-kbl:          [FAIL][75] ([fdo#108145] / [i915#71]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-kbl2/igt@kms_color@pipe-a-legacy-gamma.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-kbl4/igt@kms_color@pipe-a-legacy-gamma.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-iclb:         [INCOMPLETE][79] ([i915#1185] / [i915#250]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-iclb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82] +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-iclb6/igt@kms_psr@psr2_cursor_plane_onoff.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_vblank@pipe-d-ts-continuation-modeset-rpm:
    - shard-tglb:         [SKIP][83] ([fdo#112015]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-tglb5/igt@kms_vblank@pipe-d-ts-continuation-modeset-rpm.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-tglb5/igt@kms_vblank@pipe-d-ts-continuation-modeset-rpm.html

  * igt@perf@low-oa-exponent-permissions:
    - shard-tglb:         [SKIP][85] -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-tglb5/igt@perf@low-oa-exponent-permissions.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-tglb7/igt@perf@low-oa-exponent-permissions.html
    - shard-iclb:         [SKIP][87] -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-iclb2/igt@perf@low-oa-exponent-permissions.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-iclb2/igt@perf@low-oa-exponent-permissions.html

  * igt@perf_pmu@rc6-runtime-pm:
    - shard-glk:          [SKIP][89] ([fdo#109271]) -> [PASS][90] +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-glk7/igt@perf_pmu@rc6-runtime-pm.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-glk7/igt@perf_pmu@rc6-runtime-pm.html
    - shard-tglb:         [SKIP][91] ([fdo#111719]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-tglb5/igt@perf_pmu@rc6-runtime-pm.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-tglb2/igt@perf_pmu@rc6-runtime-pm.html
    - shard-hsw:          [SKIP][93] ([fdo#109271]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-hsw5/igt@perf_pmu@rc6-runtime-pm.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-hsw5/igt@perf_pmu@rc6-runtime-pm.html
    - shard-iclb:         [SKIP][95] ([i915#293]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-iclb2/igt@perf_pmu@rc6-runtime-pm.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-iclb6/igt@perf_pmu@rc6-runtime-pm.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][97] ([i915#658]) -> [SKIP][98] ([i915#588])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-snb:          [INCOMPLETE][99] ([i915#82]) -> [SKIP][100] ([fdo#109271])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-snb4/igt@i915_pm_dc@dc5-psr.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-snb5/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][101] ([i915#454]) -> [SKIP][102] ([i915#468])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-tglb3/igt@i915_pm_dc@dc6-psr.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-iclb:         [SKIP][103] ([fdo#109293] / [fdo#109506]) -> [SKIP][104] ([i915#1316])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-iclb8/igt@i915_pm_rpm@pc8-residency.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-iclb3/igt@i915_pm_rpm@pc8-residency.html
    - shard-tglb:         [SKIP][105] ([fdo#109506]) -> [SKIP][106] ([i915#1316])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-tglb7/igt@i915_pm_rpm@pc8-residency.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-tglb5/igt@i915_pm_rpm@pc8-residency.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][107], [FAIL][108]) ([fdo#103927] / [i915#1402]) -> [FAIL][109] ([fdo#103927])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-apl4/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/shard-apl3/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/shard-apl4/igt@runner@aborted.html

  
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#293]: https://gitlab.freedesktop.org/drm/intel/issues/293
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5518 -> IGTPW_4315
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8145: 5e893da0b8c2bfec015c5eaa7981e1ffab1d7c9c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4315: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/index.html
  IGT_5518: ee05a571255783837b18d626c4dff6cd9613cee2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4315/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
