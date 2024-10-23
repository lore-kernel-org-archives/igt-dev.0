Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28357D2E021
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 07:52:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E7F10E779;
	Wed, 23 Oct 2024 07:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JHWsy1qz";
	dkim-atps=neutral
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AD710E779
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 07:52:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C623A1C0008
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 07:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729669952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+3MVZJpLsNLPTzcZ7/MhPxWJqWBxKBsRgp2Tud1YQWg=;
 b=JHWsy1qz23R8MmjVpecf+cl5Akgzt/EFCqDRfYsc7EoppzEPxlZvlu+eJmdKIAWQ9jteqb
 0KtSK+HE1HkCUML7Mmn0Gt/val+furrkmZeVIX8VhcswwZZgbk80JrudUmI1S3glRnyUww
 SlEXsq0wtRiTDhnSmUBBrTHI2frYbgqYkGb4mHjC3z1wvzjaPFjsZ0zGRg+HkSYHbse3XL
 hJ5xzIqrl52T1vR7SKv/RRurNXyMb1eI1KL0zMRcj3CYpG+wUWqUroZtWNprnBGc0TXLh6
 oX6trcu7BwmU0uwTDQyJcovoxSyF9HQL+fezO4dWJE+KCAemcZeWQxcLJw1r2g==
Date: Wed, 23 Oct 2024 09:52:31 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJVSUxE?= =?utf-8?Q?=3A?= failure for
 tests/chamelium: Integrate the chamelium v3
Message-ID: <ZxirP5g1_4ek8XLM@fedora>
References: <20241022-dev-remove-static-ports-v3-0-bfbc7b2a83b9@bootlin.com>
 <172962107394.1310194.16172515008449507916@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172962107394.1310194.16172515008449507916@2413ebb6fbb6>
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 22/10/24 - 18:17, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/chamelium: Integrate the chamelium v3
> URL   : https://patchwork.freedesktop.org/series/140328/
> State : failure
> 
> == Summary ==
> 
> Applying: lib/chamelium/v3: Introduce the foundation for the Chamelium v3 wrapper
> Patch failed at 0001 lib/chamelium/v3: Introduce the foundation for the Chamelium v3 wrapper
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".

Hi,

This fail is expected, as it depends on previous series:
- 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com
- 20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com
- 20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com

Thanks,
Louis Chauvet

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
