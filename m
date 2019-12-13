Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <157623332805.23799.3291980524957636407@emeril.freedesktop.org>
References: <20191213095204.20667-1-zbigniew.kempczynski@intel.com>
 <157623332805.23799.3291980524957636407@emeril.freedesktop.org>
Message-ID: <157623395485.2219.16402732299709049393@skylake-alporthouse-com>
Date: Fri, 13 Dec 2019 10:45:54 +0000
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fdummyload=3A_Use_mapping_selection_to_allow_run_batch_from_?=
 =?utf-8?q?lmem?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Patchwork <patchwork@emeril.freedesktop.org>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Patchwork (2019-12-13 10:35:28)
> == Series Details ==
> 
> Series: lib/igt_dummyload: Use mapping selection to allow run batch from lmem
> URL   : https://patchwork.freedesktop.org/series/70872/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_5349 -> IGTPW_3860
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_3860 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_3860, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3860/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_3860:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_busy@busy-all:
>     - fi-glk-dsi:         [PASS][1] -> [FAIL][2] +1 similar issue
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5349/fi-glk-dsi/igt@gem_busy@busy-all.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3860/fi-glk-dsi/igt@gem_busy@busy-all.html

Well that's conclusive, our device-coherent mapping is not.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
