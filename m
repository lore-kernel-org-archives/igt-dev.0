Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D585C282CD
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 08:51:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1CF10E26B;
	Fri, 28 Feb 2025 08:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="SPro42wY";
	dkim-atps=neutral
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3E410EC1D
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2025 08:51:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A4C144445;
 Fri, 28 Feb 2025 08:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740732710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=A8tmeoHZa+XQNETz+chk6MeSjK2A9Qm39dV6H/Mczz8=;
 b=SPro42wYHxinvz+bxHWdGPgQYmLnJ0J2UwcClqaI8SsEUI7zpq0v8P3EQS5z3aNvlv66kw
 Z5cFCiGkX+ISyuawBwnTjZfBerqOnrXG2nmGi1TmhrIs+dR/VECc5SfT65mI4W6iO3ljU2
 epqTUtJYlq2Ks9mrwGayo9ZxKU/Fp8Q2EIFl6VpAqdojeQtkGuPFztD1LHPQUbB26Rqzcd
 TnwmAjbRlZ+F4AUWj7HKBBgP5rXxdsJ3Ep+XDRkJ170QzxkOJkYOw9AK/Iv7gcqonFAwae
 SsiOW6/fPkR+h+63p20ApbS5k9FQjHMIU0ToKapImfqL+Yf9eq8M13fVDGx6Mg==
Message-ID: <4aecf9ec-1092-40ae-9b7c-a5abc2c4557f@bootlin.com>
Date: Fri, 28 Feb 2025 09:51:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 39/39] tests/vkms_configfs: Test connector hot-plug
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 igt-dev@lists.freedesktop.org
References: <20250218165011.9123-1-jose.exposito89@gmail.com>
 <20250218165011.9123-40-jose.exposito89@gmail.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250218165011.9123-40-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekleelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuvdetgeevkefhiedugfekveejieeiveeigeeiveduffehfffhgeffffetheekgfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhgthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
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



Le 18/02/2025 à 17:50, José Expósito a écrit :
> Test that, once a VKMS device is enabled, the connectors can be
> hot-plugged and hot-unplugged.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>   tests/vkms/vkms_configfs.c | 84 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 84 insertions(+)
> 
> diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
> index 47a6a81ff..16922b62b 100644
> --- a/tests/vkms/vkms_configfs.c
> +++ b/tests/vkms/vkms_configfs.c
> @@ -1738,6 +1738,89 @@ static void test_enabled_connector_cannot_change(void)
>   	igt_vkms_device_destroy(dev);
>   }
>   
> +/**
> + * SUBTEST: enabled-connector-hot-plug
> + * Description: Test that, once a VKMS device is enabled, the connectors can be
> + *              hot-plugged and unplugged.
> + */
> +
> +static void test_enabled_connector_hot_plug(void)
> +{
> +	igt_vkms_t *dev;
> +	drmModeConnection status;
> +
> +	igt_vkms_config_t cfg = {
> +		.device_name = __func__,
> +		.planes = {
> +			{
> +				.name = "plane0",
> +				.type = DRM_PLANE_TYPE_PRIMARY,
> +				.possible_crtcs = { "crtc0"},
> +			},
> +			{
> +				.name = "plane1",
> +				.type = DRM_PLANE_TYPE_PRIMARY,
> +				.possible_crtcs = { "crtc1"},
> +			},
> +		},
> +		.crtcs = {
> +			{ .name = "crtc0", .writeback = true },
> +			{ .name = "crtc1", .writeback = true },

This test fails because of:
- the reason I presented in 35/39
- writeback=true creates two more connectors, which break your function 
assert_device_config.

Dirty fix (that work): remove writeback=true
Correct fix: correct the assert_device_config function to count how much 
writeback connectors are expected

Thanks a lot for all of those tests, straightforward to understand!

Louis Chauvet

> +		},
> +		.encoders = {
> +			{ .name = "encoder0", .possible_crtcs = { "crtc0" } },
> +			{ .name = "encoder1", .possible_crtcs = { "crtc1" } },
> +		},
> +		.connectors = {
> +			{
> +				.name = "connector0",
> +				.status = DRM_MODE_DISCONNECTED,
> +				.possible_encoders = { "encoder0" },
> +			},
> +			{
> +				.name = "connector1",
> +				.status = DRM_MODE_DISCONNECTED,
> +				.possible_encoders = { "encoder1" },
> +			},
> +		},
> +	};
> +
> +	dev = igt_vkms_device_create_from_config(&cfg);
> +	igt_assert(dev);
> +
> +	igt_vkms_device_set_enabled(dev, true);
> +	igt_assert(igt_vkms_device_is_enabled(dev));
> +	assert_device_config(&cfg);
> +
> +	/* Connect both connectors */
> +	cfg.connectors[0].status = DRM_MODE_CONNECTED;
> +	igt_vkms_connector_set_status(dev, "connector0", DRM_MODE_CONNECTED);
> +	status = igt_vkms_connector_get_status(dev, "connector0");
> +	igt_assert_eq(status, DRM_MODE_CONNECTED);
> +	assert_device_config(&cfg);
> +
> +	cfg.connectors[1].status = DRM_MODE_CONNECTED;
> +	igt_vkms_connector_set_status(dev, "connector1", DRM_MODE_CONNECTED);
> +	status = igt_vkms_connector_get_status(dev, "connector1");
> +	igt_assert_eq(status, DRM_MODE_CONNECTED);
> +	assert_device_config(&cfg);
> +
> +	/* Set one to unknown connection and disconnect the other one */
> +	cfg.connectors[0].status = DRM_MODE_UNKNOWNCONNECTION;
> +	igt_vkms_connector_set_status(dev, "connector0", DRM_MODE_UNKNOWNCONNECTION);
> +	status = igt_vkms_connector_get_status(dev, "connector0");
> +	igt_assert_eq(status, DRM_MODE_UNKNOWNCONNECTION);
> +	assert_device_config(&cfg);
> +
> +	cfg.connectors[1].status = DRM_MODE_DISCONNECTED;
> +	igt_vkms_connector_set_status(dev, "connector1", DRM_MODE_DISCONNECTED);
> +	status = igt_vkms_connector_get_status(dev, "connector1");
> +	igt_assert_eq(status, DRM_MODE_DISCONNECTED);
> +	assert_device_config(&cfg);
> +
> +	igt_vkms_device_destroy(dev);
> +}
> +
>   igt_main
>   {
>   	struct {
> @@ -1779,6 +1862,7 @@ igt_main
>   		{ "enabled-crtc-cannot-change", test_enabled_crtc_cannot_change },
>   		{ "enabled-encoder-cannot-change", test_enabled_encoder_cannot_change },
>   		{ "enabled-connector-cannot-change", test_enabled_connector_cannot_change },
> +		{ "enabled-connector-hot-plug", test_enabled_connector_hot_plug },
>   	};
>   
>   	igt_fixture {

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

