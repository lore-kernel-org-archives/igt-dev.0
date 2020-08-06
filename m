Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308936E8B8
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2020 13:19:12 +0000 (UTC)
Date: Thu, 6 Aug 2020 16:19:08 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200806131908.GA7444@platvala-desk.ger.corp.intel.com>
References: <20200806180749.31464-1-bhanuprakash.modem@intel.com>
 <159671957982.5530.15049635083286626268@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159671957982.5530.15049635083286626268@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fpipe=5Fcrc=5Fbasic=3A_Sanity_check_for_CRC_mismatches_=28?=
 =?utf-8?q?rev7=29?=
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

On Thu, Aug 06, 2020 at 01:12:59PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_pipe_crc_basic: Sanity check for CRC mismatches (rev7)
> URL   : https://patchwork.freedesktop.org/series/80040/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_5761_full -> IGTPW_4856_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4856_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4856_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4856_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@flip-vs-suspend@c-edp1:
>     - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb5/igt@kms_flip@flip-vs-suspend@c-edp1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-iclb3/igt@kms_flip@flip-vs-suspend@c-edp1.html


Unrelated issue. Lakshmi, a false failure here, no need to re-report this.

Merged now.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
