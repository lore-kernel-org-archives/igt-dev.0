Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E858310E0C2
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Nov 2022 15:41:16 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id k84so14040785ybk.3
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Nov 2022 07:41:16 -0800 (PST)
MIME-Version: 1.0
References: <20221117194639.481656-1-markyacoub@chromium.org>
 <166885242501.5307.4105849868909378680@emeril.freedesktop.org>
 <CAJUqKUoBD3zrqGdcKU0uSkm=xGeWg9rVnSaw8Xp4HsLbnyJZRQ@mail.gmail.com>
In-Reply-To: <CAJUqKUoBD3zrqGdcKU0uSkm=xGeWg9rVnSaw8Xp4HsLbnyJZRQ@mail.gmail.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 21 Nov 2022 10:41:05 -0500
Message-ID: <CAJUqKUqESdScL205vXWVMBcSmoNo8D+nYiczs4TYVQru9Eb+QQ@mail.gmail.com>
To: saix.nandan.yedireswarapu@intel.com
Content-Type: multipart/alternative; boundary="000000000000c6edc905edfce2bd"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQ3YzIFdv?=
	=?utf-8?q?rkaround=3A_Skip_Plug_all_at_init=2E_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--000000000000c6edc905edfce2bd
Content-Type: text/plain; charset="UTF-8"

Hi Saix, the error looks irrelevant, can i get a rerun please

On Mon, Nov 21, 2022 at 10:37 AM Mark Yacoub <markyacoub@chromium.org>
wrote:

> Hello again, can i get a rerun :))
>
> On Sat, Nov 19, 2022 at 5:07 AM Patchwork <
> patchwork@emeril.freedesktop.org> wrote:
>
>> *Patch Details*
>> *Series:* Cv3 Workaround: Skip Plug all at init. (rev2)
>> *URL:* https://patchwork.freedesktop.org/series/111037/
>> *State:* failure
>> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/index.html CI
>> Bug Log - changes from CI_DRM_12401_full -> IGTPW_8131_full Summary
>>
>> *FAILURE*
>>
>> Serious unknown changes coming with IGTPW_8131_full absolutely need to be
>> verified manually.
>>
>> If you think the reported changes have nothing to do with the changes
>> introduced in IGTPW_8131_full, please notify your bug team to allow them
>> to document this new failure mode, which will reduce false positives in
>> CI.
>>
>> External URL:
>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/index.html
>> Participating hosts (11 -> 8)
>>
>> Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
>> Possible new issues
>>
>> Here are the unknown changes that may have been introduced in
>> IGTPW_8131_full:
>> IGT changes Possible regressions
>>
>>    - igt@i915_module_load@reload-with-fault-injection:
>>       - shard-snb: NOTRUN -> INCOMPLETE
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html>
>>
>> Suppressed
>>
>> The following results come from untrusted machines, tests, or statuses.
>> They do not affect the overall result.
>>
>>    -
>>
>>    igt@gem_ctx_persistence@heartbeat-hostile:
>>    - {shard-rkl}: PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-rkl-4/igt@gem_ctx_persistence@heartbeat-hostile.html>
>>       -> INCOMPLETE
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-3/igt@gem_ctx_persistence@heartbeat-hostile.html>
>>    -
>>
>>    igt@i915_pm_backlight@fade:
>>    - {shard-rkl}: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-4/igt@i915_pm_backlight@fade.html>
>>
>> Known issues
>>
>> Here are the changes found in IGTPW_8131_full that come from known issues:
>> IGT changes Issues hit
>>
>>    -
>>
>>    igt@gem_ccs@block-copy-inplace:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb5/igt@gem_ccs@block-copy-inplace.html>
>>       (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>
>>       / i915#5325 <https://gitlab.freedesktop.org/drm/intel/issues/5325>)
>>    -
>>
>>    igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
>>    - shard-snb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-snb4/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html>
>>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>
>>       / i915#1099 <https://gitlab.freedesktop.org/drm/intel/issues/1099>)
>>       +2 similar issues
>>    -
>>
>>    igt@gem_ctx_persistence@many-contexts:
>>    - shard-tglb: NOTRUN -> FAIL
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb2/igt@gem_ctx_persistence@many-contexts.html>
>>       (i915#2410 <https://gitlab.freedesktop.org/drm/intel/issues/2410>)
>>    -
>>
>>    igt@gem_exec_balancer@parallel-contexts:
>>    - shard-iclb: PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html>
>>       -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb6/igt@gem_exec_balancer@parallel-contexts.html>
>>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>>       +1 similar issue
>>    -
>>
>>    igt@gem_exec_balancer@parallel-keep-in-fence:
>>    - shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb3/igt@gem_exec_balancer@parallel-keep-in-fence.html>
>>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>>    -
>>
>>    igt@gem_exec_capture@capture-invisible@smem0:
>>    -
>>
>>       shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb8/igt@gem_exec_capture@capture-invisible@smem0.html>
>>       (i915#6334 <https://gitlab.freedesktop.org/drm/intel/issues/6334>)
>>       -
>>
>>       shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb2/igt@gem_exec_capture@capture-invisible@smem0.html>
>>       (i915#6334 <https://gitlab.freedesktop.org/drm/intel/issues/6334>)
>>       -
>>
>>    igt@gem_exec_fair@basic-none-share@rcs0:
>>    - shard-glk: PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-glk8/igt@gem_exec_fair@basic-none-share@rcs0.html>
>>       -> FAIL
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-glk3/igt@gem_exec_fair@basic-none-share@rcs0.html>
>>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>>       +2 similar issues
>>    -
>>
>>    igt@gem_lmem_swapping@parallel-random:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb5/igt@gem_lmem_swapping@parallel-random.html>
>>       (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>>       +3 similar issues
>>    -
>>
>>    igt@gem_lmem_swapping@parallel-random-engines:
>>    - shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb6/igt@gem_lmem_swapping@parallel-random-engines.html>
>>       (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>>       +1 similar issue
>>    -
>>
>>    igt@gem_lmem_swapping@verify-random-ccs:
>>    -
>>
>>       shard-apl: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-apl8/igt@gem_lmem_swapping@verify-random-ccs.html>
>>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>
>>       / i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>>       +2 similar issues
>>       -
>>
>>       shard-glk: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-glk8/igt@gem_lmem_swapping@verify-random-ccs.html>
>>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>
>>       / i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>>       +2 similar issues
>>       -
>>
>>    igt@gem_pxp@protected-encrypted-src-copy-not-readible:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb7/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html>
>>       (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>>       +2 similar issues
>>    -
>>
>>    igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
>>    - shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb2/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html>
>>       (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>>       +1 similar issue
>>    -
>>
>>    igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
>>    - shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb7/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html>
>>       (i915#768 <https://gitlab.freedesktop.org/drm/intel/issues/768>)
>>    -
>>
>>    igt@gem_userptr_blits@access-control:
>>    - shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb3/igt@gem_userptr_blits@access-control.html>
>>       (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>>       +2 similar issues
>>    -
>>
>>    igt@gem_userptr_blits@unsync-unmap-after-close:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb3/igt@gem_userptr_blits@unsync-unmap-after-close.html>
>>       (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>>    -
>>
>>    igt@gen3_mixed_blits:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb2/igt@gen3_mixed_blits.html>
>>       (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>>       +1 similar issue
>>    -
>>
>>    igt@gen7_exec_parse@basic-allowed:
>>    - shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb5/igt@gen7_exec_parse@basic-allowed.html>
>>       (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>>    -
>>
>>    igt@gen9_exec_parse@bb-start-out:
>>    - shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb3/igt@gen9_exec_parse@bb-start-out.html>
>>       (i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>)
>>       +1 similar issue
>>    -
>>
>>    igt@gen9_exec_parse@shadow-peek:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb1/igt@gen9_exec_parse@shadow-peek.html>
>>       (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527>
>>       / i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>)
>>       +1 similar issue
>>    -
>>
>>    igt@i915_pm_dc@dc6-dpms:
>>    - shard-iclb: PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html>
>>       -> FAIL
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html>
>>       (i915#3989 <https://gitlab.freedesktop.org/drm/intel/issues/3989>
>>       / i915#454 <https://gitlab.freedesktop.org/drm/intel/issues/454>)
>>    -
>>
>>    igt@i915_pm_rpm@system-suspend-devices:
>>    - shard-snb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-snb5/igt@i915_pm_rpm@system-suspend-devices.html>
>>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>>       +174 similar issues
>>    -
>>
>>    igt@i915_pm_rps@engine-order:
>>    - shard-apl: NOTRUN -> FAIL
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-apl7/igt@i915_pm_rps@engine-order.html>
>>       (i915#6537 <https://gitlab.freedesktop.org/drm/intel/issues/6537>)
>>    -
>>
>>    igt@i915_query@test-query-geometry-subslices:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb3/igt@i915_query@test-query-geometry-subslices.html>
>>       (i915#5723 <https://gitlab.freedesktop.org/drm/intel/issues/5723>)
>>    -
>>
>>    igt@i915_selftest@live@hangcheck:
>>    - shard-tglb: PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-tglb3/igt@i915_selftest@live@hangcheck.html>
>>       -> DMESG-WARN
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb5/igt@i915_selftest@live@hangcheck.html>
>>       (i915#5591 <https://gitlab.freedesktop.org/drm/intel/issues/5591>)
>>    -
>>
>>    igt@i915_selftest@live@sanitycheck:
>>    - shard-snb: PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-snb5/igt@i915_selftest@live@sanitycheck.html>
>>       -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-snb7/igt@i915_selftest@live@sanitycheck.html>
>>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>>    -
>>
>>    igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>>    -
>>
>>       shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html>
>>       (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>>       +3 similar issues
>>       -
>>
>>       shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html>
>>       (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>>       +3 similar issues
>>       -
>>
>>    igt@kms_big_fb@linear-64bpp-rotate-90:
>>    - shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb5/igt@kms_big_fb@linear-64bpp-rotate-90.html>
>>       (fdo#110725 <https://bugs.freedesktop.org/show_bug.cgi?id=110725>
>>       / fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>)
>>       +1 similar issue
>>    -
>>
>>    igt@kms_big_fb@linear-8bpp-rotate-270:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb6/igt@kms_big_fb@linear-8bpp-rotate-270.html>
>>       (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>)
>>    -
>>
>>    igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>>       (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>)
>>       +6 similar issues
>>    -
>>
>>    igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>>    - shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>>       (fdo#110723 <https://bugs.freedesktop.org/show_bug.cgi?id=110723>)
>>       +1 similar issue
>>    -
>>
>>    igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_mc_ccs:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb3/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_mc_ccs.html>
>>       (i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>>       +5 similar issues
>>    -
>>
>>    igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:
>>    -
>>
>>       shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb8/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html>
>>       (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278>
>>       / i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>>       +3 similar issues
>>       -
>>
>>       shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb6/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html>
>>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>
>>       / i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>>       -
>>
>>    igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
>>    -
>>
>>       shard-apl: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-apl7/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html>
>>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>>       +146 similar issues
>>       -
>>
>>       shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb7/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html>
>>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>
>>       / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>>       +1 similar issue
>>       -
>>
>>    igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
>>    - shard-apl: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-apl6/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html>
>>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>
>>       / i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>>       +6 similar issues
>>    -
>>
>>    igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:
>>    - shard-glk: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-glk6/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs.html>
>>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>
>>       / i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>>       +5 similar issues
>>    -
>>
>>    igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:
>>    - shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb3/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html>
>>       (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278>)
>>       +20 similar issues
>>    -
>>
>>    igt@kms_ccs@pipe-d-crc-sprite-planes-basic-yf_tiled_ccs:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb3/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-yf_tiled_ccs.html>
>>       (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>
>>       / i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>)
>>       +1 similar issue
>>    -
>>
>>    igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_mc_ccs:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb8/igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_mc_ccs.html>
>>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>)
>>       +4 similar issues
>>    -
>>
>>    igt@kms_chamelium@dp-hpd-for-each-pipe:
>>    - shard-glk: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-glk9/igt@kms_chamelium@dp-hpd-for-each-pipe.html>
>>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>
>>       / fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>>       +7 similar issues
>>    -
>>
>>    igt@kms_chamelium@hdmi-hpd-storm-disable:
>>    -
>>
>>       shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb5/igt@kms_chamelium@hdmi-hpd-storm-disable.html>
>>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284>
>>       / fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>>       +3 similar issues
>>       -
>>
>>       shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb5/igt@kms_chamelium@hdmi-hpd-storm-disable.html>
>>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284>
>>       / fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>>       +5 similar issues
>>       -
>>
>>    igt@kms_chamelium@vga-frame-dump:
>>    - shard-apl: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-apl2/igt@kms_chamelium@vga-frame-dump.html>
>>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>
>>       / fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>>       +3 similar issues
>>    -
>>
>>    igt@kms_chamelium@vga-hpd-after-suspend:
>>    - shard-snb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-snb2/igt@kms_chamelium@vga-hpd-after-suspend.html>
>>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>
>>       / fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>>       +6 similar issues
>>    -
>>
>>    igt@kms_content_protection@atomic:
>>    - shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb1/igt@kms_content_protection@atomic.html>
>>       (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>>    -
>>
>>    igt@kms_content_protection@dp-mst-type-0:
>>    -
>>
>>       shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb5/igt@kms_content_protection@dp-mst-type-0.html>
>>       (i915#3116 <https://gitlab.freedesktop.org/drm/intel/issues/3116>
>>       / i915#3299 <https://gitlab.freedesktop.org/drm/intel/issues/3299>)
>>       -
>>
>>       shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb5/igt@kms_content_protection@dp-mst-type-0.html>
>>       (i915#3116 <https://gitlab.freedesktop.org/drm/intel/issues/3116>)
>>       -
>>
>>    igt@kms_content_protection@legacy@pipe-a-dp-1:
>>    - shard-apl: NOTRUN -> TIMEOUT
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-apl3/igt@kms_content_protection@legacy@pipe-a-dp-1.html>
>>       (i915#7173 <https://gitlab.freedesktop.org/drm/intel/issues/7173>)
>>       +1 similar issue
>>    -
>>
>>    igt@kms_content_protection@srm:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb6/igt@kms_content_protection@srm.html>
>>       (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>>    -
>>
>>    igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html>
>>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>
>>       / fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>>    -
>>
>>    igt@kms_cursor_legacy@short-busy-flip-before-cursor:
>>    - shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb6/igt@kms_cursor_legacy@short-busy-flip-before-cursor.html>
>>       (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>)
>>    -
>>
>>    igt@kms_display_modes@extended-mode-basic:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb6/igt@kms_display_modes@extended-mode-basic.html>
>>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>)
>>    -
>>
>>    igt@kms_dsc@dsc-with-bpc:
>>    - shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb5/igt@kms_dsc@dsc-with-bpc.html>
>>       (i915#3840 <https://gitlab.freedesktop.org/drm/intel/issues/3840>)
>>    -
>>
>>    igt@kms_flip@2x-nonexisting-fb:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb6/igt@kms_flip@2x-nonexisting-fb.html>
>>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>
>>       / fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>
>>       / i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>)
>>       +9 similar issues
>>    -
>>
>>    igt@kms_flip@2x-plain-flip-fb-recreate:
>>    - shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb1/igt@kms_flip@2x-plain-flip-fb-recreate.html>
>>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>)
>>       +6 similar issues
>>    -
>>
>>    igt@kms_flip_scaled_crc
>>    @flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html>
>>       (i915#2587 <https://gitlab.freedesktop.org/drm/intel/issues/2587>
>>       / i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>>       +2 similar issues
>>    -
>>
>>    igt@kms_flip_scaled_crc
>>    @flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
>>    -
>>
>>       shard-glk: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-glk2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html>
>>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>>       +107 similar issues
>>       -
>>
>>       shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html>
>>       (i915#2587 <https://gitlab.freedesktop.org/drm/intel/issues/2587>
>>       / i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>>       +1 similar issue
>>       -
>>
>>    igt@kms_flip_scaled_crc
>>    @flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
>>    - shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html>
>>       (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>>       +3 similar issues
>>    -
>>
>>    igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html>
>>       (i915#6497 <https://gitlab.freedesktop.org/drm/intel/issues/6497>)
>>       +5 similar issues
>>    -
>>
>>    igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
>>    - shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html>
>>       (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280>)
>>       +19 similar issues
>>    -
>>
>>    igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite.html>
>>       (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280>
>>       / fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>>       +19 similar issues
>>    -
>>
>>    igt@kms_hdr@bpc-switch-dpms:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb6/igt@kms_hdr@bpc-switch-dpms.html>
>>       (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>>       +3 similar issues
>>    -
>>
>>    igt@kms_hdr@static-toggle-suspend:
>>    - shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb3/igt@kms_hdr@static-toggle-suspend.html>
>>       (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>>       +4 similar issues
>>    -
>>
>>    igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>>       (i915#1839 <https://gitlab.freedesktop.org/drm/intel/issues/1839>)
>>    -
>>
>>    igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-dp-1:
>>    - shard-apl: NOTRUN -> FAIL
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-apl7/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-dp-1.html>
>>       (i915#4573 <https://gitlab.freedesktop.org/drm/intel/issues/4573>)
>>       +2 similar issues
>>    -
>>
>>    igt@kms_plane_lowres@tiling-none@pipe-c-edp-1:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb7/igt@kms_plane_lowres@tiling-none@pipe-c-edp-1.html>
>>       (i915#3536 <https://gitlab.freedesktop.org/drm/intel/issues/3536>)
>>       +3 similar issues
>>    -
>>
>>    igt@kms_plane_lowres@tiling-yf:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb5/igt@kms_plane_lowres@tiling-yf.html>
>>       (fdo#112054 <https://bugs.freedesktop.org/show_bug.cgi?id=112054>
>>       / i915#5288 <https://gitlab.freedesktop.org/drm/intel/issues/5288>)
>>    -
>>
>>    igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:
>>    - shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb7/igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1.html>
>>       (i915#3536 <https://gitlab.freedesktop.org/drm/intel/issues/3536>)
>>       +5 similar issues
>>    -
>>
>>    igt@kms_plane_scaling
>>    @plane-downscale-with-rotation-factor-0-25@pipe-c-edp-1:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb8/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-edp-1.html>
>>       (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>)
>>       +7 similar issues
>>    -
>>
>>    igt@kms_plane_scaling
>>    @plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
>>    - shard-iclb: PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-iclb1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html>
>>       -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html>
>>       (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>)
>>       +1 similar issue
>>    -
>>
>>    igt@kms_plane_scaling
>>    @plane-scaler-with-clipping-clamping-rotation@pipe-c-edp-1:
>>    - shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-edp-1.html>
>>       (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>)
>>       +8 similar issues
>>    -
>>
>>    igt@kms_prime@d3hot:
>>    -
>>
>>       shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb6/igt@kms_prime@d3hot.html>
>>       (i915#6524 <https://gitlab.freedesktop.org/drm/intel/issues/6524>)
>>       -
>>
>>       shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb6/igt@kms_prime@d3hot.html>
>>       (i915#6524 <https://gitlab.freedesktop.org/drm/intel/issues/6524>)
>>       -
>>
>>    igt@kms_psr2_sf@cursor-plane-update-sf:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb3/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>>       +1 similar issue
>>    -
>>
>>    igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
>>    -
>>
>>       shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb5/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html>
>>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>>       -
>>
>>       shard-apl: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-apl7/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html>
>>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>
>>       / i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>>       +1 similar issue
>>       -
>>
>>    igt@kms_psr2_su@page_flip-nv12:
>>    -
>>
>>       shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb5/igt@kms_psr2_su@page_flip-nv12.html>
>>       (i915#7037 <https://gitlab.freedesktop.org/drm/intel/issues/7037>)
>>       -
>>
>>       shard-glk: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-glk8/igt@kms_psr2_su@page_flip-nv12.html>
>>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>
>>       / i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>>       +2 similar issues
>>       -
>>
>>       shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb8/igt@kms_psr2_su@page_flip-nv12.html>
>>       (fdo#109642 <https://bugs.freedesktop.org/show_bug.cgi?id=109642>
>>       / fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068>
>>       / i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>>       -
>>
>>    igt@kms_psr@psr2_cursor_mmap_cpu:
>>    - shard-iclb: PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html>
>>       -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_cpu.html>
>>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>>    -
>>
>>    igt@kms_psr@psr2_sprite_mmap_cpu:
>>    -
>>
>>       shard-tglb: NOTRUN -> FAIL
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb5/igt@kms_psr@psr2_sprite_mmap_cpu.html>
>>       (i915#132 <https://gitlab.freedesktop.org/drm/intel/issues/132> /
>>       i915#3467 <https://gitlab.freedesktop.org/drm/intel/issues/3467>)
>>       -
>>
>>       shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_cpu.html>
>>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>>       -
>>
>>    igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html>
>>       (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>
>>       / i915#5289 <https://gitlab.freedesktop.org/drm/intel/issues/5289>)
>>       +1 similar issue
>>    -
>>
>>    igt@kms_writeback@writeback-invalid-parameters:
>>    -
>>
>>       shard-apl: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-apl3/igt@kms_writeback@writeback-invalid-parameters.html>
>>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>
>>       / i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>>       -
>>
>>       shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb5/igt@kms_writeback@writeback-invalid-parameters.html>
>>       (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>>       -
>>
>>    igt@perf_pmu@event-wait@rcs0:
>>    -
>>
>>       shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb2/igt@perf_pmu@event-wait@rcs0.html>
>>       (fdo#112283 <https://bugs.freedesktop.org/show_bug.cgi?id=112283>)
>>       -
>>
>>       shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb8/igt@perf_pmu@event-wait@rcs0.html>
>>       (fdo#112283 <https://bugs.freedesktop.org/show_bug.cgi?id=112283>)
>>       -
>>
>>    igt@prime_udl:
>>    - shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb5/igt@prime_udl.html>
>>       (fdo#109291 <https://bugs.freedesktop.org/show_bug.cgi?id=109291>)
>>    -
>>
>>    igt@sysfs_clients@fair-0:
>>    -
>>
>>       shard-apl: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-apl1/igt@sysfs_clients@fair-0.html>
>>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>
>>       / i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>>       +2 similar issues
>>       -
>>
>>       shard-tglb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb8/igt@sysfs_clients@fair-0.html>
>>       (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>>       +2 similar issues
>>       -
>>
>>       shard-glk: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-glk7/igt@sysfs_clients@fair-0.html>
>>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>
>>       / i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>>       -
>>
>>    igt@sysfs_clients@split-10:
>>    - shard-iclb: NOTRUN -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb8/igt@sysfs_clients@split-10.html>
>>       (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>>       +2 similar issues
>>
>> Possible fixes
>>
>>    -
>>
>>    igt@feature_discovery@psr2:
>>    - {shard-rkl}: SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-rkl-2/igt@feature_discovery@psr2.html>
>>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-6/igt@feature_discovery@psr2.html>
>>    -
>>
>>    igt@gem_ctx_persistence@smoketest:
>>    - shard-iclb: FAIL
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-iclb1/igt@gem_ctx_persistence@smoketest.html>
>>       (i915#5099 <https://gitlab.freedesktop.org/drm/intel/issues/5099>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb3/igt@gem_ctx_persistence@smoketest.html>
>>    -
>>
>>    igt@gem_exec_balancer@parallel-bb-first:
>>    - shard-iclb: SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-iclb6/igt@gem_exec_balancer@parallel-bb-first.html>
>>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html>
>>    -
>>
>>    igt@gem_exec_capture@pi@vcs0:
>>    - shard-iclb: INCOMPLETE
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-iclb5/igt@gem_exec_capture@pi@vcs0.html>
>>       (i915#3371 <https://gitlab.freedesktop.org/drm/intel/issues/3371>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb6/igt@gem_exec_capture@pi@vcs0.html>
>>    -
>>
>>    igt@gem_exec_reloc@basic-cpu-read:
>>    - {shard-rkl}: SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-rkl-4/igt@gem_exec_reloc@basic-cpu-read.html>
>>       (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-read.html>
>>       +3 similar issues
>>    -
>>
>>    igt@gem_mmap_wc@set-cache-level:
>>    - {shard-rkl}: SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-rkl-5/igt@gem_mmap_wc@set-cache-level.html>
>>       (i915#1850 <https://gitlab.freedesktop.org/drm/intel/issues/1850>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-6/igt@gem_mmap_wc@set-cache-level.html>
>>    -
>>
>>    igt@gem_ppgtt@blt-vs-render-ctxn:
>>    - {shard-rkl}: DMESG-FAIL
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-rkl-5/igt@gem_ppgtt@blt-vs-render-ctxn.html>
>>       (i915#3692 <https://gitlab.freedesktop.org/drm/intel/issues/3692>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-1/igt@gem_ppgtt@blt-vs-render-ctxn.html>
>>    -
>>
>>    igt@gem_ppgtt@flink-and-close-vma-leak:
>>    - shard-glk: FAIL
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html>
>>       (i915#7409 <https://gitlab.freedesktop.org/drm/intel/issues/7409>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html>
>>    -
>>
>>    igt@gem_pwrite_snooped:
>>    - {shard-rkl}: SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-rkl-4/igt@gem_pwrite_snooped.html>
>>       (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-5/igt@gem_pwrite_snooped.html>
>>       +2 similar issues
>>    -
>>
>>    igt@gen9_exec_parse@unaligned-access:
>>    - {shard-rkl}: SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-rkl-1/igt@gen9_exec_parse@unaligned-access.html>
>>       (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-5/igt@gen9_exec_parse@unaligned-access.html>
>>    -
>>
>>    igt@i915_pm_rpm@drm-resources-equal:
>>    - {shard-rkl}: SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-rkl-2/igt@i915_pm_rpm@drm-resources-equal.html>
>>       (fdo#109308 <https://bugs.freedesktop.org/show_bug.cgi?id=109308>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-6/igt@i915_pm_rpm@drm-resources-equal.html>
>>       +1 similar issue
>>    -
>>
>>    igt@i915_pm_rpm@fences:
>>    - {shard-rkl}: SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-rkl-5/igt@i915_pm_rpm@fences.html>
>>       (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-6/igt@i915_pm_rpm@fences.html>
>>    -
>>
>>    igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs:
>>    - {shard-rkl}: SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-rkl-1/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs.html>
>>       (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845>
>>       / i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-6/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs.html>
>>       +15 similar issues
>>    -
>>
>>    igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
>>    - shard-tglb: FAIL
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html>
>>       (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html>
>>    -
>>
>>    igt@kms_cursor_legacy@torture-bo@pipe-c:
>>    - {shard-rkl}: INCOMPLETE
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-rkl-5/igt@kms_cursor_legacy@torture-bo@pipe-c.html>
>>       (i915#7396 <https://gitlab.freedesktop.org/drm/intel/issues/7396>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-5/igt@kms_cursor_legacy@torture-bo@pipe-c.html>
>>    -
>>
>>    igt@kms_dp_aux_dev:
>>    - {shard-rkl}: SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-rkl-2/igt@kms_dp_aux_dev.html>
>>       (i915#1257 <https://gitlab.freedesktop.org/drm/intel/issues/1257>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-6/igt@kms_dp_aux_dev.html>
>>    -
>>
>>    igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:
>>    - shard-tglb: DMESG-WARN
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-tglb3/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html>
>>       (i915#2411 <https://gitlab.freedesktop.org/drm/intel/issues/2411>
>>       / i915#2867 <https://gitlab.freedesktop.org/drm/intel/issues/2867>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb3/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html>
>>    -
>>
>>    igt@kms_flip@flip-vs-suspend@b-dp1:
>>    - shard-apl: DMESG-WARN
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-apl1/igt@kms_flip@flip-vs-suspend@b-dp1.html>
>>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-apl6/igt@kms_flip@flip-vs-suspend@b-dp1.html>
>>    -
>>
>>    igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:
>>    - {shard-rkl}: SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html>
>>       (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849>
>>       / i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html>
>>       +8 similar issues
>>    -
>>
>>    igt@kms_hdmi_inject@inject-audio:
>>    - shard-tglb: SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html>
>>       (i915#433 <https://gitlab.freedesktop.org/drm/intel/issues/433>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html>
>>    -
>>
>>    igt@kms_plane@plane-panning-bottom-right@pipe-a-planes:
>>    - {shard-rkl}: SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-rkl-4/igt@kms_plane@plane-panning-bottom-right@pipe-a-planes.html>
>>       (i915#3558 <https://gitlab.freedesktop.org/drm/intel/issues/3558>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right@pipe-a-planes.html>
>>       +1 similar issue
>>    -
>>
>>    igt@kms_plane@plane-position-covered@pipe-a-planes:
>>    - {shard-rkl}: SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-rkl-2/igt@kms_plane@plane-position-covered@pipe-a-planes.html>
>>       (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849>
>>       / i915#3558 <https://gitlab.freedesktop.org/drm/intel/issues/3558>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-6/igt@kms_plane@plane-position-covered@pipe-a-planes.html>
>>       +3 similar issues
>>    -
>>
>>    igt@kms_psr@psr2_primary_mmap_cpu:
>>    - shard-iclb: SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html>
>>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html>
>>       +1 similar issue
>>    -
>>
>>    igt@kms_psr@sprite_plane_onoff:
>>    - {shard-rkl}: SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-rkl-2/igt@kms_psr@sprite_plane_onoff.html>
>>       (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-6/igt@kms_psr@sprite_plane_onoff.html>
>>       +1 similar issue
>>    -
>>
>>    igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>>    - shard-iclb: SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-iclb5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>>       (i915#5519 <https://gitlab.freedesktop.org/drm/intel/issues/5519>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>>    -
>>
>>    igt@kms_universal_plane@universal-plane-pipe-b-sanity:
>>    - {shard-rkl}: SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-rkl-1/igt@kms_universal_plane@universal-plane-pipe-b-sanity.html>
>>       (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845>
>>       / i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070>
>>       / i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-6/igt@kms_universal_plane@universal-plane-pipe-b-sanity.html>
>>    -
>>
>>    igt@perf@gen8-unprivileged-single-ctx-counters:
>>    - {shard-rkl}: SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html>
>>       (i915#2436 <https://gitlab.freedesktop.org/drm/intel/issues/2436>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html>
>>    -
>>
>>    igt@perf@stress-open-close:
>>    - shard-glk: INCOMPLETE
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-glk7/igt@perf@stress-open-close.html>
>>       (i915#5213 <https://gitlab.freedesktop.org/drm/intel/issues/5213>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-glk6/igt@perf@stress-open-close.html>
>>    -
>>
>>    igt@sysfs_heartbeat_interval@nopreempt@vcs0:
>>    - shard-tglb: FAIL
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-tglb1/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html>
>>       (i915#6015 <https://gitlab.freedesktop.org/drm/intel/issues/6015>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb7/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html>
>>       +4 similar issues
>>    -
>>
>>    igt@testdisplay:
>>    - {shard-rkl}: SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-rkl-5/igt@testdisplay.html>
>>       (i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>>       -> PASS
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-6/igt@testdisplay.html>
>>
>> Warnings
>>
>>    -
>>
>>    igt@gem_exec_balancer@parallel-ordering:
>>    - shard-iclb: SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html>
>>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>>       -> FAIL
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html>
>>       (i915#6117 <https://gitlab.freedesktop.org/drm/intel/issues/6117>)
>>    -
>>
>>    igt@gem_exec_fair@basic-none-share@rcs0:
>>    - shard-tglb: FAIL
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html>
>>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>>       -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html>
>>       (i915#2848 <https://gitlab.freedesktop.org/drm/intel/issues/2848>)
>>    -
>>
>>    igt@gem_exec_fair@basic-pace@vcs1:
>>    - shard-tglb: SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-tglb1/igt@gem_exec_fair@basic-pace@vcs1.html>
>>       (i915#2848 <https://gitlab.freedesktop.org/drm/intel/issues/2848>)
>>       -> FAIL
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb8/igt@gem_exec_fair@basic-pace@vcs1.html>
>>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>>       +5 similar issues
>>    -
>>
>>    igt@gem_pread@exhaustion:
>>    -
>>
>>       shard-apl: WARN
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-apl2/igt@gem_pread@exhaustion.html>
>>       (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
>>       -> INCOMPLETE
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-apl2/igt@gem_pread@exhaustion.html>
>>       (i915#7248 <https://gitlab.freedesktop.org/drm/intel/issues/7248>)
>>       +1 similar issue
>>       -
>>
>>       shard-tglb: WARN
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-tglb3/igt@gem_pread@exhaustion.html>
>>       (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
>>       -> INCOMPLETE
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb3/igt@gem_pread@exhaustion.html>
>>       (i915#7248 <https://gitlab.freedesktop.org/drm/intel/issues/7248>)
>>       +1 similar issue
>>       -
>>
>>    igt@gem_pwrite@basic-exhaustion:
>>    - shard-glk: INCOMPLETE
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-glk6/igt@gem_pwrite@basic-exhaustion.html>
>>       (i915#7248 <https://gitlab.freedesktop.org/drm/intel/issues/7248>)
>>       -> WARN
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-glk9/igt@gem_pwrite@basic-exhaustion.html>
>>       (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
>>    -
>>
>>    igt@i915_pm_rc6_residency@rc6-idle@rcs0:
>>    - shard-tglb: FAIL
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-tglb1/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html>
>>       (i915#2681 <https://gitlab.freedesktop.org/drm/intel/issues/2681>
>>       / i915#3591 <https://gitlab.freedesktop.org/drm/intel/issues/3591>)
>>       -> WARN
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb3/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html>
>>       (i915#2681 <https://gitlab.freedesktop.org/drm/intel/issues/2681>)
>>    -
>>
>>    igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:
>>    - shard-apl: FAIL
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-apl1/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html>
>>       (i915#4573 <https://gitlab.freedesktop.org/drm/intel/issues/4573>)
>>       -> DMESG-FAIL
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-apl3/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html>
>>       (IGT#6 <https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6>)
>>       +1 similar issue
>>    -
>>
>>    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>>    - shard-iclb: SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>>       (fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068>
>>       / i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>>       -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>>       +1 similar issue
>>    -
>>
>>    igt@kms_psr2_sf@plane-move-sf-dmg-area:
>>    - shard-iclb: SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html>
>>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>>       -> SKIP
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb6/igt@kms_psr2_sf@plane-move-sf-dmg-area.html>
>>       (fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068>
>>       / i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>>    -
>>
>>    igt@runner@aborted:
>>    - shard-apl: (FAIL
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-apl1/igt@runner@aborted.html>,
>>       FAIL
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-apl1/igt@runner@aborted.html>,
>>       FAIL
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-apl8/igt@runner@aborted.html>,
>>       FAIL
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-apl7/igt@runner@aborted.html>)
>>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>
>>       / i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180> /
>>       i915#3002 <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>>       i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
>>       -> (FAIL
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-apl3/igt@runner@aborted.html>,
>>       FAIL
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-apl3/igt@runner@aborted.html>,
>>       FAIL
>>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-apl3/igt@runner@aborted.html>)
>>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>
>>       / i915#3002 <https://gitlab.freedesktop.org/drm/intel/issues/3002>
>>       / i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
>>
>> {name}: This element is suppressed. This means it is ignored when
>> computing
>> the status of the difference (SUCCESS, WARNING, or FAILURE).
>> Build changes
>>
>>    - CI: CI-20190529 -> None
>>    - IGT: IGT_7068 -> IGTPW_8131
>>    - Piglit: piglit_4509 -> None
>>
>> CI-20190529: 20190529
>> CI_DRM_12401: d12a5aa62e6e1c4f36216441d45a94b8c81ea41b @ git://
>> anongit.freedesktop.org/gfx-ci/linux
>> IGTPW_8131:
>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/index.html
>> IGT_7068: 5c0ec905b6bbecfb8df8b8f3315d0470539e6ae3 @
>> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://
>> anongit.freedesktop.org/piglit
>>
>

--000000000000c6edc905edfce2bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Saix, the error looks irrelevant, can i get a rerun ple=
ase</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Mon, Nov 21, 2022 at 10:37 AM Mark Yacoub &lt;<a href=3D"mailto:marky=
acoub@chromium.org">markyacoub@chromium.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hello again, ca=
n i get a rerun :))</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Sat, Nov 19, 2022 at 5:07 AM Patchwork &lt;<a href=3D=
"mailto:patchwork@emeril.freedesktop.org" target=3D"_blank">patchwork@emeri=
l.freedesktop.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div>
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>Cv3 Workaround: Skip Plug all at init=
. (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/111037/" target=3D"_blank">https://patchwork.freedesktop.org/series/11=
1037/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_8131/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from CI_DRM_12401_full -&gt; IGTPW_8131_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8131_full absolutely need to b=
e<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_8131_full, please notify your bug team to allow them<=
br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
8131/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_8131/index.html</a></p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8131=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_module_load@reload-with-fault-injection:<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-snb5/igt@i915_module_load@reload-with-fault-=
injection.html" target=3D"_blank">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br>
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-rkl-4/igt@gem_ctx_persistence@heartbeat-hostile.html" t=
arget=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_8131/shard-rkl-3/igt@gem_ctx_persistence@heartbeat-hostile.h=
tml" target=3D"_blank">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-rkl-4/igt@i915_pm_backlight@fade.html" targe=
t=3D"_blank">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8131_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ccs@block-copy-inplace:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb5/igt@gem_ccs@block-copy-inplace.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3555" target=3D"_blank">i915#3555</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/5325" target=3D"_blank">i915#5325</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile-preempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-snb4/igt@gem_ctx_persistence@legacy-engines-=
hostile-preempt.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1099" target=3D=
"_blank">i915#1099</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb2/igt@gem_ctx_persistence@many-contexts.=
html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2410" target=3D"_blank">i915#2410</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html" tar=
get=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_8131/shard-iclb6/igt@gem_exec_balancer@parallel-contexts.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4525" target=3D"_blank">i915#4525</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-iclb3/igt@gem_exec_balancer@parallel-keep-in=
-fence.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/4525" target=3D"_blank">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-iclb8/igt@gem_exec_capture@capture-invisible@=
smem0.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/6334" target=3D"_blank">i915#6334</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-tglb2/igt@gem_exec_capture@capture-invisible@=
smem0.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/6334" target=3D"_blank">i915#6334</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-glk8/igt@gem_exec_fair@basic-none-share@rcs0.html" targ=
et=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_8131/shard-glk3/igt@gem_exec_fair@basic-none-share@rcs0.html" t=
arget=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2842" target=3D"_blank">i915#2842</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb5/igt@gem_lmem_swapping@parallel-random.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4613" target=3D"_blank">i915#4613</a>) +3 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-iclb6/igt@gem_lmem_swapping@parallel-random-=
engines.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/4613" target=3D"_blank">i915#4613</a>) +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-apl8/igt@gem_lmem_swapping@verify-random-ccs.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/4613" target=3D"_blank">i915#46=
13</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-glk8/igt@gem_lmem_swapping@verify-random-ccs.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/4613" target=3D"_blank">i915#46=
13</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb7/igt@gem_pxp@protected-encrypted-src-co=
py-not-readible.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/4270" target=3D"_blank">i915#4270</a>) +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-iclb2/igt@gem_pxp@verify-pxp-stale-buf-optou=
t-execution.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/4270" target=3D"_blank">i915#4270</a>) +1 sim=
ilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-iclb7/igt@gem_render_copy@yf-tiled-to-vebox-=
yf-tiled.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/768" target=3D"_blank">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-iclb3/igt@gem_userptr_blits@access-control.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3297" target=3D"_blank">i915#3297</a>) +2 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb3/igt@gem_userptr_blits@unsync-unmap-aft=
er-close.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3297" target=3D"_blank">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb2/igt@gen3_mixed_blits.html" target=3D"_=
blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109289" target=3D"_blank">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allowed:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-iclb5/igt@gen7_exec_parse@basic-allowed.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109289" target=3D"_blank">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-iclb3/igt@gen9_exec_parse@bb-start-out.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2856" target=3D"_blank">i915#2856</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb1/igt@gen9_exec_parse@shadow-peek.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2527" target=3D"_blank">i915#2527</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2856" target=3D"_blank">i915#2856</a>) =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html" target=3D"_blank">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_813=
1/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html" target=3D"_blank">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3989" target=3D"_bl=
ank">i915#3989</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/454" target=3D"_blank">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-devices:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-snb5/igt@i915_pm_rpm@system-suspend-devices.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +174 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@engine-order:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-apl7/igt@i915_pm_rps@engine-order.html" targ=
et=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/6537" target=3D"_blank">i915#6537</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb3/igt@i915_query@test-query-geometry-sub=
slices.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/5723" target=3D"_blank">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-tglb3/igt@i915_selftest@live@hangcheck.html" target=3D"=
_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_8131/shard-tglb5/igt@i915_selftest@live@hangcheck.html" target=3D"_bl=
ank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/5591" target=3D"_blank">i915#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-snb5/igt@i915_selftest@live@sanitycheck.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_8131/shard-snb7/igt@i915_selftest@live@sanitycheck.html" target=3D"_=
blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271" target=3D"_blank">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-tglb5/igt@kms_big_fb@4-tiled-max-hw-stride-64=
bpp-rotate-0.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/5286" target=3D"_blank">i915#5286</a>) +3 si=
milar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-iclb1/igt@kms_big_fb@4-tiled-max-hw-stride-64=
bpp-rotate-0.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/5286" target=3D"_blank">i915#5286</a>) +3 si=
milar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-iclb5/igt@kms_big_fb@linear-64bpp-rotate-90.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D110725" target=3D"_blank">fdo#110725</a> / <a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D111614" target=3D"_blank">fdo#11=
1614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb6/igt@kms_big_fb@linear-8bpp-rotate-270.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111614" target=3D"_blank">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb7/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-0-async-flip.html" target=3D"_blank">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D111615" target=3D"_blank">fdo#11=
1615</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-iclb2/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-0-async-flip.html" target=3D"_blank">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D110723" target=3D"_blank">fdo#11=
0723</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb3/igt@kms_ccs@pipe-a-bad-pixel-format-4_=
tiled_dg2_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/6095" target=3D"_blank">i915#6095</a>) +=
5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-iclb8/igt@kms_ccs@pipe-a-bad-rotation-90-y_ti=
led_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109278" target=3D"_blank">fdo#109278</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" target=
=3D"_blank">i915#3886</a>) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-tglb6/igt@kms_ccs@pipe-a-bad-rotation-90-y_ti=
led_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/3689" target=3D"_blank">i915#3689</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" target=3D"=
_blank">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-apl7/igt@kms_ccs@pipe-a-crc-primary-rotation-=
180-4_tiled_dg2_rc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#10927=
1</a>) +146 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-tglb7/igt@kms_ccs@pipe-a-crc-primary-rotation=
-180-4_tiled_dg2_rc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/3689" target=3D"_blank">i915#3689=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6095" tar=
get=3D"_blank">i915#6095</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-apl6/igt@kms_ccs@pipe-b-missing-ccs-buffer-y=
_tiled_gen12_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#10927=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" ta=
rget=3D"_blank">i915#3886</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-glk6/igt@kms_ccs@pipe-c-bad-rotation-90-y_ti=
led_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" target=
=3D"_blank">i915#3886</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-iclb3/igt@kms_ccs@pipe-d-crc-sprite-planes-b=
asic-y_tiled_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109278" target=3D"_blank">fdo#109278</a>)=
 +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb3/igt@kms_ccs@pipe-d-crc-sprite-planes-b=
asic-yf_tiled_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D111615" target=3D"_blank">fdo#111615</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3689" target=
=3D"_blank">i915#3689</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb8/igt@kms_ccs@pipe-d-random-ccs-data-y_t=
iled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/3689" target=3D"_blank">i915#3689</a>) =
+4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-glk9/igt@kms_chamelium@dp-hpd-for-each-pipe.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#11=
1827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm-disable:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-tglb5/igt@kms_chamelium@hdmi-hpd-storm-disabl=
e.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109284" target=3D"_blank">fdo#109284</a> / <a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#=
111827</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-iclb5/igt@kms_chamelium@hdmi-hpd-storm-disabl=
e.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109284" target=3D"_blank">fdo#109284</a> / <a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#=
111827</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-frame-dump:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-apl2/igt@kms_chamelium@vga-frame-dump.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</=
a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-after-suspend:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-snb2/igt@kms_chamelium@vga-hpd-after-suspend=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#1=
11827</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-iclb1/igt@kms_content_protection@atomic.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/7118" target=3D"_blank">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-tglb5/igt@kms_content_protection@dp-mst-type-=
0.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3116" target=3D"_blank">i915#3116</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/3299" target=3D"_blank">i915#32=
99</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-iclb5/igt@kms_content_protection@dp-mst-type-=
0.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3116" target=3D"_blank">i915#3116</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-apl3/igt@kms_content_protection@legacy@pipe-=
a-dp-1.html" target=3D"_blank">TIMEOUT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/7173" target=3D"_blank">i915#7173</a>) +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb6/igt@kms_content_protection@srm.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/7118" target=3D"_blank">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb5/igt@kms_cursor_legacy@2x-flip-vs-curso=
r-atomic.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109274" target=3D"_blank">fdo#109274</a> / <a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825" target=3D"_blan=
k">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-iclb6/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/4103" target=3D"_blank">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb6/igt@kms_display_modes@extended-mode-ba=
sic.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109274" target=3D"_blank">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-iclb5/igt@kms_dsc@dsc-with-bpc.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3840" target=3D"_blank">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb6/igt@kms_flip@2x-nonexisting-fb.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109274" target=3D"_blank">fdo#109274</a> / <a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D111825" target=3D"_blank">fdo#111825</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3637" target=
=3D"_blank">i915#3637</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-iclb1/igt@kms_flip@2x-plain-flip-fb-recreate=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109274" target=3D"_blank">fdo#109274</a>) +6 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb1/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html" target=3D"_blank">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587" ta=
rget=3D"_blank">i915#2587</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2672" target=3D"_blank">i915#2672</a>) +2 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-glk2/igt@kms_flip_scaled_crc@flip-64bpp-yftil=
e-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html" target=3D"_blank">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271" targ=
et=3D"_blank">fdo#109271</a>) +107 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-iclb6/igt@kms_flip_scaled_crc@flip-64bpp-yfti=
le-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html" target=3D"_blank">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587" targ=
et=3D"_blank">i915#2587</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2672" target=3D"_blank">i915#2672</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html" target=3D"_blank">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672" t=
arget=3D"_blank">i915#2672</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-primscrn-cur-indfb-draw-blt.html" target=3D"_blank">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/6497" target=3D"_blank">i915=
#6497</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-indfb-pgflip-blt.html" target=3D"_blank">SKIP</a> (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109280" target=3D"_blank">fdo#1=
09280</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb7/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-cur-indfb-draw-pwrite.html" target=3D"_blank">SKIP</a> (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109280" target=3D"_blank">fdo=
#109280</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
825" target=3D"_blank">fdo#111825</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb6/igt@kms_hdr@bpc-switch-dpms.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3555" target=3D"_blank">i915#3555</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-iclb3/igt@kms_hdr@static-toggle-suspend.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/3555" target=3D"_blank">i915#3555</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb2/igt@kms_multipipe_modeset@basic-max-pi=
pe-crc-check.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1839" target=3D"_blank">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-apl7/igt@kms_plane_alpha_blend@alpha-transpa=
rent-fb@pipe-c-dp-1.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/4573" target=3D"_blank">i915#4573</a>=
) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-c-edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb7/igt@kms_plane_lowres@tiling-none@pipe-=
c-edp-1.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3536" target=3D"_blank">i915#3536</a>) +3 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb5/igt@kms_plane_lowres@tiling-yf.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D112054" target=3D"_blank">fdo#112054</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/5288" target=3D"_blank">i915#5288</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-iclb7/igt@kms_plane_lowres@tiling-yf@pipe-b-=
edp-1.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3536" target=3D"_blank">i915#3536</a>) +5 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-e=
dp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb8/igt@kms_plane_scaling@plane-downscale-=
with-rotation-factor-0-25@pipe-c-edp-1.html" target=3D"_blank">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176" target=3D"_b=
lank">i915#5176</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-iclb1/igt@kms_plane_scaling@plane-scaler-with-clipping-=
clamping-pixel-formats@pipe-b-edp-1.html" target=3D"_blank">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb3/=
igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pip=
e-b-edp-1.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/5176" target=3D"_blank">i915#5176</a>) +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
c-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-iclb6/igt@kms_plane_scaling@plane-scaler-wit=
h-clipping-clamping-rotation@pipe-c-edp-1.html" target=3D"_blank">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176" target=3D=
"_blank">i915#5176</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-tglb6/igt@kms_prime@d3hot.html" target=3D"_bl=
ank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
524" target=3D"_blank">i915#6524</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-iclb6/igt@kms_prime@d3hot.html" target=3D"_bl=
ank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
524" target=3D"_blank">i915#6524</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb3/igt@kms_psr2_sf@cursor-plane-update-sf=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2920" target=3D"_blank">i915#2920</a>) +1 similar issue<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-iclb5/igt@kms_psr2_sf@overlay-plane-move-cont=
inuous-exceed-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/658" target=3D"_blank">i915#658</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-apl7/igt@kms_psr2_sf@overlay-plane-move-conti=
nuous-exceed-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"=
_blank">i915#658</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-tglb5/igt@kms_psr2_su@page_flip-nv12.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/7037" target=3D"_blank">i915#7037</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-glk8/igt@kms_psr2_su@page_flip-nv12.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/658" target=3D"_blank">i915#658</a>) +2 =
similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-iclb8/igt@kms_psr2_su@page_flip-nv12.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109642" target=3D"_blank">fdo#109642</a> / <a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D111068" target=3D"_blank">fdo#111068</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=
=3D"_blank">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html" target=3D"=
_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_8131/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_cpu.html" target=3D"_bl=
ank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9441" target=3D"_blank">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-tglb5/igt@kms_psr@psr2_sprite_mmap_cpu.html" =
target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/132" target=3D"_blank">i915#132</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/3467" target=3D"_blank">i915#3467</a>)</p=
>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_cpu.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109441" target=3D"_blank">fdo#109441</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb7/igt@kms_rotation_crc@primary-yf-tiled-=
reflect-x-90.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D111615" target=3D"_blank">fdo#111615</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5289" target=3D"_b=
lank">i915#5289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-apl3/igt@kms_writeback@writeback-invalid-para=
meters.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2437" target=3D"_blank"=
>i915#2437</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-iclb5/igt@kms_writeback@writeback-invalid-par=
ameters.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2437" target=3D"_blank">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-iclb2/igt@perf_pmu@event-wait@rcs0.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D112283" target=3D"_blank">fdo#112283</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-tglb8/igt@perf_pmu@event-wait@rcs0.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D112283" target=3D"_blank">fdo#112283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_udl:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-tglb5/igt@prime_udl.html" target=3D"_blank">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291"=
 target=3D"_blank">fdo#109291</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-0:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-apl1/igt@sysfs_clients@fair-0.html" target=3D=
"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2994" target=3D"_blank">i915#2994</a>) +2 sim=
ilar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-tglb8/igt@sysfs_clients@fair-0.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2994" target=3D"_blank">i915#2994</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8131/shard-glk7/igt@sysfs_clients@fair-0.html" target=3D=
"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2994" target=3D"_blank">i915#2994</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-iclb8/igt@sysfs_clients@split-10.html" targe=
t=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2994" target=3D"_blank">i915#2994</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-rkl-2/igt@feature_discovery@psr2.html" target=3D"_blank=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658"=
 target=3D"_blank">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_8131/shard-rkl-6/igt@feature_discovery@psr2.html" tar=
get=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-iclb1/igt@gem_ctx_persistence@smoketest.html" target=3D=
"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/5099" target=3D"_blank">i915#5099</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb3/igt@gem_ctx_persistence@smo=
ketest.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-iclb6/igt@gem_exec_balancer@parallel-bb-first.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4525" target=3D"_blank">i915#4525</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb1/igt@gem_exec_balancer=
@parallel-bb-first.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@vcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-iclb5/igt@gem_exec_capture@pi@vcs0.html" target=3D"_bla=
nk">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/3371" target=3D"_blank">i915#3371</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb6/igt@gem_exec_capture@pi@vc=
s0.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-read:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-rkl-4/igt@gem_exec_reloc@basic-cpu-read.html" target=3D=
"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3281" target=3D"_blank">i915#3281</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-5/igt@gem_exec_reloc@basic-cp=
u-read.html" target=3D"_blank">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@set-cache-level:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-rkl-5/igt@gem_mmap_wc@set-cache-level.html" target=3D"_=
blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1850" target=3D"_blank">i915#1850</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-6/igt@gem_mmap_wc@set-cache-lev=
el.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctxn:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-rkl-5/igt@gem_ppgtt@blt-vs-render-ctxn.html" target=3D"=
_blank">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3692" target=3D"_blank">i915#3692</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-1/igt@gem_ppgtt@blt-vs-r=
ender-ctxn.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@flink-and-close-vma-leak:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html" targe=
t=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/7409" target=3D"_blank">i915#7409</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-glk2/igt@gem_ppgtt@flink-and-=
close-vma-leak.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pwrite_snooped:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-rkl-4/igt@gem_pwrite_snooped.html" target=3D"_blank">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3282" ta=
rget=3D"_blank">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-rkl-5/igt@gem_pwrite_snooped.html" target=3D=
"_blank">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-rkl-1/igt@gen9_exec_parse@unaligned-access.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2527" target=3D"_blank">i915#2527</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-5/igt@gen9_exec_parse@unal=
igned-access.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@drm-resources-equal:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-rkl-2/igt@i915_pm_rpm@drm-resources-equal.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109308" target=3D"_blank">fdo#109308</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-6/igt@i915_pm_rpm@drm-re=
sources-equal.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-rkl-5/igt@i915_pm_rpm@fences.html" target=3D"_blank">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849" ta=
rget=3D"_blank">i915#1849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-rkl-6/igt@i915_pm_rpm@fences.html" target=3D=
"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-rkl-1/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12=
_rc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1845" target=3D"_blank">i915#1845</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098" target=3D"_blank"=
>i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_8131/shard-rkl-6/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_=
ccs.html" target=3D"_blank">PASS</a> +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p=
>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-trans=
itions-varying-size.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2346" target=3D"_blank">i915#2346</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shar=
d-tglb7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-siz=
e.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-c:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-rkl-5/igt@kms_cursor_legacy@torture-bo@pipe-c.html" tar=
get=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/7396" target=3D"_blank">i915#7396</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-5/igt@kms_cursor_=
legacy@torture-bo@pipe-c.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-rkl-2/igt@kms_dp_aux_dev.html" target=3D"_blank">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1257" target=
=3D"_blank">i915#1257</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_8131/shard-rkl-6/igt@kms_dp_aux_dev.html" target=3D"_blank"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-tglb3/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1=
.html" target=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2411" target=3D"_blank">i915#2411</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2867" target=3D"_blank">i9=
15#2867</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_8131/shard-tglb3/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html" =
target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-apl1/igt@kms_flip@flip-vs-suspend@b-dp1.html" target=3D=
"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/180" target=3D"_blank">i915#180</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-apl6/igt@kms_flip@flip-vs-sus=
pend@b-dp1.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-=
shrfb-draw-pwrite.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1849" target=3D"_blank">i915#1849</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098" target=3D=
"_blank">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_8131/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-=
pri-shrfb-draw-pwrite.html" target=3D"_blank">PASS</a> +8 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html" target=3D"=
_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/433" target=3D"_blank">i915#433</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_8131/shard-tglb8/igt@kms_hdmi_inject@inject-aud=
io.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right@pipe-a-planes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-rkl-4/igt@kms_plane@plane-panning-bottom-right@pipe-a-p=
lanes.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3558" target=3D"_blank">i915#3558</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-6/igt@km=
s_plane@plane-panning-bottom-right@pipe-a-planes.html" target=3D"_blank">PA=
SS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-a-planes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-rkl-2/igt@kms_plane@plane-position-covered@pipe-a-plane=
s.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1849" target=3D"_blank">i915#1849</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/3558" target=3D"_blank">i915#35=
58</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_813=
1/shard-rkl-6/igt@kms_plane@plane-position-covered@pipe-a-planes.html" targ=
et=3D"_blank">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html" target=3D=
"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109441" target=3D"_blank">fdo#109441</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb2/igt@kms_psr@psr2_primary=
_mmap_cpu.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-rkl-2/igt@kms_psr@sprite_plane_onoff.html" target=3D"_b=
lank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1072" target=3D"_blank">i915#1072</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-6/igt@kms_psr@sprite_plane_onoff=
.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-iclb5/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/5519" target=3D"_blank">i915#5519</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb1/igt@k=
ms_psr_stress_test@flip-primary-invalidate-overlay.html" target=3D"_blank">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-b-sanity:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-rkl-1/igt@kms_universal_plane@universal-plane-pipe-b-sa=
nity.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/1845" target=3D"_blank">i915#1845</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/4070" target=3D"_blank">i915=
#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098=
" target=3D"_blank">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_8131/shard-rkl-6/igt@kms_universal_plane@universal-=
plane-pipe-b-sanity.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2436" target=3D"_blank">i915#2436</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-rkl-5/igt@perf@gen8-=
unprivileged-single-ctx-counters.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-glk7/igt@perf@stress-open-close.html" target=3D"_blank"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5213" target=3D"_blank">i915#5213</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_8131/shard-glk6/igt@perf@stress-open-close.htm=
l" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@vcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-tglb1/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html"=
 target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/6015" target=3D"_blank">i915#6015</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb7/igt@sysfs_heartbe=
at_interval@nopreempt@vcs0.html" target=3D"_blank">PASS</a> +4 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-rkl-5/igt@testdisplay.html" target=3D"_blank">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098" target=3D=
"_blank">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_8131/shard-rkl-6/igt@testdisplay.html" target=3D"_blank">PASS<=
/a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4525" target=3D"_blank">i915#4525</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb2/igt@gem_exec_balancer=
@parallel-ordering.html" target=3D"_blank">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/6117" target=3D"_blank">i915#6117</a>)=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html" tar=
get=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2842" target=3D"_blank">i915#2842</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb1/igt@gem_exec_fair@bas=
ic-none-share@rcs0.html" target=3D"_blank">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2848" target=3D"_blank">i915#2848</a>)=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-tglb1/igt@gem_exec_fair@basic-pace@vcs1.html" target=3D=
"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2848" target=3D"_blank">i915#2848</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tglb8/igt@gem_exec_fair@basic-pac=
e@vcs1.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2842" target=3D"_blank">i915#2842</a>) +5 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12401/shard-apl2/igt@gem_pread@exhaustion.html" target=3D"_blank">WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658" ta=
rget=3D"_blank">i915#2658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8131/shard-apl2/igt@gem_pread@exhaustion.html" target=
=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/7248" target=3D"_blank">i915#7248</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12401/shard-tglb3/igt@gem_pread@exhaustion.html" target=3D"_blank">W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658" t=
arget=3D"_blank">i915#2658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_8131/shard-tglb3/igt@gem_pread@exhaustion.html" target=
=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/7248" target=3D"_blank">i915#7248</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-glk6/igt@gem_pwrite@basic-exhaustion.html" target=3D"_b=
lank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/7248" target=3D"_blank">i915#7248</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-glk9/igt@gem_pwrite@basic-exha=
ustion.html" target=3D"_blank">WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2658" target=3D"_blank">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-tglb1/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html" tar=
get=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2681" target=3D"_blank">i915#2681</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3591" target=3D"_blank">i915#3591</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-tgl=
b3/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html" target=3D"_blank">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681" target=
=3D"_blank">i915#2681</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-apl1/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.=
html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4573" target=3D"_blank">i915#4573</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-apl3/igt@kms_plane=
_alpha_blend@alpha-basic@pipe-c-dp-1.html" target=3D"_blank">DMESG-FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6" tar=
get=3D"_blank">IGT#6</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111068" target=3D"_blank">fdo#111068</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_blank">i915#658=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/=
shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2920" target=3D"_blank">i915#2920</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12401/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2920" target=3D"_blank">i915#2920</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-iclb6/igt@kms_psr2_sf@plane-=
move-sf-dmg-area.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D111068" target=3D"_blank">fdo#111068</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=3D=
"_blank">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12401/shard-apl1/igt@runner@aborted.html" target=3D"_blank">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-=
apl1/igt@runner@aborted.html" target=3D"_blank">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12401/shard-apl8/igt@runner@abort=
ed.html" target=3D"_blank">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_12401/shard-apl7/igt@runner@aborted.html" target=3D"_b=
lank">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/180" target=3D"_blank">i915#180</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/3002" target=3D"_blank">i9=
15#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/43=
12" target=3D"_blank">i915#4312</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_8131/shard-apl3/igt@runner@aborted.html" target=
=3D"_blank">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_8131/shard-apl3/igt@runner@aborted.html" target=3D"_blank">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8131/shard-apl3/ig=
t@runner@aborted.html" target=3D"_blank">FAIL</a>) (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002" target=
=3D"_blank">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4312" target=3D"_blank">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br>
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7068 -&gt; IGTPW_8131</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br>
  CI_DRM_12401: d12a5aa62e6e1c4f36216441d45a94b8c81ea41b @ git://<a href=3D=
"http://anongit.freedesktop.org/gfx-ci/linux" target=3D"_blank">anongit.fre=
edesktop.org/gfx-ci/linux</a><br>
  IGTPW_8131: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_813=
1/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_8131/index.html</a><br>
  IGT_7068: 5c0ec905b6bbecfb8df8b8f3315d0470539e6ae3 @ <a href=3D"https://g=
itlab.freedesktop.org/drm/igt-gpu-tools.git" target=3D"_blank">https://gitl=
ab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://<a href=3D"=
http://anongit.freedesktop.org/piglit" target=3D"_blank">anongit.freedeskto=
p.org/piglit</a></p>

</div>

</div></blockquote></div>
</blockquote></div>

--000000000000c6edc905edfce2bd--
