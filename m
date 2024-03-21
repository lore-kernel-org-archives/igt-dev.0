Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A78C54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 15:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF4C10EB56;
	Thu, 21 Mar 2024 15:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="lqw78zNw";
	dkim-atps=neutral
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8330A10EBE2
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 15:14:43 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4V0psZ3ZTtz9s5s;
 Thu, 21 Mar 2024 15:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1711034082; bh=pLepd1e7vUrR9636GuxZqChoZZNF/eBqlg6rpawnsdA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lqw78zNwMhYPv0p/zaWbhx8UbAmVfXF6YJwePhWASMRNuXv4gcEnrgNRKo/c014uR
 DKunyW4Cnw+BcxPaYrNsbfnz6SXzIGtFcHDpxjTmeNuRbmmtUWhax+L/TMBQE/80yl
 7zeUBO/QKJRVtdly1tDmiNhOoJNfMkFS1+WR//g8=
X-Riseup-User-ID: 1D5614615C3C2B03B0C96E594FCEA288717BEFD030800170FD880ECA5E06FD3E
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4V0psH1z0rzJsDX;
 Thu, 21 Mar 2024 15:14:26 +0000 (UTC)
Message-ID: <5b66792a-1f1b-4070-ab5e-d27346316162@riseup.net>
Date: Thu, 21 Mar 2024 12:14:17 -0300
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t v3 5/7] benchmarks/kms_fb_stress: Don't paint the
 FB's if the format is DRM_FORMAT_RGB565
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
References: <20240307-kms_fb_stress-dev-v3-0-d5b948a541be@riseup.net>
 <20240307-kms_fb_stress-dev-v3-5-d5b948a541be@riseup.net>
 <20240320173645.1a5479e2.pekka.paalanen@collabora.com>
Content-Language: en-US
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20240320173645.1a5479e2.pekka.paalanen@collabora.com>
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



On 20/03/24 12:36, Pekka Paalanen wrote:
> On Thu, 07 Mar 2024 16:41:07 -0300
> Arthur Grillo <arthurgrillo@riseup.net> wrote:
> 
>> Cairo does not fully support the RGB565 due to some stride issues.
>> So, don't paint the FB's if the format is DRM_FORMAT_RGB565.
> 
> Cairo, as it is based on Pixman, requires stride to be divisible by
> sizeof(uint32_t). Pixman makes use of that requirement to go faster.
> 
> It probably wouldn't hurt if VKMS happened to have the same convention?

By not supporting too? Or converting the plane to have strides divisible
by sizeof(uint32_t) before doing the format conversion?

> 
> Anyway, it would be better to test the stride, not format. Maybe IGT
> should grow a function to check if it can paint with a specific stride
> & format?

If the stride issue is the only thing that decides if a format can be
painted, I think I can create this function.

Best Regards,
~Arthur Grillo

> 
>>
>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
>> ---
>>  benchmarks/kms_fb_stress.c | 55 ++++++++++++++++++++++++++++++++++------------
>>  1 file changed, 41 insertions(+), 14 deletions(-)
> 
> Thanks,
> pq
