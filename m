Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1A76E037
 for <igt-dev@lists.freedesktop.org>; Mon, 17 May 2021 04:22:57 +0000 (UTC)
References: <20210513090700.7271-1-karthik.b.s@intel.com>
 <162091729403.26535.1922670486233369146@emeril.freedesktop.org>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <2d9432eb-c85a-903e-a564-20bbf6cf90da@intel.com>
Date: Mon, 17 May 2021 09:52:51 +0530
MIME-Version: 1.0
In-Reply-To: <162091729403.26535.1922670486233369146@emeril.freedesktop.org>
Content-Language: en-US
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fdp=5Fdsc=3A_Bug_fix_for_DP_on_Pipe_A?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0804209909=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0804209909==
Content-Type: multipart/alternative;
 boundary="------------7470EBEA32558DD5ECED7E48"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7470EBEA32558DD5ECED7E48
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lakshmi,

This failure is not related to the patch.
Could you please take a look.

Thanks,
Karthik.B.S

On 5/13/2021 8:18 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/kms_dp_dsc: Bug fix for DP on Pipe A
> *URL:* 	https://patchwork.freedesktop.org/series/90121/ 
> <https://patchwork.freedesktop.org/series/90121/>
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/index.html>
>
>
>   CI Bug Log - changes from CI_DRM_10074_full -> IGTPW_5810_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_5810_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_5810_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/index.html
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_5810_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@gem_mmap_gtt@fault-concurrent-x:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk4/igt@gem_mmap_gtt@fault-concurrent-x.html>
>  *
>
>     igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
>
>       o shard-tglb: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb1/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html>
>  *
>
>     igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-1-pipe-c:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk8/igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-1-pipe-c.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk4/igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-1-pipe-c.html>
>  *
>
>     igt@kms_plane_cursor@pipe-a-overlay-size-64:
>
>       o shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html>
>         +1 similar issue
>  *
>
>     igt@kms_plane_cursor@pipe-c-viewport-size-128:
>
>       o shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb5/igt@kms_plane_cursor@pipe-c-viewport-size-128.html>
>
>
>     New tests
>
> New tests have been introduced between CI_DRM_10074_full and 
> IGTPW_5810_full:
>
>
>       New IGT tests (2)
>
>  *
>
>     igt@kms_plane@plane-panning-top-left@pipe-a-planes:
>
>       o Statuses : 5 pass(s)
>       o Exec time: [0.34, 1.42] s
>  *
>
>     igt@kms_plane@plane-panning-top-left@pipe-b-planes:
>
>       o Statuses : 5 pass(s)
>       o Exec time: [0.38, 2.50] s
>
>
>     Known issues
>
> Here are the changes found in IGTPW_5810_full that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@api_intel_allocator@execbuf-with-allocator:
>
>      o
>
>         shard-kbl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl4/igt@api_intel_allocator@execbuf-with-allocator.html>
>         ([i915#3457]) +4 similar issues
>
>      o
>
>         shard-glk: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk5/igt@api_intel_allocator@execbuf-with-allocator.html>
>         ([i915#3457]) +1 similar issue
>
>  *
>
>     igt@api_intel_bb@intel-bb-blit-y:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-apl2/igt@api_intel_bb@intel-bb-blit-y.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl1/igt@api_intel_bb@intel-bb-blit-y.html>
>         ([i915#3471])
>  *
>
>     igt@gem_create@create-massive:
>
>      o
>
>         shard-iclb: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb4/igt@gem_create@create-massive.html>
>         ([i915#3002]) +1 similar issue
>
>      o
>
>         shard-tglb: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb2/igt@gem_create@create-massive.html>
>         ([i915#3002])
>
>  *
>
>     igt@gem_ctx_isolation@preservation-s3@vcs0:
>
>       o shard-kbl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@vcs0.html>
>         ([i915#180] / [i915#3457]) +4 similar issues
>  *
>
>     igt@gem_ctx_persistence@legacy-engines-queued:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb6/igt@gem_ctx_persistence@legacy-engines-queued.html>
>         ([fdo#109271] / [i915#1099]) +2 similar issues
>  *
>
>     igt@gem_eio@unwedge-stress:
>
>      o
>
>         shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-tglb5/igt@gem_eio@unwedge-stress.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb5/igt@gem_eio@unwedge-stress.html>
>         ([i915#2369] / [i915#3063] / [i915#3457])
>
>      o
>
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl6/igt@gem_eio@unwedge-stress.html>
>         ([i915#3457]) +7 similar issues
>
>      o
>
>         shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb2/igt@gem_eio@unwedge-stress.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@gem_eio@unwedge-stress.html>
>         ([i915#2369] / [i915#2481] / [i915#3070] / [i915#3457])
>
>  *
>
>     igt@gem_exec_fair@basic-none-share@rcs0:
>
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         ([i915#2842] / [i915#3457])
>  *
>
>     igt@gem_exec_fair@basic-none-vip@rcs0:
>
>      o
>
>         shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>         ([i915#2842] / [i915#3457])
>
>      o
>
>         shard-iclb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb2/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>         ([i915#2842] / [i915#3457])
>
>      o
>
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk3/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>         ([i915#2842] / [i915#3457])
>
>  *
>
>     igt@gem_exec_fence@parallel@vcs0:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk8/igt@gem_exec_fence@parallel@vcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@gem_exec_fence@parallel@vcs0.html>
>         ([i915#3457]) +29 similar issues
>  *
>
>     igt@gem_exec_params@secure-non-root:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb1/igt@gem_exec_params@secure-non-root.html>
>         ([fdo#112283]) +1 similar issue
>  *
>
>     igt@gem_exec_reloc@basic-wide-active@bcs0:
>
>       o shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb7/igt@gem_exec_reloc@basic-wide-active@bcs0.html>
>         ([i915#2389] / [i915#3457]) +4 similar issues
>  *
>
>     igt@gem_exec_reloc@basic-wide-active@rcs0:
>
>       o shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb5/igt@gem_exec_reloc@basic-wide-active@rcs0.html>
>         ([i915#2389] / [i915#3457]) +2 similar issues
>  *
>
>     igt@gem_exec_whisper@basic-fds-forked-all:
>
>       o shard-glk: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk9/igt@gem_exec_whisper@basic-fds-forked-all.html>
>         ([i915#118] / [i915#95])
>  *
>
>     igt@gem_mmap_gtt@cpuset-basic-small-copy:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk4/igt@gem_mmap_gtt@cpuset-basic-small-copy.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@gem_mmap_gtt@cpuset-basic-small-copy.html>
>         ([i915#3468]) +1 similar issue
>  *
>
>     igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
>
>      o
>
>         shard-snb: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb2/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html>
>         ([i915#3468]) +2 similar issues
>
>      o
>
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-apl2/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl2/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html>
>         ([i915#3468])
>
>  *
>
>     igt@gem_mmap_gtt@cpuset-medium-copy-xy:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb6/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb4/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html>
>         ([i915#3468])
>  *
>
>     igt@gem_mmap_gtt@fault-concurrent-x:
>
>      o
>
>         shard-iclb: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb3/igt@gem_mmap_gtt@fault-concurrent-x.html>
>         ([i915#3468])
>
>      o
>
>         shard-tglb: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb7/igt@gem_mmap_gtt@fault-concurrent-x.html>
>         ([i915#3468])
>
>  *
>
>     igt@gem_mmap_gtt@medium-copy-xy:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk7/igt@gem_mmap_gtt@medium-copy-xy.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk5/igt@gem_mmap_gtt@medium-copy-xy.html>
>         ([i915#2502])
>  *
>
>     igt@gem_mmap_offset@clear:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb7/igt@gem_mmap_offset@clear.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb3/igt@gem_mmap_offset@clear.html>
>         ([i915#3160])
>  *
>
>     igt@gem_pwrite@basic-exhaustion:
>
>      o
>
>         shard-iclb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@gem_pwrite@basic-exhaustion.html>
>         ([i915#2658])
>
>      o
>
>         shard-tglb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@gem_pwrite@basic-exhaustion.html>
>         ([i915#2658])
>
>      o
>
>         shard-glk: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@gem_pwrite@basic-exhaustion.html>
>         ([i915#2658])
>
>  *
>
>     igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:
>
>       o shard-apl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl8/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html>
>         ([i915#3468]) +4 similar issues
>  *
>
>     igt@gem_softpin@evict-snoop-interruptible:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb5/igt@gem_softpin@evict-snoop-interruptible.html>
>         ([fdo#109312]) +1 similar issue
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb8/igt@gem_softpin@evict-snoop-interruptible.html>
>         ([fdo#109312])
>
>  *
>
>     igt@gem_userptr_blits@dmabuf-sync:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl3/igt@gem_userptr_blits@dmabuf-sync.html>
>         ([fdo#109271] / [i915#3323])
>  *
>
>     igt@gem_userptr_blits@input-checking:
>
>       o shard-glk: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk9/igt@gem_userptr_blits@input-checking.html>
>         ([i915#3002]) +1 similar issue
>  *
>
>     igt@gem_userptr_blits@unsync-unmap-cycles:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@gem_userptr_blits@unsync-unmap-cycles.html>
>         ([i915#3297]) +2 similar issues
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb3/igt@gem_userptr_blits@unsync-unmap-cycles.html>
>         ([i915#3297]) +3 similar issues
>
>  *
>
>     igt@gen3_render_mixed_blits:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@gen3_render_mixed_blits.html>
>         ([fdo#109289]) +6 similar issues
>  *
>
>     igt@gen7_exec_parse@load-register-reg:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb4/igt@gen7_exec_parse@load-register-reg.html>
>         ([fdo#109289]) +4 similar issues
>  *
>
>     igt@gen9_exec_parse@bb-large:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@gen9_exec_parse@bb-large.html>
>         ([i915#2527])
>
>      o
>
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl7/igt@gen9_exec_parse@bb-large.html>
>         ([i915#3296])
>
>  *
>
>     igt@gen9_exec_parse@bb-start-param:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb1/igt@gen9_exec_parse@bb-start-param.html>
>         ([fdo#112306]) +4 similar issues
>  *
>
>     igt@gen9_exec_parse@secure-batches:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb8/igt@gen9_exec_parse@secure-batches.html>
>         ([fdo#112306]) +3 similar issues
>  *
>
>     igt@i915_hangman@engine-error@bcs0:
>
>       o shard-tglb: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb3/igt@i915_hangman@engine-error@bcs0.html>
>         ([i915#3457]) +9 similar issues
>  *
>
>     igt@i915_hangman@engine-error@vcs0:
>
>       o shard-iclb: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@i915_hangman@engine-error@vcs0.html>
>         ([i915#3457]) +7 similar issues
>  *
>
>     igt@i915_hangman@engine-error@vecs0:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl7/igt@i915_hangman@engine-error@vecs0.html>
>         ([fdo#109271]) +207 similar issues
>  *
>
>     igt@i915_pm_dc@dc6-dpms:
>
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html>
>         ([i915#454])
>  *
>
>     igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html>
>         ([fdo#109271] / [i915#1937])
>  *
>
>     igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html>
>         ([fdo#109271] / [i915#1937])
>  *
>
>     igt@i915_pm_rc6_residency@rc6-fence:
>
>       o shard-apl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl1/igt@i915_pm_rc6_residency@rc6-fence.html>
>         ([i915#3457])
>  *
>
>     igt@i915_pm_rpm@cursor:
>
>       o shard-glk: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk2/igt@i915_pm_rpm@cursor.html>
>         ([i915#3457]) +1 similar issue
>  *
>
>     igt@i915_pm_rpm@cursor-dpms:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-apl6/igt@i915_pm_rpm@cursor-dpms.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl1/igt@i915_pm_rpm@cursor-dpms.html>
>         ([i915#3457])
>  *
>
>     igt@i915_pm_rpm@dpms-non-lpsp:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb5/igt@i915_pm_rpm@dpms-non-lpsp.html>
>         ([fdo#111644] / [i915#1397] / [i915#2411])
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@i915_pm_rpm@dpms-non-lpsp.html>
>         ([fdo#110892])
>
>  *
>
>     igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html>
>         ([fdo#109293] / [fdo#109506]) +1 similar issue
>  *
>
>     igt@i915_pm_rpm@modeset-pc8-residency-stress:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@i915_pm_rpm@modeset-pc8-residency-stress.html>
>         ([fdo#109506] / [i915#2411]) +1 similar issue
>  *
>
>     igt@i915_selftest@live@execlists:
>
>       o shard-tglb: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@i915_selftest@live@execlists.html>
>         ([i915#3462])
>  *
>
>     igt@i915_selftest@live@gt_lrc:
>
>       o shard-tglb: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@i915_selftest@live@gt_lrc.html>
>         ([i915#2373])
>  *
>
>     igt@i915_selftest@live@gt_pm:
>
>       o shard-tglb: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@i915_selftest@live@gt_pm.html>
>         ([i915#1759] / [i915#2291])
>  *
>
>     igt@i915_selftest@live@hangcheck:
>
>       o shard-snb: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb6/igt@i915_selftest@live@hangcheck.html>
>         ([i915#2782])
>  *
>
>     igt@i915_selftest@live@mman:
>
>       o shard-snb: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb6/igt@i915_selftest@live@mman.html>
>         ([i915#3457])
>  *
>
>     igt@kms_big_fb@linear-8bpp-rotate-270:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb5/igt@kms_big_fb@linear-8bpp-rotate-270.html>
>         ([fdo#111614]) +6 similar issues
>  *
>
>     igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb8/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html>
>         ([fdo#110725] / [fdo#111614]) +3 similar issues
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html>
>         ([fdo#110723])
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>         ([fdo#111615]) +5 similar issues
>  *
>
>     igt@kms_ccs@pipe-b-crc-sprite-planes-basic:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk9/igt@kms_ccs@pipe-b-crc-sprite-planes-basic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@kms_ccs@pipe-b-crc-sprite-planes-basic.html>
>         ([fdo#108145])
>  *
>
>     igt@kms_ccs@pipe-d-bad-rotation-90:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@kms_ccs@pipe-d-bad-rotation-90.html>
>         ([fdo#109278]) +16 similar issues
>  *
>
>     igt@kms_chamelium@hdmi-edid-read:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb2/igt@kms_chamelium@hdmi-edid-read.html>
>         ([fdo#109284] / [fdo#111827]) +20 similar issues
>  *
>
>     igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html>
>         ([fdo#109284] / [fdo#111827]) +14 similar issues
>  *
>
>     igt@kms_chamelium@vga-hpd-enable-disable-mode:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk4/igt@kms_chamelium@vga-hpd-enable-disable-mode.html>
>         ([fdo#109271] / [fdo#111827]) +12 similar issues
>  *
>
>     igt@kms_chamelium@vga-hpd-for-each-pipe:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl4/igt@kms_chamelium@vga-hpd-for-each-pipe.html>
>         ([fdo#109271] / [fdo#111827]) +22 similar issues
>  *
>
>     igt@kms_color@pipe-a-degamma:
>
>       o shard-iclb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb8/igt@kms_color@pipe-a-degamma.html>
>         ([i915#1149]) +1 similar issue
>  *
>
>     igt@kms_color@pipe-a-gamma:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@kms_color@pipe-a-gamma.html>
>         ([i915#71])
>  *
>
>     igt@kms_color@pipe-b-degamma:
>
>       o shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb1/igt@kms_color@pipe-b-degamma.html>
>         ([i915#1149]) +1 similar issue
>  *
>
>     igt@kms_color@pipe-c-gamma:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk3/igt@kms_color@pipe-c-gamma.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk7/igt@kms_color@pipe-c-gamma.html>
>         ([i915#71]) +1 similar issue
>  *
>
>     igt@kms_color_chamelium@pipe-c-ctm-0-25:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl1/igt@kms_color_chamelium@pipe-c-ctm-0-25.html>
>         ([fdo#109271] / [fdo#111827]) +10 similar issues
>  *
>
>     igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb5/igt@kms_color_chamelium@pipe-c-ctm-red-to-blue.html>
>         ([fdo#109271] / [fdo#111827]) +17 similar issues
>  *
>
>     igt@kms_color_chamelium@pipe-d-gamma:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb2/igt@kms_color_chamelium@pipe-d-gamma.html>
>         ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue
>  *
>
>     igt@kms_content_protection@atomic:
>
>       o shard-kbl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl4/igt@kms_content_protection@atomic.html>
>         ([i915#1319]) +2 similar issues
>  *
>
>     igt@kms_content_protection@mei_interface:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb2/igt@kms_content_protection@mei_interface.html>
>         ([fdo#109300] / [fdo#111066]) +1 similar issue
>  *
>
>     igt@kms_content_protection@srm:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@kms_content_protection@srm.html>
>         ([fdo#111828]) +2 similar issues
>  *
>
>     igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk3/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html>
>         ([i915#3444] / [i915#3457]) +9 similar issues
>  *
>
>     igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
>
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html>
>         ([i915#2124] / [i915#3457])
>  *
>
>     igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb5/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html>
>         ([fdo#109271] / [i915#3457]) +30 similar issues
>  *
>
>     igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html>
>         ([i915#3319] / [i915#3457]) +4 similar issues
>  *
>
>     igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding:
>
>       o shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb5/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html>
>         ([i915#3457]) +2 similar issues
>  *
>
>     igt@kms_cursor_crc@pipe-b-cursor-32x32-random:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-32x32-random.html>
>         ([fdo#109271] / [i915#3457]) +16 similar issues
>  *
>
>     igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html>
>         ([fdo#109278] / [fdo#109279] / [i915#3457]) +1 similar issue
>  *
>
>     igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen.html>
>         ([fdo#109271] / [i915#3457]) +10 similar issues
>  *
>
>     igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:
>
>      o
>
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html>
>         ([i915#3444] / [i915#3457]) +14 similar issues
>
>      o
>
>         shard-iclb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html>
>         ([i915#3457]) +11 similar issues
>
>  *
>
>     igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:
>
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html>
>         ([i915#3444] / [i915#3457])
>  *
>
>     igt@kms_cursor_crc@pipe-c-cursor-256x256-random:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html>
>         ([i915#3444] / [i915#3457]) +1 similar issue
>  *
>
>     igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement.html>
>         ([i915#3359] / [i915#3457]) +5 similar issues
>  *
>
>     igt@kms_cursor_crc@pipe-c-cursor-size-change:
>
>      o
>
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@kms_cursor_crc@pipe-c-cursor-size-change.html>
>         ([i915#3444] / [i915#3457]) +10 similar issues
>
>      o
>
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-size-change.html>
>         ([i915#3444] / [i915#3457]) +1 similar issue
>
>  *
>
>     igt@kms_cursor_crc@pipe-c-cursor-suspend:
>
>       o shard-kbl: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html>
>         ([i915#180] / [i915#3457])
>  *
>
>     igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb5/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html>
>         ([fdo#109278] / [i915#3457]) +16 similar issues
>  *
>
>     igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html>
>         ([fdo#109279] / [i915#3359] / [i915#3457]) +5 similar issues
>  *
>
>     igt@kms_cursor_crc@pipe-d-cursor-alpha-opaque:
>
>       o shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-alpha-opaque.html>
>         ([i915#2124] / [i915#3457]) +20 similar issues
>  *
>
>     igt@kms_cursor_crc@pipe-d-cursor-suspend:
>
>      o
>
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl4/igt@kms_cursor_crc@pipe-d-cursor-suspend.html>
>         ([fdo#109271] / [i915#3457]) +33 similar issues
>
>      o
>
>         shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-suspend.html>
>         ([i915#2124] / [i915#2411] / [i915#3457])
>
>  *
>
>     igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html>
>         ([i915#70]) +3 similar issues
>  *
>
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html>
>         ([fdo#109274] / [fdo#109278]) +5 similar issues
>  *
>
>     igt@kms_fbcon_fbt@fbc-suspend:
>
>       o shard-kbl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html>
>         ([i915#155] / [i915#180] / [i915#636])
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html>
>         ([fdo#109274]) +9 similar issues
>  *
>
>     igt@kms_flip@2x-plain-flip-ts-check:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@kms_flip@2x-plain-flip-ts-check.html>
>         ([fdo#111825]) +73 similar issues
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile
>


--------------7470EBEA32558DD5ECED7E48
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
    <div class="moz-cite-prefix">This failure is not related to the
      patch.</div>
    <div class="moz-cite-prefix">Could you please take a look.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Thanks,</div>
    <div class="moz-cite-prefix">Karthik.B.S<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 5/13/2021 8:18 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:162091729403.26535.1922670486233369146@emeril.freedesktop.org">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/kms_dp_dsc: Bug fix for DP on Pipe A</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/90121/"
                moz-do-not-send="true">https://patchwork.freedesktop.org/series/90121/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
                href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/index.html"
                moz-do-not-send="true">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_10074_full -&gt;
        IGTPW_5810_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_5810_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_5810_full, please notify your bug team to
        allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/index.html</a></p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_5810_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@gem_mmap_gtt@fault-concurrent-x:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk4/igt@gem_mmap_gtt@fault-concurrent-x.html"
                moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb1/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html"
                moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-1-pipe-c:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk8/igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-1-pipe-c.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk4/igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-1-pipe-c.html"
                moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@pipe-a-overlay-size-64:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html"
                moz-do-not-send="true">FAIL</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@pipe-c-viewport-size-128:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb5/igt@kms_plane_cursor@pipe-c-viewport-size-128.html"
                moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between CI_DRM_10074_full and
        IGTPW_5810_full:</p>
      <h3>New IGT tests (2)</h3>
      <ul>
        <li>
          <p>igt@kms_plane@plane-panning-top-left@pipe-a-planes:</p>
          <ul>
            <li>Statuses : 5 pass(s)</li>
            <li>Exec time: [0.34, 1.42] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-top-left@pipe-b-planes:</p>
          <ul>
            <li>Statuses : 5 pass(s)</li>
            <li>Exec time: [0.38, 2.50] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_5810_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@api_intel_allocator@execbuf-with-allocator:</p>
          <ul>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl4/igt@api_intel_allocator@execbuf-with-allocator.html"
                  moz-do-not-send="true">DMESG-WARN</a> ([i915#3457]) +4
                similar issues</p>
            </li>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk5/igt@api_intel_allocator@execbuf-with-allocator.html"
                  moz-do-not-send="true">DMESG-FAIL</a> ([i915#3457]) +1
                similar issue</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@api_intel_bb@intel-bb-blit-y:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-apl2/igt@api_intel_bb@intel-bb-blit-y.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl1/igt@api_intel_bb@intel-bb-blit-y.html"
                moz-do-not-send="true">FAIL</a> ([i915#3471])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@create-massive:</p>
          <ul>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb4/igt@gem_create@create-massive.html"
                  moz-do-not-send="true">DMESG-WARN</a> ([i915#3002]) +1
                similar issue</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb2/igt@gem_create@create-massive.html"
                  moz-do-not-send="true">DMESG-WARN</a> ([i915#3002])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@vcs0.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#180] /
              [i915#3457]) +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb6/igt@gem_ctx_persistence@legacy-engines-queued.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#1099]) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@unwedge-stress:</p>
          <ul>
            <li>
              <p>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-tglb5/igt@gem_eio@unwedge-stress.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb5/igt@gem_eio@unwedge-stress.html"
                  moz-do-not-send="true">TIMEOUT</a> ([i915#2369] /
                [i915#3063] / [i915#3457])</p>
            </li>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl6/igt@gem_eio@unwedge-stress.html"
                  moz-do-not-send="true">FAIL</a> ([i915#3457]) +7
                similar issues</p>
            </li>
            <li>
              <p>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb2/igt@gem_eio@unwedge-stress.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@gem_eio@unwedge-stress.html"
                  moz-do-not-send="true">TIMEOUT</a> ([i915#2369] /
                [i915#2481] / [i915#3070] / [i915#3457])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@gem_exec_fair@basic-none-share@rcs0.html"
                moz-do-not-send="true">FAIL</a> ([i915#2842] /
              [i915#3457])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@gem_exec_fair@basic-none-vip@rcs0.html"
                  moz-do-not-send="true">FAIL</a> ([i915#2842] /
                [i915#3457])</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb2/igt@gem_exec_fair@basic-none-vip@rcs0.html"
                  moz-do-not-send="true">FAIL</a> ([i915#2842] /
                [i915#3457])</p>
            </li>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk3/igt@gem_exec_fair@basic-none-vip@rcs0.html"
                  moz-do-not-send="true">FAIL</a> ([i915#2842] /
                [i915#3457])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fence@parallel@vcs0:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk8/igt@gem_exec_fence@parallel@vcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@gem_exec_fence@parallel@vcs0.html"
                moz-do-not-send="true">FAIL</a> ([i915#3457]) +29
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_params@secure-non-root:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb1/igt@gem_exec_params@secure-non-root.html"
                moz-do-not-send="true">SKIP</a> ([fdo#112283]) +1
              similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb7/igt@gem_exec_reloc@basic-wide-active@bcs0.html"
                moz-do-not-send="true">FAIL</a> ([i915#2389] /
              [i915#3457]) +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-wide-active@rcs0:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb5/igt@gem_exec_reloc@basic-wide-active@rcs0.html"
                moz-do-not-send="true">FAIL</a> ([i915#2389] /
              [i915#3457]) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_whisper@basic-fds-forked-all:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk9/igt@gem_exec_whisper@basic-fds-forked-all.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#118] /
              [i915#95])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@cpuset-basic-small-copy:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk4/igt@gem_mmap_gtt@cpuset-basic-small-copy.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@gem_mmap_gtt@cpuset-basic-small-copy.html"
                moz-do-not-send="true">INCOMPLETE</a> ([i915#3468]) +1
              similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
          <ul>
            <li>
              <p>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb2/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html"
                  moz-do-not-send="true">INCOMPLETE</a> ([i915#3468]) +2
                similar issues</p>
            </li>
            <li>
              <p>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-apl2/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl2/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html"
                  moz-do-not-send="true">INCOMPLETE</a> ([i915#3468])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb6/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb4/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html"
                moz-do-not-send="true">INCOMPLETE</a> ([i915#3468])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@fault-concurrent-x:</p>
          <ul>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb3/igt@gem_mmap_gtt@fault-concurrent-x.html"
                  moz-do-not-send="true">INCOMPLETE</a> ([i915#3468])</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb7/igt@gem_mmap_gtt@fault-concurrent-x.html"
                  moz-do-not-send="true">INCOMPLETE</a> ([i915#3468])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@medium-copy-xy:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk7/igt@gem_mmap_gtt@medium-copy-xy.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk5/igt@gem_mmap_gtt@medium-copy-xy.html"
                moz-do-not-send="true">INCOMPLETE</a> ([i915#2502])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_offset@clear:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb7/igt@gem_mmap_offset@clear.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb3/igt@gem_mmap_offset@clear.html"
                moz-do-not-send="true">FAIL</a> ([i915#3160])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pwrite@basic-exhaustion:</p>
          <ul>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@gem_pwrite@basic-exhaustion.html"
                  moz-do-not-send="true">WARN</a> ([i915#2658])</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@gem_pwrite@basic-exhaustion.html"
                  moz-do-not-send="true">WARN</a> ([i915#2658])</p>
            </li>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@gem_pwrite@basic-exhaustion.html"
                  moz-do-not-send="true">WARN</a> ([i915#2658])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl8/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html"
                moz-do-not-send="true">INCOMPLETE</a> ([i915#3468]) +4
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_softpin@evict-snoop-interruptible:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb5/igt@gem_softpin@evict-snoop-interruptible.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109312]) +1
                similar issue</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb8/igt@gem_softpin@evict-snoop-interruptible.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109312])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@dmabuf-sync:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl3/igt@gem_userptr_blits@dmabuf-sync.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#3323])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@input-checking:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk9/igt@gem_userptr_blits@input-checking.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#3002]) +1
              similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@gem_userptr_blits@unsync-unmap-cycles.html"
                  moz-do-not-send="true">SKIP</a> ([i915#3297]) +2
                similar issues</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb3/igt@gem_userptr_blits@unsync-unmap-cycles.html"
                  moz-do-not-send="true">SKIP</a> ([i915#3297]) +3
                similar issues</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gen3_render_mixed_blits:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@gen3_render_mixed_blits.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109289]) +6
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gen7_exec_parse@load-register-reg:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb4/igt@gen7_exec_parse@load-register-reg.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109289]) +4
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-large:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@gen9_exec_parse@bb-large.html"
                  moz-do-not-send="true">SKIP</a> ([i915#2527])</p>
            </li>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl7/igt@gen9_exec_parse@bb-large.html"
                  moz-do-not-send="true">FAIL</a> ([i915#3296])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-start-param:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb1/igt@gen9_exec_parse@bb-start-param.html"
                moz-do-not-send="true">SKIP</a> ([fdo#112306]) +4
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@secure-batches:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb8/igt@gen9_exec_parse@secure-batches.html"
                moz-do-not-send="true">SKIP</a> ([fdo#112306]) +3
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_hangman@engine-error@bcs0:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb3/igt@i915_hangman@engine-error@bcs0.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#3457]) +9
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_hangman@engine-error@vcs0:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@i915_hangman@engine-error@vcs0.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#3457]) +7
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_hangman@engine-error@vecs0:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl7/igt@i915_hangman@engine-error@vecs0.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271]) +207
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">FAIL</a> ([i915#454])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#1937])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#1937])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-fence:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl1/igt@i915_pm_rc6_residency@rc6-fence.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#3457])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@cursor:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk2/igt@i915_pm_rpm@cursor.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#3457]) +1
              similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@cursor-dpms:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-apl6/igt@i915_pm_rpm@cursor-dpms.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl1/igt@i915_pm_rpm@cursor-dpms.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#3457])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb5/igt@i915_pm_rpm@dpms-non-lpsp.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#111644] /
                [i915#1397] / [i915#2411])</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@i915_pm_rpm@dpms-non-lpsp.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#110892])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109293] /
              [fdo#109506]) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@i915_pm_rpm@modeset-pc8-residency-stress.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109506] /
              [i915#2411]) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@execlists:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@i915_selftest@live@execlists.html"
                moz-do-not-send="true">INCOMPLETE</a> ([i915#3462])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@gt_lrc:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@i915_selftest@live@gt_lrc.html"
                moz-do-not-send="true">DMESG-FAIL</a> ([i915#2373])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@gt_pm:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@i915_selftest@live@gt_pm.html"
                moz-do-not-send="true">DMESG-FAIL</a> ([i915#1759] /
              [i915#2291])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@hangcheck:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb6/igt@i915_selftest@live@hangcheck.html"
                moz-do-not-send="true">INCOMPLETE</a> ([i915#2782])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@mman:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb6/igt@i915_selftest@live@mman.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#3457])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb5/igt@kms_big_fb@linear-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> ([fdo#111614]) +6
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb8/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> ([fdo#110725] /
              [fdo#111614]) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> ([fdo#110723])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html"
                moz-do-not-send="true">SKIP</a> ([fdo#111615]) +5
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk9/igt@kms_ccs@pipe-b-crc-sprite-planes-basic.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@kms_ccs@pipe-b-crc-sprite-planes-basic.html"
                moz-do-not-send="true">FAIL</a> ([fdo#108145])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-d-bad-rotation-90:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@kms_ccs@pipe-d-bad-rotation-90.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109278]) +16
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium@hdmi-edid-read:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb2/igt@kms_chamelium@hdmi-edid-read.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109284] /
              [fdo#111827]) +20 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb7/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109284] /
              [fdo#111827]) +14 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium@vga-hpd-enable-disable-mode:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk4/igt@kms_chamelium@vga-hpd-enable-disable-mode.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [fdo#111827]) +12 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl4/igt@kms_chamelium@vga-hpd-for-each-pipe.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [fdo#111827]) +22 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@pipe-a-degamma:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb8/igt@kms_color@pipe-a-degamma.html"
                moz-do-not-send="true">FAIL</a> ([i915#1149]) +1 similar
              issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@pipe-a-gamma:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@kms_color@pipe-a-gamma.html"
                moz-do-not-send="true">FAIL</a> ([i915#71])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@pipe-b-degamma:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb1/igt@kms_color@pipe-b-degamma.html"
                moz-do-not-send="true">FAIL</a> ([i915#1149]) +1 similar
              issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@pipe-c-gamma:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk3/igt@kms_color@pipe-c-gamma.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk7/igt@kms_color@pipe-c-gamma.html"
                moz-do-not-send="true">FAIL</a> ([i915#71]) +1 similar
              issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_chamelium@pipe-c-ctm-0-25:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl1/igt@kms_color_chamelium@pipe-c-ctm-0-25.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [fdo#111827]) +10 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb5/igt@kms_color_chamelium@pipe-c-ctm-red-to-blue.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [fdo#111827]) +17 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_chamelium@pipe-d-gamma:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb2/igt@kms_color_chamelium@pipe-d-gamma.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109278] /
              [fdo#109284] / [fdo#111827]) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl4/igt@kms_content_protection@atomic.html"
                moz-do-not-send="true">TIMEOUT</a> ([i915#1319]) +2
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@mei_interface:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb2/igt@kms_content_protection@mei_interface.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109300] /
              [fdo#111066]) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@kms_content_protection@srm.html"
                moz-do-not-send="true">SKIP</a> ([fdo#111828]) +2
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk3/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html"
                moz-do-not-send="true">FAIL</a> ([i915#3444] /
              [i915#3457]) +9 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html"
                moz-do-not-send="true">FAIL</a> ([i915#2124] /
              [i915#3457])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb5/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#3457]) +30 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html"
                moz-do-not-send="true">SKIP</a> ([i915#3319] /
              [i915#3457]) +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-snb5/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html"
                moz-do-not-send="true">FAIL</a> ([i915#3457]) +2 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-b-cursor-32x32-random:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-32x32-random.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#3457]) +16 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109278] /
              [fdo#109279] / [i915#3457]) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#3457]) +10 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:</p>
          <ul>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html"
                  moz-do-not-send="true">FAIL</a> ([i915#3444] /
                [i915#3457]) +14 similar issues</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html"
                  moz-do-not-send="true">FAIL</a> ([i915#3457]) +11
                similar issues</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html"
                moz-do-not-send="true">FAIL</a> ([i915#3444] /
              [i915#3457])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-c-cursor-256x256-random:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html"
                moz-do-not-send="true">FAIL</a> ([i915#3444] /
              [i915#3457]) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement.html"
                moz-do-not-send="true">SKIP</a> ([i915#3359] /
              [i915#3457]) +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-c-cursor-size-change:</p>
          <ul>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@kms_cursor_crc@pipe-c-cursor-size-change.html"
                  moz-do-not-send="true">FAIL</a> ([i915#3444] /
                [i915#3457]) +10 similar issues</p>
            </li>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-size-change.html"
                  moz-do-not-send="true">FAIL</a> ([i915#3444] /
                [i915#3457]) +1 similar issue</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html"
                moz-do-not-send="true">DMESG-FAIL</a> ([i915#180] /
              [i915#3457])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb5/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109278] /
              [i915#3457]) +16 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109279] /
              [i915#3359] / [i915#3457]) +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-d-cursor-alpha-opaque:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-alpha-opaque.html"
                moz-do-not-send="true">FAIL</a> ([i915#2124] /
              [i915#3457]) +20 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-d-cursor-suspend:</p>
          <ul>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl4/igt@kms_cursor_crc@pipe-d-cursor-suspend.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109271] /
                [i915#3457]) +33 similar issues</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-suspend.html"
                  moz-do-not-send="true">FAIL</a> ([i915#2124] /
                [i915#2411] / [i915#3457])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html"
                moz-do-not-send="true">FAIL</a> ([i915#70]) +3 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109274] /
              [fdo#109278]) +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@fbc-suspend:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a> ([i915#155] /
              [i915#180] / [i915#636])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-iclb2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109274]) +9
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-ts-check:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5810/shard-tglb6/igt@kms_flip@2x-plain-flip-ts-check.html"
                moz-do-not-send="true">SKIP</a> ([fdo#111825]) +73
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile</p>
        </li>
      </ul>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------7470EBEA32558DD5ECED7E48--

--===============0804209909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0804209909==--
