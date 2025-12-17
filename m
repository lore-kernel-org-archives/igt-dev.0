Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82705D65C6C
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 15:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A04B10EBD7;
	Wed, 17 Dec 2025 15:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eTqIImrv";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884CA10EBD7
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 15:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765985922;
 bh=WAPjHDwyjYraBcqxwx6TnW6MdkFt9+I7e8p++JipAKM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eTqIImrvgeCBDJvlvEYpabaSYpshRei5IanJGBxgWQ6qNnlJH9Htdc3+qiIsuBwyX
 +K4JorNhGaPgURA263qY01fB0Y9xiuKhO3CVia9uGwGsoexs9vA0+GL28SE+5+PELZ
 hgspdaGpM1BEVOdX2Byg4P4s8zx8RoQh9g5Qh98MnaqWgidwha6Bk70edB+gj8uzA0
 F1RnVzKwqaWui94dK9a5U07+2mOVmYWAb2iD3I+Jf82IyrTho22fU92CU4Vy7OIQY1
 4NKHB64b7q6lxZOcW0/lAnjlklMTzypLhdMwlLeBFMFRvVZicxnoRARIHC5Yb6si6t
 2328eaPXxc5rw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A940617E13C3;
 Wed, 17 Dec 2025 16:38:41 +0100 (CET)
Date: Wed, 17 Dec 2025 16:38:36 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Steven Price <steven.price@arm.com>, Liviu
 Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH i-g-t v2 3/3] tests/panthor: Add scheduler tests
Message-ID: <20251217163836.0d0cfd0f@fedora>
In-Reply-To: <ED0823EA-DE53-40F5-BA9D-00BC407CCB1C@collabora.com>
References: <20251128093858.3844420-1-boris.brezillon@collabora.com>
 <20251128093858.3844420-4-boris.brezillon@collabora.com>
 <ED0823EA-DE53-40F5-BA9D-00BC407CCB1C@collabora.com>
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

On Wed, 3 Dec 2025 16:31:59 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

[...]
> > diff --git a/tests/panthor/panthor_sched.c b/tests/panthor/panthor_sched.c
> > new file mode 100644
> > index 000000000000..7cded16c0acd
> > --- /dev/null
> > +++ b/tests/panthor/panthor_sched.c
> > @@ -0,0 +1,338 @@
> > +// SPDX-License-Identifier: MIT
> > +// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
> > +
> > +#include <stdint.h>
> > +#include <sys/mman.h>
> > +#include <unistd.h>
> > +
> > +#include "drm.h"
> > +#include "igt.h"
> > +#include "igt_core.h"
> > +#include "igt_panthor.h"
> > +#include "panthor_drm.h"
> > +
> > +static size_t
> > +infinite_incr_loop(uint64_t *cs, uint64_t counter_va)
> > +{
> > + const uint8_t counter_va_reg = 68;
> > + const uint8_t val_reg = 70;
> > + uint64_t instrs[] = {
> > + /* Load the source register ([r68; r69]) with the kernel address */
> > + cs_mov48(counter_va_reg, counter_va),
> > + /* Load a 0 into r70 */  
> 
> Load a 1

Oops, will fix the comment.

> 
> > + cs_mov48(val_reg, 1),
> > + /* STORE_MULTIPLE: Store the first register to the address pointed to by
> > + * [r68; r69]
> > + */
> > + cs_stm64(counter_va_reg, val_reg, 0),
> > + cs_wait(1, false),  
> 
> Wait for what? All of these seem to be synchronous instructions?

Nope, load/store instructions are asynchronous, you need to wait for
the SB assigned to "other-asynchronous-ops" (defaults to zero) for the
mem operation to be effective.

> 
> > + cs_add64(1, val_reg, val_reg),
> > + cs_branch(-4, CS_BRANCH_COND_ALWAYS, 0),
> > + };

> 
> This looks good, but I tried it and this is the result:

If you're not testing with drm-misc-next, that's normal. Those tests
are added to make sure we don't regress those scheduling cases again.
