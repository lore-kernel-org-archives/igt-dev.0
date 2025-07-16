Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C93C83F1B
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 12:07:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C12510E27D;
	Wed, 16 Jul 2025 12:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Gc6v774A";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844DA10E27D
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 12:07:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CAE5143953;
 Wed, 16 Jul 2025 12:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752667632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gFsnb3SF5HtKrdEfub6VtSSTQiqSm66bPhPqGXLUcLU=;
 b=Gc6v774AlLQzHtoRydIAHPWOv/JI2gk0yBiPdHmvt3ckEjzYu+yyUKCVCh+gqNnMk/FPN4
 ch2Vp9/qxdNr6N4LP0Pu56pAP8ZvJ3KXZy1V8x3VCSFPbk5BBDNbHPc28LBpNy7SdwaO9o
 VOQ/5pTAjIYnAeUSmtJu5U7zCDWR1SBgHTfokuCDXfwHaWo8ZgdSxp7tfO9p4GghHiHAnt
 q7J2YOl27e+cblnMp2dumWwpSeRQKl5baw2iYbPRG8tDA5CQsdFi61kT5oxNpmyXZ4EJmX
 5LywYgBahzkICkE+OVJ2xC5vz9B5r+isMHlQqdkjVtiYZUR/6BZIfYNkrdnmEQ==
Message-ID: <121db9e8-78e7-4326-9bb9-39d263b4d7a7@bootlin.com>
Date: Wed, 16 Jul 2025 14:07:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 37/41] lib/vkms: Test changing enabled device
 planes
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com
References: <20250715102513.5636-1-jose.exposito89@gmail.com>
 <20250715102513.5636-38-jose.exposito89@gmail.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250715102513.5636-38-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehjeeiiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeeivedtfeegtdekheethedttddtfefhhfegjeeljeejleduvdfhudegvdekheevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhegnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhgthdqu
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



Le 15/07/2025 à 12:25, José Expósito a écrit :
> Test that, once a VKMS device is enabled, the plane values can't change
> and that deleting it or the attached CRTCs doesn't change the VKMS
> device.
> 
> Add a function that performs a basic validation checking that the
> device created matches the expected one.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Reviewed-by: louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   lib/igt_vkms.c             |  24 +++++++
>   lib/igt_vkms.h             |   1 +
>   tests/vkms/vkms_configfs.c | 143 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 168 insertions(+)
> 
> diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
> index ccc6910c4..96f13d628 100644
> --- a/lib/igt_vkms.c
> +++ b/lib/igt_vkms.c
> @@ -194,6 +194,18 @@ static void get_attach_dir_path(igt_vkms_t *dev, enum vkms_pipeline_item item,
>   	igt_assert(ret >= 0 && ret < len);
>   }
>   
> +static bool remove_pipeline_item(igt_vkms_t *dev, enum vkms_pipeline_item item,
> +				 const char *name)
> +{
> +	char path[PATH_MAX];
> +	int ret;
> +
> +	get_pipeline_item_path(dev, item, name, path, sizeof(path));
> +
> +	ret = rmdir(path);
> +	return ret == 0;
> +}
> +
>   static bool attach_pipeline_item(igt_vkms_t *dev,
>   				 enum vkms_pipeline_item src_item,
>   				 const char *src_item_name,
> @@ -699,6 +711,18 @@ void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name)
>   	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_PLANE, name);
>   }
>   
> +/**
> + * igt_vkms_device_remove_plane:
> + * @dev: Device to remove the plane from
> + * @name: Plane name
> + *
> + * Remove an existing plane from the VKMS device.
> + */
> +bool igt_vkms_device_remove_plane(igt_vkms_t *dev, const char *name)
> +{
> +	return remove_pipeline_item(dev, VKMS_PIPELINE_ITEM_PLANE, name);
> +}
> +
>   /**
>    * igt_vkms_plane_get_type:
>    * @dev: Device the plane belongs to
> diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
> index 1e077caa8..786db224e 100644
> --- a/lib/igt_vkms.h
> +++ b/lib/igt_vkms.h
> @@ -96,6 +96,7 @@ bool igt_vkms_device_is_enabled(igt_vkms_t *dev);
>   void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled);
>   
>   void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name);
> +bool igt_vkms_device_remove_plane(igt_vkms_t *dev, const char *name);
>   int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name);
>   void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type);
>   bool igt_vkms_plane_attach_crtc(igt_vkms_t *dev, const char *plane_name,
> diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
> index ad5d72481..11dea86ed 100644
> --- a/tests/vkms/vkms_configfs.c
> +++ b/tests/vkms/vkms_configfs.c
> @@ -132,6 +132,85 @@ static bool device_exists(const char *name)
>   	return find_device(name, &card);
>   }
>   
> +static void assert_device_config(igt_vkms_config_t *cfg)
> +{
> +	struct igt_device_card card;
> +	drmModeResPtr res;
> +	drmModePlaneResPtr plane_res;
> +	drmModeConnectorPtr connector_res;
> +	igt_vkms_crtc_config_t *crtc;
> +	igt_vkms_connector_config_t *connector;
> +	bool found;
> +	int n_planes = 0;
> +	int n_crtcs = 0;
> +	int n_encoders = 0;
> +	int n_connectors = 0;
> +	int n_connector_status_cfg[4] = {0};
> +	int n_connector_status_drm[4] = {0};
> +	int fd;
> +
> +	found = find_device(cfg->device_name, &card);
> +	igt_assert_f(found, "Device '%s' not found\n", cfg->device_name);
> +
> +	fd = igt_open_card(&card);
> +	igt_assert_f(fd >= 0, "Error opening device '%s' at path '%s'\n",
> +		     cfg->device_name, card.card);
> +	igt_assert_f(!drmSetClientCap(fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1),
> +		     "Error setting DRM_CLIENT_CAP_UNIVERSAL_PLANES\n");
> +	igt_assert_f(!drmSetClientCap(fd, DRM_CLIENT_CAP_ATOMIC, 1),
> +		     "Error setting DRM_CLIENT_CAP_ATOMIC\n");
> +	igt_assert_f(!drmSetClientCap(fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1),
> +		     "Error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
> +
> +	res = drmModeGetResources(fd);
> +	igt_assert_f(res, "Error getting resources\n");
> +	plane_res = drmModeGetPlaneResources(fd);
> +	igt_assert_f(plane_res, "Error getting plane resources\n");
> +
> +	for (int n = 0; (&cfg->planes[n])->name; n++)
> +		n_planes++;
> +
> +	for (int n = 0; (crtc = &cfg->crtcs[n])->name; n++) {
> +		n_crtcs++;
> +
> +		if (crtc->writeback) {
> +			n_encoders++;
> +			n_connectors++;
> +			n_connector_status_cfg[DRM_MODE_UNKNOWNCONNECTION]++;
> +		}
> +	}
> +
> +	for (int n = 0; (&cfg->encoders[n])->name; n++)
> +		n_encoders++;
> +
> +	for (int n = 0; (connector = &cfg->connectors[n])->name; n++) {
> +		n_connectors++;
> +		n_connector_status_cfg[connector->status]++;
> +	}
> +
> +	for (int n = 0; n < res->count_connectors; n++) {
> +		connector_res = drmModeGetConnectorCurrent(fd,
> +							   res->connectors[n]);
> +		n_connector_status_drm[connector_res->connection]++;
> +		drmModeFreeConnector(connector_res);
> +	}
> +
> +	igt_assert_eq(n_planes, plane_res->count_planes);
> +	igt_assert_eq(n_crtcs, res->count_crtcs);
> +	igt_assert_eq(n_encoders, res->count_encoders);
> +	igt_assert_eq(n_connectors, res->count_connectors);
> +	igt_assert_eq(n_connector_status_cfg[DRM_MODE_CONNECTED],
> +		      n_connector_status_drm[DRM_MODE_CONNECTED]);
> +	igt_assert_eq(n_connector_status_cfg[DRM_MODE_DISCONNECTED],
> +		      n_connector_status_drm[DRM_MODE_DISCONNECTED]);
> +	igt_assert_eq(n_connector_status_cfg[DRM_MODE_UNKNOWNCONNECTION],
> +		      n_connector_status_drm[DRM_MODE_UNKNOWNCONNECTION]);
> +
> +	drmModeFreePlaneResources(plane_res);
> +	drmModeFreeResources(res);
> +	close(fd);
> +}
> +
>   /**
>    * SUBTEST: device-default-files
>    * Description: Test that creating a VKMS device creates the default files and
> @@ -1493,6 +1572,69 @@ static void test_enable_too_many_connectors(void)
>   	igt_vkms_device_destroy(dev);
>   }
>   
> +/**
> + * SUBTEST: enabled-plane-cannot-change
> + * Description: Test that, once a VKMS device is enabled, the plane values can't
> + *              change and that deleting it or the attached CRTCs doesn't change
> + *              the VKMS device.
> + */
> +
> +static void test_enabled_plane_cannot_change(void)
> +{
> +	igt_vkms_t *dev;
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
> +			{ .name = "crtc0" },
> +			{ .name = "crtc1" },
> +		},
> +		.encoders = {
> +			{ .name = "encoder0", .possible_crtcs = { "crtc0" } },
> +			{ .name = "encoder1", .possible_crtcs = { "crtc1" } },
> +		},
> +		.connectors = {
> +			{
> +				.name = "connector0",
> +				.possible_encoders = { "encoder0", "encoder1" },
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
> +	/* Try to change values */
> +	igt_vkms_plane_set_type(dev, "plane0", DRM_PLANE_TYPE_OVERLAY);
> +	igt_assert_eq(igt_vkms_plane_get_type(dev, "plane0"),
> +		      DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_assert(!igt_vkms_plane_attach_crtc(dev, "plane0", "crtc1"));
> +
> +	/* Deleting pipeline items doesn't affect the device */
> +	igt_assert(igt_vkms_plane_detach_crtc(dev, "plane0", "crtc0"));
> +	igt_assert(igt_vkms_device_remove_plane(dev, "plane0"));
> +	assert_device_config(&cfg);
> +
> +	igt_vkms_device_destroy(dev);
> +}
> +
>   igt_main
>   {
>   	struct {
> @@ -1533,6 +1675,7 @@ igt_main
>   		{ "enable-crtc-no-encoder", test_enable_crtc_no_encoder },
>   		{ "enable-no-connectors", test_enable_no_connectors },
>   		{ "enable-too-many-connectors", test_enable_too_many_connectors },
> +		{ "enabled-plane-cannot-change", test_enabled_plane_cannot_change },
>   	};
>   
>   	igt_fixture {

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

