Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9CC46E413
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Mar 2021 23:41:54 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20210302225334.361966-3-alan.previn.teres.alexis@intel.com>
References: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
 <20210302225334.361966-3-alan.previn.teres.alexis@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 03 Mar 2021 23:41:50 +0000
Message-ID: <161481491026.25897.13137851056108749856@build.alporthouse.com>
Subject: Re: [igt-dev] [RFC i-g-t 02/11] Add basic PXP testing of buffer and
 context alloc
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
To: Alan Previn <alan.previn.teres.alexis@intel.com>, igt-dev@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Alan Previn (2021-03-02 22:53:25)
> Test PXP capability support as well as the allocation of protected
> buffers and protected contexts.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  tests/Makefile.sources |   3 +
>  tests/i915/i915_pxp.c  | 410 +++++++++++++++++++++++++++++++++++++++++

This is a GEM interface so gem_ctx_pxp or gem_exec_pxp, with gem_pxp as
a final if either the other two don't fit.

(Now when we move to i915/i915_gem_foo.c is another question).
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
