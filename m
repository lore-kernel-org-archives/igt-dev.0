Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6106E02C
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2020 16:34:34 +0000 (UTC)
Date: Mon, 9 Mar 2020 18:34:29 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200309163429.melgoar3lng3r3ut@ahiler-desk1.fi.intel.com>
References: <1583719347-32199-1-git-send-email-kunal1.joshi@intel.com>
 <158376682727.9451.3062876816043486720@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158376682727.9451.3062876816043486720@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fchamelium=3A_Add_support_to_validate_RGB/YUV_pixel_format?=
 =?utf-8?q?s_=28rev2=29?=
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Lakshmi <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 09, 2020 at 03:13:47PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_chamelium: Add support to validate RGB/YUV pixel formats (rev2)
> URL   : https://patchwork.freedesktop.org/series/74368/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8093_full -> IGTPW_4278_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4278_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4278_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4278_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * {igt@kms_chamelium@hdmi-crc-nonplanar-formats} (NEW):
>     - shard-tglb:         NOTRUN -> [SKIP][1] +1 similar issue
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-tglb7/igt@kms_chamelium@hdmi-crc-nonplanar-formats.html

This needs some filtering adjustments - new testnames and new skips on
chamelium-less hosts.

>   * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
>     - shard-kbl:          [PASS][2] -> [INCOMPLETE][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4278/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

Unrelated to chamelium test changes = noise.
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
