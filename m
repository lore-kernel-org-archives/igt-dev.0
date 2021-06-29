Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812F16E8C5
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Jun 2021 16:07:41 +0000 (UTC)
Date: Tue, 29 Jun 2021 12:07:35 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210629160735.zujemf7nj3hd7et5@outlook.office365.com>
References: <20210621172146.4130875-1-markyacoub@chromium.org>
 <162487237751.2575.11264179500028694847@emeril.freedesktop.org>
 <CAJUqKUpK8+D1h-a9A5kB91_4Q+k-WjYdZ-NPk1XMJ34coU59dA@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAJUqKUpK8+D1h-a9A5kB91_4Q+k-WjYdZ-NPk1XMJ34coU59dA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Ffb=3A_Support_Tile_Size_for_AMD_non_linear_modifiers=2E_=28?=
 =?utf-8?q?rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 06/28, Mark Yacoub wrote:
> sounds like a false positive.it's an AMD only code.

Hi Petri,

I agree with Mark, I think this is a false positive. In this case, how
can I proceed to apply this patch? When we have a false positive, can we
just go ahead and apply the patch in the upstream? I'm just trying to
understand the correct procedure.

Thanks
Siqueira

 
> On Mon, Jun 28, 2021 at 5:26 AM Patchwork <patchwork@emeril.freedesktop.org>
> wrote:
> 
> > *Patch Details*
> > *Series:* lib/igt_fb: Support Tile Size for AMD non linear modifiers.
> > (rev4)
> > *URL:* https://patchwork.freedesktop.org/series/89017/
> > *State:* failure
> > *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/index.html CI
> > Bug Log - changes from CI_DRM_10282_full -> IGTPW_5952_full Summary
> >
> > *FAILURE*
> >
> > Serious unknown changes coming with IGTPW_5952_full absolutely need to be
> > verified manually.
> >
> > If you think the reported changes have nothing to do with the changes
> > introduced in IGTPW_5952_full, please notify your bug team to allow them
> > to document this new failure mode, which will reduce false positives in CI.
> >
> > External URL:
> > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/index.html
> > Possible new issues
> >
> > Here are the unknown changes that may have been introduced in
> > IGTPW_5952_full:
> > IGT changes Possible regressions
> >
> >    -
> >
> >    igt@gem_shrink@reclaim:
> >    - shard-tglb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-tglb5/igt@gem_shrink@reclaim.html>
> >       -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb8/igt@gem_shrink@reclaim.html>
> >    -
> >
> >    igt@i915_pm_dc@dc5-psr:
> >    - shard-iclb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-iclb3/igt@i915_pm_dc@dc5-psr.html>
> >       -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb3/igt@i915_pm_dc@dc5-psr.html>
> >    -
> >
> >    igt@i915_pm_rps@waitboost:
> >    - shard-glk: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-glk5/igt@i915_pm_rps@waitboost.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk2/igt@i915_pm_rps@waitboost.html>
> >
> > Warnings
> >
> >    - igt@runner@aborted:
> >       - shard-iclb: (FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-iclb5/igt@runner@aborted.html>,
> >       FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-iclb8/igt@runner@aborted.html>)
> >       ([i915#1814] / [i915#3002]) -> (FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb7/igt@runner@aborted.html>,
> >       FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb3/igt@runner@aborted.html>,
> >       FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb6/igt@runner@aborted.html>,
> >       FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb8/igt@runner@aborted.html>)
> >       ([i915#3002])
> >
> > Known issues
> >
> > Here are the changes found in IGTPW_5952_full that come from known issues:
> > IGT changes Issues hit
> >
> >    -
> >
> >    igt@gem_create@create-clear:
> >    - shard-glk: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-glk9/igt@gem_create@create-clear.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk8/igt@gem_create@create-clear.html>
> >       ([i915#1888] / [i915#3160])
> >    -
> >
> >    igt@gem_create@create-massive:
> >    - shard-kbl: NOTRUN -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl1/igt@gem_create@create-massive.html>
> >       ([i915#3002])
> >    -
> >
> >    igt@gem_ctx_persistence@legacy-engines-mixed:
> >    - shard-snb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed.html>
> >       ([fdo#109271] / [i915#1099]) +7 similar issues
> >    -
> >
> >    igt@gem_ctx_persistence@many-contexts:
> >    - shard-tglb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-tglb5/igt@gem_ctx_persistence@many-contexts.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb2/igt@gem_ctx_persistence@many-contexts.html>
> >       ([i915#2410])
> >    -
> >
> >    igt@gem_exec_fair@basic-deadline:
> >    - shard-apl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl3/igt@gem_exec_fair@basic-deadline.html>
> >       ([i915#2846])
> >    -
> >
> >    igt@gem_exec_fair@basic-none-rrul@rcs0:
> >    - shard-glk: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk3/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
> >       ([i915#2842]) +1 similar issue
> >    -
> >
> >    igt@gem_exec_fair@basic-none-vip@rcs0:
> >    - shard-kbl: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-kbl2/igt@gem_exec_fair@basic-none-vip@rcs0.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl3/igt@gem_exec_fair@basic-none-vip@rcs0.html>
> >       ([i915#2842])
> >    -
> >
> >    igt@gem_exec_fair@basic-none@vecs0:
> >    - shard-glk: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-glk3/igt@gem_exec_fair@basic-none@vecs0.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk1/igt@gem_exec_fair@basic-none@vecs0.html>
> >       ([i915#2842] / [i915#3468])
> >    -
> >
> >    igt@gem_exec_fair@basic-pace-share@rcs0:
> >    - shard-tglb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html>
> >       ([i915#2842])
> >    -
> >
> >    igt@gem_exec_fair@basic-pace@bcs0:
> >    - shard-tglb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb8/igt@gem_exec_fair@basic-pace@bcs0.html>
> >       ([i915#2842]) +3 similar issues
> >    -
> >
> >    igt@gem_exec_fair@basic-pace@rcs0:
> >    - shard-kbl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html>
> >       ([i915#2842])
> >    -
> >
> >    igt@gem_exec_fair@basic-pace@vcs1:
> >    - shard-iclb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html>
> >       ([i915#2842]) +4 similar issues
> >    -
> >
> >    igt@gem_exec_fair@basic-pace@vecs0:
> >    - shard-glk: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk9/igt@gem_exec_fair@basic-pace@vecs0.html>
> >       ([i915#2842]) +2 similar issues
> >    -
> >
> >    igt@gem_exec_params@secure-non-master:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb7/igt@gem_exec_params@secure-non-master.html>
> >       ([fdo#112283])
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb6/igt@gem_exec_params@secure-non-master.html>
> >       ([fdo#112283])
> >       -
> >
> >    igt@gem_huc_copy@huc-copy:
> >    - shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl3/igt@gem_huc_copy@huc-copy.html>
> >       ([fdo#109271] / [i915#2190])
> >    -
> >
> >    igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
> >    - shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl1/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html>
> >       ([fdo#109271]) +159 similar issues
> >    -
> >
> >    igt@gem_render_copy@y-tiled-to-vebox-linear:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-linear.html>
> >       ([i915#768]) +1 similar issue
> >    -
> >
> >    igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
> >    - shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html>
> >       ([fdo#109271]) +63 similar issues
> >    -
> >
> >    igt@gem_userptr_blits@dmabuf-sync:
> >    - shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl4/igt@gem_userptr_blits@dmabuf-sync.html>
> >       ([fdo#109271] / [i915#3323])
> >    -
> >
> >    igt@gem_userptr_blits@dmabuf-unsync:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb8/igt@gem_userptr_blits@dmabuf-unsync.html>
> >       ([i915#3297])
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb7/igt@gem_userptr_blits@dmabuf-unsync.html>
> >       ([i915#3297])
> >       -
> >
> >    igt@gem_userptr_blits@input-checking:
> >    - shard-apl: NOTRUN -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl7/igt@gem_userptr_blits@input-checking.html>
> >       ([i915#3002]) +1 similar issue
> >    -
> >
> >    igt@gen3_render_tiledy_blits:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb2/igt@gen3_render_tiledy_blits.html>
> >       ([fdo#109289]) +2 similar issues
> >    -
> >
> >    igt@gen7_exec_parse@chained-batch:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb4/igt@gen7_exec_parse@chained-batch.html>
> >       ([fdo#109289]) +1 similar issue
> >    -
> >
> >    igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
> >    -
> >
> >       shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html>
> >       ([fdo#109271] / [i915#1937])
> >       -
> >
> >       shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html>
> >       ([fdo#109271] / [i915#1937])
> >       -
> >
> >    igt@i915_suspend@forcewake:
> >    - shard-kbl: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-kbl6/igt@i915_suspend@forcewake.html>
> >       -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl6/igt@i915_suspend@forcewake.html>
> >       ([i915#180]) +1 similar issue
> >    -
> >
> >    igt@kms_big_fb@linear-64bpp-rotate-270:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb7/igt@kms_big_fb@linear-64bpp-rotate-270.html>
> >       ([fdo#111614])
> >    -
> >
> >    igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb3/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html>
> >       ([fdo#110723])
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb3/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html>
> >       ([fdo#111615])
> >       -
> >
> >    igt@kms_chamelium@dp-crc-multiple:
> >    - shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk8/igt@kms_chamelium@dp-crc-multiple.html>
> >       ([fdo#109271] / [fdo#111827]) +8 similar issues
> >    -
> >
> >    igt@kms_chamelium@vga-hpd-with-enabled-mode:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb4/igt@kms_chamelium@vga-hpd-with-enabled-mode.html>
> >       ([fdo#109284] / [fdo#111827]) +4 similar issues
> >    -
> >
> >    igt@kms_chamelium@vga-hpd-without-ddc:
> >    - shard-snb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-snb7/igt@kms_chamelium@vga-hpd-without-ddc.html>
> >       ([fdo#109271] / [fdo#111827]) +19 similar issues
> >    -
> >
> >    igt@kms_color_chamelium@pipe-a-ctm-limited-range:
> >    - shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl7/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html>
> >       ([fdo#109271] / [fdo#111827]) +28 similar issues
> >    -
> >
> >    igt@kms_color_chamelium@pipe-a-degamma:
> >    - shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl1/igt@kms_color_chamelium@pipe-a-degamma.html>
> >       ([fdo#109271] / [fdo#111827]) +18 similar issues
> >    -
> >
> >    igt@kms_color_chamelium@pipe-d-ctm-limited-range:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb6/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html>
> >       ([fdo#109284] / [fdo#111827]) +5 similar issues
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb4/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html>
> >       ([fdo#109278] / [fdo#109284] / [fdo#111827])
> >       -
> >
> >    igt@kms_content_protection@atomic:
> >    - shard-apl: NOTRUN -> TIMEOUT
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl7/igt@kms_content_protection@atomic.html>
> >       ([i915#1319])
> >    -
> >
> >    igt@kms_content_protection@uevent:
> >    -
> >
> >       shard-kbl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl3/igt@kms_content_protection@uevent.html>
> >       ([i915#2105])
> >       -
> >
> >       shard-apl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl6/igt@kms_content_protection@uevent.html>
> >       ([i915#2105])
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb5/igt@kms_content_protection@uevent.html>
> >       ([fdo#109300] / [fdo#111066])
> >       -
> >
> >    igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb8/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html>
> >       ([fdo#109278] / [fdo#109279]) +1 similar issue
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html>
> >       ([fdo#109279] / [i915#3359]) +4 similar issues
> >       -
> >
> >    igt@kms_cursor_crc@pipe-c-cursor-max-size-sliding:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-max-size-sliding.html>
> >       ([i915#3359])
> >    -
> >
> >    igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html>
> >       ([fdo#111825]) +14 similar issues
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html>
> >       ([fdo#109274] / [fdo#109278]) +1 similar issue
> >       -
> >
> >    igt@kms_cursor_legacy@pipe-d-single-move:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb7/igt@kms_cursor_legacy@pipe-d-single-move.html>
> >       ([fdo#109278]) +7 similar issues
> >    -
> >
> >    igt@kms_dp_dsc@basic-dsc-enable-dp:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb8/igt@kms_dp_dsc@basic-dsc-enable-dp.html>
> >       ([fdo#109349])
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-dp.html>
> >       ([fdo#109349])
> >       -
> >
> >    igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb5/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html>
> >       ([i915#3528])
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb5/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html>
> >       ([i915#3528])
> >       -
> >
> >    igt@kms_fbcon_fbt@fbc-suspend:
> >    - shard-kbl: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html>
> >       -> INCOMPLETE
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html>
> >       ([i915#155] / [i915#636])
> >    -
> >
> >    igt@kms_flip@2x-flip-vs-panning-interruptible:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb4/igt@kms_flip@2x-flip-vs-panning-interruptible.html>
> >       ([fdo#109274]) +1 similar issue
> >    -
> >
> >    igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
> >    - shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html>
> >       ([fdo#109271] / [i915#2672])
> >    -
> >
> >    igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html>
> >       ([fdo#109280]) +12 similar issues
> >    -
> >
> >    igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
> >    - shard-snb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-snb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html>
> >       ([fdo#109271]) +349 similar issues
> >    -
> >
> >    igt@kms_hdr@bpc-switch-suspend:
> >    - shard-apl: NOTRUN -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl1/igt@kms_hdr@bpc-switch-suspend.html>
> >       ([i915#180])
> >    -
> >
> >    igt@kms_hdr@static-toggle:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb3/igt@kms_hdr@static-toggle.html>
> >       ([i915#1187])
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb7/igt@kms_hdr@static-toggle.html>
> >       ([i915#1187])
> >       -
> >
> >    igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
> >    - shard-kbl: NOTRUN -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html>
> >       ([i915#180]) +1 similar issue
> >    -
> >
> >    igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
> >    -
> >
> >       shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html>
> >       ([fdo#109271] / [i915#533]) +1 similar issue
> >       -
> >
> >       shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html>
> >       ([fdo#109271] / [i915#533]) +2 similar issues
> >       -
> >
> >       shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html>
> >       ([fdo#109271] / [i915#533])
> >       -
> >
> >    igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
> >    - shard-kbl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html>
> >       ([fdo#108145] / [i915#265])
> >    -
> >
> >    igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
> >    - shard-apl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html>
> >       ([i915#265]) +1 similar issue
> >    -
> >
> >    igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
> >    - shard-apl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html>
> >       ([fdo#108145] / [i915#265]) +3 similar issues
> >    -
> >
> >    igt@kms_plane_lowres@pipe-a-tiling-x:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb7/igt@kms_plane_lowres@pipe-a-tiling-x.html>
> >       ([i915#3536]) +1 similar issue
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb8/igt@kms_plane_lowres@pipe-a-tiling-x.html>
> >       ([i915#3536])
> >       -
> >
> >    igt@kms_plane_lowres@pipe-a-tiling-yf:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb1/igt@kms_plane_lowres@pipe-a-tiling-yf.html>
> >       ([fdo#112054])
> >    -
> >
> >    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
> >    - shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html>
> >       ([fdo#109271] / [i915#658]) +10 similar issues
> >    -
> >
> >    igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
> >    - shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html>
> >       ([fdo#109271] / [i915#658]) +4 similar issues
> >    -
> >
> >    igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html>
> >       ([i915#2920]) +1 similar issue
> >       -
> >
> >       shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk6/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html>
> >       ([fdo#109271] / [i915#658]) +1 similar issue
> >       -
> >
> >    igt@kms_psr2_sf@plane-move-sf-dmg-area-1:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb4/igt@kms_psr2_sf@plane-move-sf-dmg-area-1.html>
> >       ([i915#658])
> >    -
> >
> >    igt@kms_psr@psr2_sprite_render:
> >    - shard-iclb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-iclb2/igt@kms_psr@psr2_sprite_render.html>
> >       -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb6/igt@kms_psr@psr2_sprite_render.html>
> >       ([fdo#109441])
> >    -
> >
> >    igt@kms_setmode@basic:
> >    - shard-snb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-snb5/igt@kms_setmode@basic.html>
> >       ([i915#31])
> >    -
> >
> >    igt@kms_sysfs_edid_timing:
> >    - shard-apl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl3/igt@kms_sysfs_edid_timing.html>
> >       ([IGT#2])
> >    -
> >
> >    igt@kms_vblank@pipe-a-ts-continuation-suspend:
> >    - shard-kbl: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html>
> >       -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html>
> >       ([i915#180] / [i915#295])
> >    -
> >
> >    igt@kms_writeback@writeback-fb-id:
> >    -
> >
> >       shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl1/igt@kms_writeback@writeback-fb-id.html>
> >       ([fdo#109271] / [i915#2437])
> >       -
> >
> >       shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl1/igt@kms_writeback@writeback-fb-id.html>
> >       ([fdo#109271] / [i915#2437])
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb8/igt@kms_writeback@writeback-fb-id.html>
> >       ([i915#2437])
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb7/igt@kms_writeback@writeback-fb-id.html>
> >       ([i915#2437])
> >       -
> >
> >    igt@nouveau_crc@pipe-a-source-outp-complete:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb3/igt@nouveau_crc@pipe-a-source-outp-complete.html>
> >       ([i915#2530])
> >    -
> >
> >    igt@nouveau_crc@pipe-c-source-rg:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb8/igt@nouveau_crc@pipe-c-source-rg.html>
> >       ([i915#2530]) +1 similar issue
> >    -
> >
> >    igt@prime_nv_api@i915_nv_double_export:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb5/igt@prime_nv_api@i915_nv_double_export.html>
> >       ([fdo#109291]) +1 similar issue
> >    -
> >
> >    igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
> >    -
> >
> >       shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl2/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html>
> >       ([fdo#109271]) +304 similar issues
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb3/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html>
> >       ([fdo#109291])
> >       -
> >
> >    igt@sysfs_clients@fair-0:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb5/igt@sysfs_clients@fair-0.html>
> >       ([i915#2994]) +1 similar issue
> >    -
> >
> >    igt@sysfs_clients@recycle-many:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb8/igt@sysfs_clients@recycle-many.html>
> >       ([i915#2994]) +1 similar issue
> >       -
> >
> >       shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk8/igt@sysfs_clients@recycle-many.html>
> >       ([fdo#109271] / [i915#2994]) +1 similar issue
> >       -
> >
> >    igt@sysfs_clients@sema-10:
> >    -
> >
> >       shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl6/igt@sysfs_clients@sema-10.html>
> >       ([fdo#109271] / [i915#2994]) +2 similar issues
> >       -
> >
> >       shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl8/igt@sysfs_clients@sema-10.html>
> >       ([fdo#109271] / [i915#2994]) +3 similar issues
> >
> > Possible fixes
> >
> >    -
> >
> >    igt@gem_eio@unwedge-stress:
> >    - shard-iclb: TIMEOUT
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-iclb7/igt@gem_eio@unwedge-stress.html>
> >       ([i915#2369] / [i915#2481] / [i915#3070]) -> PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb6/igt@gem_eio@unwedge-stress.html>
> >    -
> >
> >    igt@gem_exec_fair@basic-flow@rcs0:
> >    - shard-tglb: FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html>
> >       ([i915#2842]) -> PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html>
> >    -
> >
> >    igt@gem_exec_fair@basic-none@vcs0:
> >    - shard-apl: FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html>
> >       ([i915#2842]) -> PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl6/igt@gem_exec_fair@basic-none@vcs0.html>
> >    -
> >
> >    igt@gem_exec_gttfill@basic:
> >    - shard-iclb: INCOMPLETE
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-iclb4/igt@gem_exec_gttfill@basic.html>
> >       ([i915#2405]) -> PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb7/igt@gem_exec_gttfill@basic.html>
> >    -
> >
> >    igt@gem_mmap_gtt@big-copy-xy:
> >    - shard-glk: FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-glk3/igt@gem_mmap_gtt@big-copy-xy.html>
> >       ([i915#307]) -> PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk1/igt@gem_mmap_gtt@big-copy-xy.html>
> >    -
> >
> >    igt@gen9_exec_parse@allowed-all:
> >    - shard-glk: DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-glk1/igt@gen9_exec_parse@allowed-all.html>
> >       ([i915#1436] / [i915#716]) -> PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk8/igt@gen9_exec_parse@allowed-all.html>
> >    -
> >
> >    igt@i915_pm_dc@dc9-dpms:
> >    - shard-apl: SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-apl1/igt@i915_pm_dc@dc9-dpms.html>
> >       ([fdo#109271]) -> PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl6/igt@i915_pm_dc@dc9-dpms.html>
> >    -
> >
> >    igt@kms_big_fb@linear-32bpp-rotate-0:
> >    - shard-glk: DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-0.html>
> >       ([i915#118] / [i915#95]) -> PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-0.html>
> >       +1 similar issue
> >    -
> >
> >    igt@kms_cursor_crc@pipe-c-cursor-suspend:
> >    - shard-kbl: DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html>
> >       ([i915#180]) -> PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html>
> >       +2 similar issues
> >    -
> >
> >    igt@kms_frontbuffer_tracking@fbc-suspend:
> >    - shard-apl: DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-apl2/igt@kms_frontbuffer_tracking@fbc-suspend.html>
> >       ([i915#180]) -> PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-apl8/igt@kms_frontbuffer_tracking@fbc-suspend.html>
> >       +1 similar issue
> >    -
> >
> >    igt@kms_psr@psr2_cursor_plane_onoff:
> >    - shard-iclb: SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-iclb8/igt@kms_psr@psr2_cursor_plane_onoff.html>
> >       ([fdo#109441]) -> PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html>
> >       +1 similar issue
> >
> > Warnings
> >
> >    -
> >
> >    igt@gem_exec_fair@basic-none-rrul@rcs0:
> >    - shard-iclb: FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-iclb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
> >       ([i915#2842]) -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
> >       ([i915#2852])
> >    -
> >
> >    igt@kms_dp_dsc@basic-dsc-enable-edp:
> >    - shard-iclb: SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html>
> >       ([fdo#109349]) -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html>
> >       ([i915#1226])
> >    -
> >
> >    igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
> >    - shard-iclb: SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10282/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html>
> >       ([i915#2920]) -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5952/shard-iclb1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html>
> >       ([i915#658])
> >    -
> >
> >    igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
> >    - shard-iclb: [SKIP][144] ([i915#
> >
> >

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev


-- 
Rodrigo Siqueira
https://siqueira.tech
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
