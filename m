Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24F06E17D
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jun 2021 14:18:19 +0000 (UTC)
Date: Mon, 21 Jun 2021 16:18:14 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
Message-ID: <20210621161814.0cd82704@collabora.com>
In-Reply-To: <YNCVh22DQoj6DHnh@maud>
References: <20210621125724.1592104-1-boris.brezillon@collabora.com>
 <20210621125724.1592104-4-boris.brezillon@collabora.com>
 <YNCVh22DQoj6DHnh@maud>
MIME-Version: 1.0
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
To: Alyssa Rosenzweig <alyssa@collabora.com>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>, igt-dev@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Robin Murphy <robin.murphy@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 21 Jun 2021 09:35:03 -0400
Alyssa Rosenzweig <alyssa@collabora.com> wrote:

> I don't see how this test works.
> 
> > +        struct mali_payload_set_value payload = {
> > +                .unknown = 3,
> > +        };  
> 
> 0x3 is the selector for "zero".

Yep.

> 
> > +        payload.out = header.next_job_64 = submit->submit_bo->offset + ALIGN(sizeof(header) + sizeof(payload), 64);  
> 
> So you are writing 0 to the next_job_64 field, which ends the job chain
> prematurely.

Nope, I'm writing 0 to the next job ->exception_status field, which is
needed if we want the loop to be effective (as soon as the GPU sees a
job that has a non-zero exception_status it triggers an INVALID_DATA
fault).

> 
> Perhaps you meant to use an "immediate 64" selector to write the address
> to jump to? If so, that will be Bifrost only, since the "immediate 64"
> selector is new in Midgard. 

I really want to write a zero here.

> 
> Upon a second reading, maybe the idea is to ping-pong the jobs
> statically? I.e. two jobs that have next_job pointed to one another,
> a job barrier and prefetching disabled, with the content irrelevant. If
> so, the `out` value can be the same for both and allocate upfront with
> the payload so the logic is clearer.

If I'm correct, ->out is the address the WRITE_VALUE job writes to, so
with 2 jobs, I really have to pass 2 different addresses there,
otherwise one job won't have its exception_status field reset to 0.
This being said, I wonder if I really need 2 jobs here. I'll try with a
single job pointing to himself and writing 0 to its exception_status
field.


> Even better, I think you could use
> NULL jobs for the same purpose.

NULL jobs won't work, I really need to reset the exception_status,
otherwise it triggers an INVALID_DATA fault.
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
