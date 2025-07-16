Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036A3C83F22
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 09:48:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A716D10E269;
	Wed, 16 Jul 2025 09:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="E/zLy6Sn";
	dkim-atps=neutral
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D4A10E269
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 09:48:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2046D41C7B;
 Wed, 16 Jul 2025 09:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752659296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YjIz5nBARuyRD9arR4EYRZlsf/tJw1MexYZzr8HtVig=;
 b=E/zLy6Sn0UYGQfd5uAkT0XRgx5/nU+BrMnLhxidLsih42clsSdk3TdiyBMw7RukmbNQk+U
 Q14RXZV6BDlMOvc92WRXpni2HXeYUyOhOElRB66bwZdbaOdQIk1S6z9OaamcEGmu2/cado
 x/LRcAd+zUEiM7dEDQGmiiHrlkidltfGuiti9aaTqmCVxwYFOHdZzhnv2+sUuVIHbF0+sF
 mTIjVKfsUX8Z/Y5cJpgCeGyNNLKhcKYbdhNnXnhXdLER39DrKJ8Iev+5tpn3LgqY8tLYBn
 mN/eLrJ004vAbQKe8kxemGhSspNDQAnGlJbWRySahIS3qnBMhTi3FBzToKAM3A==
Message-ID: <6b102d79-8ed8-4b53-b1f5-cb39fe76f5c2@bootlin.com>
Date: Wed, 16 Jul 2025 11:48:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 18/41] lib/vkms: Test attaching planes to CRTCs
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com
References: <20250715102513.5636-1-jose.exposito89@gmail.com>
 <20250715102513.5636-19-jose.exposito89@gmail.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250715102513.5636-19-jose.exposito89@gmail.com>
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
> Add helpers to attach and detach planes and CRTCs and a test checking
> the different valid and invalid cases.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   lib/igt_vkms.c             | 120 +++++++++++++++++++++++++++++++++++++
>   lib/igt_vkms.h             |   6 ++
>   tests/vkms/vkms_configfs.c |  78 ++++++++++++++++++++++++
>   3 files changed, 204 insertions(+)
> 
> diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
> index 1cd560038..ea18816e7 100644
> --- a/lib/igt_vkms.c
> +++ b/lib/igt_vkms.c
> @@ -163,6 +163,81 @@ static void add_pipeline_item(igt_vkms_t *dev, enum vkms_pipeline_item item,
>   		     path, errno, strerror(errno));
>   }
>   
> +static const char *get_attach_dir_name(enum vkms_pipeline_item item)
> +{
> +	switch (item) {
> +	case VKMS_PIPELINE_ITEM_PLANE:
> +		return "possible_crtcs";
> +	case VKMS_PIPELINE_ITEM_ENCODER:
> +		return "possible_crtcs";
> +	case VKMS_PIPELINE_ITEM_CONNECTOR:
> +		return "possible_encoders";
> +	default:
> +		break;
> +	}
> +
> +	igt_assert(!"Cannot be reached: Unknown VKMS attach directory name");
> +}
> +
> +static void get_attach_dir_path(igt_vkms_t *dev, enum vkms_pipeline_item item,
> +				const char *name, char *path, size_t len)
> +{
> +	const char *item_dir_name;
> +	const char *attach_dir_name;
> +	int ret;
> +
> +	item_dir_name = get_pipeline_item_dir_name(item);
> +	attach_dir_name = get_attach_dir_name(item);
> +
> +	ret = snprintf(path, len, "%s/%s/%s/%s", dev->path, item_dir_name, name,
> +		       attach_dir_name);
> +	igt_assert(ret >= 0 && ret < len);
> +}
> +
> +static bool attach_pipeline_item(igt_vkms_t *dev,
> +				 enum vkms_pipeline_item src_item,
> +				 const char *src_item_name,
> +				 enum vkms_pipeline_item dst_item,
> +				 const char *dst_item_name)
> +{
> +	char src_attach_path[PATH_MAX];
> +	char src_path[PATH_MAX];
> +	char dst_path[PATH_MAX];
> +	int ret;
> +
> +	get_attach_dir_path(dev, src_item, src_item_name, src_attach_path,
> +			    sizeof(src_attach_path));
> +	ret = snprintf(src_path, sizeof(src_path), "%s/%s", src_attach_path,
> +		       dst_item_name);
> +	igt_assert(ret >= 0 && ret < sizeof(src_path));
> +
> +	get_pipeline_item_path(dev, dst_item, dst_item_name, dst_path,
> +			       sizeof(dst_path));
> +
> +	ret = symlink(dst_path, src_path);
> +	return ret == 0;
> +}
> +
> +static bool detach_pipeline_item(igt_vkms_t *dev,
> +				 enum vkms_pipeline_item src_item,
> +				 const char *src_item_name,
> +				 const char *dst_item_name)
> +{
> +	char attach_path[PATH_MAX];
> +	char link_path[PATH_MAX];
> +	int ret;
> +
> +	get_attach_dir_path(dev, src_item, src_item_name, attach_path,
> +			    sizeof(attach_path));
> +
> +	ret = snprintf(link_path, sizeof(link_path), "%s/%s", attach_path,
> +		       dst_item_name);
> +	igt_assert(ret >= 0 && ret < sizeof(link_path));
> +
> +	ret = unlink(link_path);
> +	return ret == 0;
> +}
> +
>   /**
>    * igt_require_vkms_configfs:
>    *
> @@ -228,6 +303,21 @@ void igt_vkms_get_plane_type_path(igt_vkms_t *dev, const char *name, char *path,
>   				    VKMS_FILE_PLANE_TYPE, path, len);
>   }
>   
> +/**
> + * igt_vkms_get_plane_possible_crtcs_path:
> + * @dev: Device containing the plane
> + * @name: Plane name
> + * @path: Output path
> + * @len: Maximum @path length
> + *
> + * Returns the plane "possible_crtcs" directory path.
> + */
> +void igt_vkms_get_plane_possible_crtcs_path(igt_vkms_t *dev, const char *name,
> +					    char *path, size_t len)
> +{
> +	get_attach_dir_path(dev, VKMS_PIPELINE_ITEM_PLANE, name, path, len);
> +}
> +
>   /**
>    * igt_vkms_get_crtc_path:
>    * @dev: Device containing the CRTC
> @@ -529,6 +619,36 @@ void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type)
>   	write_int(path, type);
>   }
>   
> +/**
> + * igt_vkms_plane_attach_crtc:
> + * @dev: Target device
> + * @plane_name: Target plane name
> + * @crtc_name: Destination CRTC name
> + *
> + * Attach a plane to a CRTC. Return true on success and false on error.
> + */
> +bool igt_vkms_plane_attach_crtc(igt_vkms_t *dev, const char *plane_name,
> +				const char *crtc_name)
> +{
> +	return attach_pipeline_item(dev, VKMS_PIPELINE_ITEM_PLANE, plane_name,
> +				    VKMS_PIPELINE_ITEM_CRTC, crtc_name);
> +}
> +
> +/**
> + * igt_vkms_plane_detach_crtc:
> + * @dev: Target device
> + * @plane_name: Target plane name
> + * @crtc_name: Destination CRTC name
> + *
> + * Detach a plane from a CRTC. Return true on success and false on error.
> + */
> +bool igt_vkms_plane_detach_crtc(igt_vkms_t *dev, const char *plane_name,
> +				const char *crtc_name)
> +{
> +	return detach_pipeline_item(dev, VKMS_PIPELINE_ITEM_PLANE, plane_name,
> +				    crtc_name);
> +}
> +
>   /**
>    * igt_vkms_device_add_crtc:
>    * @dev: Device to add the CRTC to
> diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
> index df64bde9d..58896790b 100644
> --- a/lib/igt_vkms.h
> +++ b/lib/igt_vkms.h
> @@ -27,6 +27,8 @@ void igt_vkms_get_plane_path(igt_vkms_t *dev, const char *name, char *path,
>   			     size_t len);
>   void igt_vkms_get_plane_type_path(igt_vkms_t *dev, const char *name, char *path,
>   				  size_t len);
> +void igt_vkms_get_plane_possible_crtcs_path(igt_vkms_t *dev, const char *name,
> +					    char *path, size_t len);
>   void igt_vkms_get_crtc_path(igt_vkms_t *dev, const char *name, char *path,
>   			    size_t len);
>   void igt_vkms_get_crtc_writeback_path(igt_vkms_t *dev, const char *name,
> @@ -48,6 +50,10 @@ void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled);
>   void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name);
>   int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name);
>   void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type);
> +bool igt_vkms_plane_attach_crtc(igt_vkms_t *dev, const char *plane_name,
> +				const char *crtc_name);
> +bool igt_vkms_plane_detach_crtc(igt_vkms_t *dev, const char *plane_name,
> +				const char *crtc_name);
>   
>   void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name);
>   bool igt_vkms_crtc_is_writeback_enabled(igt_vkms_t *dev, const char *name);
> diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
> index 407310e52..5ee03ed2f 100644
> --- a/tests/vkms/vkms_configfs.c
> +++ b/tests/vkms/vkms_configfs.c
> @@ -103,6 +103,20 @@ static void assert_wrong_bool_values(const char *path)
>   	}
>   }
>   
> +static bool attach(const char *src_path, const char *dst_path,
> +		   const char *link_name)
> +{
> +	char link_path[PATH_MAX];
> +	int ret;
> +
> +	ret = snprintf(link_path, sizeof(link_path), "%s/%s", src_path, link_name);
> +	igt_assert(ret >= 0 && ret < sizeof(link_path));
> +
> +	ret = symlink(dst_path, link_path);
> +
> +	return ret == 0;
> +}
> +
>   /**
>    * SUBTEST: device-default-files
>    * Description: Test that creating a VKMS device creates the default files and
> @@ -565,6 +579,69 @@ static void test_connector_valid_values(void)
>   	igt_vkms_device_destroy(dev);
>   }
>   
> +/**
> + * SUBTEST: attach-plane-to-crtc
> + * Description: Check that errors are handled while attaching planes to CRTCs.
> + */
> +
> +static void test_attach_plane_to_crtc(void)
> +{
> +	igt_vkms_t *dev1;
> +	igt_vkms_t *dev2;
> +	char plane1[PATH_MAX];
> +	char crtc1[PATH_MAX];
> +	char connector1[PATH_MAX];
> +	char crtc2[PATH_MAX];
> +	char dev2_enabled_path[PATH_MAX];
> +	bool ok;
> +
> +	dev1 = igt_vkms_device_create("test_attach_plane_to_crtc_1");
> +	igt_assert(dev1);
> +
> +	dev2 = igt_vkms_device_create("test_attach_plane_to_crtc_2");
> +	igt_assert(dev2);
> +
> +	igt_vkms_device_add_plane(dev1, "plane1");
> +	igt_vkms_device_add_crtc(dev1, "crtc1");
> +	igt_vkms_device_add_connector(dev1, "connector1");
> +	igt_vkms_device_add_crtc(dev2, "crtc2");
> +
> +	igt_vkms_get_plane_possible_crtcs_path(dev1, "plane1", plane1, sizeof(plane1));
> +	igt_vkms_get_crtc_path(dev1, "crtc1", crtc1, sizeof(crtc1));
> +	igt_vkms_get_connector_path(dev1, "connector1", connector1, sizeof(connector1));
> +	igt_vkms_get_crtc_path(dev2, "crtc2", crtc2, sizeof(crtc2));
> +	igt_vkms_get_device_enabled_path(dev2, dev2_enabled_path, sizeof(dev2_enabled_path));
> +
> +	/* Error: Attach a plane to a connector */
> +	ok = attach(plane1, connector1, "connector");
> +	igt_assert_f(!ok, "Attaching plane1 to connector1 should fail\n");
> +
> +	/* Error: Attach a plane to a random file */
> +	ok = attach(plane1, dev2_enabled_path, "file");
> +	igt_assert_f(!ok, "Attaching plane1 to a random file should fail\n");
> +
> +	/* Error: Attach a plane to a CRTC from other device */
> +	ok = attach(plane1, crtc2, "crtc2");
> +	igt_assert_f(!ok, "Attaching plane1 to crtc2 should fail\n");
> +
> +	/* OK: Attaching plane1 to crtc1 */
> +	ok = igt_vkms_plane_attach_crtc(dev1, "plane1", "crtc1");
> +	igt_assert_f(ok, "Error attaching plane1 to crtc1\n");
> +
> +	/* Error: Attaching plane1 to crtc1 twice */
> +	ok = attach(plane1, crtc1, "crtc1_duplicated");
> +	igt_assert_f(!ok, "Error attaching plane1 to crtc1 twice should fail");
> +
> +	/* OK: Detaching and attaching again */
> +	ok = igt_vkms_plane_detach_crtc(dev1, "plane1", "crtc1");
> +	igt_assert_f(ok, "Error detaching plane1 from crtc1\n");
> +	ok = igt_vkms_plane_attach_crtc(dev1, "plane1", "crtc1");
> +	igt_assert_f(ok, "Error attaching plane1 to crtc1\n");
> +
> +	igt_vkms_device_destroy(dev1);
> +	igt_vkms_device_destroy(dev2);
> +}
> +
>   igt_main
>   {
>   	struct {
> @@ -587,6 +664,7 @@ igt_main
>   		{ "connector-default-values", test_connector_default_values },
>   		{ "connector-wrong-values", test_connector_wrong_values },
>   		{ "connector-valid-values", test_connector_valid_values },
> +		{ "attach-plane-to-crtc", test_attach_plane_to_crtc },
>   	};
>   
>   	igt_fixture {

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

