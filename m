Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D386DC3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 10:01:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927DA10E70C;
	Thu, 18 Jul 2024 10:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="XohkOzQJ";
	dkim-atps=neutral
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D4210E030
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 10:01:01 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-426719e2efeso184645e9.0
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 03:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721296860; x=1721901660; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=M9Ddiz5aWhESVWY91Rre4Ei8dXe0hxyGQTvWoxqtFTY=;
 b=XohkOzQJpvK/a7ErT4lQM0Z/e2EVGsJmo9GLkzXnyUy9fjpS3/IMsC/Csl8RIUpfyl
 a88wqMiOi7LzKtGqw6bCbmQGyj5kmc0TY8KiXff1NGePqdIPMfkQg8+nmYdmBMSDIzXW
 s5ofXzJUriGoW2V35wwvN8uE8G1oNZQ0HN2DU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721296860; x=1721901660;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M9Ddiz5aWhESVWY91Rre4Ei8dXe0hxyGQTvWoxqtFTY=;
 b=Dvzn20DyUtQm6+BFaybFRBdnys0v/bqipkiTPkQp14r6NrBzTW/nBw4E6V1V1faqzc
 wSgRDLjjjrxj8f870GVw4e2o761+ngdIAcDtwtw6PI67pZWBSO9gksQcdi7ltyRfuGXI
 b3VxVaBVILRITDqnNnRDmxw0/uXifXALnbHxkRSpLRorVf6gJYBxPCkSJhkeulzD4Pi/
 u3ehofNkk8tphkbIvppm4oH8BY0WX2qmmIxnmI+2mZm1h/mOp8VlijHln6x2/rosLvHy
 4KwUXHq8Vh41f8aGciiD4osoLz7kUwtygUC+FqyB4hP5C+G2ldqX/kKRRUqShpvI3AMs
 pMbw==
X-Gm-Message-State: AOJu0YwmOXHS10llR9ppTa7beHzJ5sLkEUSM7VDVjaH/gKA78QAvT2qG
 0HpFq/kwVPa3blGcS2RcHPKOvaszp/wMt8eJ/QTXCnxvIdVk4UnMZBYKQJv0Ck4=
X-Google-Smtp-Source: AGHT+IHzEUiUnYGCAJIso35npHep3v54So9cJ/+y6XB1JcYuLcfp0jCqBRHV49gSRCckOLeALkE6Hg==
X-Received: by 2002:a05:600c:1d04:b0:426:6fc0:5910 with SMTP id
 5b1f17b1804b1-427d2a63ca3mr1851355e9.1.1721296860078; 
 Thu, 18 Jul 2024 03:01:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2b1815esm4529165e9.13.2024.07.18.03.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 03:00:59 -0700 (PDT)
Date: Thu, 18 Jul 2024 12:00:57 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: igt-dev@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_properties: drop immutability checks
Message-ID: <Zpjn2dTHDrBBuTVH@phenom.ffwll.local>
References: <20240717143947.28437-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240717143947.28437-1-dmitry.baryshkov@linaro.org>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Wed, Jul 17, 2024 at 05:39:47PM +0300, Dmitry Baryshkov wrote:
> Following the discussion on IRC, it is actually an error to require that
> properties that can not be chaged are marked as immutable.
> 
> First of all, it creates inconsistent uAPI. Some drivers might have an
> immutable property, while others will have it mutable. Yes, there are
> known examples for such behaviour (e.g. zpos), but they are clearly
> documented in this way.
> 
> Second, by the nature of the flag, the DRM_MODE_PROP_IMMUTABLE defines
> more of the 'direction' of the property (whether it is set by the kernel
> or it is expected to be set by the userspace) rather than simply states
> that there is no way for the userspace to change the property.
> 
> Drop the single-value-is-immutable tests.
> 
> Fixes: 29ae12bd764e ("tests/kms_properties: Validate properties harder")
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Link: https://oftc.irclog.whitequark.org/dri-devel/2024-07-16#33374622
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Makes sense, but we might drop some test coverage for the properties where
we _do_ want the single value to be immutable. Like zpos.

So I think at least a cursory audit of existing properties would be good,
checking that the kerneldoc is accurate and then maybe limiting these
checks here to properties which are documented to have this behaviour?

I know that's a bunch more work, but I fear if we just drop this we only
move from one a bit confusing state of the uapi to another one, without
real improvements.

Ofc if all the compositor folks tell me that this doesn't matter anyway,
I'll shut up :-)

Cheers, Sima

> ---
>  tests/kms_properties.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index c0e5be1c90a8..c41b88bef76f 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -421,11 +421,9 @@ static void validate_range_prop(const struct drm_mode_get_property *prop,
>  {
>  	const uint64_t *values = from_user_pointer(prop->values_ptr);
>  	bool is_unsigned = prop->flags & DRM_MODE_PROP_RANGE;
> -	bool immutable = prop->flags & DRM_MODE_PROP_IMMUTABLE;
>  
>  	igt_assert_eq(prop->count_values, 2);
>  	igt_assert_eq(prop->count_enum_blobs, 0);
> -	igt_assert(values[0] != values[1] || immutable);
>  
>  	if (is_unsigned) {
>  		igt_assert_lte_u64(values[0], values[1]);
> @@ -461,12 +459,10 @@ static void validate_enum_prop(const struct drm_mode_get_property *prop,
>  			       uint64_t value)
>  {
>  	const uint64_t *values = from_user_pointer(prop->values_ptr);
> -	bool immutable = prop->flags & DRM_MODE_PROP_IMMUTABLE;
>  	int i;
>  
>  	igt_assert_lte(1, prop->count_values);
>  	igt_assert_eq(prop->count_enum_blobs, prop->count_values);
> -	igt_assert(prop->count_values != 1 || immutable);
>  
>  	for (i = 0; i < prop->count_values; i++) {
>  		if (value == values[i])
> @@ -481,12 +477,10 @@ static void validate_bitmask_prop(const struct drm_mode_get_property *prop,
>  				  uint64_t value)
>  {
>  	const uint64_t *values = from_user_pointer(prop->values_ptr);
> -	bool immutable = prop->flags & DRM_MODE_PROP_IMMUTABLE;
>  	uint64_t mask = 0;
>  
>  	igt_assert_lte(1, prop->count_values);
>  	igt_assert_eq(prop->count_enum_blobs, prop->count_values);
> -	igt_assert(prop->count_values != 1 || immutable);
>  
>  	for (int i = 0; i < prop->count_values; i++) {
>  		igt_assert_lte_u64(values[i], 63);
> @@ -535,7 +529,6 @@ static void validate_object_prop(int fd,
>  				 uint64_t value)
>  {
>  	const uint64_t *values = from_user_pointer(prop->values_ptr);
> -	bool immutable = prop->flags & DRM_MODE_PROP_IMMUTABLE;
>  	struct drm_mode_crtc crtc;
>  	struct drm_mode_fb_cmd fb;
>  
> @@ -543,7 +536,6 @@ static void validate_object_prop(int fd,
>  	igt_assert_eq(prop->count_enum_blobs, 0);
>  
>  	igt_assert_lte_u64(value, 0xffffffff);
> -	igt_assert(!immutable || value != 0);
>  
>  	switch (values[0]) {
>  	case DRM_MODE_OBJECT_CRTC:
> -- 
> 2.43.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
