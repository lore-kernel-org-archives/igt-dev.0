Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450A2EE20B0
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 15:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C1C10E0D2;
	Fri,  6 Feb 2026 15:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CsQqN/C7";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A9210E0D2
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 15:12:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4E1F1C250C6;
 Fri,  6 Feb 2026 15:12:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B343360729;
 Fri,  6 Feb 2026 15:12:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2F591119D1FA6; Fri,  6 Feb 2026 16:12:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770390767; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=n0eh2e9biiKXbcoTGvBbIONczgZBw6zbnGkyj4ktl0A=;
 b=CsQqN/C7+IV17jnfYaKGyq0uE3OXy0Ecj0AGwpS8fc/WhOT7FoNW2vpAmqobyUO4zdioSA
 uhMYabr1UnkDzM1A9D+bebo+oFJ8GNlm/UWZg02UtTpEDs4Hr3V39rQhVq4plTx/4oE8/r
 ExEZ96RzrzAWBEC7EoxJ8GJ56ABTrJ8ssk2uyDHLzoHMBZfsPZPsDoBWc3OAgRw3HjuDXX
 cIco52ZAqa58nrElQVC1a4+cuALrj5uQWAuOawYW6EQwgI6xddKAWmNFoJ8qR7iY6YNvSn
 iZD4PGxPlB8dLT0JWqU5ZZ+2C9+/5JL7keeQA9HZ+nH4HDLni0W3frwgW3RJng==
Date: Fri, 6 Feb 2026 16:12:45 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 39/48] lib/i915/dp: Properly check sscanf results
Message-ID: <20260206161245.42f309f9@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-39-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-39-834af822eee7@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
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

On Mon, 02 Feb 2026 15:33:18 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Current sscanf usage can fail silently, add assert to ensure that the
> returned value is correct.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
