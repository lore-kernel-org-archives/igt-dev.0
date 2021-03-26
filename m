Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EF66E0FC
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Mar 2021 09:25:14 +0000 (UTC)
Date: Fri, 26 Mar 2021 11:25:57 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YF2opaUVX77vBIlE@platvala-desk.ger.corp.intel.com>
References: <20210323150851.209365-1-markyacoub@chromium.org>
 <161661819759.19037.1754458381205940638@emeril.freedesktop.org>
 <CAJUqKUogsmr9RV-UraSN72ab4pGtPRxSpvNWCknnQ29RJ_8wcA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJUqKUogsmr9RV-UraSN72ab4pGtPRxSpvNWCknnQ29RJ_8wcA@mail.gmail.com>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fatomic=5Ftransition=3A_Enable_Primary_Plane_on_Enabling_C?=
 =?utf-8?b?UlRDLiAocmV2Mik=?=
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
To: Mark Yacoub <markyacoub@chromium.org>, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

(Aside: Please subscribe to the mailing list to avoid delays with mail
delivery. Your mails get held in moderation queue without it.)

On Thu, Mar 25, 2021 at 12:59:54PM -0400, Mark Yacoub wrote:
> I don't think this is me but just an unrelated flake, can someone please
> take a look?


Yep, a false positive. Lakshmi, see below.




> 
> On Wed, Mar 24, 2021 at 4:36 PM Patchwork <patchwork@emeril.freedesktop.org>
> wrote:
> 
> > *Patch Details*
> > *Series:* tests/kms_atomic_transition: Enable Primary Plane on Enabling
> > CRTC. (rev2)
> > *URL:* https://patchwork.freedesktop.org/series/88327/
> > *State:* failure
> > *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/index.html CI
> > Bug Log - changes from CI_DRM_9888_full -> IGTPW_5654_full Summary
> >
> > *FAILURE*
> >
> > Serious unknown changes coming with IGTPW_5654_full absolutely need to be
> > verified manually.
> >
> > If you think the reported changes have nothing to do with the changes
> > introduced in IGTPW_5654_full, please notify your bug team to allow them
> > to document this new failure mode, which will reduce false positives in CI.
> >
> > External URL:
> > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/index.html
> > Possible new issues
> >
> > Here are the unknown changes that may have been introduced in
> > IGTPW_5654_full:
> > IGT changes Possible regressions
> >
> >    - igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
> >       - shard-snb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-snb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html>
> >       -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-snb6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html>
> >
> > Known issues
> >
> > Here are the changes found in IGTPW_5654_full that come from known issues:
> > IGT changes Issues hit
> >
> >    -
> >
> >    igt@feature_discovery@display-3x:
> >    -
> >
> >       shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@feature_discovery@display-3x.html>
> >       ([fdo#109271]) +72 similar issues
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@feature_discovery@display-3x.html>
> >       ([i915#1839])
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb1/igt@feature_discovery@display-3x.html>
> >       ([i915#1839])
> >       -
> >
> >    igt@gem_ctx_param@set-priority-not-supported:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb3/igt@gem_ctx_param@set-priority-not-supported.html>
> >       ([fdo#109314])
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb4/igt@gem_ctx_param@set-priority-not-supported.html>
> >       ([fdo#109314])
> >       -
> >
> >    igt@gem_ctx_persistence@legacy-engines-mixed:
> >    - shard-snb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-snb6/igt@gem_ctx_persistence@legacy-engines-mixed.html>
> >       ([fdo#109271] / [i915#1099]) +5 similar issues
> >    -
> >
> >    igt@gem_exec_fair@basic-deadline:
> >    -
> >
> >       shard-kbl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl1/igt@gem_exec_fair@basic-deadline.html>
> >       ([i915#2846])
> >       -
> >
> >       shard-glk: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@gem_exec_fair@basic-deadline.html>
> >       ([i915#2846])
> >       -
> >
> >       shard-apl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl3/igt@gem_exec_fair@basic-deadline.html>
> >       ([i915#2846])
> >       -
> >
> >    igt@gem_exec_fair@basic-none-rrul@rcs0:
> >    - shard-kbl: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-kbl3/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl2/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
> >       ([i915#2842])
> >    -
> >
> >    igt@gem_exec_fair@basic-none-share@rcs0:
> >    - shard-iclb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html>
> >       ([i915#2842])
> >    -
> >
> >    igt@gem_exec_fair@basic-none-vip@rcs0:
> >    - shard-tglb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@gem_exec_fair@basic-none-vip@rcs0.html>
> >       ([i915#2842])
> >    -
> >
> >    igt@gem_exec_fair@basic-pace@rcs0:
> >    - shard-tglb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-tglb1/igt@gem_exec_fair@basic-pace@rcs0.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb3/igt@gem_exec_fair@basic-pace@rcs0.html>
> >       ([i915#2842])
> >    -
> >
> >    igt@gem_exec_fair@basic-pace@vcs1:
> >    - shard-iclb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html>
> >       ([i915#2842]) +2 similar issues
> >    -
> >
> >    igt@gem_exec_fair@basic-throttle@rcs0:
> >    - shard-glk: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.html>
> >       ([i915#2842]) +1 similar issue
> >    -
> >
> >    igt@gem_exec_params@no-vebox:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@gem_exec_params@no-vebox.html>
> >       ([fdo#109283])
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@gem_exec_params@no-vebox.html>
> >       ([fdo#109283])
> >       -
> >
> >    igt@gem_exec_reloc@basic-many-active@vcs1:
> >    - shard-iclb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb4/igt@gem_exec_reloc@basic-many-active@vcs1.html>
> >       ([i915#2389])
> >    -
> >
> >    igt@gem_exec_reloc@basic-parallel:
> >    -
> >
> >       shard-kbl: NOTRUN -> TIMEOUT
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl7/igt@gem_exec_reloc@basic-parallel.html>
> >       ([i915#3183])
> >       -
> >
> >       shard-tglb: NOTRUN -> TIMEOUT
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb1/igt@gem_exec_reloc@basic-parallel.html>
> >       ([i915#3183])
> >       -
> >
> >       shard-apl: NOTRUN -> TIMEOUT
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@gem_exec_reloc@basic-parallel.html>
> >       ([i915#3183])
> >       -
> >
> >       shard-iclb: NOTRUN -> TIMEOUT
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@gem_exec_reloc@basic-parallel.html>
> >       ([i915#3183])
> >       -
> >
> >       shard-glk: NOTRUN -> TIMEOUT
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@gem_exec_reloc@basic-parallel.html>
> >       ([i915#3183])
> >       -
> >
> >    igt@gem_exec_schedule@u-fairslice@bcs0:
> >    - shard-iclb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb3/igt@gem_exec_schedule@u-fairslice@bcs0.html>
> >       -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@gem_exec_schedule@u-fairslice@bcs0.html>
> >       ([i915#2803])
> >    -
> >
> >    igt@gem_exec_schedule@u-fairslice@rcs0:
> >    - shard-apl: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-apl7/igt@gem_exec_schedule@u-fairslice@rcs0.html>
> >       -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl1/igt@gem_exec_schedule@u-fairslice@rcs0.html>
> >       ([i915#1610])
> >    -
> >
> >    igt@gem_exec_schedule@u-fairslice@vecs0:
> >    - shard-kbl: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-kbl1/igt@gem_exec_schedule@u-fairslice@vecs0.html>
> >       -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl4/igt@gem_exec_schedule@u-fairslice@vecs0.html>
> >       ([i915#1610] / [i915#2803])
> >    -
> >
> >    igt@gem_pwrite@basic-exhaustion:
> >    - shard-apl: NOTRUN -> WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl7/igt@gem_pwrite@basic-exhaustion.html>
> >       ([i915#2658])
> >    -
> >
> >    igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html>
> >       ([i915#768])
> >    -
> >
> >    igt@gem_softpin@evict-snoop:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@gem_softpin@evict-snoop.html>
> >       ([fdo#109312])
> >    -
> >
> >    igt@gem_userptr_blits@coherency-unsync:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@gem_userptr_blits@coherency-unsync.html>
> >       ([fdo#110542]) +1 similar issue
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@gem_userptr_blits@coherency-unsync.html>
> >       ([fdo#109290])
> >       -
> >
> >    igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:
> >    - shard-snb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-snb6/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html>
> >       ([fdo#109271]) +353 similar issues
> >    -
> >
> >    igt@gen3_render_tiledx_blits:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb1/igt@gen3_render_tiledx_blits.html>
> >       ([fdo#109289]) +1 similar issue
> >    -
> >
> >    igt@gen9_exec_parse@bb-secure:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb7/igt@gen9_exec_parse@bb-secure.html>
> >       ([fdo#112306]) +3 similar issues
> >    -
> >
> >    igt@gen9_exec_parse@valid-registers:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@gen9_exec_parse@valid-registers.html>
> >       ([fdo#112306]) +3 similar issues
> >    -
> >
> >    igt@i915_hangman@engine-error@rcs0:
> >    - shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@i915_hangman@engine-error@rcs0.html>
> >       ([fdo#109271]) +188 similar issues
> >    -
> >
> >    igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
> >    - shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html>
> >       ([fdo#109271] / [i915#1937])
> >    -
> >
> >    igt@i915_selftest@live@hangcheck:
> >    - shard-snb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-snb7/igt@i915_selftest@live@hangcheck.html>
> >       -> INCOMPLETE
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-snb5/igt@i915_selftest@live@hangcheck.html>
> >       ([i915#2782])
> >    -
> >
> >    igt@kms_big_fb@linear-16bpp-rotate-270:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb7/igt@kms_big_fb@linear-16bpp-rotate-270.html>
> >       ([fdo#111614]) +1 similar issue
> >    -
> >
> >    igt@kms_big_fb@linear-64bpp-rotate-270:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_big_fb@linear-64bpp-rotate-270.html>
> >       ([fdo#110725] / [fdo#111614]) +1 similar issue
> >    -
> >
> >    igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
> >       ([fdo#111615]) +5 similar issues
> >    -
> >
> >    igt@kms_chamelium@dp-hpd-storm:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@kms_chamelium@dp-hpd-storm.html>
> >       ([fdo#109284] / [fdo#111827]) +10 similar issues
> >    -
> >
> >    igt@kms_chamelium@hdmi-edid-read:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb6/igt@kms_chamelium@hdmi-edid-read.html>
> >       ([fdo#109284] / [fdo#111827]) +12 similar issues
> >    -
> >
> >    igt@kms_chamelium@hdmi-hpd-for-each-pipe:
> >    - shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl7/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html>
> >       ([fdo#109271] / [fdo#111827]) +14 similar issues
> >    -
> >
> >    igt@kms_chamelium@hdmi-mode-timings:
> >    - shard-snb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-snb5/igt@kms_chamelium@hdmi-mode-timings.html>
> >       ([fdo#109271] / [fdo#111827]) +20 similar issues
> >    -
> >
> >    igt@kms_color@pipe-c-degamma:
> >    - shard-iclb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@kms_color@pipe-c-degamma.html>
> >       ([i915#1149])
> >    -
> >
> >    igt@kms_color@pipe-d-ctm-0-5:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_color@pipe-d-ctm-0-5.html>
> >       ([fdo#109278] / [i915#1149]) +1 similar issue
> >    -
> >
> >    igt@kms_color_chamelium@pipe-a-ctm-limited-range:
> >    -
> >
> >       shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html>
> >       ([fdo#109271] / [fdo#111827]) +21 similar issues
> >       -
> >
> >       shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html>
> >       ([fdo#109271] / [fdo#111827]) +13 similar issues
> >       -
> >
> >    igt@kms_content_protection@srm:
> >    - shard-apl: NOTRUN -> TIMEOUT
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl2/igt@kms_content_protection@srm.html>
> >       ([i915#1319])
> >    -
> >
> >    igt@kms_cursor_crc@pipe-c-cursor-512x170-random:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@kms_cursor_crc@pipe-c-cursor-512x170-random.html>
> >       ([fdo#109278] / [fdo#109279])
> >    -
> >
> >    igt@kms_cursor_crc@pipe-d-cursor-512x170-random:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x170-random.html>
> >       ([fdo#109279])
> >    -
> >
> >    igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html>
> >       ([fdo#109278]) +11 similar issues
> >    -
> >
> >    igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html>
> >       ([fdo#109274] / [fdo#109278]) +2 similar issues
> >    -
> >
> >    igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
> >    - shard-glk: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html>
> >       ([i915#52] / [i915#54])
> >    -
> >
> >    igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
> >    - shard-glk: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html>
> >       ([i915#52] / [i915#54]) +2 similar issues
> >    -
> >
> >    igt@kms_flip@2x-nonexisting-fb:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb4/igt@kms_flip@2x-nonexisting-fb.html>
> >       ([fdo#109274]) +4 similar issues
> >    -
> >
> >    igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
> >    - shard-tglb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html>
> >       ([i915#2122])
> >    -
> >
> >    igt@kms_flip@flip-vs-suspend@a-dp1:
> >    - shard-apl: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-apl1/igt@kms_flip@flip-vs-suspend@a-dp1.html>
> >       -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@kms_flip@flip-vs-suspend@a-dp1.html>
> >       ([i915#180])
> >    -
> >
> >    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
> >    - shard-apl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html>
> >       ([i915#2641])
> >    -
> >
> >    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
> >    - shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html>
> >       ([fdo#109271] / [i915#2672])
> >    -
> >
> >    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
> >    - shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html>
> >       ([fdo#109271] / [i915#2642])
> >    -
> >
> >    igt@kms_frontbuffer_tracking@fbc-2p-rte:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html>
> >       ([fdo#111825]) +27 similar issues
> >    -
> >
> >    igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html>
> >       ([fdo#109280]) +15 similar issues
> >    -
> >
> >    igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
> >    - shard-iclb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html>
> >       ([i915#49]) +2 similar issues
> >    -
> >
> >    igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
> >    - shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html>
> >       ([fdo#109271]) +85 similar issues
> >    -
> >
> >    igt@kms_invalid_dotclock:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb3/igt@kms_invalid_dotclock.html>
> >       ([fdo#110577])
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb8/igt@kms_invalid_dotclock.html>
> >       ([fdo#109310])
> >       -
> >
> >    igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
> >    -
> >
> >       shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html>
> >       ([fdo#109271] / [i915#533]) +1 similar issue
> >       -
> >
> >       shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html>
> >       ([fdo#109271] / [i915#533]) +1 similar issue
> >       -
> >
> >    igt@kms_pipe_crc_basic@read-crc-pipe-d:
> >    - shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl6/igt@kms_pipe_crc_basic@read-crc-pipe-d.html>
> >       ([fdo#109271] / [i915#533]) +2 similar issues
> >    -
> >
> >    igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
> >    - shard-apl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html>
> >       ([fdo#108145] / [i915#265])
> >    -
> >
> >    igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
> >    - shard-apl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html>
> >       ([i915#265])
> >    -
> >
> >    igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
> >    -
> >
> >       shard-glk: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html>
> >       ([fdo#108145] / [i915#265])
> >       -
> >
> >       shard-kbl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html>
> >       ([fdo#108145] / [i915#265])
> >       -
> >
> >    igt@kms_plane_lowres@pipe-a-tiling-none:
> >    - shard-glk: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-none.html>
> >       ([i915#899])
> >    -
> >
> >    igt@kms_plane_lowres@pipe-b-tiling-yf:
> >    - shard-iclb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb6/igt@kms_plane_lowres@pipe-b-tiling-yf.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_plane_lowres@pipe-b-tiling-yf.html>
> >       ([i915#899])
> >    -
> >
> >    igt@kms_prime@basic-crc@first-to-second:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@kms_prime@basic-crc@first-to-second.html>
> >       ([i915#1836])
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb1/igt@kms_prime@basic-crc@first-to-second.html>
> >       ([i915#1836])
> >       -
> >
> >    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html>
> >       ([i915#658]) +1 similar issue
> >       -
> >
> >       shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html>
> >       ([fdo#109271] / [i915#658]) +4 similar issues
> >       -
> >
> >    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5.html>
> >       ([i915#2920])
> >    -
> >
> >    igt@kms_psr2_sf@plane-move-sf-dmg-area-2:
> >    - shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl1/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html>
> >       ([fdo#109271] / [i915#658]) +3 similar issues
> >    -
> >
> >    igt@kms_psr2_su@frontbuffer:
> >    -
> >
> >       shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk9/igt@kms_psr2_su@frontbuffer.html>
> >       ([fdo#109271] / [i915#658]) +4 similar issues
> >       -
> >
> >       shard-tglb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@kms_psr2_su@frontbuffer.html>
> >       ([i915#2596])
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@kms_psr2_su@frontbuffer.html>
> >       ([fdo#109642] / [fdo#111068] / [i915#658])
> >       -
> >
> >    igt@kms_psr2_su@page_flip:
> >    - shard-iclb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb2/igt@kms_psr2_su@page_flip.html>
> >       -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@kms_psr2_su@page_flip.html>
> >       ([fdo#109642] / [fdo#111068] / [i915#658])
> >    -
> >
> >    igt@kms_psr@psr2_primary_mmap_cpu:
> >    - shard-iclb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html>
> >       -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html>
> >       ([fdo#109441]) +1 similar issue
> >    -
> >
> >    igt@kms_psr@psr2_sprite_mmap_gtt:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_gtt.html>
> >       ([fdo#109441])
> >    -
> >
> >    igt@kms_vrr@flip-suspend:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_vrr@flip-suspend.html>
> >       ([fdo#109502])
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@kms_vrr@flip-suspend.html>
> >       ([fdo#109502])
> >       -
> >
> >    igt@kms_writeback@writeback-invalid-parameters:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@kms_writeback@writeback-invalid-parameters.html>
> >       ([i915#2437])
> >       -
> >
> >       shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl6/igt@kms_writeback@writeback-invalid-parameters.html>
> >       ([fdo#109271] / [i915#2437])
> >       -
> >
> >       shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk5/igt@kms_writeback@writeback-invalid-parameters.html>
> >       ([fdo#109271] / [i915#2437])
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@kms_writeback@writeback-invalid-parameters.html>
> >       ([i915#2437])
> >       -
> >
> >    igt@kms_writeback@writeback-pixel-formats:
> >    - shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@kms_writeback@writeback-pixel-formats.html>
> >       ([fdo#109271] / [i915#2437])
> >    -
> >
> >    igt@nouveau_crc@ctx-flip-threshold-reset-after-capture:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@nouveau_crc@ctx-flip-threshold-reset-after-capture.html>
> >       ([i915#2530])
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@nouveau_crc@ctx-flip-threshold-reset-after-capture.html>
> >       ([i915#2530])
> >       -
> >
> >    igt@perf@per-context-mode-unprivileged:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@perf@per-context-mode-unprivileged.html>
> >       ([fdo#109289])
> >    -
> >
> >    igt@perf@polling-parameterized:
> >    - shard-apl: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-apl2/igt@perf@polling-parameterized.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl6/igt@perf@polling-parameterized.html>
> >       ([i915#1542])
> >    -
> >
> >    igt@prime_nv_api@i915_nv_import_twice_check_flink_name:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb1/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html>
> >       ([fdo#109291]) +2 similar issues
> >    -
> >
> >    igt@prime_nv_pcopy@test3_2:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb8/igt@prime_nv_pcopy@test3_2.html>
> >       ([fdo#109291]) +2 similar issues
> >    -
> >
> >    igt@prime_vgem@fence-write-hang:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@prime_vgem@fence-write-hang.html>
> >       ([fdo#109295])
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb7/igt@prime_vgem@fence-write-hang.html>
> >       ([fdo#109295])
> >       -
> >
> >    igt@sysfs_clients@recycle:
> >    - shard-apl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@sysfs_clients@recycle.html>
> >       ([i915#3028])
> >    -
> >
> >    igt@sysfs_clients@recycle-many:
> >    -
> >
> >       shard-iclb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb5/igt@sysfs_clients@recycle-many.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@sysfs_clients@recycle-many.html>
> >       ([i915#3028])
> >       -
> >
> >       shard-kbl: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-kbl1/igt@sysfs_clients@recycle-many.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl2/igt@sysfs_clients@recycle-many.html>
> >       ([i915#3028])
> >       -
> >
> >       shard-tglb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-tglb7/igt@sysfs_clients@recycle-many.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb6/igt@sysfs_clients@recycle-many.html>
> >       ([i915#3028])
> >       -
> >
> >    igt@sysfs_clients@sema-10@rcs0:
> >    - shard-apl: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-apl7/igt@sysfs_clients@sema-10@rcs0.html>
> >       -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl2/igt@sysfs_clients@sema-10@rcs0.html>
> >       ([fdo#109271] / [i915#3026])
> >    -
> >
> >    igt@sysfs_clients@split-10@bcs0:
> >    - shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl1/igt@sysfs_clients@split-10@bcs0.html>
> >       ([fdo#109271] / [i915#3026])
> >    -
> >
> >    igt@sysfs_heartbeat_interval@mixed@rcs0:
> >    - shard-kbl: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-kbl3/igt@sysfs_heartbeat_interval@mixed@rcs0.html>
> >       -> INCOMPLETE
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl6/igt@sysfs_heartbeat_interval@mixed@rcs0.html>
> >       ([i915#1731])
> >
> > Possible fixes
> >
> >    -
> >
> >    igt@feature_discovery@psr2:
> >    - shard-iclb: SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb3/igt@feature_discovery@psr2.html>
> >       ([i915#658]) -> PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@feature_discovery@psr2.html>
> >    -
> >
> >    igt@gem_eio@in-flight-contexts-immediate:
> >    - shard-tglb: TIMEOUT
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-tglb6/igt@gem_eio@in-flight-contexts-immediate.html>
> >       ([i915#3063]) -> PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@gem_eio@in-flight-contexts-immediate.html>
> >    -
> >
> >    igt@gem_exec_fair@basic-flow@rcs0:
> >    - shard-tglb: FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html>
> >       ([i915#2842]) -> PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html>
> >       +1 similar issue
> >    -
> >
> >    igt@gem_exec_fair@basic-none@vcs0:
> >    - shard-kbl: FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html>
> >       ([i915#2842]) -> PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/s> +3 similar
> >       issues
> >
> >

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
