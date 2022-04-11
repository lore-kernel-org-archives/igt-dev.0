Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102FB10E03A
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Apr 2022 20:27:17 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id g18so8283805ejc.10
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Apr 2022 13:27:16 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------irXenWwPbWJ0vYb9dA52s5XG"
Message-ID: <54bc833d-a710-3a49-4ffe-5773027f702d@gmail.com>
Date: Mon, 11 Apr 2022 23:27:08 +0300
MIME-Version: 1.0
Content-Language: en-US
To: igt-dev@lists.freedesktop.org,
 "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
References: <20220407192856.15813-1-juhapekka.heikkila@gmail.com>
 <164944685804.22680.2938285813345322904@emeril.freedesktop.org>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <164944685804.22680.2938285813345322904@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/kms=5Fflip=5Fscaled=5Fcrc=3A_Fix_error_message_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------irXenWwPbWJ0vYb9dA52s5XG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lakshmi,

here is again false positive, my change doesn't do anything for 
gem_exec_balancer test

/Juha-Pekka

On 8.4.2022 22.40, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/i915/kms_flip_scaled_crc: Fix error message (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/102363/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/index.html
>
>
>   CI Bug Log - changes from CI_DRM_11477_full -> IGTPW_6909_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_6909_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_6909_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/index.html
>
>
>     Participating hosts (11 -> 6)
>
> Missing (5): shard-skl pig-kbl-iris shard-tglu pig-glk-j5005 
> pig-skl-6260u
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_6909_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@gem_exec_balancer@parallel-out-fence:
>       o shard-kbl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl6/igt@gem_exec_balancer@parallel-out-fence.html>
>
>
>     Known issues
>
> Here are the changes found in IGTPW_6909_full that come from known issues:
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
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb6/igt@feature_discovery@display-2x.html>
>         ([i915#1839])
>  *
>
>     igt@gem_create@create-massive:
>
>      o
>
>         shard-kbl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl6/igt@gem_create@create-massive.html>
>         ([i915#4991])
>
>      o
>
>         shard-glk: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-glk8/igt@gem_create@create-massive.html>
>         ([i915#4991])
>
>      o
>
>         shard-apl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-apl4/igt@gem_create@create-massive.html>
>         ([i915#4991])
>
>  *
>
>     igt@gem_ctx_sseu@mmap-args:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb8/igt@gem_ctx_sseu@mmap-args.html>
>         ([i915#280])
>  *
>
>     igt@gem_eio@in-flight-contexts-10ms:
>
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-tglb5/igt@gem_eio@in-flight-contexts-10ms.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb8/igt@gem_eio@in-flight-contexts-10ms.html>
>         ([i915#3063]) +1 similar issue
>  *
>
>     igt@gem_exec_balancer@parallel-balancer:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb3/igt@gem_exec_balancer@parallel-balancer.html>
>         ([i915#4525])
>  *
>
>     igt@gem_exec_fair@basic-none-share@rcs0:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         ([i915#2842])
>  *
>
>     igt@gem_exec_fair@basic-none-vip@rcs0:
>
>       o shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb2/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>         ([i915#2842])
>  *
>
>     igt@gem_exec_fair@basic-none@vcs0:
>
>       o shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-apl4/igt@gem_exec_fair@basic-none@vcs0.html>
>         ([i915#2842]) +1 similar issue
>  *
>
>     igt@gem_exec_fair@basic-pace@rcs0:
>
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html>
>         ([i915#2842]) +2 similar issues
>  *
>
>     igt@gem_exec_flush@basic-wb-rw-before-default:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-snb4/igt@gem_exec_flush@basic-wb-rw-before-default.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-snb6/igt@gem_exec_flush@basic-wb-rw-before-default.html>
>         ([fdo#109271]) +1 similar issue
>  *
>
>     igt@gem_exec_whisper@basic-contexts-priority:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-glk5/igt@gem_exec_whisper@basic-contexts-priority.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-glk2/igt@gem_exec_whisper@basic-contexts-priority.html>
>         ([i915#118])
>  *
>
>     igt@gem_huc_copy@huc-copy:
>
>      o
>
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-apl4/igt@gem_huc_copy@huc-copy.html>
>         ([fdo#109271] / [i915#2190])
>
>      o
>
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-glk6/igt@gem_huc_copy@huc-copy.html>
>         ([fdo#109271] / [i915#2190])
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb1/igt@gem_huc_copy@huc-copy.html>
>         ([i915#2190])
>
>      o
>
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl7/igt@gem_huc_copy@huc-copy.html>
>         ([fdo#109271] / [i915#2190])
>
>  *
>
>     igt@gem_lmem_swapping@parallel-random-engines:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb2/igt@gem_lmem_swapping@parallel-random-engines.html>
>         ([i915#4613]) +1 similar issue
>  *
>
>     igt@gem_lmem_swapping@random-engines:
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb2/igt@gem_lmem_swapping@random-engines.html>
>         ([i915#4613])
>
>      o
>
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl1/igt@gem_lmem_swapping@random-engines.html>
>         ([fdo#109271] / [i915#4613]) +1 similar issue
>
>  *
>
>     igt@gem_pwrite@basic-exhaustion:
>
>      o
>
>         shard-snb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-snb2/igt@gem_pwrite@basic-exhaustion.html>
>         ([i915#2658])
>
>      o
>
>         shard-iclb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb6/igt@gem_pwrite@basic-exhaustion.html>
>         ([i915#2658])
>
>      o
>
>         shard-kbl: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl7/igt@gem_pwrite@basic-exhaustion.html>
>         ([i915#2658])
>
>      o
>
>         shard-apl: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-apl2/igt@gem_pwrite@basic-exhaustion.html>
>         ([i915#2658])
>
>      o
>
>         shard-tglb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb5/igt@gem_pwrite@basic-exhaustion.html>
>         ([i915#2658])
>
>      o
>
>         shard-glk: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-glk3/igt@gem_pwrite@basic-exhaustion.html>
>         ([i915#2658])
>
>  *
>
>     igt@gem_pxp@create-regular-context-2:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb3/igt@gem_pxp@create-regular-context-2.html>
>         ([i915#4270])
>  *
>
>     igt@gem_pxp@fail-invalid-protected-context:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb6/igt@gem_pxp@fail-invalid-protected-context.html>
>         ([i915#4270]) +3 similar issues
>  *
>
>     igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html>
>         ([i915#768]) +3 similar issues
>  *
>
>     igt@gem_softpin@evict-snoop-interruptible:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb8/igt@gem_softpin@evict-snoop-interruptible.html>
>         ([fdo#109312])
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb8/igt@gem_softpin@evict-snoop-interruptible.html>
>         ([fdo#109312])
>
>  *
>
>     igt@gem_userptr_blits@unsync-unmap-cycles:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb5/igt@gem_userptr_blits@unsync-unmap-cycles.html>
>         ([i915#3297])
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb8/igt@gem_userptr_blits@unsync-unmap-cycles.html>
>         ([i915#3297])
>
>  *
>
>     igt@gen9_exec_parse@bb-start-cmd:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb5/igt@gen9_exec_parse@bb-start-cmd.html>
>         ([i915#2527] / [i915#2856]) +1 similar issue
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb2/igt@gen9_exec_parse@bb-start-cmd.html>
>         ([i915#2856]) +1 similar issue
>
>  *
>
>     igt@i915_pm_lpsp@screens-disabled:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb5/igt@i915_pm_lpsp@screens-disabled.html>
>         ([i915#1902])
>  *
>
>     igt@i915_pm_rc6_residency@rc6-idle:
>
>      o
>
>         shard-tglb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb2/igt@i915_pm_rc6_residency@rc6-idle.html>
>         ([i915#2681] / [i915#2684])
>
>      o
>
>         shard-iclb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html>
>         ([i915#2684])
>
>  *
>
>     igt@i915_pm_rpm@pc8-residency:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb6/igt@i915_pm_rpm@pc8-residency.html>
>         ([fdo#109293] / [fdo#109506])
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-90:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-glk3/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html>
>         ([fdo#109271]) +84 similar issues
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html>
>         ([i915#5286]) +5 similar issues
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html>
>         ([i915#5286]) +1 similar issue
>
>  *
>
>     igt@kms_big_fb@linear-16bpp-rotate-270:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb6/igt@kms_big_fb@linear-16bpp-rotate-270.html>
>         ([fdo#111614]) +4 similar issues
>  *
>
>     igt@kms_big_fb@linear-16bpp-rotate-90:
>
>      o
>
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-apl3/igt@kms_big_fb@linear-16bpp-rotate-90.html>
>         ([fdo#109271]) +100 similar issues
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb3/igt@kms_big_fb@linear-16bpp-rotate-90.html>
>         ([fdo#110725] / [fdo#111614]) +3 similar issues
>
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-glk2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         ([fdo#109271] / [i915#3777])
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-apl2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>         ([fdo#109271] / [i915#3777]) +3 similar issues
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html>
>         ([fdo#110723])
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>      o
>
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         ([fdo#109271] / [i915#3777]) +3 similar issues
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         ([fdo#111615]) +5 similar issues
>
>  *
>
>     igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-apl8/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html>
>         ([fdo#109271] / [i915#3886]) +5 similar issues
>  *
>
>     igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb8/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html>
>         ([i915#3689] / [i915#3886]) +5 similar issues
>
>      o
>
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl6/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html>
>         ([fdo#109271] / [i915#3886]) +8 similar issues
>
>  *
>
>     igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-glk8/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html>
>         ([fdo#109271] / [i915#3886]) +4 similar issues
>  *
>
>     igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb2/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html>
>         ([fdo#109278] / [i915#3886]) +4 similar issues
>  *
>
>     igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb8/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs.html>
>         ([i915#3689]) +6 similar issues
>  *
>
>     igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb5/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html>
>         ([fdo#111615] / [i915#3689]) +9 similar issues
>  *
>
>     igt@kms_chamelium@dp-hpd-fast:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-snb5/igt@kms_chamelium@dp-hpd-fast.html>
>         ([fdo#109271] / [fdo#111827]) +4 similar issues
>  *
>
>     igt@kms_chamelium@hdmi-aspect-ratio:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-glk4/igt@kms_chamelium@hdmi-aspect-ratio.html>
>         ([fdo#109271] / [fdo#111827]) +6 similar issues
>  *
>
>     igt@kms_chamelium@vga-hpd:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb6/igt@kms_chamelium@vga-hpd.html>
>         ([fdo#109284] / [fdo#111827]) +9 similar issues
>  *
>
>     igt@kms_color_chamelium@pipe-a-ctm-0-5:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb8/igt@kms_color_chamelium@pipe-a-ctm-0-5.html>
>         ([fdo#109284] / [fdo#111827]) +5 similar issues
>  *
>
>     igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl4/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html>
>         ([fdo#109271] / [fdo#111827]) +13 similar issues
>  *
>
>     igt@kms_color_chamelium@pipe-c-ctm-0-25:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-apl2/igt@kms_color_chamelium@pipe-c-ctm-0-25.html>
>         ([fdo#109271] / [fdo#111827]) +7 similar issues
>  *
>
>     igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html>
>         ([fdo#109278] / [fdo#109284] / [fdo#111827])
>  *
>
>     igt@kms_content_protection@atomic-dpms:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb7/igt@kms_content_protection@atomic-dpms.html>
>         ([i915#1063]) +1 similar issue
>
>      o
>
>         shard-kbl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl7/igt@kms_content_protection@atomic-dpms.html>
>         ([i915#1319])
>
>  *
>
>     igt@kms_content_protection@mei_interface:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb5/igt@kms_content_protection@mei_interface.html>
>         ([fdo#109300] / [fdo#111066]) +1 similar issue
>  *
>
>     igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html>
>         ([i915#3359]) +5 similar issues
>  *
>
>     igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html>
>         ([i915#3319]) +6 similar issues
>  *
>
>     igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html>
>         ([fdo#109278] / [fdo#109279]) +2 similar issues
>  *
>
>     igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html>
>         ([fdo#109279] / [i915#3359]) +10 similar issues
>  *
>
>     igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb5/igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge.html>
>         ([fdo#109278]) +28 similar issues
>  *
>
>     igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html>
>         ([fdo#109274] / [fdo#109278]) +3 similar issues
>  *
>
>     igt@kms_dp_tiled_display@basic-test-pattern:
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb8/igt@kms_dp_tiled_display@basic-test-pattern.html>
>         ([i915#426])
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb8/igt@kms_dp_tiled_display@basic-test-pattern.html>
>         ([i915#426])
>
>  *
>
>     igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb8/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled.html>
>         ([i915#5287]) +5 similar issues
>  *
>
>     igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled.html>
>         ([i915#5287]) +2 similar issues
>  *
>
>     igt@kms_flip@2x-absolute-wf_vblank:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb8/igt@kms_flip@2x-absolute-wf_vblank.html>
>         ([fdo#109274] / [fdo#111825] / [i915#3966])
>  *
>
>     igt@kms_flip@2x-flip-vs-panning-interruptible:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb6/igt@kms_flip@2x-flip-vs-panning-interruptible.html>
>         ([fdo#109274]) +3 similar issues
>  *
>
>     igt@kms_flip@2x-nonexisting-fb-interruptible:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb6/igt@kms_flip@2x-nonexisting-fb-interruptible.html>
>         ([fdo#109274] / [fdo#111825]) +9 similar issues
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html>
>         ([i915#2587])
>  *
>
>     igt@kms_force_connector_basic@force-load-detect:
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb5/igt@kms_force_connector_basic@force-load-detect.html>
>         ([fdo#109285])
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb8/igt@kms_force_connector_basic@force-load-detect.html>
>         ([fdo#109285])
>
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html>
>         ([fdo#109280] / [fdo#111825]) +29 similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-4:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html>
>         ([i915#5439])
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu.html>
>         ([fdo#109280]) +15 similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html>
>         ([fdo#109271]) +219 similar issues
>  *
>
>     igt@kms_hdmi_inject@inject-audio:
>
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html>
>         ([i915#433])
>  *
>
>     igt@kms_hdr@static-toggle-suspend:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb7/igt@kms_hdr@static-toggle-suspend.html>
>         ([i915#3555])
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb1/igt@kms_hdr@static-toggle-suspend.html>
>         ([i915#3555])
>
>  *
>
>     igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb2/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html>
>         ([fdo#109289]) +2 similar issues
>  *
>
>     igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
>
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html>
>         ([fdo#108145] / [i915#265]) +1 similar issue
>  *
>
>     igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
>
>      o
>
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-glk8/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html>
>         ([fdo#108145] / [i915#265])
>
>      o
>
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html>
>         ([fdo#108145] / [i915#265])
>
>  *
>
>     igt@kms_plane_lowres@pipe-a-tiling-x:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb6/igt@kms_plane_lowres@pipe-a-tiling-x.html>
>         ([i915#3536]) +1 similar issue
>  *
>
>     igt@kms_plane_lowres@pipe-a-tiling-y:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb5/igt@kms_plane_lowres@pipe-a-tiling-y.html>
>         ([i915#3536])
>  *
>
>     igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-edp-1-downscale-with-rotation:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb2/igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-edp-1-downscale-with-rotation.html>
>         ([i915#5176]) +5 similar issues
>  *
>
>     igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb7/igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation.html>
>         ([i915#5176]) +11 similar issues
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb3/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale.html>
>         ([i915#5235]) +3 similar issues
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-edp-1-planes-upscale-downscale:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-iclb1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-edp-1-planes-upscale-downscale.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-edp-1-planes-upscale-downscale.html>
>         ([i915#5235]) +2 similar issues
>  *
>
>     igt@kms_prime@basic-crc@first-to-second:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb5/igt@kms_prime@basic-crc@first-to-second.html>
>         ([i915#1836])
>  *
>
>     igt@kms_psr@psr2_primary_page_flip:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.html>
>         ([fdo#109441]) +1 similar issue
>  *
>
>     igt@kms_psr@psr2_sprite_mmap_cpu:
>
>      o
>
>         shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb8/igt@kms_psr@psr2_sprite_mmap_cpu.html>
>         ([i915#132] / [i915#3467]) +1 similar issue
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_cpu.html>
>         ([fdo#109441]) +1 similar issue
>
>  *
>
>     igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb2/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a.html>
>         ([i915#5030]) +3 similar issues
>  *
>
>     igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb3/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c.html>
>         ([i915#5030]) +2 similar issues
>  *
>
>     igt@kms_tv_load_detect@load-detect:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb2/igt@kms_tv_load_detect@load-detect.html>
>         ([fdo#109309])
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb5/igt@kms_tv_load_detect@load-detect.html>
>         ([fdo#109309])
>
>  *
>
>     igt@kms_vblank@pipe-a-ts-continuation-suspend:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-apl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html>
>         ([i915#180]) +5 similar issues
>  *
>
>     igt@kms_vblank@pipe-c-ts-continuation-suspend:
>
>       o shard-apl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-apl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html>
>         ([i915#180])
>  *
>
>     igt@kms_vblank@pipe-d-query-forked-hang:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-snb4/igt@kms_vblank@pipe-d-query-forked-hang.html>
>         ([fdo#109271]) +105 similar issues
>  *
>
>     igt@kms_vblank@pipe-d-wait-idle:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl3/igt@kms_vblank@pipe-d-wait-idle.html>
>         ([fdo#109271] / [i915#533])
>  *
>
>     igt@kms_vrr@flip-basic:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb1/igt@kms_vrr@flip-basic.html>
>         ([fdo#109502])
>  *
>
>     igt@kms_writeback@writeback-pixel-formats:
>
>      o
>
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl7/igt@kms_writeback@writeback-pixel-formats.html>
>         ([fdo#109271] / [i915#2437])
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb7/igt@kms_writeback@writeback-pixel-formats.html>
>         ([i915#2437])
>
>  *
>
>     igt@nouveau_crc@pipe-a-source-rg:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb4/igt@nouveau_crc@p>
>         ([i915#2530])
>

--------------irXenWwPbWJ0vYb9dA52s5XG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi Lakshmi,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">here is again false positive, my change
      doesn't do anything for gem_exec_balancer test</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">/Juha-Pekka<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 8.4.2022 22.40, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:164944685804.22680.2938285813345322904@emeril.freedesktop.org">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/i915/kms_flip_scaled_crc: Fix error message (rev2)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/102363/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/102363/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
                href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_11477_full -&gt;
        IGTPW_6909_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_6909_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_6909_full, please notify your bug team to
        allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/index.html</a></p>
      <h2>Participating hosts (11 -&gt; 6)</h2>
      <p>Missing (5): shard-skl pig-kbl-iris shard-tglu pig-glk-j5005
        pig-skl-6260u </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_6909_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@gem_exec_balancer@parallel-out-fence:
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl6/igt@gem_exec_balancer@parallel-out-fence.html"
                moz-do-not-send="true">DMESG-WARN</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_6909_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@feature_discovery@display-2x:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb6/igt@feature_discovery@display-2x.html"
                moz-do-not-send="true">SKIP</a> ([i915#1839])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@create-massive:</p>
          <ul>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl6/igt@gem_create@create-massive.html"
                  moz-do-not-send="true">DMESG-WARN</a> ([i915#4991])</p>
            </li>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-glk8/igt@gem_create@create-massive.html"
                  moz-do-not-send="true">DMESG-WARN</a> ([i915#4991])</p>
            </li>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-apl4/igt@gem_create@create-massive.html"
                  moz-do-not-send="true">DMESG-WARN</a> ([i915#4991])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_sseu@mmap-args:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb8/igt@gem_ctx_sseu@mmap-args.html"
                moz-do-not-send="true">SKIP</a> ([i915#280])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@in-flight-contexts-10ms:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-tglb5/igt@gem_eio@in-flight-contexts-10ms.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb8/igt@gem_eio@in-flight-contexts-10ms.html"
                moz-do-not-send="true">TIMEOUT</a> ([i915#3063]) +1
              similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-balancer:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb3/igt@gem_exec_balancer@parallel-balancer.html"
                moz-do-not-send="true">SKIP</a> ([i915#4525])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html"
                moz-do-not-send="true">FAIL</a> ([i915#2842])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb2/igt@gem_exec_fair@basic-none-vip@rcs0.html"
                moz-do-not-send="true">FAIL</a> ([i915#2842])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none@vcs0:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-apl4/igt@gem_exec_fair@basic-none@vcs0.html"
                moz-do-not-send="true">FAIL</a> ([i915#2842]) +1 similar
              issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace@rcs0:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html"
                moz-do-not-send="true">FAIL</a> ([i915#2842]) +2 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-wb-rw-before-default:</p>
          <ul>
            <li>shard-snb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-snb4/igt@gem_exec_flush@basic-wb-rw-before-default.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-snb6/igt@gem_exec_flush@basic-wb-rw-before-default.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271]) +1
              similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_whisper@basic-contexts-priority:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-glk5/igt@gem_exec_whisper@basic-contexts-priority.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-glk2/igt@gem_exec_whisper@basic-contexts-priority.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#118])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_huc_copy@huc-copy:</p>
          <ul>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-apl4/igt@gem_huc_copy@huc-copy.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109271] /
                [i915#2190])</p>
            </li>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-glk6/igt@gem_huc_copy@huc-copy.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109271] /
                [i915#2190])</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb1/igt@gem_huc_copy@huc-copy.html"
                  moz-do-not-send="true">SKIP</a> ([i915#2190])</p>
            </li>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl7/igt@gem_huc_copy@huc-copy.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109271] /
                [i915#2190])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random-engines:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb2/igt@gem_lmem_swapping@parallel-random-engines.html"
                moz-do-not-send="true">SKIP</a> ([i915#4613]) +1 similar
              issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@random-engines:</p>
          <ul>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb2/igt@gem_lmem_swapping@random-engines.html"
                  moz-do-not-send="true">SKIP</a> ([i915#4613])</p>
            </li>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl1/igt@gem_lmem_swapping@random-engines.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109271] /
                [i915#4613]) +1 similar issue</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pwrite@basic-exhaustion:</p>
          <ul>
            <li>
              <p>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-snb2/igt@gem_pwrite@basic-exhaustion.html"
                  moz-do-not-send="true">WARN</a> ([i915#2658])</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb6/igt@gem_pwrite@basic-exhaustion.html"
                  moz-do-not-send="true">WARN</a> ([i915#2658])</p>
            </li>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl7/igt@gem_pwrite@basic-exhaustion.html"
                  moz-do-not-send="true">WARN</a> ([i915#2658])</p>
            </li>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-apl2/igt@gem_pwrite@basic-exhaustion.html"
                  moz-do-not-send="true">WARN</a> ([i915#2658])</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb5/igt@gem_pwrite@basic-exhaustion.html"
                  moz-do-not-send="true">WARN</a> ([i915#2658])</p>
            </li>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-glk3/igt@gem_pwrite@basic-exhaustion.html"
                  moz-do-not-send="true">WARN</a> ([i915#2658])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@create-regular-context-2:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb3/igt@gem_pxp@create-regular-context-2.html"
                moz-do-not-send="true">SKIP</a> ([i915#4270])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@fail-invalid-protected-context:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb6/igt@gem_pxp@fail-invalid-protected-context.html"
                moz-do-not-send="true">SKIP</a> ([i915#4270]) +3 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html"
                moz-do-not-send="true">SKIP</a> ([i915#768]) +3 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_softpin@evict-snoop-interruptible:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb8/igt@gem_softpin@evict-snoop-interruptible.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109312])</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb8/igt@gem_softpin@evict-snoop-interruptible.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109312])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb5/igt@gem_userptr_blits@unsync-unmap-cycles.html"
                  moz-do-not-send="true">SKIP</a> ([i915#3297])</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb8/igt@gem_userptr_blits@unsync-unmap-cycles.html"
                  moz-do-not-send="true">SKIP</a> ([i915#3297])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-start-cmd:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb5/igt@gen9_exec_parse@bb-start-cmd.html"
                  moz-do-not-send="true">SKIP</a> ([i915#2527] /
                [i915#2856]) +1 similar issue</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb2/igt@gen9_exec_parse@bb-start-cmd.html"
                  moz-do-not-send="true">SKIP</a> ([i915#2856]) +1
                similar issue</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_lpsp@screens-disabled:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb5/igt@i915_pm_lpsp@screens-disabled.html"
                moz-do-not-send="true">SKIP</a> ([i915#1902])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-idle:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb2/igt@i915_pm_rc6_residency@rc6-idle.html"
                  moz-do-not-send="true">WARN</a> ([i915#2681] /
                [i915#2684])</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html"
                  moz-do-not-send="true">WARN</a> ([i915#2684])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@pc8-residency:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb6/igt@i915_pm_rpm@pc8-residency.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109293] /
              [fdo#109506])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-glk3/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271]) +84
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html"
                  moz-do-not-send="true">SKIP</a> ([i915#5286]) +5
                similar issues</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html"
                  moz-do-not-send="true">SKIP</a> ([i915#5286]) +1
                similar issue</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb6/igt@kms_big_fb@linear-16bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> ([fdo#111614]) +4
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
          <ul>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-apl3/igt@kms_big_fb@linear-16bpp-rotate-90.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109271]) +100
                similar issues</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb3/igt@kms_big_fb@linear-16bpp-rotate-90.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#110725] /
                [fdo#111614]) +3 similar issues</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-glk2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#3777])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-apl2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#3777]) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> ([fdo#110723])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109271] /
                [i915#3777]) +3 similar issues</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#111615]) +5
                similar issues</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-apl8/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#3886]) +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb8/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html"
                  moz-do-not-send="true">SKIP</a> ([i915#3689] /
                [i915#3886]) +5 similar issues</p>
            </li>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl6/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109271] /
                [i915#3886]) +8 similar issues</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-glk8/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#3886]) +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb2/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109278] /
              [i915#3886]) +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb8/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs.html"
                moz-do-not-send="true">SKIP</a> ([i915#3689]) +6 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb5/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html"
                moz-do-not-send="true">SKIP</a> ([fdo#111615] /
              [i915#3689]) +9 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium@dp-hpd-fast:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-snb5/igt@kms_chamelium@dp-hpd-fast.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [fdo#111827]) +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium@hdmi-aspect-ratio:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-glk4/igt@kms_chamelium@hdmi-aspect-ratio.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [fdo#111827]) +6 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium@vga-hpd:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb6/igt@kms_chamelium@vga-hpd.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109284] /
              [fdo#111827]) +9 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_chamelium@pipe-a-ctm-0-5:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb8/igt@kms_color_chamelium@pipe-a-ctm-0-5.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109284] /
              [fdo#111827]) +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl4/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [fdo#111827]) +13 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_chamelium@pipe-c-ctm-0-25:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-apl2/igt@kms_color_chamelium@pipe-c-ctm-0-25.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [fdo#111827]) +7 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_chamelium@pipe-d-ctm-green-to-red:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109278] /
              [fdo#109284] / [fdo#111827])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb7/igt@kms_content_protection@atomic-dpms.html"
                  moz-do-not-send="true">SKIP</a> ([i915#1063]) +1
                similar issue</p>
            </li>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl7/igt@kms_content_protection@atomic-dpms.html"
                  moz-do-not-send="true">TIMEOUT</a> ([i915#1319])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@mei_interface:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb5/igt@kms_content_protection@mei_interface.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109300] /
              [fdo#111066]) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html"
                moz-do-not-send="true">SKIP</a> ([i915#3359]) +5 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html"
                moz-do-not-send="true">SKIP</a> ([i915#3319]) +6 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109278] /
              [fdo#109279]) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109279] /
              [i915#3359]) +10 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb5/igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109278]) +28
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109274] /
              [fdo#109278]) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb8/igt@kms_dp_tiled_display@basic-test-pattern.html"
                  moz-do-not-send="true">SKIP</a> ([i915#426])</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb8/igt@kms_dp_tiled_display@basic-test-pattern.html"
                  moz-do-not-send="true">SKIP</a> ([i915#426])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb8/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled.html"
                moz-do-not-send="true">SKIP</a> ([i915#5287]) +5 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled.html"
                moz-do-not-send="true">SKIP</a> ([i915#5287]) +2 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-absolute-wf_vblank:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb8/igt@kms_flip@2x-absolute-wf_vblank.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109274] /
              [fdo#111825] / [i915#3966])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb6/igt@kms_flip@2x-flip-vs-panning-interruptible.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109274]) +3
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb6/igt@kms_flip@2x-nonexisting-fb-interruptible.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109274] /
              [fdo#111825]) +9 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html"
                moz-do-not-send="true">SKIP</a> ([i915#2587])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-load-detect:</p>
          <ul>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb5/igt@kms_force_connector_basic@force-load-detect.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109285])</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb8/igt@kms_force_connector_basic@force-load-detect.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109285])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109280] /
              [fdo#111825]) +29 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html"
                moz-do-not-send="true">SKIP</a> ([i915#5439])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109280]) +15
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271]) +219
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdmi_inject@inject-audio:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html"
                moz-do-not-send="true">SKIP</a> ([i915#433])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-suspend:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb7/igt@kms_hdr@static-toggle-suspend.html"
                  moz-do-not-send="true">SKIP</a> ([i915#3555])</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb1/igt@kms_hdr@static-toggle-suspend.html"
                  moz-do-not-send="true">SKIP</a> ([i915#3555])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb2/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109289]) +2
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html"
                moz-do-not-send="true">FAIL</a> ([fdo#108145] /
              [i915#265]) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
          <ul>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-glk8/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html"
                  moz-do-not-send="true">FAIL</a> ([fdo#108145] /
                [i915#265])</p>
            </li>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html"
                  moz-do-not-send="true">FAIL</a> ([fdo#108145] /
                [i915#265])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@pipe-a-tiling-x:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb6/igt@kms_plane_lowres@pipe-a-tiling-x.html"
                moz-do-not-send="true">SKIP</a> ([i915#3536]) +1 similar
              issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@pipe-a-tiling-y:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb5/igt@kms_plane_lowres@pipe-a-tiling-y.html"
                moz-do-not-send="true">SKIP</a> ([i915#3536])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-edp-1-downscale-with-rotation:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb2/igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-edp-1-downscale-with-rotation.html"
                moz-do-not-send="true">SKIP</a> ([i915#5176]) +5 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb7/igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation.html"
                moz-do-not-send="true">SKIP</a> ([i915#5176]) +11
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb3/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale.html"
                moz-do-not-send="true">SKIP</a> ([i915#5235]) +3 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-edp-1-planes-upscale-downscale:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-iclb1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-edp-1-planes-upscale-downscale.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-edp-1-planes-upscale-downscale.html"
                moz-do-not-send="true">SKIP</a> ([i915#5235]) +2 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_prime@basic-crc@first-to-second:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb5/igt@kms_prime@basic-crc@first-to-second.html"
                moz-do-not-send="true">SKIP</a> ([i915#1836])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_primary_page_flip:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109441]) +1
              similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb8/igt@kms_psr@psr2_sprite_mmap_cpu.html"
                  moz-do-not-send="true">FAIL</a> ([i915#132] /
                [i915#3467]) +1 similar issue</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_cpu.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109441]) +1
                similar issue</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb2/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a.html"
                moz-do-not-send="true">SKIP</a> ([i915#5030]) +3 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb3/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c.html"
                moz-do-not-send="true">SKIP</a> ([i915#5030]) +2 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tv_load_detect@load-detect:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb2/igt@kms_tv_load_detect@load-detect.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109309])</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb5/igt@kms_tv_load_detect@load-detect.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109309])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11477/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-apl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#180]) +5
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-apl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#180])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@pipe-d-query-forked-hang:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-snb4/igt@kms_vblank@pipe-d-query-forked-hang.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271]) +105
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@pipe-d-wait-idle:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl3/igt@kms_vblank@pipe-d-wait-idle.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#533])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb1/igt@kms_vrr@flip-basic.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109502])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-pixel-formats:</p>
          <ul>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-kbl7/igt@kms_writeback@writeback-pixel-formats.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109271] /
                [i915#2437])</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-tglb7/igt@kms_writeback@writeback-pixel-formats.html"
                  moz-do-not-send="true">SKIP</a> ([i915#2437])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@nouveau_crc@pipe-a-source-rg:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6909/shard-iclb4/igt@nouveau_crc@p"
                moz-do-not-send="true">SKIP</a> ([i915#2530])</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------irXenWwPbWJ0vYb9dA52s5XG--
