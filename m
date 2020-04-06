Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A8689D86
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2020 09:36:26 +0000 (UTC)
Date: Mon, 6 Apr 2020 12:36:16 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200406093616.nuehvsseattaqzsf@ahiler-desk1.fi.intel.com>
References: <20200403114727.27760-1-janusz.krzysztofik@linux.intel.com>
 <158594195773.13350.14284714012767143910@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158594195773.13350.14284714012767143910@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliOiBG?=
 =?utf-8?q?ix_device_lists_not_cleaned_up_sufficiently_before_rescan_=28re?=
 =?utf-8?b?djIp?=
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
Cc: Lakshmi <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Apr 03, 2020 at 07:25:57PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib: Fix device lists not cleaned up sufficiently before rescan (rev2)
> URL   : https://patchwork.freedesktop.org/series/74929/
> State : failure
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4401_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_eio@reset-stress:
>     - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-tglb1/igt@gem_eio@reset-stress.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-tglb8/igt@gem_eio@reset-stress.html
> 
>   * igt@gem_mmap_gtt@hang:
>     - shard-iclb:         [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-iclb1/igt@gem_mmap_gtt@hang.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-iclb7/igt@gem_mmap_gtt@hang.html
> 
>   * igt@gem_tiled_swapping@non-threaded:
>     - shard-apl:          [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-apl8/igt@gem_tiled_swapping@non-threaded.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-apl7/igt@gem_tiled_swapping@non-threaded.html
>     - shard-glk:          [PASS][7] -> [FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-glk9/igt@gem_tiled_swapping@non-threaded.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-glk9/igt@gem_tiled_swapping@non-threaded.html
>     - shard-kbl:          [PASS][9] -> [FAIL][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-kbl6/igt@gem_tiled_swapping@non-threaded.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-kbl6/igt@gem_tiled_swapping@non-threaded.html

A bunch of unrelated GEM failures.

Other than that the results look clean, so I have merged the patch.
Thanks!

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
