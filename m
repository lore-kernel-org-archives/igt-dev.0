Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90938C25B77
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 08:38:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA3310EE32;
	Wed, 22 May 2024 08:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PT8YsyPL";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06C310EE0B
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 08:38:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 25915C62CB
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 08:36:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 16F8C6000D;
 Wed, 22 May 2024 08:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1716366962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XEXl2oGY7x8zAOV0jeYTropOURY6uk5GsjHCFOqBt7g=;
 b=PT8YsyPLj9j0JitnZvhUJhI50aEo+w3SaFpsKnyn2QAoJHfK1AtFMD+xjV1/keF0zt6aeP
 D8tsUD9WOg9hY32IUXIxEAal/hesWK4s7MtD1Uc4VlCxOE3XYr9lf7qE/vcgA3Z0ijK3j1
 +N5V6pIsUZimMq+hUuRjm9Mts1JtMwYdv1tRLpmwl+K99RcS1OF5EJujiMBbet9uc4/9va
 /sOXK4SZF9xtNHxK4/Sw8c+M/5ZL2ClCKaYr6eqtbcy5MPpo/6hyLu3183g5lWkSTnYNKM
 2XGJN8qm+1LWmhjnEiDAJJ5Zxr85d270nKCluq5YmmLNoOAD3zNhloefLfiGiw==
Date: Wed, 22 May 2024 10:35:59 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH i-g-t v5 8/8] benchmarks/kms_fb_stress: Create a
 benchmark for formats
Message-ID: <Zk2ub040rnCjK7Zy@localhost.localdomain>
References: <20240422-kms_fb_stress-dev-v5-0-0c577163dc88@riseup.net>
 <20240422-kms_fb_stress-dev-v5-8-0c577163dc88@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240422-kms_fb_stress-dev-v5-8-0c577163dc88@riseup.net>
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

Le 22/04/24 - 19:18, Arthur Grillo a écrit :
> Create a benchmark that tests the performance of each supported format
> for the primary plane.
> 
> For VKMS, it tests the performance of the conversion of formats to/from
> the ARGB1616161 baseline format.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  benchmarks/kms_fb_stress.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
> index d2d6b3e65eae..5535339cd287 100644
> --- a/benchmarks/kms_fb_stress.c
> +++ b/benchmarks/kms_fb_stress.c
> @@ -295,6 +295,14 @@ igt_main
>  
>  	}
>  
> +	igt_subtest("formats") {
> +		data.use_overlay = false;
> +		for (size_t i = 0; i < data.kms.primary.base->format_mod_count; i++) {
> +			data.kms.primary.format = data.kms.primary.base->formats[i];
> +			data.kms.writeback.format = data.kms.primary.base->formats[i];
> +			stress_driver(&data);
> +		}
> +	}

I just used this test to compute the performance numbers. I have a comment 
on this part:

I am not sure about the writeback format here. The writeback connector may 
only support a few formats, not all the formats supported by the primary 
plane. I think you can split this test into two: one iterating over plane 
formats, and one iterating over writeback formats, so you can compare the 
performance of writeback and plane.

>  	igt_fixture {
>  		igt_display_fini(&data.display);
> 
> -- 
> 2.44.0
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
