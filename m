Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A88C4828D
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 17:16:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDFA10EF48;
	Thu,  1 Feb 2024 17:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="e4oSUOm4";
	dkim-atps=neutral
X-Greylist: delayed 2419 seconds by postgrey-1.36 at gabe;
 Thu, 01 Feb 2024 17:16:34 UTC
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08EA910EF48
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 17:16:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79B261BF203;
 Thu,  1 Feb 2024 17:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1706807793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z70zuOGt4Rknv5xQgo5Ic4jPT1wRejRgUF+3NupjF0c=;
 b=e4oSUOm4a77ZcT7sBjkgF+q06wyGKoaQ8bNq0idkJ9RraY2CpWhXtxLn1SVuR4lcdnb8TY
 y70nAzaqSn1egVY9QD1MAwMHqf+AqE3YYnYrn8Is8GUJOFn6YB61qnnPWM/J1xbWaekjsG
 0FecGgGjsfM448s0RCBeD6k5Doy4rKwoKO1RSevuMKdykU0ywbI8EaSPE5s1p8e7jWIyYF
 jpfzdCsZOI+12Y+dRDoThER7AL1faj8thuSu/ds1erpa+DWcwDxzieRrNGiMN9eSb0ud8p
 xvbCzv0dhzNj/32150TdU1DNJoUyVI0zG5sPkUDkbYIsxbi4vkLV09ifU22ywA==
Date: Thu, 1 Feb 2024 18:16:32 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, miquel.raynal@bootlin.com
Subject: Re: [PATCH i-g-t 3/3] tests/kms_rotation_crc: Remove intel guards
Message-ID: <ZbvR8B_yuSTQ2KmB@localhost.localdomain>
References: <20240201-kms_tests-v1-0-bc34c5d28b3f@bootlin.com>
 <20240201-kms_tests-v1-3-bc34c5d28b3f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201-kms_tests-v1-3-bc34c5d28b3f@bootlin.com>
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

In this patch I forgot to remove this modifier if the device is not an 
intel GPU:

	modifier = data->override_modifier ?: I915_FORMAT_MOD_Y_TILED;

line 389 in tests/kms_rotation_crc.c

I will add it in my v2 when the rest of the series is reviewed:

	if (is_intel_device(data->gfx_fd)) {
		modifier = data->override_modifier ?: I915_FORMAT_MOD_Y_TILED;
	}

This way the rotation tests can be run for vkms too.
