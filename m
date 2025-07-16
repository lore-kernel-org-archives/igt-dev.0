Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE46C83F27
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 09:58:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF5F10E77A;
	Wed, 16 Jul 2025 09:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="a6IPGLbG";
	dkim-atps=neutral
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE68D10E778
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 09:58:11 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 3C4FC587887
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 09:22:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 560F7438CE;
 Wed, 16 Jul 2025 09:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752657764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MA5wYYQ+VIsIDO7elIBNaW43ZJ67eUIFcgZce/X2XTE=;
 b=a6IPGLbGoxeDk2FTz/GduE4ysotSwqNAIKjQ4u+6M6GM81z4Sa3LZh1h9RjE7Fr94pf6oV
 HzMSMd/4brE+iMIuWHwYxHt95r0VYf/W51yCXwB9KDY6ktsmcknMc4z0TKP6UghX5d81Qb
 kS1GPSmpJYp+hwOhnkE4PTJjkIpTSY2gD71LOUo7LEfGkRJlSHoUFnT5Ak43ZcQGNCAoET
 WdbMmevXvBxvgvpiov6HZ+vYZyhmrXXLKvQmP7bj6kqGzIpzhe3mvTA0Y+udYf+Jqm6KSe
 kotz/EO7LJQTDSmtdkZLBuRKu1JX2SNzEwtVYYLvd9mHHed7nQsjAsYT4oi5fA==
Message-ID: <abb7eb30-23e5-48dc-af3d-c36434eed713@bootlin.com>
Date: Wed, 16 Jul 2025 11:22:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 05/41] lib/vkms: Test plane default files
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com
References: <20250715102513.5636-1-jose.exposito89@gmail.com>
 <20250715102513.5636-6-jose.exposito89@gmail.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250715102513.5636-6-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehjeefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeeivedtfeegtdekheethedttddtfefhhfegjeeljeejleduvdfhudegvdekheevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhegnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhgthdqu
 ggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopeiisghighhnihgvfidrkhgvmhhptgiihihnshhkihesihhnthgvlhdrtghomh
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
> Add a helper to create a plane and a test checking that the default
> files and directories are created.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>   lib/igt_vkms.c             | 76 ++++++++++++++++++++++++++++++++++++++
>   lib/igt_vkms.h             |  4 ++
>   tests/vkms/vkms_configfs.c | 33 +++++++++++++++++
>   3 files changed, 113 insertions(+)
> 
> diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
> index 1fd00afd7..1f90e1569 100644
> --- a/lib/igt_vkms.c
> +++ b/lib/igt_vkms.c
> @@ -24,6 +24,13 @@
>   #define VKMS_ROOT_DIR_NAME		"vkms"
>   #define VKMS_FILE_ENABLED		"enabled"
>   
> +enum vkms_pipeline_item {
> +	VKMS_PIPELINE_ITEM_PLANE,
> +	VKMS_PIPELINE_ITEM_CRTC,
> +	VKMS_PIPELINE_ITEM_ENCODER,
> +	VKMS_PIPELINE_ITEM_CONNECTOR,
> +};

Sames as 02/41 can you rename pipeline to something else?
With this modification:
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> +
>   /**
>    * SECTION:igt_vkms
>    * @short_description: Helpers to create and configure VKMS devices
> @@ -97,6 +104,48 @@ static void write_bool(const char *path, bool value)
>   	write_int(path, value ? 1 : 0);
>   }
>   
> +static const char *get_pipeline_item_dir_name(enum vkms_pipeline_item item)
> +{
> +	switch (item) {
> +	case VKMS_PIPELINE_ITEM_PLANE:
> +		return "planes";
> +	case VKMS_PIPELINE_ITEM_CRTC:
> +		return "crtcs";
> +	case VKMS_PIPELINE_ITEM_ENCODER:
> +		return "encoders";
> +	case VKMS_PIPELINE_ITEM_CONNECTOR:
> +		return "connectors";
> +	}
> +
> +	igt_assert(!"Cannot be reached: Unknown VKMS pipeline item type");
> +}
> +
> +static void get_pipeline_item_path(igt_vkms_t *dev,
> +				   enum vkms_pipeline_item item,
> +				   const char *name, char *path, size_t len)
> +{
> +	const char *item_dir_name;
> +	int ret;
> +
> +	item_dir_name = get_pipeline_item_dir_name(item);
> +	ret = snprintf(path, len, "%s/%s/%s", dev->path, item_dir_name, name);
> +	igt_assert(ret >= 0 && ret < len);
> +}
> +
> +static void add_pipeline_item(igt_vkms_t *dev, enum vkms_pipeline_item item,
> +			      const char *name)
> +{
> +	char path[PATH_MAX];
> +	int ret;
> +
> +	get_pipeline_item_path(dev, item, name, path, sizeof(path));
> +
> +	ret = mkdir(path, 0777);
> +	igt_assert_f(ret == 0,
> +		     "Unable to mkdir directory '%s'. Got errno=%d (%s)\n",
> +		     path, errno, strerror(errno));
> +}
> +
>   /**
>    * igt_require_vkms_configfs:
>    *
> @@ -131,6 +180,21 @@ void igt_vkms_get_device_enabled_path(igt_vkms_t *dev, char *path, size_t len)
>   	igt_assert(ret >= 0 && ret < len);
>   }
>   
> +/**
> + * igt_vkms_get_plane_path:
> + * @dev: Device containing the plane
> + * @name: Plane name
> + * @path: Output path
> + * @len: Maximum @path length
> + *
> + * Returns the plane path.
> + */
> +void igt_vkms_get_plane_path(igt_vkms_t *dev, const char *name, char *path,
> +			     size_t len)
> +{
> +	get_pipeline_item_path(dev, VKMS_PIPELINE_ITEM_PLANE, name, path, len);
> +}
> +
>   /**
>    * igt_vkms_device_create:
>    * @name: VKMS device name
> @@ -303,3 +367,15 @@ void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled)
>   
>   	write_bool(path, enabled);
>   }
> +
> +/**
> + * igt_vkms_device_add_plane:
> + * @dev: Device to add the plane to
> + * @name: Plane name
> + *
> + * Add a new plane to the VKMS device.
> + */
> +void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name)
> +{
> +	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_PLANE, name);
> +}
> diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
> index d3741b6ee..9062cc42f 100644
> --- a/lib/igt_vkms.h
> +++ b/lib/igt_vkms.h
> @@ -23,6 +23,8 @@ typedef struct igt_vkms {
>   void igt_require_vkms_configfs(void);
>   
>   void igt_vkms_get_device_enabled_path(igt_vkms_t *dev, char *path, size_t len);
> +void igt_vkms_get_plane_path(igt_vkms_t *dev, const char *name, char *path,
> +			     size_t len);
>   
>   igt_vkms_t *igt_vkms_device_create(const char *name);
>   void igt_vkms_device_destroy(igt_vkms_t *dev);
> @@ -31,4 +33,6 @@ void igt_vkms_destroy_all_devices(void);
>   bool igt_vkms_device_is_enabled(igt_vkms_t *dev);
>   void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled);
>   
> +void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name);
> +
>   #endif /* __IGT_VKMS_H__ */
> diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
> index 16e5f6725..1ac85d8f9 100644
> --- a/tests/vkms/vkms_configfs.c
> +++ b/tests/vkms/vkms_configfs.c
> @@ -179,6 +179,38 @@ static void test_device_wrong_values(void)
>   	igt_vkms_device_destroy(dev);
>   }
>   
> +/**
> + * SUBTEST: plane-default-files
> + * Description: Test that creating a plane creates the default files and
> + *              directories.
> + */
> +
> +static void test_plane_default_files(void)
> +{
> +	igt_vkms_t *dev;
> +	char path[PATH_MAX];
> +
> +	const char *files[] = {
> +		"type",
> +	};
> +
> +	const char *dirs[] = {
> +		"possible_crtcs",
> +	};
> +
> +	dev = igt_vkms_device_create(__func__);
> +	igt_assert(dev);
> +
> +	igt_vkms_device_add_plane(dev, "plane0");
> +	igt_vkms_get_plane_path(dev, "plane0", path, sizeof(path));
> +
> +	assert_default_files(path,
> +			     files, ARRAY_SIZE(files),
> +			     dirs, ARRAY_SIZE(dirs));
> +
> +	igt_vkms_device_destroy(dev);
> +}
> +
>   igt_main
>   {
>   	struct {
> @@ -188,6 +220,7 @@ igt_main
>   		{ "device-default-files", test_device_default_files },
>   		{ "device-default-values", test_device_default_values },
>   		{ "device-wrong-values", test_device_wrong_values },
> +		{ "plane-default-files", test_plane_default_files },
>   	};
>   
>   	igt_fixture {

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

