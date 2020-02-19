Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD296EBB5
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2020 10:39:23 +0000 (UTC)
Received: from platvala by thrakatuluk with local (Exim 4.92)
 (envelope-from <petri.latvala@intel.com>) id 1j4MlF-0000X8-35
 for igt-dev@lists.freedesktop.org; Wed, 19 Feb 2020 12:39:21 +0200
Date: Wed, 19 Feb 2020 12:39:21 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200219103921.GR25209@platvala-desk.ger.corp.intel.com>
References: <20200217145042.829-1-petri.latvala@intel.com>
 <158209619321.21060.5167287093269139449@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158209619321.21060.5167287093269139449@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_runner=3A_Refactor_timeouting?=
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
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Feb 19, 2020 at 07:09:53AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/2] runner: Refactor timeouting
> URL   : https://patchwork.freedesktop.org/series/73539/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_7955_full -> IGTPW_4166_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4166_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4166_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4166_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_suspend@basic-s3:
>     - shard-iclb:         NOTRUN -> [INCOMPLETE][1] +4 similar issues
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4166/shard-iclb1/igt@gem_exec_suspend@basic-s3.html


rc2 fallout, so merged.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
