Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A496B898C8
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jun 2021 16:02:29 +0000 (UTC)
Date: Mon, 21 Jun 2021 12:02:20 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
Message-ID: <YNC4DGRWMwNh3e20@maud>
References: <20210621125724.1592104-1-boris.brezillon@collabora.com>
 <20210621125724.1592104-4-boris.brezillon@collabora.com>
 <YNCVh22DQoj6DHnh@maud> <20210621161814.0cd82704@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210621161814.0cd82704@collabora.com>
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

> Nope, I'm writing 0 to the next job ->exception_status field, which is
> needed if we want the loop to be effective (as soon as the GPU sees a
> job that has a non-zero exception_status it triggers an INVALID_DATA
> fault).

Ah-ha, sorry, misunderstood where out pointed. Would it be possible to
express the intent a bit more clearly, or at least add some comments
explaining what's happening? Thanks.
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
