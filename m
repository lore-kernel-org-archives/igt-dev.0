Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB196EB6C
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Mar 2021 17:00:07 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id g8so3524053lfv.12
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Mar 2021 10:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210323150851.209365-1-markyacoub@chromium.org>
 <161661819759.19037.1754458381205940638@emeril.freedesktop.org>
In-Reply-To: <161661819759.19037.1754458381205940638@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 25 Mar 2021 12:59:54 -0400
Message-ID: <CAJUqKUogsmr9RV-UraSN72ab4pGtPRxSpvNWCknnQ29RJ_8wcA@mail.gmail.com>
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
	=?utf-8?q?kms=5Fatomic=5Ftransition=3A_Enable_Primary_Plane_on_Ena?=
	=?utf-8?q?bling_CRTC=2E_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0915621890=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0915621890==
Content-Type: multipart/alternative; boundary="000000000000d6fa9405be5f586a"

--000000000000d6fa9405be5f586a
Content-Type: text/plain; charset="UTF-8"

I don't think this is me but just an unrelated flake, can someone please
take a look?

On Wed, Mar 24, 2021 at 4:36 PM Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* tests/kms_atomic_transition: Enable Primary Plane on Enabling
> CRTC. (rev2)
> *URL:* https://patchwork.freedesktop.org/series/88327/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/index.html CI
> Bug Log - changes from CI_DRM_9888_full -> IGTPW_5654_full Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_5654_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_5654_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/index.html
> Possible new issues
>
> Here are the unknown changes that may have been introduced in
> IGTPW_5654_full:
> IGT changes Possible regressions
>
>    - igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
>       - shard-snb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-snb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-snb6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html>
>
> Known issues
>
> Here are the changes found in IGTPW_5654_full that come from known issues:
> IGT changes Issues hit
>
>    -
>
>    igt@feature_discovery@display-3x:
>    -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@feature_discovery@display-3x.html>
>       ([fdo#109271]) +72 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@feature_discovery@display-3x.html>
>       ([i915#1839])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb1/igt@feature_discovery@display-3x.html>
>       ([i915#1839])
>       -
>
>    igt@gem_ctx_param@set-priority-not-supported:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb3/igt@gem_ctx_param@set-priority-not-supported.html>
>       ([fdo#109314])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb4/igt@gem_ctx_param@set-priority-not-supported.html>
>       ([fdo#109314])
>       -
>
>    igt@gem_ctx_persistence@legacy-engines-mixed:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-snb6/igt@gem_ctx_persistence@legacy-engines-mixed.html>
>       ([fdo#109271] / [i915#1099]) +5 similar issues
>    -
>
>    igt@gem_exec_fair@basic-deadline:
>    -
>
>       shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl1/igt@gem_exec_fair@basic-deadline.html>
>       ([i915#2846])
>       -
>
>       shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@gem_exec_fair@basic-deadline.html>
>       ([i915#2846])
>       -
>
>       shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl3/igt@gem_exec_fair@basic-deadline.html>
>       ([i915#2846])
>       -
>
>    igt@gem_exec_fair@basic-none-rrul@rcs0:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-kbl3/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl2/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>       ([i915#2842])
>    -
>
>    igt@gem_exec_fair@basic-none-share@rcs0:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html>
>       ([i915#2842])
>    -
>
>    igt@gem_exec_fair@basic-none-vip@rcs0:
>    - shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>       ([i915#2842])
>    -
>
>    igt@gem_exec_fair@basic-pace@rcs0:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-tglb1/igt@gem_exec_fair@basic-pace@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb3/igt@gem_exec_fair@basic-pace@rcs0.html>
>       ([i915#2842])
>    -
>
>    igt@gem_exec_fair@basic-pace@vcs1:
>    - shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html>
>       ([i915#2842]) +2 similar issues
>    -
>
>    igt@gem_exec_fair@basic-throttle@rcs0:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.html>
>       ([i915#2842]) +1 similar issue
>    -
>
>    igt@gem_exec_params@no-vebox:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@gem_exec_params@no-vebox.html>
>       ([fdo#109283])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@gem_exec_params@no-vebox.html>
>       ([fdo#109283])
>       -
>
>    igt@gem_exec_reloc@basic-many-active@vcs1:
>    - shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb4/igt@gem_exec_reloc@basic-many-active@vcs1.html>
>       ([i915#2389])
>    -
>
>    igt@gem_exec_reloc@basic-parallel:
>    -
>
>       shard-kbl: NOTRUN -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl7/igt@gem_exec_reloc@basic-parallel.html>
>       ([i915#3183])
>       -
>
>       shard-tglb: NOTRUN -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb1/igt@gem_exec_reloc@basic-parallel.html>
>       ([i915#3183])
>       -
>
>       shard-apl: NOTRUN -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@gem_exec_reloc@basic-parallel.html>
>       ([i915#3183])
>       -
>
>       shard-iclb: NOTRUN -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@gem_exec_reloc@basic-parallel.html>
>       ([i915#3183])
>       -
>
>       shard-glk: NOTRUN -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@gem_exec_reloc@basic-parallel.html>
>       ([i915#3183])
>       -
>
>    igt@gem_exec_schedule@u-fairslice@bcs0:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb3/igt@gem_exec_schedule@u-fairslice@bcs0.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@gem_exec_schedule@u-fairslice@bcs0.html>
>       ([i915#2803])
>    -
>
>    igt@gem_exec_schedule@u-fairslice@rcs0:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-apl7/igt@gem_exec_schedule@u-fairslice@rcs0.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl1/igt@gem_exec_schedule@u-fairslice@rcs0.html>
>       ([i915#1610])
>    -
>
>    igt@gem_exec_schedule@u-fairslice@vecs0:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-kbl1/igt@gem_exec_schedule@u-fairslice@vecs0.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl4/igt@gem_exec_schedule@u-fairslice@vecs0.html>
>       ([i915#1610] / [i915#2803])
>    -
>
>    igt@gem_pwrite@basic-exhaustion:
>    - shard-apl: NOTRUN -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl7/igt@gem_pwrite@basic-exhaustion.html>
>       ([i915#2658])
>    -
>
>    igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html>
>       ([i915#768])
>    -
>
>    igt@gem_softpin@evict-snoop:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@gem_softpin@evict-snoop.html>
>       ([fdo#109312])
>    -
>
>    igt@gem_userptr_blits@coherency-unsync:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@gem_userptr_blits@coherency-unsync.html>
>       ([fdo#110542]) +1 similar issue
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@gem_userptr_blits@coherency-unsync.html>
>       ([fdo#109290])
>       -
>
>    igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-snb6/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html>
>       ([fdo#109271]) +353 similar issues
>    -
>
>    igt@gen3_render_tiledx_blits:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb1/igt@gen3_render_tiledx_blits.html>
>       ([fdo#109289]) +1 similar issue
>    -
>
>    igt@gen9_exec_parse@bb-secure:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb7/igt@gen9_exec_parse@bb-secure.html>
>       ([fdo#112306]) +3 similar issues
>    -
>
>    igt@gen9_exec_parse@valid-registers:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@gen9_exec_parse@valid-registers.html>
>       ([fdo#112306]) +3 similar issues
>    -
>
>    igt@i915_hangman@engine-error@rcs0:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@i915_hangman@engine-error@rcs0.html>
>       ([fdo#109271]) +188 similar issues
>    -
>
>    igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html>
>       ([fdo#109271] / [i915#1937])
>    -
>
>    igt@i915_selftest@live@hangcheck:
>    - shard-snb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-snb7/igt@i915_selftest@live@hangcheck.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-snb5/igt@i915_selftest@live@hangcheck.html>
>       ([i915#2782])
>    -
>
>    igt@kms_big_fb@linear-16bpp-rotate-270:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb7/igt@kms_big_fb@linear-16bpp-rotate-270.html>
>       ([fdo#111614]) +1 similar issue
>    -
>
>    igt@kms_big_fb@linear-64bpp-rotate-270:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_big_fb@linear-64bpp-rotate-270.html>
>       ([fdo#110725] / [fdo#111614]) +1 similar issue
>    -
>
>    igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>       ([fdo#111615]) +5 similar issues
>    -
>
>    igt@kms_chamelium@dp-hpd-storm:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@kms_chamelium@dp-hpd-storm.html>
>       ([fdo#109284] / [fdo#111827]) +10 similar issues
>    -
>
>    igt@kms_chamelium@hdmi-edid-read:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb6/igt@kms_chamelium@hdmi-edid-read.html>
>       ([fdo#109284] / [fdo#111827]) +12 similar issues
>    -
>
>    igt@kms_chamelium@hdmi-hpd-for-each-pipe:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl7/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html>
>       ([fdo#109271] / [fdo#111827]) +14 similar issues
>    -
>
>    igt@kms_chamelium@hdmi-mode-timings:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-snb5/igt@kms_chamelium@hdmi-mode-timings.html>
>       ([fdo#109271] / [fdo#111827]) +20 similar issues
>    -
>
>    igt@kms_color@pipe-c-degamma:
>    - shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@kms_color@pipe-c-degamma.html>
>       ([i915#1149])
>    -
>
>    igt@kms_color@pipe-d-ctm-0-5:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_color@pipe-d-ctm-0-5.html>
>       ([fdo#109278] / [i915#1149]) +1 similar issue
>    -
>
>    igt@kms_color_chamelium@pipe-a-ctm-limited-range:
>    -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html>
>       ([fdo#109271] / [fdo#111827]) +21 similar issues
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html>
>       ([fdo#109271] / [fdo#111827]) +13 similar issues
>       -
>
>    igt@kms_content_protection@srm:
>    - shard-apl: NOTRUN -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl2/igt@kms_content_protection@srm.html>
>       ([i915#1319])
>    -
>
>    igt@kms_cursor_crc@pipe-c-cursor-512x170-random:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@kms_cursor_crc@pipe-c-cursor-512x170-random.html>
>       ([fdo#109278] / [fdo#109279])
>    -
>
>    igt@kms_cursor_crc@pipe-d-cursor-512x170-random:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x170-random.html>
>       ([fdo#109279])
>    -
>
>    igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html>
>       ([fdo#109278]) +11 similar issues
>    -
>
>    igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html>
>       ([fdo#109274] / [fdo#109278]) +2 similar issues
>    -
>
>    igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
>    - shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html>
>       ([i915#52] / [i915#54])
>    -
>
>    igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html>
>       ([i915#52] / [i915#54]) +2 similar issues
>    -
>
>    igt@kms_flip@2x-nonexisting-fb:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb4/igt@kms_flip@2x-nonexisting-fb.html>
>       ([fdo#109274]) +4 similar issues
>    -
>
>    igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
>    - shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html>
>       ([i915#2122])
>    -
>
>    igt@kms_flip@flip-vs-suspend@a-dp1:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-apl1/igt@kms_flip@flip-vs-suspend@a-dp1.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@kms_flip@flip-vs-suspend@a-dp1.html>
>       ([i915#180])
>    -
>
>    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html>
>       ([i915#2641])
>    -
>
>    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html>
>       ([fdo#109271] / [i915#2672])
>    -
>
>    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html>
>       ([fdo#109271] / [i915#2642])
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-2p-rte:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html>
>       ([fdo#111825]) +27 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html>
>       ([fdo#109280]) +15 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html>
>       ([i915#49]) +2 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html>
>       ([fdo#109271]) +85 similar issues
>    -
>
>    igt@kms_invalid_dotclock:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb3/igt@kms_invalid_dotclock.html>
>       ([fdo#110577])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb8/igt@kms_invalid_dotclock.html>
>       ([fdo#109310])
>       -
>
>    igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
>    -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html>
>       ([fdo#109271] / [i915#533]) +1 similar issue
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html>
>       ([fdo#109271] / [i915#533]) +1 similar issue
>       -
>
>    igt@kms_pipe_crc_basic@read-crc-pipe-d:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl6/igt@kms_pipe_crc_basic@read-crc-pipe-d.html>
>       ([fdo#109271] / [i915#533]) +2 similar issues
>    -
>
>    igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html>
>       ([fdo#108145] / [i915#265])
>    -
>
>    igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html>
>       ([i915#265])
>    -
>
>    igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
>    -
>
>       shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html>
>       ([fdo#108145] / [i915#265])
>       -
>
>       shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html>
>       ([fdo#108145] / [i915#265])
>       -
>
>    igt@kms_plane_lowres@pipe-a-tiling-none:
>    - shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-none.html>
>       ([i915#899])
>    -
>
>    igt@kms_plane_lowres@pipe-b-tiling-yf:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb6/igt@kms_plane_lowres@pipe-b-tiling-yf.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_plane_lowres@pipe-b-tiling-yf.html>
>       ([i915#899])
>    -
>
>    igt@kms_prime@basic-crc@first-to-second:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@kms_prime@basic-crc@first-to-second.html>
>       ([i915#1836])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb1/igt@kms_prime@basic-crc@first-to-second.html>
>       ([i915#1836])
>       -
>
>    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html>
>       ([i915#658]) +1 similar issue
>       -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html>
>       ([fdo#109271] / [i915#658]) +4 similar issues
>       -
>
>    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5.html>
>       ([i915#2920])
>    -
>
>    igt@kms_psr2_sf@plane-move-sf-dmg-area-2:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl1/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html>
>       ([fdo#109271] / [i915#658]) +3 similar issues
>    -
>
>    igt@kms_psr2_su@frontbuffer:
>    -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk9/igt@kms_psr2_su@frontbuffer.html>
>       ([fdo#109271] / [i915#658]) +4 similar issues
>       -
>
>       shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@kms_psr2_su@frontbuffer.html>
>       ([i915#2596])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@kms_psr2_su@frontbuffer.html>
>       ([fdo#109642] / [fdo#111068] / [i915#658])
>       -
>
>    igt@kms_psr2_su@page_flip:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb2/igt@kms_psr2_su@page_flip.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@kms_psr2_su@page_flip.html>
>       ([fdo#109642] / [fdo#111068] / [i915#658])
>    -
>
>    igt@kms_psr@psr2_primary_mmap_cpu:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html>
>       ([fdo#109441]) +1 similar issue
>    -
>
>    igt@kms_psr@psr2_sprite_mmap_gtt:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_gtt.html>
>       ([fdo#109441])
>    -
>
>    igt@kms_vrr@flip-suspend:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_vrr@flip-suspend.html>
>       ([fdo#109502])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@kms_vrr@flip-suspend.html>
>       ([fdo#109502])
>       -
>
>    igt@kms_writeback@writeback-invalid-parameters:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@kms_writeback@writeback-invalid-parameters.html>
>       ([i915#2437])
>       -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl6/igt@kms_writeback@writeback-invalid-parameters.html>
>       ([fdo#109271] / [i915#2437])
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk5/igt@kms_writeback@writeback-invalid-parameters.html>
>       ([fdo#109271] / [i915#2437])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@kms_writeback@writeback-invalid-parameters.html>
>       ([i915#2437])
>       -
>
>    igt@kms_writeback@writeback-pixel-formats:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@kms_writeback@writeback-pixel-formats.html>
>       ([fdo#109271] / [i915#2437])
>    -
>
>    igt@nouveau_crc@ctx-flip-threshold-reset-after-capture:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@nouveau_crc@ctx-flip-threshold-reset-after-capture.html>
>       ([i915#2530])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@nouveau_crc@ctx-flip-threshold-reset-after-capture.html>
>       ([i915#2530])
>       -
>
>    igt@perf@per-context-mode-unprivileged:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@perf@per-context-mode-unprivileged.html>
>       ([fdo#109289])
>    -
>
>    igt@perf@polling-parameterized:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-apl2/igt@perf@polling-parameterized.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl6/igt@perf@polling-parameterized.html>
>       ([i915#1542])
>    -
>
>    igt@prime_nv_api@i915_nv_import_twice_check_flink_name:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb1/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html>
>       ([fdo#109291]) +2 similar issues
>    -
>
>    igt@prime_nv_pcopy@test3_2:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb8/igt@prime_nv_pcopy@test3_2.html>
>       ([fdo#109291]) +2 similar issues
>    -
>
>    igt@prime_vgem@fence-write-hang:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@prime_vgem@fence-write-hang.html>
>       ([fdo#109295])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb7/igt@prime_vgem@fence-write-hang.html>
>       ([fdo#109295])
>       -
>
>    igt@sysfs_clients@recycle:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@sysfs_clients@recycle.html>
>       ([i915#3028])
>    -
>
>    igt@sysfs_clients@recycle-many:
>    -
>
>       shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb5/igt@sysfs_clients@recycle-many.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@sysfs_clients@recycle-many.html>
>       ([i915#3028])
>       -
>
>       shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-kbl1/igt@sysfs_clients@recycle-many.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl2/igt@sysfs_clients@recycle-many.html>
>       ([i915#3028])
>       -
>
>       shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-tglb7/igt@sysfs_clients@recycle-many.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb6/igt@sysfs_clients@recycle-many.html>
>       ([i915#3028])
>       -
>
>    igt@sysfs_clients@sema-10@rcs0:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-apl7/igt@sysfs_clients@sema-10@rcs0.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl2/igt@sysfs_clients@sema-10@rcs0.html>
>       ([fdo#109271] / [i915#3026])
>    -
>
>    igt@sysfs_clients@split-10@bcs0:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl1/igt@sysfs_clients@split-10@bcs0.html>
>       ([fdo#109271] / [i915#3026])
>    -
>
>    igt@sysfs_heartbeat_interval@mixed@rcs0:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-kbl3/igt@sysfs_heartbeat_interval@mixed@rcs0.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl6/igt@sysfs_heartbeat_interval@mixed@rcs0.html>
>       ([i915#1731])
>
> Possible fixes
>
>    -
>
>    igt@feature_discovery@psr2:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb3/igt@feature_discovery@psr2.html>
>       ([i915#658]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@feature_discovery@psr2.html>
>    -
>
>    igt@gem_eio@in-flight-contexts-immediate:
>    - shard-tglb: TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-tglb6/igt@gem_eio@in-flight-contexts-immediate.html>
>       ([i915#3063]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@gem_eio@in-flight-contexts-immediate.html>
>    -
>
>    igt@gem_exec_fair@basic-flow@rcs0:
>    - shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html>
>       ([i915#2842]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html>
>       +1 similar issue
>    -
>
>    igt@gem_exec_fair@basic-none@vcs0:
>    - shard-kbl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html>
>       ([i915#2842]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/s> +3 similar
>       issues
>
>

--000000000000d6fa9405be5f586a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t think this is me but just an unrelated flake, =
can someone please take a look?<br></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 24, 2021 at 4:36 PM Patchwor=
k &lt;<a href=3D"mailto:patchwork@emeril.freedesktop.org">patchwork@emeril.=
freedesktop.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>tests/kms_atomic_transition: Enable P=
rimary Plane on Enabling CRTC. (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/88327/" target=3D"_blank">https://patchwork.freedesktop.org/series/883=
27/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5654/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from CI_DRM_9888_full -&gt; IGTPW_5654_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5654_full absolutely need to b=
e<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_5654_full, please notify your bug team to allow them<=
br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5654/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5654/index.html</a></p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5654=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9888/shard-snb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html=
" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5654/shard-snb6/igt@kms_pipe_crc_basic@suspend-read-crc-p=
ipe-b.html" target=3D"_blank">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5654_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-glk3/igt@feature_discovery@display-3x.html" t=
arget=3D"_blank">SKIP</a> ([fdo#109271]) +72 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-iclb7/igt@feature_discovery@display-3x.html" =
target=3D"_blank">SKIP</a> ([i915#1839])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-tglb1/igt@feature_discovery@display-3x.html" =
target=3D"_blank">SKIP</a> ([i915#1839])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-tglb3/igt@gem_ctx_param@set-priority-not-supp=
orted.html" target=3D"_blank">SKIP</a> ([fdo#109314])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-iclb4/igt@gem_ctx_param@set-priority-not-supp=
orted.html" target=3D"_blank">SKIP</a> ([fdo#109314])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-snb6/igt@gem_ctx_persistence@legacy-engines-=
mixed.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#1099]) +5 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-kbl1/igt@gem_exec_fair@basic-deadline.html" t=
arget=3D"_blank">FAIL</a> ([i915#2846])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-glk3/igt@gem_exec_fair@basic-deadline.html" t=
arget=3D"_blank">FAIL</a> ([i915#2846])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-apl3/igt@gem_exec_fair@basic-deadline.html" t=
arget=3D"_blank">FAIL</a> ([i915#2846])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9888/shard-kbl3/igt@gem_exec_fair@basic-none-rrul@rcs0.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5654/shard-kbl2/igt@gem_exec_fair@basic-none-rrul@rcs0.html" targ=
et=3D"_blank">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9888/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html" targ=
et=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5654/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html" =
target=3D"_blank">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@gem_exec_fair@basic-none-vip@rcs0.=
html" target=3D"_blank">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9888/shard-tglb1/igt@gem_exec_fair@basic-pace@rcs0.html" target=3D"=
_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5654/shard-tglb3/igt@gem_exec_fair@basic-pace@rcs0.html" target=3D"_b=
lank">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html=
" target=3D"_blank">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9888/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5654/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.html" targe=
t=3D"_blank">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-iclb5/igt@gem_exec_params@no-vebox.html" targ=
et=3D"_blank">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-tglb2/igt@gem_exec_params@no-vebox.html" targ=
et=3D"_blank">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-iclb4/igt@gem_exec_reloc@basic-many-active@v=
cs1.html" target=3D"_blank">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-parallel:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-kbl7/igt@gem_exec_reloc@basic-parallel.html" =
target=3D"_blank">TIMEOUT</a> ([i915#3183])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-tglb1/igt@gem_exec_reloc@basic-parallel.html"=
 target=3D"_blank">TIMEOUT</a> ([i915#3183])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-apl8/igt@gem_exec_reloc@basic-parallel.html" =
target=3D"_blank">TIMEOUT</a> ([i915#3183])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-iclb7/igt@gem_exec_reloc@basic-parallel.html"=
 target=3D"_blank">TIMEOUT</a> ([i915#3183])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-glk3/igt@gem_exec_reloc@basic-parallel.html" =
target=3D"_blank">TIMEOUT</a> ([i915#3183])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@bcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9888/shard-iclb3/igt@gem_exec_schedule@u-fairslice@bcs0.html" targe=
t=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5654/shard-iclb5/igt@gem_exec_schedule@u-fairslice@bcs0.html" ta=
rget=3D"_blank">DMESG-WARN</a> ([i915#2803])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9888/shard-apl7/igt@gem_exec_schedule@u-fairslice@rcs0.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5654/shard-apl1/igt@gem_exec_schedule@u-fairslice@rcs0.html" targ=
et=3D"_blank">DMESG-WARN</a> ([i915#1610])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9888/shard-kbl1/igt@gem_exec_schedule@u-fairslice@vecs0.html" targe=
t=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5654/shard-kbl4/igt@gem_exec_schedule@u-fairslice@vecs0.html" ta=
rget=3D"_blank">DMESG-WARN</a> ([i915#1610] / [i915#2803])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-apl7/igt@gem_pwrite@basic-exhaustion.html" t=
arget=3D"_blank">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-iclb1/igt@gem_render_copy@y-tiled-mc-ccs-to-=
vebox-y-tiled.html" target=3D"_blank">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@gem_softpin@evict-snoop.html" targ=
et=3D"_blank">SKIP</a> ([fdo#109312])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-tglb2/igt@gem_userptr_blits@coherency-unsync.=
html" target=3D"_blank">SKIP</a> ([fdo#110542]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-iclb5/igt@gem_userptr_blits@coherency-unsync.=
html" target=3D"_blank">SKIP</a> ([fdo#109290])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-snb6/igt@gem_userptr_blits@mmap-offset-inval=
idate-active@wb.html" target=3D"_blank">SKIP</a> ([fdo#109271]) +353 simila=
r issues</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-tglb1/igt@gen3_render_tiledx_blits.html" tar=
get=3D"_blank">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-tglb7/igt@gen9_exec_parse@bb-secure.html" ta=
rget=3D"_blank">SKIP</a> ([fdo#112306]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@gen9_exec_parse@valid-registers.ht=
ml" target=3D"_blank">SKIP</a> ([fdo#112306]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-error@rcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-apl8/igt@i915_hangman@engine-error@rcs0.html=
" target=3D"_blank">SKIP</a> ([fdo#109271]) +188 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-apl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.h=
tml" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9888/shard-snb7/igt@i915_selftest@live@hangcheck.html" target=3D"_b=
lank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5654/shard-snb5/igt@i915_selftest@live@hangcheck.html" target=3D"_blank=
">INCOMPLETE</a> ([i915#2782])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-tglb7/igt@kms_big_fb@linear-16bpp-rotate-270=
.html" target=3D"_blank">SKIP</a> ([fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_big_fb@linear-64bpp-rotate-270=
.html" target=3D"_blank">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar =
issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-tglb8/igt@kms_big_fb@yf-tiled-addfb-size-ove=
rflow.html" target=3D"_blank">SKIP</a> ([fdo#111615]) +5 similar issues</li=
>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@kms_chamelium@dp-hpd-storm.html" t=
arget=3D"_blank">SKIP</a> ([fdo#109284] / [fdo#111827]) +10 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-tglb6/igt@kms_chamelium@hdmi-edid-read.html"=
 target=3D"_blank">SKIP</a> ([fdo#109284] / [fdo#111827]) +12 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-kbl7/igt@kms_chamelium@hdmi-hpd-for-each-pip=
e.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +14 simila=
r issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-mode-timings:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-snb5/igt@kms_chamelium@hdmi-mode-timings.htm=
l" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +20 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-degamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@kms_color@pipe-c-degamma.html" tar=
get=3D"_blank">FAIL</a> ([i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_color@pipe-d-ctm-0-5.html" tar=
get=3D"_blank">SKIP</a> ([fdo#109278] / [i915#1149]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-limited-range:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-apl8/igt@kms_color_chamelium@pipe-a-ctm-limit=
ed-range.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +21=
 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-glk3/igt@kms_color_chamelium@pipe-a-ctm-limit=
ed-range.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +13=
 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-apl2/igt@kms_content_protection@srm.html" ta=
rget=3D"_blank">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@kms_cursor_crc@pipe-c-cursor-512x1=
70-random.html" target=3D"_blank">SKIP</a> ([fdo#109278] / [fdo#109279])</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x1=
70-random.html" target=3D"_blank">SKIP</a> ([fdo#109279])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@kms_cursor_crc@pipe-d-cursor-64x21=
-sliding.html" target=3D"_blank">SKIP</a> ([fdo#109278]) +11 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipb=
-legacy.html" target=3D"_blank">SKIP</a> ([fdo#109274] / [fdo#109278]) +2 s=
imilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mma=
p-gtt-ytiled.html" target=3D"_blank">FAIL</a> ([i915#52] / [i915#54])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9888/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.=
html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5654/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-m=
map-wc-ytiled.html" target=3D"_blank">FAIL</a> ([i915#52] / [i915#54]) +2 s=
imilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-iclb4/igt@kms_flip@2x-nonexisting-fb.html" t=
arget=3D"_blank">SKIP</a> ([fdo#109274]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@kms_flip@flip-vs-blocking-wf-vblan=
k@a-edp1.html" target=3D"_blank">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9888/shard-apl1/igt@kms_flip@flip-vs-suspend@a-dp1.html" target=3D"=
_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5654/shard-apl8/igt@kms_flip@flip-vs-suspend@a-dp1.html" target=3D"_b=
lank">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-apl2/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-32bpp-ytileccs.html" target=3D"_blank">FAIL</a> ([i915#2641])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-apl6/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-32bpp-ytilegen12rcccs.html" target=3D"_blank">SKIP</a> ([fdo#109271] /=
 [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-64bpp-ytile.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#264=
2])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-2p-rt=
e.html" target=3D"_blank">SKIP</a> ([fdo#111825]) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-pri-shrfb-draw-render.html" target=3D"_blank">SKIP</a> ([fdo#1092=
80]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9888/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-i=
ndfb-draw-blt.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_frontbuffer_tr=
acking@psr-1p-primscrn-spr-indfb-draw-blt.html" target=3D"_blank">FAIL</a> =
([i915#49]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-kbl7/igt@kms_frontbuffer_tracking@psr-rgb101=
010-draw-mmap-wc.html" target=3D"_blank">SKIP</a> ([fdo#109271]) +85 simila=
r issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_dotclock:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-tglb3/igt@kms_invalid_dotclock.html" target=
=3D"_blank">SKIP</a> ([fdo#110577])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-iclb8/igt@kms_invalid_dotclock.html" target=
=3D"_blank">SKIP</a> ([fdo#109310])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-apl8/igt@kms_pipe_crc_basic@compare-crc-sanit=
ycheck-pipe-d.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#533]) =
+1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-glk3/igt@kms_pipe_crc_basic@compare-crc-sanit=
ycheck-pipe-d.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#533]) =
+1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-kbl6/igt@kms_pipe_crc_basic@read-crc-pipe-d.=
html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-=
basic.html" target=3D"_blank">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html" target=3D"_blank">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-glk6/igt@kms_plane_alpha_blend@pipe-b-constan=
t-alpha-max.html" target=3D"_blank">FAIL</a> ([fdo#108145] / [i915#265])</p=
>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-constan=
t-alpha-max.html" target=3D"_blank">FAIL</a> ([fdo#108145] / [i915#265])</p=
>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-none:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-none=
.html" target=3D"_blank">FAIL</a> ([i915#899])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-yf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9888/shard-iclb6/igt@kms_plane_lowres@pipe-b-tiling-yf.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5654/shard-iclb2/igt@kms_plane_lowres@pipe-b-tiling-yf.html" targ=
et=3D"_blank">FAIL</a> ([i915#899])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-iclb7/igt@kms_prime@basic-crc@first-to-second=
.html" target=3D"_blank">SKIP</a> ([i915#1836])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-tglb1/igt@kms_prime@basic-crc@first-to-second=
.html" target=3D"_blank">SKIP</a> ([i915#1836])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-iclb1/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-4.html" target=3D"_blank">SKIP</a> ([i915#658]) +1 similar issue<=
/p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area-4.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#658]) +4 =
similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-s=
f-dmg-area-5.html" target=3D"_blank">SKIP</a> ([i915#2920])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-apl1/igt@kms_psr2_sf@plane-move-sf-dmg-area-=
2.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-glk9/igt@kms_psr2_su@frontbuffer.html" target=
=3D"_blank">SKIP</a> ([fdo#109271] / [i915#658]) +4 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-tglb2/igt@kms_psr2_su@frontbuffer.html" targe=
t=3D"_blank">FAIL</a> ([i915#2596])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-iclb5/igt@kms_psr2_su@frontbuffer.html" targe=
t=3D"_blank">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9888/shard-iclb2/igt@kms_psr2_su@page_flip.html" target=3D"_blank">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_56=
54/shard-iclb5/igt@kms_psr2_su@page_flip.html" target=3D"_blank">SKIP</a> (=
[fdo#109642] / [fdo#111068] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9888/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html" target=3D"=
_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5654/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html" target=3D"_b=
lank">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_gtt.html"=
 target=3D"_blank">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_vrr@flip-suspend.html" target=
=3D"_blank">SKIP</a> ([fdo#109502])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-tglb5/igt@kms_vrr@flip-suspend.html" target=
=3D"_blank">SKIP</a> ([fdo#109502])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-tglb5/igt@kms_writeback@writeback-invalid-par=
ameters.html" target=3D"_blank">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-kbl6/igt@kms_writeback@writeback-invalid-para=
meters.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-glk5/igt@kms_writeback@writeback-invalid-para=
meters.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-iclb3/igt@kms_writeback@writeback-invalid-par=
ameters.html" target=3D"_blank">SKIP</a> ([i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-apl8/igt@kms_writeback@writeback-pixel-forma=
ts.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@ctx-flip-threshold-reset-after-capture:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-iclb5/igt@nouveau_crc@ctx-flip-threshold-rese=
t-after-capture.html" target=3D"_blank">SKIP</a> ([i915#2530])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-tglb2/igt@nouveau_crc@ctx-flip-threshold-rese=
t-after-capture.html" target=3D"_blank">SKIP</a> ([i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@perf@per-context-mode-unprivileged=
.html" target=3D"_blank">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9888/shard-apl2/igt@perf@polling-parameterized.html" target=3D"_bla=
nk">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5654/shard-apl6/igt@perf@polling-parameterized.html" target=3D"_blank">FA=
IL</a> ([i915#1542])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice_check_flink_name:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-iclb1/igt@prime_nv_api@i915_nv_import_twice_=
check_flink_name.html" target=3D"_blank">SKIP</a> ([fdo#109291]) +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_2:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-tglb8/igt@prime_nv_pcopy@test3_2.html" targe=
t=3D"_blank">SKIP</a> ([fdo#109291]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-iclb3/igt@prime_vgem@fence-write-hang.html" t=
arget=3D"_blank">SKIP</a> ([fdo#109295])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/shard-tglb7/igt@prime_vgem@fence-write-hang.html" t=
arget=3D"_blank">SKIP</a> ([fdo#109295])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-apl8/igt@sysfs_clients@recycle.html" target=
=3D"_blank">FAIL</a> ([i915#3028])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9888/shard-iclb5/igt@sysfs_clients@recycle-many.html" target=3D"_bla=
nk">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5654/shard-iclb5/igt@sysfs_clients@recycle-many.html" target=3D"_blank">F=
AIL</a> ([i915#3028])</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9888/shard-kbl1/igt@sysfs_clients@recycle-many.html" target=3D"_blan=
k">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5654/shard-kbl2/igt@sysfs_clients@recycle-many.html" target=3D"_blank">FAI=
L</a> ([i915#3028])</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9888/shard-tglb7/igt@sysfs_clients@recycle-many.html" target=3D"_bla=
nk">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5654/shard-tglb6/igt@sysfs_clients@recycle-many.html" target=3D"_blank">F=
AIL</a> ([i915#3028])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-10@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9888/shard-apl7/igt@sysfs_clients@sema-10@rcs0.html" target=3D"_bla=
nk">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5654/shard-apl2/igt@sysfs_clients@sema-10@rcs0.html" target=3D"_blank">SK=
IP</a> ([fdo#109271] / [i915#3026])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-apl1/igt@sysfs_clients@split-10@bcs0.html" t=
arget=3D"_blank">SKIP</a> ([fdo#109271] / [i915#3026])</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9888/shard-kbl3/igt@sysfs_heartbeat_interval@mixed@rcs0.html" targe=
t=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5654/shard-kbl6/igt@sysfs_heartbeat_interval@mixed@rcs0.html" ta=
rget=3D"_blank">INCOMPLETE</a> ([i915#1731])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9888/shard-iclb3/igt@feature_discovery@psr2.html" target=3D"_blank"=
>SKIP</a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5654/shard-iclb2/igt@feature_discovery@psr2.html" target=3D"_bl=
ank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-immediate:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9888/shard-tglb6/igt@gem_eio@in-flight-contexts-immediate.html" tar=
get=3D"_blank">TIMEOUT</a> ([i915#3063]) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@gem_eio@in-flight-contex=
ts-immediate.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9888/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html" target=3D"=
_blank">FAIL</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html=
" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9888/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html" target=3D"_=
blank">FAIL</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5654/s" target=3D"_blank">PASS</a> +3 similar issues</li=
>
</ul>
</li>
</ul>

</div>

</blockquote></div>

--000000000000d6fa9405be5f586a--

--===============0915621890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0915621890==--
