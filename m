Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3ACC87FCB
	for <igt-dev@archiver.kernel.org>; Tue,  5 Aug 2025 12:43:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0033010E689;
	Tue,  5 Aug 2025 12:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KbuLm9BI";
	dkim-atps=neutral
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B776810E677
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Aug 2025 12:43:00 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3b7892609a5so3646387f8f.1
 for <igt-dev@lists.freedesktop.org>; Tue, 05 Aug 2025 05:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754397779; x=1755002579; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zyHDXn6K5qbmmsCK+mmv0tKF0fv63ErKD4bvBCUaFZo=;
 b=KbuLm9BIh7R6TAfqP1A0dnCzF9JsM8tsQm8EezDs4NNRX8TIoF/EamGii3e0Tarpdc
 jM42L/JyKsWi7zH2hn4xL0NfweVdPbfRC77VUZwJnOPJakIJGUIL9VYTf7M1jpdg7s/n
 /nXnSGeHaMSAXuRozHIwpXxi8p7gryOP4k3CrbKIa/nE2hRCprYAl5g34FvQklOhqc9H
 7eq8jredKjBO3huVFbSLJ9WpY9BLQkFM0pwh/XfSDXYxWkhtceoPiWYzvf5qlH7D7MIR
 7XOicHkve43yiuRF2TEjcXycq09LqbNdjLnCN4Zlc0NnRLIxQLDNbIYyEN0V0wDpu9ih
 YdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754397779; x=1755002579;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zyHDXn6K5qbmmsCK+mmv0tKF0fv63ErKD4bvBCUaFZo=;
 b=HZw5UaqQRuIa8VvVHSwKIvk4iyNXgjMlGWnA9oeTwQzXF5Y+IEqFRz2YIpfIoGMQel
 jLqAO+b03sic2TPOPIgTzbeXBbpwVzkrKnbHqc6zrh+B7xw6kBzfS/i/OHzzNI7c0+LI
 iCFunArO2WIxgWf38gVo13zbjk7jGb1cVOOjDuY+iAjiAFwnRYHmz3Ho5e1h1U+i9gyJ
 O2HGoDVtM2aA3R/d18lIwkozgqVHxpet7c9hUkLUM2pkM3E2qXoEccD6QpHwvDM1T2c/
 WQeR2WV6Hr7UNrr1kGmLWGJBkmbu4NaJBG5TV3u3xGJh66BhEAot3VXgBHxlzhtNUYHu
 Qs6A==
X-Gm-Message-State: AOJu0YwQZDlX7sEn5M+TW4nAZgTAydhLEOMSFSm2k7DwukNa8DM2Zmuf
 0F78LcxzKFcE6MmnvaWuVUxiqMDm1FZepJAE9zVoWEtSQI791t4ZOR77
X-Gm-Gg: ASbGnctcHp3nbA4z4oFfPWFrQxy1LqJpUtUkSXJ3I3lxm1tpO5mjDNnNMg3qR/LcgZ1
 PrBbNnQex0iase6DFCdWU2Exy7QR/HAq4U216wpdw5kfignqEsrxGa2VjRF1L9jiKbiEdvdRrOW
 uflyIByWDE0I5m1OhFS3coAfwufAZQwfsGfo5I3kGRaT9wWcLaOA5gfGlpPbsV3eArs8uJiNx48
 7k+Nmn03ARWIPNs4kZy0+jy6Cq817+ZZCYz6hFdCly5x36RwtIWvsd+CJ/j0DL6NkL+iAunDkJs
 znDUDLdQtQNGbPmXoXPbq51gpsgDhkQlGOIsyxNQzA2LZlt+Qw4UJHPb7VBeMuIDjpGbPjz+r0N
 CI1SmtiqSsffCAOMABZY=
X-Google-Smtp-Source: AGHT+IFgfYfaB0WD/d7lPps6xefv4OW41uK8vgaM0zji+DSzhmWRV7ZH9qXot+ZS6aNQOhgF78RsrA==
X-Received: by 2002:a05:6000:1a86:b0:3b7:7cb5:a539 with SMTP id
 ffacd0b85a97d-3b8d94740bemr9618227f8f.18.1754397778694; 
 Tue, 05 Aug 2025 05:42:58 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c453aeasm19670239f8f.40.2025.08.05.05.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 05:42:58 -0700 (PDT)
Date: Tue, 5 Aug 2025 14:42:56 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com
Subject: Re: [PATCH i-g-t v3 16/41] lib/vkms: Test connector invalid values
Message-ID: <aJH8UBa8-AkoeSwO@fedora>
References: <20250715102513.5636-1-jose.exposito89@gmail.com>
 <20250715102513.5636-17-jose.exposito89@gmail.com>
 <6a005b36-4bb9-4798-9b91-ffdd9165ceba@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a005b36-4bb9-4798-9b91-ffdd9165ceba@bootlin.com>
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

Hi again Louis,

On Wed, Jul 16, 2025 at 11:41:56AM +0200, Louis Chauvet wrote:
> 
> 
> Le 15/07/2025 à 12:24, José Expósito a écrit :
> > For a VKMS connector, it is only possible to set invalid values in the
> > connector status.
> > 
> > Test that setting wrong values fails and that the connector is not
> > accidentally changed.
> > 
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > ---
> >   lib/igt_vkms.c             | 24 ++++++++++++++++++
> >   lib/igt_vkms.h             |  2 ++
> >   tests/vkms/vkms_configfs.c | 50 ++++++++++++++++++++++++++++++++++++++
> >   3 files changed, 76 insertions(+)
> > 
> > diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
> > index c8b0dd071..1cd560038 100644
> > --- a/lib/igt_vkms.c
> > +++ b/lib/igt_vkms.c
> > @@ -614,3 +614,27 @@ int igt_vkms_connector_get_status(igt_vkms_t *dev, const char *name)
> >   	return read_int(path);
> >   }
> > +
> > +/**
> > + * igt_vkms_connector_set_status:
> > + * @dev: Device the connector belongs to
> > + * @name: Connector name
> > + * @type: DRM_MODE_CONNECTED, DRM_MODE_DISCONNECTED or
> > + * DRM_MODE_UNKNOWNCONNECTION
> > + *
> > + * Set a new status for the connector
> > + */
> > +void igt_vkms_connector_set_status(igt_vkms_t *dev, const char *name,
> > +				   int status)
> > +{
> > +	char path[PATH_MAX];
> > +
> > +	if (status != DRM_MODE_CONNECTED &&
> > +	    status != DRM_MODE_DISCONNECTED &&
> > +	    status != DRM_MODE_UNKNOWNCONNECTION)
> > +		igt_assert(!"Cannot be reached: Unknown connector status");
> 
> Do we really need this? It is already checked by vkms.

We do not *need* it, but, since we shouldn't use other values in
our tests, it can help find bugs during development.

I think it is nice to have, but I don't oppose removing it if we
really don't like it.

Jose
 
> > +	igt_vkms_get_connector_status_path(dev, name, path, sizeof(path));
> > +
> > +	write_int(path, status);
> > +}
> > diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
> > index 3d27bfebb..df64bde9d 100644
> > --- a/lib/igt_vkms.h
> > +++ b/lib/igt_vkms.h
> > @@ -58,5 +58,7 @@ void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name);
> >   void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name);
> >   int igt_vkms_connector_get_status(igt_vkms_t *dev, const char *name);
> > +void igt_vkms_connector_set_status(igt_vkms_t *dev, const char *name,
> > +				   int status);
> >   #endif /* __IGT_VKMS_H__ */
> > diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
> > index d7ce4aa17..c74bbc15f 100644
> > --- a/tests/vkms/vkms_configfs.c
> > +++ b/tests/vkms/vkms_configfs.c
> > @@ -486,6 +486,55 @@ static void test_connector_default_values(void)
> >   	igt_vkms_device_destroy(dev);
> >   }
> > +/**
> > + * SUBTEST: connector-wrong-values
> > + * Description: Check that setting unexpected values doesn't work.
> > + */
> > +
> > +static void test_connector_wrong_values(void)
> > +{
> > +	struct invalid_value invalid_status_values[] = {
> > +		{ "", 0 },
> > +		{ "\0", 1 },
> > +		{ "-1", 2 },
> > +		{ "0", 1 },
> > +		{ "4", 1 },
> > +		{ "connected", 10 },
> > +	};
> > +	igt_vkms_t *dev;
> > +	char path[PATH_MAX];
> > +	int fd;
> > +	int ret;
> > +
> > +	/* Create a device with a disconnected connector */
> > +	dev = igt_vkms_device_create(__func__);
> > +	igt_assert(dev);
> > +
> > +	igt_vkms_device_add_connector(dev, "connector0");
> > +	igt_vkms_connector_set_status(dev, "connector0", DRM_MODE_DISCONNECTED);
> > +	igt_assert_eq(igt_vkms_connector_get_status(dev, "connector0"),
> > +		      DRM_MODE_DISCONNECTED);
> > +	igt_vkms_get_connector_status_path(dev, "connector0", path, sizeof(path));
> > +
> > +	/* Test invalid values for "status" */
> > +	for (int i = 0; i < ARRAY_SIZE(invalid_status_values); i++) {
> > +		struct invalid_value v = invalid_status_values[i];
> > +
> > +		fd = open(path, O_WRONLY);
> > +		igt_assert_f(fd >= 0, "Error opening '%s'\n", path);
> > +
> > +		ret = write(fd, v.value, v.size);
> > +		igt_assert(ret <= 0);
> > +
> > +		close(fd);
> > +	}
> > +
> > +	igt_assert_eq(igt_vkms_connector_get_status(dev, "connector0"),
> > +		      DRM_MODE_DISCONNECTED);
> > +
> > +	igt_vkms_device_destroy(dev);
> > +}
> > +
> >   igt_main
> >   {
> >   	struct {
> > @@ -506,6 +555,7 @@ igt_main
> >   		{ "encoder-default-files", test_encoder_default_files },
> >   		{ "connector-default-files", test_connector_default_files },
> >   		{ "connector-default-values", test_connector_default_values },
> > +		{ "connector-wrong-values", test_connector_wrong_values },
> >   	};
> >   	igt_fixture {
> 
> -- 
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
