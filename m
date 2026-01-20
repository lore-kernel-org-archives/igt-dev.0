Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF645D2629E
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 21:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6687810E664;
	Tue, 20 Jan 2026 21:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="W979FQgW";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D1710E664
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 21:10:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 71953C214DF
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 21:10:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 96A66606AB;
 Tue, 20 Jan 2026 21:10:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 19D8F119B0E3A; Tue, 20 Jan 2026 22:10:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768943450; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=SYxUGOJBOKBgWuKiIlNEwfd9dGx5WyraaVZdJxnDCmo=;
 b=W979FQgWdgkLSXbjiX52vl3lI7+onHSX9Tb7WcZK5hnTVo7JqXLQGuwxe7FJDH/uE8sXHa
 Gt1PyAXpUyoh7HMAMXRzALqReK2SfttjIH59WoiiklcSFrWwIuTW+gLL8bJrnsZvI5aDUE
 x9LQzRTXOMXb2QpFLxX98cULdzJ+3o9A1nuihSqYIKVoikxR5+Z+GDp3BCVtSp7/GxcsQv
 KyGfgO4tBoWmudT69xYCj8+Qur0/gxJRjLZRFu5NdeukLyH0QUtoB3zOlS5CfAsqMJjJF8
 FnY5Sv2f7d4YY+E4/dMB676+w6JkqnhP98FeLwOhOmSPzkfRwwKnskjgwKUGMQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 22:10:48 +0100
Message-Id: <DFTQ49PABBAU.3NZACDW7MW8XR@bootlin.com>
Subject: Re: [PATCH i-g-t v4 10/46] lib/igt_debugfs: Move debugfs helpers to
 the proper location
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-10-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-10-0fc7bb1b4101@bootlin.com>
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
> igt_debugfs_read_connector_file and igt_debugfs_write_connector_file are
> debugfs related helpers. To avoid mixing everything in igt_kms, move them
> to igt_debugfs.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
