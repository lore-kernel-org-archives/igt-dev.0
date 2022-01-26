Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A379010E717
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jan 2022 09:16:45 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id u15so24559846wrt.3
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jan 2022 01:16:45 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------kE0WSV05IIIYGg8HUzGT3EJh"
Message-ID: <472e042e-02f1-354a-e91b-178c85904969@gmail.com>
Date: Wed, 26 Jan 2022 11:16:36 +0200
MIME-Version: 1.0
Content-Language: en-US
References: <20220125195849.18883-1-juhapekka.heikkila@gmail.com>
 <164315774810.25402.11519994034267484876@emeril.freedesktop.org>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <164315774810.25402.11519994034267484876@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Frender=5Fcopy=5Fredux=3A_reduce_looping_if_on_simula?=
 =?utf-8?q?tion_=28rev3=29?=
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
To: igt-dev@lists.freedesktop.org, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------kE0WSV05IIIYGg8HUzGT3EJh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lakshmi,

below are again false positives, I was only patching 
gem_render_copy_redux and my changes cannot affect those regressed tests.

/Juha-Pekka

On 26.1.2022 2.42, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/i915/gem_render_copy_redux: reduce looping if on 
> simulation (rev3)
> *URL:* 	https://patchwork.freedesktop.org/series/99322/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/index.html
>
>
>   CI Bug Log - changes from CI_DRM_11134_full -> IGTPW_6577_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_6577_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_6577_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/index.html
>
>
>     Participating hosts (10 -> 7)
>
> Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_6577_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@gem_workarounds@basic-read:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-snb4/igt@gem_workarounds@basic-read.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-snb6/igt@gem_workarounds@basic-read.html>
>  *
>
>     igt@i915_selftest@live@gem_contexts:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-iclb2/igt@i915_selftest@live@gem_contexts.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb7/igt@i915_selftest@live@gem_contexts.html>
>
>
>     Known issues
>
> Here are the changes found in IGTPW_6577_full that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@device_reset@unbind-reset-rebind:
>
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-tglb8/igt@device_reset@unbind-reset-rebind.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb1/igt@device_reset@unbind-reset-rebind.html>
>         ([i915#750])
>  *
>
>     igt@gem_exec_balancer@parallel-contexts:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb8/igt@gem_exec_balancer@parallel-contexts.html>
>         ([i915#4525])
>  *
>
>     igt@gem_exec_fair@basic-deadline:
>
>       o shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl7/igt@gem_exec_fair@basic-deadline.html>
>         ([i915#2846])
>  *
>
>     igt@gem_exec_fair@basic-none-share@rcs0:
>
>      o
>
>         shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         ([i915#2842])
>
>      o
>
>         shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         ([i915#2842])
>
>  *
>
>     igt@gem_exec_fair@basic-none@rcs0:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk2/igt@gem_exec_fair@basic-none@rcs0.html>
>         ([i915#2842]) +3 similar issues
>  *
>
>     igt@gem_exec_fair@basic-none@vcs1:
>
>       o shard-iclb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html>
>         ([i915#2842])
>  *
>
>     igt@gem_exec_fair@basic-none@vecs0:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-apl1/igt@gem_exec_fair@basic-none@vecs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl2/igt@gem_exec_fair@basic-none@vecs0.html>
>         ([i915#2842]) +1 similar issue
>  *
>
>     igt@gem_exec_fair@basic-throttle@rcs0:
>
>      o
>
>         shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-kbl3/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-kbl7/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         ([i915#2842])
>
>      o
>
>         shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         ([i915#2849])
>
>  *
>
>     igt@gem_exec_params@no-vebox:
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb8/igt@gem_exec_params@no-vebox.html>
>         ([fdo#109283])
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb8/igt@gem_exec_params@no-vebox.html>
>         ([fdo#109283] / [i915#4877])
>
>  *
>
>     igt@gem_exec_whisper@basic-queues-forked:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-iclb6/igt@gem_exec_whisper@basic-queues-forked.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb7/igt@gem_exec_whisper@basic-queues-forked.html>
>         ([i915#1895])
>  *
>
>     igt@gem_huc_copy@huc-copy:
>
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-tglb2/igt@gem_huc_copy@huc-copy.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb6/igt@gem_huc_copy@huc-copy.html>
>         ([i915#2190])
>  *
>
>     igt@gem_lmem_swapping@parallel-random-engines:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl3/igt@gem_lmem_swapping@parallel-random-engines.html>
>         ([fdo#109271] / [i915#4613]) +2 similar issues
>  *
>
>     igt@gem_pxp@reject-modify-context-protection-off-3:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb1/igt@gem_pxp@reject-modify-context-protection-off-3.html>
>         ([i915#4270]) +1 similar issue
>  *
>
>     igt@gem_pxp@verify-pxp-stale-ctx-execution:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb5/igt@gem_pxp@verify-pxp-stale-ctx-execution.html>
>         ([i915#4270]) +1 similar issue
>  *
>
>     igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb5/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html>
>         ([i915#768])
>  *
>
>     igt@gem_softpin@allocator-evict-all-engines:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-glk4/igt@gem_softpin@allocator-evict-all-engines.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk3/igt@gem_softpin@allocator-evict-all-engines.html>
>         ([i915#118])
>  *
>
>     igt@gem_userptr_blits@coherency-sync:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb7/igt@gem_userptr_blits@coherency-sync.html>
>         ([fdo#110542])
>  *
>
>     igt@gem_userptr_blits@readonly-unsync:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb2/igt@gem_userptr_blits@readonly-unsync.html>
>         ([i915#3297])
>  *
>
>     igt@gem_workarounds@suspend-resume-context:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-apl4/igt@gem_workarounds@suspend-resume-context.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl6/igt@gem_workarounds@suspend-resume-context.html>
>         ([i915#180]) +2 similar issues
>  *
>
>     igt@gen9_exec_parse@allowed-single:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb3/igt@gen9_exec_parse@allowed-single.html>
>         ([i915#2527] / [i915#2856]) +1 similar issue
>  *
>
>     igt@gen9_exec_parse@secure-batches:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb5/igt@gen9_exec_parse@secure-batches.html>
>         ([i915#2856]) +1 similar issue
>  *
>
>     igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-kbl7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         ([fdo#109271]) +71 similar issues
>  *
>
>     igt@i915_pm_rpm@modeset-pc8-residency-stress:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html>
>         ([fdo#109271]) +177 similar issues
>  *
>
>     igt@i915_suspend@fence-restore-tiled2untiled:
>
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-kbl3/igt@i915_suspend@fence-restore-tiled2untiled.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-kbl7/igt@i915_suspend@fence-restore-tiled2untiled.html>
>         ([i915#180])
>  *
>
>     igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html>
>         ([fdo#111614]) +1 similar issue
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html>
>         ([fdo#110725] / [fdo#111614])
>
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-tglb5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         ([i915#3743])
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         ([fdo#109271] / [i915#3777])
>  *
>
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html>
>         ([fdo#111615]) +1 similar issue
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html>
>         ([fdo#110723]) +1 similar issue
>
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         ([fdo#109271] / [i915#3777]) +2 similar issues
>  *
>
>     igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb3/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html>
>         ([i915#3689] / [i915#3886])
>  *
>
>     igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-kbl6/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html>
>         ([fdo#109271] / [i915#3886]) +2 similar issues
>  *
>
>     igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb6/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs.html>
>         ([fdo#109278]) +9 similar issues
>  *
>
>     igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb6/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs.html>
>         ([fdo#111615] / [i915#3689]) +2 similar issues
>  *
>
>     igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl6/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html>
>         ([fdo#109271] / [i915#3886]) +7 similar issues
>  *
>
>     igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb8/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html>
>         ([fdo#109278] / [i915#3886])
>
>      o
>
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk6/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html>
>         ([fdo#109271] / [i915#3886])
>
>  *
>
>     igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb2/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs.html>
>         ([i915#3689]) +2 similar issues
>  *
>
>     igt@kms_chamelium@vga-edid-read:
>
>      o
>
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl6/igt@kms_chamelium@vga-edid-read.html>
>         ([fdo#109271] / [fdo#111827]) +13 similar issues
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb4/igt@kms_chamelium@vga-edid-read.html>
>         ([fdo#109284] / [fdo#111827]) +3 similar issues
>
>      o
>
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk7/igt@kms_chamelium@vga-edid-read.html>
>         ([fdo#109271] / [fdo#111827]) +4 similar issues
>
>  *
>
>     igt@kms_color@pipe-d-gamma:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb8/igt@kms_color@pipe-d-gamma.html>
>         ([fdo#109278] / [i915#1149])
>  *
>
>     igt@kms_color_chamelium@pipe-a-degamma:
>
>      o
>
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-kbl1/igt@kms_color_chamelium@pipe-a-degamma.html>
>         ([fdo#109271] / [fdo#111827]) +6 similar issues
>
>      o
>
>         shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-snb4/igt@kms_color_chamelium@pipe-a-degamma.html>
>         ([fdo#109271] / [fdo#111827]) +4 similar issues
>
>  *
>
>     igt@kms_color_chamelium@pipe-b-ctm-0-5:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-0-5.html>
>         ([fdo#109284] / [fdo#111827]) +6 similar issues
>  *
>
>     igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html>
>         ([fdo#109278] / [fdo#109284] / [fdo#111827])
>  *
>
>     igt@kms_content_protection@lic:
>
>       o shard-apl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl1/igt@kms_content_protection@lic.html>
>         ([i915#1319])
>  *
>
>     igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html>
>         ([fdo#109278] / [fdo#109279]) +2 similar issues
>  *
>
>     igt@kms_cursor_crc@pipe-c-cursor-max-size-sliding:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-max-size-sliding.html>
>         ([i915#3359]) +2 similar issues
>  *
>
>     igt@kms_cursor_crc@pipe-c-cursor-suspend:
>
>       o shard-apl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html>
>         ([i915#180])
>  *
>
>     igt@kms_cursor_crc@pipe-d-cursor-32x32-random:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-32x32-random.html>
>         ([i915#3319]) +1 similar issue
>  *
>
>     igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html>
>         ([fdo#109279] / [i915#3359]) +3 similar issues
>  *
>
>     igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb3/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html>
>         ([fdo#109274] / [fdo#109278]) +2 similar issues
>  *
>
>     igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb3/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html>
>         ([i915#3528])
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb1/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html>
>         ([i915#3528])
>
>  *
>
>     igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html>
>         ([i915#118] / [i915#1888])
>  *
>
>     igt@kms_fbcon_fbt@fbc-suspend:
>
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html>
>         ([i915#180] / [i915#636])
>  *
>
>     igt@kms_flip@2x-flip-vs-fences:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb8/igt@kms_flip@2x-flip-vs-fences.html>
>         ([fdo#109274] / [fdo#111825]) +4 similar issues
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb4/igt@kms_flip@2x-flip-vs-fences.html>
>         ([fdo#109274]) +1 similar issue
>
>  *
>
>     igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-glk6/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk2/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html>
>         ([i915#2122])
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-apl3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html>
>         ([i915#79])
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html>
>         ([i915#79])
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-glk9/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html>
>         ([i915#4911])
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html>
>         ([i915#3701]) +1 similar issue
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html>
>         ([fdo#109280]) +11 similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu.html>
>         ([fdo#109280] / [fdo#111825]) +14 similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-snb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html>
>         ([fdo#109271]) +96 similar issues
>  *
>
>     igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
>
>      o
>
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html>
>         ([fdo#108145] / [i915#265]) +1 similar issue
>
>      o
>
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html>
>         ([fdo#108145] / [i915#265]) +2 similar issues
>
>  *
>
>     igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk6/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html>
>         ([fdo#108145] / [i915#265])
>  *
>
>     igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html>
>         ([fdo#109271] / [i915#658]) +1 similar issue
>  *
>
>     igt@kms_psr@psr2_cursor_mmap_cpu:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html>
>         ([fdo#109441]) +1 similar issue
>  *
>
>     igt@kms_psr@psr2_primary_mmap_cpu:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html>
>         ([fdo#109441]) +2 similar issues
>  *
>
>     igt@kms_psr@psr2_sprite_render:
>
>       o shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb6/igt@kms_psr@psr2_sprite_render.html>
>         ([i915#132] / [i915#3467]) +2 similar issues
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html>
>         ([fdo#109271]) +49 similar issues
>  *
>
>     igt@kms_vblank@pipe-d-wait-idle:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl2/igt@kms_vblank@pipe-d-wait-idle.html>
>         ([fdo#109271] / [i915#533]) +2 similar issues
>  *
>
>     igt@kms_vrr@flip-basic:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb7/igt@kms_vrr@flip-basic.html>
>         ([fdo#109502])
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb1/igt@kms_vrr@flip-basic.html>
>         ([fdo#109502])
>
>  *
>
>     igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb7/igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame.html>
>         ([i915#2530])
>  *
>
>     igt@prime_nv_test@nv_i915_sharing:
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb2/igt@prime_nv_test@nv_i915_sharing.html>
>         ([fdo#109291])
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb1/igt@prime_nv_test@nv_i915_sharing.html>
>         ([fdo#109291])
>
>  *
>
>     igt@sysfs_clients@busy:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl7/igt@sysfs_clients@busy.html>
>         ([fdo#109271] / [i915#2994])
>  *
>
>     igt@sysfs_clients@recycle:
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb6/igt@sysfs_clients@recycle.html>
>         ([i915#2994])
>
>      o
>
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-kbl3/igt@sysfs_clients@recycle.html>
>         ([fdo#109271] / [i915#2994])
>
>      o
>
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk9/igt@sysfs_clients@recycle.html>
>         ([fdo#109271] / [i915#2994])
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb3/igt@sysfs_clients@recycle.html>
>         ([i915#2994])
>
>  *
>
>     igt@tools_test@sysfs_l3_parity:
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb5/igt@tools_test@sysfs_l3_parity.html>
>         ([fdo#109307])
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb6/igt@tools_test@sysfs_l3_parity.html>
>         ([fdo#109307])
>
>
>         Possible fixes
>
>  *
>
>     igt@gem_exec_balancer@parallel-bb-first:
>
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-iclb5/igt@gem_exec_balancer@parallel-bb-first.html>
>         ([i915#4525]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html>
>  *
>
>     igt@gem_exec_big@single:
>
>       o shard-tglb: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-tglb1/igt@gem_exec_big@single.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb3/igt@gem_exec_big@single.html>
>  *
>
>     igt@gem_exec_fair@basic-none@vcs0:
>
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html>
>         ([i915#2842]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html>
>         +2 similar issues
>  *
>
>     igt@gem_exec_fair@basic-pace-solo@rcs0:
>
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-tglb6/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>         ([i915#2842]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb7/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>  *
>
>     igt@gem_exec_fair@basic-pace@rcs0:
>
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-glk1/igt@gem_exec_fair@basic-pace@rcs0.html>
>         ([i915#2842]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk8/igt@gem_exec_fair@basic-pace@rcs0.html>
>  *
>
>     igt@i915_pm_rc6_residency@rc6-fence:
>
>      o
>
>         shard-tglb: WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-tglb7/igt@i915_pm_rc6_residency@rc6-fence.html>
>         ([i915#2681] / [i915#2684]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb3/igt@i915_pm_rc6_residency@rc6-fence.html>
>
>      o
>
>         shard-iclb: WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html>
>         ([i915#1804] / [i915#2684]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html>
>
>  *
>
>     igt@kms_big_fb@linear-32bpp-rotate-180:
>
>       o shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-glk1/igt@kms_big_fb@linear-32bpp-rotate-180.html>
>         ([i915#118]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk7/igt@kms_big_fb@linear-32bpp-rotate-180.html>
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-tglb1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         ([i915#3743]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>  *
>
>     igt@kms_color@pipe-c-ctm-negative:
>
>       o shard-tglb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-tglb1/igt@kms_color@pipe-c-ctm-negative.html>
>         ([i915#1149] / [i915#1982]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb1/igt@kms_color@pipe-c-ctm-negative.html>
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>         ([i915#2346]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW>
>

--------------kE0WSV05IIIYGg8HUzGT3EJh
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
    <div class="moz-cite-prefix">below are again false positives, I was
      only patching gem_render_copy_redux and my changes cannot affect
      those regressed tests.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">/Juha-Pekka<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 26.1.2022 2.42, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:164315774810.25402.11519994034267484876@emeril.freedesktop.org">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/i915/gem_render_copy_redux: reduce looping if on
              simulation (rev3)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/99322/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/99322/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
                href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_11134_full -&gt;
        IGTPW_6577_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_6577_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_6577_full, please notify your bug team to
        allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/index.html</a></p>
      <h2>Participating hosts (10 -&gt; 7)</h2>
      <p>Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_6577_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@gem_workarounds@basic-read:</p>
          <ul>
            <li>shard-snb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-snb4/igt@gem_workarounds@basic-read.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-snb6/igt@gem_workarounds@basic-read.html"
                moz-do-not-send="true">TIMEOUT</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@gem_contexts:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-iclb2/igt@i915_selftest@live@gem_contexts.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb7/igt@i915_selftest@live@gem_contexts.html"
                moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_6577_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@device_reset@unbind-reset-rebind:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-tglb8/igt@device_reset@unbind-reset-rebind.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb1/igt@device_reset@unbind-reset-rebind.html"
                moz-do-not-send="true">INCOMPLETE</a> ([i915#750])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-contexts:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb8/igt@gem_exec_balancer@parallel-contexts.html"
                moz-do-not-send="true">SKIP</a> ([i915#4525])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-deadline:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl7/igt@gem_exec_fair@basic-deadline.html"
                moz-do-not-send="true">FAIL</a> ([i915#2846])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
          <ul>
            <li>
              <p>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html"
                  moz-do-not-send="true">FAIL</a> ([i915#2842])</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html"
                  moz-do-not-send="true">FAIL</a> ([i915#2842])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none@rcs0:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk2/igt@gem_exec_fair@basic-none@rcs0.html"
                moz-do-not-send="true">FAIL</a> ([i915#2842]) +3 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none@vcs1:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html"
                moz-do-not-send="true">FAIL</a> ([i915#2842])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none@vecs0:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-apl1/igt@gem_exec_fair@basic-none@vecs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl2/igt@gem_exec_fair@basic-none@vecs0.html"
                moz-do-not-send="true">FAIL</a> ([i915#2842]) +1 similar
              issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
          <ul>
            <li>
              <p>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-kbl3/igt@gem_exec_fair@basic-throttle@rcs0.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-kbl7/igt@gem_exec_fair@basic-throttle@rcs0.html"
                  moz-do-not-send="true">FAIL</a> ([i915#2842])</p>
            </li>
            <li>
              <p>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html"
                  moz-do-not-send="true">FAIL</a> ([i915#2849])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_params@no-vebox:</p>
          <ul>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb8/igt@gem_exec_params@no-vebox.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109283])</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb8/igt@gem_exec_params@no-vebox.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109283] /
                [i915#4877])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_whisper@basic-queues-forked:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-iclb6/igt@gem_exec_whisper@basic-queues-forked.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb7/igt@gem_exec_whisper@basic-queues-forked.html"
                moz-do-not-send="true">INCOMPLETE</a> ([i915#1895])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_huc_copy@huc-copy:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-tglb2/igt@gem_huc_copy@huc-copy.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb6/igt@gem_huc_copy@huc-copy.html"
                moz-do-not-send="true">SKIP</a> ([i915#2190])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random-engines:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl3/igt@gem_lmem_swapping@parallel-random-engines.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#4613]) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb1/igt@gem_pxp@reject-modify-context-protection-off-3.html"
                moz-do-not-send="true">SKIP</a> ([i915#4270]) +1 similar
              issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb5/igt@gem_pxp@verify-pxp-stale-ctx-execution.html"
                moz-do-not-send="true">SKIP</a> ([i915#4270]) +1 similar
              issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb5/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html"
                moz-do-not-send="true">SKIP</a> ([i915#768])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_softpin@allocator-evict-all-engines:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-glk4/igt@gem_softpin@allocator-evict-all-engines.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk3/igt@gem_softpin@allocator-evict-all-engines.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#118])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@coherency-sync:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb7/igt@gem_userptr_blits@coherency-sync.html"
                moz-do-not-send="true">SKIP</a> ([fdo#110542])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@readonly-unsync:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb2/igt@gem_userptr_blits@readonly-unsync.html"
                moz-do-not-send="true">SKIP</a> ([i915#3297])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_workarounds@suspend-resume-context:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-apl4/igt@gem_workarounds@suspend-resume-context.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl6/igt@gem_workarounds@suspend-resume-context.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#180]) +2
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@allowed-single:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb3/igt@gen9_exec_parse@allowed-single.html"
                moz-do-not-send="true">SKIP</a> ([i915#2527] /
              [i915#2856]) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@secure-batches:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb5/igt@gen9_exec_parse@secure-batches.html"
                moz-do-not-send="true">SKIP</a> ([i915#2856]) +1 similar
              issue</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-kbl7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271]) +71
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271]) +177
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-kbl3/igt@i915_suspend@fence-restore-tiled2untiled.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-kbl7/igt@i915_suspend@fence-restore-tiled2untiled.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#180])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#111614]) +1
                similar issue</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#110725] /
                [fdo#111614])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-tglb5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">FAIL</a> ([i915#3743])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#3777])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#111615]) +1
                similar issue</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#110723]) +1
                similar issue</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#3777]) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb3/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html"
                moz-do-not-send="true">SKIP</a> ([i915#3689] /
              [i915#3886])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-kbl6/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#3886]) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb6/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109278]) +9
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb6/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs.html"
                moz-do-not-send="true">SKIP</a> ([fdo#111615] /
              [i915#3689]) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl6/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#3886]) +7 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
          <ul>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb8/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109278] /
                [i915#3886])</p>
            </li>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk6/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109271] /
                [i915#3886])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb2/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs.html"
                moz-do-not-send="true">SKIP</a> ([i915#3689]) +2 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium@vga-edid-read:</p>
          <ul>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl6/igt@kms_chamelium@vga-edid-read.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109271] /
                [fdo#111827]) +13 similar issues</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb4/igt@kms_chamelium@vga-edid-read.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109284] /
                [fdo#111827]) +3 similar issues</p>
            </li>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk7/igt@kms_chamelium@vga-edid-read.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109271] /
                [fdo#111827]) +4 similar issues</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@pipe-d-gamma:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb8/igt@kms_color@pipe-d-gamma.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109278] /
              [i915#1149])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_chamelium@pipe-a-degamma:</p>
          <ul>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-kbl1/igt@kms_color_chamelium@pipe-a-degamma.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109271] /
                [fdo#111827]) +6 similar issues</p>
            </li>
            <li>
              <p>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-snb4/igt@kms_color_chamelium@pipe-a-degamma.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109271] /
                [fdo#111827]) +4 similar issues</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_chamelium@pipe-b-ctm-0-5:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-0-5.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109284] /
              [fdo#111827]) +6 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_chamelium@pipe-d-ctm-green-to-red:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109278] /
              [fdo#109284] / [fdo#111827])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl1/igt@kms_content_protection@lic.html"
                moz-do-not-send="true">TIMEOUT</a> ([i915#1319])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109278] /
              [fdo#109279]) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-c-cursor-max-size-sliding:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-max-size-sliding.html"
                moz-do-not-send="true">SKIP</a> ([i915#3359]) +2 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#180])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-d-cursor-32x32-random:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-32x32-random.html"
                moz-do-not-send="true">SKIP</a> ([i915#3319]) +1 similar
              issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109279] /
              [i915#3359]) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb3/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109274] /
              [fdo#109278]) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb3/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html"
                  moz-do-not-send="true">SKIP</a> ([i915#3528])</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb1/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html"
                  moz-do-not-send="true">SKIP</a> ([i915#3528])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_draw_crc@draw-method-rgb565-render-ytiled:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html"
                moz-do-not-send="true">DMESG-FAIL</a> ([i915#118] /
              [i915#1888])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@fbc-suspend:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a> ([i915#180] /
              [i915#636])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-fences:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb8/igt@kms_flip@2x-flip-vs-fences.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109274] /
                [fdo#111825]) +4 similar issues</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb4/igt@kms_flip@2x-flip-vs-fences.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109274]) +1
                similar issue</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-glk6/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk2/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html"
                moz-do-not-send="true">FAIL</a> ([i915#2122])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-apl3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html"
                moz-do-not-send="true">FAIL</a> ([i915#79])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html"
                moz-do-not-send="true">FAIL</a> ([i915#79])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-glk9/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html"
                moz-do-not-send="true">FAIL</a> ([i915#4911])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html"
                moz-do-not-send="true">SKIP</a> ([i915#3701]) +1 similar
              issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109280]) +11
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109280] /
              [fdo#111825]) +14 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-snb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271]) +96
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
          <ul>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html"
                  moz-do-not-send="true">FAIL</a> ([fdo#108145] /
                [i915#265]) +1 similar issue</p>
            </li>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html"
                  moz-do-not-send="true">FAIL</a> ([fdo#108145] /
                [i915#265]) +2 similar issues</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk6/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html"
                moz-do-not-send="true">FAIL</a> ([fdo#108145] /
              [i915#265])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#658]) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109441]) +1
              similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109441]) +2
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_sprite_render:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb6/igt@kms_psr@psr2_sprite_render.html"
                moz-do-not-send="true">FAIL</a> ([i915#132] /
              [i915#3467]) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271]) +49
              similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@pipe-d-wait-idle:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl2/igt@kms_vblank@pipe-d-wait-idle.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#533]) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb7/igt@kms_vrr@flip-basic.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109502])</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb1/igt@kms_vrr@flip-basic.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109502])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb7/igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame.html"
                moz-do-not-send="true">SKIP</a> ([i915#2530])</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_nv_test@nv_i915_sharing:</p>
          <ul>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb2/igt@prime_nv_test@nv_i915_sharing.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109291])</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb1/igt@prime_nv_test@nv_i915_sharing.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109291])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@sysfs_clients@busy:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-apl7/igt@sysfs_clients@busy.html"
                moz-do-not-send="true">SKIP</a> ([fdo#109271] /
              [i915#2994])</li>
          </ul>
        </li>
        <li>
          <p>igt@sysfs_clients@recycle:</p>
          <ul>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb6/igt@sysfs_clients@recycle.html"
                  moz-do-not-send="true">SKIP</a> ([i915#2994])</p>
            </li>
            <li>
              <p>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-kbl3/igt@sysfs_clients@recycle.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109271] /
                [i915#2994])</p>
            </li>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk9/igt@sysfs_clients@recycle.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109271] /
                [i915#2994])</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb3/igt@sysfs_clients@recycle.html"
                  moz-do-not-send="true">SKIP</a> ([i915#2994])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@tools_test@sysfs_l3_parity:</p>
          <ul>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb5/igt@tools_test@sysfs_l3_parity.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109307])</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb6/igt@tools_test@sysfs_l3_parity.html"
                  moz-do-not-send="true">SKIP</a> ([fdo#109307])</p>
            </li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@gem_exec_balancer@parallel-bb-first:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-iclb5/igt@gem_exec_balancer@parallel-bb-first.html"
                moz-do-not-send="true">SKIP</a> ([i915#4525]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_big@single:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-tglb1/igt@gem_exec_big@single.html"
                moz-do-not-send="true">TIMEOUT</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb3/igt@gem_exec_big@single.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none@vcs0:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html"
                moz-do-not-send="true">FAIL</a> ([i915#2842]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html"
                moz-do-not-send="true">PASS</a> +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-tglb6/igt@gem_exec_fair@basic-pace-solo@rcs0.html"
                moz-do-not-send="true">FAIL</a> ([i915#2842]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb7/igt@gem_exec_fair@basic-pace-solo@rcs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace@rcs0:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-glk1/igt@gem_exec_fair@basic-pace@rcs0.html"
                moz-do-not-send="true">FAIL</a> ([i915#2842]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk8/igt@gem_exec_fair@basic-pace@rcs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-fence:</p>
          <ul>
            <li>
              <p>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-tglb7/igt@i915_pm_rc6_residency@rc6-fence.html"
                  moz-do-not-send="true">WARN</a> ([i915#2681] /
                [i915#2684]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb3/igt@i915_pm_rc6_residency@rc6-fence.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html"
                  moz-do-not-send="true">WARN</a> ([i915#1804] /
                [i915#2684]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-glk1/igt@kms_big_fb@linear-32bpp-rotate-180.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#118]) -&gt;
              <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-glk7/igt@kms_big_fb@linear-32bpp-rotate-180.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-tglb1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">FAIL</a> ([i915#3743]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@pipe-c-ctm-negative:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-tglb1/igt@kms_color@pipe-c-ctm-negative.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#1149] /
              [i915#1982]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6577/shard-tglb1/igt@kms_color@pipe-c-ctm-negative.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11134/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html"
                moz-do-not-send="true">FAIL</a> ([i915#2346]) -&gt; <a
                href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------kE0WSV05IIIYGg8HUzGT3EJh--
