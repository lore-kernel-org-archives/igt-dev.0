Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA99A10F1ED
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jun 2022 12:34:57 +0000 (UTC)
Message-ID: <88da7b44-af21-e769-f366-16cd036b388b@intel.com>
Date: Thu, 30 Jun 2022 13:34:39 +0100
MIME-Version: 1.0
Content-Language: en-GB
To: igt-dev@lists.freedesktop.org,
 "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
References: <20220629190658.395463-1-matthew.auld@intel.com>
 <165658889270.26516.17124227584275819476@emeril.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <165658889270.26516.17124227584275819476@emeril.freedesktop.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/9=5D_lib/i915=5Fdrm=5Flocal=3A_Add_?=
 =?utf-8?q?I915=5FGEM=5FCREATE=5FEXT=5FFLAG=5FNEEDS=5FCPU=5FACCESS?=
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

On 30/06/2022 12:34, Patchwork wrote:
> *Patch Details*
> *Series:*	series starting with [i-g-t,1/9] lib/i915_drm_local: Add 
> I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS
> *URL:*	https://patchwork.freedesktop.org/series/105792/ 
> <https://patchwork.freedesktop.org/series/105792/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_11825_full -> IGTPW_7440_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_7440_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7440_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/index.html
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
> IGTPW_7440_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     {igt@gem_create@create-ext-cpu-access-sanity-check} (NEW):
> 
>       o
> 
>         {shard-dg1}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-dg1-19/igt@gem_create@create-ext-cpu-access-sanity-check.html>
>         +4 similar issues
> 
>       o
> 
>         {shard-tglu}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglu-3/igt@gem_create@create-ext-cpu-access-sanity-check.html>
>         +3 similar issues
> 
>   *
> 
>     {igt@gem_exec_capture@capture-invisible@smem0} (NEW):
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb7/igt@gem_exec_capture@capture-invisible@smem0.html>
>         +3 similar issues
>   *
> 
>     {igt@gem_exec_capture@capture-recoverable} (NEW):
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb1/igt@gem_exec_capture@capture-recoverable.html>
>         +3 similar issues
>   *
> 
>     igt@i915_pm_dc@dc5-psr:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-tglb2/igt@i915_pm_dc@dc5-psr.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb2/igt@i915_pm_dc@dc5-psr.html>
>   *

This one looks unrelated. Series shouldn't impact that test or platform.

All the other skips here are normal/expected until we merge the kernel 
series here:
https://patchwork.freedesktop.org/series/105787/

> 
>     {igt@i915_query@query-regions-unallocated} (NEW):
> 
>       o {shard-rkl}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-rkl-4/igt@i915_query@query-regions-unallocated.html>
>         +3 similar issues
> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   *
> 
>     igt@i915_pm_rpm@gem-execbuf@lmem0:
> 
>       o {shard-dg1}: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-dg1-18/igt@i915_pm_rpm@gem-execbuf@lmem0.html>
>   *
> 
>     igt@i915_query@query-regions-sanity-check:
> 
>       o {shard-dg1}: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-dg1-13/igt@i915_query@query-regions-sanity-check.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-dg1-16/igt@i915_query@query-regions-sanity-check.html>
>   *
> 
>     igt@kms_cursor_legacy@torture-bo@pipe-c:
> 
>       o {shard-rkl}: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-rkl-5/igt@kms_cursor_legacy@torture-bo@pipe-c.html>
> 
> 
>     New tests
> 
> New tests have been introduced between CI_DRM_11825_full and 
> IGTPW_7440_full:
> 
> 
>       New IGT tests (6)
> 
>   *
> 
>     igt@gem_create@create-ext-cpu-access-big:
> 
>       o Statuses :
>       o Exec time: [None] s
>   *
> 
>     igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>       o Statuses : 9 skip(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@gem_exec_capture@capture-invisible@lmem0:
> 
>       o Statuses : 1 skip(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@gem_exec_capture@capture-invisible@smem0:
> 
>       o Statuses : 8 skip(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@gem_exec_capture@capture-recoverable:
> 
>       o Statuses : 9 skip(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@i915_query@query-regions-unallocated:
> 
>       o Statuses : 9 skip(s)
>       o Exec time: [0.0] s
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_7440_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@gem_create@create-massive:
> 
>       o shard-apl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-apl4/igt@gem_create@create-massive.html>
>         (i915#4991 <https://gitlab.freedesktop.org/drm/intel/issues/4991>)
>   *
> 
>     igt@gem_ctx_persistence@engines-mixed:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-snb5/igt@gem_ctx_persistence@engines-mixed.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1099
>         <https://gitlab.freedesktop.org/drm/intel/issues/1099>) +1
>         similar issue
>   *
> 
>     igt@gem_ctx_persistence@smoketest:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-glk8/igt@gem_ctx_persistence@smoketest.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-glk7/igt@gem_ctx_persistence@smoketest.html>
>         (i915#6310 <https://gitlab.freedesktop.org/drm/intel/issues/6310>)
>   *
> 
>     igt@gem_eio@in-flight-suspend:
> 
>       o shard-kbl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-kbl7/igt@gem_eio@in-flight-suspend.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>   *
> 
>     igt@gem_exec_balancer@parallel-out-fence:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-iclb4/igt@gem_exec_balancer@parallel-out-fence.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb5/igt@gem_exec_balancer@parallel-out-fence.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/intel/issues/4525>) +1
>         similar issue
>   *
> 
>     igt@gem_exec_fair@basic-none-share@rcs0:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-glk9/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-glk8/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-none-vip@rcs0:
> 
>       o
> 
>         shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb1/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
> 
>       o
> 
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-glk9/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
> 
>   *
> 
>     igt@gem_exec_fair@basic-none@vecs0:
> 
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-kbl4/igt@gem_exec_fair@basic-none@vecs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-pace@vcs1:
> 
>       o shard-iclb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +1
>         similar issue
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-tglb5/igt@gem_huc_copy@huc-copy.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb7/igt@gem_huc_copy@huc-copy.html>
>         (i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@heavy-multi:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb3/igt@gem_lmem_swapping@heavy-multi.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +1
>         similar issue
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb4/igt@gem_lmem_swapping@heavy-multi.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +1
>         similar issue
> 
>   *
> 
>     igt@gem_lmem_swapping@heavy-random:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-apl4/igt@gem_lmem_swapping@heavy-random.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>   *
> 
>     igt@gem_lmem_swapping@parallel-random:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-kbl6/igt@gem_lmem_swapping@parallel-random.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>   *
> 
>     igt@gem_lmem_swapping@random-engines:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-glk1/igt@gem_lmem_swapping@random-engines.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3
>         similar issues
>   *
> 
>     igt@gem_pread@exhaustion:
> 
>       o
> 
>         shard-apl: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-apl7/igt@gem_pread@exhaustion.html>
>         (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb5/igt@gem_pread@exhaustion.html>
>         (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
> 
>       o
> 
>         shard-glk: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-glk3/igt@gem_pread@exhaustion.html>
>         (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb7/igt@gem_pread@exhaustion.html>
>         (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
> 
>       o
> 
>         shard-kbl: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-kbl1/igt@gem_pread@exhaustion.html>
>         (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
> 
>       o
> 
>         shard-snb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-snb4/igt@gem_pread@exhaustion.html>
>         (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
> 
>   *
> 
>     igt@gem_userptr_blits@invalid-mmap-offset-unsync:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb5/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/intel/issues/3297>) +1
>         similar issue
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb7/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/intel/issues/3297>) +1
>         similar issue
> 
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html>
>         (i915#6201 <https://gitlab.freedesktop.org/drm/intel/issues/6201>)
>   *
> 
>     igt@i915_pm_dc@dc9-dpms:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-iclb8/igt@i915_pm_dc@dc9-dpms.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html>
>         (i915#4281 <https://gitlab.freedesktop.org/drm/intel/issues/4281>)
>   *
> 
>     igt@i915_pm_rpm@dpms-non-lpsp:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb7/igt@i915_pm_rpm@dpms-non-lpsp.html>
>         (fdo#111644
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111644> /
>         i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>
>         / i915#2411 <https://gitlab.freedesktop.org/drm/intel/issues/2411>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb7/igt@i915_pm_rpm@dpms-non-lpsp.html>
>         (fdo#110892 <https://bugs.freedesktop.org/show_bug.cgi?id=110892>)
> 
>   *
> 
>     igt@i915_pm_rpm@gem-execbuf-stress-pc8:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-glk5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +192
>         similar issues
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-tglb2/igt@i915_selftest@live@hangcheck.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb5/igt@i915_selftest@live@hangcheck.html>
>         (i915#5591 <https://gitlab.freedesktop.org/drm/intel/issues/5591>)
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-180:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb3/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +1
>         similar issue
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +1
>         similar issue
>   *
> 
>     igt@kms_big_fb@x-tiled-64bpp-rotate-270:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb7/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html>
>         (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb7/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html>
>         (fdo#110725
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110725> /
>         fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>)
> 
>   *
> 
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb3/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html>
>         (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>)
>   *
> 
>     igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb7/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
>         similar issue
>   *
> 
>     igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-apl4/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +3
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb1/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
>         similar issue
> 
>   *
> 
>     igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_rc_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb7/igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_rc_ccs.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +1
>         similar issue
>   *
> 
>     igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-glk1/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +4
>         similar issues
>   *
> 
>     igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_dg2_rc_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb7/igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_dg2_rc_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>   *
> 
>     igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb7/igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615> /
>         i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689>) +3
>         similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-kbl4/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +5
>         similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb1/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689>) +1
>         similar issue
>   *
> 
>     igt@kms_chamelium@dp-hpd-enable-disable-mode:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-glk1/igt@kms_chamelium@dp-hpd-enable-disable-mode.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +17
>         similar issues
>   *
> 
>     igt@kms_chamelium@hdmi-hpd-for-each-pipe:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-snb7/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
>   *
> 
>     igt@kms_chamelium@hdmi-mode-timings:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb5/igt@kms_chamelium@hdmi-mode-timings.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +2
>         similar issues
>   *
> 
>     igt@kms_color_chamelium@pipe-c-ctm-blue-to-red:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-kbl4/igt@kms_color_chamelium@pipe-c-ctm-blue-to-red.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +16
>         similar issues
>   *
> 
>     igt@kms_color_chamelium@pipe-d-ctm-0-5:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb2/igt@kms_color_chamelium@pipe-d-ctm-0-5.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +3
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-0-5.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284>
>         / fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
> 
>   *
> 
>     igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-apl4/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +6
>         similar issues
>   *
> 
>     igt@kms_content_protection@atomic:
> 
>       o shard-apl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-apl3/igt@kms_content_protection@atomic.html>
>         (i915#1319 <https://gitlab.freedesktop.org/drm/intel/issues/1319>)
>   *
> 
>     igt@kms_content_protection@srm:
> 
>       o shard-kbl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-kbl7/igt@kms_content_protection@srm.html>
>         (i915#1319
>         <https://gitlab.freedesktop.org/drm/intel/issues/1319>) +1
>         similar issue
>   *
> 
>     igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-512x170:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb3/igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-512x170.html>
>         (i915#3359
>         <https://gitlab.freedesktop.org/drm/intel/issues/3359>) +5
>         similar issues
>   *
> 
>     igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x32:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb1/igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x32.html>
>         (i915#4462
>         <https://gitlab.freedesktop.org/drm/intel/issues/4462>) +7
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb3/igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x32.html>
>         (i915#4462
>         <https://gitlab.freedesktop.org/drm/intel/issues/4462>) +5
>         similar issues
> 
>   *
> 
>     igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-512x170:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb1/igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-512x170.html>
>         (i915#3359
>         <https://gitlab.freedesktop.org/drm/intel/issues/3359>) +7
>         similar issues
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-kbl3/igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-kbl1/igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>         +2 similar issues
>   *
> 
>     igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled.html>
>         (i915#5287 <https://gitlab.freedesktop.org/drm/intel/issues/5287>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb4/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled.html>
>         (i915#5287 <https://gitlab.freedesktop.org/drm/intel/issues/5287>)
> 
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o
> 
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html>
>         (i915#4767 <https://gitlab.freedesktop.org/drm/intel/issues/4767>)
> 
>       o
> 
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-glk1/igt@kms_fbcon_fbt@fbc-suspend.html>
>         (i915#4767 <https://gitlab.freedesktop.org/drm/intel/issues/4767>)
> 
>   *
> 
>     igt@kms_flip@2x-absolute-wf_vblank:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb3/igt@kms_flip@2x-absolute-wf_vblank.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>
>         / i915#3966 <https://gitlab.freedesktop.org/drm/intel/issues/3966>)
>   *
> 
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +2
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274>) +3
>         similar issues
> 
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/intel/issues/2587>) +1
>         similar issue
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280> /
>         fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +14
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +14
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-kbl4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +229
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +203
>         similar issues
>   *
> 
>     igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-kbl7/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html>
>         (i915#1188 <https://gitlab.freedesktop.org/drm/intel/issues/1188>)
>   *
> 
>     igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>         +3 similar issues
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-glk7/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html>
>         (fdo#108145
>         <https://bugs.freedesktop.org/show_bug.cgi?id=108145> / i915#265
>         <https://gitlab.freedesktop.org/drm/intel/issues/265>)
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
> 
>       o shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html>
>         (fdo#108145
>         <https://bugs.freedesktop.org/show_bug.cgi?id=108145> / i915#265
>         <https://gitlab.freedesktop.org/drm/intel/issues/265>)
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-glk7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html>
>         (i915#265 <https://gitlab.freedesktop.org/drm/intel/issues/265>)
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-apl6/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +125
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb2/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278>) +15
>         similar issues
> 
>   *
> 
>     igt@kms_prime@basic-crc@first-to-second:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb1/igt@kms_prime@basic-crc@first-to-second.html>
>         (i915#1836 <https://gitlab.freedesktop.org/drm/intel/issues/1836>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb8/igt@kms_prime@basic-crc@first-to-second.html>
>         (i915#1836 <https://gitlab.freedesktop.org/drm/intel/issues/1836>)
> 
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>   *
> 
>     igt@kms_psr2_su@page_flip-nv12:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-glk6/igt@kms_psr2_su@page_flip-nv12.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) +2
>         similar issues
>   *
> 
>     igt@kms_psr@psr2_cursor_mmap_cpu:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) +1
>         similar issue
>   *
> 
>     igt@kms_psr@psr2_primary_blt:
> 
>       o
> 
>         shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb5/igt@kms_psr@psr2_primary_blt.html>
>         (i915#132 <https://gitlab.freedesktop.org/drm/intel/issues/132>
>         / i915#3467
>         <https://gitlab.freedesktop.org/drm/intel/issues/3467>) +1
>         similar issue
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb5/igt@kms_psr@psr2_primary_blt.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) +1
>         similar issue
> 
>   *
> 
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-tglb1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (i915#5519 <https://gitlab.freedesktop.org/drm/intel/issues/5519>)
>   *
> 
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html>
>         (i915#5289 <https://gitlab.freedesktop.org/drm/intel/issues/5289>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html>
>         (i915#5289 <https://gitlab.freedesktop.org/drm/intel/issues/5289>)
> 
>   *
> 
>     igt@kms_sysfs_edid_timing:
> 
>       o
> 
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-kbl7/igt@kms_sysfs_edid_timing.html>
>         (IGT#2 <https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2>)
> 
>       o
> 
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-apl6/igt@kms_sysfs_edid_timing.html>
>         (IGT#2 <https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2>)
> 
>   *
> 
>     igt@kms_writeback@writeback-check-output:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-kbl7/igt@kms_writeback@writeback-check-output.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2437
>         <https://gitlab.freedesktop.org/drm/intel/issues/2437>) +1
>         similar issue
>   *
> 
>     igt@nouveau_crc@pipe-b-source-outp-inactive:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb1/igt@nouveau_crc@pipe-b-source-outp-inactive.html>
>         (i915#2530 <https://gitlab.freedesktop.org/drm/intel/issues/2530>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb4/igt@nouveau_crc@pipe-b-source-outp-inactive.html>
>         (i915#2530 <https://gitlab.freedesktop.org/drm/intel/issues/2530>)
> 
>   *
> 
>     igt@sw_sync@sync_multi_timeline_wait:
> 
>       o
> 
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-kbl4/igt@sw_sync@sync_multi_timeline_wait.html>
>         (i915#6140 <https://gitlab.freedesktop.org/drm/intel/issues/6140>)
> 
>       o
> 
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-glk2/igt@sw_sync@sync_multi_timeline_wait.html>
>         (i915#6140 <https://gitlab.freedesktop.org/drm/intel/issues/6140>)
> 
>   *
> 
>     igt@sysfs_clients@fair-3:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-glk8/igt@sysfs_clients@fair-3.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +1
>         similar issue
>   *
> 
>     igt@sysfs_clients@split-10:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-kbl6/igt@sysfs_clients@split-10.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +4
>         similar issues
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@api_intel_bb@blit-reloc-purge-cache:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-rkl-1/igt@api_intel_bb@blit-reloc-purge-cache.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-rkl-5/igt@api_intel_bb@blit-reloc-purge-cache.html>
>         +5 similar issues
>   *
> 
>     igt@device_reset@unbind-reset-rebind:
> 
>       o shard-snb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-snb2/igt@device_reset@unbind-reset-rebind.html>
>         (i915#4528
>         <https://gitlab.freedesktop.org/drm/intel/issues/4528>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-snb5/igt@device_reset@unbind-reset-rebind.html>
>   *
> 
>     igt@fbdev@read:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-rkl-1/igt@fbdev@read.html>
>         (i915#2582
>         <https://gitlab.freedesktop.org/drm/intel/issues/2582>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-rkl-6/igt@fbdev@read.html>
>   *
> 
>     igt@feature_discovery@psr2:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-iclb4/igt@feature_discovery@psr2.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb2/igt@feature_discovery@psr2.html>
>   *
> 
>     igt@gem_ctx_exec@basic-nohangcheck:
> 
>       o
> 
>         shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-tglb2/igt@gem_ctx_exec@basic-nohangcheck.html>
>         (i915#6268
>         <https://gitlab.freedesktop.org/drm/intel/issues/6268>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb1/igt@gem_ctx_exec@basic-nohangcheck.html>
> 
>       o
> 
>         {shard-rkl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html>
>         (i915#6268
>         <https://gitlab.freedesktop.org/drm/intel/issues/6268>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-rkl-5/igt@gem_ctx_exec@basic-nohangcheck.html>
> 
>       o
> 
>         {shard-tglu}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html>
>         (i915#6268
>         <https://gitlab.freedesktop.org/drm/intel/issues/6268>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglu-2/igt@gem_ctx_exec@basic-nohangcheck.html>
> 
>   *
> 
>     igt@gem_ctx_persistence@hostile:
> 
>       o {shard-rkl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-rkl-1/igt@gem_ctx_persistence@hostile.html>
>         (i915#2410
>         <https://gitlab.freedesktop.org/drm/intel/issues/2410>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-rkl-5/igt@gem_ctx_persistence@hostile.html>
>   *
> 
>     igt@gem_eio@unwedge-stress:
> 
>       o {shard-tglu}: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-tglu-1/igt@gem_eio@unwedge-stress.html>
>         (i915#3063
>         <https://gitlab.freedesktop.org/drm/intel/issues/3063>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglu-6/igt@gem_eio@unwedge-stress.html>
>   *
> 
>     igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-iclb6/igt@gem_exec_balancer@parallel-keep-submit-fence.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/intel/issues/4525>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb2/igt@gem_exec_balancer@parallel-keep-submit-fence.html>
>         +1 similar issue
>   *
> 
>     igt@gem_exec_fair@basic-none-share@rcs0:
> 
>       o {shard-tglu}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-tglu-1/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglu-6/igt@gem_exec_fair@basic-none-share@rcs0.html>
>   *
> 
>     igt@gem_exec_fair@basic-none@vcs0:
> 
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-apl8/igt@gem_exec_fair@basic-none@vcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-apl8/igt@gem_exec_fair@basic-none@vcs0.html>
>   *
> 
>     igt@gem_exec_fair@basic-pace@vecs0:
> 
>       o
> 
>         shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html>
>         +1 similar issue
> 
>       o
> 
>         {shard-rkl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-rkl-1/igt@gem_exec_fair@basic-pace@vecs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-rkl-5/igt@gem_exec_fair@basic-pace@vecs0.html>
>         +1 similar issue
> 
>   *
> 
>     igt@gem_exec_fair@basic-throttle@rcs0:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         (i915#2849
>         <https://gitlab.freedesktop.org/drm/intel/issues/2849>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html>
>   *
> 
>     igt@gem_exec_whisper@basic-contexts-priority-all:
> 
>       o shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-glk8/igt@gem_exec_whisper@basic-contexts-priority-all.html>
>         (i915#118 <https://gitlab.freedesktop.org/drm/intel/issues/118>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-glk7/igt@gem_exec_whisper@basic-contexts-priority-all.html>
>   *
> 
>     igt@gem_exec_whisper@basic-fds-priority-all:
> 
>       o shard-glk: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-glk6/igt@gem_exec_whisper@basic-fds-priority-all.html>
>         (i915#6310
>         <https://gitlab.freedesktop.org/drm/intel/issues/6310>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-glk9/igt@gem_exec_whisper@basic-fds-priority-all.html>
>         +1 similar issue
>   *
> 
>     igt@gem_tiled_partial_pwrite_pread@writes:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-rkl-1/igt@gem_tiled_partial_pwrite_pread@writes.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/intel/issues/3282>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-rkl-5/igt@gem_tiled_partial_pwrite_pread@writes.html>
>         +1 similar issue
>   *
> 
>     igt@gen9_exec_parse@batch-without-end:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-rkl-6/igt@gen9_exec_parse@batch-without-end.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/intel/issues/2527>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-rkl-5/igt@gen9_exec_parse@batch-without-end.html>
>         +1 similar issue
>   *
> 
>     igt@i915_pm_rpm@dpms-lpsp:
> 
>       o {shard-dg1}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-dg1-18/igt@i915_pm_rpm@dpms-lpsp.html>
>         (i915#1397
>         <https://gitlab.freedesktop.org/drm/intel/issues/1397>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-dg1-19/igt@i915_pm_rpm@dpms-lpsp.html>
>   *
> 
>     igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-rkl-1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         (i915#1397
>         <https://gitlab.freedesktop.org/drm/intel/issues/1397>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html>
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o shard-snb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-snb4/igt@i915_selftest@live@hangcheck.html>
>         (i915#3921
>         <https://gitlab.freedesktop.org/drm/intel/issues/3921>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-snb7/igt@i915_selftest@live@hangcheck.html>
>   *
> 
>     igt@i915_suspend@forcewake:
> 
>       o shard-apl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-apl2/igt@i915_suspend@forcewake.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-apl1/igt@i915_suspend@forcewake.html>
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-rkl-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-rkl-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         +15 similar issues
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-tglb1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         (i915#3743
>         <https://gitlab.freedesktop.org/drm/intel/issues/3743>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         +1 similar issue
>   *
> 
>     igt@kms_color@pipe-b-ctm-green-to-red:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-rkl-1/igt@kms_color@pipe-b-ctm-green-to-red.html>
>         (i915#1149
>         <https://gitlab.freedesktop.org/drm/intel/issues/1149> /
>         i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849>
>         / i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-rkl-6/igt@kms_color@pipe-b-ctm-green-to-red.html>
>         +1 similar issue
>   *
> 
>     igt@kms_color@pipe-c-invalid-degamma-lut-sizes:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-rkl-1/igt@kms_color@pipe-c-invalid-degamma-lut-sizes.html>
>         (i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-rkl-5/igt@kms_color@pipe-c-invalid-degamma-lut-sizes.html>
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor@toggle:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb2/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html>
>         +2 similar issues
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html>
>         (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html>
>         +1 similar issue
>   *
> 
>     igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-tglb7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html>
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html>
>         (i915#3701
>         <https://gitlab.freedesktop.org/drm/intel/issues/3701>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html>
>         +1 similar issue
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html>
>         +15 similar issues
>   *
> 
>     igt@kms_hdr@bpc-switch@pipe-a-dp-1:
> 
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-kbl1/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html>
>         (i915#1188
>         <https://gitlab.freedesktop.org/drm/intel/issues/1188>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-kbl6/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html>
>   *
> 
>     igt@kms_plane@plane-position-covered@pipe-b-planes:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-rkl-2/igt@kms_plane@plane-position-covered@pipe-b-planes.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#3558
>         <https://gitlab.freedesktop.org/drm/intel/issues/3558>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-rkl-6/igt@kms_plane@plane-position-covered@pipe-b-planes.html>
>         +1 similar issue
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-rkl-1/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070>
>         / i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html>
>         +1 similar issue
>   *
> 
>     igt@kms_plane_cursor@pipe-d-overlay-size-256:
> 
>       o {shard-tglu}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-tglu-8/igt@kms_plane_cursor@pipe-d-overlay-size-256.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglu-4/igt@kms_plane_cursor@pipe-d-overlay-size-256.html>
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/intel/issues/5235>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html>
>         +2 similar issues
>   *
> 
>     igt@kms_psr@primary_page_flip:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-rkl-1/igt@kms_psr@primary_page_flip.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-rkl-6/igt@kms_psr@primary_page_flip.html>
>   *
> 
>     igt@kms_psr@psr2_sprite_mmap_gtt:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html>
>         +2 similar issues
>   *
> 
>     igt@kms_vblank@pipe-b-ts-continuation-suspend:
> 
>       o shard-kbl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-kbl7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html>
>         +5 similar issues
>   *
> 
>     igt@sysfs_heartbeat_interval@nopreempt@bcs0:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-tglb1/igt@sysfs_heartbeat_interval@nopreempt@bcs0.html>
>         (i915#6015
>         <https://gitlab.freedesktop.org/drm/intel/issues/6015>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb7/igt@sysfs_heartbeat_interval@nopreempt@bcs0.html>
>         +4 similar issues
>   *
> 
>     igt@sysfs_heartbeat_interval@precise@rcs0:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-dg1-12/igt@sysfs_heartbeat_interval@precise@rcs0.html>
>         (i915#1755
>         <https://gitlab.freedesktop.org/drm/intel/issues/1755>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-dg1-16/igt@sysfs_heartbeat_interval@precise@rcs0.html>
>         +4 similar issues
>   *
> 
>     igt@sysfs_heartbeat_interval@precise@vecs0:
> 
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-kbl4/igt@sysfs_heartbeat_interval@precise@vecs0.html>
>         (i915#1755
>         <https://gitlab.freedesktop.org/drm/intel/issues/1755>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-kbl1/igt@sysfs_heartbeat_interval@precise@vecs0.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@gem_eio@kms:
> 
>       o shard-tglb: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-tglb5/igt@gem_eio@kms.html>
>         (i915#3063
>         <https://gitlab.freedesktop.org/drm/intel/issues/3063>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb5/igt@gem_eio@kms.html>
>         (i915#5784 <https://gitlab.freedesktop.org/drm/intel/issues/5784>)
>   *
> 
>     igt@gem_exec_fair@basic-pace@bcs0:
> 
>       o shard-tglb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-tglb1/igt@gem_exec_fair@basic-pace@bcs0.html>
>         (i915#2848
>         <https://gitlab.freedesktop.org/drm/intel/issues/2848>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-tglb1/igt@gem_exec_fair@basic-pace@bcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +4
>         similar issues
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-update-sf:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>         (i915#2920
>         <https://gitlab.freedesktop.org/drm/intel/issues/2920>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb1/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>   *
> 
>     igt@kms_psr2_su@page_flip-nv12:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11825/shard-iclb8/igt@kms_psr2_su@page_flip-nv12.html>
>         (fdo#109642
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109642> /
>         fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068>
>         / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html>
>         (i915#5939 <https://gitlab.freedesktop.org/drm/intel/issues/5939>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6551 -> IGTPW_7440
>   * Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> CI_DRM_11825: 3d881054a2b8614e37db0453c662ead2c0fafe8d @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7440: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7440/index.html
> IGT_6551: a01ebaef40f1fa653e9d6a59b719f2d69af2b458 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
> 
