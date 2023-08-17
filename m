Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CB310E1CA
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 08:51:43 +0000 (UTC)
Date: Thu, 17 Aug 2023 10:51:38 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Message-ID: <20230817085138.eiokksayyxzcmjkp@kamilkon-desk1>
References: <20230814181316.408017-1-vinay.belgaumkar@intel.com>
 <169206397613.16424.3097978720904178024@emeril.freedesktop.org>
 <20230816143215.xdj5go6uucvobs6h@kamilkon-desk1>
 <BY5PR11MB4274912350D9BA3CA4BC1E5E8515A@BY5PR11MB4274.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BY5PR11MB4274912350D9BA3CA4BC1E5E8515A@BY5PR11MB4274.namprd11.prod.outlook.com>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSAgZm9yIHRlc3Rz?=
 =?utf-8?q?/i915=5Fpm=5Ffreq=5Fapi=3A_Ignore_zero_register_value_=28rev2?=
 =?utf-8?q?=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Belgaumkar,

On 2023-08-16 at 15:32:52 +0000, Belgaumkar, Vinay wrote:
> We want to merge v1 since the changes in v2 will not help.
> R-b has been provided. Should we respin v1 instead?

imho it will be better to send v3 with r-b and explanation
added (if it may help to understand why it is better).

+cc Riana

Regards,
Kamil

> 
> Thanks,
> Vinay.
> 
> -----Original Message-----
> From: Kamil Konieczny <kamil.konieczny@linux.intel.com> 
> Sent: Wednesday, August 16, 2023 7:32 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Belgaumkar, Vinay <vinay.belgaumkar@intel.com>
> Subject: Re: [igt-dev] ✗ Fi.CI.IGT: failure for tests/i915_pm_freq_api: Ignore zero register value (rev2)
> 
> Hi Sai,
> 
> below change is not related pm_freq test,
> could you supress them and respin tests ?
> Also please disregard my previous reply to older reply to v1 of this patch.
> 
> Regards,
> Kamil
> 
> On 2023-08-15 at 01:46:16 -0000, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: tests/i915_pm_freq_api: Ignore zero register value (rev2)
> > URL   : https://patchwork.freedesktop.org/series/122187/
> > State : failure
> > 
> > == Summary ==
> > 
> > CI Bug Log - changes from CI_DRM_13517_full -> IGTPW_9587_full
> > ====================================================
> > 
> > Summary
> > -------
> > 
> >   **FAILURE**
> > 
> >   Serious unknown changes coming with IGTPW_9587_full absolutely need to be
> >   verified manually.
> >   
> >   If you think the reported changes have nothing to do with the changes
> >   introduced in IGTPW_9587_full, please notify your bug team to allow them
> >   to document this new failure mode, which will reduce false positives in CI.
> > 
> >   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/index.html
> > 
> > Participating hosts (9 -> 9)
> > ------------------------------
> > 
> >   No changes in participating hosts
> > 
> > Possible new issues
> > -------------------
> > 
> >   Here are the unknown changes that may have been introduced in IGTPW_9587_full:
> > 
> > ### IGT changes ###
> > 
> > #### Possible regressions ####
> > 
> >   * igt@sysfs_preempt_timeout@timeout@vecs0:
> >     - shard-mtlp:         [PASS][1] -> [TIMEOUT][2]
> >    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-3/igt@sysfs_preempt_timeout@timeout@vecs0.html
> >    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-2/igt@sysfs_preempt_timeout@timeout@vecs0.html
> > 
> >   
> > Known issues
> > ------------
> > 
> >   Here are the changes found in IGTPW_9587_full that come from known issues:
> > 
> > ### IGT changes ###
> > 
> > #### Issues hit ####
> > 
> >   * igt@api_intel_bb@object-reloc-purge-cache:
> >     - shard-dg2:          NOTRUN -> [SKIP][3] ([i915#8411])
> >    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-2/igt@api_intel_bb@object-reloc-purge-cache.html
> >     - shard-rkl:          NOTRUN -> [SKIP][4] ([i915#8411])
> >    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-4/igt@api_intel_bb@object-reloc-purge-cache.html
> >     - shard-dg1:          NOTRUN -> [SKIP][5] ([i915#8411])
> >    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-15/igt@api_intel_bb@object-reloc-purge-cache.html
> > 
> >   * igt@api_intel_bb@render-ccs:
> >     - shard-dg2:          NOTRUN -> [FAIL][6] ([i915#6122])
> >    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-11/igt@api_intel_bb@render-ccs.html
> > 
> >   * igt@debugfs_test@basic-hwmon:
> >     - shard-mtlp:         NOTRUN -> [SKIP][7] ([i915#7456])
> >    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-2/igt@debugfs_test@basic-hwmon.html
> > 
> >   * igt@device_reset@cold-reset-bound:
> >     - shard-dg2:          NOTRUN -> [SKIP][8] ([i915#7701])
> >    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-12/igt@device_reset@cold-reset-bound.html
> > 
> >   * igt@drm_fdinfo@busy-check-all@ccs0:
> >     - shard-mtlp:         NOTRUN -> [SKIP][9] ([i915#8414]) +5 similar issues
> >    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-3/igt@drm_fdinfo@busy-check-all@ccs0.html
> > 
> >   * igt@drm_fdinfo@busy-idle-check-all@vcs0:
> >     - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#8414]) +10 similar issues
> >    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-2/igt@drm_fdinfo@busy-idle-check-all@vcs0.html
> > 
> >   * igt@drm_fdinfo@virtual-idle:
> >     - shard-rkl:          NOTRUN -> [FAIL][11] ([i915#7742])
> >    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-1/igt@drm_fdinfo@virtual-idle.html
> > 
> >   * igt@drm_mm@drm_mm_test:
> >     - shard-mtlp:         NOTRUN -> [SKIP][12] ([i915#8661])
> >    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-5/igt@drm_mm@drm_mm_test.html
> > 
> >   * igt@feature_discovery@display-4x:
> >     - shard-rkl:          NOTRUN -> [SKIP][13] ([i915#1839])
> >    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-7/igt@feature_discovery@display-4x.html
> > 
> >   * igt@feature_discovery@psr1:
> >     - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#658]) +1 similar issue
> >    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-1/igt@feature_discovery@psr1.html
> > 
> >   * igt@gem_ccs@block-copy-compressed:
> >     - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#3555] / [i915#5325])
> >    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-7/igt@gem_ccs@block-copy-compressed.html
> > 
> >   * igt@gem_ccs@block-multicopy-compressed:
> >     - shard-mtlp:         NOTRUN -> [SKIP][16] ([i915#5325])
> >    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-4/igt@gem_ccs@block-multicopy-compressed.html
> > 
> >   * igt@gem_close_race@multigpu-basic-threads:
> >     - shard-mtlp:         NOTRUN -> [SKIP][17] ([i915#7697])
> >    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-2/igt@gem_close_race@multigpu-basic-threads.html
> > 
> >   * igt@gem_create@create-ext-cpu-access-big:
> >     - shard-dg2:          NOTRUN -> [ABORT][18] ([i915#7461])
> >    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-2/igt@gem_create@create-ext-cpu-access-big.html
> > 
> >   * igt@gem_create@create-ext-set-pat:
> >     - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#8562])
> >    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-1/igt@gem_create@create-ext-set-pat.html
> > 
> >   * igt@gem_ctx_exec@basic-nohangcheck:
> >     - shard-mtlp:         [PASS][20] -> [FAIL][21] ([i915#6121])
> >    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-2/igt@gem_ctx_exec@basic-nohangcheck.html
> >    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-8/igt@gem_ctx_exec@basic-nohangcheck.html
> > 
> >   * igt@gem_ctx_persistence@file:
> >     - shard-snb:          NOTRUN -> [SKIP][22] ([fdo#109271] / [i915#1099]) +1 similar issue
> >    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-snb1/igt@gem_ctx_persistence@file.html
> > 
> >   * igt@gem_ctx_persistence@hang:
> >     - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#8555])
> >    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-5/igt@gem_ctx_persistence@hang.html
> > 
> >   * igt@gem_ctx_persistence@legacy-engines-hostile@vebox:
> >     - shard-mtlp:         [PASS][24] -> [FAIL][25] ([i915#2410]) +2 similar issues
> >    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-5/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html
> >    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-2/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html
> > 
> >   * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:
> >     - shard-mtlp:         NOTRUN -> [SKIP][26] ([i915#5882]) +5 similar issues
> >    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html
> > 
> >   * igt@gem_eio@hibernate:
> >     - shard-dg1:          [PASS][27] -> [ABORT][28] ([i915#7975] / [i915#8213])
> >    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-dg1-18/igt@gem_eio@hibernate.html
> >    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-14/igt@gem_eio@hibernate.html
> > 
> >   * igt@gem_eio@kms:
> >     - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#8764])
> >    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-glk4/igt@gem_eio@kms.html
> >    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-glk6/igt@gem_eio@kms.html
> >     - shard-dg1:          [PASS][31] -> [FAIL][32] ([i915#5784])
> >    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-dg1-15/igt@gem_eio@kms.html
> >    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-18/igt@gem_eio@kms.html
> > 
> >   * igt@gem_eio@reset-stress:
> >     - shard-dg2:          [PASS][33] -> [FAIL][34] ([i915#5784])
> >    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-dg2-12/igt@gem_eio@reset-stress.html
> >    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-10/igt@gem_eio@reset-stress.html
> > 
> >   * igt@gem_eio@unwedge-stress:
> >     - shard-snb:          NOTRUN -> [FAIL][35] ([i915#8898])
> >    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-snb1/igt@gem_eio@unwedge-stress.html
> > 
> >   * igt@gem_exec_balancer@noheartbeat:
> >     - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#8555]) +1 similar issue
> >    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-10/igt@gem_exec_balancer@noheartbeat.html
> > 
> >   * igt@gem_exec_balancer@parallel-keep-in-fence:
> >     - shard-rkl:          NOTRUN -> [SKIP][37] ([i915#4525])
> >    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-4/igt@gem_exec_balancer@parallel-keep-in-fence.html
> > 
> >   * igt@gem_exec_fair@basic-none-solo:
> >     - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#4473])
> >    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-6/igt@gem_exec_fair@basic-none-solo.html
> > 
> >   * igt@gem_exec_fair@basic-none-solo@rcs0:
> >     - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#2842]) +1 similar issue
> >    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html
> >    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html
> > 
> >   * igt@gem_exec_fair@basic-none@bcs0:
> >     - shard-rkl:          [PASS][41] -> [FAIL][42] ([i915#2842]) +4 similar issues
> >    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-rkl-7/igt@gem_exec_fair@basic-none@bcs0.html
> >    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-1/igt@gem_exec_fair@basic-none@bcs0.html
> > 
> >   * igt@gem_exec_fair@basic-pace@vecs0:
> >     - shard-rkl:          NOTRUN -> [FAIL][43] ([i915#2842]) +2 similar issues
> >    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-7/igt@gem_exec_fair@basic-pace@vecs0.html
> > 
> >   * igt@gem_exec_fence@parallel@bcs0:
> >     - shard-mtlp:         [PASS][44] -> [DMESG-FAIL][45] ([i915#8962]) +1 similar issue
> >    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-3/igt@gem_exec_fence@parallel@bcs0.html
> >    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-4/igt@gem_exec_fence@parallel@bcs0.html
> > 
> >   * igt@gem_exec_fence@parallel@vcs0:
> >     - shard-mtlp:         [PASS][46] -> [DMESG-WARN][47] ([i915#9121])
> >    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-3/igt@gem_exec_fence@parallel@vcs0.html
> >    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-4/igt@gem_exec_fence@parallel@vcs0.html
> > 
> >   * igt@gem_exec_fence@parallel@vecs0:
> >     - shard-mtlp:         [PASS][48] -> [FAIL][49] ([i915#8957]) +2 similar issues
> >    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-3/igt@gem_exec_fence@parallel@vecs0.html
> >    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-4/igt@gem_exec_fence@parallel@vecs0.html
> > 
> >   * igt@gem_exec_fence@submit:
> >     - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#4812]) +1 similar issue
> >    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-2/igt@gem_exec_fence@submit.html
> > 
> >   * igt@gem_exec_flush@basic-uc-prw-default:
> >     - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#3539])
> >    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-11/igt@gem_exec_flush@basic-uc-prw-default.html
> > 
> >   * igt@gem_exec_flush@basic-uc-rw-default:
> >     - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#3539] / [i915#4852]) +2 similar issues
> >    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-1/igt@gem_exec_flush@basic-uc-rw-default.html
> > 
> >   * igt@gem_exec_params@secure-non-master:
> >     - shard-mtlp:         NOTRUN -> [SKIP][53] ([fdo#112283])
> >    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-3/igt@gem_exec_params@secure-non-master.html
> > 
> >   * igt@gem_exec_reloc@basic-cpu-wc-active:
> >     - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#3281]) +2 similar issues
> >    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-1/igt@gem_exec_reloc@basic-cpu-wc-active.html
> > 
> >   * igt@gem_exec_reloc@basic-gtt-read:
> >     - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#3281]) +17 similar issues
> >    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read.html
> > 
> >   * igt@gem_exec_reloc@basic-wc-gtt-active:
> >     - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#3281]) +1 similar issue
> >    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-14/igt@gem_exec_reloc@basic-wc-gtt-active.html
> > 
> >   * igt@gem_exec_reloc@basic-write-read:
> >     - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#3281]) +12 similar issues
> >    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-2/igt@gem_exec_reloc@basic-write-read.html
> > 
> >   * igt@gem_exec_schedule@preempt-queue-chain:
> >     - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#4812]) +1 similar issue
> >    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-6/igt@gem_exec_schedule@preempt-queue-chain.html
> > 
> >   * igt@gem_exec_schedule@preemptive-hang@vcs0:
> >     - shard-mtlp:         [PASS][59] -> [FAIL][60] ([i915#9051])
> >    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-3/igt@gem_exec_schedule@preemptive-hang@vcs0.html
> >    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-6/igt@gem_exec_schedule@preemptive-hang@vcs0.html
> > 
> >   * igt@gem_exec_schedule@reorder-wide:
> >     - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4537] / [i915#4812])
> >    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-1/igt@gem_exec_schedule@reorder-wide.html
> > 
> >   * igt@gem_exec_schedule@semaphore-power:
> >     - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#7276])
> >    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-1/igt@gem_exec_schedule@semaphore-power.html
> > 
> >   * igt@gem_exec_suspend@basic-s3@smem:
> >     - shard-snb:          NOTRUN -> [DMESG-WARN][63] ([i915#8841]) +3 similar issues
> >    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-snb5/igt@gem_exec_suspend@basic-s3@smem.html
> > 
> >   * igt@gem_fence_thrash@bo-write-verify-none:
> >     - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#4860])
> >    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-12/igt@gem_fence_thrash@bo-write-verify-none.html
> > 
> >   * igt@gem_lmem_swapping@massive:
> >     - shard-apl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#4613])
> >    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-apl1/igt@gem_lmem_swapping@massive.html
> > 
> >   * igt@gem_lmem_swapping@parallel-random-verify:
> >     - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#4613]) +2 similar issues
> >    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-1/igt@gem_lmem_swapping@parallel-random-verify.html
> >     - shard-tglu:         NOTRUN -> [SKIP][67] ([i915#4613])
> >    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-6/igt@gem_lmem_swapping@parallel-random-verify.html
> > 
> >   * igt@gem_lmem_swapping@random-engines:
> >     - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4613])
> >    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-6/igt@gem_lmem_swapping@random-engines.html
> > 
> >   * igt@gem_lmem_swapping@smem-oom@lmem0:
> >     - shard-dg2:          [PASS][69] -> [DMESG-WARN][70] ([i915#4936] / [i915#5493])
> >    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-dg2-1/igt@gem_lmem_swapping@smem-oom@lmem0.html
> >    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-2/igt@gem_lmem_swapping@smem-oom@lmem0.html
> > 
> >   * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
> >     - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4565])
> >    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-17/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html
> > 
> >   * igt@gem_media_vme:
> >     - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#284])
> >    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-4/igt@gem_media_vme.html
> > 
> >   * igt@gem_mmap_gtt@fault-concurrent-y:
> >     - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#4077]) +3 similar issues
> >    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-6/igt@gem_mmap_gtt@fault-concurrent-y.html
> > 
> >   * igt@gem_mmap_wc@invalid-flags:
> >     - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#4083])
> >    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-19/igt@gem_mmap_wc@invalid-flags.html
> > 
> >   * igt@gem_mmap_wc@write-read-distinct:
> >     - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4083]) +2 similar issues
> >    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-1/igt@gem_mmap_wc@write-read-distinct.html
> > 
> >   * igt@gem_partial_pwrite_pread@reads:
> >     - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#3282]) +4 similar issues
> >    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.html
> > 
> >   * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
> >     - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#3282]) +2 similar issues
> >    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
> > 
> >   * igt@gem_pread@uncached:
> >     - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#3282])
> >    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-17/igt@gem_pread@uncached.html
> > 
> >   * igt@gem_pxp@create-protected-buffer:
> >     - shard-tglu:         NOTRUN -> [SKIP][79] ([i915#4270])
> >    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-7/igt@gem_pxp@create-protected-buffer.html
> > 
> >   * igt@gem_pxp@display-protected-crc:
> >     - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#4270]) +5 similar issues
> >    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-11/igt@gem_pxp@display-protected-crc.html
> >     - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#4270]) +1 similar issue
> >    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-1/igt@gem_pxp@display-protected-crc.html
> > 
> >   * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
> >     - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#4270])
> >    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-8/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
> > 
> >   * igt@gem_render_copy@x-tiled-to-vebox-y-tiled:
> >     - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#8428]) +1 similar issue
> >    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-2/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html
> > 
> >   * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
> >     - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#4079])
> >    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
> > 
> >   * igt@gem_tiling_max_stride:
> >     - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4077]) +18 similar issues
> >    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-2/igt@gem_tiling_max_stride.html
> > 
> >   * igt@gem_userptr_blits@coherency-sync:
> >     - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#3297]) +2 similar issues
> >    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-2/igt@gem_userptr_blits@coherency-sync.html
> >     - shard-rkl:          NOTRUN -> [SKIP][87] ([fdo#110542])
> >    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-4/igt@gem_userptr_blits@coherency-sync.html
> > 
> >   * igt@gem_userptr_blits@dmabuf-sync:
> >     - shard-apl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#3323])
> >    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-apl1/igt@gem_userptr_blits@dmabuf-sync.html
> > 
> >   * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
> >     - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#3297])
> >    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-1/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
> > 
> >   * igt@gem_userptr_blits@nohangcheck:
> >     - shard-mtlp:         [PASS][90] -> [FAIL][91] ([i915#6268])
> >    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-8/igt@gem_userptr_blits@nohangcheck.html
> >    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-1/igt@gem_userptr_blits@nohangcheck.html
> > 
> >   * igt@gem_userptr_blits@sd-probe:
> >     - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#3297] / [i915#4958])
> >    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-10/igt@gem_userptr_blits@sd-probe.html
> > 
> >   * igt@gem_userptr_blits@unsync-unmap-cycles:
> >     - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#3297])
> >    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-4/igt@gem_userptr_blits@unsync-unmap-cycles.html
> > 
> >   * igt@gem_userptr_blits@vma-merge:
> >     - shard-dg2:          NOTRUN -> [FAIL][94] ([i915#3318])
> >    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-1/igt@gem_userptr_blits@vma-merge.html
> > 
> >   * igt@gen7_exec_parse@basic-offset:
> >     - shard-dg2:          NOTRUN -> [SKIP][95] ([fdo#109289]) +1 similar issue
> >    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-1/igt@gen7_exec_parse@basic-offset.html
> > 
> >   * igt@gen9_exec_parse@basic-rejected:
> >     - shard-mtlp:         NOTRUN -> [SKIP][96] ([i915#2856]) +1 similar issue
> >    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-6/igt@gen9_exec_parse@basic-rejected.html
> > 
> >   * igt@gen9_exec_parse@bb-chained:
> >     - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#2527] / [i915#2856])
> >    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-10/igt@gen9_exec_parse@bb-chained.html
> > 
> >   * igt@gen9_exec_parse@bb-start-param:
> >     - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#2856]) +3 similar issues
> >    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-11/igt@gen9_exec_parse@bb-start-param.html
> >     - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#2527]) +2 similar issues
> >    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-2/igt@gen9_exec_parse@bb-start-param.html
> > 
> >   * igt@gen9_exec_parse@secure-batches:
> >     - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#2527])
> >    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-19/igt@gen9_exec_parse@secure-batches.html
> > 
> >   * igt@i915_hangman@gt-engine-error@vcs0:
> >     - shard-mtlp:         [PASS][101] -> [FAIL][102] ([i915#7069])
> >    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-4/igt@i915_hangman@gt-engine-error@vcs0.html
> >    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-3/igt@i915_hangman@gt-engine-error@vcs0.html
> > 
> >   * igt@i915_module_load@resize-bar:
> >     - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#6412])
> >    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-1/igt@i915_module_load@resize-bar.html
> > 
> >   * igt@i915_pm_backlight@basic-brightness:
> >     - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#7561])
> >    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-1/igt@i915_pm_backlight@basic-brightness.html
> >     - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#3546] / [i915#7561])
> >    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-4/igt@i915_pm_backlight@basic-brightness.html
> > 
> >   * igt@i915_pm_freq_api@freq-basic-api:
> >     - shard-apl:          NOTRUN -> [SKIP][106] ([fdo#109271]) +100 similar issues
> >    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-apl1/igt@i915_pm_freq_api@freq-basic-api.html
> > 
> >   * igt@i915_pm_freq_api@freq-suspend:
> >     - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#8399])
> >    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-2/igt@i915_pm_freq_api@freq-suspend.html
> > 
> >   * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
> >     - shard-dg2:          [PASS][108] -> [SKIP][109] ([i915#1397]) +1 similar issue
> >    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-dg2-2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
> >    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-12/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
> >     - shard-dg1:          [PASS][110] -> [SKIP][111] ([i915#1397]) +2 similar issues
> >    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-dg1-14/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
> >    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-19/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
> >     - shard-mtlp:         NOTRUN -> [SKIP][112] ([i915#1397])
> >    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
> > 
> >   * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
> >     - shard-dg2:          NOTRUN -> [SKIP][113] ([fdo#109506])
> >    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-10/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
> > 
> >   * igt@i915_pm_rpm@i2c:
> >     - shard-dg2:          [PASS][114] -> [FAIL][115] ([i915#8717])
> >    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-dg2-11/igt@i915_pm_rpm@i2c.html
> >    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-2/igt@i915_pm_rpm@i2c.html
> > 
> >   * igt@i915_pm_rpm@modeset-lpsp:
> >     - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#1397])
> >    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-11/igt@i915_pm_rpm@modeset-lpsp.html
> >     - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#1397])
> >    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-1/igt@i915_pm_rpm@modeset-lpsp.html
> > 
> >   * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
> >     - shard-rkl:          [PASS][118] -> [SKIP][119] ([i915#1397])
> >    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-rkl-4/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> >    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> > 
> >   * igt@i915_pm_rpm@pc8-residency:
> >     - shard-rkl:          NOTRUN -> [SKIP][120] ([fdo#109506])
> >    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-1/igt@i915_pm_rpm@pc8-residency.html
> > 
> >   * igt@i915_pm_rps@min-max-config-idle:
> >     - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#6621])
> >    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-11/igt@i915_pm_rps@min-max-config-idle.html
> > 
> >   * igt@i915_pm_rps@thresholds-idle@gt0:
> >     - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#8925]) +1 similar issue
> >    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-6/igt@i915_pm_rps@thresholds-idle@gt0.html
> > 
> >   * igt@i915_selftest@live@gt_heartbeat:
> >     - shard-apl:          [PASS][123] -> [DMESG-FAIL][124] ([i915#5334])
> >    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-apl2/igt@i915_selftest@live@gt_heartbeat.html
> >    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-apl3/igt@i915_selftest@live@gt_heartbeat.html
> > 
> >   * igt@i915_selftest@live@slpc:
> >     - shard-mtlp:         [PASS][125] -> [DMESG-WARN][126] ([i915#6367])
> >    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-3/igt@i915_selftest@live@slpc.html
> >    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-6/igt@i915_selftest@live@slpc.html
> > 
> >   * igt@i915_selftest@live@workarounds:
> >     - shard-mtlp:         [PASS][127] -> [DMESG-FAIL][128] ([i915#6763])
> >    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-3/igt@i915_selftest@live@workarounds.html
> >    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-6/igt@i915_selftest@live@workarounds.html
> > 
> >   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs:
> >     - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#8502]) +7 similar issues
> >    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs.html
> > 
> >   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-mc_ccs:
> >     - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#8502] / [i915#8709]) +11 similar issues
> >    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-12/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-mc_ccs.html
> > 
> >   * igt@kms_async_flips@crc@pipe-b-hdmi-a-1:
> >     - shard-rkl:          NOTRUN -> [FAIL][131] ([i915#8247]) +1 similar issue
> >    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-7/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html
> > 
> >   * igt@kms_async_flips@crc@pipe-b-vga-1:
> >     - shard-snb:          NOTRUN -> [FAIL][132] ([i915#8247]) +1 similar issue
> >    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-snb2/igt@kms_async_flips@crc@pipe-b-vga-1.html
> > 
> >   * igt@kms_async_flips@crc@pipe-d-edp-1:
> >     - shard-mtlp:         NOTRUN -> [DMESG-FAIL][133] ([i915#8561]) +3 similar issues
> >    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-5/igt@kms_async_flips@crc@pipe-d-edp-1.html
> > 
> >   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> >     - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#1769] / [i915#3555])
> >    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> > 
> >   * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
> >     - shard-mtlp:         NOTRUN -> [SKIP][135] ([fdo#111614]) +1 similar issue
> >    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-2/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
> > 
> >   * igt@kms_big_fb@4-tiled-addfb-size-overflow:
> >     - shard-tglu:         NOTRUN -> [SKIP][136] ([i915#5286])
> >    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-6/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
> > 
> >   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> >     - shard-mtlp:         [PASS][137] -> [FAIL][138] ([i915#5138])
> >    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> >    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> > 
> >   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> >     - shard-mtlp:         [PASS][139] -> [FAIL][140] ([i915#3743])
> >    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> >    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> > 
> >   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> >     - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#5286]) +5 similar issues
> >    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> > 
> >   * igt@kms_big_fb@linear-32bpp-rotate-270:
> >     - shard-tglu:         NOTRUN -> [SKIP][142] ([fdo#111614])
> >    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-10/igt@kms_big_fb@linear-32bpp-rotate-270.html
> > 
> >   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
> >     - shard-rkl:          NOTRUN -> [SKIP][143] ([fdo#111614] / [i915#3638]) +2 similar issues
> >    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> > 
> >   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> >     - shard-dg2:          NOTRUN -> [SKIP][144] ([fdo#111614]) +6 similar issues
> >    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> > 
> >   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
> >     - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#5190]) +13 similar issues
> >    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-10/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> > 
> >   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> >     - shard-tglu:         [PASS][146] -> [FAIL][147] ([i915#3743])
> >    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-tglu-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> >    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> > 
> >   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> >     - shard-rkl:          NOTRUN -> [SKIP][148] ([fdo#111615])
> >    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> >     - shard-dg1:          NOTRUN -> [SKIP][149] ([fdo#111615])
> >    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-14/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> > 
> >   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
> >     - shard-tglu:         NOTRUN -> [SKIP][150] ([fdo#111615]) +1 similar issue
> >    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
> > 
> >   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> >     - shard-rkl:          NOTRUN -> [SKIP][151] ([fdo#110723]) +3 similar issues
> >    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> > 
> >   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> >     - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#4538] / [i915#5190]) +5 similar issues
> >    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> >     - shard-mtlp:         NOTRUN -> [SKIP][153] ([fdo#111615]) +3 similar issues
> >    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> > 
> >   * igt@kms_big_joiner@2x-modeset:
> >     - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#2705])
> >    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-4/igt@kms_big_joiner@2x-modeset.html
> >     - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#2705])
> >    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-19/igt@kms_big_joiner@2x-modeset.html
> >     - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#2705])
> >    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-12/igt@kms_big_joiner@2x-modeset.html
> > 
> >   * igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:
> >     - shard-mtlp:         NOTRUN -> [SKIP][157] ([i915#6095]) +12 similar issues
> >    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-6/igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs_cc.html
> > 
> >   * igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_mc_ccs:
> >     - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#3886] / [i915#5354] / [i915#6095]) +2 similar issues
> >    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-4/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_mc_ccs.html
> >     - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])
> >    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-16/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_mc_ccs.html
> > 
> >   * igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
> >     - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#3886] / [i915#6095])
> >    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-8/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html
> > 
> >   * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_mtl_rc_ccs_cc:
> >     - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#5354] / [i915#6095]) +9 similar issues
> >    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_mtl_rc_ccs_cc.html
> > 
> >   * igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_mtl_rc_ccs_cc:
> >     - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#5354] / [i915#6095]) +4 similar issues
> >    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-10/igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_mtl_rc_ccs_cc.html
> > 
> >   * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs:
> >     - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#3734] / [i915#5354] / [i915#6095]) +5 similar issues
> >    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-4/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs.html
> > 
> >   * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
> >     - shard-apl:          NOTRUN -> [SKIP][164] ([fdo#109271] / [i915#3886]) +4 similar issues
> >    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-apl3/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
> > 
> >   * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
> >     - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#5354]) +22 similar issues
> >    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-4/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html
> > 
> >   * igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_mc_ccs:
> >     - shard-tglu:         NOTRUN -> [SKIP][166] ([i915#3689] / [i915#5354] / [i915#6095]) +4 similar issues
> >    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-5/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_mc_ccs.html
> > 
> >   * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
> >     - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#3689] / [i915#3886] / [i915#5354]) +11 similar issues
> >    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html
> > 
> >   * igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs:
> >     - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#5354]) +53 similar issues
> >    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-2/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs.html
> > 
> >   * igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs:
> >     - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#3689] / [i915#5354]) +18 similar issues
> >    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-11/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html
> > 
> >   * igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
> >     - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#5354] / [i915#6095])
> >    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-15/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html
> > 
> >   * igt@kms_cdclk@mode-transition-all-outputs:
> >     - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#3742])
> >    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-4/igt@kms_cdclk@mode-transition-all-outputs.html
> > 
> >   * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
> >     - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#4087] / [i915#7213]) +4 similar issues
> >    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-12/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html
> > 
> >   * igt@kms_chamelium_color@ctm-green-to-red:
> >     - shard-dg2:          NOTRUN -> [SKIP][173] ([fdo#111827]) +2 similar issues
> >    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-2/igt@kms_chamelium_color@ctm-green-to-red.html
> > 
> >   * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
> >     - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#7828]) +1 similar issue
> >    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-10/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> > 
> >   * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
> >     - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#7828]) +10 similar issues
> >    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
> >     - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#7828]) +7 similar issues
> >    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
> >     - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#7828]) +1 similar issue
> >    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-16/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
> > 
> >   * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
> >     - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#7828]) +3 similar issues
> >    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-6/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
> > 
> >   * igt@kms_content_protection@content_type_change:
> >     - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#7118] / [i915#7162])
> >    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-11/igt@kms_content_protection@content_type_change.html
> > 
> >   * igt@kms_content_protection@dp-mst-lic-type-0:
> >     - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#3299])
> >    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-12/igt@kms_content_protection@dp-mst-lic-type-0.html
> > 
> >   * igt@kms_content_protection@srm@pipe-a-dp-1:
> >     - shard-apl:          NOTRUN -> [TIMEOUT][181] ([i915#7173])
> >    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-apl6/igt@kms_content_protection@srm@pipe-a-dp-1.html
> > 
> >   * igt@kms_content_protection@type1:
> >     - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#7118])
> >    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-4/igt@kms_content_protection@type1.html
> >     - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#6944] / [i915#7116] / [i915#7118])
> >    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-8/igt@kms_content_protection@type1.html
> > 
> >   * igt@kms_cursor_crc@cursor-onscreen-512x512:
> >     - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#3359])
> >    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> > 
> >   * igt@kms_cursor_crc@cursor-onscreen-max-size:
> >     - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#3555]) +5 similar issues
> >    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-max-size.html
> > 
> >   * igt@kms_cursor_crc@cursor-random-512x170:
> >     - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#3359]) +1 similar issue
> >    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-10/igt@kms_cursor_crc@cursor-random-512x170.html
> > 
> >   * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> >     - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#3555]) +3 similar issues
> >    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
> > 
> >   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
> >     - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#3359])
> >    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> > 
> >   * igt@kms_cursor_crc@cursor-sliding-32x10:
> >     - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#8814])
> >    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-6/igt@kms_cursor_crc@cursor-sliding-32x10.html
> > 
> >   * igt@kms_cursor_crc@cursor-sliding-32x32:
> >     - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#3555])
> >    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding-32x32.html
> > 
> >   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
> >     - shard-dg2:          NOTRUN -> [SKIP][191] ([fdo#109274] / [i915#5354]) +5 similar issues
> >    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-10/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> > 
> >   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
> >     - shard-tglu:         NOTRUN -> [SKIP][192] ([fdo#109274])
> >    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> > 
> >   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
> >     - shard-glk:          [PASS][193] -> [FAIL][194] ([i915#72])
> >    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
> >    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
> > 
> >   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> >     - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#4103] / [i915#4213]) +1 similar issue
> >    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> >     - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#4103])
> >    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> > 
> >   * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
> >     - shard-mtlp:         [PASS][197] -> [FAIL][198] ([i915#8248])
> >    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-3/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
> >    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
> > 
> >   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> >     - shard-apl:          NOTRUN -> [SKIP][199] ([fdo#109271] / [fdo#111767])
> >    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-apl2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> > 
> >   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> >     - shard-glk:          [PASS][200] -> [FAIL][201] ([i915#2346])
> >    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> >    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> > 
> >   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
> >     - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#3804])
> >    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
> > 
> >   * igt@kms_draw_crc@draw-method-mmap-gtt:
> >     - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#8812])
> >    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-12/igt@kms_draw_crc@draw-method-mmap-gtt.html
> > 
> >   * igt@kms_dsc@dsc-basic:
> >     - shard-mtlp:         NOTRUN -> [SKIP][204] ([i915#3840])
> >    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-3/igt@kms_dsc@dsc-basic.html
> > 
> >   * igt@kms_dsc@dsc-with-formats:
> >     - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#3555] / [i915#3840])
> >    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-6/igt@kms_dsc@dsc-with-formats.html
> > 
> >   * igt@kms_fbcon_fbt@psr:
> >     - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#3955])
> >    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-4/igt@kms_fbcon_fbt@psr.html
> >     - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#3469])
> >    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-10/igt@kms_fbcon_fbt@psr.html
> > 
> >   * igt@kms_fbcon_fbt@psr-suspend:
> >     - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#3469])
> >    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-10/igt@kms_fbcon_fbt@psr-suspend.html
> > 
> >   * igt@kms_fence_pin_leak:
> >     - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#4881])
> >    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-11/igt@kms_fence_pin_leak.html
> >     - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#4881])
> >    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-17/igt@kms_fence_pin_leak.html
> > 
> >   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> >     - shard-dg2:          NOTRUN -> [SKIP][211] ([fdo#109274] / [fdo#111767])
> >    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> >     - shard-rkl:          NOTRUN -> [SKIP][212] ([fdo#111767] / [fdo#111825])
> >    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> > 
> >   * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
> >     - shard-glk:          [PASS][213] -> [FAIL][214] ([i915#79])
> >    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html
> >    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html
> > 
> >   * igt@kms_flip@2x-flip-vs-fences:
> >     - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#8381]) +1 similar issue
> >    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-10/igt@kms_flip@2x-flip-vs-fences.html
> > 
> >   * igt@kms_flip@2x-flip-vs-panning-vs-hang:
> >     - shard-dg2:          NOTRUN -> [SKIP][216] ([fdo#109274]) +4 similar issues
> >    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-10/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> > 
> >   * igt@kms_flip@2x-nonexisting-fb:
> >     - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#3637])
> >    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-2/igt@kms_flip@2x-nonexisting-fb.html
> > 
> >   * igt@kms_flip@2x-plain-flip:
> >     - shard-rkl:          NOTRUN -> [SKIP][218] ([fdo#111825]) +9 similar issues
> >    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-4/igt@kms_flip@2x-plain-flip.html
> >     - shard-tglu:         NOTRUN -> [SKIP][219] ([fdo#109274] / [i915#3637]) +4 similar issues
> >    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-8/igt@kms_flip@2x-plain-flip.html
> > 
> >   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a1-hdmi-a2:
> >     - shard-glk:          [PASS][220] -> [FAIL][221] ([i915#2122])
> >    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a1-hdmi-a2.html
> >    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-glk8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a1-hdmi-a2.html
> > 
> >   * igt@kms_flip@plain-flip-fb-recreate@b-vga1:
> >     - shard-snb:          [PASS][222] -> [ABORT][223] ([i915#8865])
> >    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-snb4/igt@kms_flip@plain-flip-fb-recreate@b-vga1.html
> >    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-snb7/igt@kms_flip@plain-flip-fb-recreate@b-vga1.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
> >     - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#2587] / [i915#2672])
> >    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
> >     - shard-mtlp:         NOTRUN -> [SKIP][225] ([i915#2672]) +1 similar issue
> >    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
> >     - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#2672]) +4 similar issues
> >    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
> >     - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#8810])
> >    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
> >     - shard-tglu:         NOTRUN -> [SKIP][228] ([i915#2587] / [i915#2672])
> >    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
> >     - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#2672]) +4 similar issues
> >    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-12/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
> >     - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#2672] / [i915#3555])
> >    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
> >     - shard-dg2:          [PASS][231] -> [FAIL][232] ([i915#6880]) +1 similar issue
> >    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
> >    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
> >     - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#8708]) +21 similar issues
> >    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:
> >     - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#1825]) +9 similar issues
> >    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
> >     - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#5439])
> >    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
> >     - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#8708]) +1 similar issue
> >    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
> >     - shard-rkl:          NOTRUN -> [SKIP][237] ([fdo#111825] / [i915#1825]) +25 similar issues
> >    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
> >     - shard-tglu:         NOTRUN -> [SKIP][238] ([fdo#109280]) +4 similar issues
> >    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
> >     - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#8708])
> >    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
> >     - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#3458])
> >    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt:
> >     - shard-tglu:         NOTRUN -> [SKIP][241] ([fdo#110189]) +6 similar issues
> >    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-1p-rte:
> >     - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#3458]) +25 similar issues
> >    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-rte.html
> >     - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#3023]) +20 similar issues
> >    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-rte.html
> > 
> >   * igt@kms_hdr@bpc-switch-dpms:
> >     - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#3555] / [i915#8228])
> >    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-1/igt@kms_hdr@bpc-switch-dpms.html
> >     - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#3555] / [i915#8228])
> >    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-10/igt@kms_hdr@bpc-switch-dpms.html
> > 
> >   * igt@kms_hdr@static-toggle:
> >     - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#3555] / [i915#8228]) +1 similar issue
> >    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-2/igt@kms_hdr@static-toggle.html
> > 
> >   * igt@kms_panel_fitting@atomic-fastset:
> >     - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#6301])
> >    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-4/igt@kms_panel_fitting@atomic-fastset.html
> > 
> >   * igt@kms_panel_fitting@legacy@pipe-a-edp-1:
> >     - shard-mtlp:         [PASS][248] -> [DMESG-WARN][249] ([i915#2017])
> >    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-6/igt@kms_panel_fitting@legacy@pipe-a-edp-1.html
> >    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-4/igt@kms_panel_fitting@legacy@pipe-a-edp-1.html
> > 
> >   * igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:
> >     - shard-mtlp:         [PASS][250] -> [FAIL][251] ([i915#1623])
> >    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-3/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html
> >    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-8/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html
> > 
> >   * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:
> >     - shard-apl:          NOTRUN -> [FAIL][252] ([i915#7862]) +1 similar issue
> >    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-apl2/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html
> > 
> >   * igt@kms_plane_lowres@tiling-y:
> >     - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#8821])
> >    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-10/igt@kms_plane_lowres@tiling-y.html
> > 
> >   * igt@kms_plane_multiple@tiling-yf:
> >     - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#3555] / [i915#8806])
> >    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-10/igt@kms_plane_multiple@tiling-yf.html
> > 
> >   * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-2:
> >     - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#5176]) +7 similar issues
> >    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-2.html
> > 
> >   * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-edp-1:
> >     - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#5176]) +3 similar issues
> >    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-6/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-edp-1.html
> > 
> >   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1:
> >     - shard-snb:          NOTRUN -> [SKIP][257] ([fdo#109271]) +163 similar issues
> >    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-snb4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1.html
> > 
> >   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:
> >     - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#5176]) +7 similar issues
> >    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-15/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html
> > 
> >   * igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-2:
> >     - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#5176]) +7 similar issues
> >    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-1/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-2.html
> > 
> >   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2:
> >     - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#5235]) +19 similar issues
> >    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2.html
> > 
> >   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1:
> >     - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#5235]) +3 similar issues
> >    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1.html
> > 
> >   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4:
> >     - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#5235]) +15 similar issues
> >    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-17/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4.html
> > 
> >   * igt@kms_prime@d3hot:
> >     - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#6524] / [i915#6805])
> >    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-1/igt@kms_prime@d3hot.html
> >     - shard-rkl:          NOTRUN -> [SKIP][264] ([i915#6524])
> >    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-2/igt@kms_prime@d3hot.html
> > 
> >   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
> >     - shard-tglu:         NOTRUN -> [SKIP][265] ([i915#658])
> >    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
> > 
> >   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
> >     - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#658]) +2 similar issues
> >    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-11/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
> >     - shard-dg1:          NOTRUN -> [SKIP][267] ([fdo#111068] / [i915#658])
> >    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-18/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
> > 
> >   * igt@kms_psr2_su@page_flip-xrgb8888:
> >     - shard-rkl:          NOTRUN -> [SKIP][268] ([fdo#111068] / [i915#658]) +2 similar issues
> >    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-2/igt@kms_psr2_su@page_flip-xrgb8888.html
> >     - shard-tglu:         NOTRUN -> [SKIP][269] ([fdo#109642] / [fdo#111068] / [i915#658])
> >    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-4/igt@kms_psr2_su@page_flip-xrgb8888.html
> > 
> >   * igt@kms_psr@cursor_blt:
> >     - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#1072]) +3 similar issues
> >    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-7/igt@kms_psr@cursor_blt.html
> > 
> >   * igt@kms_psr@dpms:
> >     - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#1072]) +11 similar issues
> >    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-6/igt@kms_psr@dpms.html
> > 
> >   * igt@kms_rotation_crc@primary-rotation-270:
> >     - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#4235]) +1 similar issue
> >    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-11/igt@kms_rotation_crc@primary-rotation-270.html
> > 
> >   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> >     - shard-mtlp:         NOTRUN -> [SKIP][273] ([i915#5289]) +1 similar issue
> >    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> > 
> >   * igt@kms_selftest@drm_damage:
> >     - shard-snb:          NOTRUN -> [SKIP][274] ([fdo#109271] / [i915#8661])
> >    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-snb2/igt@kms_selftest@drm_damage.html
> > 
> >   * igt@kms_selftest@drm_dp_mst:
> >     - shard-apl:          NOTRUN -> [SKIP][275] ([fdo#109271] / [i915#8661])
> >    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-apl4/igt@kms_selftest@drm_dp_mst.html
> > 
> >   * igt@kms_selftest@drm_format_helper:
> >     - shard-tglu:         NOTRUN -> [SKIP][276] ([i915#8661])
> >    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-4/igt@kms_selftest@drm_format_helper.html
> > 
> >   * igt@kms_selftest@drm_plane:
> >     - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#8661]) +2 similar issues
> >    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-10/igt@kms_selftest@drm_plane.html
> >     - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#8661]) +2 similar issues
> >    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-1/igt@kms_selftest@drm_plane.html
> >     - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#8661])
> >    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-18/igt@kms_selftest@drm_plane.html
> > 
> >   * igt@kms_setmode@basic-clone-single-crtc:
> >     - shard-mtlp:         NOTRUN -> [SKIP][280] ([i915#8809])
> >    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-5/igt@kms_setmode@basic-clone-single-crtc.html
> > 
> >   * igt@kms_setmode@invalid-clone-exclusive-crtc:
> >     - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#8823])
> >    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-3/igt@kms_setmode@invalid-clone-exclusive-crtc.html
> > 
> >   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
> >     - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#3555] / [i915#4098])
> >    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> > 
> >   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> >     - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#8623])
> >    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> >     - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#8623])
> >    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> > 
> >   * igt@kms_tv_load_detect@load-detect:
> >     - shard-dg2:          NOTRUN -> [SKIP][285] ([fdo#109309])
> >    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-11/igt@kms_tv_load_detect@load-detect.html
> > 
> >   * igt@kms_vblank@pipe-c-wait-forked:
> >     - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#4070] / [i915#6768]) +2 similar issues
> >    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-7/igt@kms_vblank@pipe-c-wait-forked.html
> > 
> >   * igt@kms_vblank@pipe-d-query-forked-busy:
> >     - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#4070] / [i915#533] / [i915#6768]) +3 similar issues
> >    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-2/igt@kms_vblank@pipe-d-query-forked-busy.html
> > 
> >   * igt@kms_writeback@writeback-pixel-formats:
> >     - shard-apl:          NOTRUN -> [SKIP][288] ([fdo#109271] / [i915#2437])
> >    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-apl6/igt@kms_writeback@writeback-pixel-formats.html
> >     - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#2437])
> >    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-11/igt@kms_writeback@writeback-pixel-formats.html
> > 
> >   * igt@perf@global-sseu-config-invalid:
> >     - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#7387]) +1 similar issue
> >    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-2/igt@perf@global-sseu-config-invalid.html
> > 
> >   * igt@perf@mi-rpc:
> >     - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#2434])
> >    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-4/igt@perf@mi-rpc.html
> > 
> >   * igt@perf_pmu@rc6@runtime-pm-long-gt1:
> >     - shard-mtlp:         [PASS][292] -> [SKIP][293] ([i915#8537]) +2 similar issues
> >    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-4/igt@perf_pmu@rc6@runtime-pm-long-gt1.html
> >    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-2/igt@perf_pmu@rc6@runtime-pm-long-gt1.html
> > 
> >   * igt@tools_test@sysfs_l3_parity:
> >     - shard-rkl:          NOTRUN -> [SKIP][294] ([fdo#109307])
> >    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-1/igt@tools_test@sysfs_l3_parity.html
> > 
> >   * igt@v3d/v3d_get_param@base-params:
> >     - shard-mtlp:         NOTRUN -> [SKIP][295] ([i915#2575]) +2 similar issues
> >    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-6/igt@v3d/v3d_get_param@base-params.html
> > 
> >   * igt@v3d/v3d_perfmon@get-values-invalid-pad:
> >     - shard-tglu:         NOTRUN -> [SKIP][296] ([fdo#109315] / [i915#2575]) +2 similar issues
> >    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-2/igt@v3d/v3d_perfmon@get-values-invalid-pad.html
> > 
> >   * igt@v3d/v3d_submit_cl@simple-flush-cache:
> >     - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#2575]) +13 similar issues
> >    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-1/igt@v3d/v3d_submit_cl@simple-flush-cache.html
> > 
> >   * igt@v3d/v3d_submit_csd@job-perfmon:
> >     - shard-rkl:          NOTRUN -> [SKIP][298] ([fdo#109315]) +5 similar issues
> >    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-7/igt@v3d/v3d_submit_csd@job-perfmon.html
> > 
> >   * igt@vc4/vc4_mmap@mmap-bad-handle:
> >     - shard-mtlp:         NOTRUN -> [SKIP][299] ([i915#7711])
> >    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-4/igt@vc4/vc4_mmap@mmap-bad-handle.html
> > 
> >   * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged:
> >     - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#2575])
> >    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-2/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged.html
> > 
> >   * igt@vc4/vc4_wait_bo@unused-bo-1ns:
> >     - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#7711]) +10 similar issues
> >    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-12/igt@vc4/vc4_wait_bo@unused-bo-1ns.html
> > 
> >   * igt@vc4/vc4_wait_seqno@bad-seqno-1ns:
> >     - shard-rkl:          NOTRUN -> [SKIP][302] ([i915#7711]) +7 similar issues
> >    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-1/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html
> > 
> >   
> > #### Possible fixes ####
> > 
> >   * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
> >     - shard-rkl:          [FAIL][303] ([i915#7742]) -> [PASS][304]
> >    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
> >    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-2/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
> > 
> >   * igt@gem_busy@extended@rcs0:
> >     - shard-dg2:          [TIMEOUT][305] -> [PASS][306]
> >    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-dg2-11/igt@gem_busy@extended@rcs0.html
> >    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-11/igt@gem_busy@extended@rcs0.html
> > 
> >   * igt@gem_ctx_persistence@legacy-engines-hang@bsd1:
> >     - shard-mtlp:         [FAIL][307] ([i915#2410]) -> [PASS][308]
> >    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-8/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html
> >    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-7/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html
> > 
> >   * igt@gem_ctx_persistence@saturated-hostile@vecs0:
> >     - shard-mtlp:         [FAIL][309] ([i915#7816]) -> [PASS][310] +2 similar issues
> >    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
> >    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-5/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
> > 
> >   * igt@gem_eio@in-flight-suspend:
> >     - shard-dg1:          [DMESG-WARN][311] ([i915#4391] / [i915#4423]) -> [PASS][312]
> >    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-dg1-14/igt@gem_eio@in-flight-suspend.html
> >    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-19/igt@gem_eio@in-flight-suspend.html
> > 
> >   * igt@gem_eio@unwedge-stress:
> >     - shard-dg1:          [FAIL][313] ([i915#5784]) -> [PASS][314]
> >    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-dg1-14/igt@gem_eio@unwedge-stress.html
> >    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-19/igt@gem_eio@unwedge-stress.html
> > 
> >   * igt@gem_exec_fair@basic-deadline:
> >     - shard-rkl:          [FAIL][315] ([i915#2846]) -> [PASS][316]
> >    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html
> >    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-7/igt@gem_exec_fair@basic-deadline.html
> > 
> >   * igt@gem_exec_fair@basic-pace-share@rcs0:
> >     - shard-tglu:         [FAIL][317] ([i915#2842]) -> [PASS][318]
> >    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-tglu-2/igt@gem_exec_fair@basic-pace-share@rcs0.html
> >    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-7/igt@gem_exec_fair@basic-pace-share@rcs0.html
> > 
> >   * igt@gem_exec_fair@basic-pace@rcs0:
> >     - shard-glk:          [FAIL][319] ([i915#2842]) -> [PASS][320]
> >    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-glk9/igt@gem_exec_fair@basic-pace@rcs0.html
> >    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-glk9/igt@gem_exec_fair@basic-pace@rcs0.html
> > 
> >   * igt@gem_exec_schedule@preempt-engines@ccs0:
> >     - shard-mtlp:         [FAIL][321] ([i915#9119]) -> [PASS][322] +4 similar issues
> >    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-4/igt@gem_exec_schedule@preempt-engines@ccs0.html
> >    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-5/igt@gem_exec_schedule@preempt-engines@ccs0.html
> > 
> >   * igt@gem_exec_schedule@preempt-engines@rcs0:
> >     - shard-mtlp:         [DMESG-FAIL][323] ([i915#8962]) -> [PASS][324]
> >    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-4/igt@gem_exec_schedule@preempt-engines@rcs0.html
> >    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-5/igt@gem_exec_schedule@preempt-engines@rcs0.html
> > 
> >   * igt@gem_exec_suspend@basic-s4-devices@lmem0:
> >     - shard-dg2:          [ABORT][325] ([i915#7975] / [i915#8213]) -> [PASS][326]
> >    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-dg2-6/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
> >    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
> > 
> >   * igt@gem_lmem_swapping@smem-oom@lmem0:
> >     - shard-dg1:          [TIMEOUT][327] ([i915#5493]) -> [PASS][328]
> >    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html
> >    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html
> > 
> >   * igt@gem_userptr_blits@huge-split:
> >     - shard-apl:          [FAIL][329] ([i915#3318]) -> [PASS][330]
> >    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-apl3/igt@gem_userptr_blits@huge-split.html
> >    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-apl1/igt@gem_userptr_blits@huge-split.html
> > 
> >   * igt@gen9_exec_parse@allowed-single:
> >     - shard-apl:          [ABORT][331] ([i915#5566]) -> [PASS][332]
> >    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-apl1/igt@gen9_exec_parse@allowed-single.html
> >    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-apl1/igt@gen9_exec_parse@allowed-single.html
> > 
> >   * igt@i915_hangman@engine-engine-error@vcs0:
> >     - shard-mtlp:         [FAIL][333] ([i915#7069]) -> [PASS][334]
> >    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-7/igt@i915_hangman@engine-engine-error@vcs0.html
> >    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-3/igt@i915_hangman@engine-engine-error@vcs0.html
> > 
> >   * igt@i915_module_load@reload-with-fault-injection:
> >     - shard-dg2:          [DMESG-WARN][335] ([i915#7061] / [i915#8617]) -> [PASS][336]
> >    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html
> >    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html
> >     - shard-mtlp:         [ABORT][337] ([i915#8489] / [i915#8668]) -> [PASS][338]
> >    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html
> >    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html
> > 
> >   * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
> >     - shard-dg2:          [SKIP][339] ([i915#1937]) -> [PASS][340]
> >    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-dg2-11/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
> >    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-12/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
> > 
> >   * igt@i915_pm_rpm@dpms-non-lpsp:
> >     - shard-rkl:          [SKIP][341] ([i915#1397]) -> [PASS][342]
> >    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-rkl-7/igt@i915_pm_rpm@dpms-non-lpsp.html
> >    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-4/igt@i915_pm_rpm@dpms-non-lpsp.html
> > 
> >   * igt@i915_pm_rpm@modeset-non-lpsp:
> >     - shard-dg2:          [SKIP][343] ([i915#1397]) -> [PASS][344]
> >    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-dg2-12/igt@i915_pm_rpm@modeset-non-lpsp.html
> >    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-11/igt@i915_pm_rpm@modeset-non-lpsp.html
> > 
> >   * igt@i915_selftest@live@gt_mocs:
> >     - shard-mtlp:         [DMESG-FAIL][345] ([i915#7059]) -> [PASS][346]
> >    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-3/igt@i915_selftest@live@gt_mocs.html
> >    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-6/igt@i915_selftest@live@gt_mocs.html
> > 
> >   * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-edp-1:
> >     - shard-mtlp:         [FAIL][347] ([i915#2521]) -> [PASS][348] +1 similar issue
> >    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-edp-1.html
> >    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-edp-1.html
> > 
> >   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
> >     - shard-mtlp:         [FAIL][349] ([i915#5138]) -> [PASS][350] +1 similar issue
> >    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> >    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> > 
> >   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> >     - shard-mtlp:         [FAIL][351] ([i915#3743]) -> [PASS][352]
> >    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> >    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> > 
> >   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
> >     - shard-mtlp:         [FAIL][353] ([i915#8248]) -> [PASS][354]
> >    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-5/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
> >    [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-5/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
> >     - shard-dg2:          [FAIL][355] ([i915#6880]) -> [PASS][356]
> >    [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
> >    [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
> > 
> >   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:
> >     - shard-apl:          [ABORT][357] ([i915#180]) -> [PASS][358]
> >    [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html
> >    [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html
> > 
> >   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
> >     - shard-tglu:         [FAIL][359] ([i915#8292]) -> [PASS][360]
> >    [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-tglu-10/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
> >    [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-3/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
> > 
> >   * igt@kms_properties@get_properties-sanity-non-atomic:
> >     - shard-dg1:          [DMESG-WARN][361] ([i915#4423]) -> [PASS][362]
> >    [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-dg1-14/igt@kms_properties@get_properties-sanity-non-atomic.html
> >    [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-16/igt@kms_properties@get_properties-sanity-non-atomic.html
> > 
> >   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
> >     - shard-rkl:          [ABORT][363] ([i915#7461] / [i915#8178] / [i915#8875]) -> [PASS][364]
> >    [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-rkl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> >    [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> > 
> >   * igt@perf_pmu@render-node-busy-idle@ccs0:
> >     - shard-mtlp:         [FAIL][365] ([i915#4349]) -> [PASS][366] +4 similar issues
> >    [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-2/igt@perf_pmu@render-node-busy-idle@ccs0.html
> >    [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-3/igt@perf_pmu@render-node-busy-idle@ccs0.html
> > 
> >   * igt@perf_pmu@render-node-busy-idle@ccs2:
> >     - shard-dg2:          [FAIL][367] ([i915#4349]) -> [PASS][368] +5 similar issues
> >    [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-dg2-11/igt@perf_pmu@render-node-busy-idle@ccs2.html
> >    [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-6/igt@perf_pmu@render-node-busy-idle@ccs2.html
> > 
> >   * igt@sysfs_heartbeat_interval@precise@vecs0:
> >     - shard-mtlp:         [FAIL][369] ([i915#8332]) -> [PASS][370]
> >    [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-mtlp-2/igt@sysfs_heartbeat_interval@precise@vecs0.html
> >    [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-mtlp-4/igt@sysfs_heartbeat_interval@precise@vecs0.html
> > 
> >   
> > #### Warnings ####
> > 
> >   * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
> >     - shard-dg2:          [TIMEOUT][371] -> [SKIP][372] ([i915#4083]) +1 similar issue
> >    [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-dg2-11/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html
> >    [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-2/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html
> > 
> >   * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
> >     - shard-tglu:         [FAIL][373] ([i915#2681] / [i915#3591]) -> [WARN][374] ([i915#2681])
> >    [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
> >    [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
> > 
> >   * igt@i915_suspend@basic-s2idle-without-i915:
> >     - shard-snb:          [ABORT][375] ([i915#4528] / [i915#8213] / [i915#8841]) -> [DMESG-WARN][376] ([i915#8841])
> >    [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-snb5/igt@i915_suspend@basic-s2idle-without-i915.html
> >    [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-snb4/igt@i915_suspend@basic-s2idle-without-i915.html
> > 
> >   * igt@i915_suspend@basic-s3-without-i915:
> >     - shard-rkl:          [INCOMPLETE][377] ([i915#4817]) -> [FAIL][378] ([fdo#103375])
> >    [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-rkl-1/igt@i915_suspend@basic-s3-without-i915.html
> >    [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-rkl-2/igt@i915_suspend@basic-s3-without-i915.html
> > 
> >   * igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_mtl_rc_ccs:
> >     - shard-dg2:          [TIMEOUT][379] -> [SKIP][380] ([i915#5354])
> >    [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-dg2-11/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_mtl_rc_ccs.html
> >    [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg2-1/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_mtl_rc_ccs.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-suspend:
> >     - shard-snb:          [INCOMPLETE][381] -> [DMESG-WARN][382] ([i915#8841])
> >    [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-snb7/igt@kms_frontbuffer_tracking@fbc-suspend.html
> >    [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-snb5/igt@kms_frontbuffer_tracking@fbc-suspend.html
> > 
> >   * igt@kms_psr@primary_mmap_gtt:
> >     - shard-dg1:          [SKIP][383] ([i915#1072]) -> [SKIP][384] ([i915#1072] / [i915#4078])
> >    [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-dg1-17/igt@kms_psr@primary_mmap_gtt.html
> >    [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-16/igt@kms_psr@primary_mmap_gtt.html
> > 
> >   * igt@kms_psr@primary_page_flip:
> >     - shard-dg1:          [SKIP][385] ([i915#1072] / [i915#4078]) -> [SKIP][386] ([i915#1072])
> >    [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13517/shard-dg1-16/igt@kms_psr@primary_page_flip.html
> >    [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/shard-dg1-14/igt@kms_psr@primary_page_flip.html
> > 
> >   
> >   {name}: This element is suppressed. This means it is ignored when computing
> >           the status of the difference (SUCCESS, WARNING, or FAILURE).
> > 
> >   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
> >   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
> >   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
> >   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
> >   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
> >   [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
> >   [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
> >   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
> >   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
> >   [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
> >   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
> >   [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
> >   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
> >   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
> >   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
> >   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
> >   [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
> >   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
> >   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
> >   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
> >   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
> >   [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
> >   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
> >   [i915#1623]: https://gitlab.freedesktop.org/drm/intel/issues/1623
> >   [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
> >   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
> >   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
> >   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
> >   [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
> >   [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
> >   [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
> >   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
> >   [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
> >   [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
> >   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
> >   [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
> >   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
> >   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
> >   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
> >   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
> >   [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
> >   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
> >   [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
> >   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
> >   [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
> >   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
> >   [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
> >   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
> >   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
> >   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
> >   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
> >   [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
> >   [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
> >   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
> >   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
> >   [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
> >   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
> >   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
> >   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
> >   [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
> >   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
> >   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
> >   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
> >   [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
> >   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
> >   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
> >   [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
> >   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
> >   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
> >   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
> >   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
> >   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
> >   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
> >   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
> >   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
> >   [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
> >   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
> >   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
> >   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
> >   [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
> >   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
> >   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
> >   [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
> >   [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
> >   [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
> >   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
> >   [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
> >   [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
> >   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
> >   [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
> >   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
> >   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
> >   [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
> >   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
> >   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
> >   [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
> >   [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
> >   [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
> >   [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
> >   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
> >   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
> >   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
> >   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
> >   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
> >   [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
> >   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
> >   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
> >   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
> >   [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
> >   [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
> >   [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
> >   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
> >   [i915#5882]: https://gitlab.freedesktop.org/drm/intel/issues/5882
> >   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
> >   [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
> >   [i915#6122]: https://gitlab.freedesktop.org/drm/intel/issues/6122
> >   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
> >   [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
> >   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
> >   [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
> >   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
> >   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
> >   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
> >   [i915#6763]: https://gitlab.freedesktop.org/drm/intel/issues/6763
> >   [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
> >   [i915#6805]: https://gitlab.freedesktop.org/drm/intel/issues/6805
> >   [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
> >   [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
> >   [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
> >   [i915#7061]: https://gitlab.freedesktop.org/drm/intel/issues/7061
> >   [i915#7069]: https://gitlab.freedesktop.org/drm/intel/issues/7069
> >   [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
> >   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
> >   [i915#7162]: https://gitlab.freedesktop.org/drm/intel/issues/7162
> >   [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
> >   [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
> >   [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
> >   [i915#7276]: https://gitlab.freedesktop.org/drm/intel/issues/7276
> >   [i915#7387]: https://gitlab.freedesktop.org/drm/intel/issues/7387
> >   [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
> >   [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
> >   [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
> >   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
> >   [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
> >   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
> >   [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
> >   [i915#7816]: https://gitlab.freedesktop.org/drm/intel/issues/7816
> >   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
> >   [i915#7862]: https://gitlab.freedesktop.org/drm/intel/issues/7862
> >   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
> >   [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
> >   [i915#8178]: https://gitlab.freedesktop.org/drm/intel/issues/8178
> >   [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
> >   [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
> >   [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
> >   [i915#8248]: https://gitlab.freedesktop.org/drm/intel/issues/8248
> >   [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
> >   [i915#8332]: https://gitlab.freedesktop.org/drm/intel/issues/8332
> >   [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
> >   [i915#8399]: https://gitlab.freedesktop.org/drm/intel/issues/8399
> >   [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
> >   [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
> >   [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
> >   [i915#8489]: https://gitlab.freedesktop.org/drm/intel/issues/8489
> >   [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502
> >   [i915#8537]: https://gitlab.freedesktop.org/drm/intel/issues/8537
> >   [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
> >   [i915#8561]: https://gitlab.freedesktop.org/drm/intel/issues/8561
> >   [i915#8562]: https://gitlab.freedesktop.org/drm/intel/issues/8562
> >   [i915#8617]: https://gitlab.freedesktop.org/drm/intel/issues/8617
> >   [i915#8623]: https://gitlab.freedesktop.org/drm/intel/issues/8623
> >   [i915#8661]: https://gitlab.freedesktop.org/drm/intel/issues/8661
> >   [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
> >   [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
> >   [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
> >   [i915#8717]: https://gitlab.freedesktop.org/drm/intel/issues/8717
> >   [i915#8764]: https://gitlab.freedesktop.org/drm/intel/issues/8764
> >   [i915#8806]: https://gitlab.freedesktop.org/drm/intel/issues/8806
> >   [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
> >   [i915#8810]: https://gitlab.freedesktop.org/drm/intel/issues/8810
> >   [i915#8812]: https://gitlab.freedesktop.org/drm/intel/issues/8812
> >   [i915#8814]: https://gitlab.freedesktop.org/drm/intel/issues/8814
> >   [i915#8821]: https://gitlab.freedesktop.org/drm/intel/issues/8821
> >   [i915#8823]: https://gitlab.freedesktop.org/drm/intel/issues/8823
> >   [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
> >   [i915#8865]: https://gitlab.freedesktop.org/drm/intel/issues/8865
> >   [i915#8875]: https://gitlab.freedesktop.org/drm/intel/issues/8875
> >   [i915#8898]: https://gitlab.freedesktop.org/drm/intel/issues/8898
> >   [i915#8925]: https://gitlab.freedesktop.org/drm/intel/issues/8925
> >   [i915#8957]: https://gitlab.freedesktop.org/drm/intel/issues/8957
> >   [i915#8962]: https://gitlab.freedesktop.org/drm/intel/issues/8962
> >   [i915#9051]: https://gitlab.freedesktop.org/drm/intel/issues/9051
> >   [i915#9067]: https://gitlab.freedesktop.org/drm/intel/issues/9067
> >   [i915#9119]: https://gitlab.freedesktop.org/drm/intel/issues/9119
> >   [i915#9121]: https://gitlab.freedesktop.org/drm/intel/issues/9121
> > 
> > 
> > Build changes
> > -------------
> > 
> >   * CI: CI-20190529 -> None
> >   * IGT: IGT_7435 -> IGTPW_9587
> >   * Piglit: piglit_4509 -> None
> > 
> >   CI-20190529: 20190529
> >   CI_DRM_13517: 85f20fb339f05ec4221bb295c13e46061c5c566f @ git://anongit.freedesktop.org/gfx-ci/linux
> >   IGTPW_9587: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/index.html
> >   IGT_7435: b6eaa6bfdc94c94b34ec80f437c4b6125eb19357 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> >   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> > 
> > == Logs ==
> > 
> > For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9587/index.html
