Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9B289F55
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2020 15:00:34 +0000 (UTC)
Date: Mon, 20 Jul 2020 18:00:31 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200720150031.5ljy2nigelzboind@ahiler-desk1.fi.intel.com>
References: <20200720114856.31432-1-mohammed.khajapasha@intel.com>
 <159525525448.13117.8952978507934809330@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159525525448.13117.8952978507934809330@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSAgZm9yIGxpYi9p?=
 =?utf-8?q?gt=5Fkms=3A_Add_support_for_display_with_=28rev9=29?=
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
Cc: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jul 20, 2020 at 02:27:34PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_kms: Add support for display with (rev9)
> URL   : https://patchwork.freedesktop.org/series/78482/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8766_full -> IGTPW_4779_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4779_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4779_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4779_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_legacy@all-pipes-torture-move:
>     - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-hsw6/igt@kms_cursor_legacy@all-pipes-torture-move.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-hsw1/igt@kms_cursor_legacy@all-pipes-torture-move.html
> 
>   * igt@kms_lease@simple_lease:
>     - shard-iclb:         [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-iclb2/igt@kms_lease@simple_lease.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-iclb5/igt@kms_lease@simple_lease.html
>     - shard-glk:          [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-glk4/igt@kms_lease@simple_lease.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-glk2/igt@kms_lease@simple_lease.html
>     - shard-hsw:          [PASS][7] -> [FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-hsw8/igt@kms_lease@simple_lease.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-hsw6/igt@kms_lease@simple_lease.html
>     - shard-kbl:          [PASS][9] -> [FAIL][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-kbl2/igt@kms_lease@simple_lease.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-kbl3/igt@kms_lease@simple_lease.html
>     - shard-snb:          [PASS][11] -> [FAIL][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-snb6/igt@kms_lease@simple_lease.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-snb5/igt@kms_lease@simple_lease.html
>     - shard-tglb:         [PASS][13] -> [FAIL][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8766/shard-tglb6/igt@kms_lease@simple_lease.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4779/shard-tglb1/igt@kms_lease@simple_lease.html

Looks like something happened to patch 11 and it now changes kms_cursor
only. kms_lease (and other tests) are still calling
igt_wait_for_vblank() with pipe instead of crtc_offset. It looked okay
in the previous revision.

current rev:  https://patchwork.freedesktop.org/patch/378118/
previous rev: https://patchwork.freedesktop.org/patch/377860/

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
