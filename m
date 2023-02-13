Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFFD10E4D3
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Feb 2023 08:44:36 +0000 (UTC)
Message-ID: <aec94d7e-60a9-199b-36df-04cb56787381@intel.com>
Date: Mon, 13 Feb 2023 14:14:21 +0530
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>, <saix.nandan.yedireswarapu@intel.com>
References: <20230212062758.1956925-1-bhanuprakash.modem@intel.com>
 <167618598914.4160.6287683210450910867@emeril.freedesktop.org>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <167618598914.4160.6287683210450910867@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fcursor=5Flegacy=3A?=
 =?utf-8?q?_Fix_CI_tiemout_issues?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai Nandan,

As this patch renames (reverts) the existing subtests, below Skips are 
expected. Can you please help to re-report?

- Bhanu

On Sun-12-02-2023 12:43 pm, Patchwork wrote:
> *Patch Details*
> *Series:*	series starting with [i-g-t,1/2] tests/kms_cursor_legacy: Fix 
> CI tiemout issues
> *URL:*	https://patchwork.freedesktop.org/series/113923/ 
> <https://patchwork.freedesktop.org/series/113923/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/index.html>
> 
> 
>   CI Bug Log - changes from IGT_7159 -> IGTPW_8487
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_8487 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8487, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/index.html
> 
> 
>     Participating hosts (40 -> 36)
> 
> Missing (4): fi-kbl-soraka bat-kbl-2 bat-atsm-1 fi-snb-2520m
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_8487:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_cursor_legacy@basic-flip-after-cursor-legacy (NEW):
> 
>       o
> 
>         {bat-rpls-1}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/bat-rpls-1/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html> +7 similar issues
> 
>       o
> 
>         {bat-dg1-7}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/bat-dg1-7/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html> +7 similar issues
> 
>   *
> 
>     igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size (NEW):
> 
>       o
> 
>         {bat-adlm-1}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/bat-adlm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html> +7 similar issues
> 
>       o
> 
>         fi-tgl-1115g4: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html> +7 similar issues
> 
>   *
> 
>     igt@kms_cursor_legacy@basic-flip-before-cursor-atomic (NEW):
> 
>       o {bat-rpls-2}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/bat-rpls-2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html> +7 similar issues
> 
> 
>     New tests
> 
> New tests have been introduced between IGT_7159 and IGTPW_8487:
> 
> 
>       New IGT tests (8)
> 
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>       o Statuses : 5 pass(s) 30 skip(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>       o Statuses : 6 pass(s) 29 skip(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
> 
>       o Statuses : 23 pass(s) 12 skip(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
> 
>       o Statuses : 24 pass(s) 11 skip(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
> 
>       o Statuses : 24 pass(s) 11 skip(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
> 
>       o Statuses : 23 pass(s) 12 skip(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
> 
>       o Statuses : 24 pass(s) 11 skip(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
> 
>       o Statuses : 24 pass(s) 11 skip(s)
>       o Exec time: [0.0] s
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_8487 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@i915_selftest@live@execlists:
> 
>       o fi-bsw-n3050: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/fi-bsw-n3050/igt@i915_selftest@live@execlists.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/fi-bsw-n3050/igt@i915_selftest@live@execlists.html> (i915#7911 <https://gitlab.freedesktop.org/drm/intel/issues/7911>)
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic (NEW):
> 
>       o
> 
>         fi-glk-j4005: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1 similar issue
> 
>       o
> 
>         {bat-adlp-9}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>) +1 similar issue
> 
>       o
> 
>         fi-skl-guc: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/fi-skl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1 similar issue
> 
>       o
> 
>         fi-kbl-7567u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/fi-kbl-7567u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1 similar issue
> 
>       o
> 
>         fi-cfl-8700k: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/fi-cfl-8700k/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1 similar issue
> 
>       o
> 
>         {bat-adln-1}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/bat-adln-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>) +1 similar issue
> 
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy (NEW):
> 
>       o
> 
>         fi-bsw-nick: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/fi-bsw-nick/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +9 similar issues
> 
>       o
> 
>         {bat-rplp-1}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/bat-rplp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>) +1 similar issue
> 
>       o
> 
>         fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>) +1 similar issue
> 
>       o
> 
>         {bat-adls-5}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/bat-adls-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>) +1 similar issue
> 
>       o
> 
>         fi-cfl-guc: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/fi-cfl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1 similar issue
> 
>       o
> 
>         {bat-jsl-3}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/bat-jsl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>) +1 similar issue
> 
>       o
> 
>         {bat-dg2-9}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>) +1 similar issue
> 
>       o
> 
>         fi-cfl-8109u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/fi-cfl-8109u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1 similar issue
> 
>       o
> 
>         {bat-jsl-1}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>) +1 similar issue
> 
>       o
> 
>         {bat-adlp-6}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>) +1 similar issue
> 
>       o
> 
>         fi-skl-6600u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/fi-skl-6600u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1 similar issue
> 
>       o
> 
>         fi-apl-guc: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/fi-apl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1 similar issue
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/bat-dg1-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>) +1 similar issue
> 
>   *
> 
>     igt@kms_cursor_legacy@basic-flip-after-cursor-atomic (NEW):
> 
>       o fi-pnv-d510: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/fi-pnv-d510/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +2 similar issues
>   *
> 
>     igt@kms_cursor_legacy@basic-flip-after-cursor-legacy (NEW):
> 
>       o fi-blb-e6850: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/fi-blb-e6850/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +7 similar issues
>   *
> 
>     igt@kms_cursor_legacy@basic-flip-before-cursor-legacy (NEW):
> 
>       o
> 
>         {bat-dg2-11}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/bat-dg2-11/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +7 similar issues
> 
>       o
> 
>         fi-kbl-x1275: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +7 similar issues
> 
>   *
> 
>     igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size (NEW):
> 
>       o
> 
>         {bat-dg2-8}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/bat-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +7 similar issues
> 
>       o
> 
>         fi-kbl-guc: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845>) +7 similar issues
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@i915_selftest@live@execlists:
> 
>       o fi-bsw-nick: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/fi-bsw-nick/igt@i915_selftest@live@execlists.html> (i915#7911 <https://gitlab.freedesktop.org/drm/intel/issues/7911> / i915#7913 <https://gitlab.freedesktop.org/drm/intel/issues/7913>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/fi-bsw-nick/igt@i915_selftest@live@execlists.html>
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
> 
>       o fi-rkl-11600: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7159/fi-rkl-11600/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html> (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/fi-rkl-11600/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html>
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7159 -> IGTPW_8487
> 
> CI-20190529: 20190529
> CI_DRM_12730: c54b5fcf3e686a0abfdd7d6af53e9014c137023a @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8487: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8487/index.html
> IGT_7159: d2ca8db8bf83a19034eee61c11ec01a4e973e0ed @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
