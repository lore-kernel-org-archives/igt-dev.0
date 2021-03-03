Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442016E422
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Mar 2021 23:55:39 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20210302225334.361966-7-alan.previn.teres.alexis@intel.com>
References: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
 <20210302225334.361966-7-alan.previn.teres.alexis@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 03 Mar 2021 23:55:35 +0000
Message-ID: <161481573538.25897.8547702645218540211@build.alporthouse.com>
Subject: Re: [igt-dev] [RFC i-g-t 06/11] Enable protected session and
 protected buffers in rendercopy
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

Quoting Alan Previn (2021-03-02 22:53:29)
> 1. In _gen9_render_op, check if the incoming batchbuffer
>    was marked with pxp enabled. If so, insert MI_SET_APPID
>    along with PIPE_CONTROL instructions at the start and
>    end of the rendering operation in the command buffer.
> 
> 2. The two PIPE_CONTROLs will enable protected memory
>    at the start of the batch and disabling protected
>    memory at the end of it. These PIPE_CONTROLs require a
>    Post-Sync operation with a write to memory.
> 
> 3. In order to satisfy #2, _gen9_render_op shall
>    allocate and pin a bo that is referenced by the
>    PIPE_CONTROL PostSync write to memory.

Or, just have the caller do 1-3 once for its protected context.
Call it something like intel_bb_enable_pxp(), intel_bb_set_pxp if it
should be reversible.

> +       if (ibb->pxp.enabled) {
> +               gem_sync(ibb->i915, fenceb.handle);

No implicit syncs, ever. That will hide too may issues.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
