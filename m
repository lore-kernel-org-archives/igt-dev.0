Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BB26F582
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Nov 2021 09:51:06 +0000 (UTC)
Date: Tue, 30 Nov 2021 11:50:12 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YaXz1JqC6QXekQBZ@platvala-desk.ger.corp.intel.com>
References: <20211126140911.1556205-1-Rodrigo.Siqueira@amd.com>
 <163793928750.11078.15559582292236440457@emeril.freedesktop.org>
 <1fc1d16e-4f89-f3f3-e279-7e42e83e448b@amd.com>
 <4e04b2e2c6e44718a1d7ec702626037c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e04b2e2c6e44718a1d7ec702626037c@intel.com>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?amdgpu=3A_Introduces_DP_DSC_test?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Rodrigo Siqueira Jordao <rjordrigo@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

No, no, no. These failures are definitely caused by the patch
series. Even though it's "focused" on amdgpu tests, you're changing
igt_kms.h in a way that causes crashes and whatnot.


On Tue, Nov 30, 2021 at 12:20:19AM +0000, Vudum, Lakshminarayana wrote:
> Not sure what's really happening with this series, I haven't seen similar failures on post-merge with these signatures.
> I have updated the filter https://gitlab.freedesktop.org/drm/intel/-/issues/4638 to catch all similar failures from TGL and RKL.

Lakshmi, please revert that filter change.



-- 
Petri Latvala


> 
> Re-reported.
> 
> Lakshmi.
> 
> -----Original Message-----
> From: Rodrigo Siqueira Jordao <rjordrigo@amd.com> 
> Sent: Monday, November 29, 2021 2:42 PM
> To: igt-dev@lists.freedesktop.org; Rodrigo Siqueira <rodrigo.siqueira@amd.com>; Vudum, Lakshminarayana <lakshminarayana.vudum@intel.com>
> Subject: Re: ✗ Fi.CI.BAT: failure for tests/amdgpu: Introduces DP DSC test
> 
> Hi Lakshmi,
> 
> Sorry to bother you again, but do you think this is a false-positive?
> 
> Here is the link to the patch:
> https://patchwork.freedesktop.org/series/97325/
> 
> I suspect this is the case because this patch is focused on amdgpu tests.
> 
> Also, what is the difference between the Gitlab result and this CI BAT result?
> 
> Thanks
> 
> 
> On 2021-11-26 10:08 a.m., Patchwork wrote:
> > *Patch Details*
> > *Series:*	tests/amdgpu: Introduces DP DSC test
> > *URL:*	https://patchwork.freedesktop.org/series/97325/ 
> > <https://patchwork.freedesktop.org/series/97325/>> *State:*	failure
> > *Details:*
> > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/index.html
> > <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/index.html>>
> > 
> >   CI Bug Log - changes from IGT_6293 -> IGTPW_6442
> > 
> > 
> >     Summary
> > 
> > *FAILURE*
> > 
> > Serious unknown changes coming with IGTPW_6442 absolutely need to be 
> > verified manually.
> > 
> > If you think the reported changes have nothing to do with the changes 
> > introduced in IGTPW_6442, please notify your bug team to allow them to 
> > document this new failure mode, which will reduce false positives in CI.
> > 
> > External URL: 
> > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/index.html
> > 
> > 
> >     Participating hosts (33 -> 34)
> > 
> > Additional (2): fi-kbl-soraka fi-tgl-u2 Missing (1): fi-bdw-samus
> > 
> > 
> >     Possible new issues
> > 
> > Here are the unknown changes that may have been introduced in IGTPW_6442:
> > 
> > 
> >       IGT changes
> > 
> > 
> >         Possible regressions
> > 
> >   *
> > 
> >     igt@kms_addfb_basic@addfb25-bad-modifier:
> > 
> >       o fi-rkl-11600: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_addfb_basic@addfb25-bad-modifier.html>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_addfb_basic@addfb25-bad-modifier.html>>         +36 similar issues
> >   *
> > 
> >     igt@kms_addfb_basic@bo-too-small:
> > 
> >       o fi-tgl-1115g4: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@kms_addfb_basic@bo-too-small.html>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_addfb_basic@bo-too-small.html>>         +37 similar issues
> >   *
> > 
> >     igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a:
> > 
> >       o fi-tgl-u2: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html>>         +53 similar issues
> >   *
> > 
> >     igt@kms_pipe_crc_basic@read-crc-pipe-b:
> > 
> >       o fi-rkl-guc: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_pipe_crc_basic@read-crc-pipe-b.html>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_pipe_crc_basic@read-crc-pipe-b.html>>         +36 similar issues
> >   *
> > 
> >     igt@prime_vgem@basic-fence-flip:
> > 
> >       o
> > 
> >         fi-rkl-11600: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html>>         -> CRASH
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html>> 
> >       o
> > 
> >         fi-tgl-1115g4: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@prime_vgem@basic-fence-flip.html>>         -> CRASH
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@prime_vgem@basic-fence-flip.html>> 
> >       o
> > 
> >         fi-tgl-u2: NOTRUN -> CRASH
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@prime_vgem@basic-fence-flip.html>> 
> >       o
> > 
> >         fi-rkl-guc: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@prime_vgem@basic-fence-flip.html>>         -> CRASH
> >         
> > <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@pr
> > ime_vgem@basic-fence-flip.html>>
> > 
> >         Warnings
> > 
> >   *
> > 
> >     igt@i915_pm_backlight@basic-brightness:
> > 
> >       o
> > 
> >         fi-tgl-1115g4: SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@i915_pm_backlight@basic-brightness.html>>         (i915#1155
> >         <https://gitlab.freedesktop.org/drm/intel/issues/1155>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@i915_pm_backlight@basic-brightness.html>> 
> >       o
> > 
> >         fi-rkl-11600: SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html>>         (i915#3012
> >         <https://gitlab.freedesktop.org/drm/intel/issues/3012>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html>> 
> >       o
> > 
> >         fi-rkl-guc: SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html>>         (i915#3012
> >         <https://gitlab.freedesktop.org/drm/intel/issues/3012>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html>> 
> >   *
> > 
> >     igt@kms_chamelium@common-hpd-after-suspend:
> > 
> >       o fi-rkl-guc: SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_chamelium@common-hpd-after-suspend.html>>         (fdo#111827
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_chamelium@common-hpd-after-suspend.html>>         +8 similar issues
> >   *
> > 
> >     igt@kms_chamelium@dp-crc-fast:
> > 
> >       o fi-rkl-11600: SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_chamelium@dp-crc-fast.html>>         (fdo#111827
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_chamelium@dp-crc-fast.html>>         +8 similar issues
> >   *
> > 
> >     igt@kms_chamelium@vga-hpd-fast:
> > 
> >       o fi-tgl-1115g4: SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@kms_chamelium@vga-hpd-fast.html>>         (fdo#111827
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_chamelium@vga-hpd-fast.html>>         +8 similar issues
> >   *
> > 
> >     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> > 
> >       o
> > 
> >         fi-rkl-guc: SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>>         (i915#4103
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4103>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>>         +1 similar issue
> > 
> >       o
> > 
> >         fi-rkl-11600: SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>>         (i915#4103
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4103>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>>         +1 similar issue
> > 
> >       o
> > 
> >         fi-tgl-1115g4: SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>>         (i915#4103
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4103>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>>         +1 similar issue
> > 
> >   *
> > 
> >     igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
> > 
> >       o
> > 
> >         fi-rkl-11600: SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html>>         (i915#533
> >         <https://gitlab.freedesktop.org/drm/intel/issues/533>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html>> 
> >       o
> > 
> >         fi-rkl-guc: SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html>>         (i915#533
> >         <https://gitlab.freedesktop.org/drm/intel/issues/533>>         -> FAIL
> >         
> > <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@km
> > s_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html>>
> > 
> >         Suppressed
> > 
> > The following results come from untrusted machines, tests, or statuses.
> > They do not affect the overall result.
> > 
> >   *
> > 
> >     igt@i915_pm_rpm@basic-rte:
> > 
> >       o
> > 
> >         {fi-jsl-1}: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-jsl-1/igt@i915_pm_rpm@basic-rte.html>>         -> CRASH
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-jsl-1/igt@i915_pm_rpm@basic-rte.html>>         +2 similar issues
> > 
> >       o
> > 
> >         {fi-ehl-2}: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-ehl-2/igt@i915_pm_rpm@basic-rte.html>>         -> CRASH
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-ehl-2/igt@i915_pm_rpm@basic-rte.html>>         +2 similar issues
> > 
> >   *
> > 
> >     igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
> > 
> >       o {fi-ehl-2}: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-ehl-2/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-ehl-2/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html>>         +46 similar issues
> >   *
> > 
> >     igt@kms_busy@basic:
> > 
> >       o
> > 
> >         {fi-jsl-1}: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-jsl-1/igt@kms_busy@basic.html>> 
> >       o
> > 
> >         {fi-ehl-2}: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-ehl-2/igt@kms_busy@basic.html>> 
> >   *
> > 
> >     igt@kms_chamelium@dp-crc-fast:
> > 
> >       o {fi-ehl-2}: SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-ehl-2/igt@kms_chamelium@dp-crc-fast.html>>         (fdo#111827
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-ehl-2/igt@kms_chamelium@dp-crc-fast.html>>         +8 similar issues
> >   *
> > 
> >     igt@kms_chamelium@dp-hpd-fast:
> > 
> >       o {fi-jsl-1}: SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-jsl-1/igt@kms_chamelium@dp-hpd-fast.html>>         (fdo#111827
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-jsl-1/igt@kms_chamelium@dp-hpd-fast.html>>         +8 similar issues
> >   *
> > 
> >     igt@kms_chamelium@hdmi-hpd-fast:
> > 
> >       o {fi-tgl-dsi}: SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-dsi/igt@kms_chamelium@hdmi-hpd-fast.html>>         (fdo#109284
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=109284>>         / fdo#111827
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-dsi/igt@kms_chamelium@hdmi-hpd-fast.html>>         +8 similar issues
> >   *
> > 
> >     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> > 
> >       o
> > 
> >         {fi-ehl-2}: SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>>         (fdo#109278
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=109278>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>>         +1 similar issue
> > 
> >       o
> > 
> >         {fi-jsl-1}: SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>>         (i915#4103
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4103>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>>         +1 similar issue
> > 
> >   *
> > 
> >     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> > 
> >       o {fi-tgl-dsi}: SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>>         (i915#4103
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4103>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>>         +1 similar issue
> >   *
> > 
> >     igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a:
> > 
> >       o {fi-tgl-dsi}: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html>>         +38 similar issues
> >   *
> > 
> >     igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
> > 
> >       o
> > 
> >         {fi-jsl-1}: SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-jsl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html>>         (i915#533
> >         <https://gitlab.freedesktop.org/drm/intel/issues/533>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-jsl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html>> 
> >       o
> > 
> >         {fi-ehl-2}: SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-ehl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html>>         (fdo#109278
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=109278>>         / i915#533
> >         <https://gitlab.freedesktop.org/drm/intel/issues/533>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-ehl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html>> 
> >   *
> > 
> >     igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
> > 
> >       o {fi-jsl-1}: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-jsl-1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-jsl-1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html>>         +46 similar issues
> >   *
> > 
> >     igt@prime_vgem@basic-fence-flip:
> > 
> >       o {fi-tgl-dsi}: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-dsi/igt@prime_vgem@basic-fence-flip.html>>         -> CRASH
> >         
> > <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-dsi/igt@pr
> > ime_vgem@basic-fence-flip.html>>
> > 
> >     Known issues
> > 
> > Here are the changes found in IGTPW_6442 that come from known issues:
> > 
> > 
> >       IGT changes
> > 
> > 
> >         Issues hit
> > 
> >   *
> > 
> >     igt@amdgpu/amd_basic@semaphore:
> > 
> >       o fi-bdw-5557u: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html>>         (fdo#109271
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>>         +31 similar issues
> >   *
> > 
> >     igt@amdgpu/amd_cs_nop@sync-fork-compute0:
> > 
> >       o fi-snb-2600: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html>>         (fdo#109271
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>>         +17 similar issues
> >   *
> > 
> >     igt@gem_exec_fence@basic-busy@bcs0:
> > 
> >       o fi-kbl-soraka: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html>>         (fdo#109271
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>>         +8 similar issues
> >   *
> > 
> >     igt@gem_huc_copy@huc-copy:
> > 
> >       o
> > 
> >         fi-tgl-u2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@gem_huc_copy@huc-copy.html>>         (i915#2190
> >         <https://gitlab.freedesktop.org/drm/intel/issues/2190>> 
> >       o
> > 
> >         fi-kbl-soraka: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html>>         (fdo#109271
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>>         / i915#2190
> >         <https://gitlab.freedesktop.org/drm/intel/issues/2190>> 
> >   *
> > 
> >     igt@gem_lmem_swapping@parallel-random-engines:
> > 
> >       o fi-kbl-soraka: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-kbl-soraka/igt@gem_lmem_swapping@parallel-random-engines.html>>         (fdo#109271
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>>         / i915#4613
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4613>>         +3 similar issues
> >   *
> > 
> >     igt@gem_lmem_swapping@verify-random:
> > 
> >       o fi-tgl-u2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@gem_lmem_swapping@verify-random.html>>         (i915#4613
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4613>>         +3 similar issues
> >   *
> > 
> >     igt@i915_pm_rpm@basic-pci-d3-state:
> > 
> >       o fi-rkl-11600: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@i915_pm_rpm@basic-pci-d3-state.html>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@i915_pm_rpm@basic-pci-d3-state.html>>         (i915#4598
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4598>>         +1 similar issue
> >   *
> > 
> >     igt@i915_pm_rpm@basic-rte:
> > 
> >       o
> > 
> >         fi-rkl-guc: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@i915_pm_rpm@basic-rte.html>>         -> CRASH
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@i915_pm_rpm@basic-rte.html>>         (i915#4598
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4598>> 
> >       o
> > 
> >         fi-tgl-u2: NOTRUN -> CRASH
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@i915_pm_rpm@basic-rte.html>>         (i915#4598
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4598>> 
> >       o
> > 
> >         fi-tgl-1115g4: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@i915_pm_rpm@basic-rte.html>>         -> CRASH
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@i915_pm_rpm@basic-rte.html>>         (i915#4598
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4598>> 
> >       o
> > 
> >         fi-rkl-11600: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@i915_pm_rpm@basic-rte.html>>         -> CRASH
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@i915_pm_rpm@basic-rte.html>>         (i915#4598
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4598>> 
> >   *
> > 
> >     igt@i915_pm_rpm@module-reload:
> > 
> >       o
> > 
> >         fi-tgl-u2: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@i915_pm_rpm@module-reload.html>>         (i915#4598
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4598>>         +1 similar issue
> > 
> >       o
> > 
> >         fi-tgl-1115g4: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html>>         (i915#4598
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4598>>         +1 similar issue
> > 
> >       o
> > 
> >         fi-rkl-guc: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@i915_pm_rpm@module-reload.html>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@i915_pm_rpm@module-reload.html>>         (i915#4598
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4598>>         +1 similar issue
> > 
> >   *
> > 
> >     igt@i915_selftest@live@gt_pm:
> > 
> >       o fi-kbl-soraka: NOTRUN -> DMESG-FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html>>         (i915#1886
> >         <https://gitlab.freedesktop.org/drm/intel/issues/1886>>         / i915#2291
> >         <https://gitlab.freedesktop.org/drm/intel/issues/2291>>   *
> > 
> >     igt@kms_addfb_basic@too-wide:
> > 
> >       o fi-rkl-11600: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_addfb_basic@too-wide.html>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_addfb_basic@too-wide.html>>         (i915#4638
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4638>>         +2 similar issues
> >   *
> > 
> >     igt@kms_busy@basic:
> > 
> >       o
> > 
> >         fi-tgl-1115g4: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_busy@basic.html>>         (i915#4638
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4638>> 
> >       o
> > 
> >         fi-rkl-guc: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_busy@basic.html>>         (i915#4638
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4638>> 
> >       o
> > 
> >         fi-rkl-11600: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_busy@basic.html>>         (i915#4638
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4638>> 
> >   *
> > 
> >     igt@kms_chamelium@dp-edid-read:
> > 
> >       o fi-kbl-soraka: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-kbl-soraka/igt@kms_chamelium@dp-edid-read.html>>         (fdo#109271
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>>         / fdo#111827
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>>         +8 similar issues
> >   *
> > 
> >     igt@kms_chamelium@vga-edid-read:
> > 
> >       o fi-bdw-5557u: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-bdw-5557u/igt@kms_chamelium@vga-edid-read.html>>         (fdo#109271
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>>         / fdo#111827
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>>         +8 similar issues
> >   *
> > 
> >     igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
> > 
> >       o
> > 
> >         fi-tgl-u2: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html>>         (i915#4638
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4638>>         +3 similar issues
> > 
> >       o
> > 
> >         fi-tgl-1115g4: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html>>         (i915#4638
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4638>>         +2 similar issues
> > 
> >       o
> > 
> >         fi-rkl-guc: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html>>         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html>>         (i915#4638
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4638>>         +2 similar issues
> > 
> >   *
> > 
> >     igt@kms_force_connector_basic@force-connector-state:
> > 
> >       o
> > 
> >         fi-tgl-u2: NOTRUN -> CRASH
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@kms_force_connector_basic@force-connector-state.html>>         (i915#4638
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4638>> 
> >       o
> > 
> >         fi-rkl-11600: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html>>         -> CRASH
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html>>         (i915#4638
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4638>> 
> >       o
> > 
> >         fi-rkl-guc: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_force_connector_basic@force-connector-state.html>>         -> CRASH
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_force_connector_basic@force-connector-state.html>>         (i915#4638
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4638>> 
> >       o
> > 
> >         fi-tgl-1115g4: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@kms_force_connector_basic@force-connector-state.html>>         -> CRASH
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_force_connector_basic@force-connector-state.html>>         (i915#4638
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4638>> 
> >   *
> > 
> >     igt@kms_force_connector_basic@force-load-detect:
> > 
> >       o fi-tgl-u2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@kms_force_connector_basic@force-load-detect.html>>         (fdo#109285
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=109285>>   *
> > 
> >     igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
> > 
> >       o fi-kbl-soraka: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html>>         (fdo#109271
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>>         / i915#533
> >         <https://gitlab.freedesktop.org/drm/intel/issues/533>>   *
> > 
> >     igt@kms_pipe_crc_basic@read-crc-pipe-b:
> > 
> >       o fi-cfl-8109u: PASS
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-pipe-b.html>>         -> DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-pipe-b.html>>         (i915#295
> >         <https://gitlab.freedesktop.org/drm/intel/issues/295>>         +12 similar issues
> >   *
> > 
> >     igt@prime_vgem@basic-userptr:
> > 
> >       o fi-tgl-u2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@prime_vgem@basic-userptr.html>>         (i915#3301
> >         <https://gitlab.freedesktop.org/drm/intel/issues/3301>>
> > 
> >         Possible fixes
> > 
> >   * igt@i915_selftest@live@gtt:
> >       o fi-snb-2600: DMESG-FAIL
> >         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-snb-2600/igt@i915_selftest@live@gtt.html>>         (i915#4610
> >         <https://gitlab.freedesktop.org/drm/intel/issues/4610>>         -> PASS
> >         
> > <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-snb-2600/igt@i
> > 915_selftest@live@gtt.html>>
> > {name}: This element is suppressed. This means it is ignored when 
> > computing the status of the difference (SUCCESS, WARNING, or FAILURE).
> > 
> > 
> >     Build changes
> > 
> >   * CI: CI-20190529 -> None
> >   * IGT: IGT_6293 -> IGTPW_6442
> > 
> > CI-20190529: 20190529
> > CI_DRM_10930: 2c9ba65f2befe9febd864f0795227b351bd62dba @ 
> > git://anongit.freedesktop.org/gfx-ci/linux
> > IGTPW_6442: 
> > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/index.html
> > IGT_6293: bf11f87c27ad1cec3e60bd31c23080d19aa093f3 @ 
> > https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> > 
> > == Testlist changes ==
> > 
> > +igt@amdgpu/amd_dp_dsc@dsc-bpc
> > +igt@amdgpu/amd_dp_dsc@dsc-enable-basic
> > +igt@amdgpu/amd_dp_dsc@dsc-link-settings
> > +igt@amdgpu/amd_dp_dsc@dsc-slice-dimensions-change
> > +igt@amdgpu/amd_dp_dsc@dsc-slice-height-property
> > 
> 
