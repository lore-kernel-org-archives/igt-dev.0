Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A11C282C6
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 14:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A37910ECB6;
	Fri, 28 Feb 2025 14:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d0lv8DJK";
	dkim-atps=neutral
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5833F10EC68
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2025 11:52:08 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43b5859d1f1so12229495e9.3
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2025 03:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740743527; x=1741348327; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hX6W/tZ3o0ewPk6U5UW0/K9LHRkho+/x1GlWsFjLTws=;
 b=d0lv8DJKdZ0+/lMPuNtx16APuwks+FEXEEpm03uC68Q62AX1dIh+rvxDxBDJ1zdySl
 tn43f7Ghwy59bCwmKuhAlmKmJpDVTu0WURaI9MA59Bw48qHL6RRbOcLeQUBQJYX1kbtF
 Um/pjss9c0TssobzYJZNO0b8o2TY6U5okz/YCLZmWymmeTYdukciRsAEGgoND8Xq/ZE7
 sH4RMBNUMZNJCpYiGJ5xAlRbB88uJi84tMioWziq7zy3lJoDMCLL3pKiiHu0oocdy7xU
 y60lxtGQ428S5Rc6lXgssPssZgoYg7sOUlnfmn6X4JbMB4GtOlis6m1iF3Ldu0hjnAxX
 4CWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740743527; x=1741348327;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hX6W/tZ3o0ewPk6U5UW0/K9LHRkho+/x1GlWsFjLTws=;
 b=CMw2YgzTwrl02Xt5Mqk3Ij7VK83MVIDlduFUz/jBe07aDuVcXaCrAf3KtkS0/wh/bZ
 5a4db7yqoX+JCJSjO3fbrzZQ5cOZPYJ4wWxa9Rdeon0NEnIyOyHyJlg68Sc4OLYQu3ea
 G15nfUmGDxrtupbxyjCnERitdfmUl52A/lgLROxfMdLMXBJBHEXb4/plBxHkWzGr2fk8
 8b0KNASnJZ6xAVp3bP006nJ/4Dfu/pW3Ry3FDMRZcUmtEbM6isUpIroL8vgfNzaLiKnM
 VQXmDFnfWYSGGbUtEkokT/UpCG4QQp9PdrRf4D2E/S7i/j/arbj7VjqF76WiEw662f9l
 uevw==
X-Gm-Message-State: AOJu0YxwTtUXPfTqFp9yHbKHcrvVN+ZD7ekFpLRrO94VePa5qJC/Qei2
 tpGcWYKgo/BsT53HUNChznn7mE22+oeyci1nfUyVFbqNSQKRYMwX5bcYXCrI
X-Gm-Gg: ASbGnctSX6+WKtimpuROqA+bo2abtfQKmNbSgAxSm33QrFSpGTXdFDCGzZejQrl2JDj
 tps4Xzt5tx7zhNv+i9ty9iZqsPLO2Sp88OepHt3AHfwwWZt4/cdhNJPRWjp7Ns90FktjYeo5Kt2
 iFEsIsRikv2a6Tl2vxg9JpfzVgaW8zoR65BIFyXv4BmX3zK+lbxdvTqtdu8KyiSdsEV9cuD+BQo
 uvZvR3Kowj8XJsM2ConnvSpoNjwlxfhuUmUE2sUqkKHcBl7VaIUln1YIQ6JTBuK8fsesZ9kCKks
 H6Y08Kbiz8V7utWn+N/cJ5+2zw==
X-Google-Smtp-Source: AGHT+IEs00zyZNUvzfOxOdNNSDp3oIqqGLTUOVU1oT32Ol1iNDf3JEceHsPX4uTkG7Ip8MGCGqCs+w==
X-Received: by 2002:a05:600c:4ecf:b0:439:9386:ef6c with SMTP id
 5b1f17b1804b1-43ba66da22amr23648875e9.2.1740743526292; 
 Fri, 28 Feb 2025 03:52:06 -0800 (PST)
Received: from fedora ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5710ebsm89478825e9.26.2025.02.28.03.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 03:52:05 -0800 (PST)
Date: Fri, 28 Feb 2025 12:52:04 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 35/39] lib/vkms: Test changing enabled device planes
Message-ID: <Z8GjZNMrOujZkN8G@fedora>
References: <20250218165011.9123-1-jose.exposito89@gmail.com>
 <20250218165011.9123-36-jose.exposito89@gmail.com>
 <65677f97-dd40-48ef-bd64-ce8e468c0518@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65677f97-dd40-48ef-bd64-ce8e468c0518@bootlin.com>
X-Mailman-Approved-At: Fri, 28 Feb 2025 14:02:15 +0000
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

Hi Louis,

Thanks a lot for reviewing this series, there were a ton of
patches. I hope they were easy enough to understand :)

I won't have time to look into all of your reviews this week,
but I'll try to at least anwser to this one as I see you are
finding some test failures.

On Fri, Feb 28, 2025 at 09:51:47AM +0100, Louis Chauvet wrote:
> 
> 
> Le 18/02/2025 à 17:50, José Expósito a écrit :
> > Test that, once a VKMS device is enabled, the plane values can't change
> > and that deleting it or the attached CRTCs doesn't change the VKMS
> > device.
> > 
> > Add a function that performs a basic validation checking that the
> > device created matches the expected one.
> > 
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> 
> The next tests don't pass on my VM, can you share details on your setup?
> (kernel branch, architecture)

I'm testing on a QEMU VM (x86_64), using this kernel branch [1], which
is basically [2] + [3].

This is the script I'm using to run the IGT tests:

  $ meson setup build ; ninja -C build && \
     ssh -p 2222 jose@127.0.0.1 -t \
            'cd shared/igt-gpu-tools && \
            sudo modprobe vkms && \
            sudo systemctl isolate multi-user.target && \
            sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" \
                ./build/tests/vkms/vkms_configfs ; \            
            sudo systemctl isolate graphical.target'

Basically, I build in the host and run on the VM by sharing the code
and builds in "shared/igt-gpu-tools" inside the VM.

[1] https://github.com/JoseExposito/linux/tree/patch-vkms-configfs
[2] https://lore.kernel.org/all/20250218101214.5790-1-jose.exposito89@gmail.com/
[3] https://lore.kernel.org/dri-devel/20250225175936.7223-1-jose.exposito89@gmail.com/T/

> > ---
> >   lib/igt_vkms.c             |  27 +++++++
> >   lib/igt_vkms.h             |   1 +
> >   tests/vkms/vkms_configfs.c | 147 +++++++++++++++++++++++++++++++++++++
> >   3 files changed, 175 insertions(+)
> > 
> > diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
> > index 4c44efec9..3dab7a823 100644
> > --- a/lib/igt_vkms.c
> > +++ b/lib/igt_vkms.c
> > [...]
> > +static void assert_device_config(igt_vkms_config_t *cfg)
> > +{
> > +	drmDevicePtr devices[64];
> > +	drmDevicePtr dev;
> > +	drmModeResPtr res;
> > +	drmModePlaneResPtr plane_res;
> > +	drmModeConnectorPtr connector_res;
> > +	igt_vkms_crtc_config_t *crtc;
> > +	igt_vkms_connector_config_t *connector;
> > +	int n_devices;
> > +	int n_planes = 0;
> > +	int n_crtcs = 0;
> > +	int n_encoders = 0;
> > +	int n_connectors = 0;
> > +	int n_connector_status_cfg[4] = {0};
> > +	int n_connector_status_drm[4] = {0};
> > +	int fd;
> > +
> > +	n_devices = drmGetDevices(devices, ARRAY_SIZE(devices));
> > +
> > +	dev = find_device(cfg->device_name, devices, n_devices);
> > +	igt_assert_f(dev, "Device '%s' not found\n", cfg->device_name);
> > +
> > +	fd = open(dev->nodes[DRM_NODE_PRIMARY], O_RDONLY);
> > +	igt_assert_f(fd >= 0, "Error opening device '%s' at path '%s'\n",
> > +		     cfg->device_name, dev->nodes[DRM_NODE_PRIMARY]);
> > +	igt_assert_f(!drmSetClientCap(fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1),
> > +		     "Error setting DRM_CLIENT_CAP_UNIVERSAL_PLANES\n");
> > +	igt_assert_f(!drmSetClientCap(fd, DRM_CLIENT_CAP_ATOMIC, 1),
> > +		     "Error setting DRM_CLIENT_CAP_ATOMIC\n");
> > +	igt_assert_f(!drmSetClientCap(fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1),
> > +		     "Error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
> > +
> > +	res = drmModeGetResources(fd);
> > +	igt_assert_f(res, "Error getting resources\n");
> > +	plane_res = drmModeGetPlaneResources(fd);
> > +	igt_assert_f(plane_res, "Error getting plane resources\n");
> > +
> > +	for (int n = 0; (&cfg->planes[n])->name; n++)
> > +		n_planes++;
> > +
> > +	for (int n = 0; (crtc = &cfg->crtcs[n])->name; n++) {
> > +		n_crtcs++;
> > +
> > +		if (crtc->writeback) {
> > +			n_encoders++;
> > +			n_connectors++;
> > +			n_connector_status_cfg[DRM_MODE_UNKNOWNCONNECTION]++;

I wonder why this is not working for you.

I see in your comment in 39/39 that you are not getting the right numner
of connectors when "crtc->writeback == true", but I'm adding them here.

Could add a log and check if this is actually the problem, please?

Best wishes,
Jose

> > +		}
> > +	}
> > +
> > +	for (int n = 0; (&cfg->encoders[n])->name; n++)
> > +		n_encoders++;
> > +
> > +	for (int n = 0; (connector = &cfg->connectors[n])->name; n++) {
> > +		n_connectors++;
> > +		n_connector_status_cfg[connector->status]++;
> > +	}
> > +
> > +	for (int n = 0; n < res->count_connectors; n++) {
> > +		connector_res = drmModeGetConnectorCurrent(fd,
> > +							   res->connectors[n]);
> > +		n_connector_status_drm[connector_res->connection]++;
> > +		drmModeFreeConnector(connector_res);
> > +	}
> 
> I think the main issue here is something I already observed: you need to
> force probe the connector status (and in this test you really want to do
> it), so you should use `drmModeGetConnector`.
> 
> I just tested, it seems to work, except for the last test about connector
> hotplug (see my review).
> 
> > +
> > +	igt_assert_eq(n_planes, plane_res->count_planes);
> > +	igt_assert_eq(n_crtcs, res->count_crtcs);
> > +	igt_assert_eq(n_encoders, res->count_encoders);
> > +	igt_assert_eq(n_connectors, res->count_connectors);
> > +	igt_assert_eq(n_connector_status_cfg[DRM_MODE_CONNECTED],
> > +		      n_connector_status_drm[DRM_MODE_CONNECTED]);
> > +	igt_assert_eq(n_connector_status_cfg[DRM_MODE_DISCONNECTED],
> > +		      n_connector_status_drm[DRM_MODE_DISCONNECTED]);
> > +	igt_assert_eq(n_connector_status_cfg[DRM_MODE_UNKNOWNCONNECTION],
> > +		      n_connector_status_drm[DRM_MODE_UNKNOWNCONNECTION]);
> 
> ^ Fails on those asserts
> 
> > +
> > +	drmModeFreePlaneResources(plane_res);
> > +	drmModeFreeResources(res);
> > +	close(fd);
> > +	drmFreeDevices(devices, n_devices);
> > +}
> > +
> >   /**
> >    * SUBTEST: device-default-files
> >    * Description: Test that creating a VKMS device creates the default files and
> > @@ -1414,6 +1497,69 @@ static void test_enable_too_many_connectors(void)
> >   	igt_vkms_device_destroy(dev);
> >   }
> > +/**
> > + * SUBTEST: enabled-plane-cannot-change
> > + * Description: Test that, once a VKMS device is enabled, the plane values can't
> > + *              change and that deleting it or the attached CRTCs doesn't change
> > + *              the VKMS device.
> > + */
> > +
> > +static void test_enabled_plane_cannot_change(void)
> > +{
> > +	igt_vkms_t *dev;
> > +
> > +	igt_vkms_config_t cfg = {
> > +		.device_name = __func__,
> > +		.planes = {
> > +			{
> > +				.name = "plane0",
> > +				.type = DRM_PLANE_TYPE_PRIMARY,
> > +				.possible_crtcs = { "crtc0"},
> > +			},
> > +			{
> > +				.name = "plane1",
> > +				.type = DRM_PLANE_TYPE_PRIMARY,
> > +				.possible_crtcs = { "crtc1"},
> > +			},
> > +		},
> > +		.crtcs = {
> > +			{ .name = "crtc0" },
> > +			{ .name = "crtc1" },
> > +		},
> > +		.encoders = {
> > +			{ .name = "encoder0", .possible_crtcs = { "crtc0" } },
> > +			{ .name = "encoder1", .possible_crtcs = { "crtc1" } },
> > +		},
> > +		.connectors = {
> > +			{
> > +				.name = "connector0",
> > +				.possible_encoders = { "encoder0", "encoder1" },
> > +			},
> > +		},
> > +	};
> > +
> > +	dev = igt_vkms_device_create_from_config(&cfg);
> > +	igt_assert(dev);
> > +
> > +	igt_vkms_device_set_enabled(dev, true);
> > +	igt_assert(igt_vkms_device_is_enabled(dev));
> > +	assert_device_config(&cfg);
> > +
> > +	/* Try to change values */
> > +	igt_vkms_plane_set_type(dev, "plane0", DRM_PLANE_TYPE_OVERLAY);
> > +	igt_assert_eq(igt_vkms_plane_get_type(dev, "plane0"),
> > +		      DRM_PLANE_TYPE_PRIMARY);
> > +
> > +	igt_assert(!igt_vkms_plane_attach_crtc(dev, "plane0", "crtc1"));
> > +
> > +	/* Deleting pipeline items doesn't affect the device */
> > +	igt_assert(igt_vkms_plane_detach_crtc(dev, "plane0", "crtc0"));
> > +	igt_assert(igt_vkms_device_remove_plane(dev, "plane0"));
> > +	assert_device_config(&cfg);
> > +
> > +	igt_vkms_device_destroy(dev);
> > +}
> > +
> >   igt_main
> >   {
> >   	struct {
> > @@ -1451,6 +1597,7 @@ igt_main
> >   		{ "enable-crtc-no-encoder", test_enable_crtc_no_encoder },
> >   		{ "enable-no-connectors", test_enable_no_connectors },
> >   		{ "enable-too-many-connectors", test_enable_too_many_connectors },
> > +		{ "enabled-plane-cannot-change", test_enabled_plane_cannot_change },
> >   	};
> >   	igt_fixture {
> 
> -- 
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
> 
