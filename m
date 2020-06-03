Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3AC89B45
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2020 11:29:10 +0000 (UTC)
Date: Wed, 3 Jun 2020 14:29:06 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200603112906.o6rd3364dqp7u5fg@ahiler-desk1.fi.intel.com>
References: <20200603081532.969938-1-arkadiusz.hiler@intel.com>
 <159118347009.12266.12631398149057518983@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159118347009.12266.12631398149057518983@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgcHl0aG9u?=
 =?utf-8?q?=3A_Stop_using_cElementTree?=
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

On Wed, Jun 03, 2020 at 11:24:30AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: python: Stop using cElementTree
> URL   : https://patchwork.freedesktop.org/series/77944/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_5692_full -> IGTPW_4642_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4642_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4642_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4642_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_workarounds@suspend-resume-context:
>     - shard-snb:          [PASS][1] -> [TIMEOUT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-snb5/igt@gem_workarounds@suspend-resume-context.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-snb2/igt@gem_workarounds@suspend-resume-context.html
> 
>   * igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge:
>     - shard-tglb:         [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-tglb1/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-tglb7/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html

Heya Lakshmi,

Just a heads up that those are false positives. The patch was changeing
only some python bits that are completetly unrelated to those tests.

No need for rereporting :-)

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
