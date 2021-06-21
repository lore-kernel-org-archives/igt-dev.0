Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 83C056E160
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jun 2021 14:09:31 +0000 (UTC)
References: <20210621125724.1592104-1-boris.brezillon@collabora.com>
 <20210621125724.1592104-4-boris.brezillon@collabora.com>
 <YNCVh22DQoj6DHnh@maud>
From: Steven Price <steven.price@arm.com>
Message-ID: <7e6257fc-a29a-c0d1-58c8-da518a127861@arm.com>
Date: Mon, 21 Jun 2021 15:09:28 +0100
MIME-Version: 1.0
In-Reply-To: <YNCVh22DQoj6DHnh@maud>
Content-Language: en-GB
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
To: Alyssa Rosenzweig <alyssa@collabora.com>, Boris Brezillon <boris.brezillon@collabora.com>
Cc: igt-dev@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 21/06/2021 14:35, Alyssa Rosenzweig wrote:
> I don't see how this test works.
> 
>> +        struct mali_payload_set_value payload = {
>> +                .unknown = 3,
>> +        };
> 
> 0x3 is the selector for "zero".
> 
>> +        payload.out = header.next_job_64 = submit->submit_bo->offset + ALIGN(sizeof(header) + sizeof(payload), 64);
> 
> So you are writing 0 to the next_job_64 field, which ends the job chain
> prematurely.
> 
> Perhaps you meant to use an "immediate 64" selector to write the address
> to jump to? If so, that will be Bifrost only, since the "immediate 64"
> selector is new in Midgard. 
> 
> Upon a second reading, maybe the idea is to ping-pong the jobs
> statically? I.e. two jobs that have next_job pointed to one another,
> a job barrier and prefetching disabled, with the content irrelevant. If
> so, the `out` value can be the same for both and allocate upfront with
> the payload so the logic is clearer. Even better, I think you could use
> NULL jobs for the same purpose.
> 

I think this is overwriting the status field on the next job. The
hardware checks that job header to make sure the status field is zero
before executing (precisely to avoid such a loop happening by accident).
So two (or more) jobs where the next-job pointers are in a loop works as
long as you clear the status fields.

As a side-note: this is very much in the not-really-supported area of
the hardware. The architecture doesn't prevent the GPU from reading
ahead in the job chain and rejecting a job before the write-value
happens. But AFAIK this does work on existing GPUs.

Steve
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
