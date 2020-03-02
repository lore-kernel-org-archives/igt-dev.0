Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACE46E14C
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2020 08:49:05 +0000 (UTC)
Date: Mon, 2 Mar 2020 14:10:54 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <20200302084053.GD18198@intel.com>
References: <20200229170438.28820-1-anshuman.gupta@intel.com>
 <158312949426.30644.12139301633724338964@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158312949426.30644.12139301633724338964@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgREMgc3Rh?=
 =?utf-8?q?tes_IGT_misc_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, lakshminarayana.vudum@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-03-02 at 06:11:34 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: DC states IGT misc (rev4)
> URL   : https://patchwork.freedesktop.org/series/73509/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8036_full -> IGTPW_4241_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4241_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4241_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4241_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rpm@basic-rte:
>     - shard-glk:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-glk2/igt@i915_pm_rpm@basic-rte.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-glk6/igt@i915_pm_rpm@basic-rte.html
>     - shard-iclb:         [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb1/igt@i915_pm_rpm@basic-rte.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-iclb3/igt@i915_pm_rpm@basic-rte.html
>     - shard-tglb:         [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-tglb2/igt@i915_pm_rpm@basic-rte.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-tglb8/igt@i915_pm_rpm@basic-rte.html
>     - shard-hsw:          [PASS][7] -> [FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-hsw1/igt@i915_pm_rpm@basic-rte.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-hsw1/igt@i915_pm_rpm@basic-rte.html
> 
>  
Hi Lakshmi ,
Above failures occured for igt-series 
https://patchwork.freedesktop.org/series/73509/
These failures are not related to this series, do u have any info on these failures
whehter these are already known issue or something recently broken at i915 runtime suspend.

Hi Jose ,
Cosidering the CI results of rev3 https://patchwork.freedesktop.org/series/73509/#rev3
this series looks ok to merge, as rev4 has just cosmetic changes to remove global var.
Thanks,
Anshuman Gupta.
> #### Warnings ####
> 
>   * igt@i915_pm_dc@dc3co-vpb-simulation:
>     - shard-iclb:         [SKIP][9] ([i915#588]) -> [SKIP][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-iclb7/igt@i915_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@i915_pm_dc@dc6-dpms:
>     - shard-kbl:          [SKIP][11] ([fdo#109271]) -> [FAIL][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-kbl6/igt@i915_pm_dc@dc6-dpms.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html
> 
>   * igt@i915_pm_dc@dc6-psr:
>     - shard-tglb:         [FAIL][13] ([i915#454]) -> [FAIL][14] +1 similar issue
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-tglb3/igt@i915_pm_dc@dc6-psr.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-tglb5/igt@i915_pm_dc@dc6-psr.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_4241_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_ctx_shared@exec-shared-gtt-bsd2:
>     - shard-tglb:         [PASS][15] -> [FAIL][16] ([i915#616])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-tglb1/igt@gem_ctx_shared@exec-shared-gtt-bsd2.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-tglb8/igt@gem_ctx_shared@exec-shared-gtt-bsd2.html
> 
>   * igt@gem_exec_schedule@implicit-both-bsd:
>     - shard-iclb:         [PASS][17] -> [SKIP][18] ([i915#677]) +1 similar issue
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb5/igt@gem_exec_schedule@implicit-both-bsd.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd.html
> 
>   * igt@gem_exec_schedule@implicit-both-bsd2:
>     - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109276] / [i915#677])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb2/igt@gem_exec_schedule@implicit-both-bsd2.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-iclb5/igt@gem_exec_schedule@implicit-both-bsd2.html
> 
>   * igt@gem_exec_schedule@preempt-queue-bsd1:
>     - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#109276]) +21 similar issues
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-iclb7/igt@gem_exec_schedule@preempt-queue-bsd1.html
> 
>   * igt@gem_exec_schedule@preemptive-hang-bsd:
>     - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#112146]) +5 similar issues
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
> 
>   * igt@gem_exec_whisper@basic-fds-forked:
>     - shard-tglb:         [PASS][25] -> [INCOMPLETE][26] ([i915#1318])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-tglb2/igt@gem_exec_whisper@basic-fds-forked.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-tglb7/igt@gem_exec_whisper@basic-fds-forked.html
> 
>   * igt@gem_partial_pwrite_pread@write:
>     - shard-hsw:          [PASS][27] -> [DMESG-WARN][28] ([fdo#110789] / [i915#478])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-hsw7/igt@gem_partial_pwrite_pread@write.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-hsw7/igt@gem_partial_pwrite_pread@write.html
> 
>   * igt@gem_workarounds@suspend-resume-fd:
>     - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +3 similar issues
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html
> 
>   * igt@i915_suspend@debugfs-reader:
>     - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-apl3/igt@i915_suspend@debugfs-reader.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-apl1/igt@i915_suspend@debugfs-reader.html
> 
>   * igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen:
>     - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#54])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
>     - shard-tglb:         [PASS][35] -> [SKIP][36] ([i915#668])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-tglb1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-tglb5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html
> 
>   * igt@kms_psr@psr2_primary_page_flip:
>     - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +1 similar issue
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html
> 
>   * igt@kms_setmode@basic:
>     - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#31])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-apl1/igt@kms_setmode@basic.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-apl3/igt@kms_setmode@basic.html
>     - shard-hsw:          [PASS][41] -> [FAIL][42] ([i915#31])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-hsw7/igt@kms_setmode@basic.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-hsw5/igt@kms_setmode@basic.html
> 
>   * igt@perf_pmu@init-busy-vcs1:
>     - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#112080]) +13 similar issues
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb2/igt@perf_pmu@init-busy-vcs1.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-iclb8/igt@perf_pmu@init-busy-vcs1.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_ctx_isolation@vcs1-dirty-create:
>     - shard-iclb:         [SKIP][45] ([fdo#112080]) -> [PASS][46] +7 similar issues
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb5/igt@gem_ctx_isolation@vcs1-dirty-create.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-iclb2/igt@gem_ctx_isolation@vcs1-dirty-create.html
> 
>   * igt@gem_exec_schedule@implicit-read-write-bsd1:
>     - shard-iclb:         [SKIP][47] ([fdo#109276] / [i915#677]) -> [PASS][48]
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb3/igt@gem_exec_schedule@implicit-read-write-bsd1.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd1.html
> 
>   * igt@gem_exec_schedule@preempt-contexts-bsd2:
>     - shard-iclb:         [SKIP][49] ([fdo#109276]) -> [PASS][50] +17 similar issues
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb5/igt@gem_exec_schedule@preempt-contexts-bsd2.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-iclb1/igt@gem_exec_schedule@preempt-contexts-bsd2.html
> 
>   * igt@gem_exec_schedule@reorder-wide-bsd:
>     - shard-iclb:         [SKIP][51] ([fdo#112146]) -> [PASS][52] +2 similar issues
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb1/igt@gem_exec_schedule@reorder-wide-bsd.html
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-iclb8/igt@gem_exec_schedule@reorder-wide-bsd.html
> 
>   * igt@gem_ppgtt@flink-and-close-vma-leak:
>     - shard-glk:          [FAIL][53] ([i915#644]) -> [PASS][54]
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html
> 
>   * igt@gem_userptr_blits@sync-unmap:
>     - shard-hsw:          [DMESG-WARN][55] ([fdo#111870]) -> [PASS][56]
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-hsw5/igt@gem_userptr_blits@sync-unmap.html
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-hsw7/igt@gem_userptr_blits@sync-unmap.html
> 
>   * igt@gem_workarounds@suspend-resume-context:
>     - shard-apl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +3 similar issues
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-apl1/igt@gem_workarounds@suspend-resume-context.html
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-apl1/igt@gem_workarounds@suspend-resume-context.html
> 
>   * igt@i915_pm_dc@dc5-dpms:
>     - shard-apl:          [SKIP][59] ([fdo#109271]) -> [PASS][60]
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-apl2/igt@i915_pm_dc@dc5-dpms.html
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-apl8/igt@i915_pm_dc@dc5-dpms.html
>     - shard-kbl:          [SKIP][61] ([fdo#109271]) -> [PASS][62]
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-kbl7/igt@i915_pm_dc@dc5-dpms.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-kbl2/igt@i915_pm_dc@dc5-dpms.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress:
>     - shard-glk:          [SKIP][63] ([fdo#109271]) -> [PASS][64] +1 similar issue
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-glk4/igt@i915_pm_rpm@gem-execbuf-stress.html
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-glk8/igt@i915_pm_rpm@gem-execbuf-stress.html
>     - shard-tglb:         [SKIP][65] ([i915#1316]) -> [PASS][66]
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-tglb1/igt@i915_pm_rpm@gem-execbuf-stress.html
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-tglb1/igt@i915_pm_rpm@gem-execbuf-stress.html
>     - shard-hsw:          [SKIP][67] ([fdo#109271]) -> [PASS][68]
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-hsw4/igt@i915_pm_rpm@gem-execbuf-stress.html
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-hsw5/igt@i915_pm_rpm@gem-execbuf-stress.html
>     - shard-iclb:         [SKIP][69] ([i915#1316]) -> [PASS][70]
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb6/igt@i915_pm_rpm@gem-execbuf-stress.html
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-iclb2/igt@i915_pm_rpm@gem-execbuf-stress.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-tglb:         [FAIL][71] ([i915#413]) -> [PASS][72]
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-tglb7/igt@i915_pm_rps@reset.html
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-tglb8/igt@i915_pm_rps@reset.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - shard-iclb:         [INCOMPLETE][73] ([fdo#108569]) -> [PASS][74]
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb5/igt@i915_selftest@live@hangcheck.html
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-iclb6/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-suspend:
>     - shard-kbl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76] +5 similar issues
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-snb:          [DMESG-WARN][77] ([i915#42]) -> [PASS][78]
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-snb4/igt@kms_flip@flip-vs-suspend.html
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-snb6/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
>     - shard-tglb:         [SKIP][79] ([i915#668]) -> [PASS][80] +3 similar issues
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_psr@psr2_sprite_blt:
>     - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82] +1 similar issue
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-iclb3/igt@kms_psr@psr2_sprite_blt.html
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
> 
>   * igt@kms_universal_plane@universal-plane-pipe-c-functional:
>     - shard-glk:          [FAIL][83] ([i915#331]) -> [PASS][84]
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-glk5/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-glk5/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
>     - shard-kbl:          [FAIL][85] ([i915#331]) -> [PASS][86]
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-kbl3/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-kbl2/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
>     - shard-apl:          [FAIL][87] ([i915#331]) -> [PASS][88]
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-apl3/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-apl1/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
> 
>   * igt@perf@gen12-mi-rpc:
>     - shard-tglb:         [FAIL][89] ([i915#1085]) -> [PASS][90]
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-tglb7/igt@perf@gen12-mi-rpc.html
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-tglb5/igt@perf@gen12-mi-rpc.html
> 
>   * {igt@perf@stress-open-close}:
>     - shard-kbl:          [INCOMPLETE][91] ([fdo#103665]) -> [PASS][92]
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-kbl6/igt@perf@stress-open-close.html
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-kbl6/igt@perf@stress-open-close.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@srm:
>     - shard-apl:          [TIMEOUT][93] ([i915#1319]) -> [FAIL][94] ([fdo#110321])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8036/shard-apl4/igt@kms_content_protection@srm.html
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/shard-apl2/igt@kms_content_protection@srm.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
>   [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
>   [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
>   [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
>   [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
>   [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
>   [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
>   [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
>   [i915#1318]: https://gitlab.freedesktop.org/drm/intel/issues/1318
>   [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
>   [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
>   [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
>   [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
>   [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
>   [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
>   [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
>   [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
>   [i915#616]: https://gitlab.freedesktop.org/drm/intel/issues/616
>   [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
>   [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
>   [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
> 
> 
> Participating hosts (10 -> 8)
> ------------------------------
> 
>   Missing    (2): pig-skl-6260u pig-glk-j5005 
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5480 -> IGTPW_4241
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_8036: 0f36a1b338da9019bde23189927497551256a90c @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_4241: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/index.html
>   IGT_5480: 13dbe276f21d75a42795567973b9303112bd7c5d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4241/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
