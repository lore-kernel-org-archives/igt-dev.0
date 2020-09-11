Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE446EA7D
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2020 14:23:03 +0000 (UTC)
Date: Fri, 11 Sep 2020 17:18:39 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200911141839.GQ7444@platvala-desk.ger.corp.intel.com>
References: <20200911103039.4574-1-janusz.krzysztofik@linux.intel.com>
 <159982345877.14124.12858867808073643131@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159982345877.14124.12858867808073643131@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?core=5Fhotunplug=3A_Fixes_and_enhancements_=28rev6=29?=
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

On Fri, Sep 11, 2020 at 11:24:18AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/core_hotunplug: Fixes and enhancements (rev6)
> URL   : https://patchwork.freedesktop.org/series/79671/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8998 -> IGTPW_4974
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4974/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4974:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * {igt@core_hotunplug@unbind-rebind} (NEW):
>     - fi-hsw-4770:        NOTRUN -> [WARN][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4974/fi-hsw-4770/igt@core_hotunplug@unbind-rebind.html
>     - fi-bdw-5557u:       NOTRUN -> [WARN][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4974/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_8998 and IGTPW_4974:
> 
> ### New IGT tests (1) ###
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - Statuses : 4 dmesg-warn(s) 29 pass(s) 2 warn(s)
>     - Exec time: [0.38, 4.94] s


2 warns from the workaround, those dmesg-warns are existing issues.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
