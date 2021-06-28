Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168FC6E4E8
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jun 2021 17:08:25 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id c11so26728471ljd.6
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jun 2021 10:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210621172146.4130875-1-markyacoub@chromium.org>
 <162487237751.2575.11264179500028694847@emeril.freedesktop.org>
In-Reply-To: <162487237751.2575.11264179500028694847@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 28 Jun 2021 13:08:08 -0400
Message-ID: <CAJUqKUpK8+D1h-a9A5kB91_4Q+k-WjYdZ-NPk1XMJ34coU59dA@mail.gmail.com>
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
	=?utf-8?q?t=5Ffb=3A_Support_Tile_Size_for_AMD_non_linear_modifiers?=
	=?utf-8?b?LiAocmV2NCk=?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1285556730=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1285556730==
Content-Type: multipart/alternative; boundary="00000000000068d20905c5d689a7"

--00000000000068d20905c5d689a7
Content-Type: text/plain; charset="UTF-8"

sounds like a false positive.it's an AMD only code.

On Mon, Jun 28, 2021 at 5:26 AM Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* lib/igt_fb: Support Tile Size for AMD non linear modifiers.
> (rev4)
> *URL:* https://patchwork.freedesktop.org/series/89017/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/index.html CI
> Bug Log - changes from CI_DRM_10282_full -> IGTPW_5952_full Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_5952_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_5952_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/index.html
> Possible new issues
>
> Here are the unknown changes that may have been introduced in
> IGTPW_5952_full:
> IGT changes Possible regressions
>
>    -
>
>    igt@gem_shrink@reclaim:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-tglb5/igt@gem_shrink@reclaim.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb8/igt@gem_shrink@reclaim.html>
>    -
>
>    igt@i915_pm_dc@dc5-psr:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-iclb3/igt@i915_pm_dc@dc5-psr.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb3/igt@i915_pm_dc@dc5-psr.html>
>    -
>
>    igt@i915_pm_rps@waitboost:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-glk5/igt@i915_pm_rps@waitboost.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk2/igt@i915_pm_rps@waitboost.html>
>
> Warnings
>
>    - igt@runner@aborted:
>       - shard-iclb: (FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-iclb5/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-iclb8/igt@runner@aborted.html>)
>       ([i915#1814] / [i915#3002]) -> (FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb7/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb3/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb6/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb8/igt@runner@aborted.html>)
>       ([i915#3002])
>
> Known issues
>
> Here are the changes found in IGTPW_5952_full that come from known issues:
> IGT changes Issues hit
>
>    -
>
>    igt@gem_create@create-clear:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-glk9/igt@gem_create@create-clear.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk8/igt@gem_create@create-clear.html>
>       ([i915#1888] / [i915#3160])
>    -
>
>    igt@gem_create@create-massive:
>    - shard-kbl: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl1/igt@gem_create@create-massive.html>
>       ([i915#3002])
>    -
>
>    igt@gem_ctx_persistence@legacy-engines-mixed:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed.html>
>       ([fdo#109271] / [i915#1099]) +7 similar issues
>    -
>
>    igt@gem_ctx_persistence@many-contexts:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-tglb5/igt@gem_ctx_persistence@many-contexts.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb2/igt@gem_ctx_persistence@many-contexts.html>
>       ([i915#2410])
>    -
>
>    igt@gem_exec_fair@basic-deadline:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl3/igt@gem_exec_fair@basic-deadline.html>
>       ([i915#2846])
>    -
>
>    igt@gem_exec_fair@basic-none-rrul@rcs0:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk3/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>       ([i915#2842]) +1 similar issue
>    -
>
>    igt@gem_exec_fair@basic-none-vip@rcs0:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-kbl2/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl3/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>       ([i915#2842])
>    -
>
>    igt@gem_exec_fair@basic-none@vecs0:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-glk3/igt@gem_exec_fair@basic-none@vecs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk1/igt@gem_exec_fair@basic-none@vecs0.html>
>       ([i915#2842] / [i915#3468])
>    -
>
>    igt@gem_exec_fair@basic-pace-share@rcs0:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>       ([i915#2842])
>    -
>
>    igt@gem_exec_fair@basic-pace@bcs0:
>    - shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb8/igt@gem_exec_fair@basic-pace@bcs0.html>
>       ([i915#2842]) +3 similar issues
>    -
>
>    igt@gem_exec_fair@basic-pace@rcs0:
>    - shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html>
>       ([i915#2842])
>    -
>
>    igt@gem_exec_fair@basic-pace@vcs1:
>    - shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html>
>       ([i915#2842]) +4 similar issues
>    -
>
>    igt@gem_exec_fair@basic-pace@vecs0:
>    - shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk9/igt@gem_exec_fair@basic-pace@vecs0.html>
>       ([i915#2842]) +2 similar issues
>    -
>
>    igt@gem_exec_params@secure-non-master:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb7/igt@gem_exec_params@secure-non-master.html>
>       ([fdo#112283])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb6/igt@gem_exec_params@secure-non-master.html>
>       ([fdo#112283])
>       -
>
>    igt@gem_huc_copy@huc-copy:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl3/igt@gem_huc_copy@huc-copy.html>
>       ([fdo#109271] / [i915#2190])
>    -
>
>    igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl1/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html>
>       ([fdo#109271]) +159 similar issues
>    -
>
>    igt@gem_render_copy@y-tiled-to-vebox-linear:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-linear.html>
>       ([i915#768]) +1 similar issue
>    -
>
>    igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html>
>       ([fdo#109271]) +63 similar issues
>    -
>
>    igt@gem_userptr_blits@dmabuf-sync:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl4/igt@gem_userptr_blits@dmabuf-sync.html>
>       ([fdo#109271] / [i915#3323])
>    -
>
>    igt@gem_userptr_blits@dmabuf-unsync:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb8/igt@gem_userptr_blits@dmabuf-unsync.html>
>       ([i915#3297])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb7/igt@gem_userptr_blits@dmabuf-unsync.html>
>       ([i915#3297])
>       -
>
>    igt@gem_userptr_blits@input-checking:
>    - shard-apl: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl7/igt@gem_userptr_blits@input-checking.html>
>       ([i915#3002]) +1 similar issue
>    -
>
>    igt@gen3_render_tiledy_blits:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb2/igt@gen3_render_tiledy_blits.html>
>       ([fdo#109289]) +2 similar issues
>    -
>
>    igt@gen7_exec_parse@chained-batch:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb4/igt@gen7_exec_parse@chained-batch.html>
>       ([fdo#109289]) +1 similar issue
>    -
>
>    igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
>    -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html>
>       ([fdo#109271] / [i915#1937])
>       -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html>
>       ([fdo#109271] / [i915#1937])
>       -
>
>    igt@i915_suspend@forcewake:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-kbl6/igt@i915_suspend@forcewake.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl6/igt@i915_suspend@forcewake.html>
>       ([i915#180]) +1 similar issue
>    -
>
>    igt@kms_big_fb@linear-64bpp-rotate-270:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb7/igt@kms_big_fb@linear-64bpp-rotate-270.html>
>       ([fdo#111614])
>    -
>
>    igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb3/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html>
>       ([fdo#110723])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb3/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html>
>       ([fdo#111615])
>       -
>
>    igt@kms_chamelium@dp-crc-multiple:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk8/igt@kms_chamelium@dp-crc-multiple.html>
>       ([fdo#109271] / [fdo#111827]) +8 similar issues
>    -
>
>    igt@kms_chamelium@vga-hpd-with-enabled-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb4/igt@kms_chamelium@vga-hpd-with-enabled-mode.html>
>       ([fdo#109284] / [fdo#111827]) +4 similar issues
>    -
>
>    igt@kms_chamelium@vga-hpd-without-ddc:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-snb7/igt@kms_chamelium@vga-hpd-without-ddc.html>
>       ([fdo#109271] / [fdo#111827]) +19 similar issues
>    -
>
>    igt@kms_color_chamelium@pipe-a-ctm-limited-range:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl7/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html>
>       ([fdo#109271] / [fdo#111827]) +28 similar issues
>    -
>
>    igt@kms_color_chamelium@pipe-a-degamma:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl1/igt@kms_color_chamelium@pipe-a-degamma.html>
>       ([fdo#109271] / [fdo#111827]) +18 similar issues
>    -
>
>    igt@kms_color_chamelium@pipe-d-ctm-limited-range:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb6/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html>
>       ([fdo#109284] / [fdo#111827]) +5 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb4/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html>
>       ([fdo#109278] / [fdo#109284] / [fdo#111827])
>       -
>
>    igt@kms_content_protection@atomic:
>    - shard-apl: NOTRUN -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl7/igt@kms_content_protection@atomic.html>
>       ([i915#1319])
>    -
>
>    igt@kms_content_protection@uevent:
>    -
>
>       shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl3/igt@kms_content_protection@uevent.html>
>       ([i915#2105])
>       -
>
>       shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl6/igt@kms_content_protection@uevent.html>
>       ([i915#2105])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb5/igt@kms_content_protection@uevent.html>
>       ([fdo#109300] / [fdo#111066])
>       -
>
>    igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb8/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html>
>       ([fdo#109278] / [fdo#109279]) +1 similar issue
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html>
>       ([fdo#109279] / [i915#3359]) +4 similar issues
>       -
>
>    igt@kms_cursor_crc@pipe-c-cursor-max-size-sliding:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-max-size-sliding.html>
>       ([i915#3359])
>    -
>
>    igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html>
>       ([fdo#111825]) +14 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html>
>       ([fdo#109274] / [fdo#109278]) +1 similar issue
>       -
>
>    igt@kms_cursor_legacy@pipe-d-single-move:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb7/igt@kms_cursor_legacy@pipe-d-single-move.html>
>       ([fdo#109278]) +7 similar issues
>    -
>
>    igt@kms_dp_dsc@basic-dsc-enable-dp:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb8/igt@kms_dp_dsc@basic-dsc-enable-dp.html>
>       ([fdo#109349])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-dp.html>
>       ([fdo#109349])
>       -
>
>    igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb5/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html>
>       ([i915#3528])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb5/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html>
>       ([i915#3528])
>       -
>
>    igt@kms_fbcon_fbt@fbc-suspend:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html>
>       ([i915#155] / [i915#636])
>    -
>
>    igt@kms_flip@2x-flip-vs-panning-interruptible:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb4/igt@kms_flip@2x-flip-vs-panning-interruptible.html>
>       ([fdo#109274]) +1 similar issue
>    -
>
>    igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html>
>       ([fdo#109271] / [i915#2672])
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html>
>       ([fdo#109280]) +12 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-snb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html>
>       ([fdo#109271]) +349 similar issues
>    -
>
>    igt@kms_hdr@bpc-switch-suspend:
>    - shard-apl: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl1/igt@kms_hdr@bpc-switch-suspend.html>
>       ([i915#180])
>    -
>
>    igt@kms_hdr@static-toggle:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb3/igt@kms_hdr@static-toggle.html>
>       ([i915#1187])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb7/igt@kms_hdr@static-toggle.html>
>       ([i915#1187])
>       -
>
>    igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
>    - shard-kbl: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html>
>       ([i915#180]) +1 similar issue
>    -
>
>    igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
>    -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html>
>       ([fdo#109271] / [i915#533]) +1 similar issue
>       -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html>
>       ([fdo#109271] / [i915#533]) +2 similar issues
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html>
>       ([fdo#109271] / [i915#533])
>       -
>
>    igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
>    - shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html>
>       ([fdo#108145] / [i915#265])
>    -
>
>    igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html>
>       ([i915#265]) +1 similar issue
>    -
>
>    igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html>
>       ([fdo#108145] / [i915#265]) +3 similar issues
>    -
>
>    igt@kms_plane_lowres@pipe-a-tiling-x:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb7/igt@kms_plane_lowres@pipe-a-tiling-x.html>
>       ([i915#3536]) +1 similar issue
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb8/igt@kms_plane_lowres@pipe-a-tiling-x.html>
>       ([i915#3536])
>       -
>
>    igt@kms_plane_lowres@pipe-a-tiling-yf:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb1/igt@kms_plane_lowres@pipe-a-tiling-yf.html>
>       ([fdo#112054])
>    -
>
>    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html>
>       ([fdo#109271] / [i915#658]) +10 similar issues
>    -
>
>    igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html>
>       ([fdo#109271] / [i915#658]) +4 similar issues
>    -
>
>    igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html>
>       ([i915#2920]) +1 similar issue
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk6/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html>
>       ([fdo#109271] / [i915#658]) +1 similar issue
>       -
>
>    igt@kms_psr2_sf@plane-move-sf-dmg-area-1:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb4/igt@kms_psr2_sf@plane-move-sf-dmg-area-1.html>
>       ([i915#658])
>    -
>
>    igt@kms_psr@psr2_sprite_render:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-iclb2/igt@kms_psr@psr2_sprite_render.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb6/igt@kms_psr@psr2_sprite_render.html>
>       ([fdo#109441])
>    -
>
>    igt@kms_setmode@basic:
>    - shard-snb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-snb5/igt@kms_setmode@basic.html>
>       ([i915#31])
>    -
>
>    igt@kms_sysfs_edid_timing:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl3/igt@kms_sysfs_edid_timing.html>
>       ([IGT#2])
>    -
>
>    igt@kms_vblank@pipe-a-ts-continuation-suspend:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html>
>       ([i915#180] / [i915#295])
>    -
>
>    igt@kms_writeback@writeback-fb-id:
>    -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl1/igt@kms_writeback@writeback-fb-id.html>
>       ([fdo#109271] / [i915#2437])
>       -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl1/igt@kms_writeback@writeback-fb-id.html>
>       ([fdo#109271] / [i915#2437])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb8/igt@kms_writeback@writeback-fb-id.html>
>       ([i915#2437])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb7/igt@kms_writeback@writeback-fb-id.html>
>       ([i915#2437])
>       -
>
>    igt@nouveau_crc@pipe-a-source-outp-complete:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb3/igt@nouveau_crc@pipe-a-source-outp-complete.html>
>       ([i915#2530])
>    -
>
>    igt@nouveau_crc@pipe-c-source-rg:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb8/igt@nouveau_crc@pipe-c-source-rg.html>
>       ([i915#2530]) +1 similar issue
>    -
>
>    igt@prime_nv_api@i915_nv_double_export:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb5/igt@prime_nv_api@i915_nv_double_export.html>
>       ([fdo#109291]) +1 similar issue
>    -
>
>    igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
>    -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl2/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html>
>       ([fdo#109271]) +304 similar issues
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb3/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html>
>       ([fdo#109291])
>       -
>
>    igt@sysfs_clients@fair-0:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb5/igt@sysfs_clients@fair-0.html>
>       ([i915#2994]) +1 similar issue
>    -
>
>    igt@sysfs_clients@recycle-many:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb8/igt@sysfs_clients@recycle-many.html>
>       ([i915#2994]) +1 similar issue
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk8/igt@sysfs_clients@recycle-many.html>
>       ([fdo#109271] / [i915#2994]) +1 similar issue
>       -
>
>    igt@sysfs_clients@sema-10:
>    -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl6/igt@sysfs_clients@sema-10.html>
>       ([fdo#109271] / [i915#2994]) +2 similar issues
>       -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl8/igt@sysfs_clients@sema-10.html>
>       ([fdo#109271] / [i915#2994]) +3 similar issues
>
> Possible fixes
>
>    -
>
>    igt@gem_eio@unwedge-stress:
>    - shard-iclb: TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-iclb7/igt@gem_eio@unwedge-stress.html>
>       ([i915#2369] / [i915#2481] / [i915#3070]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb6/igt@gem_eio@unwedge-stress.html>
>    -
>
>    igt@gem_exec_fair@basic-flow@rcs0:
>    - shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html>
>       ([i915#2842]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html>
>    -
>
>    igt@gem_exec_fair@basic-none@vcs0:
>    - shard-apl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html>
>       ([i915#2842]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl6/igt@gem_exec_fair@basic-none@vcs0.html>
>    -
>
>    igt@gem_exec_gttfill@basic:
>    - shard-iclb: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-iclb4/igt@gem_exec_gttfill@basic.html>
>       ([i915#2405]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb7/igt@gem_exec_gttfill@basic.html>
>    -
>
>    igt@gem_mmap_gtt@big-copy-xy:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-glk3/igt@gem_mmap_gtt@big-copy-xy.html>
>       ([i915#307]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk1/igt@gem_mmap_gtt@big-copy-xy.html>
>    -
>
>    igt@gen9_exec_parse@allowed-all:
>    - shard-glk: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-glk1/igt@gen9_exec_parse@allowed-all.html>
>       ([i915#1436] / [i915#716]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk8/igt@gen9_exec_parse@allowed-all.html>
>    -
>
>    igt@i915_pm_dc@dc9-dpms:
>    - shard-apl: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-apl1/igt@i915_pm_dc@dc9-dpms.html>
>       ([fdo#109271]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl6/igt@i915_pm_dc@dc9-dpms.html>
>    -
>
>    igt@kms_big_fb@linear-32bpp-rotate-0:
>    - shard-glk: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-0.html>
>       ([i915#118] / [i915#95]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-0.html>
>       +1 similar issue
>    -
>
>    igt@kms_cursor_crc@pipe-c-cursor-suspend:
>    - shard-kbl: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html>
>       ([i915#180]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html>
>       +2 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-suspend:
>    - shard-apl: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-apl2/igt@kms_frontbuffer_tracking@fbc-suspend.html>
>       ([i915#180]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl8/igt@kms_frontbuffer_tracking@fbc-suspend.html>
>       +1 similar issue
>    -
>
>    igt@kms_psr@psr2_cursor_plane_onoff:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-iclb8/igt@kms_psr@psr2_cursor_plane_onoff.html>
>       ([fdo#109441]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html>
>       +1 similar issue
>
> Warnings
>
>    -
>
>    igt@gem_exec_fair@basic-none-rrul@rcs0:
>    - shard-iclb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-iclb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>       ([i915#2842]) -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>       ([i915#2852])
>    -
>
>    igt@kms_dp_dsc@basic-dsc-enable-edp:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html>
>       ([fdo#109349]) -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html>
>       ([i915#1226])
>    -
>
>    igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html>
>       ([i915#2920]) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html>
>       ([i915#658])
>    -
>
>    igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
>    - shard-iclb: [SKIP][144] ([i915#
>
>

--00000000000068d20905c5d689a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">sounds like a false=C2=A0<a href=3D"http://positive.it">po=
sitive.it</a>&#39;s an AMD only code.</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 28, 2021 at 5:26 AM Patchw=
ork &lt;<a href=3D"mailto:patchwork@emeril.freedesktop.org">patchwork@emeri=
l.freedesktop.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>lib/igt_fb: Support Tile Size for AMD=
 non linear modifiers. (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/89017/" target=3D"_blank">https://patchwork.freedesktop.org/series/890=
17/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5952/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from CI_DRM_10282_full -&gt; IGTPW_5952_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5952_full absolutely need to b=
e<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_5952_full, please notify your bug team to allow them<=
br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5952/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5952/index.html</a></p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5952=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_shrink@reclaim:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-tglb5/igt@gem_shrink@reclaim.html" target=3D"_blank">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952=
/shard-tglb8/igt@gem_shrink@reclaim.html" target=3D"_blank">DMESG-WARN</a><=
/li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-iclb3/igt@i915_pm_dc@dc5-psr.html" target=3D"_blank">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952=
/shard-iclb3/igt@i915_pm_dc@dc5-psr.html" target=3D"_blank">DMESG-WARN</a><=
/li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-glk5/igt@i915_pm_rps@waitboost.html" target=3D"_blank">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_59=
52/shard-glk2/igt@i915_pm_rps@waitboost.html" target=3D"_blank">FAIL</a></l=
i>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_10282/shard-iclb5/igt@runner@aborted.html" target=3D"_blank">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard=
-iclb8/igt@runner@aborted.html" target=3D"_blank">FAIL</a>) ([i915#1814] / =
[i915#3002]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5952/shard-iclb7/igt@runner@aborted.html" target=3D"_blank">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb3/ig=
t@runner@aborted.html" target=3D"_blank">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb6/igt@runner@aborted.html"=
 target=3D"_blank">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5952/shard-iclb8/igt@runner@aborted.html" target=3D"_blank">FAI=
L</a>) ([i915#3002])</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5952_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-clear:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-glk9/igt@gem_create@create-clear.html" target=3D"_blank=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5952/shard-glk8/igt@gem_create@create-clear.html" target=3D"_blank">FAIL</a=
> ([i915#1888] / [i915#3160])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-kbl1/igt@gem_create@create-massive.html" tar=
get=3D"_blank">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-snb7/igt@gem_ctx_persistence@legacy-engines-=
mixed.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#1099]) +7 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-tglb5/igt@gem_ctx_persistence@many-contexts.html" targe=
t=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5952/shard-tglb2/igt@gem_ctx_persistence@many-contexts.html" tar=
get=3D"_blank">FAIL</a> ([i915#2410])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-apl3/igt@gem_exec_fair@basic-deadline.html" =
target=3D"_blank">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html" targe=
t=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5952/shard-glk3/igt@gem_exec_fair@basic-none-rrul@rcs0.html" tar=
get=3D"_blank">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-kbl2/igt@gem_exec_fair@basic-none-vip@rcs0.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5952/shard-kbl3/igt@gem_exec_fair@basic-none-vip@rcs0.html" targe=
t=3D"_blank">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-glk3/igt@gem_exec_fair@basic-none@vecs0.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5952/shard-glk1/igt@gem_exec_fair@basic-none@vecs0.html" target=3D"_=
blank">FAIL</a> ([i915#2842] / [i915#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html" tar=
get=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5952/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html"=
 target=3D"_blank">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-tglb8/igt@gem_exec_fair@basic-pace@bcs0.html=
" target=3D"_blank">FAIL</a> ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html"=
 target=3D"_blank">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html=
" target=3D"_blank">FAIL</a> ([i915#2842]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-glk9/igt@gem_exec_fair@basic-pace@vecs0.html=
" target=3D"_blank">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-tglb7/igt@gem_exec_params@secure-non-master.h=
tml" target=3D"_blank">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-iclb6/igt@gem_exec_params@secure-non-master.h=
tml" target=3D"_blank">SKIP</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-apl3/igt@gem_huc_copy@huc-copy.html" target=
=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-kbl1/igt@gem_render_copy@x-tiled-to-vebox-yf=
-tiled.html" target=3D"_blank">SKIP</a> ([fdo#109271]) +159 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-l=
inear.html" target=3D"_blank">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-glk3/igt@gem_render_copy@yf-tiled-mc-ccs-to-=
vebox-y-tiled.html" target=3D"_blank">SKIP</a> ([fdo#109271]) +63 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-kbl4/igt@gem_userptr_blits@dmabuf-sync.html"=
 target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-tglb8/igt@gem_userptr_blits@dmabuf-unsync.htm=
l" target=3D"_blank">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-iclb7/igt@gem_userptr_blits@dmabuf-unsync.htm=
l" target=3D"_blank">SKIP</a> ([i915#3297])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-apl7/igt@gem_userptr_blits@input-checking.ht=
ml" target=3D"_blank">DMESG-WARN</a> ([i915#3002]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-tglb2/igt@gen3_render_tiledy_blits.html" tar=
get=3D"_blank">SKIP</a> ([fdo#109289]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-iclb4/igt@gen7_exec_parse@chained-batch.html=
" target=3D"_blank">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-kbl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.ht=
ml" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-apl8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.ht=
ml" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-kbl6/igt@i915_suspend@forcewake.html" target=3D"_blank"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
952/shard-kbl6/igt@i915_suspend@forcewake.html" target=3D"_blank">DMESG-WAR=
N</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-tglb7/igt@kms_big_fb@linear-64bpp-rotate-270=
.html" target=3D"_blank">SKIP</a> ([fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-iclb3/igt@kms_big_fb@yf-tiled-64bpp-rotate-90=
.html" target=3D"_blank">SKIP</a> ([fdo#110723])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-tglb3/igt@kms_big_fb@yf-tiled-64bpp-rotate-90=
.html" target=3D"_blank">SKIP</a> ([fdo#111615])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-multiple:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-glk8/igt@kms_chamelium@dp-crc-multiple.html"=
 target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-iclb4/igt@kms_chamelium@vga-hpd-with-enabled=
-mode.html" target=3D"_blank">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-snb7/igt@kms_chamelium@vga-hpd-without-ddc.h=
tml" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +19 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-limited-range:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-apl7/igt@kms_color_chamelium@pipe-a-ctm-limi=
ted-range.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +2=
8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-degamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-kbl1/igt@kms_color_chamelium@pipe-a-degamma.=
html" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +18 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-tglb6/igt@kms_color_chamelium@pipe-d-ctm-limi=
ted-range.html" target=3D"_blank">SKIP</a> ([fdo#109284] / [fdo#111827]) +5=
 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-iclb4/igt@kms_color_chamelium@pipe-d-ctm-limi=
ted-range.html" target=3D"_blank">SKIP</a> ([fdo#109278] / [fdo#109284] / [=
fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-apl7/igt@kms_content_protection@atomic.html"=
 target=3D"_blank">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-kbl3/igt@kms_content_protection@uevent.html" =
target=3D"_blank">FAIL</a> ([i915#2105])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-apl6/igt@kms_content_protection@uevent.html" =
target=3D"_blank">FAIL</a> ([i915#2105])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-iclb5/igt@kms_content_protection@uevent.html"=
 target=3D"_blank">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-iclb8/igt@kms_cursor_crc@pipe-c-cursor-512x17=
0-sliding.html" target=3D"_blank">SKIP</a> ([fdo#109278] / [fdo#109279]) +1=
 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-512x17=
0-sliding.html" target=3D"_blank">SKIP</a> ([fdo#109279] / [i915#3359]) +4 =
similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-max-size-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-max-s=
ize-sliding.html" target=3D"_blank">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-tglb1/igt@kms_cursor_legacy@cursora-vs-flipb-=
atomic.html" target=3D"_blank">SKIP</a> ([fdo#111825]) +14 similar issues</=
p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-iclb2/igt@kms_cursor_legacy@cursora-vs-flipb-=
atomic.html" target=3D"_blank">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 si=
milar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-iclb7/igt@kms_cursor_legacy@pipe-d-single-mo=
ve.html" target=3D"_blank">SKIP</a> ([fdo#109278]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-dp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-tglb8/igt@kms_dp_dsc@basic-dsc-enable-dp.html=
" target=3D"_blank">SKIP</a> ([fdo#109349])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-dp.html=
" target=3D"_blank">SKIP</a> ([fdo#109349])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-tglb5/igt@kms_dp_tiled_display@basic-test-pat=
tern-with-chamelium.html" target=3D"_blank">SKIP</a> ([i915#3528])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-iclb5/igt@kms_dp_tiled_display@basic-test-pat=
tern-with-chamelium.html" target=3D"_blank">SKIP</a> ([i915#3528])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html" target=3D"_bla=
nk">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5952/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html" target=3D"_blank">INC=
OMPLETE</a> ([i915#155] / [i915#636])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-iclb4/igt@kms_flip@2x-flip-vs-panning-interr=
uptible.html" target=3D"_blank">SKIP</a> ([fdo#109274]) +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-apl3/igt@kms_flip_scaled_crc@flip-64bpp-ytil=
e-to-32bpp-ytilercccs.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i91=
5#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-spr-indfb-draw-pwrite.html" target=3D"_blank">SKIP</a> ([fdo#1092=
80]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-snb2/igt@kms_frontbuffer_tracking@psr-1p-pri=
mscrn-cur-indfb-onoff.html" target=3D"_blank">SKIP</a> ([fdo#109271]) +349 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-apl1/igt@kms_hdr@bpc-switch-suspend.html" ta=
rget=3D"_blank">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-iclb3/igt@kms_hdr@static-toggle.html" target=
=3D"_blank">SKIP</a> ([i915#1187])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-tglb7/igt@kms_hdr@static-toggle.html" target=
=3D"_blank">SKIP</a> ([i915#1187])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc=
-pipe-a.html" target=3D"_blank">DMESG-WARN</a> ([i915#180]) +1 similar issu=
e</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-=
pipe-d.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#533]) +1 simi=
lar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-=
pipe-d.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#533]) +2 simi=
lar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc-=
pipe-d.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-=
7efc.html" target=3D"_blank">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html" target=3D"_blank">FAIL</a> ([i915#265]) +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-consta=
nt-alpha-max.html" target=3D"_blank">FAIL</a> ([fdo#108145] / [i915#265]) +=
3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-x:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-iclb7/igt@kms_plane_lowres@pipe-a-tiling-x.ht=
ml" target=3D"_blank">SKIP</a> ([i915#3536]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-tglb8/igt@kms_plane_lowres@pipe-a-tiling-x.ht=
ml" target=3D"_blank">SKIP</a> ([i915#3536])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-tglb1/igt@kms_plane_lowres@pipe-a-tiling-yf.=
html" target=3D"_blank">SKIP</a> ([fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-apl8/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-2.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#658]) +1=
0 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-kbl7/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-3.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#658]) =
+4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-tglb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-=
0.html" target=3D"_blank">SKIP</a> ([i915#2920]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-glk6/igt@kms_psr2_sf@plane-move-sf-dmg-area-0=
.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar is=
sue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-iclb4/igt@kms_psr2_sf@plane-move-sf-dmg-area=
-1.html" target=3D"_blank">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-iclb2/igt@kms_psr@psr2_sprite_render.html" target=3D"_b=
lank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5952/shard-iclb6/igt@kms_psr@psr2_sprite_render.html" target=3D"_blank"=
>SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-snb5/igt@kms_setmode@basic.html" target=3D"_=
blank">FAIL</a> ([i915#31])</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-apl3/igt@kms_sysfs_edid_timing.html" target=
=3D"_blank">FAIL</a> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html=
" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5952/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-sus=
pend.html" target=3D"_blank">DMESG-WARN</a> ([i915#180] / [i915#295])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-apl1/igt@kms_writeback@writeback-fb-id.html" =
target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-kbl1/igt@kms_writeback@writeback-fb-id.html" =
target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-tglb8/igt@kms_writeback@writeback-fb-id.html"=
 target=3D"_blank">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-iclb7/igt@kms_writeback@writeback-fb-id.html"=
 target=3D"_blank">SKIP</a> ([i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-outp-complete:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-tglb3/igt@nouveau_crc@pipe-a-source-outp-com=
plete.html" target=3D"_blank">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-rg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-iclb8/igt@nouveau_crc@pipe-c-source-rg.html"=
 target=3D"_blank">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_double_export:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-iclb5/igt@prime_nv_api@i915_nv_double_export=
.html" target=3D"_blank">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-apl2/igt@prime_nv_api@i915_nv_reimport_twice_=
check_flink_name.html" target=3D"_blank">SKIP</a> ([fdo#109271]) +304 simil=
ar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-tglb3/igt@prime_nv_api@i915_nv_reimport_twice=
_check_flink_name.html" target=3D"_blank">SKIP</a> ([fdo#109291])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-tglb5/igt@sysfs_clients@fair-0.html" target=
=3D"_blank">SKIP</a> ([i915#2994]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-iclb8/igt@sysfs_clients@recycle-many.html" ta=
rget=3D"_blank">SKIP</a> ([i915#2994]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-glk8/igt@sysfs_clients@recycle-many.html" tar=
get=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2994]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-10:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-kbl6/igt@sysfs_clients@sema-10.html" target=
=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5952/shard-apl8/igt@sysfs_clients@sema-10.html" target=
=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2994]) +3 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-iclb7/igt@gem_eio@unwedge-stress.html" target=3D"_blank=
">TIMEOUT</a> ([i915#2369] / [i915#2481] / [i915#3070]) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb6/igt@gem_eio@u=
nwedge-stress.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html" target=3D=
"_blank">FAIL</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5952/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.htm=
l" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html" target=3D"=
_blank">FAIL</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-apl6/igt@gem_exec_fair@basic-none@vcs0.html"=
 target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-iclb4/igt@gem_exec_gttfill@basic.html" target=3D"_blank=
">INCOMPLETE</a> ([i915#2405]) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5952/shard-iclb7/igt@gem_exec_gttfill@basic.html" targe=
t=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy-xy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-glk3/igt@gem_mmap_gtt@big-copy-xy.html" target=3D"_blan=
k">FAIL</a> ([i915#307]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5952/shard-glk1/igt@gem_mmap_gtt@big-copy-xy.html" target=3D"=
_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-glk1/igt@gen9_exec_parse@allowed-all.html" target=3D"_b=
lank">DMESG-WARN</a> ([i915#1436] / [i915#716]) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk8/igt@gen9_exec_parse@al=
lowed-all.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-apl1/igt@i915_pm_dc@dc9-dpms.html" target=3D"_blank">SK=
IP</a> ([fdo#109271]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5952/shard-apl6/igt@i915_pm_dc@dc9-dpms.html" target=3D"_blank">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-0.html" target=
=3D"_blank">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk6/igt@kms_big_fb@lin=
ear-32bpp-rotate-0.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html" tar=
get=3D"_blank">DMESG-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl4/igt@kms_cursor_crc@pipe-c-c=
ursor-suspend.html" target=3D"_blank">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-apl2/igt@kms_frontbuffer_tracking@fbc-suspend.html" tar=
get=3D"_blank">DMESG-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl8/igt@kms_frontbuffer_trackin=
g@fbc-suspend.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-iclb8/igt@kms_psr@psr2_cursor_plane_onoff.html" target=
=3D"_blank">SKIP</a> ([fdo#109441]) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5952/shard-iclb2/igt@kms_psr@psr2_cursor_plane_ono=
ff.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-iclb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html" targ=
et=3D"_blank">FAIL</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5952/shard-iclb7/igt@gem_exec_fair@basic-none-rru=
l@rcs0.html" target=3D"_blank">FAIL</a> ([i915#2852])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html" target=
=3D"_blank">SKIP</a> ([fdo#109349]) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5952/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-e=
dp.html" target=3D"_blank">DMESG-WARN</a> ([i915#1226])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10282/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-are=
a-1.html" target=3D"_blank">SKIP</a> ([i915#2920]) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb1/igt@kms_psr2_sf@ov=
erlay-primary-update-sf-dmg-area-1.html" target=3D"_blank">SKIP</a> ([i915#=
658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         [SKIP][144] ([i915#</li>
</ul>
</li>
</ul>

</div>

</blockquote></div>

--00000000000068d20905c5d689a7--

--===============1285556730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1285556730==--
