Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF01411BA8E
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jun 2022 17:41:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------FzZF2GpY9mhW0Ecl80BWu097"
Message-ID: <c157a1bc-f64b-0051-3bb6-072e54bc670f@intel.com>
Date: Mon, 6 Jun 2022 10:40:43 -0700
Content-Language: en-GB
To: <igt-dev@lists.freedesktop.org>
References: <20220603162552.2254187-1-John.C.Harrison@Intel.com>
 <165430762912.17738.12729220686168271848@emeril.freedesktop.org>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <165430762912.17738.12729220686168271848@emeril.freedesktop.org>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgVXBkYXRl?=
 =?utf-8?q?_DRM_UAPI_and_add_test_for_new_hw_info_query_=28rev3=29?=
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

--------------FzZF2GpY9mhW0Ecl80BWu097
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/3/2022 18:53, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	Update DRM UAPI and add test for new hw info query (rev3)
> *URL:* 	https://patchwork.freedesktop.org/series/104693/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/index.html
>
>
>   CI Bug Log - changes from CI_DRM_11727_full -> IGTPW_7231_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_7231_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7231_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/index.html
>
>
>     Participating hosts (13 -> 10)
>
> Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_7231_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     {igt@i915_query@hwconfig_table} (NEW):
>
>      o
>
>         {shard-tglu}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglu-6/igt@i915_query@hwconfig_table.html>
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb2/igt@i915_query@hwconfig_table.html>
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb7/igt@i915_query@hwconfig_table.html>
>
>      o
>
>         {shard-rkl}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-2/igt@i915_query@hwconfig_table.html>
>
The table is only available on ADL-P onwards so these skips are expected.

Unfortunately, we don't get to see a pass because it looks like there 
are no ADL-P or DG2 systems in the shards set.

>  *
>      o
>
>  *
>
>     igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
>
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-kbl3/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html>
>
Unrelated display failure.

John.

>  *
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>   * igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1:
>       o {shard-rkl}: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html>
>         +1 similar issue
>
>
>     New tests
>
> New tests have been introduced between CI_DRM_11727_full and 
> IGTPW_7231_full:
>
>
>       New IGT tests (1)
>
>   * igt@i915_query@hwconfig_table:
>       o Statuses : 8 skip(s)
>       o Exec time: [0.0] s
>
>
>     Known issues
>
> Here are the changes found in IGTPW_7231_full that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@core_hotunplug@unbind-rebind:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-snb2/igt@core_hotunplug@unbind-rebind.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-snb7/igt@core_hotunplug@unbind-rebind.html>
>         (i915#4528 <https://gitlab.freedesktop.org/drm/intel/issues/4528>)
>  *
>
>     igt@gem_ccs@block-copy-uncompressed:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb7/igt@gem_ccs@block-copy-uncompressed.html>
>         (i915#5327 <https://gitlab.freedesktop.org/drm/intel/issues/5327>)
>  *
>
>     igt@gem_ctx_isolation@preservation-s3@vcs0:
>
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vcs0.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html>
>         (i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180>) +10
>         similar issues
>  *
>
>     igt@gem_ctx_persistence@legacy-engines-mixed-process:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-snb2/igt@gem_ctx_persistence@legacy-engines-mixed-process.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1099 <https://gitlab.freedesktop.org/drm/intel/issues/1099>)
>  *
>
>     igt@gem_eio@kms:
>
>       o shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb2/igt@gem_eio@kms.html>
>         (i915#5784 <https://gitlab.freedesktop.org/drm/intel/issues/5784>)
>  *
>
>     igt@gem_eio@reset-stress:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-glk7/igt@gem_eio@reset-stress.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-glk4/igt@gem_eio@reset-stress.html>
>         (i915#118
>         <https://gitlab.freedesktop.org/drm/intel/issues/118> /
>         i915#1888 <https://gitlab.freedesktop.org/drm/intel/issues/1888>)
>  *
>
>     igt@gem_exec_balancer@parallel-contexts:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-iclb2/igt@gem_exec_balancer@parallel-contexts.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb8/igt@gem_exec_balancer@parallel-contexts.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/intel/issues/4525>) +1
>         similar issue
>  *
>
>     igt@gem_exec_fair@basic-deadline:
>
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@gem_exec_fair@basic-deadline.html>
>         (i915#6141 <https://gitlab.freedesktop.org/drm/intel/issues/6141>)
>  *
>
>     igt@gem_exec_fair@basic-pace@rcs0:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-iclb2/igt@gem_exec_fair@basic-pace@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb5/igt@gem_exec_fair@basic-pace@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>  *
>
>     igt@gem_exec_fair@basic-pace@vecs0:
>
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +1
>         similar issue
>  *
>
>     igt@gem_exec_fair@basic-throttle@rcs0:
>
>      o
>
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>
>      o
>
>         shard-iclb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         (i915#2849 <https://gitlab.freedesktop.org/drm/intel/issues/2849>)
>
>      o
>
>         shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb6/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>
>  *
>
>     igt@gem_exec_flush@basic-wb-pro-default:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-snb2/igt@gem_exec_flush@basic-wb-pro-default.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-snb6/igt@gem_exec_flush@basic-wb-pro-default.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +2
>         similar issues
>  *
>
>     igt@gem_lmem_swapping@verify-ccs:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb8/igt@gem_lmem_swapping@verify-ccs.html>
>         (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>  *
>
>     igt@gem_pread@exhaustion:
>
>       o shard-kbl: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl3/igt@gem_pread@exhaustion.html>
>         (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
>  *
>
>     igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb7/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/intel/issues/4270>) +1
>         similar issue
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb1/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/intel/issues/4270>) +2
>         similar issues
>
>  *
>
>     igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb7/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html>
>         (i915#768 <https://gitlab.freedesktop.org/drm/intel/issues/768>)
>  *
>
>     igt@gem_userptr_blits@dmabuf-sync:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb1/igt@gem_userptr_blits@dmabuf-sync.html>
>         (i915#3323 <https://gitlab.freedesktop.org/drm/intel/issues/3323>)
>  *
>
>     igt@gem_userptr_blits@vma-merge:
>
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl6/igt@gem_userptr_blits@vma-merge.html>
>         (i915#3318 <https://gitlab.freedesktop.org/drm/intel/issues/3318>)
>  *
>
>     igt@gen3_render_linear_blits:
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb3/igt@gen3_render_linear_blits.html>
>         (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb3/igt@gen3_render_linear_blits.html>
>         (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>
>  *
>
>     igt@gen9_exec_parse@allowed-single:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-apl4/igt@gen9_exec_parse@allowed-single.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl1/igt@gen9_exec_parse@allowed-single.html>
>         (i915#5566
>         <https://gitlab.freedesktop.org/drm/intel/issues/5566> /
>         i915#716 <https://gitlab.freedesktop.org/drm/intel/issues/716>)
>  *
>
>     igt@gen9_exec_parse@batch-without-end:
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb2/igt@gen9_exec_parse@batch-without-end.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/intel/issues/2856>) +1
>         similar issue
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb1/igt@gen9_exec_parse@batch-without-end.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/intel/issues/2527> /
>         i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>)
>
>  *
>
>     igt@i915_pm_dc@dc9-dpms:
>
>      o
>
>         shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-iclb4/igt@i915_pm_dc@dc9-dpms.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html>
>         (i915#4281 <https://gitlab.freedesktop.org/drm/intel/issues/4281>)
>
>      o
>
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-apl3/igt@i915_pm_dc@dc9-dpms.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl7/igt@i915_pm_dc@dc9-dpms.html>
>         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>
>  *
>
>     igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         (fdo#110892 <https://bugs.freedesktop.org/show_bug.cgi?id=110892>)
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         (fdo#111644
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111644> /
>         i915#1397
>         <https://gitlab.freedesktop.org/drm/intel/issues/1397> /
>         i915#2411 <https://gitlab.freedesktop.org/drm/intel/issues/2411>)
>
>  *
>
>     igt@i915_pm_rpm@modeset-pc8-residency-stress:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html>
>         (fdo#109506
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109506> /
>         i915#2411 <https://gitlab.freedesktop.org/drm/intel/issues/2411>)
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb5/igt@i915_pm_rpm@modeset-pc8-residency-stress.html>
>         (fdo#109293
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109293> /
>         fdo#109506 <https://bugs.freedesktop.org/show_bug.cgi?id=109506>)
>
>  *
>
>     igt@i915_query@test-query-geometry-subslices:
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb5/igt@i915_query@test-query-geometry-subslices.html>
>         (i915#5723 <https://gitlab.freedesktop.org/drm/intel/issues/5723>)
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb7/igt@i915_query@test-query-geometry-subslices.html>
>         (i915#5723 <https://gitlab.freedesktop.org/drm/intel/issues/5723>)
>
>  *
>
>     igt@i915_selftest@live@hangcheck:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-snb7/igt@i915_selftest@live@hangcheck.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-snb2/igt@i915_selftest@live@hangcheck.html>
>         (i915#3921 <https://gitlab.freedesktop.org/drm/intel/issues/3921>)
>  *
>
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         (i915#404 <https://gitlab.freedesktop.org/drm/intel/issues/404>)
>  *
>
>     igt@kms_big_fb@4-tiled-addfb-size-overflow:
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb5/igt@kms_big_fb@4-tiled-addfb-size-overflow.html>
>         (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb5/igt@kms_big_fb@4-tiled-addfb-size-overflow.html>
>         (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>
>  *
>
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html>
>         (fdo#110723
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110723>) +1
>         similar issue
>  *
>
>     igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl8/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
>         similar issue
>  *
>
>     igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb6/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc.html>
>         (i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>  *
>
>     igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl6/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +5
>         similar issues
>  *
>
>     igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb7/igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615> /
>         i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>)
>  *
>
>     igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb6/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689>) +1
>         similar issue
>  *
>
>     igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb3/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>
>      o
>
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-glk6/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
>         similar issue
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb1/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
>         similar issue
>
>  *
>
>     igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl7/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +52
>         similar issues
>  *
>
>     igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
>
>      o
>
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl4/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb1/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>
>      o
>
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-glk4/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>
>      o
>
>         shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-snb6/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>
>  *
>
>     igt@kms_chamelium@hdmi-hpd-storm:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@kms_chamelium@hdmi-hpd-storm.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +5
>         similar issues
>  *
>
>     igt@kms_color_chamelium@pipe-c-ctm-limited-range:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb6/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
>  *
>
>     igt@kms_cursor_crc@pipe-a-cursor-max-size-rapid-movement:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-max-size-rapid-movement.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278>) +23
>         similar issues
>  *
>
>     igt@kms_cursor_crc@pipe-c-cursor-512x170-random:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb8/igt@kms_cursor_crc@pipe-c-cursor-512x170-random.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         fdo#109279 <https://bugs.freedesktop.org/show_bug.cgi?id=109279>)
>  *
>
>     igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen.html>
>         (i915#3359
>         <https://gitlab.freedesktop.org/drm/intel/issues/3359>) +1
>         similar issue
>  *
>
>     igt@kms_cursor_crc@pipe-c-cursor-suspend:
>
>      o
>
>         shard-kbl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html>
>         (i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180>) +1
>         similar issue
>
>      o
>
>         shard-apl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>
>  *
>
>     igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding.html>
>         (i915#3319
>         <https://gitlab.freedesktop.org/drm/intel/issues/3319>) +1
>         similar issue
>  *
>
>     igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement.html>
>         (fdo#109279
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109279> /
>         i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>  *
>
>     igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278>) +1
>         similar issue
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-iclb8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html>
>         (i915#2346
>         <https://gitlab.freedesktop.org/drm/intel/issues/2346>) +1
>         similar issue
>  *
>
>     igt@kms_draw_crc@draw-method-rgb565-render-4tiled:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb6/igt@kms_draw_crc@draw-method-rgb565-render-4tiled.html>
>         (i915#5287 <https://gitlab.freedesktop.org/drm/intel/issues/5287>)
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb3/igt@kms_draw_crc@draw-method-rgb565-render-4tiled.html>
>         (i915#5287
>         <https://gitlab.freedesktop.org/drm/intel/issues/5287>) +1
>         similar issue
>
>  *
>
>     igt@kms_flip@2x-nonexisting-fb-interruptible:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb1/igt@kms_flip@2x-nonexisting-fb-interruptible.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274>) +1
>         similar issue
>  *
>
>     igt@kms_flip@2x-plain-flip:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb3/igt@kms_flip@2x-plain-flip.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html>
>         (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>         +1 similar issue
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html>
>         (i915#2587 <https://gitlab.freedesktop.org/drm/intel/issues/2587>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html>
>         (i915#3701 <https://gitlab.freedesktop.org/drm/intel/issues/3701>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +94
>         similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +13
>         similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280> /
>         fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +7
>         similar issues
>  *
>
>     igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
>
>      o
>
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html>
>         (i915#265 <https://gitlab.freedesktop.org/drm/intel/issues/265>)
>
>      o
>
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-glk6/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html>
>         (i915#265 <https://gitlab.freedesktop.org/drm/intel/issues/265>)
>
>  *
>
>     igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb2/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615>) +2
>         similar issues
>  *
>
>     igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-edp-1:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb7/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-edp-1.html>
>         (i915#5176
>         <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +3
>         similar issues
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb1/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-edp-1.html>
>         (i915#5176
>         <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +2
>         similar issues
>
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-glk7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +46
>         similar issues
>  *
>
>     igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>
>      o
>
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl4/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>         (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>
>      o
>
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-glk4/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb4/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>         i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>
>  *
>
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl3/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) +1
>         similar issue
>  *
>
>     igt@kms_psr@cursor_render:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@kms_psr@cursor_render.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +152
>         similar issues
>  *
>
>     igt@kms_psr@psr2_basic:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb8/igt@kms_psr@psr2_basic.html>
>         (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>  *
>
>     igt@kms_psr@psr2_cursor_plane_onoff:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb6/igt@kms_psr@psr2_cursor_plane_onoff.html>
>         (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>  *
>
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html>
>         (i915#5289 <https://gitlab.freedesktop.org/drm/intel/issues/5289>)
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html>
>         (i915#5289 <https://gitlab.freedesktop.org/drm/intel/issues/5289>)
>
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615> /
>         i915#5289 <https://gitlab.freedesktop.org/drm/intel/issues/5289>)
>  *
>
>     igt@kms_writeback@writeback-fb-id:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb6/igt@kms_writeback@writeback-fb-id.html>
>         (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>
>      o
>
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-glk2/igt@kms_writeback@writeback-fb-id.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb2/igt@kms_writeback@writeback-fb-id.html>
>         (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>
>      o
>
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@kms_writeback@writeback-fb-id.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>
>      o
>
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl2/igt@kms_writeback@writeback-fb-id.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>
>  *
>
>     igt@nouveau_crc@pipe-a-source-outp-complete:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb7/igt@nouveau_crc@pipe-a-source-outp-complete.html>
>         (i915#2530
>         <https://gitlab.freedesktop.org/drm/intel/issues/2530>) +1
>         similar issue
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb6/igt@nouveau_crc@pipe-a-source-outp-complete.html>
>         (i915#2530 <https://gitlab.freedesktop.org/drm/intel/issues/2530>)
>
>  *
>
>     igt@nouveau_crc@pipe-d-source-rg:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb7/igt@nouveau_crc@pipe-d-source-rg.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         i915#2530 <https://gitlab.freedesktop.org/drm/intel/issues/2530>)
>  *
>
>     igt@prime_nv_api@i915_nv_import_twice:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb3/igt@prime_nv_api@i915_nv_import_twice.html>
>         (fdo#109291
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109291>) +2
>         similar issues
>  *
>
>     igt@prime_nv_test@i915_import_cpu_mmap:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb2/igt@prime_nv_test@i915_import_cpu_mmap.html>
>         (fdo#109291
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109291>) +3
>         similar issues
>  *
>
>     igt@sw_sync@sync_multi_timeline_wait:
>
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl7/igt@sw_sync@sync_multi_timeline_wait.html>
>         (i915#6140 <https://gitlab.freedesktop.org/drm/intel/issues/6140>)
>  *
>
>     igt@sysfs_clients@sema-25:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl3/igt@sysfs_clients@sema-25.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +2
>         similar issues
>  *
>
>     igt@sysfs_clients@split-50:
>
>      o
>
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl2/igt@sysfs_clients@split-50.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb7/igt@sysfs_clients@split-50.html>
>         (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>
>      o
>
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-glk3/igt@sysfs_clients@split-50.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb6/igt@sysfs_clients@split-50.html>
>         (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>
>
>         Possible fixes
>
>  *
>
>     igt@drm_read@short-buffer-nonblock:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-rkl-1/igt@drm_read@short-buffer-nonblock.html>
>         (i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt@drm_read@short-buffer-nonblock.html>
>         +1 similar issue
>  *
>
>     igt@fbdev@info:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-rkl-1/igt@fbdev@info.html>
>         (i915#2582
>         <https://gitlab.freedesktop.org/drm/intel/issues/2582>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-2/igt@fbdev@info.html>
>  *
>
>     igt@gem_exec_fair@basic-flow@rcs0:
>
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html>
>         +1 similar issue
>  *
>
>     igt@gem_exec_fair@basic-none-solo@rcs0:
>
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>         +1 similar issue
>  *
>
>     igt@gem_exec_fair@basic-none@rcs0:
>
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-kbl7/igt@gem_exec_fair@basic-none@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl3/igt@gem_exec_fair@basic-none@rcs0.html>
>         +4 similar issues
>  *
>
>     igt@gem_exec_fair@basic-pace-share@rcs0:
>
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>  *
>
>     igt@gem_exec_flush@basic-wb-ro-default:
>
>       o shard-snb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-snb6/igt@gem_exec_flush@basic-wb-ro-default.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-snb5/igt@gem_exec_flush@basic-wb-ro-default.html>
>         +5 similar issues
>  *
>
>     igt@i915_module_load@reload-no-display:
>
>       o {shard-rkl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-rkl-6/igt@i915_module_load@reload-no-display.html>
>         (i915#6126
>         <https://gitlab.freedesktop.org/drm/intel/issues/6126>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt@i915_module_load@reload-no-display.html>
>  *
>
>     igt@i915_pm_dc@dc6-dpms:
>
>       o {shard-rkl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-rkl-5/igt@i915_pm_dc@dc6-dpms.html>
>         (i915#3989
>         <https://gitlab.freedesktop.org/drm/intel/issues/3989>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-2/igt@i915_pm_dc@dc6-dpms.html>
>  *
>
>     igt@i915_pm_dc@dc9-dpms:
>
>       o {shard-tglu}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-tglu-1/igt@i915_pm_dc@dc9-dpms.html>
>         (i915#4281
>         <https://gitlab.freedesktop.org/drm/intel/issues/4281>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglu-4/igt@i915_pm_dc@dc9-dpms.html>
>  *
>
>     igt@i915_pm_rps@min-max-config-idle:
>
>       o {shard-rkl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-rkl-1/igt@i915_pm_rps@min-max-config-idle.html>
>         (i915#4016
>         <https://gitlab.freedesktop.org/drm/intel/issues/4016>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-4/igt@i915_pm_rps@min-max-config-idle.html>
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-0:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-0.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-0.html>
>         +6 similar issues
>  *
>
>     igt@kms_color@pipe-a-ctm-negative:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-rkl-2/igt@kms_color@pipe-a-ctm-negative.html>
>         (i915#1149
>         <https://gitlab.freedesktop.org/drm/intel/issues/1149> /
>         i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt@kms_color@pipe-a-ctm-negative.html>
>  *
>
>     igt@kms_color@pipe-a-legacy-gamma:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-rkl-5/igt@kms_color@pipe-a-legacy-gamma.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt@kms_color@pipe-a-legacy-gamma.html>
>  *
>
>     igt@kms_cursor_crc@pipe-a-cursor-suspend:
>
>       o shard-apl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html>
>         (i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html>
>         +1 similar issue
>  *
>
>     igt@kms_cursor_crc@pipe-b-cursor-64x21-rapid-movement:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-rkl-5/igt@kms_cursor_crc@pipe-b-cursor-64x21-rapid-movement.html>
>         (fdo#112022
>         <https://bugs.freedesktop.org/show_bug.cgi?id=112022> /
>         i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt@kms_cursor_crc@pipe-b-cursor-64x21-rapid-movement.html>
>         +2 similar issues
>  *
>
>     igt@kms_cursor_crc@pipe-b-cursor-suspend:
>
>       o shard-kbl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html>
>         (i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html>
>         +1 similar issue
>  *
>
>     igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-rkl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825> /
>         i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html>
>         +3 similar issues
>  *
>
>     igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
>
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html>
>         (i915#5072
>         <https://gitlab.freedesktop.org/drm/intel/issues/5072>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb5/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html>
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
>         (i915#2346
>         <https://gitlab.freedesktop.org/drm/intel/issues/2346>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>         (i915#2346
>         <https://gitlab.freedesktop.org/drm/intel/issues/2346> /
>         i915#533
>         <https://gitlab.freedesktop.org/drm/intel/issues/533>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>  *
>
>     igt@kms_cursor_legacy@pipe-c-forked-bo:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-rkl-6/igt@kms_cursor_legacy@pipe-c-forked-bo.html>
>         (i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-5/igt@kms_cursor_legacy@pipe-c-forked-bo.html>
>  *
>
>     igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled.html>
>         (fdo#111314
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111314> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098> /
>         i915#4369
>         <https://gitlab.freedesktop.org/drm/intel/issues/4369>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled.html>
>         +5 similar issues
>  *
>
>     igt@kms_fbcon_fbt@fbc-suspend:
>
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html>
>         (i915#4767
>         <https://gitlab.freedesktop.org/drm/intel/issues/4767>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html>
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html>
>         (i915#3701
>         <https://gitlab.freedesktop.org/drm/intel/issues/3701>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html>
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>         (i915#3701
>         <https://gitlab.freedesktop.org/drm/intel/issues/3701>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html>
>         (i915#1888
>         <https://gitlab.freedesktop.org/drm/intel/issues/1888> /
>         i915#2546
>         <https://gitlab.freedesktop.org/drm/intel/issues/2546>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html>
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         +4 similar issues
>  *
>
>     igt@kms_invalid_mode@bad-htotal:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-rkl-2/igt@kms_invalid_mode@bad-htotal.html>
>         (i915#4278
>         <https://gitlab.freedesktop.org/drm/intel/issues/4278>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt@kms_invalid_mode@bad-htotal.html>
>  *
>
>     igt@kms_properties@plane-properties-atomic:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-rkl-5/igt@kms_properties@plane-properties-atomic.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt@kms_properties@plane-properties-atomic.html>
>         +1 similar issue
>  *
>
>     igt@kms_psr@primary_blt:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-rkl-5/igt@kms_psr@primary_blt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt@kms_psr@primary_blt.html>
>         +1 similar issue
>  *
>
>     igt@kms_psr@psr2_cursor_mmap_gtt:
>
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_gtt.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html>
>         +2 similar issues
>  *
>
>     igt@prime_vgem@basic-fence-flip:
>
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-rkl-1/igt@prime_vgem@basic-fence-flip.html>
>         (fdo#109295
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>         i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt@prime_vgem@basic-fence-flip.html>
>
>
>         Warnings
>
>  *
>
>     igt@gem_eio@unwedge-stress:
>
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-tglb2/igt@gem_eio@unwedge-stress.html>
>         (i915#5784
>         <https://gitlab.freedesktop.org/drm/intel/issues/5784>) ->
>         TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb7/igt@gem_eio@unwedge-stress.html>
>         (i915#3063 <https://gitlab.freedesktop.org/drm/intel/issues/3063>)
>  *
>
>     igt@i915_pm_dc@dc3co-vpb-simulation:
>
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html>
>         (i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html>
>         (i915#588 <https://gitlab.freedesktop.org/drm/intel/issues/588>)
>  *
>
>     igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
>
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-kbl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>  *
>
>     igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html>
>         (i915#2920
>         <https://gitlab.freedesktop.org/drm/intel/issues/2920>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>  *
>
>     igt@kms_psr2_sf@cursor-plane-update-sf:
>
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-iclb5/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>         i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>         (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>  *
>
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
>
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html>
>         (i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html>
>         (i915#2920
>         <https://gitlab.freedesktop.org/drm/intel/issues/2920>) +1
>         similar issue
>  *
>
>     igt@runner@aborted:
>
>      o
>
>         shard-apl: (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-apl2/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-apl3/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-apl6/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-apl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-apl4/igt@runner@aborted.html>)
>         (i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180> /
>         i915#3002
>         <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>         i915#4312
>         <https://gitlab.freedesktop.org/drm/intel/issues/4312> /
>         i915#5257
>         <https://gitlab.freedesktop.org/drm/intel/issues/5257>) ->
>         (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl8/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl6/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl2/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl4/igt@runner@aborted.html>)
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>
>         / i915#3002
>         <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>         i915#4312
>         <https://gitlab.freedesktop.org/drm/intel/issues/4312> /
>         i915#5257 <https://gitlab.freedesktop.org/drm/intel/issues/5257>)
>
>      o
>
>         shard-iclb: (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-iclb8/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-iclb5/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-iclb8/igt@runner@aborted.html>)
>         (i915#3002
>         <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>         i915#3690
>         <https://gitlab.freedesktop.org/drm/intel/issues/3690> /
>         i915#4312
>         <https://gitlab.freedesktop.org/drm/intel/issues/4312> /
>         i915#5257
>         <https://gitlab.freedesktop.org/drm/intel/issues/5257>) ->
>         (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb6/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb3/igt@runner@aborted.html>)
>         (i915#3002
>         <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>         i915#4312
>         <https://gitlab.freedesktop.org/drm/intel/issues/4312> /
>         i915#5257 <https://gitlab.freedesktop.org/drm/intel/issues/5257>)
>
>      o
>
>         shard-kbl: (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-kbl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-kbl6/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-kbl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-kbl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-kbl6/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-kbl6/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-kbl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-kbl7/igt@runner@aborted.html>)
>         (i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180> /
>         i915#3002
>         <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>         i915#4312
>         <https://gitlab.freedesktop.org/drm/intel/issues/4312> /
>         i915#5257
>         <https://gitlab.freedesktop.org/drm/intel/issues/5257> /
>         i915#92 <https://gitlab.freedesktop.org/drm/intel/issues/92>)
>         -> (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl6/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl6/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl6/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl6/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl7/igt@runner@aborted.html>)
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>
>         / i915#3002
>         <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>         i915#4312
>         <https://gitlab.freedesktop.org/drm/intel/issues/4312> /
>         i915#5257
>         <https://gitlab.freedesktop.org/drm/intel/issues/5257> /
>         i915#92 <https://gitlab.freedesktop.org/drm/intel/issues/92>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6505 -> IGTPW_7231
>   * Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_11727: 6034ccb11971698ace6b3af2f6ac02de120a2dc2 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7231: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/index.html
> IGT_6505: edb1a467fb622b23b927e28ff603fa43851fea97 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
>

--------------FzZF2GpY9mhW0Ecl80BWu097
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    On 6/3/2022 18:53, Patchwork wrote:<br>
    <blockquote type=3D"cite" cite=3D"mid:165430762912.17738.12729220686168=
271848@emeril.freedesktop.org">
     =20
      <title>Project List - Patchwork</title>
      <style id=3D"css-table-select" type=3D"text/css">td { padding: 2pt; }=
</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>Update DRM UAPI and add test for new hw info query
              (rev3)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href=3D"https://patchwork.freedesktop.org/series/104693/=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://patchwor=
k.freedesktop.org/series/104693/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
231/index.html" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_11727_full -&gt;
        IGTPW_7231_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_7231_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_7231_full, please notify your bug team to
        allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class=3D"moz-txt-link-freetext" href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7231/index.html">https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7231/index.html</a></p>
      <h2>Participating hosts (13 -&gt; 10)</h2>
      <p>Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_7231_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>{igt@i915_query@hwconfig_table} (NEW):</p>
          <ul>
            <li>
              <p>{shard-tglu}: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7231/shard-tglu-6/igt@i915_query@hwconfig_table.=
html" moz-do-not-send=3D"true">SKIP</a></p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-tglb2/igt@i915_query@hwconfig_table.htm=
l" moz-do-not-send=3D"true">SKIP</a></p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-iclb7/igt@i915_query@hwconfig_table.htm=
l" moz-do-not-send=3D"true">SKIP</a></p>
            </li>
            <li>
              <p>{shard-rkl}: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7231/shard-rkl-2/igt@i915_query@hwconfig_table.ht=
ml" moz-do-not-send=3D"true">SKIP</a></p>
            </li>
          </ul>
        </li>
      </ul>
    </blockquote>
    The table is only available on ADL-P onwards so these skips are
    expected.<br>
    <br>
    Unfortunately, we don't get to see a pass because it looks like
    there are no ADL-P or DG2 systems in the shards set.<br>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:165430762912.17738.12729220686168=
271848@emeril.freedesktop.org">
      <ul>
        <li>
          <ul>
            <li>
              <br>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:</p>
          <ul>
            <li>shard-kbl: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_11727/shard-kbl3/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html" m=
oz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp=
-1.html" moz-do-not-send=3D"true">FAIL</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    Unrelated display failure.<br>
    <br>
    John.<br>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:165430762912.17738.12729220686168=
271848@emeril.freedesktop.org">
      <ul>
        <li>
          <ul>
          </ul>
        </li>
      </ul>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1:
          <ul>
            <li>{shard-rkl}: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt@kms_flip@wf_vblank-ts-check-i=
nterruptible@b-edp1.html" moz-do-not-send=3D"true">FAIL</a> +1 similar issu=
e</li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between CI_DRM_11727_full and
        IGTPW_7231_full:</p>
      <h3>New IGT tests (1)</h3>
      <ul>
        <li>igt@i915_query@hwconfig_table:
          <ul>
            <li>Statuses : 8 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_7231_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@core_hotunplug@unbind-rebind:</p>
          <ul>
            <li>shard-snb: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_11727/shard-snb2/igt@core_hotunplug@unbind-rebind.html" moz-do-n=
ot-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7231/shard-snb7/igt@core_hotunplug@unbind-rebind.html" moz-d=
o-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/4528" moz-do-not-send=3D"true">i915#4528</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@block-copy-uncompressed:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-iclb7/igt@gem_ccs@block-copy-uncompresse=
d.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/5327" moz-do-not-send=3D"true">i915#5327</a>)</l=
i>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
          <ul>
            <li>shard-kbl: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_11727/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vcs0.html=
" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@gem_ctx_isolation@preservation=
-s3@vcs0.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/180" moz-do-not-send=3D"true">i915#=
180</a>) +10 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7231/shard-snb2/igt@gem_ctx_persistence@legacy-engin=
es-mixed-process.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109271" moz-do-not-send=3D"true">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1099" moz-do-not-send=3D"true">i915#1099</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@kms:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-tglb2/igt@gem_eio@kms.html" moz-do-not-s=
end=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5784" moz-do-not-send=3D"true">i915#5784</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@reset-stress:</p>
          <ul>
            <li>shard-glk: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_11727/shard-glk7/igt@gem_eio@reset-stress.html" moz-do-not-send=
=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7231/shard-glk4/igt@gem_eio@reset-stress.html" moz-do-not-send=3D"t=
rue">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/118" moz-do-not-send=3D"true">i915#118</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1888" moz-do-not-send=3D"true">i915#1888<=
/a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-contexts:</p>
          <ul>
            <li>shard-iclb: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_11727/shard-iclb2/igt@gem_exec_balancer@parallel-contexts.html"=
 moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-iclb8/igt@gem_exec_balancer@parallel-con=
texts.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/4525" moz-do-not-send=3D"true">i915#4525</a>=
) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-deadline:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@gem_exec_fair@basic-deadline.htm=
l" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/6141" moz-do-not-send=3D"true">i915#6141</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace@rcs0:</p>
          <ul>
            <li>shard-iclb: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_11727/shard-iclb2/igt@gem_exec_fair@basic-pace@rcs0.html" moz-d=
o-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7231/shard-iclb5/igt@gem_exec_fair@basic-pace@rcs0.html" =
moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2842" moz-do-not-send=3D"true">i915#2842</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace@vecs0:</p>
          <ul>
            <li>shard-kbl: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_11727/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html" moz-do=
-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7231/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html" m=
oz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2842" moz-do-not-send=3D"true">i915#2842</a>) +1 similar =
issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
          <ul>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-glk7/igt@gem_exec_fair@basic-throttle@rc=
s0.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/2842" moz-do-not-send=3D"true">i915#2842</a>)</=
p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-iclb3/igt@gem_exec_fair@basic-throttle@=
rcs0.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2849" moz-do-not-send=3D"true">i915#2849</a>)=
</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-tglb6/igt@gem_exec_fair@basic-throttle@=
rcs0.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2842" moz-do-not-send=3D"true">i915#2842</a>)=
</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-wb-pro-default:</p>
          <ul>
            <li>shard-snb: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_11727/shard-snb2/igt@gem_exec_flush@basic-wb-pro-default.html" m=
oz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7231/shard-snb6/igt@gem_exec_flush@basic-wb-pro-defau=
lt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271" moz-do-not-send=3D"true">fdo#109271</a>)=
 +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-ccs:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-iclb8/igt@gem_lmem_swapping@verify-ccs.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/4613" moz-do-not-send=3D"true">i915#4613</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pread@exhaustion:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7231/shard-kbl3/igt@gem_pread@exhaustion.html" moz-d=
o-not-send=3D"true">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2658" moz-do-not-send=3D"true">i915#2658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-tglb7/igt@gem_pxp@verify-pxp-key-change=
-after-suspend-resume.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/4270" moz-do-not-send=3D"tru=
e">i915#4270</a>) +1 similar issue</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-iclb1/igt@gem_pxp@verify-pxp-key-change=
-after-suspend-resume.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/4270" moz-do-not-send=3D"tru=
e">i915#4270</a>) +2 similar
                issues</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-iclb7/igt@gem_render_copy@y-tiled-ccs-to=
-yf-tiled-mc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/768" moz-do-not-send=3D"true">i91=
5#768</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@dmabuf-sync:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-iclb1/igt@gem_userptr_blits@dmabuf-sync.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3323" moz-do-not-send=3D"true">i915#3323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@vma-merge:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7231/shard-kbl6/igt@gem_userptr_blits@vma-merge.html=
" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3318" moz-do-not-send=3D"true">i915#3318</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen3_render_linear_blits:</p>
          <ul>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-iclb3/igt@gen3_render_linear_blits.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109289" moz-do-not-send=3D"true">fdo#109289</a>)</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-tglb3/igt@gen3_render_linear_blits.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109289" moz-do-not-send=3D"true">fdo#109289</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@allowed-single:</p>
          <ul>
            <li>shard-apl: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_11727/shard-apl4/igt@gen9_exec_parse@allowed-single.html" moz-do=
-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7231/shard-apl1/igt@gen9_exec_parse@allowed-single.html" m=
oz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/5566" moz-do-not-send=3D"true">i915#5566</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/716" moz-do-not-send=
=3D"true">i915#716</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@batch-without-end:</p>
          <ul>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-iclb2/igt@gen9_exec_parse@batch-without=
-end.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2856" moz-do-not-send=3D"true">i915#2856</a>)=
 +1 similar issue</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-tglb1/igt@gen9_exec_parse@batch-without=
-end.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2527" moz-do-not-send=3D"true">i915#2527</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856" moz-do-n=
ot-send=3D"true">i915#2856</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_dc@dc9-dpms:</p>
          <ul>
            <li>
              <p>shard-iclb: <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_11727/shard-iclb4/igt@i915_pm_dc@dc9-dpms.html" moz-do-not-sen=
d=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7231/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html" moz-do-not-send=3D"=
true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4281" moz-do-not-send=3D"true">i915#4281</a>)</p>
            </li>
            <li>
              <p>shard-apl: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_11727/shard-apl3/igt@i915_pm_dc@dc9-dpms.html" moz-do-not-send=
=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7231/shard-apl7/igt@i915_pm_dc@dc9-dpms.html" moz-do-not-send=3D"tr=
ue">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271" moz-do-not-send=3D"true">fdo#109271</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
          <ul>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp-=
stress-no-wait.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D110892" moz-do-not-send=3D"true">fdo=
#110892</a>)</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-=
stress-no-wait.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D111644" moz-do-not-send=3D"true">fdo=
#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
97" moz-do-not-send=3D"true">i915#1397</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2411" moz-do-not-send=3D"true">i915#2411</a>)<=
/p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-tglb1/igt@i915_pm_rpm@modeset-pc8-resid=
ency-stress.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109506" moz-do-not-send=3D"true">fdo#10=
9506</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411"=
 moz-do-not-send=3D"true">i915#2411</a>)</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-iclb5/igt@i915_pm_rpm@modeset-pc8-resid=
ency-stress.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109293" moz-do-not-send=3D"true">fdo#10=
9293</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109506=
" moz-do-not-send=3D"true">fdo#109506</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_query@test-query-geometry-subslices:</p>
          <ul>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-iclb5/igt@i915_query@test-query-geometr=
y-subslices.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/5723" moz-do-not-send=3D"true">i915#57=
23</a>)</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-tglb7/igt@i915_query@test-query-geometr=
y-subslices.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/5723" moz-do-not-send=3D"true">i915#57=
23</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@hangcheck:</p>
          <ul>
            <li>shard-snb: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_11727/shard-snb7/igt@i915_selftest@live@hangcheck.html" moz-do-n=
ot-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7231/shard-snb2/igt@i915_selftest@live@hangcheck.html" moz-d=
o-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3921" moz-do-not-send=3D"true">i915#3921</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-iclb5/igt@kms_atomic@plane-primary-overl=
ay-mutable-zpos.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/404" moz-do-not-send=3D"true">i915=
#404</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
          <ul>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-iclb5/igt@kms_big_fb@4-tiled-addfb-size=
-overflow.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/5286" moz-do-not-send=3D"true">i915#5286=
</a>)</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-tglb5/igt@kms_big_fb@4-tiled-addfb-size=
-overflow.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/5286" moz-do-not-send=3D"true">i915#5286=
</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotat=
e-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D110723" moz-do-not-send=3D"true">fdo#110723</a>=
) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</=
p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7231/shard-apl8/igt@kms_ccs@pipe-a-bad-pixel-format-=
y_tiled_gen12_rc_ccs_cc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271" moz-do-not-send=3D"=
true">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/3886" moz-do-not-send=3D"true">i915#3886</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_=
cc:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-tglb6/igt@kms_ccs@pipe-a-crc-sprite-plan=
es-basic-4_tiled_dg2_rc_ccs_cc.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6095" moz-do-not-se=
nd=3D"true">i915#6095</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7231/shard-kbl6/igt@kms_ccs@pipe-b-crc-primary-basic=
-y_tiled_gen12_mc_ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109271" moz-do-not-send=3D"tr=
ue">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/3886" moz-do-not-send=3D"true">i915#3886</a>) +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-tglb7/igt@kms_ccs@pipe-b-crc-primary-bas=
ic-yf_tiled_ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D111615" moz-do-not-send=3D"true">fd=
o#111615</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
689" moz-do-not-send=3D"true">i915#3689</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_rc_ccs=
:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-tglb6/igt@kms_ccs@pipe-c-crc-primary-rot=
ation-180-4_tiled_dg2_rc_ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/3689" moz-do-not-send=
=3D"true">i915#3689</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p=
>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-tglb3/igt@kms_ccs@pipe-c-missing-ccs-bu=
ffer-y_tiled_gen12_mc_ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3689" moz-do-not-send=
=3D"true">i915#3689</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3886" moz-do-not-send=3D"true">i915#3886</a>)</p>
            </li>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-glk6/igt@kms_ccs@pipe-c-missing-ccs-buff=
er-y_tiled_gen12_mc_ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271" moz-do-not-send=3D"=
true">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/3886" moz-do-not-send=3D"true">i915#3886</a>) +1 similar issue</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-iclb1/igt@kms_ccs@pipe-c-missing-ccs-bu=
ffer-y_tiled_gen12_mc_ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278" moz-do-not-send=
=3D"true">fdo#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3886" moz-do-not-send=3D"true">i915#3886</a>) +1 similar issue</=
p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7231/shard-apl7/igt@kms_ccs@pipe-d-bad-pixel-format-=
y_tiled_gen12_mc_ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271" moz-do-not-send=3D"tru=
e">fdo#109271</a>) +52 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
          <ul>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-apl4/igt@kms_chamelium@hdmi-hpd-enable-d=
isable-mode.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109271" moz-do-not-send=3D"true">fdo#10=
9271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827=
" moz-do-not-send=3D"true">fdo#111827</a>) +1 similar
                issue</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-tglb1/igt@kms_chamelium@hdmi-hpd-enable=
-disable-mode.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109284" moz-do-not-send=3D"true">fdo#=
109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1118=
27" moz-do-not-send=3D"true">fdo#111827</a>)</p>
            </li>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-glk4/igt@kms_chamelium@hdmi-hpd-enable-d=
isable-mode.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109271" moz-do-not-send=3D"true">fdo#10=
9271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827=
" moz-do-not-send=3D"true">fdo#111827</a>)</p>
            </li>
            <li>
              <p>shard-snb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-snb6/igt@kms_chamelium@hdmi-hpd-enable-d=
isable-mode.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109271" moz-do-not-send=3D"true">fdo#10=
9271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827=
" moz-do-not-send=3D"true">fdo#111827</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium@hdmi-hpd-storm:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@kms_chamelium@hdmi-hpd-storm.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271" moz-do-not-send=3D"true">fdo#109271</a> / <a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827" moz-do-not-se=
nd=3D"true">fdo#111827</a>) +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_chamelium@pipe-c-ctm-limited-range:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-iclb6/igt@kms_color_chamelium@pipe-c-ctm=
-limited-range.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109284" moz-do-not-send=3D"true">fdo=
#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
827" moz-do-not-send=3D"true">fdo#111827</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-a-cursor-max-size-rapid-movement:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-m=
ax-size-rapid-movement.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109278" moz-do-not-send=3D"t=
rue">fdo#109278</a>) +23 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-c-cursor-512x170-random:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-iclb8/igt@kms_cursor_crc@pipe-c-cursor-5=
12x170-random.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109278" moz-do-not-send=3D"true">fdo#=
109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
79" moz-do-not-send=3D"true">fdo#109279</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-m=
ax-size-onscreen.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/3359" moz-do-not-send=3D"true">i9=
15#3359</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
          <ul>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-su=
spend.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/180" moz-do-not-send=3D"true">i915#180=
</a>) +1 similar issue</p>
            </li>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-su=
spend.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/180" moz-do-not-send=3D"true">i915#180=
</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-3=
2x32-sliding.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3319" moz-do-not-send=3D"true">i915#3=
319</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-5=
12x512-rapid-movement.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109279" moz-do-not-send=3D"tr=
ue">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/3359" moz-do-not-send=3D"true">i915#3359</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:=
</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-iclb7/igt@kms_cursor_legacy@2x-nonblocki=
ng-modeset-vs-cursor-atomic.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274" moz-do-not-send=
=3D"true">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109278" moz-do-not-send=3D"true">fdo#109278</a>) +1 similar issue=
</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
          <ul>
            <li>shard-iclb: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_11727/shard-iclb8/igt@kms_cursor_legacy@flip-vs-cursor-varying-=
size.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb7/igt@kms_cursor_legacy@fl=
ip-vs-cursor-varying-size.html" moz-do-not-send=3D"true">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346" moz-do-not-send=
=3D"true">i915#2346</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_draw_crc@draw-method-rgb565-render-4tiled:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-tglb6/igt@kms_draw_crc@draw-method-rgb5=
65-render-4tiled.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/5287" moz-do-not-send=3D"true">i9=
15#5287</a>)</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-iclb3/igt@kms_draw_crc@draw-method-rgb5=
65-render-4tiled.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/5287" moz-do-not-send=3D"true">i9=
15#5287</a>) +1 similar issue</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-iclb1/igt@kms_flip@2x-nonexisting-fb-int=
erruptible.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D109274" moz-do-not-send=3D"true">fdo#109=
274</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-tglb3/igt@kms_flip@2x-plain-flip.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109274" moz-do-not-send=3D"true">fdo#109274</a> / <a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825" moz-do-not-send=
=3D"true">fdo#111825</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:</p>
          <ul>
            <li>shard-apl: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_11727/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@c-dp1.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl3/igt@kms_flip@flip-vs-=
expired-vblank-interruptible@c-dp1.html" moz-do-not-send=3D"true">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79" moz-do-not-=
send=3D"true">i915#79</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rc=
ccs-downscaling:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp=
-ytile-to-32bpp-ytilegen12rcccs-downscaling.html" moz-do-not-send=3D"true">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587" =
moz-do-not-send=3D"true">i915#2587</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downsc=
aling:</p>
          <ul>
            <li>shard-iclb: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_11727/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-6=
4bpp-ytile-downscaling.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb2/igt@km=
s_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html" moz-do-=
not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/3701" moz-do-not-send=3D"true">i915#3701</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mm=
ap-gtt:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7231/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-pri-indfb-draw-mmap-gtt.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271" moz-do-not=
-send=3D"true">fdo#109271</a>) +94 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-b=
lt:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-iclb5/igt@kms_frontbuffer_tracking@fbcps=
r-2p-scndscrn-indfb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109280" moz-do-not-s=
end=3D"true">fdo#109280</a>) +13 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-bl=
t:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-tglb2/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-pri-shrfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109280" moz-do-not-se=
nd=3D"true">fdo#109280</a> / <a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111825" moz-do-not-send=3D"true">fdo#111825</a>) +7 similar iss=
ues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
          <ul>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-al=
pha-transparent-fb.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/265" moz-do-not-send=3D"true">i=
915#265</a>)</p>
            </li>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-glk6/igt@kms_plane_alpha_blend@pipe-c-al=
pha-transparent-fb.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/265" moz-do-not-send=3D"true">i=
915#265</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-tglb2/igt@kms_plane_multiple@atomic-pipe=
-d-tiling-yf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D111615" moz-do-not-send=3D"true">fdo#1=
11615</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5=
@pipe-b-edp-1:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-tglb7/igt@kms_plane_scaling@plane-downs=
cale-with-rotation-factor-0-5@pipe-b-edp-1.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176" m=
oz-do-not-send=3D"true">i915#5176</a>) +3 similar
                issues</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-iclb1/igt@kms_plane_scaling@plane-downs=
cale-with-rotation-factor-0-5@pipe-b-edp-1.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176" m=
oz-do-not-send=3D"true">i915#5176</a>) +2 similar
                issues</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-fac=
tor-0-5@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7231/shard-glk7/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1.html" moz-do-not-send=3D"=
true">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271" moz-do-not-send=3D"true">fdo#109271</a>) +46 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
          <ul>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-apl4/igt@kms_psr2_sf@overlay-plane-updat=
e-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271" moz-do-not-send=3D"true">fdo#=
109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658=
" moz-do-not-send=3D"true">i915#658</a>)</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-tglb1/igt@kms_psr2_sf@overlay-plane-upd=
ate-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2920" moz-do-not-send=3D"true">i91=
5#2920</a>)</p>
            </li>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-glk4/igt@kms_psr2_sf@overlay-plane-updat=
e-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271" moz-do-not-send=3D"true">fdo#=
109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658=
" moz-do-not-send=3D"true">i915#658</a>)</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-iclb4/igt@kms_psr2_sf@overlay-plane-upd=
ate-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D111068" moz-do-not-send=3D"true">fd=
o#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
58" moz-do-not-send=3D"true">i915#658</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7231/shard-kbl3/igt@kms_psr2_su@frontbuffer-xrgb8888=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271" moz-do-not-send=3D"true">fdo#109271</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" moz-do-not-=
send=3D"true">i915#658</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@cursor_render:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@kms_psr@cursor_render.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271" moz-do-not-send=3D"true">fdo#109271</a>) +152 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_basic:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-iclb8/igt@kms_psr@psr2_basic.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109441" moz-do-not-send=3D"true">fdo#109441</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
          <ul>
            <li>shard-iclb: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_11727/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html" moz=
-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7231/shard-iclb6/igt@kms_psr@psr2_cursor_plane_onoff.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109441" moz-do-not-send=3D"true">fdo#109441</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
          <ul>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-iclb6/igt@kms_rotation_crc@primary-4-ti=
led-reflect-x-180.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/5289" moz-do-not-send=3D"true">i=
915#5289</a>)</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-tglb7/igt@kms_rotation_crc@primary-4-ti=
led-reflect-x-180.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/5289" moz-do-not-send=3D"true">i=
915#5289</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-tglb7/igt@kms_rotation_crc@primary-yf-ti=
led-reflect-x-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D111615" moz-do-not-send=3D"true">fd=
o#111615</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
289" moz-do-not-send=3D"true">i915#5289</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-tglb6/igt@kms_writeback@writeback-fb-id=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2437" moz-do-not-send=3D"true">i915#2437</a>)</p>
            </li>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-glk2/igt@kms_writeback@writeback-fb-id.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271" moz-do-not-send=3D"true">fdo#109271</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2437" moz-do-not-s=
end=3D"true">i915#2437</a>)</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-iclb2/igt@kms_writeback@writeback-fb-id=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2437" moz-do-not-send=3D"true">i915#2437</a>)</p>
            </li>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@kms_writeback@writeback-fb-id.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271" moz-do-not-send=3D"true">fdo#109271</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2437" moz-do-not-s=
end=3D"true">i915#2437</a>)</p>
            </li>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-apl2/igt@kms_writeback@writeback-fb-id.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271" moz-do-not-send=3D"true">fdo#109271</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2437" moz-do-not-s=
end=3D"true">i915#2437</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@nouveau_crc@pipe-a-source-outp-complete:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-tglb7/igt@nouveau_crc@pipe-a-source-out=
p-complete.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2530" moz-do-not-send=3D"true">i915#253=
0</a>) +1 similar issue</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-iclb6/igt@nouveau_crc@pipe-a-source-out=
p-complete.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2530" moz-do-not-send=3D"true">i915#253=
0</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@nouveau_crc@pipe-d-source-rg:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-iclb7/igt@nouveau_crc@pipe-d-source-rg.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109278" moz-do-not-send=3D"true">fdo#109278</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2530" moz-do-not-s=
end=3D"true">i915#2530</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_nv_api@i915_nv_import_twice:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-tglb3/igt@prime_nv_api@i915_nv_import_tw=
ice.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109291" moz-do-not-send=3D"true">fdo#109291</a>=
) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_nv_test@i915_import_cpu_mmap:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-iclb2/igt@prime_nv_test@i915_import_cpu_=
mmap.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109291" moz-do-not-send=3D"true">fdo#109291</a=
>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@sw_sync@sync_multi_timeline_wait:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7231/shard-kbl7/igt@sw_sync@sync_multi_timeline_wait=
.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/6140" moz-do-not-send=3D"true">i915#6140</a>)</li=
>
          </ul>
        </li>
        <li>
          <p>igt@sysfs_clients@sema-25:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7231/shard-kbl3/igt@sysfs_clients@sema-25.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271" moz-do-not-send=3D"true">fdo#109271</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2994" moz-do-not-send=3D"tr=
ue">i915#2994</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@sysfs_clients@split-50:</p>
          <ul>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-apl2/igt@sysfs_clients@split-50.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271" moz-do-not-send=3D"true">fdo#109271</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994" moz-do-not-send=
=3D"true">i915#2994</a>)</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-tglb7/igt@sysfs_clients@split-50.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2994" moz-do-not-send=3D"true">i915#2994</a>)</p>
            </li>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-glk3/igt@sysfs_clients@split-50.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271" moz-do-not-send=3D"true">fdo#109271</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994" moz-do-not-send=
=3D"true">i915#2994</a>)</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-iclb6/igt@sysfs_clients@split-50.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2994" moz-do-not-send=3D"true">i915#2994</a>)</p>
            </li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@drm_read@short-buffer-nonblock:</p>
          <ul>
            <li>{shard-rkl}: <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_11727/shard-rkl-1/igt@drm_read@short-buffer-nonblock.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/4098" moz-do-not-send=3D"true">i915#4098</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt@drm=
_read@short-buffer-nonblock.html" moz-do-not-send=3D"true">PASS</a> +1 simi=
lar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@fbdev@info:</p>
          <ul>
            <li>{shard-rkl}: <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_11727/shard-rkl-1/igt@fbdev@info.html" moz-do-not-send=3D"true=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2582=
" moz-do-not-send=3D"true">i915#2582</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-2/igt@fbdev@info.html" moz-do=
-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-flow@rcs0:</p>
          <ul>
            <li>shard-tglb: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_11727/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html" moz-d=
o-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2842" moz-do-not-send=3D"true">i915#2842</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb3/igt@gem=
_exec_fair@basic-flow@rcs0.html" moz-do-not-send=3D"true">PASS</a> +1 simil=
ar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
          <ul>
            <li>shard-apl: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_11727/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html" mo=
z-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2842" moz-do-not-send=3D"true">i915#2842</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl7/igt@gem=
_exec_fair@basic-none-solo@rcs0.html" moz-do-not-send=3D"true">PASS</a> +1 =
similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none@rcs0:</p>
          <ul>
            <li>shard-kbl: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_11727/shard-kbl7/igt@gem_exec_fair@basic-none@rcs0.html" moz-do-=
not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2842" moz-do-not-send=3D"true">i915#2842</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl3/igt@gem_exec=
_fair@basic-none@rcs0.html" moz-do-not-send=3D"true">PASS</a> +4 similar is=
sues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
          <ul>
            <li>shard-glk: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_11727/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html" m=
oz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2842" moz-do-not-send=3D"true">i915#2842</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-glk4/igt@ge=
m_exec_fair@basic-pace-share@rcs0.html" moz-do-not-send=3D"true">PASS</a></=
li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-wb-ro-default:</p>
          <ul>
            <li>shard-snb: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_11727/shard-snb6/igt@gem_exec_flush@basic-wb-ro-default.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271" moz-do-not-send=3D"true">fdo#109271</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-snb5/igt@g=
em_exec_flush@basic-wb-ro-default.html" moz-do-not-send=3D"true">PASS</a> +=
5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@reload-no-display:</p>
          <ul>
            <li>{shard-rkl}: <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_11727/shard-rkl-6/igt@i915_module_load@reload-no-display.html"=
 moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/6126" moz-do-not-send=3D"true">i915#6126</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt=
@i915_module_load@reload-no-display.html" moz-do-not-send=3D"true">PASS</a>=
</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_dc@dc6-dpms:</p>
          <ul>
            <li>{shard-rkl}: <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_11727/shard-rkl-5/igt@i915_pm_dc@dc6-dpms.html" moz-do-not-sen=
d=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/3989" moz-do-not-send=3D"true">i915#3989</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-2/igt@i915_pm_dc@dc6=
-dpms.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_dc@dc9-dpms:</p>
          <ul>
            <li>{shard-tglu}: <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/CI_DRM_11727/shard-tglu-1/igt@i915_pm_dc@dc9-dpms.html" moz-do-not-s=
end=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4281" moz-do-not-send=3D"true">i915#4281</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglu-4/igt@i915_pm_dc@=
dc9-dpms.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@min-max-config-idle:</p>
          <ul>
            <li>{shard-rkl}: <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_11727/shard-rkl-1/igt@i915_pm_rps@min-max-config-idle.html" mo=
z-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4016" moz-do-not-send=3D"true">i915#4016</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-4/igt@i9=
15_pm_rps@min-max-config-idle.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
          <ul>
            <li>{shard-rkl}: <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_11727/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-0.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1845" moz-do-not-send=3D"true">i915#1845</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/4098" moz-do-not-send=3D"t=
rue">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7231/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-0.html" moz-do=
-not-send=3D"true">PASS</a> +6 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@pipe-a-ctm-negative:</p>
          <ul>
            <li>{shard-rkl}: <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_11727/shard-rkl-2/igt@kms_color@pipe-a-ctm-negative.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1149" moz-do-not-send=3D"true">i915#1149</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1849" moz-do-not-send=3D"true=
">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4070" moz-do-not-send=3D"true">i915#4070</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/4098" moz-do-not-send=3D"true">i915#4098</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/sh=
ard-rkl-6/igt@kms_color@pipe-a-ctm-negative.html" moz-do-not-send=3D"true">=
PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@pipe-a-legacy-gamma:</p>
          <ul>
            <li>{shard-rkl}: <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_11727/shard-rkl-5/igt@kms_color@pipe-a-legacy-gamma.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1849" moz-do-not-send=3D"true">i915#1849</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/4070" moz-do-not-send=3D"true=
">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4098" moz-do-not-send=3D"true">i915#4098</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt@kms_color@pipe-a-=
legacy-gamma.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
          <ul>
            <li>shard-apl: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_11727/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html" =
moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/180" moz-do-not-send=3D"true">i915#180</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl3/i=
gt@kms_cursor_crc@pipe-a-cursor-suspend.html" moz-do-not-send=3D"true">PASS=
</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-b-cursor-64x21-rapid-movement:</p>
          <ul>
            <li>{shard-rkl}: <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_11727/shard-rkl-5/igt@kms_cursor_crc@pipe-b-cursor-64x21-rapid=
-movement.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D112022" moz-do-not-send=3D"true">fdo#1120=
22</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4070" m=
oz-do-not-send=3D"true">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt@kms_cursor_crc@pipe-b-curs=
or-64x21-rapid-movement.html" moz-do-not-send=3D"true">PASS</a> +2 similar =
issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
          <ul>
            <li>shard-kbl: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_11727/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html" =
moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/180" moz-do-not-send=3D"true">i915#180</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl3/i=
gt@kms_cursor_crc@pipe-b-cursor-suspend.html" moz-do-not-send=3D"true">PASS=
</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
          <ul>
            <li>{shard-rkl}: <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_11727/shard-rkl-2/igt@kms_cursor_legacy@basic-flip-after-curso=
r-atomic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D111825" moz-do-not-send=3D"true">fdo#11182=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4070" mo=
z-do-not-send=3D"true">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt@kms_cursor_legacy@basic-fli=
p-after-cursor-atomic.html" moz-do-not-send=3D"true">PASS</a> +3 similar is=
sues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
          <ul>
            <li>shard-iclb: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_11727/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip-varying-=
size.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/5072" moz-do-not-send=3D"true">i915#5072</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard=
-iclb5/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html" moz-do-not-s=
end=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
          <ul>
            <li>shard-glk: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_11727/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-tra=
nsitions.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2346" moz-do-not-send=3D"true">i915#2346<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/s=
hard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html" moz=
-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varyin=
g-size:</p>
          <ul>
            <li>shard-glk: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_11727/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-tra=
nsitions-varying-size.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/2346" moz-do-not-send=3D"tru=
e">i915#2346</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/533" moz-do-not-send=3D"true">i915#533</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-glk5/igt@kms_cursor_legacy@f=
lip-vs-cursor-atomic-transitions-varying-size.html" moz-do-not-send=3D"true=
">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@pipe-c-forked-bo:</p>
          <ul>
            <li>{shard-rkl}: <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_11727/shard-rkl-6/igt@kms_cursor_legacy@pipe-c-forked-bo.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/4070" moz-do-not-send=3D"true">i915#4070</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-5/igt=
@kms_cursor_legacy@pipe-c-forked-bo.html" moz-do-not-send=3D"true">PASS</a>=
</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled:</p>
          <ul>
            <li>{shard-rkl}: <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_11727/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb2101010-mma=
p-gtt-ytiled.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D111314" moz-do-not-send=3D"true">fdo#1=
11314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098=
" moz-do-not-send=3D"true">i915#4098</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/4369" moz-do-not-send=3D"true">i915#4369</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rk=
l-6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled.html" moz-do-n=
ot-send=3D"true">PASS</a> +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@fbc-suspend:</p>
          <ul>
            <li>shard-apl: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_11727/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html" moz-do-not-=
send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4767" moz-do-not-send=3D"true">i915#4767</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl1/igt@kms_fbcon_fb=
t@fbc-suspend.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscal=
ing:</p>
          <ul>
            <li>{shard-rkl}: <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_11727/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-=
16bpp-ytile-upscaling.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/3701" moz-do-not-send=3D"tru=
e">i915#3701</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7231/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-y=
tile-upscaling.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downsc=
aling:</p>
          <ul>
            <li>shard-iclb: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_11727/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-3=
2bpp-ytile-downscaling.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/3701" moz-do-not-send=3D"tr=
ue">i915#3701</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7231/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-=
ytile-downscaling.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mm=
ap-wc:</p>
          <ul>
            <li>shard-glk: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_11727/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-sp=
r-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1888" moz-do-not-send=3D"true=
">i915#1888</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2546" moz-do-not-send=3D"true">i915#2546</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-glk9/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true=
">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mm=
ap-wc:</p>
          <ul>
            <li>{shard-rkl}: <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_11727/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn=
-pri-shrfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1849" moz-do-not-send=3D"t=
rue">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4098" moz-do-not-send=3D"true">i915#4098</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt@kms_frontbuffe=
r_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html" moz-do-not-send=3D"=
true">PASS</a> +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@bad-htotal:</p>
          <ul>
            <li>{shard-rkl}: <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_11727/shard-rkl-2/igt@kms_invalid_mode@bad-htotal.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4278" moz-do-not-send=3D"true">i915#4278</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt@kms_in=
valid_mode@bad-htotal.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_properties@plane-properties-atomic:</p>
          <ul>
            <li>{shard-rkl}: <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_11727/shard-rkl-5/igt@kms_properties@plane-properties-atomic.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1849" moz-do-not-send=3D"true">i915#1849</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6=
/igt@kms_properties@plane-properties-atomic.html" moz-do-not-send=3D"true">=
PASS</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@primary_blt:</p>
          <ul>
            <li>{shard-rkl}: <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_11727/shard-rkl-5/igt@kms_psr@primary_blt.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1072" moz-do-not-send=3D"true">i915#1072</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt@kms_psr@primar=
y_blt.html" moz-do-not-send=3D"true">PASS</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
          <ul>
            <li>shard-iclb: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_11727/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_gtt.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109441" moz-do-not-send=3D"true">fdo#109441</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb2/igt@kms=
_psr@psr2_cursor_mmap_gtt.html" moz-do-not-send=3D"true">PASS</a> +2 simila=
r issues</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-fence-flip:</p>
          <ul>
            <li>{shard-rkl}: <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_11727/shard-rkl-1/igt@prime_vgem@basic-fence-flip.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109295" moz-do-not-send=3D"true">fdo#109295</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/3708" moz-do-not-send=3D"true=
">i915#3708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4098" moz-do-not-send=3D"true">i915#4098</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-rkl-6/igt@prime_vgem@basic-=
fence-flip.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@gem_eio@unwedge-stress:</p>
          <ul>
            <li>shard-tglb: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_11727/shard-tglb2/igt@gem_eio@unwedge-stress.html" moz-do-not-s=
end=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5784" moz-do-not-send=3D"true">i915#5784</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-tglb7/igt@gem_eio@unwe=
dge-stress.html" moz-do-not-send=3D"true">TIMEOUT</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/3063" moz-do-not-send=3D"true">i915#=
3063</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
          <ul>
            <li>shard-iclb: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_11727/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/658" moz-do-not-send=3D"true">i915#658</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb2/igt@i91=
5_pm_dc@dc3co-vpb-simulation.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/588" moz-do-not-send=
=3D"true">i915#588</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
          <ul>
            <li>shard-kbl: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_11727/shard-kbl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html=
" moz-do-not-send=3D"true">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@kms_hdr@bpc-switch-suspend@pip=
e-a-dp-1.html" moz-do-not-send=3D"true">DMESG-FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/180" moz-do-not-send=3D"true">i915#=
180</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:<=
/p>
          <ul>
            <li>shard-iclb: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_11727/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-=
exceed-fully-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2920" moz-do-not-send=3D"true">i91=
5#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7231/shard-iclb7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully=
-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/658" moz-do-not-send=3D"true">i915#658</a>)</l=
i>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
          <ul>
            <li>shard-iclb: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_11727/shard-iclb5/igt@kms_psr2_sf@cursor-plane-update-sf.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D111068" moz-do-not-send=3D"true">fdo#111068</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" moz-do-not-send=3D=
"true">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7231/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2920" moz-do-not-send=3D"true">i915#2920</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
          <ul>
            <li>shard-iclb: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_11727/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-a=
rea-big-fb.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/658" moz-do-not-send=3D"true">i915#658<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/s=
hard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2920" moz-do-not-send=3D"true">i915#2920</a>) +1 similar i=
ssue</li>
          </ul>
        </li>
        <li>
          <p>igt@runner@aborted:</p>
          <ul>
            <li>
              <p>shard-apl: (<a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_11727/shard-apl2/igt@runner@aborted.html" moz-do-not-send=3D"t=
rue">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
1727/shard-apl3/igt@runner@aborted.html" moz-do-not-send=3D"true">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-apl=
6/igt@runner@aborted.html" moz-do-not-send=3D"true">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-apl7/igt@runner@a=
borted.html" moz-do-not-send=3D"true">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-apl4/igt@runner@aborted.html" m=
oz-do-not-send=3D"true">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/180" moz-do-not-send=3D"true">i915#180</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/3002" moz-do-not-send=3D"tr=
ue">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4312" moz-do-not-send=3D"true">i915#4312</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/5257" moz-do-not-send=3D"true">i915#5257=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231=
/shard-apl8/igt@runner@aborted.html" moz-do-not-send=3D"true">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl6/igt@=
runner@aborted.html" moz-do-not-send=3D"true">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-apl2/igt@runner@aborted.h=
tml" moz-do-not-send=3D"true">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7231/shard-apl1/igt@runner@aborted.html" moz-do-not-=
send=3D"true">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7231/shard-apl1/igt@runner@aborted.html" moz-do-not-send=3D"true">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shar=
d-apl4/igt@runner@aborted.html" moz-do-not-send=3D"true">FAIL</a>) (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271" moz-do-not-send=
=3D"true">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/180" moz-do-not-send=3D"true">i915#180</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/3002" moz-do-not-send=3D"true">i915=
#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312=
" moz-do-not-send=3D"true">i915#4312</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/5257" moz-do-not-send=3D"true">i915#5257</a>)</p=
>
            </li>
            <li>
              <p>shard-iclb: (<a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/CI_DRM_11727/shard-iclb8/igt@runner@aborted.html" moz-do-not-send=3D=
"true">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_11727/shard-iclb5/igt@runner@aborted.html" moz-do-not-send=3D"true">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-=
iclb8/igt@runner@aborted.html" moz-do-not-send=3D"true">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002" moz-do-not-send=
=3D"true">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3690" moz-do-not-send=3D"true">i915#3690</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/4312" moz-do-not-send=3D"true">i91=
5#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/525=
7" moz-do-not-send=3D"true">i915#5257</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-iclb6/igt@runner@aborted.html" =
moz-do-not-send=3D"true">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7231/shard-iclb3/igt@runner@aborted.html" moz-do-not-send=
=3D"true">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/3002" moz-do-not-send=3D"true">i915#3002</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/4312" moz-do-not-send=3D"true">i915#431=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257" mo=
z-do-not-send=3D"true">i915#5257</a>)</p>
            </li>
            <li>
              <p>shard-kbl: (<a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_11727/shard-kbl7/igt@runner@aborted.html" moz-do-not-send=3D"t=
rue">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
1727/shard-kbl6/igt@runner@aborted.html" moz-do-not-send=3D"true">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-kbl=
7/igt@runner@aborted.html" moz-do-not-send=3D"true">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-kbl1/igt@runner@a=
borted.html" moz-do-not-send=3D"true">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_11727/shard-kbl6/igt@runner@aborted.html" m=
oz-do-not-send=3D"true">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/CI_DRM_11727/shard-kbl6/igt@runner@aborted.html" moz-do-not-send=
=3D"true">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_=
DRM_11727/shard-kbl7/igt@runner@aborted.html" moz-do-not-send=3D"true">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11727/shar=
d-kbl7/igt@runner@aborted.html" moz-do-not-send=3D"true">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/180" moz-do-not-send=3D=
"true">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3002" moz-do-not-send=3D"true">i915#3002</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/4312" moz-do-not-send=3D"true">i915#43=
12</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257" m=
oz-do-not-send=3D"true">i915#5257</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/92" moz-do-not-send=3D"true">i915#92</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl6/igt=
@runner@aborted.html" moz-do-not-send=3D"true">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@runner@aborted.=
html" moz-do-not-send=3D"true">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@runner@aborted.html" moz-do-not=
-send=3D"true">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7231/shard-kbl6/igt@runner@aborted.html" moz-do-not-send=3D"true">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/sha=
rd-kbl6/igt@runner@aborted.html" moz-do-not-send=3D"true">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl1/igt@runn=
er@aborted.html" moz-do-not-send=3D"true">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl6/igt@runner@aborted.html"=
 moz-do-not-send=3D"true">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7231/shard-kbl1/igt@runner@aborted.html" moz-do-not-send=
=3D"true">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7231/shard-kbl1/igt@runner@aborted.html" moz-do-not-send=3D"true">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kb=
l7/igt@runner@aborted.html" moz-do-not-send=3D"true">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl7/igt@runner@ab=
orted.html" moz-do-not-send=3D"true">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7231/shard-kbl7/igt@runner@aborted.html" moz-=
do-not-send=3D"true">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271" moz-do-not-send=3D"true">fdo#109271</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/180" moz-do-not-send=3D"tr=
ue">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3002" moz-do-not-send=3D"true">i915#3002</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/4312" moz-do-not-send=3D"true">i915#4312<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257" moz-=
do-not-send=3D"true">i915#5257</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/92" moz-do-not-send=3D"true">i915#92</a>)</p>
            </li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_6505 -&gt; IGTPW_7231</li>
        <li>Piglit: piglit_4509 -&gt; None</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_11727: 6034ccb11971698ace6b3af2f6ac02de120a2dc2 @
        <a class=3D"moz-txt-link-freetext" href=3D"git://anongit.freedeskto=
p.org/gfx-ci/linux">git://anongit.freedesktop.org/gfx-ci/linux</a><br>
        IGTPW_7231:
        <a class=3D"moz-txt-link-freetext" href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7231/index.html">https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7231/index.html</a><br>
        IGT_6505: edb1a467fb622b23b927e28ff603fa43851fea97 @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
        <a class=3D"moz-txt-link-freetext" href=3D"git://anongit.freedeskto=
p.org/piglit">git://anongit.freedesktop.org/piglit</a></p>
    </blockquote>
    <br>
  </body>
</html>

--------------FzZF2GpY9mhW0Ecl80BWu097--
