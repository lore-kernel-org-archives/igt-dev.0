Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2612E6EDBD
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2020 15:44:47 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200220153209.210767-1-martin.peres@linux.intel.com>
In-Reply-To: <20200220153209.210767-1-martin.peres@linux.intel.com>
Message-ID: <158221348330.8112.1847874725528060647@skylake-alporthouse-com>
Date: Thu, 20 Feb 2020 15:44:43 +0000
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
> +# Perf tests are for people using performance counters to get details about
> +# how the execution is performed (Observability Architecture). As such, the
> +# audience is very limited (game developers, driver developers), and it does
> +# not justify the overall execution time:
> +#
> +# - shard-skl: 0%
> +# - shard-kbl: 0%
> +# - shard-apl: 0%
> +# - shard-glk: 0%
> +# - shard-icl: 0%
> +# - shard-tgl: 1.7% (~3.5 minutes)
> +#
> +# Data acquired on 2020-02-20 by Martin Peres
> +###############################################################################
> +igt@perf@gen12-mi-rpc

Nak. That is just a straightforward BUG. The test is doing it's job in
reporting the interface is snafu. Then the test screws up by deadlocking
due to unclean exit handling after detecting the error.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
