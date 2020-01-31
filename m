Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758806FAE1
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 10:15:07 +0000 (UTC)
References: <20200129032605.9007-1-arjun.melkaveri@intel.com>
 <158043903896.13120.1526700707979050531@emeril.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <0b4061f3-0ddd-ccc2-c66b-7b31e9d18709@linux.intel.com>
Date: Fri, 31 Jan 2020 10:15:03 +0000
MIME-Version: 1.0
In-Reply-To: <158043903896.13120.1526700707979050531@emeril.freedesktop.org>
Content-Language: en-US
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fnop=3AAdjusted_test_to_utilize_all_available_engine?=
 =?utf-8?q?s_=28rev8=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Patchwork <patchwork@emeril.freedesktop.org>, Arjun Melkaveri <arjun.melkaveri@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 31/01/2020 02:50, Patchwork wrote:
> == Series Details ==
> 
> Series: i915/gem_exec_nop:Adjusted test to utilize all available engines (rev8)
> URL   : https://patchwork.freedesktop.org/series/72334/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_5396_full -> IGTPW_4023_full
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with IGTPW_4023_full absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_4023_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in CI.
> 
>    External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/index.html
> 
> Possible new issues
> -------------------
> 
>    Here are the unknown changes that may have been introduced in IGTPW_4023_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@gem_partial_pwrite_pread@writes-after-reads:
>      - shard-hsw:          [PASS][1] -> [FAIL][2]
>     [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-hsw6/igt@gem_partial_pwrite_pread@writes-after-reads.html
>     [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads.html

Unrelated so pushed.

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
