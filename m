Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA7BE83062
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 08:01:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AA310E56A;
	Tue,  3 Feb 2026 08:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZRs0f3dm";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B8710E2C7
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 15:50:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id F05614E423CA;
 Mon,  2 Feb 2026 15:50:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BFAAC60767;
 Mon,  2 Feb 2026 15:50:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 255FD119A8888; Mon,  2 Feb 2026 16:50:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770047447; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=K3jTfWbDPmANG2fVPFvnPVBUPu2+F1qZIZjZpzolUwk=;
 b=ZRs0f3dmKanKnhk+ZnMGpbpXFNaZxjS0HkMXRMec7geIT4GlwYZonJcImxEsPEco5TWcjB
 m12w71Fh7OA6S2ZvBxdoH9nYoFNmD7ZaWxMc7Jy5ay91a5B9uXkzMNpXR7R48MckOO1+a4
 YcCHEmYq3hpXUmsiWffs2RtNjN1f0zZtMx36AQgwePQhCons5h33TydtyUmeNwoDqYUKFw
 Qm+kTy1peNvj/366LlkdBoFGu+DoGuYgaOWNpUI4rn7Re9Q0ADFdVAAnkN2e5V7/SkmQCj
 63aEIytKiwMNF1rFW1IKetELAhhv+L7HCd76tCc3eSIFv+FfzxzEMgakd8JYPQ==
Date: Mon, 2 Feb 2026 16:50:45 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 10/48] lib/igt_debugfs: Move debugfs helpers to
 the proper location
Message-ID: <20260202165045.7cb0d53d@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-10-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-10-834af822eee7@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Tue, 03 Feb 2026 08:01:01 +0000
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

On Mon, 02 Feb 2026 15:32:49 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> igt_debugfs_read_connector_file and igt_debugfs_write_connector_file are
> debugfs related helpers. To avoid mixing everything in igt_kms, move them
> to igt_debugfs.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
