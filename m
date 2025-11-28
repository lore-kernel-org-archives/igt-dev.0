Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E86CFD376
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 09:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0CA810E04A;
	Fri, 28 Nov 2025 09:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bQVktkHk";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA41910E761
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 09:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764322795;
 bh=HJuQ9cqhg1yISJT06NI1HQFYVpRWKzaeKAm4wSthYMo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bQVktkHkKrF99QN7szgxifr9lUCSr8GWSZ09GOqXpBYdUf6UBIaB8lTDHt+iythh4
 2JVh1HJhfvIgLer9BuSw/qmzDFaVBZgOJPN+W1eAuTTRnBhlOPyXnNCtxW3PFpNe7o
 cmWN4JW3i+lVez2hYScuhRdLgnru1VAmFsh2E4EA9dz9hI5AKoQXbI7/YiKleN2v6+
 eEpdH5UdUFznYN3fsVbc6NMWoEbsqhbPMQGW2FhwWlyFrUYAq+X56zaItZ2vrBQBSz
 rl3+uXU/Gr2uJECI3k7UUTdKRncYrywb9a61sT9LoP3/cOUuAqSTnEzqjhO0xps8iO
 aZhPXcJC3NIPA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BC97317E107C;
 Fri, 28 Nov 2025 10:39:54 +0100 (CET)
Date: Fri, 28 Nov 2025 10:39:46 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Steven Price <steven.price@arm.com>, Liviu
 Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH i-g-t v1 v1 1/3] drm-uapi/panthor: Sync panthor uapi
Message-ID: <20251128103946.1849dfd0@fedora>
In-Reply-To: <20251127145641.wba63sp4h3pjs5gh@kamilkon-DESK.igk.intel.com>
References: <20251126105558.3607460-1-boris.brezillon@collabora.com>
 <20251126105558.3607460-2-boris.brezillon@collabora.com>
 <20251127145641.wba63sp4h3pjs5gh@kamilkon-DESK.igk.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Thu, 27 Nov 2025 15:56:41 +0100
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi Boris,
> On 2025-11-26 at 11:55:56 +0100, Boris Brezillon wrote:
> > Will be needed for the scheduler tests.  
> 
> Rather than that just describe to which kernel commit you sync,
> for example look into commit 909157f3cc3c0676a4f896752276d438c3ec3959
> ("include/drm-uapi: Update uapi headers")
>         
> You could use for example:
> 
> Sync with drm-next kernel commit 3b1dc21d6d80 ("drm/panthor: Add
> support for Mali-Gx15 family of GPUs")
> 
> No need for resend unless you will send v2.
> 
> With above fixed this is
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

I fixed it since there were things to address on patch 3 anyway.
