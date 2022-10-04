Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1750510E18C
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Oct 2022 08:18:27 +0000 (UTC)
Date: Tue, 4 Oct 2022 10:18:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Message-ID: <YzvsTjOKEVepyGP4@kamilkon-desk1>
References: <20220830084836.12231-1-kamil.konieczny@linux.intel.com>
 <166463146110.32393.5838254198065372992@emeril.freedesktop.org>
 <YzrLnNeehqHWM8nM@kamilkon-desk1>
 <DM4PR11MB62130700A9C1B8604800F1EAEC5B9@DM4PR11MB6213.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR11MB62130700A9C1B8604800F1EAEC5B9@DM4PR11MB6213.namprd11.prod.outlook.com>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9p?=
 =?utf-8?q?915=5Fhangman=3A_fail_only_after_freeing_spinners_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2022-10-03 at 15:59:11 +0000, Vudum, Lakshminarayana wrote:
> I am not able to load this page. https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@kms_sequence@get-forked@edp-1-pipe-c.html
> Do you know how to get that? I am unable to review this failure.
> 
> Lakshmi.
> 

Hmmm, it opens now, maybe there where some problems with infra ?
Please report that and ping me (maybe on irc?), this series wait
a little long for merge.

Regards,
Kamil

> -----Original Message-----
> From: Kamil Konieczny <kamil.konieczny@linux.intel.com> 
> Sent: Monday, October 3, 2022 4:47 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Vudum, Lakshminarayana <lakshminarayana.vudum@intel.com>
> Subject: Re: ✗ Fi.CI.IGT: failure for i915/i915_hangman: fail only after freeing spinners (rev5)
> 
> Hi Lakshmi,
> 
> On 2022-10-01 at 13:37:41 -0000, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: i915/i915_hangman: fail only after freeing spinners (rev5)
> > URL   : https://patchwork.freedesktop.org/series/106946/
> > State : failure
> > 
> > == Summary ==
> > 
> > CI Bug Log - changes from CI_DRM_12197_full -> IGTPW_7883_full
> > ====================================================
> > 
> > Summary
> > -------
> > 
> >   **FAILURE**
> > 
> >   Serious unknown changes coming with IGTPW_7883_full absolutely need to be
> >   verified manually.
> >   
> >   If you think the reported changes have nothing to do with the changes
> >   introduced in IGTPW_7883_full, please notify your bug team to allow them
> >   to document this new failure mode, which will reduce false positives in CI.
> > 
> >   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/index.html
> > 
> > Participating hosts (12 -> 9)
> > ------------------------------
> > 
> >   Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 
> > 
> > Possible new issues
> > -------------------
> > 
> >   Here are the unknown changes that may have been introduced in IGTPW_7883_full:
> > 
> > ### IGT changes ###
> > 
> > #### Possible regressions ####
> > 
> >   * igt@gem_exec_whisper@basic-queues-priority:
> >     - shard-iclb:         [PASS][1] -> ([INCOMPLETE][2], [PASS][3])
> >    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb5/igt@gem_exec_whisper@basic-queues-priority.html
> >    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb7/igt@gem_exec_whisper@basic-queues-priority.html
> >    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@gem_exec_whisper@basic-queues-priority.html
> > 
> >   * igt@kms_sequence@get-forked@edp-1-pipe-c:
> >     - shard-tglb:         [PASS][4] -> ([INCOMPLETE][5], [PASS][6])
> >    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-tglb3/igt@kms_sequence@get-forked@edp-1-pipe-c.html
> >    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@kms_sequence@get-forked@edp-1-pipe-c.html
> >    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@kms_sequence@get-forked@edp-1-pipe-c.html
> > 
> 
> There are unrelated to i915_hangman,
> 
> Regards,
> Kamil
> 
> >   
> > #### Suppressed ####
> > 
> >   The following results come from untrusted machines, tests, or statuses.
> >   They do not affect the overall result.
> > 
> >   * igt@i915_module_load@resize-bar:
> >     - {shard-dg1}:        [FAIL][7] ([i915#6458]) -> [DMESG-FAIL][8]
> >    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-dg1-19/igt@i915_module_load@resize-bar.html
> >    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-dg1-15/igt@i915_module_load@resize-bar.html
> > 
> >   * igt@kms_addfb_basic@legacy-format:
> >     - {shard-rkl}:        NOTRUN -> [INCOMPLETE][9]
> >    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-2/igt@kms_addfb_basic@legacy-format.html
> > 
> >   * igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max:
> >     - {shard-rkl}:        NOTRUN -> [SKIP][10] +74 similar issues
> >    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-5/igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max.html
> > 
> >   * igt@prime_nv_api@i915_self_import_to_different_fd:
> >     - {shard-dg1}:        NOTRUN -> [SKIP][11] +60 similar issues
> >    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-dg1-12/igt@prime_nv_api@i915_self_import_to_different_fd.html
> > 
> >   
> > New tests
> > ---------
> > 
> >   New tests have been introduced between CI_DRM_12197_full and IGTPW_7883_full:
> > 
> > ### New IGT tests (25) ###
> > 
> >   * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [0.44] s
> > 
> >   * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-4:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [3.62] s
> > 
> >   * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-b-hdmi-a-4:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [3.33] s
> > 
> >   * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-c-hdmi-a-4:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [3.25] s
> > 
> >   * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-d-hdmi-a-4:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [3.41] s
> > 
> >   * igt@kms_cursor_crc@cursor-rapid-movement-128x42@pipe-a-hdmi-a-4:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [0.42] s
> > 
> >   * igt@kms_cursor_crc@cursor-rapid-movement-128x42@pipe-b-hdmi-a-4:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [0.25] s
> > 
> >   * igt@kms_cursor_crc@cursor-rapid-movement-128x42@pipe-c-hdmi-a-4:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [0.23] s
> > 
> >   * igt@kms_cursor_crc@cursor-rapid-movement-128x42@pipe-d-hdmi-a-4:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [0.26] s
> > 
> >   * igt@kms_lease@empty_lease@pipe-a-hdmi-a-4:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [0.14] s
> > 
> >   * igt@kms_lease@empty_lease@pipe-b-hdmi-a-4:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [0.03] s
> > 
> >   * igt@kms_lease@empty_lease@pipe-c-hdmi-a-4:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [0.03] s
> > 
> >   * igt@kms_lease@empty_lease@pipe-d-hdmi-a-4:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [0.03] s
> > 
> >   * igt@kms_lease@lease_invalid_connector@pipe-a-hdmi-a-4:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [0.14] s
> > 
> >   * igt@kms_lease@lease_invalid_connector@pipe-b-hdmi-a-4:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [0.02] s
> > 
> >   * igt@kms_lease@lease_invalid_connector@pipe-c-hdmi-a-4:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [0.02] s
> > 
> >   * igt@kms_lease@lease_invalid_connector@pipe-d-hdmi-a-4:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [0.02] s
> > 
> >   * igt@kms_lease@lease_revoke@pipe-a-hdmi-a-4:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [0.25] s
> > 
> >   * igt@kms_lease@lease_revoke@pipe-b-hdmi-a-4:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [0.11] s
> > 
> >   * igt@kms_lease@lease_revoke@pipe-c-hdmi-a-4:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [0.11] s
> > 
> >   * igt@kms_lease@lease_revoke@pipe-d-hdmi-a-4:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [0.10] s
> > 
> >   * igt@kms_lease@setcrtc_implicit_plane@pipe-a-hdmi-a-3:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [0.31] s
> > 
> >   * igt@kms_lease@setcrtc_implicit_plane@pipe-b-hdmi-a-3:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [0.14] s
> > 
> >   * igt@kms_lease@setcrtc_implicit_plane@pipe-c-hdmi-a-3:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [0.15] s
> > 
> >   * igt@kms_lease@setcrtc_implicit_plane@pipe-d-hdmi-a-3:
> >     - Statuses : 1 pass(s)
> >     - Exec time: [0.14] s
> > 
> >   
> > 
> > Known issues
> > ------------
> > 
> >   Here are the changes found in IGTPW_7883_full that come from known issues:
> > 
> > ### IGT changes ###
> > 
> > #### Issues hit ####
> > 
> >   * igt@gem_exec_balancer@parallel-bb-first:
> >     - shard-iclb:         [PASS][12] -> ([SKIP][13], [SKIP][14]) ([i915#4525]) +1 similar issue
> >    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html
> >    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb7/igt@gem_exec_balancer@parallel-bb-first.html
> >    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb6/igt@gem_exec_balancer@parallel-bb-first.html
> > 
> >   * igt@gem_exec_balancer@parallel-keep-in-fence:
> >     - shard-iclb:         [PASS][15] -> ([SKIP][16], [PASS][17]) ([i915#4525]) +1 similar issue
> >    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb4/igt@gem_exec_balancer@parallel-keep-in-fence.html
> >    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@gem_exec_balancer@parallel-keep-in-fence.html
> >    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@gem_exec_balancer@parallel-keep-in-fence.html
> > 
> >   * igt@gem_exec_fair@basic-none-solo@rcs0:
> >     - shard-apl:          [PASS][18] -> ([FAIL][19], [FAIL][20]) ([i915#2842])
> >    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html
> >    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
> >    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl8/igt@gem_exec_fair@basic-none-solo@rcs0.html
> > 
> >   * igt@gem_exec_fair@basic-none-vip@rcs0:
> >     - shard-tglb:         NOTRUN -> ([FAIL][21], [FAIL][22]) ([i915#2842])
> >    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@gem_exec_fair@basic-none-vip@rcs0.html
> >    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@gem_exec_fair@basic-none-vip@rcs0.html
> >     - shard-glk:          NOTRUN -> ([FAIL][23], [FAIL][24]) ([i915#2842])
> >    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk9/igt@gem_exec_fair@basic-none-vip@rcs0.html
> >    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk8/igt@gem_exec_fair@basic-none-vip@rcs0.html
> >     - shard-iclb:         NOTRUN -> ([FAIL][25], [FAIL][26]) ([i915#2842])
> >    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@gem_exec_fair@basic-none-vip@rcs0.html
> >    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@gem_exec_fair@basic-none-vip@rcs0.html
> > 
> >   * igt@gem_exec_fair@basic-none@vcs0:
> >     - shard-glk:          [PASS][27] -> ([FAIL][28], [PASS][29]) ([i915#2842]) +1 similar issue
> >    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk5/igt@gem_exec_fair@basic-none@vcs0.html
> >    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk2/igt@gem_exec_fair@basic-none@vcs0.html
> >    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk3/igt@gem_exec_fair@basic-none@vcs0.html
> > 
> >   * igt@gem_exec_fair@basic-pace@vcs1:
> >     - shard-iclb:         NOTRUN -> [FAIL][30] ([i915#2842])
> >    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html
> > 
> >   * igt@gem_exec_fair@basic-throttle@rcs0:
> >     - shard-iclb:         [PASS][31] -> ([FAIL][32], [PASS][33]) ([i915#2842]) +1 similar issue
> >    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html
> >    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html
> >    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html
> > 
> >   * igt@gem_exec_params@no-bsd:
> >     - shard-iclb:         NOTRUN -> ([SKIP][34], [SKIP][35]) ([fdo#109283])
> >    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@gem_exec_params@no-bsd.html
> >    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb5/igt@gem_exec_params@no-bsd.html
> >     - shard-tglb:         NOTRUN -> ([SKIP][36], [SKIP][37]) ([fdo#109283])
> >    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@gem_exec_params@no-bsd.html
> >    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@gem_exec_params@no-bsd.html
> > 
> >   * igt@gem_lmem_swapping@parallel-random-verify:
> >     - shard-apl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#4613])
> >    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl2/igt@gem_lmem_swapping@parallel-random-verify.html
> >     - shard-tglb:         NOTRUN -> ([SKIP][39], [SKIP][40]) ([i915#4613]) +2 similar issues
> >    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@gem_lmem_swapping@parallel-random-verify.html
> >    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@gem_lmem_swapping@parallel-random-verify.html
> > 
> >   * igt@gem_lmem_swapping@random-engines:
> >     - shard-glk:          NOTRUN -> ([SKIP][41], [SKIP][42]) ([fdo#109271] / [i915#4613]) +3 similar issues
> >    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk1/igt@gem_lmem_swapping@random-engines.html
> >    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk3/igt@gem_lmem_swapping@random-engines.html
> > 
> >   * igt@gem_lmem_swapping@verify:
> >     - shard-iclb:         NOTRUN -> ([SKIP][43], [SKIP][44]) ([i915#4613]) +2 similar issues
> >    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@gem_lmem_swapping@verify.html
> >    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb5/igt@gem_lmem_swapping@verify.html
> >     - shard-apl:          NOTRUN -> ([SKIP][45], [SKIP][46]) ([fdo#109271] / [i915#4613]) +2 similar issues
> >    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl6/igt@gem_lmem_swapping@verify.html
> >    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@gem_lmem_swapping@verify.html
> > 
> >   * igt@gem_pxp@protected-raw-src-copy-not-readible:
> >     - shard-iclb:         NOTRUN -> ([SKIP][47], [SKIP][48]) ([i915#4270])
> >    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@gem_pxp@protected-raw-src-copy-not-readible.html
> >    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@gem_pxp@protected-raw-src-copy-not-readible.html
> >     - shard-tglb:         NOTRUN -> ([SKIP][49], [SKIP][50]) ([i915#4270])
> >    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@gem_pxp@protected-raw-src-copy-not-readible.html
> >    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@gem_pxp@protected-raw-src-copy-not-readible.html
> > 
> >   * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
> >     - shard-iclb:         NOTRUN -> ([SKIP][51], [SKIP][52]) ([i915#768])
> >    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html
> >    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html
> > 
> >   * igt@gem_userptr_blits@dmabuf-unsync:
> >     - shard-tglb:         NOTRUN -> ([SKIP][53], [SKIP][54]) ([i915#3297])
> >    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@gem_userptr_blits@dmabuf-unsync.html
> >    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@gem_userptr_blits@dmabuf-unsync.html
> >     - shard-iclb:         NOTRUN -> ([SKIP][55], [SKIP][56]) ([i915#3297])
> >    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb5/igt@gem_userptr_blits@dmabuf-unsync.html
> >    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@gem_userptr_blits@dmabuf-unsync.html
> > 
> >   * igt@gen9_exec_parse@allowed-all:
> >     - shard-apl:          NOTRUN -> ([PASS][57], [DMESG-WARN][58]) ([i915#5566] / [i915#716])
> >    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl3/igt@gen9_exec_parse@allowed-all.html
> >    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@gen9_exec_parse@allowed-all.html
> > 
> >   * igt@gen9_exec_parse@allowed-single:
> >     - shard-glk:          [PASS][59] -> ([DMESG-WARN][60], [PASS][61]) ([i915#5566] / [i915#716])
> >    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk7/igt@gen9_exec_parse@allowed-single.html
> >    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk5/igt@gen9_exec_parse@allowed-single.html
> >    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk3/igt@gen9_exec_parse@allowed-single.html
> > 
> >   * igt@gen9_exec_parse@unaligned-jump:
> >     - shard-iclb:         NOTRUN -> ([SKIP][62], [SKIP][63]) ([i915#2856])
> >    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@gen9_exec_parse@unaligned-jump.html
> >    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@gen9_exec_parse@unaligned-jump.html
> >     - shard-tglb:         NOTRUN -> ([SKIP][64], [SKIP][65]) ([i915#2527] / [i915#2856])
> >    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@gen9_exec_parse@unaligned-jump.html
> >    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@gen9_exec_parse@unaligned-jump.html
> > 
> >   * igt@i915_suspend@forcewake:
> >     - shard-apl:          [PASS][66] -> ([DMESG-WARN][67], [DMESG-WARN][68]) ([i915#180])
> >    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl8/igt@i915_suspend@forcewake.html
> >    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@i915_suspend@forcewake.html
> >    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl8/igt@i915_suspend@forcewake.html
> > 
> >   * igt@kms_addfb_basic@legacy-format:
> >     - shard-tglb:         NOTRUN -> ([INCOMPLETE][69], [PASS][70]) ([i915#6987])
> >    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@kms_addfb_basic@legacy-format.html
> >    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@kms_addfb_basic@legacy-format.html
> > 
> >   * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
> >     - shard-tglb:         NOTRUN -> ([SKIP][71], [SKIP][72]) ([i915#5286])
> >    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
> >    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
> >     - shard-iclb:         NOTRUN -> ([SKIP][73], [SKIP][74]) ([i915#5286])
> >    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
> >    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
> > 
> >   * igt@kms_big_fb@linear-16bpp-rotate-90:
> >     - shard-iclb:         NOTRUN -> ([SKIP][75], [SKIP][76]) ([fdo#110725] / [fdo#111614])
> >    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_big_fb@linear-16bpp-rotate-90.html
> >    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_big_fb@linear-16bpp-rotate-90.html
> >     - shard-tglb:         NOTRUN -> ([SKIP][77], [SKIP][78]) ([fdo#111614])
> >    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@kms_big_fb@linear-16bpp-rotate-90.html
> >    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_big_fb@linear-16bpp-rotate-90.html
> > 
> >   * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
> >     - shard-glk:          [PASS][79] -> ([DMESG-FAIL][80], [DMESG-FAIL][81]) ([i915#118] / [i915#1888])
> >    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk8/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
> >    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk5/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
> >    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk8/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
> > 
> >   * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
> >     - shard-tglb:         NOTRUN -> [SKIP][82] ([fdo#111615])
> >    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html
> > 
> >   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> >     - shard-tglb:         NOTRUN -> ([SKIP][83], [SKIP][84]) ([fdo#111615]) +1 similar issue
> >    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> >    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> > 
> >   * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
> >     - shard-glk:          NOTRUN -> ([SKIP][85], [SKIP][86]) ([fdo#109271] / [i915#3886]) +5 similar issues
> >    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk3/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html
> >    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk2/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html
> > 
> >   * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs:
> >     - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109278]) +1 similar issue
> >    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs.html
> > 
> >   * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs:
> >     - shard-iclb:         NOTRUN -> ([SKIP][88], [SKIP][89]) ([fdo#109278]) +5 similar issues
> >    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs.html
> >    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs.html
> > 
> >   * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
> >     - shard-tglb:         NOTRUN -> ([SKIP][90], [SKIP][91]) ([i915#3689] / [i915#6095]) +1 similar issue
> >    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html
> >    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html
> > 
> >   * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
> >     - shard-apl:          NOTRUN -> ([SKIP][92], [SKIP][93]) ([fdo#109271] / [i915#3886]) +9 similar issues
> >    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
> >    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl3/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
> >     - shard-tglb:         NOTRUN -> ([SKIP][94], [SKIP][95]) ([i915#3689] / [i915#3886])
> >    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
> >    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
> >     - shard-iclb:         NOTRUN -> ([SKIP][96], [SKIP][97]) ([fdo#109278] / [i915#3886]) +2 similar issues
> >    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
> >    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
> > 
> >   * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
> >     - shard-apl:          NOTRUN -> [SKIP][98] ([fdo#109271] / [i915#3886])
> >    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl6/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html
> > 
> >   * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs:
> >     - shard-tglb:         NOTRUN -> ([SKIP][99], [SKIP][100]) ([i915#3689]) +2 similar issues
> >    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs.html
> >    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs.html
> > 
> >   * igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs:
> >     - shard-tglb:         NOTRUN -> ([SKIP][101], [SKIP][102]) ([fdo#111615] / [i915#3689]) +2 similar issues
> >    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs.html
> >    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs.html
> > 
> >   * igt@kms_chamelium@dp-frame-dump:
> >     - shard-apl:          NOTRUN -> [SKIP][103] ([fdo#109271] / [fdo#111827]) +3 similar issues
> >    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl6/igt@kms_chamelium@dp-frame-dump.html
> > 
> >   * igt@kms_chamelium@dp-hpd:
> >     - shard-glk:          NOTRUN -> ([SKIP][104], [SKIP][105]) ([fdo#109271] / [fdo#111827]) +3 similar issues
> >    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk3/igt@kms_chamelium@dp-hpd.html
> >    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk2/igt@kms_chamelium@dp-hpd.html
> > 
> >   * igt@kms_chamelium@hdmi-audio:
> >     - shard-snb:          NOTRUN -> ([SKIP][106], [SKIP][107]) ([fdo#109271] / [fdo#111827]) +3 similar issues
> >    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-snb4/igt@kms_chamelium@hdmi-audio.html
> >    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-snb7/igt@kms_chamelium@hdmi-audio.html
> >     - shard-tglb:         NOTRUN -> ([SKIP][108], [SKIP][109]) ([fdo#109284] / [fdo#111827]) +1 similar issue
> >    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@kms_chamelium@hdmi-audio.html
> >    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_chamelium@hdmi-audio.html
> > 
> >   * igt@kms_chamelium@hdmi-cmp-planar-formats:
> >     - shard-iclb:         NOTRUN -> ([SKIP][110], [SKIP][111]) ([fdo#109284] / [fdo#111827]) +3 similar issues
> >    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@kms_chamelium@hdmi-cmp-planar-formats.html
> >    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_chamelium@hdmi-cmp-planar-formats.html
> >     - shard-snb:          NOTRUN -> [SKIP][112] ([fdo#109271] / [fdo#111827])
> >    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-snb5/igt@kms_chamelium@hdmi-cmp-planar-formats.html
> >     - shard-tglb:         NOTRUN -> [SKIP][113] ([fdo#109284] / [fdo#111827]) +1 similar issue
> >    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_chamelium@hdmi-cmp-planar-formats.html
> > 
> >   * igt@kms_chamelium@hdmi-crc-nonplanar-formats:
> >     - shard-glk:          NOTRUN -> [SKIP][114] ([fdo#109271] / [fdo#111827]) +1 similar issue
> >    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk6/igt@kms_chamelium@hdmi-crc-nonplanar-formats.html
> > 
> >   * igt@kms_color@ctm-0-75@pipe-a-edp-1:
> >     - shard-iclb:         NOTRUN -> ([FAIL][115], [FAIL][116]) ([i915#315] / [i915#6946]) +2 similar issues
> >    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@kms_color@ctm-0-75@pipe-a-edp-1.html
> >    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_color@ctm-0-75@pipe-a-edp-1.html
> > 
> >   * igt@kms_color@ctm-0-75@pipe-c-edp-1:
> >     - shard-tglb:         NOTRUN -> ([FAIL][117], [FAIL][118]) ([i915#315]) +3 similar issues
> >    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@kms_color@ctm-0-75@pipe-c-edp-1.html
> >    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@kms_color@ctm-0-75@pipe-c-edp-1.html
> > 
> >   * igt@kms_color_chamelium@ctm-0-50:
> >     - shard-apl:          NOTRUN -> ([SKIP][119], [SKIP][120]) ([fdo#109271] / [fdo#111827]) +4 similar issues
> >    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl3/igt@kms_color_chamelium@ctm-0-50.html
> >    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@kms_color_chamelium@ctm-0-50.html
> > 
> >   * igt@kms_content_protection@uevent:
> >     - shard-apl:          NOTRUN -> [FAIL][121] ([i915#2105])
> >    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@kms_content_protection@uevent.html
> > 
> >   * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:
> >     - shard-apl:          NOTRUN -> ([PASS][122], [DMESG-WARN][123]) ([i915#180])
> >    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl6/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html
> >    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl3/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html
> > 
> >   * igt@kms_cursor_legacy@cursora-vs-flipb@atomic:
> >     - shard-iclb:         NOTRUN -> ([SKIP][124], [SKIP][125]) ([fdo#109274]) +5 similar issues
> >    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@kms_cursor_legacy@cursora-vs-flipb@atomic.html
> >    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@kms_cursor_legacy@cursora-vs-flipb@atomic.html
> > 
> >   * igt@kms_cursor_legacy@cursora-vs-flipb@varying-size:
> >     - shard-tglb:         NOTRUN -> ([SKIP][126], [SKIP][127]) ([fdo#109274] / [fdo#111825]) +5 similar issues
> >    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@kms_cursor_legacy@cursora-vs-flipb@varying-size.html
> >    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@kms_cursor_legacy@cursora-vs-flipb@varying-size.html
> > 
> >   * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
> >     - shard-glk:          [PASS][128] -> ([FAIL][129], [FAIL][130]) ([i915#2346]) +1 similar issue
> >    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
> >    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
> >    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
> > 
> >   * igt@kms_flip@2x-nonexisting-fb:
> >     - shard-apl:          NOTRUN -> [SKIP][131] ([fdo#109271]) +28 similar issues
> >    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@kms_flip@2x-nonexisting-fb.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode:
> >     - shard-iclb:         NOTRUN -> [SKIP][132] ([i915#6375])
> >    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
> >     - shard-iclb:         NOTRUN -> ([SKIP][133], [SKIP][134]) ([i915#2672]) +2 similar issues
> >    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html
> >    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
> >     - shard-iclb:         NOTRUN -> [SKIP][135] ([i915#2587] / [i915#2672]) +1 similar issue
> >    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
> >     - shard-iclb:         NOTRUN -> ([SKIP][136], [SKIP][137]) ([i915#2587] / [i915#2672])
> >    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html
> >    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
> >     - shard-iclb:         NOTRUN -> [SKIP][138] ([i915#3555]) +1 similar issue
> >    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
> >     - shard-iclb:         NOTRUN -> [SKIP][139] ([i915#2672]) +3 similar issues
> >    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
> >     - shard-iclb:         NOTRUN -> [SKIP][140] ([i915#2672] / [i915#3555])
> >    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
> >     - shard-tglb:         NOTRUN -> ([SKIP][141], [SKIP][142]) ([fdo#109280] / [fdo#111825]) +9 similar issues
> >    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
> >    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt:
> >     - shard-iclb:         NOTRUN -> ([SKIP][143], [SKIP][144]) ([fdo#109280]) +11 similar issues
> >    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt.html
> >    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
> >     - shard-tglb:         NOTRUN -> ([SKIP][145], [SKIP][146]) ([i915#6497]) +4 similar issues
> >    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
> >    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
> >     - shard-glk:          NOTRUN -> [SKIP][147] ([fdo#109271]) +12 similar issues
> >    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
> >     - shard-snb:          NOTRUN -> [SKIP][148] ([fdo#109271]) +40 similar issues
> >    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> >     - shard-tglb:         NOTRUN -> [SKIP][149] ([fdo#109280] / [fdo#111825]) +1 similar issue
> >    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> > 
> >   * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
> >     - shard-tglb:         NOTRUN -> ([SKIP][150], [SKIP][151]) ([fdo#109289])
> >    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html
> >    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html
> >     - shard-iclb:         NOTRUN -> [SKIP][152] ([fdo#109289])
> >    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html
> > 
> >   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
> >     - shard-apl:          [PASS][153] -> ([PASS][154], [DMESG-WARN][155]) ([i915#180])
> >    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
> >    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
> >    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
> > 
> >   * igt@kms_plane_alpha_blend@pipe-b-coverage-7efc:
> >     - shard-tglb:         NOTRUN -> ([SKIP][156], [SKIP][157]) ([i915#6988]) +28 similar issues
> >    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@kms_plane_alpha_blend@pipe-b-coverage-7efc.html
> >    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@kms_plane_alpha_blend@pipe-b-coverage-7efc.html
> > 
> >   * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
> >     - shard-apl:          NOTRUN -> ([SKIP][158], [SKIP][159]) ([fdo#109271]) +218 similar issues
> >    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
> >    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
> > 
> >   * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid:
> >     - shard-iclb:         NOTRUN -> ([SKIP][160], [SKIP][161]) ([i915#6988]) +33 similar issues
> >    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb6/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid.html
> >    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb7/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid.html
> > 
> >   * igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant:
> >     - shard-iclb:         NOTRUN -> [SKIP][162] ([i915#6988])
> >    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant.html
> > 
> >   * igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb:
> >     - shard-tglb:         NOTRUN -> [SKIP][163] ([i915#6988]) +5 similar issues
> >    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html
> > 
> >   * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
> >     - shard-glk:          NOTRUN -> [SKIP][164] ([fdo#109271] / [i915#658])
> >    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
> > 
> >   * igt@kms_psr2_su@page_flip-xrgb8888:
> >     - shard-iclb:         [PASS][165] -> ([SKIP][166], [SKIP][167]) ([fdo#109642] / [fdo#111068] / [i915#658])
> >    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html
> >    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb6/igt@kms_psr2_su@page_flip-xrgb8888.html
> >    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb7/igt@kms_psr2_su@page_flip-xrgb8888.html
> >     - shard-apl:          NOTRUN -> ([SKIP][168], [SKIP][169]) ([fdo#109271] / [i915#658])
> >    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@kms_psr2_su@page_flip-xrgb8888.html
> >    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl6/igt@kms_psr2_su@page_flip-xrgb8888.html
> > 
> >   * igt@kms_psr@psr2_primary_page_flip:
> >     - shard-iclb:         [PASS][170] -> ([SKIP][171], [SKIP][172]) ([fdo#109441]) +1 similar issue
> >    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
> >    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.html
> >    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html
> > 
> >   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> >     - shard-tglb:         [PASS][173] -> ([SKIP][174], [PASS][175]) ([i915#5519])
> >    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-tglb8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> >    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> >    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> > 
> >   * igt@kms_vblank@pipe-b-accuracy-idle:
> >     - shard-glk:          [PASS][176] -> ([PASS][177], [FAIL][178]) ([i915#43])
> >    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk3/igt@kms_vblank@pipe-b-accuracy-idle.html
> >    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk7/igt@kms_vblank@pipe-b-accuracy-idle.html
> >    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk5/igt@kms_vblank@pipe-b-accuracy-idle.html
> > 
> >   * igt@kms_vblank@pipe-d-wait-idle:
> >     - shard-apl:          NOTRUN -> ([SKIP][179], [SKIP][180]) ([fdo#109271] / [i915#533])
> >    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl3/igt@kms_vblank@pipe-d-wait-idle.html
> >    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl2/igt@kms_vblank@pipe-d-wait-idle.html
> > 
> >   * igt@kms_writeback@writeback-invalid-parameters:
> >     - shard-glk:          NOTRUN -> ([SKIP][181], [SKIP][182]) ([fdo#109271] / [i915#2437])
> >    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk5/igt@kms_writeback@writeback-invalid-parameters.html
> >    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk8/igt@kms_writeback@writeback-invalid-parameters.html
> > 
> >   * igt@nouveau_crc@pipe-b-source-outp-inactive:
> >     - shard-tglb:         NOTRUN -> ([SKIP][183], [SKIP][184]) ([i915#6971]) +39 similar issues
> >    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@nouveau_crc@pipe-b-source-outp-inactive.html
> >    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@nouveau_crc@pipe-b-source-outp-inactive.html
> > 
> >   * igt@nouveau_crc@pipe-d-ctx-flip-detection:
> >     - shard-glk:          NOTRUN -> ([SKIP][185], [SKIP][186]) ([fdo#109271]) +151 similar issues
> >    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk2/igt@nouveau_crc@pipe-d-ctx-flip-detection.html
> >    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk8/igt@nouveau_crc@pipe-d-ctx-flip-detection.html
> > 
> >   * igt@perf_pmu@module-unload:
> >     - shard-tglb:         [PASS][187] -> ([DMESG-WARN][188], [PASS][189]) ([i915#2867])
> >    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-tglb1/igt@perf_pmu@module-unload.html
> >    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@perf_pmu@module-unload.html
> >    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@perf_pmu@module-unload.html
> > 
> >   * igt@prime_nv_pcopy@test1_micro:
> >     - shard-iclb:         NOTRUN -> [SKIP][190] ([i915#6971]) +2 similar issues
> >    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@prime_nv_pcopy@test1_micro.html
> > 
> >   * igt@prime_nv_pcopy@test3_4:
> >     - shard-tglb:         NOTRUN -> [SKIP][191] ([i915#6971]) +7 similar issues
> >    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb5/igt@prime_nv_pcopy@test3_4.html
> > 
> >   * igt@prime_nv_pcopy@test3_5:
> >     - shard-snb:          NOTRUN -> ([SKIP][192], [SKIP][193]) ([fdo#109271]) +151 similar issues
> >    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-snb4/igt@prime_nv_pcopy@test3_5.html
> >    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-snb2/igt@prime_nv_pcopy@test3_5.html
> > 
> >   * igt@prime_nv_test@i915_blt_fill_nv_read:
> >     - shard-iclb:         NOTRUN -> ([SKIP][194], [SKIP][195]) ([i915#6971]) +44 similar issues
> >    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@prime_nv_test@i915_blt_fill_nv_read.html
> >    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@prime_nv_test@i915_blt_fill_nv_read.html
> > 
> >   * igt@sysfs_clients@sema-25:
> >     - shard-apl:          NOTRUN -> ([SKIP][196], [SKIP][197]) ([fdo#109271] / [i915#2994]) +1 similar issue
> >    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl3/igt@sysfs_clients@sema-25.html
> >    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl2/igt@sysfs_clients@sema-25.html
> >     - shard-tglb:         NOTRUN -> ([SKIP][198], [SKIP][199]) ([i915#2994]) +1 similar issue
> >    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb8/igt@sysfs_clients@sema-25.html
> >    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb7/igt@sysfs_clients@sema-25.html
> >     - shard-glk:          NOTRUN -> ([SKIP][200], [SKIP][201]) ([fdo#109271] / [i915#2994]) +1 similar issue
> >    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk8/igt@sysfs_clients@sema-25.html
> >    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk9/igt@sysfs_clients@sema-25.html
> > 
> >   * igt@sysfs_clients@split-10:
> >     - shard-iclb:         NOTRUN -> ([SKIP][202], [SKIP][203]) ([i915#2994]) +1 similar issue
> >    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@sysfs_clients@split-10.html
> >    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@sysfs_clients@split-10.html
> > 
> >   
> > #### Possible fixes ####
> > 
> >   * igt@fbdev@info:
> >     - {shard-rkl}:        [SKIP][204] ([i915#2582]) -> [PASS][205] +2 similar issues
> >    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-5/igt@fbdev@info.html
> >    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-6/igt@fbdev@info.html
> > 
> >   * igt@gem_ctx_isolation@preservation-s3@rcs0:
> >     - shard-apl:          [DMESG-WARN][206] ([i915#180]) -> ([PASS][207], [PASS][208])
> >    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl8/igt@gem_ctx_isolation@preservation-s3@rcs0.html
> >    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
> >    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html
> > 
> >   * igt@gem_ctx_persistence@legacy-engines-hang@blt:
> >     - {shard-rkl}:        [SKIP][209] ([i915#6252]) -> [PASS][210]
> >    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.html
> >    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-1/igt@gem_ctx_persistence@legacy-engines-hang@blt.html
> > 
> >   * igt@gem_exec_endless@dispatch@bcs0:
> >     - {shard-rkl}:        [SKIP][211] ([i915#6247]) -> [PASS][212]
> >    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-5/igt@gem_exec_endless@dispatch@bcs0.html
> >    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-2/igt@gem_exec_endless@dispatch@bcs0.html
> > 
> >   * igt@gem_exec_fair@basic-none-share@rcs0:
> >     - shard-glk:          [FAIL][213] ([i915#2842]) -> ([PASS][214], [PASS][215])
> >    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html
> >    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html
> >    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk5/igt@gem_exec_fair@basic-none-share@rcs0.html
> > 
> >   * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
> >     - {shard-rkl}:        [SKIP][216] ([fdo#109313]) -> [PASS][217]
> >    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
> >    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
> > 
> >   * igt@gem_exec_reloc@basic-gtt-read-noreloc:
> >     - {shard-rkl}:        [SKIP][218] ([i915#3281]) -> [PASS][219] +7 similar issues
> >    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-read-noreloc.html
> >    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-read-noreloc.html
> > 
> >   * igt@gem_partial_pwrite_pread@writes-after-reads:
> >     - {shard-rkl}:        [SKIP][220] ([i915#3282]) -> [PASS][221] +5 similar issues
> >    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads.html
> >    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.html
> > 
> >   * igt@gem_ppgtt@blt-vs-render-ctx0:
> >     - {shard-rkl}:        [DMESG-FAIL][222] ([i915#3692]) -> [PASS][223]
> >    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-5/igt@gem_ppgtt@blt-vs-render-ctx0.html
> >    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-2/igt@gem_ppgtt@blt-vs-render-ctx0.html
> > 
> >   * igt@gem_softpin@evict-single-offset:
> >     - {shard-rkl}:        [FAIL][224] ([i915#4171]) -> [PASS][225]
> >    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-5/igt@gem_softpin@evict-single-offset.html
> >    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-1/igt@gem_softpin@evict-single-offset.html
> > 
> >   * igt@gem_workarounds@suspend-resume:
> >     - {shard-tglu}:       [DMESG-WARN][226] ([i915#5122]) -> [PASS][227]
> >    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-tglu-3/igt@gem_workarounds@suspend-resume.html
> >    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglu-3/igt@gem_workarounds@suspend-resume.html
> > 
> >   * igt@gen9_exec_parse@allowed-all:
> >     - shard-glk:          [DMESG-WARN][228] ([i915#5566] / [i915#716]) -> ([PASS][229], [PASS][230])
> >    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk5/igt@gen9_exec_parse@allowed-all.html
> >    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk2/igt@gen9_exec_parse@allowed-all.html
> >    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk3/igt@gen9_exec_parse@allowed-all.html
> > 
> >   * igt@gen9_exec_parse@allowed-single:
> >     - {shard-rkl}:        [SKIP][231] ([i915#2527]) -> [PASS][232] +2 similar issues
> >    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-2/igt@gen9_exec_parse@allowed-single.html
> >    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-5/igt@gen9_exec_parse@allowed-single.html
> > 
> >   * igt@i915_hangman@engine-engine-error@bcs0:
> >     - {shard-rkl}:        [SKIP][233] ([i915#6258]) -> [PASS][234]
> >    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-5/igt@i915_hangman@engine-engine-error@bcs0.html
> >    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-4/igt@i915_hangman@engine-engine-error@bcs0.html
> > 
> >   * igt@i915_module_load@reload-no-display:
> >     - shard-snb:          [DMESG-WARN][235] ([i915#4528]) -> ([PASS][236], [PASS][237])
> >    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-snb5/igt@i915_module_load@reload-no-display.html
> >    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-snb4/igt@i915_module_load@reload-no-display.html
> >    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-snb6/igt@i915_module_load@reload-no-display.html
> > 
> >   * igt@i915_pm_dc@dc9-dpms:
> >     - {shard-rkl}:        [SKIP][238] ([i915#3361]) -> [PASS][239]
> >    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-5/igt@i915_pm_dc@dc9-dpms.html
> >    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-2/igt@i915_pm_dc@dc9-dpms.html
> > 
> >   * igt@i915_pm_rpm@modeset-lpsp:
> >     - {shard-rkl}:        [SKIP][240] ([i915#1397]) -> [PASS][241]
> >    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-5/igt@i915_pm_rpm@modeset-lpsp.html
> >    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp.html
> > 
> >   * igt@i915_pm_rps@engine-order:
> >     - shard-apl:          [FAIL][242] ([i915#6537]) -> ([PASS][243], [PASS][244])
> >    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl7/igt@i915_pm_rps@engine-order.html
> >    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@i915_pm_rps@engine-order.html
> >    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl8/igt@i915_pm_rps@engine-order.html
> > 
> >   * igt@i915_suspend@debugfs-reader:
> >     - shard-apl:          [DMESG-WARN][245] ([i915#180]) -> [PASS][246]
> >    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl1/igt@i915_suspend@debugfs-reader.html
> >    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@i915_suspend@debugfs-reader.html
> > 
> >   * igt@kms_fbcon_fbt@fbc-suspend:
> >     - {shard-tglu}:       [FAIL][247] ([i915#4767]) -> [PASS][248]
> >    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-tglu-4/igt@kms_fbcon_fbt@fbc-suspend.html
> >    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglu-2/igt@kms_fbcon_fbt@fbc-suspend.html
> > 
> >   * igt@kms_flip@flip-vs-expired-vblank@b-dp1:
> >     - shard-apl:          [FAIL][249] ([i915#79]) -> [PASS][250] +1 similar issue
> >    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl2/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html
> >    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl3/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-badstride:
> >     - {shard-rkl}:        [SKIP][251] ([i915#1849] / [i915#4098]) -> [PASS][252] +18 similar issues
> >    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-badstride.html
> >    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-badstride.html
> > 
> >   * igt@kms_plane@plane-position-hole-dpms@pipe-b-planes:
> >     - {shard-rkl}:        [SKIP][253] ([i915#1849] / [i915#3558]) -> [PASS][254] +1 similar issue
> >    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html
> >    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html
> > 
> >   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1:
> >     - shard-iclb:         [SKIP][255] ([i915#5235]) -> ([PASS][256], [PASS][257]) +2 similar issues
> >    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html
> >    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html
> >    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html
> > 
> >   * igt@kms_universal_plane@universal-plane-pipe-b-sanity:
> >     - {shard-rkl}:        [SKIP][258] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][259] +1 similar issue
> >    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-2/igt@kms_universal_plane@universal-plane-pipe-b-sanity.html
> >    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-6/igt@kms_universal_plane@universal-plane-pipe-b-sanity.html
> > 
> >   * igt@kms_vblank@pipe-b-query-forked:
> >     - {shard-rkl}:        [SKIP][260] ([i915#1845] / [i915#4098]) -> [PASS][261] +20 similar issues
> >    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-5/igt@kms_vblank@pipe-b-query-forked.html
> >    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-rkl-6/igt@kms_vblank@pipe-b-query-forked.html
> > 
> >   * igt@perf@polling-small-buf:
> >     - shard-tglb:         [FAIL][262] ([i915#1722]) -> ([PASS][263], [PASS][264])
> >    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-tglb8/igt@perf@polling-small-buf.html
> >    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@perf@polling-small-buf.html
> >    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb3/igt@perf@polling-small-buf.html
> > 
> >   
> > #### Warnings ####
> > 
> >   * igt@feature_discovery@psr2:
> >     - shard-iclb:         [SKIP][265] ([i915#658]) -> ([SKIP][266], [PASS][267]) ([i915#658])
> >    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb6/igt@feature_discovery@psr2.html
> >    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb6/igt@feature_discovery@psr2.html
> >    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@feature_discovery@psr2.html
> > 
> >   * igt@gem_exec_balancer@parallel:
> >     - shard-iclb:         [SKIP][268] ([i915#4525]) -> ([PASS][269], [SKIP][270]) ([i915#4525]) +1 similar issue
> >    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb6/igt@gem_exec_balancer@parallel.html
> >    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@gem_exec_balancer@parallel.html
> >    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@gem_exec_balancer@parallel.html
> > 
> >   * igt@gem_exec_balancer@parallel-ordering:
> >     - shard-iclb:         [FAIL][271] ([i915#6117]) -> ([FAIL][272], [SKIP][273]) ([i915#4525] / [i915#6117])
> >    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html
> >    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html
> >    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb8/igt@gem_exec_balancer@parallel-ordering.html
> > 
> >   * igt@gem_exec_fair@basic-none-rrul@rcs0:
> >     - shard-glk:          [FAIL][274] ([i915#2842]) -> ([FAIL][275], [PASS][276]) ([i915#2842])
> >    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk9/igt@gem_exec_fair@basic-none-rrul@rcs0.html
> >    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk9/igt@gem_exec_fair@basic-none-rrul@rcs0.html
> >    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html
> > 
> >   * igt@gem_exec_fair@basic-none-share@rcs0:
> >     - shard-tglb:         [FAIL][277] ([i915#2842]) -> ([PASS][278], [FAIL][279]) ([i915#2842])
> >    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-tglb8/igt@gem_exec_fair@basic-none-share@rcs0.html
> >    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html
> >    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html
> > 
> >   * igt@i915_pm_dc@dc3co-vpb-simulation:
> >     - shard-iclb:         [SKIP][280] ([i915#658]) -> ([SKIP][281], [SKIP][282]) ([i915#588] / [i915#658])
> >    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
> >    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
> >    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb5/igt@i915_pm_dc@dc3co-vpb-simulation.html
> > 
> >   * igt@i915_pm_dc@dc6-psr:
> >     - shard-iclb:         [FAIL][283] ([i915#3989] / [i915#454]) -> ([PASS][284], [FAIL][285]) ([i915#3989] / [i915#454])
> >    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
> >    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb5/igt@i915_pm_dc@dc6-psr.html
> >    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
> > 
> >   * igt@i915_suspend@sysfs-reader:
> >     - shard-apl:          [DMESG-WARN][286] ([i915#180]) -> ([PASS][287], [DMESG-WARN][288]) ([i915#180]) +1 similar issue
> >    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl6/igt@i915_suspend@sysfs-reader.html
> >    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl6/igt@i915_suspend@sysfs-reader.html
> >    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@i915_suspend@sysfs-reader.html
> > 
> >   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
> >     - shard-iclb:         [SKIP][289] ([i915#2920]) -> ([SKIP][290], [SKIP][291]) ([i915#658]) +1 similar issue
> >    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
> >    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
> >    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
> > 
> >   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
> >     - shard-iclb:         [SKIP][292] ([fdo#111068] / [i915#658]) -> ([SKIP][293], [SKIP][294]) ([fdo#111068] / [i915#2920] / [i915#658])
> >    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
> >    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
> >    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
> > 
> >   * igt@kms_psr2_su@page_flip-nv12:
> >     - shard-iclb:         [SKIP][295] ([fdo#109642] / [fdo#111068] / [i915#658]) -> ([FAIL][296], [SKIP][297]) ([fdo#109642] / [fdo#111068] / [i915#5939] / [i915#658]) +1 similar issue
> >    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb8/igt@kms_psr2_su@page_flip-nv12.html
> >    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html
> >    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb6/igt@kms_psr2_su@page_flip-nv12.html
> > 
> >   * igt@kms_psr@psr2_primary_mmap_cpu:
> >     - shard-iclb:         [SKIP][298] ([fdo#109441]) -> ([PASS][299], [SKIP][300]) ([fdo#109441]) +3 similar issues
> >    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html
> >    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
> >    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html
> > 
> >   * igt@runner@aborted:
> >     - shard-apl:          ([FAIL][301], [FAIL][302], [FAIL][303], [FAIL][304], [FAIL][305], [FAIL][306]) ([i915#180] / [i915#3002] / [i915#4312]) -> ([FAIL][307], [FAIL][308], [FAIL][309], [FAIL][310], [FAIL][311], [FAIL][312], [FAIL][313], [FAIL][314], [FAIL][315], [FAIL][316]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312])
> >    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl1/igt@runner@aborted.html
> >    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl6/igt@runner@aborted.html
> >    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl1/igt@runner@aborted.html
> >    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl8/igt@runner@aborted.html
> >    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl2/igt@runner@aborted.html
> >    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl1/igt@runner@aborted.html
> >    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@runner@aborted.html
> >    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl3/igt@runner@aborted.html
> >    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl8/igt@runner@aborted.html
> >    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl3/igt@runner@aborted.html
> >    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@runner@aborted.html
> >    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@runner@aborted.html
> >    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl1/igt@runner@aborted.html
> >    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl7/igt@runner@aborted.html
> >    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl8/igt@runner@aborted.html
> >    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/shard-apl2/igt@runner@aborted.html
> > 
> >   
> >   {name}: This element is suppressed. This means it is ignored when computing
> >           the status of the difference (SUCCESS, WARNING, or FAILURE).
> > 
> >   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
> >   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
> >   [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
> >   [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
> >   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
> >   [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
> >   [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
> >   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
> >   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
> >   [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
> >   [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
> >   [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
> >   [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
> >   [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
> >   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
> >   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
> >   [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
> >   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
> >   [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
> >   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
> >   [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
> >   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
> >   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
> >   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
> >   [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
> >   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
> >   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
> >   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
> >   [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
> >   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
> >   [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
> >   [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
> >   [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
> >   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
> >   [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
> >   [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
> >   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
> >   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
> >   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
> >   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
> >   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
> >   [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
> >   [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
> >   [i915#2232]: https://gitlab.freedesktop.org/drm/intel/issues/2232
> >   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
> >   [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
> >   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
> >   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
> >   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
> >   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
> >   [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
> >   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
> >   [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
> >   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
> >   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
> >   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
> >   [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
> >   [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
> >   [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
> >   [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
> >   [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
> >   [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
> >   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
> >   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
> >   [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
> >   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
> >   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
> >   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
> >   [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
> >   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
> >   [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
> >   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
> >   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
> >   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
> >   [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
> >   [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
> >   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
> >   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
> >   [i915#3639]: https://gitlab.freedesktop.org/drm/intel/issues/3639
> >   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
> >   [i915#3692]: https://gitlab.freedesktop.org/drm/intel/issues/3692
> >   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
> >   [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
> >   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
> >   [i915#3810]: https://gitlab.freedesktop.org/drm/intel/issues/3810
> >   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
> >   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
> >   [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
> >   [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
> >   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
> >   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
> >   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
> >   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
> >   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
> >   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
> >   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
> >   [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
> >   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
> >   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
> >   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
> >   [i915#43]: https://gitlab.freedesktop.org/drm/intel/issues/43
> >   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
> >   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
> >   [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
> >   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
> >   [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
> >   [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
> >   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
> >   [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
> >   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
> >   [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
> >   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
> >   [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
> >   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
> >   [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
> >   [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
> >   [i915#4883]: https://gitlab.freedesktop.org/drm/intel/issues/4883
> >   [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
> >   [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
> >   [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
> >   [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
> >   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
> >   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
> >   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
> >   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
> >   [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
> >   [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
> >   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
> >   [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
> >   [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
> >   [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
> >   [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
> >   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
> >   [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
> >   [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
> >   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
> >   [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
> >   [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
> >   [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
> >   [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
> >   [i915#6251]: https://gitlab.freedesktop.org/drm/intel/issues/6251
> >   [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
> >   [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
> >   [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
> >   [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
> >   [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
> >   [i915#6355]: https://gitlab.freedesktop.org/drm/intel/issues/6355
> >   [i915#6375]: https://gitlab.freedesktop.org/drm/intel/issues/6375
> >   [i915#6458]: https://gitlab.freedesktop.org/drm/intel/issues/6458
> >   [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
> >   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
> >   [i915#6537]: https://gitlab.freedesktop.org/drm/intel/issues/6537
> >   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
> >   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
> >   [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
> >   [i915#6971]: https://gitlab.freedesktop.org/drm/intel/issues/6971
> >   [i915#6987]: https://gitlab.freedesktop.org/drm/intel/issues/6987
> >   [i915#6988]: https://gitlab.freedesktop.org/drm/intel/issues/6988
> >   [i915#6989]: https://gitlab.freedesktop.org/drm/intel/issues/6989
> >   [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
> >   [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
> >   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
> > 
> > 
> > Build changes
> > -------------
> > 
> >   * CI: CI-20190529 -> None
> >   * IGT: IGT_6668 -> IGTPW_7883
> >   * Piglit: piglit_4509 -> None
> > 
> >   CI-20190529: 20190529
> >   CI_DRM_12197: cafa326de8e7860d45639e61bf66ec9c218207b1 @ git://anongit.freedesktop.org/gfx-ci/linux
> >   IGTPW_7883: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/index.html
> >   IGT_6668: 5f29c9369550164b35b65baaaeba4b370f434cf1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> >   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> > 
> > == Logs ==
> > 
> > For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7883/index.html
