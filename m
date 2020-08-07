Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B9A6E146
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Aug 2020 08:55:46 +0000 (UTC)
Date: Fri, 7 Aug 2020 11:55:44 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200807085544.GD7444@platvala-desk.ger.corp.intel.com>
References: <20200806133337.8482-1-petri.latvala@intel.com>
 <159673659389.5530.2681002345148188331@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159673659389.5530.2681002345148188331@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fpipe=5Fcrc=5Fbasic=3A_Remove_redundant_igt=5Frequire=5Fpi?=
 =?utf-8?q?pe?=
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

On Thu, Aug 06, 2020 at 05:56:33PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_pipe_crc_basic: Remove redundant igt_require_pipe
> URL   : https://patchwork.freedesktop.org/series/80344/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_5762_full -> IGTPW_4860_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4860_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4860_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4860/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4860_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@runner@aborted:
>     - shard-iclb:         NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4860/shard-iclb1/igt@runner@aborted.html
>     - shard-snb:          NOTRUN -> [FAIL][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4860/shard-snb5/igt@runner@aborted.html


perf_pmu's module unload to be blamed. Aka false failures. Lakshmi,
more for you. No need to re-report.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
