Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B91DC19F2E
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 13:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7E510EADE;
	Thu, 27 Feb 2025 13:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="eiMY99zY";
	dkim-atps=neutral
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5090C10EADE
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 13:14:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E74E320575;
 Thu, 27 Feb 2025 13:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740662097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/dysUht2+Jio5gxQay+5j5N50KRLRKRBl4ojZO3Ww0Y=;
 b=eiMY99zYlaq5ESk3dLaU+656NnBKA4LqZHp46PgHBUnplBL9823xtBEtQgU2wrNru2SeFT
 6fslfCB90qYc72059Aub49Vq6TIdmeeqcJbwSrseuhX+nsQ++SII3VI4Z4bIHnFAVgRNrX
 1QZFWPXE5NMku6LtAlqsY8+4rxqrASWy8bYzIp0tm2obWUIKN0P1ImK49GP/jham5YAsoS
 5aaVIXZKv4aAD4CO+/yUP6lZKfOL/lAK//RMDijFUVpIOPP4xoZVFdwKjLaNbRKrXeA1hW
 ftleS8GsiA+2gsza3Tkun50MLL4FnpGAWlRNdSlpzmS9EVQLvh3F1rRyoII0Bg==
Message-ID: <b1c2d838-4a94-4369-ba36-0d1a9f5de199@bootlin.com>
Date: Thu, 27 Feb 2025 14:14:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t 09/39] lib/vkms: Test plane invalid values
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 igt-dev@lists.freedesktop.org
References: <20250218165011.9123-1-jose.exposito89@gmail.com>
 <20250218165011.9123-10-jose.exposito89@gmail.com>
Content-Language: en-US
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250218165011.9123-10-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekjeehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfhffuvfhfjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeghffhiefgueekleetieehjeefffeiudfgtdehteekvdetjeetvdfhffetteevueenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhgthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
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



Le 18/02/2025 à 17:49, José Expósito a écrit :
> For a VKMS plane, it is only possible to set invalid values in the plane
> type.
> 
> Test that setting wrong values fails and that the plane is not
> accidentally changed.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>   lib/igt_vkms.c             | 25 +++++++++++++++++++
>   lib/igt_vkms.h             |  1 +
>   tests/vkms/vkms_configfs.c | 51 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 77 insertions(+)
> 
> diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
> index 5cfe5123c..ca6f37975 100644
> --- a/lib/igt_vkms.c
> +++ b/lib/igt_vkms.c
> @@ -340,3 +340,28 @@ int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name)
>   
>   	return read_int(path);
>   }
> +
> +/**
> + * igt_vkms_plane_set_type:
> + * @dev: Device the plane belongs to
> + * @name: Plane name
> + * @type: DRM_PLANE_TYPE_OVERLAY, DRM_PLANE_TYPE_PRIMARY or
> + * DRM_PLANE_TYPE_CURSOR
> + *
> + * Set a new type for the plane
> + */
> +void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type)
> +{
> +	char path[PATH_MAX];
> +
> +	if (type != DRM_PLANE_TYPE_OVERLAY &&
> +	    type != DRM_PLANE_TYPE_PRIMARY &&
> +	    type != DRM_PLANE_TYPE_CURSOR)
> +		igt_assert(!"Cannot be reached: Unknown plane type");
> +
> +	snprintf(path, sizeof(path), "%s/%s/%s/%s", dev->path,
> +		 get_pipeline_item_dir_name(VKMS_PIPELINE_ITEM_PLANE), name,
> +		 VKMS_FILE_PLANE_TYPE);
> +
> +	write_int(path, type);

It can fail silently, see my comment on 05/39.

> +}
> diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
> index dd06d8f5b..283be5699 100644
> --- a/lib/igt_vkms.h
> +++ b/lib/igt_vkms.h
> @@ -31,5 +31,6 @@ void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled);
>   
>   void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name);
>   int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name);
> +void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type);
>   
>   #endif /* __IGT_VKMS_H__ */
> diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
> index a3fa60762..d607b1a5a 100644
> --- a/tests/vkms/vkms_configfs.c
> +++ b/tests/vkms/vkms_configfs.c
> @@ -222,6 +222,56 @@ static void test_plane_default_values(void)
>   	igt_vkms_device_destroy(dev);
>   }
>   
> +/**
> + * SUBTEST: plane-wrong-values
> + * Description: Check that setting unexpected values doesn't work.
> + */
> +
> +static void test_plane_wrong_values(void)
> +{
> +	struct invalid_value invalid_type_values[] = {
> +		{ "", 0 },
> +		{ "\0", 1 },
> +		{ "-1", 2 },
> +		{ "4", 1 },
> +		{ "primary", 8 },
> +		{ "overlay", 8 },
> +	};
> +	igt_vkms_t *dev;
> +	char path[PATH_MAX];
> +	int fd;
> +	int ret;
> +
> +	/* Create a device with a primary plane */
> +	dev = igt_vkms_device_create(__func__);
> +	igt_assert(dev);
> +
> +	igt_vkms_device_add_plane(dev, "plane0");
> +	igt_vkms_plane_set_type(dev, "plane0", DRM_PLANE_TYPE_PRIMARY);
> +	igt_assert_eq(igt_vkms_plane_get_type(dev, "plane0"),
> +		      DRM_PLANE_TYPE_PRIMARY);
> +
> +	snprintf(path, sizeof(path), "%s/planes/plane0/type", dev->path);

I am not a big fan of duplicating the path generation here and in 
igt_vkms_plane_set_type. But OTOH, I don't see how to do better, so:

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> +
> +	/* Test invalid values for "type" */
> +	for (int i = 0; i < ARRAY_SIZE(invalid_type_values); i++) {
> +		struct invalid_value v = invalid_type_values[i];
> +
> +		fd = open(path, O_WRONLY);
> +		igt_assert_f(fd >= 0, "Error opening '%s'\n", path);
> +
> +		ret = write(fd, v.value, v.size);
> +		igt_assert(ret <= 0);

As in a previous patch, can you add some information about the fail 
(value and path).

> +
> +		close(fd);
> +	}
> +
> +	igt_assert_eq(igt_vkms_plane_get_type(dev, "plane0"),
> +		      DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_vkms_device_destroy(dev);
> +}
> +
>   igt_main
>   {
>   	struct {
> @@ -233,6 +283,7 @@ igt_main
>   		{ "device-wrong-values", test_device_wrong_values },
>   		{ "plane-default-files", test_plane_default_files },
>   		{ "plane-default-values", test_plane_default_values },
> +		{ "plane-wrong-values", test_plane_wrong_values },
>   	};
>   
>   	igt_fixture {

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


