Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D93FED9E0
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 15:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0205710E6D3;
	Tue, 17 Mar 2026 15:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JSSa+wbh";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB3C10E5A9
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 15:16:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1A59D1A2DDD
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 15:16:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E44555FC9A;
 Tue, 17 Mar 2026 15:16:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 039051045060F; Tue, 17 Mar 2026 16:16:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773760569; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=EqDAX4Wk6i0ca3iU5h0uNQ7jUDTPqFLc2Zhx5y8ShwI=;
 b=JSSa+wbhexTknS5obk1lv8tBBsROGNra/+ut62DM4UkPYB2d+LrWpva3wmSh+fK5dxYlN0
 +qquc3dfKwEjNhMa0bFC/XaOg7R43pbsW01AY0MQnN4mmOWqoI6WSt5xFBuuNR2/fawK/D
 2268KIFC9+YUdDMi83KViwurKJ6TN4TAGO/omLLnTab4EHn7UCpqzt0khGghHMmACyFvi7
 zEpio+lsj4mX7eoWasPUSB2JImWwXyEd/VyKrThQZ7zFvAANIW/56mIUXi9LzCX26qLNRk
 dI1VRV4mxvAKFWsnd/008NzjNbQz2mMaQkoDsDfhYfbFSg1gODT8X0rOxHvU1Q==
Date: Tue, 17 Mar 2026 16:16:06 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v9 22/49] lib/unigraf: Introduce device configuration
Message-ID: <20260317161606.45500ee5@kmaincent-XPS-13-7390>
In-Reply-To: <20260316-unigraf-integration-v9-22-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-22-a01dffc3b0cb@bootlin.com>
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

On Mon, 16 Mar 2026 17:17:43 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> As there could be multiple devices detected by libTSI, add a configuration
> field to ensure that igt will use the proper unigraf device.
>=20
> The unigraf integration will search for a [Unigraf] entry containing a
> Device=3D
>=20
> For example, it can look like:
>=20
> [Unigraf]
> Device=3DUCD-500 [2434C620]
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
