Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C336E118
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jun 2021 13:35:14 +0000 (UTC)
Date: Mon, 21 Jun 2021 09:35:03 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
Message-ID: <YNCVh22DQoj6DHnh@maud>
References: <20210621125724.1592104-1-boris.brezillon@collabora.com>
 <20210621125724.1592104-4-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210621125724.1592104-4-boris.brezillon@collabora.com>
Subject: Re: [igt-dev] [PATCH 3/7] lib/panfrost: Add a helper to create a
 job loop
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>, igt-dev@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Robin Murphy <robin.murphy@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>

I don't see how this test works.

> +        struct mali_payload_set_value payload = {
> +                .unknown = 3,
> +        };

0x3 is the selector for "zero".

> +        payload.out = header.next_job_64 = submit->submit_bo->offset + ALIGN(sizeof(header) + sizeof(payload), 64);

So you are writing 0 to the next_job_64 field, which ends the job chain
prematurely.

Perhaps you meant to use an "immediate 64" selector to write the address
to jump to? If so, that will be Bifrost only, since the "immediate 64"
selector is new in Midgard. 

Upon a second reading, maybe the idea is to ping-pong the jobs
statically? I.e. two jobs that have next_job pointed to one another,
a job barrier and prefetching disabled, with the content irrelevant. If
so, the `out` value can be the same for both and allocate upfront with
the payload so the logic is clearer. Even better, I think you could use
NULL jobs for the same purpose.
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
