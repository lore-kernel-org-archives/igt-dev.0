Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73B16EDBD
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2020 15:50:08 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200220153209.210767-1-martin.peres@linux.intel.com>
In-Reply-To: <20200220153209.210767-1-martin.peres@linux.intel.com>
Message-ID: <158221380406.8112.18309601206905414674@skylake-alporthouse-com>
Date: Thu, 20 Feb 2020 15:50:04 +0000
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
> +# This tests modesetting-vs-wedged which is a useful thing to check, but it
> +# seems like it mostly catches unrelated issues which are better caught by
> +# other tests.
> +#
> +# - shard-skl: 0.5% (~1 minute)
> +# - shard-kbl: 1% (~1 minute)
> +# - shard-apl: 0.6% (~1 minute)
> +# - shard-glk: 0.5% (~1 minute)
> +# - shard-icl: 0.6% (~1.5 minutes)
> +# - shard-tgl: 0.7% (~1.5 minutes)
> +#
> +# Data acquired on 2020-02-20 by Martin Peres
> +###############################################################################
> +igt@gem_eio@kms

Hah. It caught novel issues, which have not been split out into separate
regression tests.

Making sure kms is robust is not a bad thing; you can easily speed this
up by reducing the workload.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
