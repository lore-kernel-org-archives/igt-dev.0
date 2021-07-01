Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760BB6EAD5
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jul 2021 21:12:31 +0000 (UTC)
Date: Fri, 2 Jul 2021 00:12:06 +0300
From: Arkadiusz Hiler <arek@hiler.eu>
Message-ID: <20210701211206.4xq36do5wpuyda3z@hatecraft.localdomain>
References: <20210624173525.1526215-1-markyacoub@chromium.org>
 <162490511471.2574.14592936265423178724@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <162490511471.2574.14592936265423178724@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fvblank=3A_Turn_on_hardware_before_testing_invalid_vblank?=
 =?utf-8?b?LiAocmV2Nyk=?=
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

On Mon, Jun 28, 2021 at 06:31:54PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_vblank: Turn on hardware before testing invalid vblank. (rev7)
> URL   : https://patchwork.freedesktop.org/series/90382/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_6121_full -> IGTPW_5959_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_5959_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_5959_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_5959_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_vblank@invalid:
>     - shard-kbl:          [PASS][1] -> [CRASH][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl6/igt@kms_vblank@invalid.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-kbl1/igt@kms_vblank@invalid.html
>     - shard-apl:          NOTRUN -> [CRASH][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-apl2/igt@kms_vblank@invalid.html
>     - shard-iclb:         [PASS][4] -> [CRASH][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb7/igt@kms_vblank@invalid.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-iclb4/igt@kms_vblank@invalid.html
>     - shard-glk:          [PASS][6] -> [CRASH][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-glk4/igt@kms_vblank@invalid.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-glk9/igt@kms_vblank@invalid.html
>     - shard-tglb:         [PASS][8] -> [CRASH][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-tglb6/igt@kms_vblank@invalid.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/shard-tglb2/igt@kms_vblank@invalid.html

Those are legit crashes.

I've merged the change by accident and then reverted it - I've looked at
the wrong test results by accident... Sorry for the noise folks! :-(

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
