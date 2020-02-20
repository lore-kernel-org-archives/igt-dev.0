Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0B06EDBD
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2020 15:43:13 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200220153209.210767-1-martin.peres@linux.intel.com>
In-Reply-To: <20200220153209.210767-1-martin.peres@linux.intel.com>
Message-ID: <158221338920.8112.6424522736784766890@skylake-alporthouse-com>
Date: Thu, 20 Feb 2020 15:43:09 +0000
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
> +# This test is reading one file at a time while being suspended, which makes
> +# testing extremelly slow. This is somewhat of an edge case that is unlikely
> +# to be hit, hence why it could be dropped from pre-merge testing. Here are the
> +# execution time statistics:
> +#
> +# - shard-skl: 0.5% (~1 minute)
> +# - shard-kbl: 0.1% (~2 seconds)
> +# - shard-apl: 0.1% (~2 seconds)
> +# - shard-glk: 0.1% (~2 seconds)
> +# - shard-icl: 0.6% (~1.5 minutes)
> +# - shard-tgl: 0.7% (~1.5 minutes)
> +#
> +# Data acquired on 2020-02-20 by Martin Peres
> +###############################################################################
> +igt@i915_pm_rpm@debugfs-read

You can say the debugfs-read is a developer-only feature, and it is the
sysfs-read that must be kept working. However, the danger here is that
we get random errors in other tests that would have been caught by this.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
