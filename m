Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3BEC83F22
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 09:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A034310E762;
	Wed, 16 Jul 2025 09:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KnN9uCKY";
	dkim-atps=neutral
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F89110E762
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 09:49:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7AFA444251;
 Wed, 16 Jul 2025 09:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752659397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7mx32TKk8YOfU8cft1Z7XA/GO1v0vN8RJEUNhQ55m8c=;
 b=KnN9uCKYeW5qCMAIxhlwKOox8J1EyaIi1ksxuwwCPsNuZDqR3qZDWQ+BSKSTxhKjctdXlP
 hGsuOxTBaqVXMe1hrvlPtl0VjE21u7EnTHlsac1CaXRYABXqwB4P2ue/SiDb8FFx2VedLs
 erH6XtcBvd+FrRzaR6gvn3iy10M6+di6eja8/eKNrjB6ZIEeT/q3VJZ+XsdG81rMzW12BR
 O8kVu8hRQD6YyW1XLiDJqD1RMow7QJrk/Rd7C01I4T/CFyQ5hCQbeLSdo544SGMGaTirFu
 E3+Lpb/KehSVXhniniZJN0bd9qJNYo6KdYoZWA6rD+RYxrWhkjlAiI9W/XOFvg==
Message-ID: <73393f9f-8a0b-4f4d-8072-6cde0031ec6f@bootlin.com>
Date: Wed, 16 Jul 2025 11:49:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 20/41] lib/vkms: Test attaching connectors to
 encoders
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com
References: <20250715102513.5636-1-jose.exposito89@gmail.com>
 <20250715102513.5636-21-jose.exposito89@gmail.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250715102513.5636-21-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehjeeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeeivedtfeegtdekheethedttddtfefhhfegjeeljeejleduvdfhudegvdekheevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhegnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhgthdqu
 ggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopeiisghighhnihgvfidrkhgvmhhptgiihihnshhkihesihhnthgvlhdrtghomh
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



Le 15/07/2025 à 12:24, José Expósito a écrit :
> Add helpers to attach and detach connectors and encoders and a test
> checking the different valid and invalid cases.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   lib/igt_vkms.c             | 50 ++++++++++++++++++++++++++++
>   lib/igt_vkms.h             |  9 +++++
>   tests/vkms/vkms_configfs.c | 68 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 127 insertions(+)
> 
> diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
> index b6f22721d..2cd78fc95 100644
> --- a/lib/igt_vkms.c
> +++ b/lib/igt_vkms.c
> @@ -410,6 +410,22 @@ void igt_vkms_get_connector_status_path(igt_vkms_t *dev, const char *name,
>   				    VKMS_FILE_CONNECTOR_STATUS, path, len);
>   }
>   
> +/**
> + * igt_vkms_get_connector_possible_encoders_path:
> + * @dev: Device containing the connector
> + * @name: Connector name
> + * @path: Output path
> + * @len: Maximum @path length
> + *
> + * Returns the connector "possible_encoders" directory path.
> + */
> +void igt_vkms_get_connector_possible_encoders_path(igt_vkms_t *dev,
> +						   const char *name, char *path,
> +						   size_t len)
> +{
> +	get_attach_dir_path(dev, VKMS_PIPELINE_ITEM_CONNECTOR, name, path, len);
> +}
> +
>   /**
>    * igt_vkms_device_create:
>    * @name: VKMS device name
> @@ -804,3 +820,37 @@ void igt_vkms_connector_set_status(igt_vkms_t *dev, const char *name,
>   
>   	write_int(path, status);
>   }
> +
> +/**
> + * igt_vkms_connector_attach_encoder:
> + * @dev: Target device
> + * @connector_name: Target connector name
> + * @encoder_name: Destination encoder name
> + *
> + * Attach a connector to an encoder. Return true on success and false on error.
> + */
> +bool igt_vkms_connector_attach_encoder(igt_vkms_t *dev,
> +				       const char *connector_name,
> +				       const char *encoder_name)
> +{
> +	return attach_pipeline_item(dev, VKMS_PIPELINE_ITEM_CONNECTOR,
> +				    connector_name, VKMS_PIPELINE_ITEM_ENCODER,
> +				    encoder_name);
> +}
> +
> +/**
> + * igt_vkms_connector_detach_encoder:
> + * @dev: Target device
> + * @connector_name: Target connector name
> + * @encoder_name: Destination encoder name
> + *
> + * Detach a connector from an encoder. Return true on success and false on
> + * error.
> + */
> +bool igt_vkms_connector_detach_encoder(igt_vkms_t *dev,
> +				       const char *connector_name,
> +				       const char *encoder_name)
> +{
> +	return detach_pipeline_item(dev, VKMS_PIPELINE_ITEM_CONNECTOR,
> +				    connector_name, encoder_name);
> +}
> diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
> index 2dd91df9d..42134c82e 100644
> --- a/lib/igt_vkms.h
> +++ b/lib/igt_vkms.h
> @@ -41,6 +41,9 @@ void igt_vkms_get_connector_path(igt_vkms_t *dev, const char *name, char *path,
>   				 size_t len);
>   void igt_vkms_get_connector_status_path(igt_vkms_t *dev, const char *name,
>   					char *path, size_t len);
> +void igt_vkms_get_connector_possible_encoders_path(igt_vkms_t *dev,
> +						   const char *name, char *path,
> +						   size_t len);
>   
>   igt_vkms_t *igt_vkms_device_create(const char *name);
>   void igt_vkms_device_destroy(igt_vkms_t *dev);
> @@ -72,5 +75,11 @@ void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name);
>   int igt_vkms_connector_get_status(igt_vkms_t *dev, const char *name);
>   void igt_vkms_connector_set_status(igt_vkms_t *dev, const char *name,
>   				   int status);
> +bool igt_vkms_connector_attach_encoder(igt_vkms_t *dev,
> +				       const char *connector_name,
> +				       const char *encoder_name);
> +bool igt_vkms_connector_detach_encoder(igt_vkms_t *dev,
> +				       const char *connector_name,
> +				       const char *encoder_name);
>   
>   #endif /* __IGT_VKMS_H__ */
> diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
> index fdbfa61a6..c36a795d6 100644
> --- a/tests/vkms/vkms_configfs.c
> +++ b/tests/vkms/vkms_configfs.c
> @@ -707,6 +707,73 @@ static void test_attach_encoder_to_crtc(void)
>   	igt_vkms_device_destroy(dev2);
>   }
>   
> +/**
> + * SUBTEST: attach-connector-to-encoder
> + * Description: Check that errors are handled while attaching connectors to
> + *              encoders.
> + */
> +
> +static void test_attach_connector_to_encoder(void)
> +{
> +	igt_vkms_t *dev1;
> +	igt_vkms_t *dev2;
> +	char crtc1[PATH_MAX];
> +	char encoder1[PATH_MAX];
> +	char connector1[PATH_MAX];
> +	char encoder2[PATH_MAX];
> +	char crtc1_writeback_path[PATH_MAX];
> +	bool ok;
> +
> +	dev1 = igt_vkms_device_create("test_attach_encoder_to_crtc_1");
> +	igt_assert(dev1);
> +
> +	dev2 = igt_vkms_device_create("test_attach_encoder_to_crtc_2");
> +	igt_assert(dev2);
> +
> +	igt_vkms_device_add_crtc(dev1, "crtc1");
> +	igt_vkms_device_add_encoder(dev1, "encoder1");
> +	igt_vkms_device_add_connector(dev1, "connector1");
> +	igt_vkms_device_add_encoder(dev2, "encoder2");
> +
> +	igt_vkms_get_crtc_path(dev1, "crtc1", crtc1, sizeof(crtc1));
> +	igt_vkms_get_encoder_path(dev1, "encoder1", encoder1, sizeof(encoder1));
> +	igt_vkms_get_connector_possible_encoders_path(dev1, "connector1",
> +						      connector1,
> +						      sizeof(connector1));
> +	igt_vkms_get_encoder_path(dev2, "encoder2", encoder2, sizeof(encoder2));
> +	igt_vkms_get_crtc_writeback_path(dev1, "crtc1", crtc1_writeback_path,
> +					 sizeof(crtc1_writeback_path));
> +
> +	/* Error: Attach a connector to a CRTC */
> +	ok = attach(connector1, crtc1, "crtc");
> +	igt_assert_f(!ok, "Attaching connector1 to crtc1 should fail\n");
> +
> +	/* Error: Attach a connector to a random file */
> +	ok = attach(connector1, crtc1_writeback_path, "file");
> +	igt_assert_f(!ok, "Attaching connector1 to a random file should fail\n");
> +
> +	/* Error: Attach a connector to an encoder from other device */
> +	ok = attach(connector1, encoder2, "encoder2");
> +	igt_assert_f(!ok, "Attaching connector1 to encoder2 should fail\n");
> +
> +	/* OK: Attaching connector1 to encoder1 */
> +	ok = igt_vkms_connector_attach_encoder(dev1, "connector1", "encoder1");
> +	igt_assert_f(ok, "Error attaching plane1 to crtc1\n");
> +
> +	/* Error: Attaching connector1 to encoder1 twice */
> +	ok = attach(connector1, encoder1, "encoder1_duplicated");
> +	igt_assert_f(!ok, "Error attaching connector1 to encoder1 twice should fail");
> +
> +	/* OK: Detaching and attaching again */
> +	ok = igt_vkms_connector_detach_encoder(dev1, "connector1", "encoder1");
> +	igt_assert_f(ok, "Error detaching connector1 from encoder1\n");
> +	ok = igt_vkms_connector_attach_encoder(dev1, "connector1", "encoder1");
> +	igt_assert_f(ok, "Error attaching connector1 to encoder1\n");
> +
> +	igt_vkms_device_destroy(dev1);
> +	igt_vkms_device_destroy(dev2);
> +}
> +
>   igt_main
>   {
>   	struct {
> @@ -731,6 +798,7 @@ igt_main
>   		{ "connector-valid-values", test_connector_valid_values },
>   		{ "attach-plane-to-crtc", test_attach_plane_to_crtc },
>   		{ "attach-encoder-to-crtc", test_attach_encoder_to_crtc },
> +		{ "attach-connector-to-encoder", test_attach_connector_to_encoder },
>   	};
>   
>   	igt_fixture {

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

