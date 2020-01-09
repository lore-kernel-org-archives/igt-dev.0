Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF856E3C7
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2020 10:35:49 +0000 (UTC)
Date: Thu, 9 Jan 2020 12:35:46 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200109103546.GK25209@platvala-desk.ger.corp.intel.com>
References: <20200108053437.6268-1-petri.latvala@intel.com>
 <157850320337.23226.8646134144920356374@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157850320337.23226.8646134144920356374@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fbasic=3A_Use_dynamic_subtests?=
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
To: igt-dev@lists.freedesktop.org, Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jan 08, 2020 at 05:06:43PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: i915/gem_exec_basic: Use dynamic subtests
> URL   : https://patchwork.freedesktop.org/series/71733/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_7699_full -> IGTPW_3904_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_3904_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_3904_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_3904_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_busy@close-race:
>     - shard-hsw:          NOTRUN -> [TIMEOUT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-hsw1/igt@gem_busy@close-race.html
> 
>   * igt@gem_eio@kms:
>     - shard-hsw:          [PASS][2] -> [DMESG-WARN][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-hsw2/igt@gem_eio@kms.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-hsw5/igt@gem_eio@kms.html


Lakshmi, some false positives for you above.




> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_7699_full and IGTPW_3904_full:
> 
> ### New IGT tests (18) ###
> 
>   * igt@gem_exec_basic@basic:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.00] s

I was wondering where the heck this came from (it's the base subtest,
and should not be reported) but the shard round this was in was
incomplete and the report generation was done with an older IGT.

Arek, wasn't updating the report-generating-IGT made automatic on
post-merge? It hasn't happened for this report.



-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
