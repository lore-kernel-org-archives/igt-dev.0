Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1477720A3
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2020 10:15:43 +0000 (UTC)
Date: Fri, 24 Jan 2020 12:15:15 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200124101515.GP25209@platvala-desk.ger.corp.intel.com>
References: <1579766442-20285-1-git-send-email-kunal1.joshi@intel.com>
 <157979547468.1144.347795029297249183@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157979547468.1144.347795029297249183@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdmFsaWRh?=
 =?utf-8?q?te_color_tests_using_chamelium=2E_=28rev4=29?=
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
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

For those following along in the audience:

This was tested in trybot as well with a testlist consisting of only
kms_color_chamelium to get some more testing done before timeout stops
the testing completely:
https://intel-gfx-ci.01.org/tree/drm-tip/TrybotIGT_101/index.html

The skl failure is a known issue, its chamelium had its fs full. The
cml failure is a random failure to connect to chamelium, also
pre-existing. ICL got through all tests on pipes a and b with full
passes.


-- 
Petri Latvala


On Thu, Jan 23, 2020 at 04:04:34PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: validate color tests using chamelium. (rev4)
> URL   : https://patchwork.freedesktop.org/series/72006/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_5382 -> IGTPW_3981
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_3981:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * {igt@kms_color_chamelium@pipe-a-ctm-0-75} (NEW):
>     - fi-icl-u2:          NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/fi-icl-u2/igt@kms_color_chamelium@pipe-a-ctm-0-75.html
> 
>   * {igt@kms_color_chamelium@pipe-c-ctm-limited-range} (NEW):
>     - fi-skl-6700k2:      NOTRUN -> [FAIL][2] +65 similar issues
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/fi-skl-6700k2/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between IGT_5382 and IGTPW_3981:
> 
> ### New IGT tests (66) ###
> 
>   * igt@kms_color_chamelium@pipe-a-ctm-0-25:
>     - Statuses : 1 fail(s) 3 pass(s) 38 skip(s)
>     - Exec time: [0.0, 109.84] s
> 
>   * igt@kms_color_chamelium@pipe-a-ctm-0-5:
>     - Statuses : 1 fail(s) 3 pass(s) 38 skip(s)
>     - Exec time: [0.0, 109.88] s
> 
>   * igt@kms_color_chamelium@pipe-a-ctm-0-75:
>     - Statuses : 2 fail(s) 2 pass(s) 38 skip(s)
>     - Exec time: [0.0, 160.99] s
> 
>   * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
>     - Statuses : 1 fail(s) 3 pass(s) 38 skip(s)
>     - Exec time: [0.0, 23.09] s
> 
>   * igt@kms_color_chamelium@pipe-a-ctm-green-to-red:
>     - Statuses : 1 fail(s) 3 pass(s) 38 skip(s)
>     - Exec time: [0.0, 21.57] s
> 
>   * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
>     - Statuses : 1 fail(s) 3 pass(s) 38 skip(s)
>     - Exec time: [0.0, 23.16] s
> 
>   * igt@kms_color_chamelium@pipe-a-ctm-max:
>     - Statuses : 1 fail(s) 3 pass(s) 38 skip(s)
>     - Exec time: [0.0, 23.04] s
> 
>   * igt@kms_color_chamelium@pipe-a-ctm-negative:
>     - Statuses : 1 fail(s) 3 pass(s) 38 skip(s)
>     - Exec time: [0.0, 23.07] s
> 
>   * igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
>     - Statuses : 1 fail(s) 3 pass(s) 38 skip(s)
>     - Exec time: [0.0, 23.07] s
> 
>   * igt@kms_color_chamelium@pipe-a-degamma:
>     - Statuses : 1 fail(s) 3 pass(s) 38 skip(s)
>     - Exec time: [0.0, 23.13] s
> 
>   * igt@kms_color_chamelium@pipe-a-gamma:
>     - Statuses : 1 fail(s) 3 pass(s) 38 skip(s)
>     - Exec time: [0.0, 21.58] s
> 
>   * igt@kms_color_chamelium@pipe-b-ctm-0-25:
>     - Statuses : 1 fail(s) 2 pass(s) 38 skip(s)
>     - Exec time: [0.0, 109.44] s
> 
>   * igt@kms_color_chamelium@pipe-b-ctm-0-5:
>     - Statuses : 1 fail(s) 1 pass(s) 38 skip(s)
>     - Exec time: [0.0, 88.14] s
> 
>   * igt@kms_color_chamelium@pipe-b-ctm-0-75:
>     - Statuses : 1 fail(s) 1 pass(s) 38 skip(s)
>     - Exec time: [0.0, 123.50] s
> 
>   * igt@kms_color_chamelium@pipe-b-ctm-blue-to-red:
>     - Statuses : 1 fail(s) 3 pass(s) 38 skip(s)
>     - Exec time: [0.0, 21.11] s
> 
>   * igt@kms_color_chamelium@pipe-b-ctm-green-to-red:
>     - Statuses : 1 fail(s) 3 pass(s) 38 skip(s)
>     - Exec time: [0.0, 22.91] s
> 
>   * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-b-ctm-max:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-b-ctm-negative:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
>     - Statuses : 1 fail(s) 3 pass(s) 38 skip(s)
>     - Exec time: [0.0, 23.01] s
> 
>   * igt@kms_color_chamelium@pipe-b-degamma:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-b-gamma:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-c-ctm-0-25:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-c-ctm-0-5:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-c-ctm-0-75:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-c-ctm-blue-to-red:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-c-ctm-green-to-red:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-c-ctm-limited-range:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-c-ctm-max:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-c-ctm-negative:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-c-degamma:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-c-gamma:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-d-ctm-0-25:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-d-ctm-0-5:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-d-ctm-0-75:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-d-ctm-max:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-d-ctm-negative:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-d-degamma:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-d-gamma:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-e-ctm-0-25:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-e-ctm-0-5:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-e-ctm-0-75:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-e-ctm-blue-to-red:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-e-ctm-green-to-red:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-e-ctm-limited-range:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-e-ctm-max:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-e-ctm-negative:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-e-ctm-red-to-blue:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-e-degamma:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-e-gamma:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-f-ctm-0-25:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-f-ctm-0-5:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-f-ctm-0-75:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-f-ctm-blue-to-red:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-f-ctm-green-to-red:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-f-ctm-limited-range:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-f-ctm-max:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-f-ctm-negative:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-f-ctm-red-to-blue:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-f-degamma:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_color_chamelium@pipe-f-gamma:
>     - Statuses : 1 fail(s) 38 skip(s)
>     - Exec time: [0.0] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_3981 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_close_race@basic-process:
>     - fi-byt-j1900:       [PASS][3] -> [FAIL][4] ([i915#694])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/fi-byt-j1900/igt@gem_close_race@basic-process.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/fi-byt-j1900/igt@gem_close_race@basic-process.html
> 
>   * igt@gem_ctx_param@basic:
>     - fi-tgl-y:           [PASS][5] -> [DMESG-WARN][6] ([CI#94] / [i915#402]) +2 similar issues
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/fi-tgl-y/igt@gem_ctx_param@basic.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/fi-tgl-y/igt@gem_ctx_param@basic.html
> 
>   * igt@i915_selftest@live_blt:
>     - fi-bsw-n3050:       [PASS][7] -> [DMESG-FAIL][8] ([i915#723])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/fi-bsw-n3050/igt@i915_selftest@live_blt.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/fi-bsw-n3050/igt@i915_selftest@live_blt.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_close_race@basic-threads:
>     - fi-byt-j1900:       [INCOMPLETE][9] ([i915#45]) -> [PASS][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/fi-byt-j1900/igt@gem_close_race@basic-threads.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/fi-byt-j1900/igt@gem_close_race@basic-threads.html
> 
>   * igt@gem_exec_suspend@basic-s4-devices:
>     - fi-tgl-y:           [FAIL][11] ([CI#94]) -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - fi-skl-lmem:        [INCOMPLETE][13] ([i915#671] / [i915#971]) -> [PASS][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_selftest@live_blt:
>     - fi-ivb-3770:        [DMESG-FAIL][15] ([i915#725]) -> [PASS][16]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/fi-ivb-3770/igt@i915_selftest@live_blt.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/fi-ivb-3770/igt@i915_selftest@live_blt.html
>     - fi-hsw-4770:        [DMESG-FAIL][17] ([i915#725]) -> [PASS][18]
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/fi-hsw-4770/igt@i915_selftest@live_blt.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/fi-hsw-4770/igt@i915_selftest@live_blt.html
>     - fi-hsw-4770r:       [DMESG-FAIL][19] ([i915#553] / [i915#725]) -> [PASS][20]
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/fi-hsw-4770r/igt@i915_selftest@live_blt.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/fi-hsw-4770r/igt@i915_selftest@live_blt.html
> 
>   * igt@i915_selftest@live_gem_contexts:
>     - fi-hsw-peppy:       [DMESG-FAIL][21] ([i915#722]) -> [PASS][22]
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html
> 
>   * igt@kms_addfb_basic@invalid-set-prop-any:
>     - fi-tgl-y:           [DMESG-WARN][23] ([CI#94] / [i915#402]) -> [PASS][24]
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/fi-tgl-y/igt@kms_addfb_basic@invalid-set-prop-any.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/fi-tgl-y/igt@kms_addfb_basic@invalid-set-prop-any.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - fi-hsw-peppy:       [DMESG-WARN][25] ([i915#44]) -> [PASS][26]
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_parallel@contexts:
>     - fi-byt-n2820:       [FAIL][27] ([i915#694]) -> [TIMEOUT][28] ([fdo#112271])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5382/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
>   [i915#1017]: https://gitlab.freedesktop.org/drm/intel/issues/1017
>   [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
>   [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
>   [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
>   [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
>   [i915#671]: https://gitlab.freedesktop.org/drm/intel/issues/671
>   [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
>   [i915#722]: https://gitlab.freedesktop.org/drm/intel/issues/722
>   [i915#723]: https://gitlab.freedesktop.org/drm/intel/issues/723
>   [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
>   [i915#971]: https://gitlab.freedesktop.org/drm/intel/issues/971
> 
> 
> Participating hosts (53 -> 45)
> ------------------------------
> 
>   Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-kbl-7560u fi-byt-clapper fi-bdw-samus 
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5382 -> IGTPW_3981
> 
>   CI-20190529: 20190529
>   CI_DRM_7802: cd932df72f11bdff93423a8d4a9e0e9ccb0985d7 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_3981: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/index.html
>   IGT_5382: 8dbe5ce61baa2d563d4dd7c56a018bb1e1077467 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> 
> 
> 
> == Testlist changes ==
> 
> +igt@kms_color_chamelium@pipe-a-ctm-0-5
> +igt@kms_color_chamelium@pipe-a-ctm-0-25
> +igt@kms_color_chamelium@pipe-a-ctm-0-75
> +igt@kms_color_chamelium@pipe-a-ctm-blue-to-red
> +igt@kms_color_chamelium@pipe-a-ctm-green-to-red
> +igt@kms_color_chamelium@pipe-a-ctm-limited-range
> +igt@kms_color_chamelium@pipe-a-ctm-max
> +igt@kms_color_chamelium@pipe-a-ctm-negative
> +igt@kms_color_chamelium@pipe-a-ctm-red-to-blue
> +igt@kms_color_chamelium@pipe-a-degamma
> +igt@kms_color_chamelium@pipe-a-gamma
> +igt@kms_color_chamelium@pipe-b-ctm-0-5
> +igt@kms_color_chamelium@pipe-b-ctm-0-25
> +igt@kms_color_chamelium@pipe-b-ctm-0-75
> +igt@kms_color_chamelium@pipe-b-ctm-blue-to-red
> +igt@kms_color_chamelium@pipe-b-ctm-green-to-red
> +igt@kms_color_chamelium@pipe-b-ctm-limited-range
> +igt@kms_color_chamelium@pipe-b-ctm-max
> +igt@kms_color_chamelium@pipe-b-ctm-negative
> +igt@kms_color_chamelium@pipe-b-ctm-red-to-blue
> +igt@kms_color_chamelium@pipe-b-degamma
> +igt@kms_color_chamelium@pipe-b-gamma
> +igt@kms_color_chamelium@pipe-c-ctm-0-5
> +igt@kms_color_chamelium@pipe-c-ctm-0-25
> +igt@kms_color_chamelium@pipe-c-ctm-0-75
> +igt@kms_color_chamelium@pipe-c-ctm-blue-to-red
> +igt@kms_color_chamelium@pipe-c-ctm-green-to-red
> +igt@kms_color_chamelium@pipe-c-ctm-limited-range
> +igt@kms_color_chamelium@pipe-c-ctm-max
> +igt@kms_color_chamelium@pipe-c-ctm-negative
> +igt@kms_color_chamelium@pipe-c-ctm-red-to-blue
> +igt@kms_color_chamelium@pipe-c-degamma
> +igt@kms_color_chamelium@pipe-c-gamma
> +igt@kms_color_chamelium@pipe-d-ctm-0-5
> +igt@kms_color_chamelium@pipe-d-ctm-0-25
> +igt@kms_color_chamelium@pipe-d-ctm-0-75
> +igt@kms_color_chamelium@pipe-d-ctm-blue-to-red
> +igt@kms_color_chamelium@pipe-d-ctm-green-to-red
> +igt@kms_color_chamelium@pipe-d-ctm-limited-range
> +igt@kms_color_chamelium@pipe-d-ctm-max
> +igt@kms_color_chamelium@pipe-d-ctm-negative
> +igt@kms_color_chamelium@pipe-d-ctm-red-to-blue
> +igt@kms_color_chamelium@pipe-d-degamma
> +igt@kms_color_chamelium@pipe-d-gamma
> +igt@kms_color_chamelium@pipe-e-ctm-0-5
> +igt@kms_color_chamelium@pipe-e-ctm-0-25
> +igt@kms_color_chamelium@pipe-e-ctm-0-75
> +igt@kms_color_chamelium@pipe-e-ctm-blue-to-red
> +igt@kms_color_chamelium@pipe-e-ctm-green-to-red
> +igt@kms_color_chamelium@pipe-e-ctm-limited-range
> +igt@kms_color_chamelium@pipe-e-ctm-max
> +igt@kms_color_chamelium@pipe-e-ctm-negative
> +igt@kms_color_chamelium@pipe-e-ctm-red-to-blue
> +igt@kms_color_chamelium@pipe-e-degamma
> +igt@kms_color_chamelium@pipe-e-gamma
> +igt@kms_color_chamelium@pipe-f-ctm-0-5
> +igt@kms_color_chamelium@pipe-f-ctm-0-25
> +igt@kms_color_chamelium@pipe-f-ctm-0-75
> +igt@kms_color_chamelium@pipe-f-ctm-blue-to-red
> +igt@kms_color_chamelium@pipe-f-ctm-green-to-red
> +igt@kms_color_chamelium@pipe-f-ctm-limited-range
> +igt@kms_color_chamelium@pipe-f-ctm-max
> +igt@kms_color_chamelium@pipe-f-ctm-negative
> +igt@kms_color_chamelium@pipe-f-ctm-red-to-blue
> +igt@kms_color_chamelium@pipe-f-degamma
> +igt@kms_color_chamelium@pipe-f-gamma
> +igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes
> +igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes
> +igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3981/index.html
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
