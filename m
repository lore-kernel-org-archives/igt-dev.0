Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D0C10F5B0
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Jul 2022 05:52:54 +0000 (UTC)
Message-ID: <ceea53c0-c172-fdf3-f2cb-6447d638557b@intel.com>
Date: Thu, 21 Jul 2022 07:52:53 +0200
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>
References: <cover.1658322887.git.karolina.drobnik@intel.com>
 <165835705070.27270.4292168449005985763@emeril.freedesktop.org>
From: Karolina Drobnik <karolina.drobnik@intel.com>
In-Reply-To: <165835705070.27270.4292168449005985763@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fexec=5Ffence=3A_Fix_test=5Ffence=5Fawait_for_hanging_work?=
 =?utf-8?q?loads?=
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

On 21.07.2022 00:44, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/gem_exec_fence: Fix test_fence_await for hanging workloads
> *URL:*	https://patchwork.freedesktop.org/series/106531/ 
> <https://patchwork.freedesktop.org/series/106531/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_11928_full -> IGTPW_7544_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_7544_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7544_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/index.html
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
> IGTPW_7544_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html>

Failure unrelated to the patch

> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * igt@gem_mmap_offset@clear:
>       o {shard-rkl}: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-rkl-5/igt@gem_mmap_offset@clear.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_7544_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@feature_discovery@psr2:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb2/igt@feature_discovery@psr2.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb8/igt@feature_discovery@psr2.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>   *
> 
>     igt@gem_ctx_isolation@preservation-s3@vcs0:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>         +7 similar issues
>   *
> 
>     igt@gem_ctx_persistence@engines-mixed:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-snb4/igt@gem_ctx_persistence@engines-mixed.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1099 <https://gitlab.freedesktop.org/drm/intel/issues/1099>)
>   *
> 
>     igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb2/igt@gem_exec_balancer@parallel-keep-submit-fence.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb7/igt@gem_exec_balancer@parallel-keep-submit-fence.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/intel/issues/4525>) +2
>         similar issues
>   *
> 
>     igt@gem_exec_fair@basic-none-share@rcs0:
> 
>       o
> 
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-apl6/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-apl2/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1
>         similar issue
> 
>       o
> 
>         shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb8/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
> 
>   *
> 
>     igt@gem_exec_fair@basic-none@vecs0:
> 
>       o
> 
>         shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-glk5/igt@gem_exec_fair@basic-none@vecs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-glk9/igt@gem_exec_fair@basic-none@vecs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
> 
>       o
> 
>         shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-kbl6/igt@gem_exec_fair@basic-none@vecs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl6/igt@gem_exec_fair@basic-none@vecs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
> 
>   *
> 
>     igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-apl8/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-pace@vcs0:
> 
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-pace@vcs1:
> 
>       o shard-iclb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-apl2/igt@gem_huc_copy@huc-copy.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@parallel-random-verify:
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl4/igt@gem_lmem_swapping@parallel-random-verify.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +1
>         similar issue
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-apl3/igt@gem_lmem_swapping@parallel-random-verify.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb5/igt@gem_lmem_swapping@parallel-random-verify.html>
>         (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-glk6/igt@gem_lmem_swapping@parallel-random-verify.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb6/igt@gem_lmem_swapping@parallel-random-verify.html>
>         (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
> 
>   *
> 
>     igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb3/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html>
>         (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb2/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html>
>         (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
> 
>   *
> 
>     igt@gem_render_copy@y-tiled-to-vebox-linear:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb3/igt@gem_render_copy@y-tiled-to-vebox-linear.html>
>         (i915#768 <https://gitlab.freedesktop.org/drm/intel/issues/768>)
>   *
> 
>     igt@gen7_exec_parse@bitmasks:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb7/igt@gen7_exec_parse@bitmasks.html>
>         (fdo#109289
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) +2
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb4/igt@gen7_exec_parse@bitmasks.html>
>         (fdo#109289
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) +1
>         similar issue
> 
>   *
> 
>     igt@gen9_exec_parse@allowed-all:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-glk3/igt@gen9_exec_parse@allowed-all.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-glk5/igt@gen9_exec_parse@allowed-all.html>
>         (i915#5566
>         <https://gitlab.freedesktop.org/drm/intel/issues/5566> /
>         i915#716 <https://gitlab.freedesktop.org/drm/intel/issues/716>)
>   *
> 
>     igt@gen9_exec_parse@allowed-single:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-kbl7/igt@gen9_exec_parse@allowed-single.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl6/igt@gen9_exec_parse@allowed-single.html>
>         (i915#5566
>         <https://gitlab.freedesktop.org/drm/intel/issues/5566> /
>         i915#716 <https://gitlab.freedesktop.org/drm/intel/issues/716>)
>   *
> 
>     igt@i915_pm_backlight@basic-brightness:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl6/igt@i915_pm_backlight@basic-brightness.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +108
>         similar issues
>   *
> 
>     igt@i915_pm_dc@dc3co-vpb-simulation:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-apl7/igt@i915_pm_dc@dc3co-vpb-simulation.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) +2
>         similar issues
>   *
> 
>     igt@i915_pm_dc@dc6-dpms:
> 
>       o
> 
>         shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb8/igt@i915_pm_dc@dc6-dpms.html>
>         (i915#3989
>         <https://gitlab.freedesktop.org/drm/intel/issues/3989> /
>         i915#454 <https://gitlab.freedesktop.org/drm/intel/issues/454>)
> 
>       o
> 
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl4/igt@i915_pm_dc@dc6-dpms.html>
>         (i915#454 <https://gitlab.freedesktop.org/drm/intel/issues/454>)
> 
>   *
> 
>     igt@i915_pm_dc@dc6-psr:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb4/igt@i915_pm_dc@dc6-psr.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb7/igt@i915_pm_dc@dc6-psr.html>
>         (i915#454 <https://gitlab.freedesktop.org/drm/intel/issues/454>)
>   *
> 
>     igt@i915_pm_rpm@pc8-residency:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb4/igt@i915_pm_rpm@pc8-residency.html>
>         (fdo#109293
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109293> /
>         fdo#109506 <https://bugs.freedesktop.org/show_bug.cgi?id=109506>)
>   *
> 
>     igt@i915_query@query-topology-known-pci-ids:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb1/igt@i915_query@query-topology-known-pci-ids.html>
>         (fdo#109303 <https://bugs.freedesktop.org/show_bug.cgi?id=109303>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb8/igt@i915_query@query-topology-known-pci-ids.html>
>         (fdo#109303 <https://bugs.freedesktop.org/show_bug.cgi?id=109303>)
> 
>   *
> 
>     igt@i915_query@query-topology-unsupported:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb1/igt@i915_query@query-topology-unsupported.html>
>         (fdo#109302 <https://bugs.freedesktop.org/show_bug.cgi?id=109302>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb7/igt@i915_query@query-topology-unsupported.html>
>         (fdo#109302 <https://bugs.freedesktop.org/show_bug.cgi?id=109302>)
> 
>   *
> 
>     igt@kms_big_fb@4-tiled-64bpp-rotate-270:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb5/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +1
>         similar issue
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +1
>         similar issue
>   *
> 
>     igt@kms_big_fb@linear-64bpp-rotate-270:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb2/igt@kms_big_fb@linear-64bpp-rotate-270.html>
>         (fdo#111614
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +1
>         similar issue
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb2/igt@kms_big_fb@linear-64bpp-rotate-270.html>
>         (fdo#110725
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110725> /
>         fdo#111614
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +1
>         similar issue
> 
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-0:
> 
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-snb2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-snb2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html>
>         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615>) +1
>         similar issue
>   *
> 
>     igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb7/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#6095
>         <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +2
>         similar issues
>   *
> 
>     igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-apl1/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +5
>         similar issues
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb2/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
> 
>   *
> 
>     igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-glk6/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +4
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb6/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +4
>         similar issues
> 
>   *
> 
>     igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb1/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html>
>         (i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>   *
> 
>     igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl4/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +9
>         similar issues
>   *
> 
>     igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb5/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_rc_ccs_cc.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689>) +1
>         similar issue
>   *
> 
>     igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb2/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +3
>         similar issues
>   *
> 
>     igt@kms_color_chamelium@pipe-c-ctm-0-75:
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl1/igt@kms_color_chamelium@pipe-c-ctm-0-75.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +6
>         similar issues
> 
>       o
> 
>         shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-snb5/igt@kms_color_chamelium@pipe-c-ctm-0-75.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +4
>         similar issues
> 
>   *
> 
>     igt@kms_color_chamelium@pipe-d-ctm-limited-range:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-apl2/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +4
>         similar issues
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb5/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +4
>         similar issues
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-glk8/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +3
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb7/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284>
>         / fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
> 
>   *
> 
>     igt@kms_content_protection@dp-mst-type-1:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb2/igt@kms_content_protection@dp-mst-type-1.html>
>         (i915#3116
>         <https://gitlab.freedesktop.org/drm/intel/issues/3116> /
>         i915#3299 <https://gitlab.freedesktop.org/drm/intel/issues/3299>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb4/igt@kms_content_protection@dp-mst-type-1.html>
>         (i915#3116 <https://gitlab.freedesktop.org/drm/intel/issues/3116>)
> 
>   *
> 
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb3/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html>
>         (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
>   *
> 
>     igt@kms_display_modes@extended-mode-basic:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb8/igt@kms_display_modes@extended-mode-basic.html>
>         (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>)
>   *
> 
>     igt@kms_dsc@basic-dsc:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb3/igt@kms_dsc@basic-dsc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#3828 <https://gitlab.freedesktop.org/drm/intel/issues/3828>)
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html>
>         (i915#4767 <https://gitlab.freedesktop.org/drm/intel/issues/4767>)
>   *
> 
>     igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274>) +3
>         similar issues
>   *
> 
>     igt@kms_flip@2x-plain-flip-interruptible:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb8/igt@kms_flip@2x-plain-flip-interruptible.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>
>         / i915#3637
>         <https://gitlab.freedesktop.org/drm/intel/issues/3637>) +1
>         similar issue
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +5
>         similar issues
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html>
>         (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
> 
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672> /
>         i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html>
>         (i915#160 <https://gitlab.freedesktop.org/drm/intel/issues/160>)
>         +3 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280> /
>         fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +8
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-glk8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +42
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +9
>         similar issues
>   *
> 
>     igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
> 
>       o
> 
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-apl6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-apl6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>         +1 similar issue
> 
>       o
> 
>         shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-kbl4/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl4/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
> 
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
> 
>       o shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html>
>         (i915#265 <https://gitlab.freedesktop.org/drm/intel/issues/265>)
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
> 
>       o shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html>
>         (fdo#108145
>         <https://bugs.freedesktop.org/show_bug.cgi?id=108145> / i915#265
>         <https://gitlab.freedesktop.org/drm/intel/issues/265>)
>   *
> 
>     igt@kms_plane_cursor@pipe-c-viewport-size-256:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-snb5/igt@kms_plane_cursor@pipe-c-viewport-size-256.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +94
>         similar issues
>   *
> 
>     igt@kms_plane_multiple@atomic-pipe-d-tiling-none:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb2/igt@kms_plane_multiple@atomic-pipe-d-tiling-none.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278>) +8
>         similar issues
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html>
>         (i915#5176
>         <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +1
>         similar issue
>   *
> 
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-glk3/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb6/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (fdo#109642
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109642> /
>         fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068>
>         / i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl7/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) +1
>         similar issue
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb7/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (i915#1911 <https://gitlab.freedesktop.org/drm/intel/issues/1911>)
> 
>   *
> 
>     igt@kms_psr2_su@page_flip-xrgb8888:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb7/igt@kms_psr2_su@page_flip-xrgb8888.html>
>         (fdo#109642
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109642> /
>         fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068>
>         / i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>   *
> 
>     igt@kms_psr@primary_page_flip:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-apl6/igt@kms_psr@primary_page_flip.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +90
>         similar issues
>   *
> 
>     igt@kms_psr@psr2_sprite_blt:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb4/igt@kms_psr@psr2_sprite_blt.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) +1
>         similar issue
>   *
> 
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (i915#5519 <https://gitlab.freedesktop.org/drm/intel/issues/5519>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615> /
>         i915#5289 <https://gitlab.freedesktop.org/drm/intel/issues/5289>)
>   *
> 
>     igt@kms_writeback@writeback-check-output:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-apl1/igt@kms_writeback@writeback-check-output.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb5/igt@kms_writeback@writeback-check-output.html>
>         (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-glk5/igt@kms_writeback@writeback-check-output.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb3/igt@kms_writeback@writeback-check-output.html>
>         (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
> 
>   *
> 
>     igt@kms_writeback@writeback-pixel-formats:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl6/igt@kms_writeback@writeback-pixel-formats.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>   *
> 
>     igt@nouveau_crc@pipe-b-source-outp-complete:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb1/igt@nouveau_crc@pipe-b-source-outp-complete.html>
>         (i915#2530 <https://gitlab.freedesktop.org/drm/intel/issues/2530>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb2/igt@nouveau_crc@pipe-b-source-outp-complete.html>
>         (i915#2530 <https://gitlab.freedesktop.org/drm/intel/issues/2530>)
> 
>   *
> 
>     igt@prime_nv_pcopy@test3_4:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb4/igt@prime_nv_pcopy@test3_4.html>
>         (fdo#109291 <https://bugs.freedesktop.org/show_bug.cgi?id=109291>)
>   *
> 
>     igt@prime_vgem@coherency-gtt:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb4/igt@prime_vgem@coherency-gtt.html>
>         (fdo#109292
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109292> /
>         fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb3/igt@prime_vgem@coherency-gtt.html>
>         (fdo#109295
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>         fdo#111656 <https://bugs.freedesktop.org/show_bug.cgi?id=111656>)
> 
>   *
> 
>     igt@sysfs_clients@busy:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb2/igt@sysfs_clients@busy.html>
>         (i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +1
>         similar issue
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-glk2/igt@sysfs_clients@busy.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +1
>         similar issue
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb3/igt@sysfs_clients@busy.html>
>         (i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +1
>         similar issue
> 
>   *
> 
>     igt@sysfs_clients@recycle-many:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-apl1/igt@sysfs_clients@recycle-many.html>
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
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl6/igt@sysfs_clients@split-10.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +1
>         similar issue
>   *
> 
>     igt@tools_test@sysfs_l3_parity:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb5/igt@tools_test@sysfs_l3_parity.html>
>         (fdo#109307 <https://bugs.freedesktop.org/show_bug.cgi?id=109307>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb3/igt@tools_test@sysfs_l3_parity.html>
>         (fdo#109307 <https://bugs.freedesktop.org/show_bug.cgi?id=109307>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@fbdev@unaligned-write:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-2/igt@fbdev@unaligned-write.html>
>         (i915#2582
>         <https://gitlab.freedesktop.org/drm/intel/issues/2582>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-rkl-2/igt@fbdev@unaligned-write.html>
>   *
> 
>     igt@feature_discovery@psr2:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-1/igt@feature_discovery@psr2.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-rkl-6/igt@feature_discovery@psr2.html>
>   *
> 
>     igt@gem_ctx_persistence@legacy-engines-hostile@bsd1:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-dg1-18/igt@gem_ctx_persistence@legacy-engines-hostile@bsd1.html>
>         (i915#4883
>         <https://gitlab.freedesktop.org/drm/intel/issues/4883>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-dg1-13/igt@gem_ctx_persistence@legacy-engines-hostile@bsd1.html>
>   *
> 
>     igt@gem_ctx_persistence@smoketest:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-tglb2/igt@gem_ctx_persistence@smoketest.html>
>         (i915#5099
>         <https://gitlab.freedesktop.org/drm/intel/issues/5099>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglb1/igt@gem_ctx_persistence@smoketest.html>
>   *
> 
>     igt@gem_exec_balancer@parallel-keep-in-fence:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb6/igt@gem_exec_balancer@parallel-keep-in-fence.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/intel/issues/4525>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb2/igt@gem_exec_balancer@parallel-keep-in-fence.html>
>         +1 similar issue
>   *
> 
>     igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>   *
> 
>     igt@gem_exec_fair@basic-none@vcs0:
> 
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html>
>   *
> 
>     igt@gem_exec_reloc@basic-gtt-wc-noreloc:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html>
>         +4 similar issues
>   *
> 
>     igt@gem_partial_pwrite_pread@reads-snoop:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-2/igt@gem_partial_pwrite_pread@reads-snoop.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/intel/issues/3282>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-rkl-5/igt@gem_partial_pwrite_pread@reads-snoop.html>
>   *
> 
>     igt@gen9_exec_parse@basic-rejected:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-1/igt@gen9_exec_parse@basic-rejected.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/intel/issues/2527>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-rkl-5/igt@gen9_exec_parse@basic-rejected.html>
>   *
> 
>     igt@i915_pm_backlight@bad-brightness:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-1/igt@i915_pm_backlight@bad-brightness.html>
>         (i915#3012
>         <https://gitlab.freedesktop.org/drm/intel/issues/3012>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-rkl-6/igt@i915_pm_backlight@bad-brightness.html>
>   *
> 
>     igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
> 
>       o {shard-dg1}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-dg1-15/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html>
>         (i915#1937
>         <https://gitlab.freedesktop.org/drm/intel/issues/1937>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-dg1-13/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html>
>   *
> 
>     igt@i915_pm_rpm@pm-tiling:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-5/igt@i915_pm_rpm@pm-tiling.html>
>         (fdo#109308
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109308>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-rkl-6/igt@i915_pm_rpm@pm-tiling.html>
>   *
> 
>     igt@i915_selftest@live@gt_pm:
> 
>       o {shard-tglu}: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-tglu-6/igt@i915_selftest@live@gt_pm.html>
>         (i915#3987
>         <https://gitlab.freedesktop.org/drm/intel/issues/3987>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-tglu-2/igt@i915_selftest@live@gt_pm.html>
>   *
> 
>     igt@i915_selftest@live@migrate:
> 
>       o shard-iclb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb5/igt@i915_selftest@live@migrate.html>
>         (i915#2867
>         <https://gitlab.freedesktop.org/drm/intel/issues/2867>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb5/igt@i915_selftest@live@migrate.html>
>         +5 similar issues
>   *
> 
>     igt@i915_suspend@basic-s3-without-i915:
> 
>       o shard-snb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-snb7/igt@i915_suspend@basic-s3-without-i915.html>
>         (i915#4528
>         <https://gitlab.freedesktop.org/drm/intel/issues/4528>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-snb7/igt@i915_suspend@basic-s3-without-i915.html>
>   *
> 
>     igt@i915_suspend@fence-restore-untiled:
> 
>       o shard-apl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-apl1/igt@i915_suspend@fence-restore-untiled.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-apl2/igt@i915_suspend@fence-restore-untiled.html>
>   *
> 
>     igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html>
>         (fdo#111314
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111314> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>
>         / i915#4369
>         <https://gitlab.freedesktop.org/drm/intel/issues/4369>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html>
>         +3 similar issues
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
> 
>       o shard-kbl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html>
>         +3 similar issues
>   *
> 
>     igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp1:
> 
>       o
> 
>         shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-apl8/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp1.html>
>         (i915#2122
>         <https://gitlab.freedesktop.org/drm/intel/issues/2122>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-apl6/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp1.html>
> 
>       o
> 
>         shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-kbl7/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp1.html>
>         (i915#2122
>         <https://gitlab.freedesktop.org/drm/intel/issues/2122>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl7/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp1.html>
> 
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html>
>         +1 similar issue
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu.html>
>         +10 similar issues
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-5/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#3546 <https://gitlab.freedesktop.org/drm/intel/issues/3546>
>         / i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html>
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-2/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#3546 <https://gitlab.freedesktop.org/drm/intel/issues/3546>
>         / i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html>
>   *
> 
>     igt@kms_plane_multiple@atomic-pipe-b-tiling-x:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-2/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#3558 <https://gitlab.freedesktop.org/drm/intel/issues/3558>
>         / i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.html>
>         +1 similar issue
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/intel/issues/5235>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html>
>         +2 similar issues
>   *
> 
>     igt@kms_properties@plane-properties-legacy:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-5/igt@kms_properties@plane-properties-legacy.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-rkl-6/igt@kms_properties@plane-properties-legacy.html>
>         +1 similar issue
>   *
> 
>     igt@kms_psr@cursor_blt:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-1/igt@kms_psr@cursor_blt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-rkl-6/igt@kms_psr@cursor_blt.html>
>   *
> 
>     igt@kms_psr@psr2_primary_blt:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb1/igt@kms_psr@psr2_primary_blt.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb2/igt@kms_psr@psr2_primary_blt.html>
>         +2 similar issues
>   *
> 
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (i915#5461
>         <https://gitlab.freedesktop.org/drm/intel/issues/5461>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>   *
> 
>     igt@kms_universal_plane@universal-plane-pipe-a-sanity:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-1/igt@kms_universal_plane@universal-plane-pipe-a-sanity.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070>
>         / i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-rkl-6/igt@kms_universal_plane@universal-plane-pipe-a-sanity.html>
>   *
> 
>     igt@kms_vblank@pipe-a-wait-forked-busy-hang:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-1/igt@kms_vblank@pipe-a-wait-forked-busy-hang.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-rkl-6/igt@kms_vblank@pipe-a-wait-forked-busy-hang.html>
>         +27 similar issues
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html>
>         (i915#4767
>         <https://gitlab.freedesktop.org/drm/intel/issues/4767>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>
>         / i915#4939 <https://gitlab.freedesktop.org/drm/intel/issues/4939>)
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb4/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html>
>         (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>   *
> 
>     igt@kms_psr2_su@page_flip-p010:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb3/igt@kms_psr2_su@page_flip-p010.html>
>         (fdo#109642
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109642> /
>         fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068>
>         / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html>
>         (i915#5939 <https://gitlab.freedesktop.org/drm/intel/issues/5939>)
>   *
> 
>     igt@runner@aborted:
> 
>       o
> 
>         shard-apl: (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-apl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-apl3/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-apl8/igt@runner@aborted.html>)
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>
>         / i915#3002
>         <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>         i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>
>         / i915#5257
>         <https://gitlab.freedesktop.org/drm/intel/issues/5257>) -> (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-apl3/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-apl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-apl6/igt@runner@aborted.html>)
>         (i915#3002
>         <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>         i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>
>         / i915#5257 <https://gitlab.freedesktop.org/drm/intel/issues/5257>)
> 
>       o
> 
>         shard-kbl: (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-kbl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-kbl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-kbl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-kbl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-kbl6/igt@runner@aborted.html>)
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>
>         / i915#3002
>         <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>         i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>
>         / i915#5257
>         <https://gitlab.freedesktop.org/drm/intel/issues/5257>) -> (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl4/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl4/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl4/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/shard-kbl6/igt@runner@aborted.html>)
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180> /
>         i915#3002 <https://gitlab.freedesktop.org/drm/intel/issues/3002>
>         / i915#4312
>         <https://gitlab.freedesktop.org/drm/intel/issues/4312> /
>         i915#5257 <https://gitlab.freedesktop.org/drm/intel/issues/5257>
>         / i915#716 <https://gitlab.freedesktop.org/drm/intel/issues/716>
>         / i915#92 <https://gitlab.freedesktop.org/drm/intel/issues/92>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6593 -> IGTPW_7544
>   * Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> CI_DRM_11928: 8aa8753730556013fd562e01965e5dd571ae55ea @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7544: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7544/index.html
> IGT_6593: 6ac554e19b3bb4232877367911e9185e5d35296f @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
> 
