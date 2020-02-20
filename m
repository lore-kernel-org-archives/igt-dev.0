Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3586EDBF
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2020 15:52:28 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200220153209.210767-1-martin.peres@linux.intel.com>
In-Reply-To: <20200220153209.210767-1-martin.peres@linux.intel.com>
Message-ID: <158221394398.8112.3030544091167296957@skylake-alporthouse-com>
Date: Thu, 20 Feb 2020 15:52:24 +0000
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
> +# This test virtually never failed, yet is responsible for a relatively big
> +# execution time on some platforms:
> +#
> +# - shard-skl: 1.3% (~3 minutes)
> +# - shard-kbl: 0.3% (~0.3 minutes)
> +# - shard-apl: 0.6% (~1 minute)
> +# - shard-glk: 0.4% (50 seconds)
> +# - shard-icl: 0.1% (15 seconds)
> +# - shard-tgl: 0.1% (15 seconds)
> +#
> +# Data acquired on 2020-02-20 by Martin Peres
> +###############################################################################
> +igt@sw_sync@sync_expired_merge

Change from fixed workload to fixed runtime.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
