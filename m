Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B254C5472F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 16:44:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0C010E3A6;
	Tue, 27 Aug 2024 16:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U3cURwna";
	dkim-atps=neutral
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA8610E3A6
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 16:43:58 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-42816ca797fso51555405e9.2
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 09:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724777037; x=1725381837; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=cQw+3j19EUk28f/4QFHNSfenvsUiCjax18gHR7miSiw=;
 b=U3cURwnal7LEa3H85s3Zi5wQGqYtay+dUikKSaEm2oplT6u7YfQtIKIPchlHPGyJ43
 ddgGU99m5ASy18V7miNjgiOPEAGHs12XVJOesnxgFyb64qIpZG9mW9IKUwZX3x0BvnYz
 gOP59+vBdkH/K1QKEvjwGyQFFla8mXlRTcgEd5uM0Fzt77bgAr6JOtADsDq7vcbk/zIK
 szXxiXHVN2PArGZ4YiX3TtQCHZ2/f/9DjN/n3/RbF/reuOXIbSBQxFJeAQQdTbgOpyM0
 SYuEQDDYF8lQo+j0RiDaMJlB8uzCJSHZl7f8wWPVz5oundAoi9tiNYPMZVPkQE/f+WmE
 PIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724777037; x=1725381837;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cQw+3j19EUk28f/4QFHNSfenvsUiCjax18gHR7miSiw=;
 b=ZaXtk1LXPdBRbtblavIB5Huhe3tOFrgcg5wArZzf0nXXiKNMIV1P/KQm0EplQOHuVc
 EOi5ixg9JbTJj5IWb+bcJHzcyyO1u3hV4hynS0J5LOffp3siIj8l/byY+XrHYYVMze8P
 CfdM4aT3w/q+w+dir08ArH0NKJJwskLunjVZ4zTg/oFkMDG1xQwt4YKvnKgwYtiNoQ+i
 DO8JTICXjtnCYGUX4fTtpn1rXnkwmWvqbfjF5lOhxE3KFRCwpnNAffiplj9auB0nFaUl
 wfZs388An1gPYu/177Vf3HMNtdo0V3XlflbRbjgKNgKvNHPOODuFSZuoiUj90CgOWPZ0
 qqhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRaa6BF8U+ki9Jo+TtIPaTiaz5WeU/DCrYRaHE+r1uUojjblXDgKUR3wMi9hVnsKPGQisVmEcc@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyj7dcvSRFSG8tr3/xZ/+8EPgVUsM/FtRPpKRYFXCrpdhvcLkSO
 4sURsy3vyqPJzKAb4SjD2fE+gTJIBo+KPP1h0c0oze9EUgpxOLGK
X-Google-Smtp-Source: AGHT+IGDbnH2iGeladp1F+9ovZuEiVVvKZt62GQTGPptdepq43fn3erX9h8YpcBu8km2j233hKkEjg==
X-Received: by 2002:a05:600c:4e90:b0:428:ea8e:b48a with SMTP id
 5b1f17b1804b1-42b9adaa135mr25180545e9.8.1724777036859; 
 Tue, 27 Aug 2024 09:43:56 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42abee86d5esm223377015e9.15.2024.08.27.09.43.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 09:43:56 -0700 (PDT)
Message-ID: <7e7f3d34-1319-46bf-8a60-96ba247aee1e@gmail.com>
Date: Tue, 27 Aug 2024 19:43:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 17/37] lib/igt_fb: Expose igt_fb_is_ccs_modifier()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-18-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-18-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On 3.7.2024 2.27, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> I'm going to need is_ccs_modifier() outside of igt_fb.c.
> Rename it to igt_fb_is_ccs_modifier() and expose it to everyone.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_fb.c | 18 ++++++++++--------
>   lib/igt_fb.h |  1 +
>   2 files changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 80e3c0a48bda..bcb418e0f7be 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -610,7 +610,7 @@ static bool is_gen12_ccs_modifier(uint64_t modifier)
>   		modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS;
>   }
>   
> -static bool is_ccs_modifier(uint64_t modifier)
> +bool igt_fb_is_ccs_modifier(uint64_t modifier)

There's been attempt to have these exposed functions small document 
block about what's here. With that added

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

>   {
>   	return is_gen12_ccs_modifier(modifier) ||
>   		modifier == I915_FORMAT_MOD_Y_TILED_CCS ||
> @@ -619,7 +619,8 @@ static bool is_ccs_modifier(uint64_t modifier)
>   
>   static bool is_ccs_plane(const struct igt_fb *fb, int plane)
>   {
> -	if (!is_ccs_modifier(fb->modifier) || HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
> +	if (!igt_fb_is_ccs_modifier(fb->modifier) ||
> +	    HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
>   		return false;
>   
>   	return plane >= fb->num_planes / 2;
> @@ -729,7 +730,8 @@ static int fb_num_planes(const struct igt_fb *fb)
>   {
>   	int num_planes = lookup_drm_format(fb->drm_format)->num_planes;
>   
> -	if (is_ccs_modifier(fb->modifier) && !HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
> +	if (igt_fb_is_ccs_modifier(fb->modifier) &&
> +	    !HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
>   		num_planes *= 2;
>   
>   	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
> @@ -2482,7 +2484,7 @@ static enum blt_tiling_type fb_tile_to_blt_tile(uint64_t tile)
>   static bool fast_blit_ok(const struct igt_fb *fb)
>   {
>   	return blt_has_fast_copy(fb->fd) &&
> -		!is_ccs_modifier(fb->modifier) &&
> +		!igt_fb_is_ccs_modifier(fb->modifier) &&
>   		blt_fast_copy_supports_tiling(fb->fd,
>   					      fb_tile_to_blt_tile(fb->modifier));
>   }
> @@ -2502,7 +2504,7 @@ static bool ccs_needs_enginecopy(const struct igt_fb *fb)
>   	if (is_gen12_mc_ccs_modifier(fb->modifier))
>   		return true;
>   
> -	if (is_ccs_modifier(fb->modifier) &&
> +	if (igt_fb_is_ccs_modifier(fb->modifier) &&
>   	    !HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
>   		return true;
>   
> @@ -2622,7 +2624,7 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
>   
>   	igt_assert_eq(fb->offsets[0], 0);
>   
> -	if (is_ccs_modifier(fb->modifier)) {
> +	if (igt_fb_is_ccs_modifier(fb->modifier)) {
>   		igt_assert_eq(fb->strides[0] & 127, 0);
>   
>   		if (is_gen12_ccs_modifier(fb->modifier)) {
> @@ -2666,7 +2668,7 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
>   	if (buf->format_is_yuv_semiplanar)
>   		buf->yuv_semiplanar_bpp = yuv_semiplanar_bpp(fb->drm_format);
>   
> -	if (is_ccs_modifier(fb->modifier)) {
> +	if (igt_fb_is_ccs_modifier(fb->modifier)) {
>   		num_surfaces = fb->num_planes / (HAS_FLATCCS(intel_get_drm_devid(fb->fd)) ? 1 : 2);
>   		for (i = 0; i < num_surfaces; i++)
>   			init_buf_ccs(buf, i,
> @@ -2799,7 +2801,7 @@ static struct blt_copy_object *allocate_and_initialize_blt(const struct igt_fb *
>   		       intel_get_uc_mocs_index(fb->fd),
>   		       intel_get_pat_idx_uc(fb->fd),
>   		       blt_tile,
> -		       is_ccs_modifier(fb->modifier) ? COMPRESSION_ENABLED : COMPRESSION_DISABLED,
> +		       igt_fb_is_ccs_modifier(fb->modifier) ? COMPRESSION_ENABLED : COMPRESSION_DISABLED,
>   		       is_gen12_mc_ccs_modifier(fb->modifier) ? COMPRESSION_TYPE_MEDIA : COMPRESSION_TYPE_3D);
>   
>   	blt_set_geom(blt, stride, 0, 0, fb->width, fb->plane_height[plane], 0, 0);
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> index 2b5040ce3c6b..b1b40b858610 100644
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -181,6 +181,7 @@ void igt_fb_calc_crc(struct igt_fb *fb, igt_crc_t *crc);
>   uint64_t igt_fb_mod_to_tiling(uint64_t modifier);
>   uint64_t igt_fb_tiling_to_mod(uint64_t tiling);
>   
> +bool igt_fb_is_ccs_modifier(uint64_t modifier);
>   bool igt_fb_is_ccs_plane(const struct igt_fb *fb, int plane);
>   bool igt_fb_is_gen12_ccs_cc_plane(const struct igt_fb *fb, int plane);
>   int igt_fb_ccs_to_main_plane(const struct igt_fb *fb, int ccs_plane);

