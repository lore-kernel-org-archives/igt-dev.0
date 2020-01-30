Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3767E6E134
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 08:56:48 +0000 (UTC)
Date: Thu, 30 Jan 2020 10:56:45 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200130085645.GU25209@platvala-desk.ger.corp.intel.com>
References: <20200129131753.12460-1-petri.latvala@intel.com>
 <158031307404.5461.3089085800181360253@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158031307404.5461.3089085800181360253@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_runner=3A_Support_dynamic_subt?=
 =?utf-8?q?ests_in_testlists?=
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
To: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jan 29, 2020 at 03:51:14PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/2] runner: Support dynamic subtests in testlists
> URL   : https://patchwork.freedesktop.org/series/72719/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_5404 -> IGTPW_4027
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4027 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4027, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4027:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@runner@aborted:
>     - fi-bsw-kefka:       NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/fi-bsw-kefka/igt@runner@aborted.html
>     - fi-bsw-nick:        NOTRUN -> [FAIL][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/fi-bsw-nick/igt@runner@aborted.html
>     - fi-bsw-n3050:       NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/fi-bsw-n3050/igt@runner@aborted.html

"New" issues "caused" by Tomi enabling lockdep checking again.

Lakshmi, these will crop up in postmerge now too so you should already
have them covered. When you do, please re-report IGTPW_4027.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
