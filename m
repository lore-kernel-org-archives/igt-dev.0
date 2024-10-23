Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DE9D2E021
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 07:53:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CA310E779;
	Wed, 23 Oct 2024 07:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="K77z2bUH";
	dkim-atps=neutral
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A497710E779
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 07:53:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD5C41BF20D
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 07:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729670006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cy8NBsYSwaRIi2z5bmSlnnCa7Uil+MEqiXMpEvaJoHA=;
 b=K77z2bUHIxZzqmmn1EQBTD5vrUlR6ACZyGkBTKGPnmHI2XLJSStHEykE2DXevSnXCuVfot
 ylU18VB+L0k1ezxA3e4hoiZyYHJtHlainfPrdF2t8Ru6pKO5vo7q3oK323rO0oQs268Rlu
 1VOJSlSCROniQmAvEv8Af+QIapoJiV8R1kuZzCKUhEWOB5sPHSWc3x326EdXN1lIhZHRgz
 9Fj4dm0t+HgRQ4ey1KQr2R0fau6zgdi5SVD5j2RswwoyPH0egIzVCHUgTIDy661VxbhYAT
 Oaa28/IFYE1zXievTCD4UvAtGbEbOpeiGkE/Xib0HkWbNtTXO3LAY4FNFOkJlw==
Date: Wed, 23 Oct 2024 09:53:24 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJVSUxEOiBmYWls?= =?utf-8?Q?ure_fo?=
 =?utf-8?Q?r?= lib/chamelium: Move chameliumv2 support in its own directory
Message-ID: <ZxirdHycl9TibbGC@fedora>
References: <20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com>
 <172961686131.1310805.8376861925833861089@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172961686131.1310805.8376861925833861089@2413ebb6fbb6>
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

On 22/10/24 - 17:07, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/chamelium: Move chameliumv2 support in its own directory
> URL   : https://patchwork.freedesktop.org/series/140319/
> State : failure
> 
> == Summary ==
> 
> Applying: tests/chamelium: Extract Chamelium v2 tests into a separate directory
> Applying: lib/chamelium/v2: Extract chamelium v2 wrapper into its own directory
> Using index info to reconstruct a base tree...
> M	lib/igt_kms.c
> M	lib/monitor_edids/monitor_edids_helper.h
> Falling back to patching base and 3-way merge...
> Auto-merging lib/monitor_edids/monitor_edids_helper.h
> CONFLICT (content): Merge conflict in lib/monitor_edids/monitor_edids_helper.h
> Auto-merging lib/igt_kms.c
> Patch failed at 0002 lib/chamelium/v2: Extract chamelium v2 wrapper into its own directory
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".

Hi,

This fail is expected as this series depends on:
- 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com
- 20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com

Thanks,
Louis Chauvet

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
