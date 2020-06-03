Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317C289CAA
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2020 09:05:27 +0000 (UTC)
Date: Wed, 3 Jun 2020 12:05:24 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200603090524.GQ9497@platvala-desk.ger.corp.intel.com>
References: <20200603081532.969938-1-arkadiusz.hiler@intel.com>
 <159117483844.12268.9316466842368930671@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159117483844.12268.9316466842368930671@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgcHl0aG9u?=
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
To: igt-dev@lists.freedesktop.org, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jun 03, 2020 at 09:00:38AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: python: Stop using cElementTree
> URL   : https://patchwork.freedesktop.org/series/77944/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_5692 -> IGTPW_4642
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4642 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4642, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4642:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - fi-byt-n2820:       [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/fi-byt-n2820/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/fi-byt-n2820/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html


False positive. Lakshmi, it's the same bug as from yesterday, just put it on all platforms.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
