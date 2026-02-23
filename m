Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8907BE909BC
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 15:44:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3375B10E3D9;
	Mon, 23 Feb 2026 15:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Mm5XEv/z";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5284E10E3D9
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 15:43:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 73A87C143C2
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 15:44:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 17D215FD59;
 Mon, 23 Feb 2026 15:43:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 10AF510369002; Mon, 23 Feb 2026 16:43:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771861435; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=zkNTTYVqjlKbjT5gKsEK8VIOjlWEXRCRXIiP0Z6tRhM=;
 b=Mm5XEv/zItq6HEMRBfGqMvD0WJMQcmGAEJYpmz0kCFua3qg7cohwPEsz9AoPKkwUCGGYzX
 ao7/Z/sBmGyUhG3g4EGAe9AqkKS7C0qe8+leFUiF690hEnaCVviTzrFt6DBMYVuUg+KP2G
 gZwle/Pp73ZWYIBhTrgFBZm87UultTqwQzVC41EJSU56JiPxxlIMWpB07BK1slT6Lh8ax4
 estRGji4IJ4b6ABvWHYz1pKiOwTpDUQde98QAbWig3+rPXGsJiBUH/qE401/ObiuROIfsM
 wwMCC+4e2IFerOEPA04UIM5hdjeEYI2v1JTAzrMs0JCa4ijyeR5+4F1UHK4poA==
Date: Mon, 23 Feb 2026 16:43:53 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v7 36/48] lib/i915/dp: Move DP-related function
 for i915 to proper folder
Message-ID: <20260223164353.3e81321b@kmaincent-XPS-13-7390>
In-Reply-To: <20260223-unigraf-integration-v7-36-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
 <20260223-unigraf-integration-v7-36-73dc9143c8c1@bootlin.com>
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

On Mon, 23 Feb 2026 13:09:43 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Some functions, prefixed with igt_ are not generic but specific to the
> i915 intel driver. To avoid confusion and allows the introduction of
> generic helpers, move those to a dedicated file.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
