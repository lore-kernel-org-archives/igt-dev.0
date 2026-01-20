Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC18D262A2
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 21:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97A310E077;
	Tue, 20 Jan 2026 21:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PHgxqWaT";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AB010E64E
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 21:09:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C6F96C214FC;
 Tue, 20 Jan 2026 21:09:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E3356606AB;
 Tue, 20 Jan 2026 21:09:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E16A4119B0E2B; Tue, 20 Jan 2026 22:09:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768943380; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=B0gPZ3Jf1RCYBMKXkbU6gQ2I2WYR2EeOQvs8G9bKnoQ=;
 b=PHgxqWaTWJryOTIfzf/TXrPoQWOzXdetazCPyovBN+9TJKM0Rg17mO07/7Kz782dRPXPN7
 TbiO9vP1M7HltfkCfeYo+iv9oK8mTBAg9jIqKIps+62chcV35MuFKcl3sfN7WwCqATEQLh
 bHRkoV9hjrpGPu3Vd9IsiUAkLjKD1Xziff8JnbkXGxeUp5eH0qG0nU81tKx8c8VGlsNxvQ
 jZXRrMRumg+5UG4QOyeXcNWqDdmwP4iJXrLRrSPr9xNmbnGn0d8kgSUapP+mXiGMTkBoyh
 0dTcrkfgWQcuPfVBxuSJZU72uUo1uG41uTpBv7bkPO0qB0SzkQScDOdoTh1xLg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 22:09:37 +0100
Message-Id: <DFTQ3CULTHD9.3C1DMHUKEJKKW@bootlin.com>
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH i-g-t v4 00/46] Unigraf integration
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
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

Hi Louis,

On Mon Nov 10, 2025 at 2:39 PM CET, Louis Chauvet wrote:
> Hi everyone,
>
> I am excited to share I currently have access to a Unigraf device,
> which I believe could significantly enhance the capabilities within IGT.
> This device has the potential to enable testing of low-level hardware
> features that are currently not covered. Specifically, Unigraf devices ca=
n
> assist in testing link training, signal integrity, HDCP, DSC, and more.
>
> It's important to note that the Unigraf SDK is not open-source, and the
> communication protocol with the device is proprietary. As a result, I hav=
e
> utilized the libTSI.so library, which can be downloaded from [1]. In this

Where is [1]? :)

> RFC, I have not used the official TSI_types.h header because it was
  ^^^
Is this still an RFC? The Subject: suggests it is not.

> incompatible with C, so I hardcoded some necessary values. The next
> iteration will use the official TSI_types.h (they plan to fix it for the
> next release).
>
> This RFC is intentionally concise to gather initial feedback from the
       ^^^
As above.

> community regarding the integration of a proprietary device into the test
> suite. I plan to expand on this work by adding more features and pushing
> the developments upstream.
>
> I have also started to work on MST testing (hotplug, link training,
> bandwith limitation), but I have a big issue: connector detection is very
> strange when changing MST configurat (MST->SST, sink count...).
                                     ^+ion

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
