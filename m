Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678A76E506
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 11:07:02 +0000 (UTC)
References: <20210601034608.11735-1-karthik.b.s@intel.com>
 <162252827386.19251.1430216021032035027@emeril.freedesktop.org>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <9f51f911-6c81-9193-4b12-2667b65caa05@intel.com>
Date: Thu, 3 Jun 2021 16:36:40 +0530
MIME-Version: 1.0
In-Reply-To: <162252827386.19251.1430216021032035027@emeril.freedesktop.org>
Content-Language: en-US
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbig=5Fjoiner=3A_Add_dual_display_subtest?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0647378674=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0647378674==
Content-Type: multipart/alternative;
 boundary="------------DDAB9120693828A229B5638A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------DDAB9120693828A229B5638A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lakshmi,

The errors seen here are a false positive.
Although the issue reported is on the same test (kms_big_joiner), the 
skip is expected here and the warning seen is not related.
Could you please take a look.

Thanks,
Karthik.B.S

On 6/1/2021 11:47 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/kms_big_joiner: Add dual display subtest
> *URL:* 	https://patchwork.freedesktop.org/series/90807/ 
> <https://patchwork.freedesktop.org/series/90807/>
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/index.html>
>
>
>   CI Bug Log - changes from CI_DRM_10153_full -> IGTPW_5869_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_5869_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_5869_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/index.html
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_5869_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_big_joiner@basic:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb6/igt@kms_big_joiner@basic.html>
>         +1 similar issue
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb2/igt@kms_big_joiner@basic.html>
>         +4 similar issues
>
>
>         Warnings
>
>  *
>
>     igt@kms_big_joiner@invalid-modeset:
>
>      o
>
>         shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-iclb7/igt@kms_big_joiner@invalid-modeset.html>
>         ([i915#2705]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb5/igt@kms_big_joiner@invalid-modeset.html>
>
>      o
>
>         shard-tglb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-tglb3/igt@kms_big_joiner@invalid-modeset.html>
>         ([i915#2705]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb6/igt@kms_big_joiner@invalid-modeset.html>
>
>
>     New tests
>
> New tests have been introduced between CI_DRM_10153_full and 
> IGTPW_5869_full:
>
>
>       New IGT tests (1)
>
>   * igt@kms_big_joiner@2x-modeset:
>       o Statuses : 1 skip(s)
>       o Exec time: [0.0] s
>
>
>     Known issues
>
> Here are the changes found in IGTPW_5869_full that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@feature_discovery@display-2x:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb7/igt@feature_discovery@display-2x.html>
>         ([i915#1839])
>  *
>
>     igt@gem_create@create-massive:
>
>      o
>
>         shard-iclb: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb7/igt@gem_create@create-massive.html>
>         ([i915#3002])
>
>      o
>
>         shard-kbl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl1/igt@gem_create@create-massive.html>
>         ([i915#3002])
>
>      o
>
>         shard-tglb: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb1/igt@gem_create@create-massive.html>
>         ([i915#3002])
>
>      o
>
>         shard-glk: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk1/igt@gem_create@create-massive.html>
>         ([i915#3002])
>
>  *
>
>     igt@gem_ctx_persistence@legacy-engines-queued:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-snb6/igt@gem_ctx_persistence@legacy-engines-queued.html>
>         ([fdo#109271] / [i915#1099]) +5 similar issues
>  *
>
>     igt@gem_ctx_persistence@many-contexts:
>
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-tglb5/igt@gem_ctx_persistence@many-contexts.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb8/igt@gem_ctx_persistence@many-contexts.html>
>         ([i915#2410])
>  *
>
>     igt@gem_ctx_shared@q-smoketest-all:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-glk2/igt@gem_ctx_shared@q-smoketest-all.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk7/igt@gem_ctx_shared@q-smoketest-all.html>
>         ([i915#118] / [i915#95])
>  *
>
>     igt@gem_exec_fair@basic-none-vip@rcs0:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk6/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>         ([i915#2842])
>  *
>
>     igt@gem_exec_fair@basic-none@vcs0:
>
>      o
>
>         shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html>
>         ([i915#2842])
>
>      o
>
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-apl1/igt@gem_exec_fair@basic-none@vcs0.html>
>         ([i915#2842])
>
>  *
>
>     igt@gem_exec_fair@basic-pace-solo@rcs0:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-glk8/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>         ([i915#2842])
>  *
>
>     igt@gem_exec_fair@basic-pace@bcs0:
>
>       o shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb5/igt@gem_exec_fair@basic-pace@bcs0.html>
>         ([i915#2842]) +3 similar issues
>  *
>
>     igt@gem_exec_fair@basic-pace@rcs0:
>
>       o shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb5/igt@gem_exec_fair@basic-pace@rcs0.html>
>         ([i915#2876])
>  *
>
>     igt@gem_exec_fair@basic-pace@vcs0:
>
>       o shard-iclb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb8/igt@gem_exec_fair@basic-pace@vcs0.html>
>         ([i915#2842]) +3 similar issues
>  *
>
>     igt@gem_exec_fair@basic-throttle@rcs0:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         ([i915#2849])
>  *
>
>     igt@gem_exec_params@secure-non-master:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb8/igt@gem_exec_params@secure-non-master.html>
>         ([fdo#112283])
>  *
>
>     igt@gem_exec_whisper@basic-queues-all:
>
>       o shard-glk: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk2/igt@gem_exec_whisper@basic-queues-all.html>
>         ([i915#118] / [i915#95]) +1 similar issue
>  *
>
>     igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-iclb3/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb8/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html>
>         ([i915#2910] / [i915#3468])
>  *
>
>     igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
>
>      o
>
>         shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-tglb7/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb5/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html>
>         ([i915#3468])
>
>      o
>
>         shard-kbl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl4/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html>
>         ([i915#3468])
>
>  *
>
>     igt@gem_mmap_gtt@cpuset-medium-copy-xy:
>
>       o shard-apl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-apl3/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html>
>         ([i915#3468]) +1 similar issue
>  *
>
>     igt@gem_mmap_gtt@medium-copy-xy:
>
>       o shard-snb: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-snb7/igt@gem_mmap_gtt@medium-copy-xy.html>
>         ([i915#2055] / [i915#2502] / [i915#3468])
>  *
>
>     igt@gem_pwrite@basic-exhaustion:
>
>      o
>
>         shard-snb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-snb7/igt@gem_pwrite@basic-exhaustion.html>
>         ([i915#2658]) +1 similar issue
>
>      o
>
>         shard-iclb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb3/igt@gem_pwrite@basic-exhaustion.html>
>         ([i915#2658])
>
>      o
>
>         shard-kbl: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl4/igt@gem_pwrite@basic-exhaustion.html>
>         ([i915#2658]) +1 similar issue
>
>      o
>
>         shard-tglb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb5/igt@gem_pwrite@basic-exhaustion.html>
>         ([i915#2658])
>
>      o
>
>         shard-glk: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk7/igt@gem_pwrite@basic-exhaustion.html>
>         ([i915#2658])
>
>  *
>
>     igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk7/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html>
>         ([fdo#109271]) +130 similar issues
>  *
>
>     igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb6/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html>
>         ([i915#768]) +1 similar issue
>  *
>
>     igt@gem_userptr_blits@dmabuf-sync:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-apl1/igt@gem_userptr_blits@dmabuf-sync.html>
>         ([fdo#109271] / [i915#3323])
>  *
>
>     igt@gem_userptr_blits@input-checking:
>
>      o
>
>         shard-apl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-apl6/igt@gem_userptr_blits@input-checking.html>
>         ([i915#3002]) +1 similar issue
>
>      o
>
>         shard-snb: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-snb6/igt@gem_userptr_blits@input-checking.html>
>         ([i915#3002])
>
>  *
>
>     igt@gem_userptr_blits@invalid-mmap-offset-unsync:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb1/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html>
>         ([i915#3297]) +2 similar issues
>  *
>
>     igt@gem_userptr_blits@unsync-unmap-after-close:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb8/igt@gem_userptr_blits@unsync-unmap-after-close.html>
>         ([i915#3297]) +2 similar issues
>  *
>
>     igt@gem_userptr_blits@vma-merge:
>
>      o
>
>         shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-snb6/igt@gem_userptr_blits@vma-merge.html>
>         ([i915#2724])
>
>      o
>
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-apl1/igt@gem_userptr_blits@vma-merge.html>
>         ([i915#3318])
>
>      o
>
>         shard-iclb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb5/igt@gem_userptr_blits@vma-merge.html>
>         ([i915#3318])
>
>      o
>
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk8/igt@gem_userptr_blits@vma-merge.html>
>         ([i915#3318])
>
>      o
>
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl1/igt@gem_userptr_blits@vma-merge.html>
>         ([i915#3318])
>
>      o
>
>         shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb8/igt@gem_userptr_blits@vma-merge.html>
>         ([i915#3318])
>
>  *
>
>     igt@gem_workarounds@suspend-resume-fd:
>
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html>
>         ([i915#180]) +3 similar issues
>  *
>
>     igt@gen7_exec_parse@cmd-crossing-page:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb2/igt@gen7_exec_parse@cmd-crossing-page.html>
>         ([fdo#109289]) +4 similar issues
>  *
>
>     igt@gen9_exec_parse@batch-zero-length:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb2/igt@gen9_exec_parse@batch-zero-length.html>
>         ([fdo#112306]) +1 similar issue
>  *
>
>     igt@gen9_exec_parse@bb-large:
>
>      o
>
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk7/igt@gen9_exec_parse@bb-large.html>
>         ([i915#3296])
>
>      o
>
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl4/igt@gen9_exec_parse@bb-large.html>
>         ([i915#3296])
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb3/igt@gen9_exec_parse@bb-large.html>
>         ([i915#2527])
>
>  *
>
>     igt@gen9_exec_parse@bb-secure:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb8/igt@gen9_exec_parse@bb-secure.html>
>         ([fdo#112306])
>  *
>
>     igt@gen9_exec_parse@shadow-peek:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb3/igt@gen9_exec_parse@shadow-peek.html>
>         ([i915#2856])
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb7/igt@gen9_exec_parse@shadow-peek.html>
>         ([i915#2856])
>
>  *
>
>     igt@i915_pm_dc@dc6-dpms:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-iclb8/igt@i915_pm_dc@dc6-dpms.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html>
>         ([i915#454])
>  *
>
>     igt@i915_pm_dc@dc9-dpms:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb1/igt@i915_pm_dc@dc9-dpms.html>
>         ([i915#3288])
>
>      o
>
>         shard-iclb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html>
>         ([i915#3343])
>
>  *
>
>     igt@i915_pm_rc6_residency@media-rc6-accuracy:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html>
>         ([fdo#109289] / [fdo#111719])
>  *
>
>     igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         ([fdo#111644] / [i915#1397] / [i915#2411])
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb5/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         ([fdo#110892])
>
>  *
>
>     igt@i915_pm_rpm@modeset-pc8-residency-stress:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-apl1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html>
>         ([fdo#109271]) +279 similar issues
>  *
>
>     igt@i915_pm_rpm@pc8-residency:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb1/igt@i915_pm_rpm@pc8-residency.html>
>         ([fdo#109506] / [i915#2411])
>  *
>
>     igt@i915_suspend@fence-restore-tiled2untiled:
>
>       o shard-kbl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html>
>         ([i915#794])
>  *
>
>     igt@kms_big_fb@linear-16bpp-rotate-270:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb8/igt@kms_big_fb@linear-16bpp-rotate-270.html>
>         ([fdo#111614]) +2 similar issues
>  *
>
>     igt@kms_big_fb@linear-16bpp-rotate-90:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb5/igt@kms_big_fb@linear-16bpp-rotate-90.html>
>         ([fdo#110725] / [fdo#111614]) +4 similar issues
>  *
>
>     igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb5/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html>
>         ([fdo#109284] / [fdo#111827]) +13 similar issues
>  *
>
>     igt@kms_chamelium@hdmi-hpd-storm:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl2/igt@kms_chamelium@hdmi-hpd-storm.html>
>         ([fdo#109271] / [fdo#111827]) +21 similar issues
>  *
>
>     igt@kms_color@pipe-d-ctm-negative:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb5/igt@kms_color@pipe-d-ctm-negative.html>
>         ([fdo#109278] / [i915#1149]) +2 similar issues
>  *
>
>     igt@kms_color@pipe-d-degamma:
>
>       o shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb8/igt@kms_color@pipe-d-degamma.html>
>         ([i915#1149])
>  *
>
>     igt@kms_color_chamelium@pipe-a-ctm-0-25:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-0-25.html>
>         ([fdo#109271] / [fdo#111827]) +37 similar issues
>  *
>
>     igt@kms_color_chamelium@pipe-a-ctm-limited-range:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-apl1/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html>
>         ([fdo#109271] / [fdo#111827]) +31 similar issues
>  *
>
>     igt@kms_color_chamelium@pipe-b-ctm-0-5:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk9/igt@kms_color_chamelium@pipe-b-ctm-0-5.html>
>         ([fdo#109271] / [fdo#111827]) +16 similar issues
>  *
>
>     igt@kms_color_chamelium@pipe-d-ctm-0-25:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-0-25.html>
>         ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue
>  *
>
>     igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb3/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html>
>         ([fdo#109284] / [fdo#111827]) +14 similar issues
>  *
>
>     igt@kms_content_protection@atomic-dpms:
>
>       o shard-apl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-apl6/igt@kms_content_protection@atomic-dpms.html>
>         ([i915#1319]) +1 similar issue
>  *
>
>     igt@kms_content_protection@srm:
>
>       o shard-kbl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl7/igt@kms_content_protection@srm.html>
>         ([i915#1319])
>  *
>
>     igt@kms_content_protection@uevent:
>
>      o
>
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl2/igt@kms_content_protection@uevent.html>
>         ([i915#2105])
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb5/igt@kms_content_protection@uevent.html>
>         ([fdo#111828])
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb1/igt@kms_content_protection@uevent.html>
>         ([fdo#109300] / [fdo#111066])
>
>  *
>
>     igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding.html>
>         ([i915#3319]) +1 similar issue
>  *
>
>     igt@kms_cursor_crc@pipe-b-cursor-512x170-random:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-512x170-random.html>
>         ([fdo#109278] / [fdo#109279])
>  *
>
>     igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen.html>
>         ([i915#3359]) +7 similar issues
>  *
>
>     igt@kms_cursor_crc@pipe-d-cursor-512x512-random:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x512-random.html>
>         ([fdo#109279] / [i915#3359])
>  *
>
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html>
>         ([fdo#109274] / [fdo#109278]) +4 similar issues
>  *
>
>     igt@kms_cursor_legacy@pipe-d-torture-bo:
>
>      o
>
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl7/igt@kms_cursor_legacy@pipe-d-torture-bo.html>
>         ([fdo#109271] / [i915#533]) +2 similar issues
>
>      o
>
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-apl7/igt@kms_cursor_legacy@pipe-d-torture-bo.html>
>         ([fdo#109271] / [i915#533]) +1 similar issue
>
>      o
>
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk2/igt@kms_cursor_legacy@pipe-d-torture-bo.html>
>         ([fdo#109271] / [i915#533]) +2 similar issues
>
>  *
>
>     igt@kms_flip@2x-blocking-wf_vblank:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb1/igt@kms_flip@2x-blocking-wf_vblank.html>
>         ([fdo#109274]) +4 similar issues
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html>
>         ([i915#2122])
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html>
>         ([fdo#109271] / [i915#2642])
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-snb7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html>
>         ([fdo#109271]) +571 similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html>
>         ([fdo#109271]) +201 similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html>
>         ([fdo#111825]) +39 similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-suspend:
>
>       o shard-kbl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html>
>         ([i915#180]) +2 similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu.html>
>         ([fdo#109280]) +41 similar issues
>  *
>
>     igt@kms_hdr@static-toggle:
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb5/igt@kms_hdr@static-toggle.html>
>         ([i915#1187]) +1 similar issue
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb3/igt@kms_hdr@static-toggle.html>
>         ([i915#1187])
>
>  *
>
>     igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb6/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html>
>         ([fdo#109289]) +7 similar issues
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html>
>         ([i915#180])
>  *
>
>     igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
>
>      o
>
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html>
>         ([fdo#108145] / [i915#265])
>
>      o
>
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html>
>         ([fdo#108145] / [i915#265])
>
>  *
>
>     igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
>
>      o
>
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html>
>         ([i915#265]) +1 similar issue
>
>      o
>
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html>
>         ([i915#265])
>
>  *
>
>     igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb6/igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max.html>
>         ([fdo#109278]) +45 similar issues
>  *
>
>     igt@kms_plane_lowres@pipe-b-tiling-yf:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb8/igt@kms_plane_lowres@pipe-b-tiling-yf.html>
>         ([fdo#111615]) +3 similar issues
>  *
>
>     igt@kms_prime@basic-crc@first-to-second:
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb5/igt@kms_prime@basic-crc@first-to-second.html>
>         ([i915#1836])
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb2/igt@kms_prime@basic-crc@first-to-second.html>
>         ([i915#1836])
>
>  *
>
>     igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html>
>         ([fdo#109271] / [i915#658]) +6 similar issues
>  *
>
>     igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-apl2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html>
>         ([fdo#109271] / [i915#658]) +7 similar issues
>  *
>
>     igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html>
>         ([i915#2920]) +3 similar issues
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html>
>         ([i915#2920])
>
>  *
>
>     igt@kms_psr2_sf@plane-move-sf-dmg-area-2:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk2/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html>
>         ([fdo#109271] / [i915#658]) +4 similar issues
>  *
>
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html>
>         ([i915#658]) +4 similar issues
>  *
>
>     igt@kms_psr@psr2_primary_mmap_cpu:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html>
>         ([fdo#109441]) +1 similar issue
>  *
>
>     igt@kms_psr@psr2_primary_page_flip:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb6/igt@kms_psr@psr2_primary_page_flip.html>
>         ([fdo#109441]) +2 similar issues
>  *
>
>     igt@kms_psr@psr2_primary_render:
>
>       o shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb3/igt@kms_psr@psr2_primary_render.html>
>         ([i915#132] / [i915#3467]) +1 similar issue
>  *
>
>     igt@kms_psr@psr2_suspend:
>
>       o shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb5/igt@kms_psr@psr2_suspend.html>
>         ([i915#132])
>  *
>
>     igt@nouveau_crc@pipe-a-ctx-flip-detection:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb5/igt@nouveau_crc@pipe-a-ctx-flip-detection.html>
>         ([i915#2530]) +4 similar issues
>  *
>
>     igt@nouveau_crc@pipe-d-ctx-flip-detection:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb3/igt@nouveau_crc@pipe-d-ctx-flip-detection.html>
>         ([i915#2530]) +3 similar issues
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP <https://intel-gfx-ci.01>
>         ([fdo#109278] / [i915#2530]) +1 similar issue
>


--------------DDAB9120693828A229B5638A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi Lakshmi,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">The errors seen here are a false
      positive.</div>
    <div class="moz-cite-prefix">Although the issue reported is on the
      same test (kms_big_joiner), the skip is expected here and the
      warning seen is not related.</div>
    <div class="moz-cite-prefix">Could you please take a look.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Thanks,</div>
    <div class="moz-cite-prefix">Karthik.B.S<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 6/1/2021 11:47 AM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:162252827386.19251.1430216021032035027@emeril.freedesktop.org">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/kms_big_joiner: Add dual display subtest</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/90807/"
                moz-do-not-send="true">https://patchwork.freedesktop.org/series/90807/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
                href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/index.html"
                moz-do-not-send="true">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_10153_full -&gt;
        IGTPW_5869_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_5869_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_5869_full, please notify your bug team to
        allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/index.html</a></p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_5869_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_big_joiner@basic:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb6/igt@kms_big_joiner@basic.html"
                  moz-do-not-send="true">SKIP</a> +1 similar issue</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb2/igt@kms_big_joiner@basic.html"
                  moz-do-not-send="true">SKIP</a> +4 similar issues</p>
            </li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_big_joiner@invalid-modeset:</p>
          <ul>
            <li>
              <p>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-iclb7/igt@kms_big_joiner@invalid-modeset.html"
                  moz-do-not-send="true">SKIP</a> ([i915#2705]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb5/igt@kms_big_joiner@invalid-modeset.html"
                  moz-do-not-send="true">SKIP</a></p>
            </li>
            <li>
              <p>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-tglb3/igt@kms_big_joiner@invalid-modeset.html"
                  moz-do-not-send="true">SKIP</a> ([i915#2705]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb6/igt@kms_big_joiner@invalid-modeset.html"
                  moz-do-not-send="true">SKIP</a></p>
            </li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between CI_DRM_10153_full and
        IGTPW_5869_full:</p>
      <h3>New IGT tests (1)</h3>
      <ul>
        <li>igt@kms_big_joiner@2x-modeset:
          <ul>
            <li>Statuses : 1 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_5869_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@feature_discovery@display-2x:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb7/igt@feature_discovery@display-2x.html"
                moz-do-not-send="true">SKIP</a> ([i915#1839])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@create-massive:</p>
          <ul>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb7/igt@gem_create@create-massive.html"
                  moz-do-not-send="true">DMESG-WARN</a> ([i915#3002])</p>
            </li>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl1/igt@gem_create@create-massive.html"
                  moz-do-not-send="true">DMESG-WARN</a> ([i915#3002])</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb1/igt@gem_create@create-massive.html"
                  moz-do-not-send="true">DMESG-WARN</a> ([i915#3002])</p>
            </li>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk1/igt@gem_create@create-massive.html"
                  moz-do-not-send="true">DMESG-WARN</a> ([i915#3002])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-snb6/igt@gem_ctx_persistence@legacy-engines-queued.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#1099]) +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@many-contexts:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-tglb5/igt@gem_ctx_persistence@many-contexts.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb8/igt@gem_ctx_persistence@many-contexts.html"
                moz-do-not-send="true">FAIL</a> ([i915#2410])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_shared@q-smoketest-all:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-glk2/igt@gem_ctx_shared@q-smoketest-all.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk7/igt@gem_ctx_shared@q-smoketest-all.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#118] /
              [i915#95])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk6/igt@gem_exec_fair@basic-none-vip@rcs0.html"
                moz-do-not-send="true">FAIL</a> ([i915#2842])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none@vcs0:</p>
          <ul>
            <li>
              <p>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html"
                  moz-do-not-send="true">FAIL</a> ([i915#2842])</p>
            </li>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-apl1/igt@gem_exec_fair@basic-none@vcs0.html"
                  moz-do-not-send="true">FAIL</a> ([i915#2842])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-glk8/igt@gem_exec_fair@basic-pace-solo@rcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html"
                moz-do-not-send="true">FAIL</a> ([i915#2842])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace@bcs0:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb5/igt@gem_exec_fair@basic-pace@bcs0.html"
                moz-do-not-send="true">FAIL</a> ([i915#2842]) +3 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace@rcs0:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb5/igt@gem_exec_fair@basic-pace@rcs0.html"
                moz-do-not-send="true">FAIL</a> ([i915#2876])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace@vcs0:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb8/igt@gem_exec_fair@basic-pace@vcs0.html"
                moz-do-not-send="true">FAIL</a> ([i915#2842]) +3 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html"
                moz-do-not-send="true">FAIL</a> ([i915#2849])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_params@secure-non-master:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb8/igt@gem_exec_params@secure-non-master.html"
                moz-do-not-send="true">SKIP</a> ([fdo#112283])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_whisper@basic-queues-all:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk2/igt@gem_exec_whisper@basic-queues-all.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#118] /
              [i915#95]) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-iclb3/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb8/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html"
                moz-do-not-send="true">INCOMPLETE</a> ([i915#2910] /
              [i915#3468])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
          <ul>
            <li>
              <p>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-tglb7/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb5/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html"
                  moz-do-not-send="true">INCOMPLETE</a> ([i915#3468])</p>
            </li>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl4/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html"
                  moz-do-not-send="true">INCOMPLETE</a> ([i915#3468])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-apl3/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html"
                moz-do-not-send="true">INCOMPLETE</a> ([i915#3468]) +1
              similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@medium-copy-xy:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-snb7/igt@gem_mmap_gtt@medium-copy-xy.html"
                moz-do-not-send="true">INCOMPLETE</a> ([i915#2055] /
              [i915#2502] / [i915#3468])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pwrite@basic-exhaustion:</p>
          <ul>
            <li>
              <p>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-snb7/igt@gem_pwrite@basic-exhaustion.html"
                  moz-do-not-send="true">WARN</a> ([i915#2658]) +1
                similar issue</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb3/igt@gem_pwrite@basic-exhaustion.html"
                  moz-do-not-send="true">WARN</a> ([i915#2658])</p>
            </li>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl4/igt@gem_pwrite@basic-exhaustion.html"
                  moz-do-not-send="true">WARN</a> ([i915#2658]) +1
                similar issue</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb5/igt@gem_pwrite@basic-exhaustion.html"
                  moz-do-not-send="true">WARN</a> ([i915#2658])</p>
            </li>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk7/igt@gem_pwrite@basic-exhaustion.html"
                  moz-do-not-send="true">WARN</a> ([i915#2658])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk7/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271]) +130
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb6/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html"
                moz-do-not-send="true">SKIP</a> ([i915#768]) +1 similar
              issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@dmabuf-sync:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-apl1/igt@gem_userptr_blits@dmabuf-sync.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#3323])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@input-checking:</p>
          <ul>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-apl6/igt@gem_userptr_blits@input-checking.html"
                  moz-do-not-send="true">DMESG-WARN</a> ([i915#3002]) +1
                similar issue</p>
            </li>
            <li>
              <p>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-snb6/igt@gem_userptr_blits@input-checking.html"
                  moz-do-not-send="true">DMESG-WARN</a> ([i915#3002])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb1/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html"
                moz-do-not-send="true">SKIP</a> ([i915#3297]) +2 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb8/igt@gem_userptr_blits@unsync-unmap-after-close.html"
                moz-do-not-send="true">SKIP</a> ([i915#3297]) +2 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@vma-merge:</p>
          <ul>
            <li>
              <p>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-snb6/igt@gem_userptr_blits@vma-merge.html"
                  moz-do-not-send="true">FAIL</a> ([i915#2724])</p>
            </li>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-apl1/igt@gem_userptr_blits@vma-merge.html"
                  moz-do-not-send="true">FAIL</a> ([i915#3318])</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb5/igt@gem_userptr_blits@vma-merge.html"
                  moz-do-not-send="true">FAIL</a> ([i915#3318])</p>
            </li>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk8/igt@gem_userptr_blits@vma-merge.html"
                  moz-do-not-send="true">FAIL</a> ([i915#3318])</p>
            </li>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl1/igt@gem_userptr_blits@vma-merge.html"
                  moz-do-not-send="true">FAIL</a> ([i915#3318])</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb8/igt@gem_userptr_blits@vma-merge.html"
                  moz-do-not-send="true">FAIL</a> ([i915#3318])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_workarounds@suspend-resume-fd:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#180]) +3
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gen7_exec_parse@cmd-crossing-page:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb2/igt@gen7_exec_parse@cmd-crossing-page.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109289]) +4
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@batch-zero-length:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb2/igt@gen9_exec_parse@batch-zero-length.html"
                moz-do-not-send="true">SKIP</a> ([fdo#112306]) +1
              similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-large:</p>
          <ul>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk7/igt@gen9_exec_parse@bb-large.html"
                  moz-do-not-send="true">FAIL</a> ([i915#3296])</p>
            </li>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl4/igt@gen9_exec_parse@bb-large.html"
                  moz-do-not-send="true">FAIL</a> ([i915#3296])</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb3/igt@gen9_exec_parse@bb-large.html"
                  moz-do-not-send="true">SKIP</a> ([i915#2527])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-secure:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb8/igt@gen9_exec_parse@bb-secure.html"
                moz-do-not-send="true">SKIP</a> ([fdo#112306])</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@shadow-peek:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb3/igt@gen9_exec_parse@shadow-peek.html"
                  moz-do-not-send="true">SKIP</a> ([i915#2856])</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb7/igt@gen9_exec_parse@shadow-peek.html"
                  moz-do-not-send="true">SKIP</a> ([i915#2856])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-iclb8/igt@i915_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">FAIL</a> ([i915#454])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_dc@dc9-dpms:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb1/igt@i915_pm_dc@dc9-dpms.html"
                  moz-do-not-send="true">SKIP</a> ([i915#3288])</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html"
                  moz-do-not-send="true">FAIL</a> ([i915#3343])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109289] /
              [fdo#111719])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#111644] /
                [i915#1397] / [i915#2411])</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb5/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#110892])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-apl1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271]) +279
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@pc8-residency:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb1/igt@i915_pm_rpm@pc8-residency.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109506] /
              [i915#2411])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html"
                moz-do-not-send="true">INCOMPLETE</a> ([i915#794])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb8/igt@kms_big_fb@linear-16bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> ([fdo#111614]) +2
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb5/igt@kms_big_fb@linear-16bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> ([fdo#110725] /
              [fdo#111614]) +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb5/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109284] /
              [fdo#111827]) +13 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium@hdmi-hpd-storm:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl2/igt@kms_chamelium@hdmi-hpd-storm.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [fdo#111827]) +21 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@pipe-d-ctm-negative:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb5/igt@kms_color@pipe-d-ctm-negative.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109278] /
              [i915#1149]) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@pipe-d-degamma:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb8/igt@kms_color@pipe-d-degamma.html"
                moz-do-not-send="true">FAIL</a> ([i915#1149])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_chamelium@pipe-a-ctm-0-25:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-0-25.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [fdo#111827]) +37 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_chamelium@pipe-a-ctm-limited-range:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-apl1/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [fdo#111827]) +31 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_chamelium@pipe-b-ctm-0-5:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk9/igt@kms_color_chamelium@pipe-b-ctm-0-5.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [fdo#111827]) +16 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_chamelium@pipe-d-ctm-0-25:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-0-25.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109278] /
              [fdo#109284] / [fdo#111827]) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb3/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109284] /
              [fdo#111827]) +14 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-apl6/igt@kms_content_protection@atomic-dpms.html"
                moz-do-not-send="true">TIMEOUT</a> ([i915#1319]) +1
              similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl7/igt@kms_content_protection@srm.html"
                moz-do-not-send="true">TIMEOUT</a> ([i915#1319])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent:</p>
          <ul>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl2/igt@kms_content_protection@uevent.html"
                  moz-do-not-send="true">FAIL</a> ([i915#2105])</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb5/igt@kms_content_protection@uevent.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#111828])</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb1/igt@kms_content_protection@uevent.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109300] /
                [fdo#111066])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding.html"
                moz-do-not-send="true">SKIP</a> ([i915#3319]) +1 similar
              issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-b-cursor-512x170-random:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-512x170-random.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109278] /
              [fdo#109279])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen.html"
                moz-do-not-send="true">SKIP</a> ([i915#3359]) +7 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-d-cursor-512x512-random:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x512-random.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109279] /
              [i915#3359])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109274] /
              [fdo#109278]) +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
          <ul>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl7/igt@kms_cursor_legacy@pipe-d-torture-bo.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109271] /
                [i915#533]) +2 similar issues</p>
            </li>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-apl7/igt@kms_cursor_legacy@pipe-d-torture-bo.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109271] /
                [i915#533]) +1 similar issue</p>
            </li>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk2/igt@kms_cursor_legacy@pipe-d-torture-bo.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109271] /
                [i915#533]) +2 similar issues</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-blocking-wf_vblank:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb1/igt@kms_flip@2x-blocking-wf_vblank.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109274]) +4
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html"
                moz-do-not-send="true">FAIL</a> ([i915#2122])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#2642])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-snb7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271]) +571
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271]) +201
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> ([fdo#111825]) +39
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#180]) +2
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109280]) +41
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle:</p>
          <ul>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb5/igt@kms_hdr@static-toggle.html"
                  moz-do-not-send="true">SKIP</a> ([i915#1187]) +1
                similar issue</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb3/igt@kms_hdr@static-toggle.html"
                  moz-do-not-send="true">SKIP</a> ([i915#1187])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb6/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109289]) +7
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#180])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
          <ul>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html"
                  moz-do-not-send="true">FAIL</a> ([fdo#108145] /
                [i915#265])</p>
            </li>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html"
                  moz-do-not-send="true">FAIL</a> ([fdo#108145] /
                [i915#265])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
          <ul>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html"
                  moz-do-not-send="true">FAIL</a> ([i915#265]) +1
                similar issue</p>
            </li>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html"
                  moz-do-not-send="true">FAIL</a> ([i915#265])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb6/igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109278]) +45
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@pipe-b-tiling-yf:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb8/igt@kms_plane_lowres@pipe-b-tiling-yf.html"
                moz-do-not-send="true">SKIP</a> ([fdo#111615]) +3
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_prime@basic-crc@first-to-second:</p>
          <ul>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb5/igt@kms_prime@basic-crc@first-to-second.html"
                  moz-do-not-send="true">SKIP</a> ([i915#1836])</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb2/igt@kms_prime@basic-crc@first-to-second.html"
                  moz-do-not-send="true">SKIP</a> ([i915#1836])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-kbl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#658]) +6 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-apl2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#658]) +7 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html"
                  moz-do-not-send="true">SKIP</a> ([i915#2920]) +3
                similar issues</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html"
                  moz-do-not-send="true">SKIP</a> ([i915#2920])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@plane-move-sf-dmg-area-2:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-glk2/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#658]) +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html"
                moz-do-not-send="true">SKIP</a> ([i915#658]) +4 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10153/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109441]) +1
              similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_primary_page_flip:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb6/igt@kms_psr@psr2_primary_page_flip.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109441]) +2
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_primary_render:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb3/igt@kms_psr@psr2_primary_render.html"
                moz-do-not-send="true">FAIL</a> ([i915#132] /
              [i915#3467]) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_suspend:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb5/igt@kms_psr@psr2_suspend.html"
                moz-do-not-send="true">FAIL</a> ([i915#132])</li>
          </ul>
        </li>
        <li>
          <p>igt@nouveau_crc@pipe-a-ctx-flip-detection:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-iclb5/igt@nouveau_crc@pipe-a-ctx-flip-detection.html"
                moz-do-not-send="true">SKIP</a> ([i915#2530]) +4 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@nouveau_crc@pipe-d-ctx-flip-detection:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5869/shard-tglb3/igt@nouveau_crc@pipe-d-ctx-flip-detection.html"
                  moz-do-not-send="true">SKIP</a> ([i915#2530]) +3
                similar issues</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
                  href="https://intel-gfx-ci.01" moz-do-not-send="true">SKIP</a>
                ([fdo#109278] / [i915#2530]) +1 similar issue</p>
            </li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------DDAB9120693828A229B5638A--

--===============0647378674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0647378674==--
