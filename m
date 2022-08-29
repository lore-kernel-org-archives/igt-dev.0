Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53F610EE24
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Aug 2022 08:27:18 +0000 (UTC)
Date: Mon, 29 Aug 2022 10:27:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Ywx4YjTvo8Mbz0+/@kamilkon-desk1>
References: <20220823095645.14580-1-kamil.konieczny@linux.intel.com>
 <166130728014.9871.10026038487670347470@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <166130728014.9871.10026038487670347470@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9p?=
 =?utf-8?q?915=5Fhangman=3A_fail_only_after_freeing_spinners_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tejasree Illipilli <tejasreex.illipilli@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2022-08-24 at 02:14:40 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: i915/i915_hangman: fail only after freeing spinners (rev3)
> URL   : https://patchwork.freedesktop.org/series/106946/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_12014_full -> IGTPW_7670_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_7670_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_7670_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/index.html
> 
> Participating hosts (13 -> 9)
> ------------------------------
> 
>   Missing    (4): pig-skl-6260u pig-kbl-iris shard-dg1 pig-glk-j5005 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_7670_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_eio@suspend:
>     - shard-iclb:         NOTRUN -> [INCOMPLETE][1] +1 similar issue
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb7/igt@gem_eio@suspend.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-glk6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
> 

These are unrelated to changes in i915_hangman,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_7670_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@crc32:
>     - shard-iclb:         NOTRUN -> [SKIP][3] ([i915#6230])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb6/igt@api_intel_bb@crc32.html
> 
>   * igt@feature_discovery@display-2x:
>     - shard-iclb:         NOTRUN -> [SKIP][4] ([i915#1839]) +1 similar issue
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb5/igt@feature_discovery@display-2x.html
> 
>   * igt@gem_ccs@ctrl-surf-copy:
>     - shard-iclb:         NOTRUN -> [SKIP][5] ([i915#5327]) +1 similar issue
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb6/igt@gem_ccs@ctrl-surf-copy.html
> 
>   * igt@gem_ctx_isolation@preservation-s3@bcs0:
>     - shard-apl:          NOTRUN -> [INCOMPLETE][6] ([i915#4939] / [i915#6598])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-apl3/igt@gem_ctx_isolation@preservation-s3@bcs0.html
> 
>   * igt@gem_ctx_persistence@engines-cleanup:
>     - shard-snb:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1099]) +1 similar issue
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-snb6/igt@gem_ctx_persistence@engines-cleanup.html
> 
>   * igt@gem_eio@in-flight-contexts-10ms:
>     - shard-apl:          [PASS][8] -> [TIMEOUT][9] ([i915#3063])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-apl7/igt@gem_eio@in-flight-contexts-10ms.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-apl6/igt@gem_eio@in-flight-contexts-10ms.html
> 
>   * igt@gem_eio@in-flight-immediate:
>     - shard-tglb:         [PASS][10] -> [TIMEOUT][11] ([i915#3063])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-tglb3/igt@gem_eio@in-flight-immediate.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb5/igt@gem_eio@in-flight-immediate.html
> 
>   * igt@gem_eio@kms:
>     - shard-tglb:         [PASS][12] -> [FAIL][13] ([i915#5784])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-tglb7/igt@gem_eio@kms.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb3/igt@gem_eio@kms.html
> 
>   * igt@gem_eio@suspend:
>     - shard-snb:          NOTRUN -> [INCOMPLETE][14] ([i915#6598] / [i915#6628])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-snb4/igt@gem_eio@suspend.html
> 
>   * igt@gem_exec_balancer@parallel-keep-in-fence:
>     - shard-iclb:         NOTRUN -> [SKIP][15] ([i915#4525])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb3/igt@gem_exec_balancer@parallel-keep-in-fence.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-apl:          NOTRUN -> [FAIL][16] ([i915#2846])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-apl8/igt@gem_exec_fair@basic-deadline.html
>     - shard-glk:          NOTRUN -> [FAIL][17] ([i915#2846])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-glk3/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-none-rrul@rcs0:
>     - shard-glk:          NOTRUN -> [FAIL][18] ([i915#2842]) +1 similar issue
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-glk7/igt@gem_exec_fair@basic-none-rrul@rcs0.html
>     - shard-tglb:         NOTRUN -> [FAIL][19] ([i915#2842])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb3/igt@gem_exec_fair@basic-none-rrul@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vcs0:
>     - shard-kbl:          [PASS][20] -> [FAIL][21] ([i915#2842]) +1 similar issue
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - shard-iclb:         NOTRUN -> [FAIL][22] ([i915#2842]) +1 similar issue
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@gem_exec_suspend@basic-s4-devices@smem:
>     - shard-apl:          [PASS][23] -> [INCOMPLETE][24] ([i915#6598]) +1 similar issue
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-apl2/igt@gem_exec_suspend@basic-s4-devices@smem.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-apl2/igt@gem_exec_suspend@basic-s4-devices@smem.html
>     - shard-snb:          [PASS][25] -> [INCOMPLETE][26] ([i915#4972] / [i915#6598])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-snb6/igt@gem_exec_suspend@basic-s4-devices@smem.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-snb4/igt@gem_exec_suspend@basic-s4-devices@smem.html
>     - shard-glk:          [PASS][27] -> [INCOMPLETE][28] ([i915#6598]) +1 similar issue
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-glk7/igt@gem_exec_suspend@basic-s4-devices@smem.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-glk8/igt@gem_exec_suspend@basic-s4-devices@smem.html
>     - shard-iclb:         [PASS][29] -> [INCOMPLETE][30] ([i915#6598])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-iclb6/igt@gem_exec_suspend@basic-s4-devices@smem.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb6/igt@gem_exec_suspend@basic-s4-devices@smem.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#2190])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb5/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - shard-apl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#4613]) +1 similar issue
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-apl8/igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_lmem_swapping@random:
>     - shard-glk:          NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#4613])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-glk1/igt@gem_lmem_swapping@random.html
>     - shard-iclb:         NOTRUN -> [SKIP][34] ([i915#4613])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb7/igt@gem_lmem_swapping@random.html
> 
>   * igt@gem_pread@exhaustion:
>     - shard-apl:          NOTRUN -> [WARN][35] ([i915#2658])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-apl3/igt@gem_pread@exhaustion.html
>     - shard-snb:          NOTRUN -> [WARN][36] ([i915#2658])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-snb4/igt@gem_pread@exhaustion.html
>     - shard-glk:          NOTRUN -> [WARN][37] ([i915#2658])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-glk5/igt@gem_pread@exhaustion.html
>     - shard-iclb:         NOTRUN -> [WARN][38] ([i915#2658])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb7/igt@gem_pread@exhaustion.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-off-2:
>     - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#4270])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb3/igt@gem_pxp@reject-modify-context-protection-off-2.html
> 
>   * igt@gem_pxp@verify-pxp-stale-buf-execution:
>     - shard-iclb:         NOTRUN -> [SKIP][40] ([i915#4270]) +2 similar issues
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb5/igt@gem_pxp@verify-pxp-stale-buf-execution.html
> 
>   * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
>     - shard-apl:          NOTRUN -> [SKIP][41] ([fdo#109271]) +254 similar issues
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-apl3/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html
> 
>   * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
>     - shard-iclb:         NOTRUN -> [SKIP][42] ([i915#768]) +3 similar issues
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
> 
>   * igt@gem_softpin@evict-single-offset:
>     - shard-iclb:         [PASS][43] -> [FAIL][44] ([i915#4171])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-iclb5/igt@gem_softpin@evict-single-offset.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb8/igt@gem_softpin@evict-single-offset.html
> 
>   * igt@gem_softpin@noreloc-s3:
>     - shard-snb:          NOTRUN -> [INCOMPLETE][45] ([i915#4939] / [i915#6598])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-snb5/igt@gem_softpin@noreloc-s3.html
> 
>   * igt@gem_userptr_blits@access-control:
>     - shard-iclb:         NOTRUN -> [SKIP][46] ([i915#3297]) +1 similar issue
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb2/igt@gem_userptr_blits@access-control.html
> 
>   * igt@gem_userptr_blits@coherency-sync:
>     - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109290])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb2/igt@gem_userptr_blits@coherency-sync.html
> 
>   * igt@gem_userptr_blits@vma-merge:
>     - shard-apl:          NOTRUN -> [FAIL][48] ([i915#3318])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-apl3/igt@gem_userptr_blits@vma-merge.html
>     - shard-snb:          NOTRUN -> [FAIL][49] ([i915#2724])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-snb2/igt@gem_userptr_blits@vma-merge.html
>     - shard-glk:          NOTRUN -> [FAIL][50] ([i915#3318])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-glk8/igt@gem_userptr_blits@vma-merge.html
> 
>   * igt@gem_vm_create@invalid-create:
>     - shard-snb:          NOTRUN -> [SKIP][51] ([fdo#109271]) +366 similar issues
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-snb2/igt@gem_vm_create@invalid-create.html
> 
>   * igt@gen3_render_linear_blits:
>     - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109289]) +6 similar issues
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb5/igt@gen3_render_linear_blits.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-iclb:         NOTRUN -> [SKIP][53] ([i915#2856]) +3 similar issues
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb5/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@i915_pm_dc@dc5-psr:
>     - shard-tglb:         [PASS][54] -> [FAIL][55] ([i915#3989])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-tglb7/igt@i915_pm_dc@dc5-psr.html
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb3/igt@i915_pm_dc@dc5-psr.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>     - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109293] / [fdo#109506]) +1 similar issue
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp:
>     - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#110892]) +1 similar issue
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@i915_query@query-topology-known-pci-ids:
>     - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109303])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb1/igt@i915_query@query-topology-known-pci-ids.html
> 
>   * igt@i915_suspend@debugfs-reader:
>     - shard-kbl:          [PASS][59] -> [DMESG-WARN][60] ([i915#180]) +2 similar issues
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-kbl7/igt@i915_suspend@debugfs-reader.html
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-kbl7/igt@i915_suspend@debugfs-reader.html
> 
>   * igt@i915_suspend@fence-restore-untiled:
>     - shard-apl:          [PASS][61] -> [INCOMPLETE][62] ([i915#4939] / [i915#6598])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-apl8/igt@i915_suspend@fence-restore-untiled.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-apl6/igt@i915_suspend@fence-restore-untiled.html
>     - shard-snb:          [PASS][63] -> [INCOMPLETE][64] ([i915#4817] / [i915#4939] / [i915#6598])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-snb2/igt@i915_suspend@fence-restore-untiled.html
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-snb5/igt@i915_suspend@fence-restore-untiled.html
> 
>   * igt@i915_suspend@forcewake:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][65] ([i915#6598]) +7 similar issues
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-glk3/igt@i915_suspend@forcewake.html
>     - shard-snb:          NOTRUN -> [INCOMPLETE][66] ([i915#4817] / [i915#6598])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-snb4/igt@i915_suspend@forcewake.html
> 
>   * igt@i915_suspend@sysfs-reader:
>     - shard-apl:          NOTRUN -> [INCOMPLETE][67] ([i915#4939]) +1 similar issue
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-apl3/igt@i915_suspend@sysfs-reader.html
> 
>   * igt@kms_atomic@atomic_plane_damage:
>     - shard-iclb:         NOTRUN -> [SKIP][68] ([i915#4765])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb3/igt@kms_atomic@atomic_plane_damage.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-iclb:         NOTRUN -> [SKIP][69] ([i915#404])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>     - shard-iclb:         NOTRUN -> [SKIP][70] ([i915#5286]) +8 similar issues
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>     - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#5286]) +1 similar issue
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-tglb:         NOTRUN -> [SKIP][72] ([fdo#111614])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb3/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#110725] / [fdo#111614]) +3 similar issues
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb7/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
>     - shard-tglb:         NOTRUN -> [SKIP][74] ([fdo#111615]) +2 similar issues
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb3/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
>     - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#110723]) +3 similar issues
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#3689]) +2 similar issues
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb3/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs:
>     - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109278]) +40 similar issues
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb3/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
>     - shard-glk:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#3886]) +10 similar issues
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-glk8/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
>     - shard-kbl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#3886]) +1 similar issue
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-kbl1/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_mc_ccs:
>     - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#3689] / [i915#6095])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb3/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
>     - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109278] / [i915#3886]) +10 similar issues
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb2/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
>     - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#3886]) +10 similar issues
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-apl1/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
> 
>   * igt@kms_chamelium@hdmi-crc-multiple:
>     - shard-glk:          NOTRUN -> [SKIP][83] ([fdo#109271] / [fdo#111827]) +8 similar issues
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-glk8/igt@kms_chamelium@hdmi-crc-multiple.html
> 
>   * igt@kms_chamelium@vga-hpd:
>     - shard-apl:          NOTRUN -> [SKIP][84] ([fdo#109271] / [fdo#111827]) +10 similar issues
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-apl6/igt@kms_chamelium@vga-hpd.html
> 
>   * igt@kms_chamelium@vga-hpd-with-enabled-mode:
>     - shard-snb:          NOTRUN -> [SKIP][85] ([fdo#109271] / [fdo#111827]) +11 similar issues
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-snb2/igt@kms_chamelium@vga-hpd-with-enabled-mode.html
> 
>   * igt@kms_color_chamelium@ctm-0-25:
>     - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109284] / [fdo#111827]) +12 similar issues
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb8/igt@kms_color_chamelium@ctm-0-25.html
> 
>   * igt@kms_color_chamelium@ctm-limited-range:
>     - shard-tglb:         NOTRUN -> [SKIP][87] ([fdo#109284] / [fdo#111827])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb5/igt@kms_color_chamelium@ctm-limited-range.html
> 
>   * igt@kms_color_chamelium@degamma:
>     - shard-kbl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [fdo#111827]) +2 similar issues
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-kbl7/igt@kms_color_chamelium@degamma.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#1063])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb5/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-apl:          NOTRUN -> [TIMEOUT][90] ([i915#1319]) +1 similar issue
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-apl1/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@lic:
>     - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109300] / [fdo#111066]) +2 similar issues
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb1/igt@kms_content_protection@lic.html
>     - shard-kbl:          NOTRUN -> [TIMEOUT][92] ([i915#1319] / [i915#6637]) +1 similar issue
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-kbl7/igt@kms_content_protection@lic.html
> 
>   * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#3528])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb3/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled:
>     - shard-tglb:         NOTRUN -> [SKIP][94] ([i915#5287]) +1 similar issue
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled.html
> 
>   * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled:
>     - shard-iclb:         NOTRUN -> [SKIP][95] ([i915#5287]) +2 similar issues
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb5/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled.html
> 
>   * igt@kms_flip@2x-blocking-wf_vblank:
>     - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#109274]) +23 similar issues
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb1/igt@kms_flip@2x-blocking-wf_vblank.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check:
>     - shard-tglb:         NOTRUN -> [SKIP][97] ([fdo#109274] / [fdo#111825] / [i915#3637])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb5/igt@kms_flip@2x-plain-flip-ts-check.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-edp1:
>     - shard-iclb:         NOTRUN -> [INCOMPLETE][98] ([i915#6598]) +6 similar issues
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb6/igt@kms_flip@flip-vs-suspend@a-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-iclb:         NOTRUN -> [SKIP][99] ([i915#2672]) +11 similar issues
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
>     - shard-iclb:         NOTRUN -> [SKIP][100] ([fdo#109280]) +59 similar issues
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>     - shard-iclb:         NOTRUN -> [SKIP][101] ([i915#5438])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
>     - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#6497])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>     - shard-tglb:         NOTRUN -> [SKIP][103] ([fdo#109280] / [fdo#111825]) +4 similar issues
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_hdr@bpc-switch@pipe-a-dp-1:
>     - shard-kbl:          [PASS][104] -> [FAIL][105] ([i915#1188])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-kbl1/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-iclb:         NOTRUN -> [SKIP][106] ([i915#3555]) +5 similar issues
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb2/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-c:
>     - shard-iclb:         NOTRUN -> [SKIP][107] ([i915#6403]) +2 similar issues
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb8/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-c.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:
>     - shard-apl:          NOTRUN -> [INCOMPLETE][108] ([i915#6598]) +3 similar issues
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1:
>     - shard-snb:          NOTRUN -> [INCOMPLETE][109] ([i915#6520] / [i915#6598])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-snb6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
>     - shard-snb:          NOTRUN -> [INCOMPLETE][110] ([i915#4939])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-snb5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
>     - shard-apl:          NOTRUN -> [FAIL][111] ([i915#265])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
>     - shard-glk:          NOTRUN -> [FAIL][112] ([i915#265])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-glk8/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
> 
>   * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
>     - shard-apl:          NOTRUN -> [FAIL][113] ([fdo#108145] / [i915#265])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
>     - shard-glk:          NOTRUN -> [FAIL][114] ([fdo#108145] / [i915#265])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-glk6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
> 
>   * igt@kms_plane_lowres@tiling-none@pipe-a-edp-1:
>     - shard-iclb:         NOTRUN -> [SKIP][115] ([i915#3536]) +2 similar issues
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb7/igt@kms_plane_lowres@tiling-none@pipe-a-edp-1.html
> 
>   * igt@kms_plane_multiple@atomic-pipe-d-tiling-y:
>     - shard-kbl:          NOTRUN -> [SKIP][116] ([fdo#109271]) +96 similar issues
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-kbl4/igt@kms_plane_multiple@atomic-pipe-d-tiling-y.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-edp-1:
>     - shard-iclb:         NOTRUN -> [SKIP][117] ([i915#5176]) +8 similar issues
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-edp-1:
>     - shard-iclb:         NOTRUN -> [SKIP][118] ([i915#5235]) +2 similar issues
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [SKIP][119] ([fdo#109271]) +245 similar issues
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-glk9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>     - shard-iclb:         NOTRUN -> [SKIP][120] ([i915#658])
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@cursor-plane-update-sf:
>     - shard-apl:          NOTRUN -> [SKIP][121] ([fdo#109271] / [i915#658]) +5 similar issues
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-apl6/igt@kms_psr2_sf@cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>     - shard-glk:          NOTRUN -> [SKIP][122] ([fdo#109271] / [i915#658]) +4 similar issues
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-glk9/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
>     - shard-iclb:         NOTRUN -> [SKIP][123] ([fdo#111068] / [i915#658]) +1 similar issue
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
>     - shard-iclb:         NOTRUN -> [SKIP][124] ([i915#2920])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-tglb:         NOTRUN -> [SKIP][125] ([i915#1911])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb3/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-kbl:          NOTRUN -> [SKIP][126] ([fdo#109271] / [i915#658]) +1 similar issue
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-kbl1/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@psr2_cursor_blt:
>     - shard-iclb:         NOTRUN -> [SKIP][127] ([fdo#109441]) +3 similar issues
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb1/igt@kms_psr@psr2_cursor_blt.html
> 
>   * igt@kms_psr@psr2_no_drrs:
>     - shard-iclb:         [PASS][128] -> [SKIP][129] ([fdo#109441]) +2 similar issues
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb5/igt@kms_psr@psr2_no_drrs.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-tglb:         [PASS][130] -> [SKIP][131] ([i915#5519])
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-tglb5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>     - shard-iclb:         NOTRUN -> [SKIP][132] ([i915#5519])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>     - shard-iclb:         NOTRUN -> [SKIP][133] ([i915#5289])
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-iclb:         NOTRUN -> [SKIP][134] ([fdo#109309])
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb2/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@nouveau_crc@pipe-a-ctx-flip-detection:
>     - shard-iclb:         NOTRUN -> [SKIP][135] ([i915#2530]) +3 similar issues
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb2/igt@nouveau_crc@pipe-a-ctx-flip-detection.html
> 
>   * igt@nouveau_crc@pipe-d-ctx-flip-detection:
>     - shard-tglb:         NOTRUN -> [SKIP][136] ([i915#2530])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb5/igt@nouveau_crc@pipe-d-ctx-flip-detection.html
> 
>   * igt@nouveau_crc@pipe-d-source-outp-complete:
>     - shard-iclb:         NOTRUN -> [SKIP][137] ([fdo#109278] / [i915#2530]) +1 similar issue
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb7/igt@nouveau_crc@pipe-d-source-outp-complete.html
> 
>   * igt@perf@per-context-mode-unprivileged:
>     - shard-tglb:         NOTRUN -> [SKIP][138] ([fdo#109289])
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb5/igt@perf@per-context-mode-unprivileged.html
> 
>   * igt@prime_nv_pcopy@test3_2:
>     - shard-iclb:         NOTRUN -> [SKIP][139] ([fdo#109291]) +7 similar issues
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb2/igt@prime_nv_pcopy@test3_2.html
> 
>   * igt@prime_nv_pcopy@test_semaphore:
>     - shard-tglb:         NOTRUN -> [SKIP][140] ([fdo#109291])
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb3/igt@prime_nv_pcopy@test_semaphore.html
> 
>   * igt@prime_vgem@coherency-gtt:
>     - shard-iclb:         NOTRUN -> [SKIP][141] ([fdo#109292] / [fdo#109295])
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb7/igt@prime_vgem@coherency-gtt.html
> 
>   * igt@sysfs_clients@fair-1:
>     - shard-apl:          NOTRUN -> [SKIP][142] ([fdo#109271] / [i915#2994]) +1 similar issue
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-apl6/igt@sysfs_clients@fair-1.html
>     - shard-iclb:         NOTRUN -> [SKIP][143] ([i915#2994]) +1 similar issue
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb8/igt@sysfs_clients@fair-1.html
> 
>   * igt@sysfs_clients@split-50:
>     - shard-glk:          NOTRUN -> [SKIP][144] ([fdo#109271] / [i915#2994]) +2 similar issues
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-glk7/igt@sysfs_clients@split-50.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_ctx_isolation@preservation-s3@bcs0:
>     - shard-kbl:          [DMESG-WARN][145] ([i915#180]) -> [PASS][146] +3 similar issues
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html
> 
>   * igt@gem_ctx_isolation@preservation-s3@rcs0:
>     - shard-snb:          [INCOMPLETE][147] ([i915#6598] / [i915#6601]) -> [PASS][148]
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-snb4/igt@gem_ctx_isolation@preservation-s3@rcs0.html
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-snb2/igt@gem_ctx_isolation@preservation-s3@rcs0.html
>     - shard-glk:          [INCOMPLETE][149] ([i915#6598]) -> [PASS][150] +1 similar issue
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-glk2/igt@gem_ctx_isolation@preservation-s3@rcs0.html
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-glk8/igt@gem_ctx_isolation@preservation-s3@rcs0.html
>     - shard-iclb:         [INCOMPLETE][151] -> [PASS][152]
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-iclb7/igt@gem_ctx_isolation@preservation-s3@rcs0.html
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb8/igt@gem_ctx_isolation@preservation-s3@rcs0.html
> 
>   * igt@gem_eio@in-flight-contexts-immediate:
>     - shard-tglb:         [TIMEOUT][153] ([i915#3063]) -> [PASS][154]
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-tglb7/igt@gem_eio@in-flight-contexts-immediate.html
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb5/igt@gem_eio@in-flight-contexts-immediate.html
> 
>   * igt@gem_eio@reset-stress:
>     - shard-tglb:         [FAIL][155] ([i915#5784]) -> [PASS][156]
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-tglb3/igt@gem_eio@reset-stress.html
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb5/igt@gem_eio@reset-stress.html
> 
>   * igt@gem_exec_fair@basic-flow@rcs0:
>     - shard-tglb:         [FAIL][157] ([i915#2842]) -> [PASS][158] +1 similar issue
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-apl:          [FAIL][159] ([i915#2842]) -> [PASS][160] +1 similar issue
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@vecs0:
>     - shard-kbl:          [FAIL][161] ([i915#2842]) -> [PASS][162]
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-kbl4/igt@gem_exec_fair@basic-none@vecs0.html
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-kbl4/igt@gem_exec_fair@basic-none@vecs0.html
> 
>   * igt@gem_exec_reloc@basic-wc-cpu:
>     - {shard-rkl}:        [SKIP][163] ([i915#3281]) -> [PASS][164] +1 similar issue
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-rkl-2/igt@gem_exec_reloc@basic-wc-cpu.html
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-rkl-5/igt@gem_exec_reloc@basic-wc-cpu.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-glk:          [DMESG-WARN][165] ([i915#5566] / [i915#716]) -> [PASS][166]
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-glk1/igt@gen9_exec_parse@allowed-all.html
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-glk9/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-kbl:          [DMESG-WARN][167] ([i915#5566] / [i915#716]) -> [PASS][168]
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-kbl7/igt@gen9_exec_parse@allowed-single.html
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-kbl4/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-iclb:         [INCOMPLETE][169] ([i915#6598]) -> [PASS][170]
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-iclb3/igt@i915_suspend@basic-s3-without-i915.html
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb5/igt@i915_suspend@basic-s3-without-i915.html
>     - shard-apl:          [INCOMPLETE][171] ([i915#6598]) -> [PASS][172] +1 similar issue
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-apl2/igt@i915_suspend@basic-s3-without-i915.html
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-apl7/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1:
>     - shard-apl:          [INCOMPLETE][173] -> [PASS][174]
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:
>     - shard-snb:          [INCOMPLETE][175] -> [PASS][176]
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-snb5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-snb6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:
>     - shard-iclb:         [SKIP][177] ([i915#5235]) -> [PASS][178] +2 similar issues
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html
> 
>   * igt@kms_psr@psr2_cursor_plane_onoff:
>     - shard-iclb:         [SKIP][179] ([fdo#109441]) -> [PASS][180]
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-iclb6/igt@kms_psr@psr2_cursor_plane_onoff.html
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
> 
>   * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
>     - shard-apl:          [INCOMPLETE][181] ([i915#4939] / [i915#6598]) -> [PASS][182]
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-apl8/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
>     - shard-snb:          [INCOMPLETE][183] ([i915#4939] / [i915#6598]) -> [PASS][184]
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-snb4/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-snb6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
> 
>   * igt@perf@mi-rpc:
>     - {shard-rkl}:        [SKIP][185] ([i915#2434]) -> [PASS][186]
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-rkl-2/igt@perf@mi-rpc.html
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-rkl-5/igt@perf@mi-rpc.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_balancer@parallel-ordering:
>     - shard-iclb:         [FAIL][187] ([i915#6117]) -> [SKIP][188] ([i915#4525])
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html
> 
>   * igt@i915_pm_dc@dc3co-vpb-simulation:
>     - shard-iclb:         [SKIP][189] ([i915#658]) -> [SKIP][190] ([i915#588])
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
>     - shard-iclb:         [INCOMPLETE][191] ([i915#1982] / [i915#6598]) -> [INCOMPLETE][192] ([i915#6598])
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
>     - shard-iclb:         [SKIP][193] ([fdo#111068] / [i915#658]) -> [SKIP][194] ([i915#2920])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-iclb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
> 
>   * igt@runner@aborted:
>     - shard-kbl:          ([FAIL][195], [FAIL][196], [FAIL][197], [FAIL][198]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#716]) -> ([FAIL][199], [FAIL][200], [FAIL][201], [FAIL][202]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-kbl7/igt@runner@aborted.html
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-kbl1/igt@runner@aborted.html
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-kbl7/igt@runner@aborted.html
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-kbl7/igt@runner@aborted.html
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-kbl1/igt@runner@aborted.html
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-kbl7/igt@runner@aborted.html
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-kbl7/igt@runner@aborted.html
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/shard-kbl7/igt@runner@aborted.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
>   [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109290]: https://bugs.freedesktop.org/show_bug.cgi?id=109290
>   [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
>   [fdo#109292]: https://bugs.freedesktop.org/show_bug.cgi?id=109292
>   [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
>   [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
>   [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
>   [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
>   [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
>   [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
>   [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
>   [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
>   [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
>   [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
>   [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
>   [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
>   [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
>   [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
>   [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
>   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
>   [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
>   [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
>   [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
>   [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
>   [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
>   [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
>   [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
>   [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
>   [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
>   [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
>   [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
>   [i915#3810]: https://gitlab.freedesktop.org/drm/intel/issues/3810
>   [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
>   [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
>   [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
>   [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
>   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4765]: https://gitlab.freedesktop.org/drm/intel/issues/4765
>   [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
>   [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
>   [i915#4972]: https://gitlab.freedesktop.org/drm/intel/issues/4972
>   [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
>   [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
>   [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5438]: https://gitlab.freedesktop.org/drm/intel/issues/5438
>   [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
>   [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
>   [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
>   [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
>   [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
>   [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
>   [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
>   [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
>   [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
>   [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
>   [i915#6403]: https://gitlab.freedesktop.org/drm/intel/issues/6403
>   [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
>   [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
>   [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
>   [i915#6520]: https://gitlab.freedesktop.org/drm/intel/issues/6520
>   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6598]: https://gitlab.freedesktop.org/drm/intel/issues/6598
>   [i915#6599]: https://gitlab.freedesktop.org/drm/intel/issues/6599
>   [i915#6601]: https://gitlab.freedesktop.org/drm/intel/issues/6601
>   [i915#6628]: https://gitlab.freedesktop.org/drm/intel/issues/6628
>   [i915#6637]: https://gitlab.freedesktop.org/drm/intel/issues/6637
>   [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
>   [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6634 -> IGTPW_7670
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_12014: 1de33826aa86910c175ca773bc8f92d5948d094e @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_7670: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/index.html
>   IGT_6634: e01fe99f00692864b709253638c809231d1fb333 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7670/index.html
