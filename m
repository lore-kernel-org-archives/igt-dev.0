Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9CAC55174
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 18:25:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE2810E0F7;
	Fri, 31 Jul 2026 18:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="I6pozAHU";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB42C10E210
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 18:23:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B18AE1A1370
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 18:23:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8723F6039A;
 Fri, 31 Jul 2026 18:23:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 652DF11C16C48; 
 Fri, 31 Jul 2026 20:23:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1785522234; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=8Lz8i9Rx1/oxDoHkQxOSw/5GhcVqDDYk7v+ymCsTzio=;
 b=I6pozAHUIn/+hG0z/etl7som6lsLlyWtR+T71sE31MndOFCDv+eWIPZlNjW1A+F6e0uvlL
 pKshdfV7JE2dmy0gvmcJBKo0A3jp2x5MyuJYAogU37eaYoMlyvj6K3TArYGaFhzzn8rBap
 SBjkkgEEo37QweLyvuhS1f/eNwtv/hIJbVEPrJ+gMMDrF2sb/xrl18wQFrewrCQgCvVA3x
 3qvo/fMhIDfPK6qQG3rAWF0FDXUZFl6nJSnwVOit6gEXk4ReD9Af0KVrhV1l6AVNRiaVwu
 M2Ij3O1YRtA4+jbha+dVWKOnXlIdZmYOGdjCubBAS4CHaoZorJf9Egp7w4Ugkw==
Message-ID: <d85b0e6a-aebe-42d1-91c8-a1d35011f8d3@bootlin.com>
Date: Fri, 31 Jul 2026 20:23:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] lib/unigraf: Add HDCP management
To: igt-dev@lists.freedesktop.org
Cc: markyacoub@google.com, thomas.petazzoni@bootlin.com,
 fomys <fomys@google.com>
References: <20260731-b4-unigraf-hdcp-v1-0-495df88ebbbd@google.com>
 <20260731-b4-unigraf-hdcp-v1-2-495df88ebbbd@google.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260731-b4-unigraf-hdcp-v1-2-495df88ebbbd@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 7/31/26 20:21, Louis Chauvet wrote:
> From: fomys <fomys@google.com>

Tiny mistake on this patch, that indeed me. I will fix it for v2.

> Unigraf is able to emulate HDCP, so add few helpers to enable/disable
> it.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   lib/vendor/unigraf/unigraf.c | 23 ++++++++++++++++++++++-
>   lib/vendor/unigraf/unigraf.h |  4 ++++
>   2 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
> index 30ee3c72bc74..5b416f605428 100644
> --- a/lib/vendor/unigraf/unigraf.c
> +++ b/lib/vendor/unigraf/unigraf.c
> @@ -549,9 +549,10 @@ void unigraf_reset(void)
>   	unigraf_set_mst_stream_count(1);
>   	unigraf_set_sst();
>   	unigraf_load_default_edid();
> -	unigraf_hpd_assert();
>   	unigraf_set_max_lane_count(4);
>   	unigraf_set_max_link_rate(UNIGRAF_RATE_8_10_GHZ);
> +	unigraf_enable_hdcp();
> +	unigraf_hpd_assert();
>   }
>   
>   /**
> @@ -911,3 +912,23 @@ int unigraf_rate_to_kbs(enum unigraf_rate rate)
>   		return 0;
>   	}
>   }
> +
> +/**
> + * unigraf_enable_hdcp - Enable HDCP 2 support
> + *
> + * Unigraf is able to load production keys, but this will disable all recording
> + * features.
> + */
> +void unigraf_enable_hdcp(void)
> +{
> +	unigraf_write_u32(TSI_HDCP_2X_COMMAND_W, H2_SINK_LOAD_PROD_KEYS);
> +	unigraf_write_u32(TSI_HDCP_2X_COMMAND_W, H2_SINK_SET_CAPABLE);
> +}
> +
> +/**
> + * unigraf_disable_hdcp - Disable HDCP support
> + */
> +void unigraf_disable_hdcp(void)
> +{
> +	unigraf_write_u32(TSI_HDCP_2X_COMMAND_W, H2_SINK_CLEAR_CAPABLE);
> +}
> diff --git a/lib/vendor/unigraf/unigraf.h b/lib/vendor/unigraf/unigraf.h
> index 1570be3feb96..498a2d4daab3 100644
> --- a/lib/vendor/unigraf/unigraf.h
> +++ b/lib/vendor/unigraf/unigraf.h
> @@ -103,4 +103,8 @@ uint32_t unigraf_get_lt_rate(void);
>   
>   uint32_t unigraf_get_lt_lane_count(void);
>   
> +void unigraf_enable_hdcp(void);
> +
> +void unigraf_disable_hdcp(void);
> +
>   #endif // UNIGRAF_H
> 

