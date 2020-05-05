Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <158871204347.25911.18225606693945130100@emeril.freedesktop.org>
References: <20200505102702.2607265-1-chris@chris-wilson.co.uk>
 <158871204347.25911.18225606693945130100@emeril.freedesktop.org>
Subject: Re:  =?unknown-8bit?b?4pyT?= Fi.CI.IGT: success for i915/gem_ctx_exec: Exploit resource contention to verify execbuf independence (rev3)
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158871320021.927.1271550021695997419@build.alporthouse.com>
Date: Tue, 05 May 2020 22:13:20 +0100
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
To: Patchwork <patchwork@emeril.freedesktop.org>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Patchwork (2020-05-05 21:54:03)
> == Series Details ==
> 
> Series: i915/gem_ctx_exec: Exploit resource contention to verify execbuf independence (rev3)
> URL   : https://patchwork.freedesktop.org/series/76896/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8427_full -> IGTPW_4531_full
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/index.html
> 
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_8427_full and IGTPW_4531_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@gem_ctx_exec@basic-pi-active:
>     - Statuses : 5 pass(s) 2 skip(s)
>     - Exec time: [0.00, 98.22] s

Still only 9-18k contexts in 90s. A far cry from the 40k I need for the
test. Slow CI is slow. There must be some tricks we can use to avoid the
overhead.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
