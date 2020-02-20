Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A7E6EDBF
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2020 15:58:49 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200220153209.210767-1-martin.peres@linux.intel.com>
In-Reply-To: <20200220153209.210767-1-martin.peres@linux.intel.com>
Message-ID: <158221432442.8112.437409528288193655@skylake-alporthouse-com>
Date: Thu, 20 Feb 2020 15:58:44 +0000
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
> +# These 2 tests are stressing the re-usability of objects. It does not look
> +# like we have had issues with this outside of the gen7 ppgtt issue, which
> +# does not counterbalance its overall execution time.
> +#
> +# - shard-skl: 2% (~5 minutes)
> +# - shard-kbl: 1% (~1.5 minutes)
> +# - shard-apl: 1.7% (~3 minutes)
> +# - shard-glk: 1% (2.5 minutes)
> +# - shard-icl: 0.5% (1 minute)
> +# - shard-tgl: 0.5% (1 minute)
> +#
> +# Data acquired on 2020-02-20 by Martin Peres
> +###############################################################################
> +igt@gem_exec_reuse@(baggage|contexts)

File a bug; there's no reason why this should be greatly exceeding it's
5s runtime. So presumably we waste too much time in the setup/teardown.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
