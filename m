Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153D6C25B74
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 15:57:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0EB10E2C9;
	Tue, 21 May 2024 15:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="j8eiTclT";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E90F10E4F8
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 15:57:44 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4VkJx34TbQzDqBT;
 Tue, 21 May 2024 15:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1716307063; bh=npCDDRBERRlTCgFhnYiOmn7mKEnIvLBo6+oKIt78wM4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=j8eiTclTR6MsAYwYOGtABNG2WtuW6PuTxVq6C1u+8CQISlmJQuMyvwcdf8Oo9lkeP
 Vh4+NPDkrSklr+ZFaHJQZnUlGo3MPznF/uWHd8aAvr3aJA7QBbl2wcWhcXcLfM5x83
 tuBfT4FAAX9uVk8PWp6GMBbVMw8gLXT7/1pPz+j8=
X-Riseup-User-ID: 49C0BC6A6EF50C9FC7DCAEBB5F69127278017BE9B81A415575A47059D7AD930D
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VkJwz3JlYzFwpS;
 Tue, 21 May 2024 15:57:38 +0000 (UTC)
Message-ID: <60297aae-6e4c-45b2-aaef-4e29f9e3e210@riseup.net>
Date: Tue, 21 May 2024 12:57:36 -0300
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t v5 0/8] benchmarks/kms_fb_stress: benchmark formats
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
References: <20240422-kms_fb_stress-dev-v5-0-0c577163dc88@riseup.net>
Content-Language: en-US
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20240422-kms_fb_stress-dev-v5-0-0c577163dc88@riseup.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 22/04/24 19:18, Arthur Grillo wrote:
> After some discussion[1], I changed how to tackle the problem. (2x)
> 
> With the upcoming addition of YUV format to VKMS[2] it would be great to
> test the their performance. So, test all formats available.
> 
> - PATCH #1: Just a non-related assert that I found needed while developing
> - PATCH #2: Log the KMS structure
> - PATCH #3: Moving code, should be noop
> - PATCH #4, #5 & #6 : Fix a couple of bugs found while developing
> - PATCH #7: Add a enable_overlay flag in preparation for #8
> - PATCH #8: The new benchmark that tests performance between format
> 
> [1]: https://lore.kernel.org/all/6979cd2e-2b00-4dc4-8e41-66b435cf7ea8@riseup.net/
> [2]: https://lore.kernel.org/all/20240304-yuv-v4-11-76beac8e9793@bootlin.com/
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

Just a gentle ping on this set.

Best Regards,
~Arthur Grillo
