Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70136EDBD
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2020 15:40:02 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200220153209.210767-1-martin.peres@linux.intel.com>
In-Reply-To: <20200220153209.210767-1-martin.peres@linux.intel.com>
Message-ID: <158221319769.8112.15480336681552924725@skylake-alporthouse-com>
Date: Thu, 20 Feb 2020 15:39:57 +0000
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
> +# These 8 tests are responsible for a significant portion of our execution time
> +# despite them testing a feature which is only found in older userspaces:
> +#
> +# - shard-skl: 0.1% (~15 seconds)
> +# - shard-kbl: 3.5% (~4.5 minutes)
> +# - shard-apl: 10% (~18 minutes)
> +# - shard-glk: 6.3% (~14 minutes)
> +# - shard-icl: 1.7% (~3.5 minutes)
> +# - shard-tgl: 1.6% (~3 minutes)
> +#
> +# Data acquired on 2020-02-19 by Martin Peres
> +###############################################################################
> +igt@gem_pwrite@big-.*

That is not true. They are testing the obj->mm.get_page cache which is
used for all page lookups in the driver.

It's harder to predictably exercise from userspace through other
interfaces.

So replace with a unittest for the cache :-p
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
