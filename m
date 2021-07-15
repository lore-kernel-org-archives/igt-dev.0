Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B7A6E843
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jul 2021 17:11:59 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id b40so9872390ljf.12
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jul 2021 10:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210624173525.1526215-1-markyacoub@chromium.org>
 <162636724254.18697.12748823948466372366@emeril.freedesktop.org>
In-Reply-To: <162636724254.18697.12748823948466372366@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 15 Jul 2021 13:11:47 -0400
Message-ID: <CAJUqKUrE-nKiF6Aoe-_Dhx4bUh4Jv88iqa_kyxwHMaF9hwq_+g@mail.gmail.com>
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
	=?utf-8?q?kms=5Fvblank=3A_Turn_on_hardware_before_testing_invalid_?=
	=?utf-8?q?vblank=2E_=28rev9=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1480324588=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1480324588==
Content-Type: multipart/alternative; boundary="0000000000008d187105c72c9131"

--0000000000008d187105c72c9131
Content-Type: text/plain; charset="UTF-8"

Hi, regressions look like false positives. Thanks!

On Thu, Jul 15, 2021 at 12:40 PM Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* tests/kms_vblank: Turn on hardware before testing invalid
> vblank. (rev9)
> *URL:* https://patchwork.freedesktop.org/series/90382/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/index.html CI
> Bug Log - changes from IGT_6140_full -> IGTPW_6024_full Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_6024_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_6024_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/index.html
> Possible new issues
>
> Here are the unknown changes that may have been introduced in
> IGTPW_6024_full:
> IGT changes Possible regressions
>
>    -
>
>    igt@gem_exec_schedule@independent@vecs0:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb3/igt@gem_exec_schedule@independent@vecs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb3/igt@gem_exec_schedule@independent@vecs0.html>
>    -
>
>    igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb3/igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant.html>
>
> Known issues
>
> Here are the changes found in IGTPW_6024_full that come from known issues:
> IGT changes Issues hit
>
>    -
>
>    igt@gem_ctx_persistence@legacy-engines-hostile@bsd2:
>    - shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb2/igt@gem_ctx_persistence@legacy-engines-hostile@bsd2.html>
>       ([i915#2410])
>    -
>
>    igt@gem_ctx_persistence@legacy-engines-queued:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-snb5/igt@gem_ctx_persistence@legacy-engines-queued.html>
>       ([fdo#109271] / [i915#1099]) +5 similar issues
>    -
>
>    igt@gem_eio@in-flight-contexts-10ms:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb7/igt@gem_eio@in-flight-contexts-10ms.html>
>       -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb7/igt@gem_eio@in-flight-contexts-10ms.html>
>       ([i915#3063])
>    -
>
>    igt@gem_eio@unwedge-stress:
>    - shard-snb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-snb6/igt@gem_eio@unwedge-stress.html>
>       ([i915#3354])
>    -
>
>    igt@gem_exec_fair@basic-deadline:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl7/igt@gem_exec_fair@basic-deadline.html>
>       ([i915#2846])
>    -
>
>    igt@gem_exec_fair@basic-none@rcs0:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk1/igt@gem_exec_fair@basic-none@rcs0.html>
>       ([i915#2842])
>    -
>
>    igt@gem_exec_fair@basic-none@vcs1:
>    - shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html>
>       ([i915#2842])
>    -
>
>    igt@gem_exec_fair@basic-pace@vcs0:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs0.html>
>       ([i915#2842])
>    -
>
>    igt@gem_exec_reloc@basic-parallel:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb3/igt@gem_exec_reloc@basic-parallel.html>
>       -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@gem_exec_reloc@basic-parallel.html>
>       ([i915#3737] / [i915#3779])
>    -
>
>    igt@gem_exec_reloc@basic-wide-active@bcs0:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl8/igt@gem_exec_reloc@basic-wide-active@bcs0.html>
>       ([i915#3633]) +3 similar issues
>    -
>
>    igt@gem_exec_reloc@basic-wide-active@vcs1:
>    - shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html>
>       ([i915#3633])
>    -
>
>    igt@gem_huc_copy@huc-copy:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl7/igt@gem_huc_copy@huc-copy.html>
>       ([fdo#109271] / [i915#2190])
>    -
>
>    igt@gem_pread@exhaustion:
>    -
>
>       shard-apl: NOTRUN -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl3/igt@gem_pread@exhaustion.html>
>       ([i915#2658])
>       -
>
>       shard-snb: NOTRUN -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-snb5/igt@gem_pread@exhaustion.html>
>       ([i915#2658])
>       -
>
>    igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
>    -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk9/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html>
>       ([fdo#109271]) +55 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html>
>       ([i915#768])
>       -
>
>    igt@gem_softpin@evict-snoop-interruptible:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb5/igt@gem_softpin@evict-snoop-interruptible.html>
>       ([fdo#109312])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb8/igt@gem_softpin@evict-snoop-interruptible.html>
>       ([fdo#109312])
>       -
>
>    igt@gem_userptr_blits@input-checking:
>    - shard-snb: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-snb2/igt@gem_userptr_blits@input-checking.html>
>       ([i915#3002])
>    -
>
>    igt@gem_userptr_blits@unsync-unmap:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb2/igt@gem_userptr_blits@unsync-unmap.html>
>       ([i915#3297])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb2/igt@gem_userptr_blits@unsync-unmap.html>
>       ([i915#3297])
>       -
>
>    igt@gen9_exec_parse@bb-start-cmd:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb6/igt@gen9_exec_parse@bb-start-cmd.html>
>       ([fdo#112306])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb6/igt@gen9_exec_parse@bb-start-cmd.html>
>       ([fdo#112306])
>       -
>
>    igt@i915_pm_dc@dc9-dpms:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb3/igt@i915_pm_dc@dc9-dpms.html>
>       ([i915#3288])
>       -
>
>       shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html>
>       ([i915#3343])
>       -
>
>    igt@i915_pm_rc6_residency@rc6-idle:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb3/igt@i915_pm_rc6_residency@rc6-idle.html>
>       -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb5/igt@i915_pm_rc6_residency@rc6-idle.html>
>       ([i915#2681] / [i915#2684])
>    -
>
>    igt@i915_pm_rpm@modeset-non-lpsp-stress:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html>
>       ([fdo#111644] / [i915#1397] / [i915#2411])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html>
>       ([fdo#110892])
>       -
>
>    igt@i915_pm_rpm@system-suspend-modeset:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl2/igt@i915_pm_rpm@system-suspend-modeset.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl2/igt@i915_pm_rpm@system-suspend-modeset.html>
>       ([i915#151] / [i915#155])
>    -
>
>    igt@i915_selftest@live@gt_heartbeat:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb6/igt@i915_selftest@live@gt_heartbeat.html>
>       -> DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb5/igt@i915_selftest@live@gt_heartbeat.html>
>       ([i915#3768])
>    -
>
>    igt@kms_big_fb@linear-16bpp-rotate-90:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@kms_big_fb@linear-16bpp-rotate-90.html>
>       ([fdo#110725] / [fdo#111614]) +1 similar issue
>    -
>
>    igt@kms_big_fb@linear-32bpp-rotate-0:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-0.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-0.html>
>       ([i915#118] / [i915#95]) +1 similar issue
>    -
>
>    igt@kms_big_fb@linear-8bpp-rotate-90:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@kms_big_fb@linear-8bpp-rotate-90.html>
>       ([fdo#111614]) +2 similar issues
>    -
>
>    igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>       ([fdo#109271] / [i915#3777])
>    -
>
>    igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb5/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html>
>       ([fdo#111615]) +2 similar issues
>    -
>
>    igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html>
>       ([fdo#109271]) +250 similar issues
>    -
>
>    igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>       ([fdo#110723])
>    -
>
>    igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-snb6/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs.html>
>       ([fdo#109271]) +365 similar issues
>    -
>
>    igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb7/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html>
>       ([i915#3689]) +10 similar issues
>    -
>
>    igt@kms_chamelium@vga-hpd:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl2/igt@kms_chamelium@vga-hpd.html>
>       ([fdo#109271] / [fdo#111827]) +22 similar issues
>    -
>
>    igt@kms_chamelium@vga-hpd-for-each-pipe:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl2/igt@kms_chamelium@vga-hpd-for-each-pipe.html>
>       ([fdo#109271] / [fdo#111827]) +8 similar issues
>    -
>
>    igt@kms_color@pipe-d-ctm-green-to-red:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@kms_color@pipe-d-ctm-green-to-red.html>
>       ([fdo#109278] / [i915#1149])
>    -
>
>    igt@kms_color_chamelium@pipe-b-ctm-0-5:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb2/igt@kms_color_chamelium@pipe-b-ctm-0-5.html>
>       ([fdo#109284] / [fdo#111827]) +9 similar issues
>    -
>
>    igt@kms_color_chamelium@pipe-c-ctm-0-5:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb7/igt@kms_color_chamelium@pipe-c-ctm-0-5.html>
>       ([fdo#109284] / [fdo#111827]) +5 similar issues
>    -
>
>    igt@kms_color_chamelium@pipe-d-degamma:
>    -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk8/igt@kms_color_chamelium@pipe-d-degamma.html>
>       ([fdo#109271] / [fdo#111827]) +7 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@kms_color_chamelium@pipe-d-degamma.html>
>       ([fdo#109278] / [fdo#109284] / [fdo#111827])
>       -
>
>    igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-snb6/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html>
>       ([fdo#109271] / [fdo#111827]) +15 similar issues
>    -
>
>    igt@kms_content_protection@lic:
>    - shard-apl: NOTRUN -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl2/igt@kms_content_protection@lic.html>
>       ([i915#1319])
>    -
>
>    igt@kms_content_protection@uevent:
>    -
>
>       shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl7/igt@kms_content_protection@uevent.html>
>       ([i915#2105])
>       -
>
>       shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl7/igt@kms_content_protection@uevent.html>
>       ([i915#2105])
>       -
>
>    igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding.html>
>       ([i915#3319]) +1 similar issue
>    -
>
>    igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html>
>       ([fdo#109278]) +16 similar issues
>    -
>
>    igt@kms_cursor_crc@pipe-d-cursor-max-size-offscreen:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-max-size-offscreen.html>
>       ([i915#3359])
>    -
>
>    igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html>
>       ([fdo#109274] / [fdo#109278]) +2 similar issues
>    -
>
>    igt@kms_dp_dsc@basic-dsc-enable-edp:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html>
>       ([fdo#109349])
>    -
>
>    igt@kms_dp_tiled_display@basic-test-pattern:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb2/igt@kms_dp_tiled_display@basic-test-pattern.html>
>       ([i915#426])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb2/igt@kms_dp_tiled_display@basic-test-pattern.html>
>       ([i915#426])
>       -
>
>    igt@kms_flip@2x-flip-vs-dpms:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb7/igt@kms_flip@2x-flip-vs-dpms.html>
>       ([fdo#109274]) +5 similar issues
>    -
>
>    igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html>
>       ([i915#180]) +5 similar issues
>    -
>
>    igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html>
>       ([i915#180]) +4 similar issues
>    -
>
>    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html>
>       ([fdo#109271] / [i915#2672]) +1 similar issue
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html>
>       ([fdo#109280]) +15 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html>
>       ([fdo#109271]) +91 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html>
>       ([fdo#111825]) +22 similar issues
>    -
>
>    igt@kms_hdr@bpc-switch-suspend:
>    - shard-apl: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl8/igt@kms_hdr@bpc-switch-suspend.html>
>       ([i915#180])
>    -
>
>    igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb5/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html>
>       ([fdo#109289]) +1 similar issue
>    -
>
>    igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html>
>       ([fdo#108145] / [i915#265]) +2 similar issues
>    -
>
>    igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
>    - shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk8/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html>
>       ([fdo#108145] / [i915#265])
>    -
>
>    igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html>
>       ([i915#265]) +2 similar issues
>    -
>
>    igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-iclb7/igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb2/igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant.html>
>       ([fdo#109278])
>    -
>
>    igt@kms_plane_lowres@pipe-b-tiling-none:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb6/igt@kms_plane_lowres@pipe-b-tiling-none.html>
>       ([i915#3536])
>    -
>
>    igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html>
>       ([fdo#112054])
>    -
>
>    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html>
>       ([fdo#109271] / [i915#658]) +5 similar issues
>    -
>
>    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
>    -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html>
>       ([fdo#109271] / [i915#658]) +3 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html>
>       ([i915#2920])
>       -
>
>    igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html>
>       ([i915#2920]) +2 similar issues
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk9/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html>
>       ([fdo#109271] / [i915#658]) +2 similar issues
>       -
>
>    igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html>
>       ([i915#658]) +1 similar issue
>    -
>
>    igt@kms_psr2_su@page_flip:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb6/igt@kms_psr2_su@page_flip.html>
>       ([fdo#109642] / [fdo#111068] / [i915#658])
>    -
>
>    igt@kms_psr@psr2_cursor_render:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-iclb2/igt@kms_psr@psr2_cursor_render.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@kms_psr@psr2_cursor_render.html>
>       ([fdo#109441])
>    -
>
>    igt@kms_psr@psr2_primary_mmap_gtt:
>    - shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@kms_psr@psr2_primary_mmap_gtt.html>
>       ([i915#132] / [i915#3467])
>    -
>
>    igt@kms_setmode@basic:
>    - shard-snb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-snb5/igt@kms_setmode@basic.html>
>       ([i915#31])
>    -
>
>    igt@kms_vblank@pipe-d-wait-idle:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl3/igt@kms_vblank@pipe-d-wait-idle.html>
>       ([fdo#109271] / [i915#533]) +1 similar issue
>    -
>
>    igt@nouveau_crc@pipe-a-source-rg:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb5/igt@nouveau_crc@pipe-a-source-rg.html>
>       ([i915#2530]) +1 similar issue
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb6/igt@nouveau_crc@pipe-a-source-rg.html>
>       ([i915#2530]) +2 similar issues
>       -
>
>    igt@nouveau_crc@pipe-d-source-outp-complete:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@nouveau_crc@pipe-d-source-outp-complete.html>
>       ([fdo#109278] / [i915#2530])
>    -
>
>    igt@perf@per-context-mode-unprivileged:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb6/igt@perf@per-context-mode-unprivileged.html>
>       ([fdo#109289]) +1 similar issue
>    -
>
>    igt@perf_pmu@event-wait@rcs0:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@perf_pmu@event-wait@rcs0.html>
>       ([fdo#112283])
>    -
>
>    igt@prime_vgem@fence-write-hang:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb1/igt@prime_vgem@fence-write-hang.html>
>       ([fdo#109295])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@prime_vgem@fence-write-hang.html>
>       ([fdo#109295])
>       -
>
>    igt@sysfs_clients@fair-1:
>    -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk1/igt@sysfs_clients@fair-1.html>
>       ([fdo#109271] / [i915#2994]) +2 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@sysfs_clients@fair-1.html>
>       ([i915#2994]) +2 similar issues
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb3/igt@sysfs_clients@fair-1.html>
>       ([i915#2994]) +2 similar issues
>       -
>
>    igt@sysfs_clients@fair-7:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl3/igt@sysfs_clients@fair-7.html>
>       ([fdo#109271] / [i915#2994]) +5 similar issues
>    -
>
>    igt@sysfs_clients@sema-25:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl2/igt@sysfs_clients@sema-25.html>
>       ([fdo#109271] / [i915#2994]) +2 similar issues
>
> Possible fixes
>
>    -
>
>    igt@gem_eio@in-flight-contexts-1us:
>    - shard-tglb: TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb1/igt@gem_eio@in-flight-contexts-1us.html>
>       ([i915#3063]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@gem_eio@in-flight-contexts-1us.html>
>    -
>
>    igt@gem_eio@in-flight-suspend:
>    - shard-kbl: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl2/igt@gem_eio@in-flight-suspend.html>
>       ([i915#180]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl4/igt@gem_eio@in-flight-suspend.html>
>    -
>
>    igt@gem_exec_fair@basic-none-solo@rcs0:
>    - shard-kbl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl4/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>       ([i915#2842]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl2/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>    -
>
>    igt@gem_exec_fair@basic-pace-share@rcs0:
>    - shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>       ([i915#2842]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>       +1 similar issue
>    -
>
>    igt@gem_exec_fair@basic-pace@vecs0:
>    - shard-kbl: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html>
>       ([fdo#109271]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html>
>       +1 similar issue
>    -
>
>    igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk1/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html>
>       ([i915#307] / [i915#3468]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk7/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html>
>    -
>
>    igt@i915_pm_dc@dc6-psr:
>    - shard-iclb: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-iclb7/igt@i915_pm_dc@dc6-psr.html>
>       ([i915#3698]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@i915_pm_dc@dc6-psr.html>
>       +1 similar issue
>    -
>
>    igt@i915_pm_rpm@drm-resources-equal:
>    -
>
>       shard-kbl: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl7/igt@i915_pm_rpm@drm-resources-equal.html>
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl6/igt@i915_pm_rpm@drm-resources-equal.html>
>       -
>
>       shard-iclb: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-iclb2/igt@i915_pm_rpm@drm-resources-equal.html>
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@i915_pm_rpm@drm-resources-equal.html>
>       -
>
>       shard-glk: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk5/igt@i915_pm_rpm@drm-resources-equal.html>
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk1/igt@i915_pm_rpm@drm-resources-equal.html>
>       -
>
>       shard-tglb: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb3/igt@i915_pm_rpm@drm-resources-equal.html>
>       ([i915#2411]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb3/igt@i915_pm_rpm@drm-resources-equal.html>
>       -
>
>    igt@kms_big_fb@linear-32bpp-rotate-180:
>    - shard-glk: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk2/igt@kms_big_fb@linear-32bpp-rotate-180.html>
>       ([i915#118] / [i915#95]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-180.html>
>    -
>
>    igt@kms_cursor_crc@pipe-c-cursor-suspend:
>    - shard-kbl: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html>
>       ([i915#155]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html>
>    -
>
>    igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2
>    :
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html>
>       ([i915#2122]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html>
>       +1 similar issue
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
>    - shard-glk: [FAIL][139]
>
>

--0000000000008d187105c72c9131
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, regressions look like false positives. Thanks!</div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, =
Jul 15, 2021 at 12:40 PM Patchwork &lt;<a href=3D"mailto:patchwork@emeril.f=
reedesktop.org">patchwork@emeril.freedesktop.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>tests/kms_vblank: Turn on hardware be=
fore testing invalid vblank. (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/90382/" target=3D"_blank">https://patchwork.freedesktop.org/series/903=
82/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_6024/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from IGT_6140_full -&gt; IGTPW_6024_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6024_full absolutely need to b=
e<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_6024_full, please notify your bug team to allow them<=
br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6024/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6024/index.html</a></p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6024=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_schedule@independent@vecs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6140/shard-tglb3/igt@gem_exec_schedule@independent@vecs0.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_6024/shard-tglb3/igt@gem_exec_schedule@independent@vecs0.html" ta=
rget=3D"_blank">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-tglb3/igt@kms_plane_alpha_blend@pipe-b-cover=
age-vs-premult-vs-constant.html" target=3D"_blank">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6024_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile@bsd2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-iclb2/igt@gem_ctx_persistence@legacy-engines=
-hostile@bsd2.html" target=3D"_blank">FAIL</a> ([i915#2410])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-snb5/igt@gem_ctx_persistence@legacy-engines-=
queued.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#1099]) +5 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6140/shard-tglb7/igt@gem_eio@in-flight-contexts-10ms.html" target=3D"_=
blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_6024/shard-tglb7/igt@gem_eio@in-flight-contexts-10ms.html" target=3D"_=
blank">TIMEOUT</a> ([i915#3063])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-snb6/igt@gem_eio@unwedge-stress.html" target=
=3D"_blank">FAIL</a> ([i915#3354])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-apl7/igt@gem_exec_fair@basic-deadline.html" =
target=3D"_blank">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6140/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html" target=3D"_bla=
nk">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_6024/shard-glk1/igt@gem_exec_fair@basic-none@rcs0.html" target=3D"_blank"=
>FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html=
" target=3D"_blank">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6140/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs0.html" target=3D"_bla=
nk">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_6024/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs0.html" target=3D"_blank"=
>FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-parallel:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6140/shard-tglb3/igt@gem_exec_reloc@basic-parallel.html" target=3D"_bl=
ank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_6024/shard-tglb1/igt@gem_exec_reloc@basic-parallel.html" target=3D"_blan=
k">TIMEOUT</a> ([i915#3737] / [i915#3779])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-apl8/igt@gem_exec_reloc@basic-wide-active@bc=
s0.html" target=3D"_blank">FAIL</a> ([i915#3633]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@v=
cs1.html" target=3D"_blank">FAIL</a> ([i915#3633])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-apl7/igt@gem_huc_copy@huc-copy.html" target=
=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-apl3/igt@gem_pread@exhaustion.html" target=3D=
"_blank">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-snb5/igt@gem_pread@exhaustion.html" target=3D=
"_blank">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-glk9/igt@gem_render_copy@yf-tiled-mc-ccs-to-v=
ebox-y-tiled.html" target=3D"_blank">SKIP</a> ([fdo#109271]) +55 similar is=
sues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-iclb6/igt@gem_render_copy@yf-tiled-mc-ccs-to-=
vebox-y-tiled.html" target=3D"_blank">SKIP</a> ([i915#768])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-tglb5/igt@gem_softpin@evict-snoop-interruptib=
le.html" target=3D"_blank">SKIP</a> ([fdo#109312])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-iclb8/igt@gem_softpin@evict-snoop-interruptib=
le.html" target=3D"_blank">SKIP</a> ([fdo#109312])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-snb2/igt@gem_userptr_blits@input-checking.ht=
ml" target=3D"_blank">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-iclb2/igt@gem_userptr_blits@unsync-unmap.html=
" target=3D"_blank">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-tglb2/igt@gem_userptr_blits@unsync-unmap.html=
" target=3D"_blank">SKIP</a> ([i915#3297])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-tglb6/igt@gen9_exec_parse@bb-start-cmd.html" =
target=3D"_blank">SKIP</a> ([fdo#112306])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-iclb6/igt@gen9_exec_parse@bb-start-cmd.html" =
target=3D"_blank">SKIP</a> ([fdo#112306])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-tglb3/igt@i915_pm_dc@dc9-dpms.html" target=3D=
"_blank">SKIP</a> ([i915#3288])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html" target=3D=
"_blank">FAIL</a> ([i915#3343])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6140/shard-tglb3/igt@i915_pm_rc6_residency@rc6-idle.html" target=3D"_b=
lank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_6024/shard-tglb5/igt@i915_pm_rc6_residency@rc6-idle.html" target=3D"_bl=
ank">WARN</a> ([i915#2681] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp-stress=
.html" target=3D"_blank">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411]=
)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp-stress=
.html" target=3D"_blank">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6140/shard-kbl2/igt@i915_pm_rpm@system-suspend-modeset.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6024/shard-kbl2/igt@i915_pm_rpm@system-suspend-modeset.html" target=
=3D"_blank">INCOMPLETE</a> ([i915#151] / [i915#155])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6140/shard-tglb6/igt@i915_selftest@live@gt_heartbeat.html" target=3D"_=
blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_6024/shard-tglb5/igt@i915_selftest@live@gt_heartbeat.html" target=3D"_=
blank">DMESG-FAIL</a> ([i915#3768])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@kms_big_fb@linear-16bpp-rotate-90.=
html" target=3D"_blank">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar i=
ssue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6140/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-0.html" target=3D"_=
blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_6024/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-0.html" target=3D"_=
blank">DMESG-WARN</a> ([i915#118] / [i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@kms_big_fb@linear-8bpp-rotate-90.h=
tml" target=3D"_blank">SKIP</a> ([fdo#111614]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-apl1/igt@kms_big_fb@x-tiled-max-hw-stride-32=
bpp-rotate-180-hflip.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915=
#3777])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-tglb5/igt@kms_big_fb@yf-tiled-32bpp-rotate-2=
70.html" target=3D"_blank">SKIP</a> ([fdo#111615]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-apl8/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-0.html" target=3D"_blank">SKIP</a> ([fdo#109271]) +250 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-0-hflip-async-flip.html" target=3D"_blank">SKIP</a> ([fdo#1107=
23])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-snb6/igt@kms_ccs@pipe-b-bad-pixel-format-y_t=
iled_ccs.html" target=3D"_blank">SKIP</a> ([fdo#109271]) +365 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-tglb7/igt@kms_ccs@pipe-d-bad-rotation-90-yf_=
tiled_ccs.html" target=3D"_blank">SKIP</a> ([i915#3689]) +10 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-apl2/igt@kms_chamelium@vga-hpd.html" target=
=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-kbl2/igt@kms_chamelium@vga-hpd-for-each-pipe=
.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-green-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@kms_color@pipe-d-ctm-green-to-red.=
html" target=3D"_blank">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-5:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-tglb2/igt@kms_color_chamelium@pipe-b-ctm-0-5=
.html" target=3D"_blank">SKIP</a> ([fdo#109284] / [fdo#111827]) +9 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-iclb7/igt@kms_color_chamelium@pipe-c-ctm-0-5=
.html" target=3D"_blank">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-degamma:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-glk8/igt@kms_color_chamelium@pipe-d-degamma.h=
tml" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar is=
sues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-iclb4/igt@kms_color_chamelium@pipe-d-degamma.=
html" target=3D"_blank">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827=
])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-snb6/igt@kms_color_chamelium@pipe-invalid-ct=
m-matrix-sizes.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827=
]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-apl2/igt@kms_content_protection@lic.html" ta=
rget=3D"_blank">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-kbl7/igt@kms_content_protection@uevent.html" =
target=3D"_blank">FAIL</a> ([i915#2105])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-apl7/igt@kms_content_protection@uevent.html" =
target=3D"_blank">FAIL</a> ([i915#2105])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-32x32=
-sliding.html" target=3D"_blank">SKIP</a> ([i915#3319]) +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@kms_cursor_crc@pipe-d-cursor-64x21=
-sliding.html" target=3D"_blank">SKIP</a> ([fdo#109278]) +16 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-max-size-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-max-s=
ize-offscreen.html" target=3D"_blank">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipa=
-atomic-transitions.html" target=3D"_blank">SKIP</a> ([fdo#109274] / [fdo#1=
09278]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.ht=
ml" target=3D"_blank">SKIP</a> ([fdo#109349])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-iclb2/igt@kms_dp_tiled_display@basic-test-pat=
tern.html" target=3D"_blank">SKIP</a> ([i915#426])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-tglb2/igt@kms_dp_tiled_display@basic-test-pat=
tern.html" target=3D"_blank">SKIP</a> ([i915#426])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-iclb7/igt@kms_flip@2x-flip-vs-dpms.html" tar=
get=3D"_blank">SKIP</a> ([fdo#109274]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6140/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html"=
 target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_6024/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible=
@a-dp1.html" target=3D"_blank">DMESG-WARN</a> ([i915#180]) +5 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6140/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html"=
 target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_6024/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible=
@c-dp1.html" target=3D"_blank">DMESG-WARN</a> ([i915#180]) +4 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-apl3/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-32bpp-ytilegen12rcccs.html" target=3D"_blank">SKIP</a> ([fdo#109271] /=
 [i915#2672]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p=
>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-pri-shrfb-draw-mmap-cpu.html" target=3D"_blank">SKIP</a> ([fdo#10928=
0]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p=
>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-kbl4/igt@kms_frontbuffer_tracking@psr-1p-pri=
mscrn-spr-indfb-draw-mmap-cpu.html" target=3D"_blank">SKIP</a> ([fdo#109271=
]) +91 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p=
>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-tglb2/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-cur-indfb-draw-mmap-gtt.html" target=3D"_blank">SKIP</a> ([fdo#11182=
5]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-apl8/igt@kms_hdr@bpc-switch-suspend.html" ta=
rget=3D"_blank">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-tglb5/igt@kms_pipe_b_c_ivb@pipe-b-double-mod=
eset-then-modeset-pipe-c.html" target=3D"_blank">SKIP</a> ([fdo#109289]) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-=
opaque-fb.html" target=3D"_blank">FAIL</a> ([fdo#108145] / [i915#265]) +2 s=
imilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-glk8/igt@kms_plane_alpha_blend@pipe-b-alpha-=
opaque-fb.html" target=3D"_blank">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html" target=3D"_blank">FAIL</a> ([i915#265]) +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6140/shard-iclb7/igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-=
vs-constant.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb2/igt@kms_plane_alpha_blen=
d@pipe-c-coverage-vs-premult-vs-constant.html" target=3D"_blank">SKIP</a> (=
[fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-none:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-iclb6/igt@kms_plane_lowres@pipe-b-tiling-non=
e.html" target=3D"_blank">SKIP</a> ([i915#3536])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-d-t=
iling-yf.html" target=3D"_blank">SKIP</a> ([fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-apl6/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-2.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#658]) +5=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area-3.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#658]) +3 =
similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-3.html" target=3D"_blank">SKIP</a> ([i915#2920])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-tglb7/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-1.html" target=3D"_blank">SKIP</a> ([i915#2920]) +2 similar iss=
ues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-glk9/igt@kms_psr2_sf@overlay-primary-update-s=
f-dmg-area-1.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#658]) +=
2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@kms_psr2_sf@primary-plane-update-s=
f-dmg-area-4.html" target=3D"_blank">SKIP</a> ([i915#658]) +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-iclb6/igt@kms_psr2_su@page_flip.html" target=
=3D"_blank">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6140/shard-iclb2/igt@kms_psr@psr2_cursor_render.html" target=3D"_blank=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6024/shard-iclb3/igt@kms_psr@psr2_cursor_render.html" target=3D"_blank">SKI=
P</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@kms_psr@psr2_primary_mmap_gtt.html=
" target=3D"_blank">FAIL</a> ([i915#132] / [i915#3467])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-snb5/igt@kms_setmode@basic.html" target=3D"_=
blank">FAIL</a> ([i915#31])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-apl3/igt@kms_vblank@pipe-d-wait-idle.html" t=
arget=3D"_blank">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-rg:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-iclb5/igt@nouveau_crc@pipe-a-source-rg.html" =
target=3D"_blank">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-tglb6/igt@nouveau_crc@pipe-a-source-rg.html" =
target=3D"_blank">SKIP</a> ([i915#2530]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-outp-complete:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@nouveau_crc@pipe-d-source-outp-com=
plete.html" target=3D"_blank">SKIP</a> ([fdo#109278] / [i915#2530])</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-iclb6/igt@perf@per-context-mode-unprivileged=
.html" target=3D"_blank">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@perf_pmu@event-wait@rcs0.html" tar=
get=3D"_blank">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-iclb1/igt@prime_vgem@fence-write-hang.html" t=
arget=3D"_blank">SKIP</a> ([fdo#109295])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-tglb1/igt@prime_vgem@fence-write-hang.html" t=
arget=3D"_blank">SKIP</a> ([fdo#109295])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-glk1/igt@sysfs_clients@fair-1.html" target=3D=
"_blank">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-iclb3/igt@sysfs_clients@fair-1.html" target=
=3D"_blank">SKIP</a> ([i915#2994]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6024/shard-tglb3/igt@sysfs_clients@fair-1.html" target=
=3D"_blank">SKIP</a> ([i915#2994]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-apl3/igt@sysfs_clients@fair-7.html" target=
=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2994]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6024/shard-kbl2/igt@sysfs_clients@sema-25.html" target=
=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6140/shard-tglb1/igt@gem_eio@in-flight-contexts-1us.html" target=3D"_b=
lank">TIMEOUT</a> ([i915#3063]) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@gem_eio@in-flight-contexts-1us.ht=
ml" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6140/shard-kbl2/igt@gem_eio@in-flight-suspend.html" target=3D"_blank">=
DMESG-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_6024/shard-kbl4/igt@gem_eio@in-flight-suspend.html" target=
=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6140/shard-kbl4/igt@gem_exec_fair@basic-none-solo@rcs0.html" target=3D=
"_blank">FAIL</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_6024/shard-kbl2/igt@gem_exec_fair@basic-none-solo@rcs0=
.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6140/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html" target=
=3D"_blank">FAIL</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_6024/shard-tglb7/igt@gem_exec_fair@basic-pace-share=
@rcs0.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6140/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html" target=3D"_bl=
ank">SKIP</a> ([fdo#109271]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_6024/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html" =
target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6140/shard-glk1/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html" targ=
et=3D"_blank">FAIL</a> ([i915#307] / [i915#3468]) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk7/igt@gem_mmap_gtt@cpu=
set-basic-small-copy-xy.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6140/shard-iclb7/igt@i915_pm_dc@dc6-psr.html" target=3D"_blank">DMESG-=
WARN</a> ([i915#3698]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_6024/shard-iclb4/igt@i915_pm_dc@dc6-psr.html" target=3D"_blank"=
>PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@drm-resources-equal:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6140/shard-kbl7/igt@i915_pm_rpm@drm-resources-equal.html" target=3D"_bl=
ank">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_6024/shard-kbl6/igt@i915_pm_rpm@drm-resources-equal.html" target=
=3D"_blank">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6140/shard-iclb2/igt@i915_pm_rpm@drm-resources-equal.html" target=3D"_b=
lank">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_6024/shard-iclb3/igt@i915_pm_rpm@drm-resources-equal.html" target=
=3D"_blank">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6140/shard-glk5/igt@i915_pm_rpm@drm-resources-equal.html" target=3D"_bl=
ank">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_6024/shard-glk1/igt@i915_pm_rpm@drm-resources-equal.html" target=
=3D"_blank">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6140/shard-tglb3/igt@i915_pm_rpm@drm-resources-equal.html" target=3D"_b=
lank">DMESG-WARN</a> ([i915#2411]) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_6024/shard-tglb3/igt@i915_pm_rpm@drm-resources-equa=
l.html" target=3D"_blank">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6140/shard-glk2/igt@kms_big_fb@linear-32bpp-rotate-180.html" target=3D=
"_blank">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk9/igt@kms_big_fb@linear=
-32bpp-rotate-180.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6140/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html" target=
=3D"_blank">INCOMPLETE</a> ([i915#155]) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl6/igt@kms_cursor_crc@pipe-c-curs=
or-suspend.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6140/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@a=
c-hdmi-a1-hdmi-a2.html" target=3D"_blank">FAIL</a> ([i915#2122]) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk9/igt@k=
ms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html" ta=
rget=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          [FAIL][139]</li>
</ul>
</li>
</ul>

</div>

</blockquote></div>

--0000000000008d187105c72c9131--

--===============1480324588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1480324588==--
