Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B45DC54E67
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 16:50:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC8E112395;
	Fri, 15 Mar 2024 16:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="p888DIR4";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB911112395
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 16:50:47 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4Tx9HB4RvbzDqw3;
 Fri, 15 Mar 2024 16:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1710521446; bh=lgpDRjjxek56RzgMCi/MIoJZ+ZvAYYhwrs9n+BNMxW4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=p888DIR4N0DwULAQc8PGCrBwoCpnqR39/OA6gPOlTKrQi5rjcvS3hw/zsH+711/HY
 8Vz4Ua3W1o5dRByiF8joE+ZRIx71qZUnzK1UWfAZ1SGZtgVx0YwmPb2C9SbL5kAI3C
 eW31vOYPDNUBxw2ietVaQPbK4XJjDH63gIyi7BaU=
X-Riseup-User-ID: 026A1059D1CF3EFE0B9DC360BBED524D7EF459EDDF6C0492D074A89338153D83
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4Tx9H7194qzJrnH;
 Fri, 15 Mar 2024 16:50:42 +0000 (UTC)
Message-ID: <01e088e5-cddb-4aaa-9ebd-a161d306c712@riseup.net>
Date: Fri, 15 Mar 2024 13:50:39 -0300
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t] CONTRIBUTING: Add coding style guidelines
Content-Language: en-US
To: Louis Chauvet <louis.chauvet@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com, kamil.konieczny@linux.intel.com
References: <20240315-add_coding_style-v1-1-50ad93cfa250@bootlin.com>
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20240315-add_coding_style-v1-1-50ad93cfa250@bootlin.com>
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



On 15/03/24 13:08, Louis Chauvet wrote:
> As explained in [1], the submitted patches should follow the same style as
> the Linux kernel and must be checked against checkpatch.pl, so add this
> recommendation in the CONTRIBUTING.md file.
> 
> [1]: https://lore.kernel.org/all/20240314170643.77vzqqoie2otyu4w@kamilkon-desk.igk.intel.com/
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

I could swear that this was already there.

Reviewed-by: Arthur Grillo <arthurgrillo@riseup.net>

> 
> To: igt-dev@lists.freedesktop.org
> Cc: miquel.raynal@bootlin.com
> Cc: thomas.petazzoni@bootlin.com
> Cc: jeremie.dautheribes@bootlin.com
> Cc: arthurgrillo@riseup.net
> Cc: seanpaul@google.com
> Cc: marcheu@google.com
> Cc: nicolejadeyee@google.com
> Cc: kamil.konieczny@linux.intel.com
> ---
> To: igt-dev@lists.freedesktop.org
> Cc: miquel.raynal@bootlin.com
> Cc: thomas.petazzoni@bootlin.com
> Cc: jeremie.dautheribes@bootlin.com
> Cc: arthurgrillo@riseup.net
> Cc: seanpaul@google.com
> Cc: marcheu@google.com
> Cc: nicolejadeyee@google.com
> Cc: kamil.konieczny@linux.intel.com
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  CONTRIBUTING.md | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> index 2ab8a48f6ae9..ec8debb4091e 100644
> --- a/CONTRIBUTING.md
> +++ b/CONTRIBUTING.md
> @@ -78,6 +78,8 @@ Sending Patches
>  - Changes to the testcases are automatically tested. Take the results into
>    account before merging.
>  
> +- The coding rules are the same as for the Linux kernel. To check for common
> +  style problems, you need to use the kernel's checkpatch.pl script.
>  
>  Commit Rights
>  -------------
> 
> ---
> base-commit: ed47dd9fb6b5be6c88513c2816f0f7cfdd0e02f6
> change-id: 20240315-add_coding_style-b755454de958
> 
> Best regards,
