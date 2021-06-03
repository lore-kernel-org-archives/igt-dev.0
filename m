Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6C56E204
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 18:13:14 +0000 (UTC)
Date: Thu, 3 Jun 2021 14:13:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <YLkbsxRx62eSwuo3@intel.com>
References: <20210518103344.2264397-1-alan.previn.teres.alexis@intel.com>
 <162136198827.23334.11550328247511581770@emeril.freedesktop.org>
 <YLf7vWjVCaJz8kgf@intel.com>
 <ce7e142fa37c088a56039f78ddce10e5c66e1618.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce7e142fa37c088a56039f78ddce10e5c66e1618.camel@intel.com>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgSW50cm9k?=
 =?utf-8?q?uce_PXP_Test_=28rev5=29?=
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
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jun 03, 2021 at 02:09:40PM -0400, Teres Alexis, Alan Previn wrote:
> On Wed, 2021-06-02 at 17:44 -0400, Rodrigo Vivi wrote:
> > On Tue, May 18, 2021 at 06:19:48PM -0000, Patchwork wrote:
> > >    Patch Details
> > >
> > >    Series:  Introduce PXP Test (rev5)
> > >    URL:     [1]https://patchwork.freedesktop.org/series/87570/
> > >    State:   failure
> > >    Details:
> > >    [2]
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/index.html
> > >
> > >            CI Bug Log - changes from IGT_6087_full ->
> > > IGTPW_5817_full
> > >
> > > Summary
> > >
> > >    FAILURE
> > >
> > >    Serious unknown changes coming with IGTPW_5817_full absolutely
> > > need to
> > >    be
> > >    verified manually.
> > >
> > >    If you think the reported changes have nothing to do with the
> > > changes
> > >    introduced in IGTPW_5817_full, please notify your bug team to
> > > allow
> > >    them
> > >    to document this new failure mode, which will reduce false
> > > positives in
> > >    CI.
> > >
> > >    External URL:
> > >    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/index.html
> > >
> > > Possible new issues
> > >
> > >    Here are the unknown changes that may have been introduced in
> > >    IGTPW_5817_full:
> > >
> > >   IGT changes
> > >
> > >     Possible regressions
> > >
> > >      * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
> > >           + shard-snb: NOTRUN -> [3]INCOMPLETE
> > >      * igt@gem_ppgtt@blt-vs-render-ctx0:
> > >           + shard-apl: [4]PASS -> [5]FAIL
> >
> > since we are touching the render path for gen9+ we need to pay
> > attention
> > to cases like this...
> 
> In theory this doesnt make sense since I thought all changes I injected
> into the render code paths was fenced by "if batchbuffer has pxp
> enabled" or "if buffer has pxp enabled"- i will double check / trybot
> before i push next rev.

yeap, fully agree... but we should pay attention at least.

> 
> Side note: wrt below results where pxp test is failing on legacy HW,
> its due to kernel not yet supporting new PXP interface (where legacy HW
> would reply with -ENODEV vs -EINVAL when IGT is allocating protected
> buffers or contexts).

fully agree... we can just ignore those

> 
> >
> > >      * {igt@gem_pxp@create-regular-context-1} (NEW):
> > >           + shard-iclb: NOTRUN -> [6]SKIP +12 similar issues
> > >      * {igt@gem_pxp@hw-rejects-pxp-context} (NEW):
> > >           + shard-glk: NOTRUN -> [7]FAIL
> > >           + shard-iclb: NOTRUN -> [8]FAIL
> > >           + shard-snb: NOTRUN -> [9]FAIL
> > >           + shard-kbl: NOTRUN -> [10]FAIL
> > >      * {igt@gem_pxp@protected-encrypted-src-copy-not-readible}
> > > (NEW):
> > >           + shard-tglb: NOTRUN -> [11]FAIL +10 similar issues
> > >      * igt@i915_selftest@perf@request:
> > >           + shard-tglb: [12]PASS -> [13]DMESG-FAIL
> > >      * igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-2-pipe-a:
> > >           + shard-glk: [14]PASS -> [15]FAIL +5 similar issues
> > >
> > >     Suppressed
> > >
> > >    The following results come from untrusted machines, tests, or
> > > statuses.
> > >    They do not affect the overall result.
> > >      * {igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-
> > > planes}:
> > >           + shard-glk: [16]PASS -> [17]FAIL
> > >
> > > New tests
> > >
> > >    New tests have been introduced between IGT_6087_full and
> > >    IGTPW_5817_full:
> > >
> > >   New IGT tests (20)
> > >
> > >      * igt@gem_pxp@create-protected-buffer:
> > >           + Statuses : 1 fail(s) 4 skip(s)
> > >           + Exec time: [0.0, 0.01] s
> > >      * igt@gem_pxp@create-regular-buffer:
> > >           + Statuses :
> > >           + Exec time: [None] s
> > >      * igt@gem_pxp@create-regular-context-1:
> > >           + Statuses : 1 fail(s) 4 skip(s)
> > >           + Exec time: [0.0, 0.01] s
> > >      * igt@gem_pxp@create-regular-context-2:
> > >           + Statuses : 1 fail(s) 4 skip(s)
> > >           + Exec time: [0.0, 0.02] s
> > >      * igt@gem_pxp@create-valid-protected-context:
> > >           + Statuses : 1 fail(s) 4 skip(s)
> > >           + Exec time: [0.0, 0.01] s
> > >      * igt@gem_pxp@display-protected-crc-with-hdcp:
> > >           + Statuses : 1 fail(s) 4 skip(s)
> > >           + Exec time: [0.0, 0.01] s
> > >      * igt@gem_pxp@display-protected-crc-without-hdcp:
> > >           + Statuses : 1 fail(s) 2 skip(s)
> > >           + Exec time: [0.0, 0.01] s
> > >      * igt@gem
> > > _pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> > >           + Statuses : 1 fail(s) 4 skip(s)
> > >           + Exec time: [0.0, 0.03] s
> > >      * igt@gem_pxp@fail-invalid-protected-context:
> > >           + Statuses : 1 skip(s)
> > >           + Exec time: [0.0] s
> > >      * igt@gem_pxp@hw-rejects-pxp-buffer:
> > >           + Statuses :
> > >           + Exec time: [None] s
> > >      * igt@gem_pxp@hw-rejects-pxp-context:
> > >           + Statuses : 4 fail(s)
> > >           + Exec time: [0.01, 0.02] s
> > >      * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
> > >           + Statuses : 1 fail(s) 5 skip(s)
> > >           + Exec time: [0.0, 0.01] s
> > >      * igt@gem_pxp@protected-raw-src-copy-not-readible:
> > >           + Statuses : 1 fail(s) 3 skip(s)
> > >           + Exec time: [0.0, 0.01] s
> > >      * igt@gem_pxp@regular-baseline-src-copy-readible:
> > >           + Statuses : 1 pass(s) 2 skip(s)
> > >           + Exec time: [0.0, 0.01] s
> > >      * igt@gem_pxp@reject-modify-context-protection-off-1:
> > >           + Statuses : 1 skip(s)
> > >           + Exec time: [0.0] s
> > >      * igt@gem_pxp@reject-modify-context-protection-off-2:
> > >           + Statuses :
> > >           + Exec time: [None] s
> > >      * igt@gem_pxp@reject-modify-context-protection-off-3:
> > >           + Statuses : 3 skip(s)
> > >           + Exec time: [0.0] s
> > >      * igt@gem_pxp@reject-modify-context-protection-on:
> > >           + Statuses : 1 fail(s) 5 skip(s)
> > >           + Exec time: [0.0, 0.00] s
> > >      * igt@gem
> > > _pxp@verify-pxp-execution-behavior-after-suspend-resume:
> > >           + Statuses :
> > >           + Exec time: [None] s
> > >      * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
> > >           + Statuses : 1 fail(s) 5 skip(s)
> > >           + Exec time: [0.0, 0.01] s
> > >
> > > Known issues
> > >
> > >    Here are the changes found in IGTPW_5817_full that come from
> > > known
> > >    issues:
> > >
> > >   IGT changes
> > >
> > >     Issues hit
> > >
> > >      * igt@api_intel_bb@blit-noreloc-purge-cache:
> > >           + shard-iclb: NOTRUN -> [18]DMESG-WARN ([i915#3457]) +3
> > > similar
> > >             issues
> > >           + shard-glk: NOTRUN -> [19]DMESG-FAIL ([i915#3457]) +2
> > > similar
> > >             issues
> > >      * igt@api_intel_bb@offset-control:
> > >           + shard-apl: NOTRUN -> [20]DMESG-WARN ([i915#3457]) +1
> > > similar
> > >             issue
> > >           + shard-glk: NOTRUN -> [21]DMESG-WARN ([i915#3457])
> > >      * igt@feature_discovery@chamelium:
> > >           + shard-tglb: NOTRUN -> [22]SKIP ([fdo#111827])
> > >           + shard-iclb: NOTRUN -> [23]SKIP ([fdo#111827])
> > >      * igt@gem_create@create-massive:
> > >           + shard-iclb: NOTRUN -> [24]DMESG-WARN ([i915#3002])
> > >           + shard-kbl: NOTRUN -> [25]DMESG-WARN ([i915#3002])
> > >           + shard-tglb: NOTRUN -> [26]DMESG-WARN ([i915#3002])
> > >           + shard-glk: NOTRUN -> [27]DMESG-WARN ([i915#3002])
> > >      * igt@gem_ctx_isolation@preservation-s3@vcs0:
> > >           + shard-kbl: NOTRUN -> [28]DMESG-WARN ([i915#180] /
> > > [i915#3457])
> > >             +4 similar issues
> > >      * igt@gem_ctx_persistence@legacy-engines-hostile:
> > >           + shard-snb: NOTRUN -> [29]SKIP ([fdo#109271] /
> > > [i915#1099]) +2
> > >             similar issues
> > >      * igt@gem_ctx_persistence@many-contexts:
> > >           + shard-glk: [30]PASS -> [31]DMESG-WARN ([i915#118] /
> > >             [i915#3457] / [i915#95])
> > >      * igt@gem_eio@unwedge-stress:
> > >           + shard-apl: NOTRUN -> [32]FAIL ([i915#3457]) +10 similar
> > > issues
> > >           + shard-snb: NOTRUN -> [33]FAIL ([i915#3354] /
> > > [i915#3457])
> > >      * igt@gem_exec_endless@dispatch@vecs0:
> > >           + shard-apl: NOTRUN -> [34]INCOMPLETE ([i915#2502] /
> > >             [i915#3457])
> > >      * igt@gem_exec_fair@basic-none-rrul@rcs0:
> > >           + shard-iclb: NOTRUN -> [35]FAIL ([i915#2842] /
> > > [i915#3457]) +5
> > >             similar issues
> > >           + shard-glk: NOTRUN -> [36]INCOMPLETE ([i915#3457]) +1
> > > similar
> > >             issue
> > >      * igt@gem_exec_fair@basic-none@vcs0:
> > >           + shard-tglb: NOTRUN -> [37]FAIL ([i915#2842] /
> > > [i915#3457]) +5
> > >             similar issues
> > >      * igt@gem_exec_fair@basic-none@vcs1:
> > >           + shard-kbl: NOTRUN -> [38]FAIL ([i915#2842] /
> > > [i915#3457])
> > >      * igt@gem_exec_fair@basic-pace@rcs0:
> > >           + shard-tglb: [39]PASS -> [40]FAIL ([i915#2842] /
> > > [i915#3457])
> > >      * igt@gem_exec_fair@basic-pace@vcs0:
> > >           + shard-iclb: [41]PASS -> [42]FAIL ([i915#2842] /
> > > [i915#3457])
> > >      * igt@gem_exec_fair@basic-pace@vcs1:
> > >           + shard-kbl: [43]PASS -> [44]FAIL ([i915#2842] /
> > > [i915#3457])
> > >      * igt@gem_exec_schedule@preempt-hang@vcs0:
> > >           + shard-glk: [45]PASS -> [46]FAIL ([i915#3457]) +28
> > > similar
> > >             issues
> > >      * igt@gem_exec_schedule@submit-early-slice@vecs0:
> > >           + shard-glk: NOTRUN -> [47]FAIL ([i915#3457]) +50 similar
> > > issues
> > >      * igt@gem_exec_whisper@basic-contexts-all:
> > >           + shard-glk: NOTRUN -> [48]DMESG-WARN ([i915#118] /
> > > [i915#95])
> > >      * igt@gem_huc_copy@huc-copy:
> > >           + shard-tglb: [49]PASS -> [50]SKIP ([i915#2190])
> > >      * igt@gem_mmap_gtt@cpuset-basic-small-copy:
> > >           + shard-snb: NOTRUN -> [51]INCOMPLETE ([i915#3468]) +1
> > > similar
> > >             issue
> > >           + shard-kbl: [52]PASS -> [53]INCOMPLETE ([i915#3468])
> > >      * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
> > >           + shard-tglb: NOTRUN -> [54]INCOMPLETE ([i915#3468]) +2
> > > similar
> > >             issues
> > >           + shard-kbl: NOTRUN -> [55]INCOMPLETE ([i915#3468]) +3
> > > similar
> > >             issues
> > >      * igt@gem_mmap_offset@clear:
> > >           + shard-glk: NOTRUN -> [56]FAIL ([i915#1888] /
> > > [i915#3160])
> > >      * igt@gem_pwrite@basic-exhaustion:
> > >           + shard-apl: NOTRUN -> [57]WARN ([i915#2658])
> > >      * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:
> > >           + shard-apl: NOTRUN -> [58]INCOMPLETE ([i915#3468])
> > >      * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
> > >           + shard-iclb: NOTRUN -> [59]SKIP ([i915#768]) +4 similar
> > > issues
> > >      * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
> > >           + shard-iclb: NOTRUN -> [60]INCOMPLETE ([i915#3468]) +2
> > > similar
> > >             issues
> > >           + shard-glk: NOTRUN -> [61]INCOMPLETE ([i915#3468]) +2
> > > similar
> > >             issues
> > >           + shard-tglb: NOTRUN -> [62]INCOMPLETE ([i915#3457] /
> > >             [i915#3468])
> > >      * igt@gem_softpin@evict-snoop-interruptible:
> > >           + shard-tglb: NOTRUN -> [63]SKIP ([fdo#109312])
> > >           + shard-iclb: NOTRUN -> [64]SKIP ([fdo#109312])
> > >      * igt@gem_userptr_blits@dmabuf-sync:
> > >           + shard-apl: NOTRUN -> [65]SKIP ([fdo#109271] /
> > > [i915#3323])
> > >      * igt@gem_userptr_blits@dmabuf-unsync:
> > >           + shard-tglb: NOTRUN -> [66]SKIP ([i915#3297]) +2 similar
> > > issues
> > >           + shard-iclb: NOTRUN -> [67]SKIP ([i915#3297]) +3 similar
> > > issues
> > >      * igt@gem_wait@await@bcs0:
> > >           + shard-apl: [68]PASS -> [69]FAIL ([i915#3457]) +1
> > > similar issue
> > >      * igt@gen3_render_linear_blits:
> > >           + shard-tglb: NOTRUN -> [70]SKIP ([fdo#109289]) +4
> > > similar
> > >             issues
> > >           + shard-iclb: NOTRUN -> [71]SKIP ([fdo#109289]) +3
> > > similar
> > >             issues
> > >      * igt@gen7_exec_parse@basic-offset:
> > >           + shard-apl: NOTRUN -> [72]SKIP ([fdo#109271]) +171
> > > similar
> > >             issues
> > >      * igt@gen9_exec_parse@allowed-all:
> > >           + shard-iclb: NOTRUN -> [73]SKIP ([fdo#112306]) +4
> > > similar
> > >             issues
> > >      * igt@gen9_exec_parse@bb-start-out:
> > >           + shard-tglb: NOTRUN -> [74]SKIP ([fdo#112306]) +3
> > > similar
> > >             issues
> > >      * igt@i915_hangman@error-state-capture@bcs0:
> > >           + shard-snb: NOTRUN -> [75]DMESG-WARN ([i915#3457]) +2
> > > similar
> > >             issues
> > >      * igt@i915_module_load@reload:
> > >           + shard-tglb: NOTRUN -> [76]DMESG-WARN ([i915#3457]) +3
> > > similar
> > >             issues
> > >           + shard-kbl: NOTRUN -> [77]DMESG-WARN ([i915#3457]) +5
> > > similar
> > >             issues
> > >      * igt@i915_pm_dc@dc9-dpms:
> > >           + shard-tglb: NOTRUN -> [78]SKIP ([i915#3288])
> > >           + shard-iclb: NOTRUN -> [79]FAIL ([i915#3343])
> > >      * igt@i915_pm_rpm@cursor:
> > >           + shard-tglb: [80]PASS -> [81]DMESG-WARN ([i915#2411] /
> > >             [i915#3457]) +1 similar issue
> > >           + shard-kbl: [82]PASS -> [83]DMESG-WARN ([i915#3457])
> > >           + shard-glk: [84]PASS -> [85]DMESG-WARN ([i915#3457])
> > >      * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
> > >           + shard-iclb: NOTRUN -> [86]SKIP ([fdo#110892]) +1
> > > similar issue
> > >      * igt@i915_pm_rps@reset:
> > >           + shard-apl: NOTRUN -> [87]DMESG-FAIL ([i915#3457]) +2
> > > similar
> > >             issues
> > >      * igt@kms_atomic@plane-immutable-zpos:
> > >           + shard-glk: [88]PASS -> [89]FAIL ([i915#2657] /
> > > [i915#3457])
> > >      * igt@kms_big_fb@linear-16bpp-rotate-90:
> > >           + shard-iclb: NOTRUN -> [90]SKIP ([fdo#110725] /
> > > [fdo#111614])
> > >             +6 similar issues
> > >           + shard-tglb: NOTRUN -> [91]SKIP ([fdo#111614]) +6
> > > similar
> > >             issues
> > >      * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
> > >           + shard-tglb: NOTRUN -> [92]SKIP ([fdo#111615]) +3
> > > similar
> > >             issues
> > >      * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
> > >           + shard-iclb: NOTRUN -> [93]SKIP ([fdo#110723])
> > >      * igt@kms_big_joiner@invalid-modeset:
> > >           + shard-iclb: NOTRUN -> [94]SKIP ([i915#2705])
> > >           + shard-kbl: NOTRUN -> [95]SKIP ([fdo#109271] /
> > > [i915#2705])
> > >           + shard-apl: NOTRUN -> [96]SKIP ([fdo#109271] /
> > > [i915#2705])
> > >           + shard-glk: NOTRUN -> [97]SKIP ([fdo#109271] /
> > > [i915#2705])
> > >           + shard-tglb: NOTRUN -> [98]SKIP ([i915#2705])
> > >      * igt@kms_chamelium@dp-hpd-storm-disable:
> > >           + shard-glk: NOTRUN -> [99]SKIP ([fdo#109271] /
> > > [fdo#111827])
> > >             +19 similar issues
> > >      * igt@kms_chamelium@dp-mode-timings:
> > >           + shard-apl: NOTRUN -> [100]SKIP ([fdo#109271] /
> > > [fdo#111827])
> > >             +15 similar issues
> > >      * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
> > >           + shard-snb: NOTRUN -> [101]SKIP ([fdo#109271] /
> > > [fdo#111827])
> > >             +16 similar issues
> > >      * igt@kms_chamelium@hdmi-hpd-storm:
> > >           + shard-kbl: NOTRUN -> [102]SKIP ([fdo#109271] /
> > > [fdo#111827])
> > >             +30 similar issues
> > >      * igt@kms_color@pipe-b-degamma:
> > >           + shard-tglb: NOTRUN -> [103]FAIL ([i915#1149])
> > >           + shard-glk: NOTRUN -> [104]FAIL ([i915#71])
> > >           + shard-iclb: NOTRUN -> [105]FAIL ([i915#1149])
> > >      * igt@kms_color@pipe-c-degamma:
> > >           + shard-glk: [106]PASS -> [107]FAIL ([i915#71]) +1
> > > similar issue
> > >      * igt@kms_color@pipe-d-ctm-0-25:
> > >           + shard-iclb: NOTRUN -> [108]SKIP ([fdo#109278] /
> > > [i915#1149])
> > >             +2 similar issues
> > >      * igt@kms_color_chamelium@pipe-b-ctm-0-75:
> > >           + shard-tglb: NOTRUN -> [109]SKIP ([fdo#109284] /
> > > [fdo#111827])
> > >             +21 similar issues
> > >      * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
> > >           + shard-iclb: NOTRUN -> [110]SKIP ([fdo#109284] /
> > > [fdo#111827])
> > >             +19 similar issues
> > >      * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
> > >           + shard-iclb: NOTRUN -> [111]SKIP ([fdo#109278] /
> > > [fdo#109284] /
> > >             [fdo#111827]) +1 similar issue
> > >      * igt@kms_content_protection@atomic-dpms:
> > >           + shard-kbl: NOTRUN -> [112]TIMEOUT ([i915#1319])
> > >      * igt@kms_content_protection@dp-mst-lic-type-1:
> > >           + shard-iclb: NOTRUN -> [113]SKIP ([i915#3116])
> > >           + shard-tglb: NOTRUN -> [114]SKIP ([i915#3116])
> > >      * igt@kms_content_protection@uevent:
> > >           + shard-kbl: NOTRUN -> [115]FAIL ([i915#2105])
> > >           + shard-tglb: NOTRUN -> [116]SKIP ([fdo#111828])
> > >           + shard-iclb: NOTRUN -> [117]SKIP ([fdo#109300] /
> > > [fdo#111066])
> > >      * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
> > >           + shard-snb: NOTRUN -> [118]FAIL ([i915#3457]) +4 similar
> > > issues
> > >      * igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:
> > >           + shard-tglb: NOTRUN -> [119]SKIP ([i915#3319] /
> > > [i915#3457]) +6
> > >             similar issues
> > >      * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
> > >           + shard-kbl: NOTRUN -> [120]FAIL ([i915#3444] /
> > > [i915#3457]) +16
> > >             similar issues
> > >      * igt@kms_cursor_crc@pipe-a-cursor-dpms:
> > >           + shard-apl: [121]PASS -> [122]FAIL ([i915#3444] /
> > > [i915#3457])
> > >      * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
> > >           + shard-iclb: NOTRUN -> [123]SKIP ([fdo#109278] /
> > > [fdo#109279] /
> > >             [i915#3457]) +6 similar issues
> > >      * igt@kms_cursor_crc@pipe-b-cursor-64x21-random:
> > >           + shard-apl: NOTRUN -> [124]FAIL ([i915#3444] /
> > > [i915#3457]) +3
> > >             similar issues
> > >      * igt@kms_cursor_crc@pipe-b-cursor-64x64-random:
> > >           + shard-iclb: NOTRUN -> [125]FAIL ([i915#3457]) +13
> > > similar
> > >             issues
> > >           + shard-glk: NOTRUN -> [126]FAIL ([i915#3444] /
> > > [i915#3457]) +11
> > >             similar issues
> > >      * igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:
> > >           + shard-glk: [127]PASS -> [128]FAIL ([i915#3444] /
> > > [i915#3457])
> > >             +4 similar issues
> > >           + shard-kbl: [129]PASS -> [130]FAIL ([i915#3444] /
> > > [i915#3457])
> > >      * igt@kms_cursor_crc@pipe-b-cursor-dpms:
> > >           + shard-iclb: [131]PASS -> [132]FAIL ([i915#3457]) +1
> > > similar
> > >             issue
> > >      * igt@kms_cursor_crc@pi
> > >
> > > References
> > >
> > >    1. https://patchwork.freedesktop.org/series/87570/
> > >    2.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/index.html
> > >    3.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-snb5/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
> > >    4.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-apl7/igt@gem_ppgtt@blt-vs-render-ctx0.html
> > >    5.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@gem_ppgtt@blt-vs-render-ctx0.html
> > >    6.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb3/igt@gem_pxp@create-regular-context-1.html
> > >    7.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk6/igt@gem_pxp@hw-rejects-pxp-context.html
> > >    8.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb5/igt@gem_pxp@hw-rejects-pxp-context.html
> > >    9.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-snb6/igt@gem_pxp@hw-rejects-pxp-context.html
> > >   10.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl1/igt@gem_pxp@hw-rejects-pxp-context.html
> > >   11.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb1/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
> > >   12.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-tglb3/igt@i915_selftest@perf@request.html
> > >   13.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb6/igt@i915_selftest@perf@request.html
> > >   14.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk6/igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-2-pipe-a.html
> > >   15.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk3/igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-2-pipe-a.html
> > >   16.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
> > >   17.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
> > >   18.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb7/igt@api_intel_bb@blit-noreloc-purge-cache.html
> > >   19.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk3/igt@api_intel_bb@blit-noreloc-purge-cache.html
> > >   20.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@api_intel_bb@offset-control.html
> > >   21.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk1/igt@api_intel_bb@offset-control.html
> > >   22.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb2/igt@feature_discovery@chamelium.html
> > >   23.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb8/igt@feature_discovery@chamelium.html
> > >   24.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb6/igt@gem_create@create-massive.html
> > >   25.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl2/igt@gem_create@create-massive.html
> > >   26.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb1/igt@gem_create@create-massive.html
> > >   27.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk7/igt@gem_create@create-massive.html
> > >   28.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html
> > >   29.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-snb7/igt@gem_ctx_persistence@legacy-engines-hostile.html
> > >   30.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk5/igt@gem_ctx_persistence@many-contexts.html
> > >   31.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk7/igt@gem_ctx_persistence@many-contexts.html
> > >   32.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@gem_eio@unwedge-stress.html
> > >   33.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-snb5/igt@gem_eio@unwedge-stress.html
> > >   34.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl6/igt@gem_exec_endless@dispatch@vecs0.html
> > >   35.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb8/igt@gem_exec_fair@basic-none-rrul@rcs0.html
> > >   36.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk2/igt@gem_exec_fair@basic-none-rrul@rcs0.html
> > >   37.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb5/igt@gem_exec_fair@basic-none@vcs0.html
> > >   38.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl3/igt@gem_exec_fair@basic-none@vcs1.html
> > >   39.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-tglb2/igt@gem_exec_fair@basic-pace@rcs0.html
> > >   40.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb6/igt@gem_exec_fair@basic-pace@rcs0.html
> > >   41.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-iclb8/igt@gem_exec_fair@basic-pace@vcs0.html
> > >   42.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb8/igt@gem_exec_fair@basic-pace@vcs0.html
> > >   43.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html
> > >   44.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html
> > >   45.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk2/igt@gem_exec_schedule@preempt-hang@vcs0.html
> > >   46.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk8/igt@gem_exec_schedule@preempt-hang@vcs0.html
> > >   47.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk7/igt@gem_exec_schedule@submit-early-slice@vecs0.html
> > >   48.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk7/igt@gem_exec_whisper@basic-contexts-all.html
> > >   49.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-tglb2/igt@gem_huc_copy@huc-copy.html
> > >   50.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb6/igt@gem_huc_copy@huc-copy.html
> > >   51.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-snb7/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
> > >   52.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-kbl1/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
> > >   53.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl4/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
> > >   54.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb2/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
> > >   55.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl6/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
> > >   56.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk7/igt@gem_mmap_offset@clear.html
> > >   57.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl6/igt@gem_pwrite@basic-exhaustion.html
> > >   58.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl6/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html
> > >   59.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb8/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
> > >   60.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb1/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
> > >   61.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk5/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
> > >   62.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb5/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
> > >   63.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb6/igt@gem_softpin@evict-snoop-interruptible.html
> > >   64.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb6/igt@gem_softpin@evict-snoop-interruptible.html
> > >   65.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@gem_userptr_blits@dmabuf-sync.html
> > >   66.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb5/igt@gem_userptr_blits@dmabuf-unsync.html
> > >   67.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb4/igt@gem_userptr_blits@dmabuf-unsync.html
> > >   68.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-apl7/igt@gem_wait@await@bcs0.html
> > >   69.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@gem_wait@await@bcs0.html
> > >   70.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb2/igt@gen3_render_linear_blits.html
> > >   71.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb7/igt@gen3_render_linear_blits.html
> > >   72.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@gen7_exec_parse@basic-offset.html
> > >   73.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb8/igt@gen9_exec_parse@allowed-all.html
> > >   74.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb5/igt@gen9_exec_parse@bb-start-out.html
> > >   75.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-snb7/igt@i915_hangman@error-state-capture@bcs0.html
> > >   76.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb2/igt@i915_module_load@reload.html
> > >   77.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl2/igt@i915_module_load@reload.html
> > >   78.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb5/igt@i915_pm_dc@dc9-dpms.html
> > >   79.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb1/igt@i915_pm_dc@dc9-dpms.html
> > >   80.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-tglb6/igt@i915_pm_rpm@cursor.html
> > >   81.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb6/igt@i915_pm_rpm@cursor.html
> > >   82.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-kbl2/igt@i915_pm_rpm@cursor.html
> > >   83.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl3/igt@i915_pm_rpm@cursor.html
> > >   84.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk7/igt@i915_pm_rpm@cursor.html
> > >   85.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk2/igt@i915_pm_rpm@cursor.html
> > >   86.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
> > >   87.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@i915_pm_rps@reset.html
> > >   88.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk3/igt@kms_atomic@plane-immutable-zpos.html
> > >   89.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk8/igt@kms_atomic@plane-immutable-zpos.html
> > >   90.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb5/igt@kms_big_fb@linear-16bpp-rotate-90.html
> > >   91.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb1/igt@kms_big_fb@linear-16bpp-rotate-90.html
> > >   92.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb5/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
> > >   93.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
> > >   94.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb3/igt@kms_big_joiner@invalid-modeset.html
> > >   95.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl2/igt@kms_big_joiner@invalid-modeset.html
> > >   96.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@kms_big_joiner@invalid-modeset.html
> > >   97.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk7/igt@kms_big_joiner@invalid-modeset.html
> > >   98.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb1/igt@kms_big_joiner@invalid-modeset.html
> > >   99.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk3/igt@kms_chamelium@dp-hpd-storm-disable.html
> > >  100.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl6/igt@kms_chamelium@dp-mode-timings.html
> > >  101.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-snb6/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html
> > >  102.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl2/igt@kms_chamelium@hdmi-hpd-storm.html
> > >  103.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb1/igt@kms_color@pipe-b-degamma.html
> > >  104.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk3/igt@kms_color@pipe-b-degamma.html
> > >  105.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb5/igt@kms_color@pipe-b-degamma.html
> > >  106.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk5/igt@kms_color@pipe-c-degamma.html
> > >  107.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk6/igt@kms_color@pipe-c-degamma.html
> > >  108.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb5/igt@kms_color@pipe-d-ctm-0-25.html
> > >  109.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb1/igt@kms_color_chamelium@pipe-b-ctm-0-75.html
> > >  110.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb8/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html
> > >  111.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb7/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html
> > >  112.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl2/igt@kms_content_protection@atomic-dpms.html
> > >  113.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb7/igt@kms_content_protection@dp-mst-lic-type-1.html
> > >  114.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb2/igt@kms_content_protection@dp-mst-lic-type-1.html
> > >  115.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl2/igt@kms_content_protection@uevent.html
> > >  116.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb1/igt@kms_content_protection@uevent.html
> > >  117.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb1/igt@kms_content_protection@uevent.html
> > >  118.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-snb5/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
> > >  119.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html
> > >  120.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
> > >  121.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
> > >  122.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
> > >  123.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb6/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html
> > >  124.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
> > >  125.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html
> > >  126.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk1/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html
> > >  127.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
> > >  128.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
> > >  129.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
> > >  130.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
> > >  131.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6087/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-dpms.html
> > >  132.
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5817/shard-iclb1/igt@kms_cursor_crc@pipe-b-cursor-dpms.html
> > > _______________________________________________
> > > igt-dev mailing list
> > > igt-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
