Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1FDD262A2
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 21:11:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C7310E66A;
	Tue, 20 Jan 2026 21:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="W6J6DCzW";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C3E10E66A;
 Tue, 20 Jan 2026 21:11:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B0485C214FD;
 Tue, 20 Jan 2026 21:10:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D6068606AB;
 Tue, 20 Jan 2026 21:11:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6E461119B0198; Tue, 20 Jan 2026 22:11:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768943486; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=bwvwToik1iwrQ+fWX7dDizVOAfMjKsafoT5fTvcahKw=;
 b=W6J6DCzWj9aN9tA5noI1YZ95gYdw1REGuafuFocZl69zjP7YVyCn5LWeKGst+m37RQayqq
 6xoTqzD+lZIarcpdJF/YqHFGbER80AbUor1WAn6qfXgGl62oA6A5/GWflaZzjv5iKjWMF1
 F/DPtLeN3YVGtVu3R75KcA+vBVzbp7IiVmWWOvMquRnm8KnYthJ9fW0jzSeUnxbaP2YuhY
 qI77amtsM0bUUBvXVN7dvDz9jJGjjaaAir2/dbiPEs1q5rN2ecVl+KV12sW+83qwgbyL7h
 U2iTjsVDH+ilIq/ZZz86WfgW5rr0wERHEQqVQ1OqBD/Sm2xMM66QztLexFDWtw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 22:11:25 +0100
Message-Id: <DFTQ4QEG4AXG.3SXDYSYO6HXJ1@bootlin.com>
Subject: Re: [PATCH i-g-t v4 14/46] lib/monitor_edids: Add helper functions
 for using monitor_edid objects
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-14-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-14-0fc7bb1b4101@bootlin.com>
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
> Introduce the functions edid_from_monitor_edid() and
> get_edids_for_connector_type(). The former converts a monitor_edid object
> to a struct edid, which can then be utilized by igt_kms helpers. The
> latter returns a list of monitor_edid objects for a specific connector
> with certain characteristics
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
