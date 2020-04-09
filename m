Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <158640788769.11552.9698481415078252455@emeril.freedesktop.org>
References: <20200408171344.9643-1-janusz.krzysztofik@linux.intel.com>
 <158640788769.11552.9698481415078252455@emeril.freedesktop.org>
Subject: Re: [igt-dev] =?unknown-8bit?b?4pyX?= Fi.CI.IGT: failure for tests: Add a test for device hot unplug
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158641427305.23732.3756436347597835342@build.alporthouse.com>
Date: Thu, 09 Apr 2020 07:37:53 +0100
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, Patchwork <patchwork@emeril.freedesktop.org>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Patchwork (2020-04-09 05:51:27)
> == Series Details ==
> 
> Series: tests: Add a test for device hot unplug
> URL   : https://patchwork.freedesktop.org/series/75692/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8277_full -> IGTPW_4434_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4434_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4434_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4434_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * {igt@core_hotunplug@hotunplug-lateclose} (NEW):
>     - shard-tglb:         NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-tglb8/igt@core_hotunplug@hotunplug-lateclose.html
>     - shard-apl:          NOTRUN -> [INCOMPLETE][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-apl3/igt@core_hotunplug@hotunplug-lateclose.html
>     - shard-iclb:         NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-iclb7/igt@core_hotunplug@hotunplug-lateclose.html
>     - shard-kbl:          NOTRUN -> [INCOMPLETE][4]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-kbl6/igt@core_hotunplug@hotunplug-lateclose.html

An interesting problem. If pm_runtime_get() starts throwing an error
after being unbound but before we release, we are going to find
quite a few of these during shutdown (I expect).

This is not going to get fixed until we start being told about these
problems regularly, and I think we are into the long tail of problems to
fix,
Acked-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
