Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5464CA0FED
	for <igt-dev@archiver.kernel.org>; Fri,  5 Sep 2025 20:53:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D7610EC44;
	Fri,  5 Sep 2025 20:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Z+T+Qu+p";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42A910EC44
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Sep 2025 20:53:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id BE7781A0DE4;
 Fri,  5 Sep 2025 20:53:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8CBDF6060B;
 Fri,  5 Sep 2025 20:53:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1656C102F1C26; 
 Fri,  5 Sep 2025 22:53:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757105619; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=YDw4Lp9hl0pzea6/E93DIkSsfxPvn0j6hnQige16B6o=;
 b=Z+T+Qu+p4Z4y/LVul72nkbU/oOuZ0E4cMgvWk9OEGWTfhZY/uMi5yUHlHMKQ2WDbCookk7
 GZlLwzTEWNS2oTQ2SO3utoVxFGFzOdafGp0E05FRpYa6rrSF6+laRRo8CywnZhCW+yLVX5
 yfydRh/24HdGKyc2JwSbnR9jVJ6TW6+BIeDj1WxLVnAbztwCGBnlDYRLcAmMl5Yg/+O/WK
 EMeedSqV4gS5/0NvAlMkOVzb9xSH2IGHJjEL9zv0C5ei2RpMqaIKmA77DLrWq2voY7FinS
 x3I5MKbKF2OnbrXMYMphq7OD/8mjB0SOxFRRTekirpV09s/AHvq957Ml4DAuFQ==
Message-ID: <1ef65ce4-8ca5-4ce1-87fc-2ac7ca370f90@bootlin.com>
Date: Fri, 5 Sep 2025 22:53:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 16/41] lib/vkms: Test connector invalid values
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@linux.intel.com,
 karthik.b.s@intel.com
References: <20250807074550.6543-1-jose.exposito89@gmail.com>
 <20250807074550.6543-17-jose.exposito89@gmail.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250807074550.6543-17-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 07/08/2025 à 09:45, José Expósito a écrit :
> For a VKMS connector, it is only possible to set invalid values in the
> connector status.
> 
> Test that setting wrong values fails and that the connector is not
> accidentally changed.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

I'm ok with keeping the check, so:

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   lib/igt_vkms.c             | 24 ++++++++++++++++++
>   lib/igt_vkms.h             |  2 ++
>   tests/vkms/vkms_configfs.c | 50 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 76 insertions(+)
> 
> diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
> index 5d9e13ed7..a86d5e05d 100644
> --- a/lib/igt_vkms.c
> +++ b/lib/igt_vkms.c
> @@ -613,3 +613,27 @@ int igt_vkms_connector_get_status(igt_vkms_t *dev, const char *name)
>   
>   	return read_int(path);
>   }
> +
> +/**
> + * igt_vkms_connector_set_status:
> + * @dev: Device the connector belongs to
> + * @name: Connector name
> + * @type: DRM_MODE_CONNECTED, DRM_MODE_DISCONNECTED or
> + * DRM_MODE_UNKNOWNCONNECTION
> + *
> + * Set a new status for the connector
> + */
> +void igt_vkms_connector_set_status(igt_vkms_t *dev, const char *name,
> +				   int status)
> +{
> +	char path[PATH_MAX];
> +
> +	if (status != DRM_MODE_CONNECTED &&
> +	    status != DRM_MODE_DISCONNECTED &&
> +	    status != DRM_MODE_UNKNOWNCONNECTION)
> +		igt_assert(!"Cannot be reached: Unknown connector status");
> +
> +	igt_vkms_get_connector_status_path(dev, name, path, sizeof(path));
> +
> +	write_int(path, status);
> +}
> diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
> index 13d7ed094..596990547 100644
> --- a/lib/igt_vkms.h
> +++ b/lib/igt_vkms.h
> @@ -58,5 +58,7 @@ void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name);
>   
>   void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name);
>   int igt_vkms_connector_get_status(igt_vkms_t *dev, const char *name);
> +void igt_vkms_connector_set_status(igt_vkms_t *dev, const char *name,
> +				   int status);
>   
>   #endif /* __IGT_VKMS_H__ */
> diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
> index b3fafc069..987491373 100644
> --- a/tests/vkms/vkms_configfs.c
> +++ b/tests/vkms/vkms_configfs.c
> @@ -485,6 +485,55 @@ static void test_connector_default_values(void)
>   	igt_vkms_device_destroy(dev);
>   }
>   
> +/**
> + * SUBTEST: connector-wrong-values
> + * Description: Check that setting unexpected values doesn't work.
> + */
> +
> +static void test_connector_wrong_values(void)
> +{
> +	struct invalid_value invalid_status_values[] = {
> +		{ "", 0 },
> +		{ "\0", 1 },
> +		{ "-1", 2 },
> +		{ "0", 1 },
> +		{ "4", 1 },
> +		{ "connected", 10 },
> +	};
> +	igt_vkms_t *dev;
> +	char path[PATH_MAX];
> +	int fd;
> +	int ret;
> +
> +	/* Create a device with a disconnected connector */
> +	dev = igt_vkms_device_create(__func__);
> +	igt_assert(dev);
> +
> +	igt_vkms_device_add_connector(dev, "connector0");
> +	igt_vkms_connector_set_status(dev, "connector0", DRM_MODE_DISCONNECTED);
> +	igt_assert_eq(igt_vkms_connector_get_status(dev, "connector0"),
> +		      DRM_MODE_DISCONNECTED);
> +	igt_vkms_get_connector_status_path(dev, "connector0", path, sizeof(path));
> +
> +	/* Test invalid values for "status" */
> +	for (int i = 0; i < ARRAY_SIZE(invalid_status_values); i++) {
> +		struct invalid_value v = invalid_status_values[i];
> +
> +		fd = open(path, O_WRONLY);
> +		igt_assert_f(fd >= 0, "Error opening '%s'\n", path);
> +
> +		ret = write(fd, v.value, v.size);
> +		igt_assert(ret <= 0);
> +
> +		close(fd);
> +	}
> +
> +	igt_assert_eq(igt_vkms_connector_get_status(dev, "connector0"),
> +		      DRM_MODE_DISCONNECTED);
> +
> +	igt_vkms_device_destroy(dev);
> +}
> +
>   igt_main
>   {
>   	struct {
> @@ -505,6 +554,7 @@ igt_main
>   		{ "encoder-default-files", test_encoder_default_files },
>   		{ "connector-default-files", test_connector_default_files },
>   		{ "connector-default-values", test_connector_default_values },
> +		{ "connector-wrong-values", test_connector_wrong_values },
>   	};
>   
>   	igt_fixture {

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

