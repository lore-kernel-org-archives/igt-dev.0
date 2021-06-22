Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9596E139
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jun 2021 13:56:24 +0000 (UTC)
Date: Tue, 22 Jun 2021 09:56:12 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
Message-ID: <YNHr/Gl0C0+aN/u+@maud>
References: <20210622090221.1741111-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210622090221.1741111-1-boris.brezillon@collabora.com>
Subject: Re: [igt-dev] [PATCH v2 0/8] tests/panfrost: Misc fixes/improvements
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
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>, igt-dev@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Robin Murphy <robin.murphy@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>

Series is r-b me, thank you!

On Tue, Jun 22, 2021 at 11:02:13AM +0200, Boris Brezillon wrote:
> Hello,
> 
> This is a collection of fixes for the panfrost testsuite:
>  * submit tests are now passing on Bifrost
>  * the prime test is fixed to handle the case where the KMS device is
>    assigned card1
> 
> There's also an extra test to make sure we don't crash the kernel
> when closing the DRM FD while jobs are still in-flight.
> 
> Regards,
> 
> Boris
> 
> Boris Brezillon (8):
>   tests/panfrost: Make sure we open a DUMB capable node for prime tests
>   lib/panfrost: Handle the NULL case in igt_panfrost_free_bo()
>   lib/panfrost: Add a helper to create a job loop
>   lib/panfrost: Add a helper to create a NULL job
>   tests/panfrost: Simplify submit tests
>   tests/panfrost: Extend the pan-reset test
>   lib/panfrost: Get rid of igt_panfrost_trivial_job()
>   tests/panfrost: Test FD-close while jobs are still in-flight
> 
>  lib/igt_panfrost.c      | 197 ++++++++++++++++++----------------------
>  lib/igt_panfrost.h      |   5 +
>  tests/panfrost_prime.c  |  25 ++++-
>  tests/panfrost_submit.c |  99 ++++++++++----------
>  4 files changed, 162 insertions(+), 164 deletions(-)
> 
> -- 
> 2.31.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
