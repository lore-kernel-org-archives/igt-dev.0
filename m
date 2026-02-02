Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE73E83070
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 08:01:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40CB10E585;
	Tue,  3 Feb 2026 08:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PkLJhT9I";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25DF10E2C0
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 15:49:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8D85D1A2BF0;
 Mon,  2 Feb 2026 15:49:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5A80D60767;
 Mon,  2 Feb 2026 15:49:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8B62B119A8891; Mon,  2 Feb 2026 16:49:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770047372; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=qSloE4X4teSmspg4abEa/Y8Vyaup8Ub0PQGb8DMPVj4=;
 b=PkLJhT9IGaxketcZPxZUAsKaAOwcUN3tc1h+GIwNsz3+cjgpOBKU9R0ibxV8Y44kWPSP6y
 FIrGhR95dUeOJS0hzZgEVvwkYL+vDO8Oqstcgk1EsZIFS3ynqZP+U9Z48kbxqth34qWzoB
 9b3O+B21NmtN8jbsWQa1VYydp1OTnT8qsxau0WfbbyT222KcwRPmkuT7QSjjKIMNPbOw/i
 ZX/XM5qflYiKYZx+FmmgRuEt32ag2VMPLrbw/Vd7nSHtk+KHJGxZ0cD0Ul/f/1LstdJTER
 RRG3rfZEaoP65aCwwPGRCY4BhUE/0XlQ5b+1UmXCB7hsrjBue7DzFB4R6JnVbQ==
Date: Mon, 2 Feb 2026 16:49:30 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 09/48] lib/igt_kms: Expose connector_attr_set
 and igt_connector_attr_set
Message-ID: <20260202164930.58db2955@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-9-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-9-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:32:48 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Some debugfs helpers need to use connector attributes. Expose those helpe=
rs
> to allow using them in igt_debugfs.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
