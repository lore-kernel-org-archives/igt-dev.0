Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FC9C54E41
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 13:32:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7645B10E189;
	Thu, 29 Feb 2024 13:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="fRSFYK7C";
	dkim-atps=neutral
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F1410E119
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 13:32:49 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4Tlsbh3RRbz9tFl;
 Thu, 29 Feb 2024 13:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1709213568; bh=yJcE7HWiSjEkDhvBXibpNkuSskDtC3EDAccUOn5ZBtg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fRSFYK7C1HvUS2acqnRZmGjKEuzZdSiYz16IhQz4rzh8BgIZRFO0L2zD3LdapjxRh
 9WjcreW2YvVV5OKmBxABiTFWoADtaqbABbm/tAUQXlarG9frAVHCKh/o0CkWiGfgLR
 rP5tPeSDl2bzq0UvuuXLzK4Oy6pe3pRELMPLWREw=
X-Riseup-User-ID: 3CE309CE0926DB7E72D6F33941ECC0F1DFC703F861B6FCFC673C24C6B4974324
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4Tlsbd5Q9PzJmmw;
 Thu, 29 Feb 2024 13:32:45 +0000 (UTC)
Message-ID: <58a9a0e5-39b3-422a-991c-4066cc0a22a4@riseup.net>
Date: Thu, 29 Feb 2024 10:32:43 -0300
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t 0/3] benchmarks/kms_fb_stress: Add command-line
 options to change the planes and writeback formats
Content-Language: en-US
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20240226-kms_fb_stress-dev-v1-0-1c14942b1244@riseup.net>
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20240226-kms_fb_stress-dev-v1-0-1c14942b1244@riseup.net>
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



On 26/02/24 16:42, Arthur Grillo wrote:
> With the upcoming addition of YUV format to VKMS[1] it would be great to
> test the their performance. To be able to do this, this series adds
> command-line options to arbitrarily select the format of each plane and
> writeback.
> 
> - PATCH #1: Just a non-related assert that I found needed while
>   developing the feature
> - PATCH #2: The command-line options implementation
> - PATCH #3: Log the KMS structure
> 
> [1]: https://lore.kernel.org/r/20240226-yuv-v3-6-ff662f0994db@bootlin.com
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

After some discussion[1] I got a few ideas, so v3 may change a little
bit, with an additional patch testing all the possibilities of formats.

[1]: https://lore.kernel.org/all/6979cd2e-2b00-4dc4-8e41-66b435cf7ea8@riseup.net/

~Best Regards,
~Arthur Grillo

> ---
> Arthur Grillo (3):
>       benchmarks/kms_fb_stress: Assert that we have an supported pipe
>       benchmarks/kms_fb_stress: Add command line options to change the planes and writeback formats
>       benchmarks/kms_fb_stress: Log the KMS structure
> 
>  benchmarks/kms_fb_stress.c | 106 +++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 92 insertions(+), 14 deletions(-)
> ---
> base-commit: 9ee96f431b2baf552e95c9d839cdfbcdae2c8b41
> change-id: 20240226-kms_fb_stress-dev-c93ae176f901
> 
> Best regards,
