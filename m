Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45C06EC45
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2020 11:36:36 +0000 (UTC)
Date: Thu, 16 Jul 2020 14:36:32 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200716113632.52a3c52t2xeixwa5@ahiler-desk1.fi.intel.com>
References: <cover.1594831260.git.melissa.srw@gmail.com>
 <159485064607.3438.12309038160617224383@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159485064607.3438.12309038160617224383@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbWlub3Ig?=
 =?utf-8?q?improvements_to_the_kms=5Fcursor=5Fcrc_doc_and_some_comments_cl?=
 =?utf-8?q?eanup_=28rev2=29?=
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

On Wed, Jul 15, 2020 at 10:04:06PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: minor improvements to the kms_cursor_crc doc and some comments cleanup (rev2)
> URL   : https://patchwork.freedesktop.org/series/78814/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8751_full -> IGTPW_4766_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4766_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4766_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4766/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4766_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
>     - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8751/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4766/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

Hey Lakshmi,

this is a false positive. No need to re-report though.


@Melissa, your patches are
Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
and merged.

I've also done some formatting changes:
 1. indented multiline descriptions so the opening quotes align
 2. got rid of "\", as they are not needed for multilne strings and we
    don't use it elsewhere

This is to mimic the style used in other tests, e.g.:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_hdmi_inject.c#L209

Thanks for your contributions!

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
