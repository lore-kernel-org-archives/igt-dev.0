Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0659CC282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:25:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECAE10E257;
	Thu, 13 Mar 2025 17:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gMXbZysv";
	dkim-atps=neutral
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4088610E257
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:25:51 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso8718825e9.3
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741886750; x=1742491550; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=f7gtaWoVzqUxobzPe5S2UfEhN2tqJ3eX2Hdgp11IWho=;
 b=gMXbZysvvU88NImDTGux2xsyRoe0Wz/41Ch6i6nXaxJwVt2ghU89e1kvWPIbN5Wjvt
 2E5PC+OCIxlpaSdZ7/QVt3vY3cOmqNG+XGHHUN5RNmxMUDKiHbZ4wwS7gnyJc2mzbPTj
 jliQHLFrjxnJBCpGnMFS68rYwO4qXW6MssFC7LjmcS1mxxE7nE78PZYJyiSVK3HpW2i2
 wyZ7I7P6ePF8dRMso2Xh6DeVxVmA7DBViUXYUy6FEV8u+Bk6ovCMR20YCtAyvfqhdfCg
 8aRpb/JQk/LnIb32HlA5QIGaeeOgnU6TKfaRQHwMl5q9Pqdm3+AjZSYOuSCOBjcVcKBy
 Cceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741886750; x=1742491550;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f7gtaWoVzqUxobzPe5S2UfEhN2tqJ3eX2Hdgp11IWho=;
 b=kjwaY3nVMekqDUFwwEMyi4slgQ7zzlJCCjmTjV0voRaPtdOxqA0+o8agHn+xIBF5GU
 sGytXys4oJWJ2OvchaLTdEZXoCXusZnaw+I1I1pB8bxrYSs5j8cuiSgxWxMQHcxXEeXu
 KEQRiaRmVpe0UH9FV+fU9Hzr1PEXVYBePoqZZi8AgbpfwoZHy5aj9Ria6mA2AtIZuAT+
 y6bwdXIgGvbeyl/FleTpZR3x4HxB6tF3MruSrgkV3jnXuaRm4uKGyrxBt09zEJK7oUKv
 0JIa65RKYM6czY4wi/NzzZ7P5dNyPFZqxT2dARpGcY0DwN/tek+PQG56yRRKXJ9bMWk7
 0YTQ==
X-Gm-Message-State: AOJu0Yybona31Q1rNX8DjsrxElwIDrk8A1dInqCgHFTle+0E34im1Q1z
 0Xe5GlOWjPyZv1ywFBJvcidq9zMyF6fYxruV6+zO4ZhkX2y6eUbpKTvFpaXJ
X-Gm-Gg: ASbGncsuraeG6mUAk5LpyM2zIok7c/2RSUaN4nL9kIqLoAlMarQnbU6iZS969ahJvFV
 yiSOYOpDXCT3L/A4N/mfEpMMz/aph9xdZerNS41sUibrARbpEODvFebiUaKRa+g/T6ebGhhiKZf
 KdHgftH0reQQV5Y/9FTux+YEtzgrZZESBVXpUEDljnZdz70K0gphtSoJ91TBcyod4wM55XoWc5n
 S5qZU9HVJ7Tob7PZDEzB+yUtGmPgXMpwu4qal4nFkgRThF8bUxYijhfB/l+lKp+v0xs8fyZc9yx
 gGh1lrwF+jIjZ2k2SyYQDhSuXY0r/bRAP3SjYia2qQ==
X-Google-Smtp-Source: AGHT+IHNsbQ75BrXHRuX8evWHVfkLZbB+Fh15fg1i/5/1LAKac8czzlyRVNfZ3MuSRsvVnOOdV8Xug==
X-Received: by 2002:a05:600c:4f01:b0:43d:b3:fb1 with SMTP id
 5b1f17b1804b1-43d1d8e7e04mr4564695e9.27.1741886749626; 
 Thu, 13 Mar 2025 10:25:49 -0700 (PDT)
Received: from fedora ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d17b8b778sm29463775e9.1.2025.03.13.10.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:25:49 -0700 (PDT)
Date: Thu, 13 Mar 2025 18:25:47 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 13/39] lib/vkms: Test encoder default files
Message-ID: <Z9MVG0T2klWjkhw7@fedora>
References: <20250218165011.9123-1-jose.exposito89@gmail.com>
 <20250218165011.9123-14-jose.exposito89@gmail.com>
 <f4130bca-629f-417b-9a1e-e01d38aeaea2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4130bca-629f-417b-9a1e-e01d38aeaea2@bootlin.com>
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

On Thu, Feb 27, 2025 at 02:14:52PM +0100, Louis Chauvet wrote:
> 
> 
> Le 18/02/2025 à 17:49, José Expósito a écrit :
> > Add a helper to create a encoder and a test checking that the default
> > files and directories are created.
> > 
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > ---
> >   lib/igt_vkms.c             | 12 ++++++++++++
> >   lib/igt_vkms.h             |  2 ++
> >   tests/vkms/vkms_configfs.c | 29 +++++++++++++++++++++++++++++
> >   3 files changed, 43 insertions(+)
> > 
> > diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
> > index d881a2417..299891377 100644
> > --- a/lib/igt_vkms.c
> > +++ b/lib/igt_vkms.c
> > @@ -416,3 +416,15 @@ void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
> >   	write_bool(path, writeback);
> >   }
> > +
> > +/**
> > + * igt_vkms_device_add_encoder:
> > + * @dev: Device to add the encoder to
> > + * @name: Encoder name
> > + *
> > + * Add a new encoder to the VKMS device.
> > + */
> > +void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name)
> > +{
> > +	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_ENCODER, name);
> > +}
> > diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
> > index cb0278544..b4b048c6d 100644
> > --- a/lib/igt_vkms.h
> > +++ b/lib/igt_vkms.h
> > @@ -38,4 +38,6 @@ bool igt_vkms_crtc_is_writeback_enabled(igt_vkms_t *dev, const char *name);
> >   void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
> >   					 bool writeback);
> > +void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name);
> > +
> >   #endif /* __IGT_VKMS_H__ */
> > diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
> > index af42e364d..753ea2d85 100644
> > --- a/tests/vkms/vkms_configfs.c
> > +++ b/tests/vkms/vkms_configfs.c
> > @@ -345,6 +345,34 @@ static void test_crtc_wrong_values(void)
> >   	igt_vkms_device_destroy(dev);
> >   }
> > +/**
> > + * SUBTEST: encoder-default-files
> > + * Description: Test that creating a encoder creates the default files and
> > + *              directories.
> > + */
> > +
> > +static void test_encoder_default_files(void)
> > +{
> > +	igt_vkms_t *dev;
> > +	char path[PATH_MAX];
> > +
> > +	const char *dirs[] = {
> > +		"possible_crtcs",
> > +	};
> > +
> > +	dev = igt_vkms_device_create(__func__);
> > +	igt_assert(dev);
> > +
> > +	igt_vkms_device_add_encoder(dev, "encoder0");
> 
> I maybe found a solution for the duplication of path generation, can the
> igt_vkms_device_add_* return the path of the object?
> 
> To avoid malloc/free, you can simply add an optional pointer "path":

I decided to add something similar to this, but instead of making it part
of the igt_vkms_device_add_*() functions, I created new helpers that are
used both in the tests and in the lib.

I'll send v2 in a bit with them.

Thanks a lot for the huge effort reviewing all of this.

Jose

> void igt_vkms_device_add_encoder(dev, name, path, max_len) {
> 	if (path)
> 		igt_assert_le(snprintf(path, max_len, "....", ...),
> 				max_len);
> 	[...]
> }
> 
> > +	snprintf(path, sizeof(path), "%s/encoders/encoder0", dev->path);
> > +	assert_default_files(path,
> > +			     NULL, 0,
> > +			     dirs, ARRAY_SIZE(dirs));
> > +
> > +	igt_vkms_device_destroy(dev);
> > +}
> > +
> >   igt_main
> >   {
> >   	struct {
> > @@ -360,6 +388,7 @@ igt_main
> >   		{ "crtc-default-files", test_crtc_default_files },
> >   		{ "crtc-default-values", test_crtc_default_values },
> >   		{ "crtc-wrong-values", test_crtc_wrong_values },
> > +		{ "encoder-default-files", test_encoder_default_files },
> >   	};
> >   	igt_fixture {
> 
> -- 
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
> 
