Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B61BC282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3AF10E214;
	Thu, 13 Mar 2025 17:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lgm5kDE2";
	dkim-atps=neutral
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1CA10E214
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:23:49 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-38f403edb4eso731870f8f.3
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741886628; x=1742491428; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZoYrhfLDyQp0D93A201I9s49VIq5wbGvqLWu3Z3Idz8=;
 b=Lgm5kDE2fvalg+UnjYTPUwic1pTVi7uEeHgAMpRZq+CVuhCLp/Ly0GCufWzeoOOiR1
 cL1luBaA50YGrGoN9ulJ2DZpCn+LsXlqbYU8nPy6ce+hmm6XeKHyyZ0lGWZQ+A22yLYw
 ArJ+D4tW5gPoaG9XNCcJTYCFQaKMXJ8pw4XBBJs82vkay8KPihP402vS509aGWNJWCP6
 I/ozYqexRuAfrHFhMl998TCcwwK7VitnYgF88pZ0jbnaSyn662/CxAEfLMsHMQJAf7yi
 xrFyGU7hXaH2ZK1hE+KvurXHeg4949dBKVKzBJi+2vO+IH5HZaVlFEZiIaT3r2IdUKgZ
 dwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741886628; x=1742491428;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZoYrhfLDyQp0D93A201I9s49VIq5wbGvqLWu3Z3Idz8=;
 b=RaE2KnxcEcPOX5KzhX1KuA3XNSsCrof4ZyQZ4MXARC7A4w7RkXj1LgN72d7DIE39+h
 PI1j90B4IrNJrjaD8JS+hb3Zhgwg3BOC5+ZfeQL0XtlTIZEyoY8SO5xikIHBwvzJU39d
 g0qYuEHjB10tUxTMppGcyciui4qSxnW+QuRmOowjAWHvaPVAqX9ywocSTnUQPidluekw
 GN8W+7zb5P9cLvIe2AaznGtDSh1R/yFhP0fuZuSPEEk+jFbLqU+l1kHrYOJDde2lfvr0
 v6y4HtPTkCfz7D0IGRTWRn0SC702pPDSGNtei5daIokGwOPCL1nF69TCFOxoA2kvPujV
 an8A==
X-Gm-Message-State: AOJu0Yx3IZ8uhzAE4Pq+j3pD/3yri2U+YXgSc/T/FSegyQKOTf9UaU8Z
 VwPNWeXpB02rih75hnHZ6yJ4DvTZeG8qz/VOsNa+WYaN6jF3H9Tk
X-Gm-Gg: ASbGnctI4VssumrT4aeLi+Spo6S9B4sfJZD+Qkt4hEhotl9z+G8o1vEq65/qIp/njyi
 KbcR6Qlva365FDK9jv+EiLuTHnyDeJP5kHLMUSK0pGfDd4zW3JWgN0yBSnmqtkDHhF8yPfjaPhM
 L4wukrAZpPRczNQtm8t8LNEfQWac81GK/sfAgm++uSYUIYfrg5aMMAZO11BSb8JM6buqQVuWa+7
 UP4668FLku0Mfa0zK+zLQX9vqi+W2VVeGfp2+q1Kc3eLno+EdoVSLc+VvbB0Zi3o+bpXfpbmq+7
 LNv1FtsRJUX0196dFh9NQYu+5DZWh1421wDYe6tPQg==
X-Google-Smtp-Source: AGHT+IHx9Gd83kXErYyHYvGKCyuf7ZwwIS77r+6l5wtQLgbKApSSWbv2VfcDy3acpz7hC732ipAtsA==
X-Received: by 2002:a5d:5f4c:0:b0:391:4608:e7be with SMTP id
 ffacd0b85a97d-396c193fda3mr462398f8f.14.1741886627671; 
 Thu, 13 Mar 2025 10:23:47 -0700 (PDT)
Received: from fedora ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6a27sm2795994f8f.31.2025.03.13.10.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:23:47 -0700 (PDT)
Date: Thu, 13 Mar 2025 18:23:45 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 17/39] lib/vkms: Test attaching planes to CRTCs
Message-ID: <Z9MUoeXikUMyfyuw@fedora>
References: <20250218165011.9123-1-jose.exposito89@gmail.com>
 <20250218165011.9123-18-jose.exposito89@gmail.com>
 <afb75323-b874-470d-b059-ad500ad1008a@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afb75323-b874-470d-b059-ad500ad1008a@bootlin.com>
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

On Thu, Feb 27, 2025 at 02:15:01PM +0100, Louis Chauvet wrote:
> 
> 
> Le 18/02/2025 à 17:49, José Expósito a écrit :
> > Add helpers to attach and detach planes and CRTCs and a test checking
> > the different valid and invalid cases.
> > 
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > ---
> >   lib/igt_vkms.c             | 91 ++++++++++++++++++++++++++++++++++++++
> >   lib/igt_vkms.h             |  4 ++
> >   tests/vkms/vkms_configfs.c | 81 +++++++++++++++++++++++++++++++++
> >   3 files changed, 176 insertions(+)
> > 
> > diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
> > index f5e193a1c..147234e5b 100644
> > --- a/lib/igt_vkms.c
> > +++ b/lib/igt_vkms.c
> > @@ -119,6 +119,22 @@ static const char *get_pipeline_item_dir_name(enum vkms_pipeline_item item)
> >   	igt_assert(!"Cannot be reached: Unknown VKMS pipeline item type");
> >   }
> > +static const char *get_attach_dir_name(enum vkms_pipeline_item item)
> > +{
> > +	switch (item) {
> > +	case VKMS_PIPELINE_ITEM_PLANE:
> > +		return "possible_crtcs";
> > +	case VKMS_PIPELINE_ITEM_ENCODER:
> > +		return "possible_crtcs";
> > +	case VKMS_PIPELINE_ITEM_CONNECTOR:
> > +		return "possible_encoders";
> > +	default:
> > +		break;
> > +	}
> > +
> > +	igt_assert(!"Cannot be reached: Unknown VKMS attach directory name");
> > +}
> > +
> >   static void add_pipeline_item(igt_vkms_t *dev, enum vkms_pipeline_item item,
> >   			      const char *name)
> >   {
> > @@ -136,6 +152,51 @@ static void add_pipeline_item(igt_vkms_t *dev, enum vkms_pipeline_item item,
> >   		     path, errno, strerror(errno));
> >   }
> > +static bool attach_pipeline_item(igt_vkms_t *dev,
> > +				 enum vkms_pipeline_item src_item,
> > +				 const char *src_item_name,
> > +				 enum vkms_pipeline_item dst_item,
> > +				 const char *dst_item_name)
> > +{
> > +	char src_path[PATH_MAX];
> > +	char dst_path[PATH_MAX];
> > +	const char *src_dir_name;
> > +	const char *attach_dir_name;
> > +	const char *dst_dir_name;
> > +	int ret;
> > +
> > +	src_dir_name = get_pipeline_item_dir_name(src_item);
> > +	attach_dir_name = get_attach_dir_name(src_item);
> > +	snprintf(src_path, sizeof(src_path), "%s/%s/%s/%s/%s", dev->path,
> > +		 src_dir_name, src_item_name, attach_dir_name, dst_item_name);
> 
> The more I read those functions, the more I think my proposition of having
> full path for pipeline item is better than having only its name.
> 
> Or maybe, to avoid the duplication a macro could help:
> 
> 	#define ITEM_FMT "%s/%s/%s"
> 	#define ITEM_ARGS(dev, src_item, src_item_name) (dev),
> get_pipeline_item_dir_name((src_item)), (src_item_name)
> 
> I don't see major drawbacks for both of my proposition, so take what you
> think is better.
> 
> > +
> > +	dst_dir_name = get_pipeline_item_dir_name(dst_item);
> > +	snprintf(dst_path, sizeof(dst_path), "%s/%s/%s", dev->path,
> > +		 dst_dir_name, dst_item_name);
> > +
> > +	ret = symlink(dst_path, src_path);
> > +	return ret == 0;
> 
> Why this function has a return value? For all the other igt_vkms_device_*
> functions, they return void, and do assertions to stop the test if it fails.

Attaching or detaching pipeline items can fail and I want to be able to test
both the success and the error cases from the tests.

While, it is true that this is not consistent with "igt_vkms_device_add_*()"
functions, adding new pipeline items is not expected to fail and returning a
boolean would add a bunch of additional assertions in the tests for no real
gain.

Jose

> > +}
> > +
> > +static bool detach_pipeline_item(igt_vkms_t *dev,
> > +				 enum vkms_pipeline_item src_item,
> > +				 const char *src_item_name,
> > +				 const char *dst_item_name)
> > +{
> > +	char link_path[PATH_MAX];
> > +	const char *src_dir_name;
> > +	const char *attach_dir_name;
> > +	int ret;
> > +
> > +	src_dir_name = get_pipeline_item_dir_name(src_item);
> > +	attach_dir_name = get_attach_dir_name(src_item);
> > +	snprintf(link_path, sizeof(link_path), "%s/%s/%s/%s/%s", dev->path,
> > +		 src_dir_name, src_item_name, attach_dir_name, dst_item_name);
> > +
> > +	ret = unlink(link_path);
> > +	return ret == 0;
> > +}
> > +
> >   /**
> >    * igt_require_vkms_configfs:
> >    *
> > @@ -368,6 +429,36 @@ void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type)
> >   	write_int(path, type);
> >   }
> > +/**
> > + * igt_vkms_plane_attach_crtc:
> > + * @dev: Target device
> > + * @plane_name: Target plane name
> > + * @crtc_name: Destination CRTC name
> > + *
> > + * Attach a plane to a CRTC. Return true on success and false on error.
> > + */
> > +bool igt_vkms_plane_attach_crtc(igt_vkms_t *dev, const char *plane_name,
> > +				const char *crtc_name)
> > +{
> > +	return attach_pipeline_item(dev, VKMS_PIPELINE_ITEM_PLANE, plane_name,
> > +				    VKMS_PIPELINE_ITEM_CRTC, crtc_name);
> > +}
> > +
> > +/**
> > + * igt_vkms_plane_detach_crtc:
> > + * @dev: Target device
> > + * @plane_name: Target plane name
> > + * @crtc_name: Destination CRTC name
> > + *
> > + * Detach a plane from a CRTC. Return true on success and false on error.
> > + */
> > +bool igt_vkms_plane_detach_crtc(igt_vkms_t *dev, const char *plane_name,
> > +				const char *crtc_name)
> > +{
> > +	return detach_pipeline_item(dev, VKMS_PIPELINE_ITEM_PLANE, plane_name,
> > +				    crtc_name);
> > +}
> > +
> >   /**
> >    * igt_vkms_device_add_crtc:
> >    * @dev: Device to add the CRTC to
> > diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
> > index 50f42aa4b..fc8db268b 100644
> > --- a/lib/igt_vkms.h
> > +++ b/lib/igt_vkms.h
> > @@ -32,6 +32,10 @@ void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled);
> >   void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name);
> >   int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name);
> >   void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type);
> > +bool igt_vkms_plane_attach_crtc(igt_vkms_t *dev, const char *plane_name,
> > +				const char *crtc_name);
> > +bool igt_vkms_plane_detach_crtc(igt_vkms_t *dev, const char *plane_name,
> > +				const char *crtc_name);
> >   void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name);
> >   bool igt_vkms_crtc_is_writeback_enabled(igt_vkms_t *dev, const char *name);
> > diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
> > index ea84d9f82..e1572d65f 100644
> > --- a/tests/vkms/vkms_configfs.c
> > +++ b/tests/vkms/vkms_configfs.c
> > @@ -94,6 +94,20 @@ static void assert_wrong_bool_values(const char *path)
> >   	}
> >   }
> > +static bool attach(const char *src_path, const char *dst_path,
> > +		   const char *link_name)
> > +{
> > +	char link_path[PATH_MAX];
> > +	int ret;
> > +
> > +	ret = snprintf(link_path, sizeof(link_path), "%s/%s", src_path, link_name);
> > +	igt_assert(ret >= 0 && ret < sizeof(link_path));
> > +
> > +	ret = symlink(dst_path, link_path);
> > +
> > +	return ret == 0;
> > +}
> > +
> >   /**
> >    * SUBTEST: device-default-files
> >    * Description: Test that creating a VKMS device creates the default files and
> > @@ -476,6 +490,72 @@ static void test_connector_wrong_values(void)
> >   	igt_vkms_device_destroy(dev);
> >   }
> > +/**
> > + * SUBTEST: attach-plane-to-crtc
> > + * Description: Check that errors are handled while attaching planes to CRTCs.
> > + */
> > +
> > +static void test_attach_plane_to_crtc(void)
> > +{
> > +	igt_vkms_t *dev1;
> > +	igt_vkms_t *dev2;
> > +	char plane1[PATH_MAX];
> > +	char crtc1[PATH_MAX];
> > +	char connector1[PATH_MAX];
> > +	char crtc2[PATH_MAX];
> > +	char dev2_enabled_path[PATH_MAX];
> > +	bool ok;
> > +
> > +	dev1 = igt_vkms_device_create("test_attach_plane_to_crtc_1");
> > +	igt_assert(dev1);
> > +
> > +	dev2 = igt_vkms_device_create("test_attach_plane_to_crtc_2");
> > +	igt_assert(dev2);
> > +
> > +	igt_vkms_device_add_plane(dev1, "plane1");
> > +	igt_vkms_device_add_crtc(dev1, "crtc1");
> > +	igt_vkms_device_add_connector(dev1, "connector1");
> > +	igt_vkms_device_add_crtc(dev2, "crtc2");
> > +
> > +	snprintf(plane1, sizeof(plane1), "%s/planes/plane1/possible_crtcs",
> > +		 dev1->path);
> > +	snprintf(crtc1, sizeof(crtc1), "%s/crtcs/crtc1", dev1->path);
> > +	snprintf(connector1, sizeof(connector1), "%s/connectors/connector1",
> > +		 dev1->path);
> > +	snprintf(crtc2, sizeof(crtc2), "%s/crtcs/crtc2", dev2->path);
> > +	snprintf(dev2_enabled_path, sizeof(dev2_enabled_path), "%s/enabled",
> > +		 dev2->path);
> > +
> > +	/* Error: Attach a plane to a connector */
> > +	ok = attach(plane1, connector1, "connector");
> > +	igt_assert_f(!ok, "Attaching plane1 to connector1 should fail\n");
> > +
> > +	/* Error: Attach a plane to a random file */
> > +	ok = attach(plane1, dev2_enabled_path, "file");
> > +	igt_assert_f(!ok, "Attaching plane1 to a random file should fail\n");
> > +
> > +	/* Error: Attach a plane to a CRTC from other device */
> > +	ok = attach(plane1, crtc2, "crtc2");
> > +	igt_assert_f(!ok, "Attaching plane1 to crtc2 should fail\n");
> > +
> > +	/* OK: Attaching plane1 to crtc1 */
> > +	ok = igt_vkms_plane_attach_crtc(dev1, "plane1", "crtc1");
> > +	igt_assert_f(ok, "Error attaching plane1 to crtc1\n");
> > +
> > +	/* Error: Attaching plane1 to crtc1 twice */
> > +	ok = attach(plane1, crtc1, "crtc1_duplicated");
> > +	igt_assert_f(!ok, "Error attaching plane1 to crtc1 twice should fail");
> > +
> > +	/* OK: Detaching and attaching again */
> > +	ok = igt_vkms_plane_detach_crtc(dev1, "plane1", "crtc1");
> > +	igt_assert_f(ok, "Error detaching plane1 from crtc1\n");
> > +	ok = igt_vkms_plane_attach_crtc(dev1, "plane1", "crtc1");
> > +	igt_assert_f(ok, "Error attaching plane1 to crtc1\n");
> > +
> > +	igt_vkms_device_destroy(dev1);
> > +	igt_vkms_device_destroy(dev2);
> > +}
> > +
> >   igt_main
> >   {
> >   	struct {
> > @@ -495,6 +575,7 @@ igt_main
> >   		{ "connector-default-files", test_connector_default_files },
> >   		{ "connector-default-values", test_connector_default_values },
> >   		{ "connector-wrong-values", test_connector_wrong_values },
> > +		{ "attach-plane-to-crtc", test_attach_plane_to_crtc },
> >   	};
> >   	igt_fixture {
> 
> -- 
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
> 
