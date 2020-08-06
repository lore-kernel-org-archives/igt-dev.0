Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788D289C80
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2020 08:38:04 +0000 (UTC)
Date: Thu, 6 Aug 2020 11:38:01 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200806083801.GW20883@platvala-desk.ger.corp.intel.com>
References: <20200805105900.29444-1-petri.latvala@intel.com>
 <159664479035.4771.152771425849559563@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159664479035.4771.152771425849559563@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Only_claim_the_test_was_killed_if_it_was_killed?=
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
To: igt-dev@lists.freedesktop.org, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Aug 05, 2020 at 04:26:30PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: Only claim the test was killed if it was killed
> URL   : https://patchwork.freedesktop.org/series/80284/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_5759_full -> IGTPW_4853_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4853_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4853_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4853_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@mock:
>     - shard-glk:          NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-glk9/igt@i915_selftest@mock.html
>     - shard-iclb:         NOTRUN -> [FAIL][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-iclb5/igt@i915_selftest@mock.html
>     - shard-hsw:          NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-hsw2/igt@i915_selftest@mock.html
>     - shard-kbl:          NOTRUN -> [FAIL][4]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-kbl4/igt@i915_selftest@mock.html
>     - shard-snb:          NOTRUN -> [FAIL][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-snb6/igt@i915_selftest@mock.html
>     - shard-tglb:         NOTRUN -> [FAIL][6]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4853/shard-tglb7/igt@i915_selftest@mock.html


Well that was a scary result, but turns out all of these are false failures. Lakshmi, ^


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
