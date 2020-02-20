Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABFF89DDF
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2020 15:46:10 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200220153209.210767-1-martin.peres@linux.intel.com>
In-Reply-To: <20200220153209.210767-1-martin.peres@linux.intel.com>
Message-ID: <158221356538.8112.10760355305068621449@skylake-alporthouse-com>
Date: Thu, 20 Feb 2020 15:46:05 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci: add a pre-merge blacklist to
 reduce the testing queue
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
To: Martin Peres <martin.peres@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Martin Peres (2020-02-20 15:32:09)
> +###############################################################################
> +# Modern userspace does not depend on the GTT anymore, so let's drop the
> +# slowest tests from pre-merge testing:
> +#
> +# - shard-skl: 2.7% (~6.5 minutes)
> +# - shard-kbl: 2% (~2.5 minutes)
> +# - shard-apl: 4.7% (~8.5 minutes)
> +# - shard-glk: 3.5% (~8 minutes)
> +# - shard-icl: 4.2% (~8.5 minutes)
> +# - shard-tgl: 2.5% (~4.5 minutes)
> +#
> +# Data acquired on 2020-02-20 by Martin Peres
> +###############################################################################
> +igt@gem_fence_thrash@bo-write-verify-threaded-[xy]
> +igt@gem_tiled_(wc|(|blits|fence_blits)@(normal|interruptible))

So where's the pre-merge regression testing then?
Just speed the tests up.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
