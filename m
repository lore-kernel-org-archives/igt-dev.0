Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7869D6E444
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Mar 2021 00:01:49 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20210302225334.361966-12-alan.previn.teres.alexis@intel.com>
References: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
 <20210302225334.361966-12-alan.previn.teres.alexis@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 04 Mar 2021 00:01:45 +0000
Message-ID: <161481610561.25897.7563382201944642465@build.alporthouse.com>
Subject: Re: [igt-dev] [RFC i-g-t 11/11] Verify gem_execbuf fails with stale
 PXP buffer after teardown
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

Quoting Alan Previn (2021-03-02 22:53:34)
> Add a subtest to verify that reusing a stale protected buffer
> with a fresh protected context, in a gem_execbuff after a
> teardown (triggered by suspend-resume cycle) shall fail
> with -EIO error.

I'm used to having a rationale as to why that is the uABI. We can read
the code, but not the why.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
