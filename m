Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435BCE8306A
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 08:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5440210E571;
	Tue,  3 Feb 2026 08:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="tF23Kn2b";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2815110E4F8
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 15:24:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 3D7B8C237F3
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 15:24:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5297B60767;
 Mon,  2 Feb 2026 15:24:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E29A6119A8888; Mon,  2 Feb 2026 16:24:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770045887; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=fTGWSGBycAM6pj50ld8LLtqXf1lj08I94pmoLXiwXvg=;
 b=tF23Kn2blpAyak7YLbu4fmMtqOyMWGS3HwI7W2M/vioprFSsOiSZybJCYvla0yWyj7I2FD
 je0eCrj2BA45oVG6vilU3136koNDAA2G2Gaw/9G/4Bpr3rzZzk7OQnpl4mcHy3rU4O7z+p
 bsHHqvMnYTc/B1TbocgSn4e9E4SSuG5VqPOkYKttJvr3qcdPASCHXHz7kWVxVpNg01dlue
 VaNuy7//v2VMv7Mlg5xTR1HQ0ukY7ge7p7LcOJ/hreWYVH29roLT3/HC4rDeQWGVLBV7sS
 4kggNyDQyyfYTPjwlPRHPW+Gb1pfjAaNzPgOQGi6Z0Xu4Lkap4wVM1E9iWtThg==
Date: Mon, 2 Feb 2026 16:24:44 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 05/48] lib/igt_kms: Add helper to wait for new
 connectors
Message-ID: <20260202162444.55f60264@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-5-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-5-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:32:44 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Add list comparison utilities and a new function to wait for new
> connectors to appear on the system.

Same as previous patch. Maybe you should use igt_list API, and the
igt_list_for_each_entry() helper to find an element inside it.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
