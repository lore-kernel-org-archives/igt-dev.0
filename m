Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FF4D262A2
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 21:11:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF1B10E664;
	Tue, 20 Jan 2026 21:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GiBkVuYV";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F8710E664;
 Tue, 20 Jan 2026 21:11:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 721D8C214DF;
 Tue, 20 Jan 2026 21:11:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 958CF606AB;
 Tue, 20 Jan 2026 21:11:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6D3B2119B0198; Tue, 20 Jan 2026 22:11:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768943499; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=IaO/SsWDDinXRZsImGIomDijZ7VyqacWXVQ3GURltIU=;
 b=GiBkVuYVG7nw/QknyVrmol4inHTMm+hkzjEveeS2MqEDmGlIVr5aaarARzhtgutp1lgd5E
 lovc2AxuQQlRkexVXQHu/2lhY9qdEEKREkzM9cIP3EHtjXOxVn7JRI7vobDjzhycpPx4Dq
 ncONyAvZIMuahMZ9xYaczhzj8WGir0uiY3sz6r5aMHjjSs8csbPpNcuDQebVBKOL6jhxTB
 t1OqrG2ZMb3uWcEjWjaHVMiz0yzih/IyNdJ+rsQBihGftXEKrlvLafrC1BghfkVAsau2eO
 RzuYBa+8AQ1C8vG3XB/NHV4tp3M+d9ocH+kxQZ81zukmq/Ax9+PUtc8sfu9uZg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 22:11:38 +0100
Message-Id: <DFTQ4WCIJU6R.3JR7NR04X78DL@bootlin.com>
Subject: Re: [PATCH i-g-t v4 16/46] lib/monitor_edids: Add helper to print
 all available EDID names
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-16-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-16-0fc7bb1b4101@bootlin.com>
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

On Mon Nov 10, 2025 at 2:39 PM CET, Louis Chauvet wrote:
> During the unigraf configuration, it may be required to know the list
> of supported EDID names, so add an helper to print them.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
