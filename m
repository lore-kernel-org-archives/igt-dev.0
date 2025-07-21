Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6BEC83F25
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 16:35:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A718410E295;
	Mon, 21 Jul 2025 16:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIgQa14u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B6010E295
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jul 2025 16:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753115748; x=1784651748;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4MJILIKQsF2F2Ex/IrCL7xShGlaAV4HfxB8OvnU2S9M=;
 b=CIgQa14u9O/rGpnTYB/ingLtVb1JuMqTku+lAhDC1yuRTSc7qMRyKSQs
 qL6XInLUukPKnYUSfZ8lrGmIXalRKXPCvuA7LmijJVdEYy0+VIyEDdpE1
 6FqWYsKDwKikGmP8qfnzhgpOiIMn/3dvmxKNXvNrBKJQTSFkuoXB/FrzX
 Vd8uXI6a7EZIRm4GcpNSHCeQ2DhX7pMMv07QmpdKkzIXrcBWFbXaUVghN
 mb6x4BIWJ11IdLF2OHQTg1m7fQrm+FIVDEMLZfJAAUDr73rCf4mgwzyjx
 /3NQ1L8m+GJTCjGKKy0bFbe7U45zqj1d6g9EalII7FzSZWHqx3CEj2gmT Q==;
X-CSE-ConnectionGUID: Ep8r6mCRTEWm2/718r3rug==
X-CSE-MsgGUID: +qXVKlN8SfKQDngc0GILMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="80783626"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="80783626"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 09:35:48 -0700
X-CSE-ConnectionGUID: 2mmr926LQti5GNa4+iWssA==
X-CSE-MsgGUID: 6ACcwytwSuCtY98EMFPftA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="159305378"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 09:35:47 -0700
Date: Mon, 21 Jul 2025 18:35:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 zbigniew.kempczynski@intel.com
Subject: Re: [PATCH i-g-t v3 13/41] lib/vkms: Test encoder default files
Message-ID: <20250721163544.vkiygedcgfvpa254@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 zbigniew.kempczynski@intel.com
References: <20250715102513.5636-1-jose.exposito89@gmail.com>
 <20250715102513.5636-14-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250715102513.5636-14-jose.exposito89@gmail.com>
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

Hi José,
On 2025-07-15 at 12:24:45 +0200, José Expósito wrote:
> Add a helper to create a encoder and a test checking that the default
> files and directories are created.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  lib/igt_vkms.c             | 27 +++++++++++++++++++++++++++
>  lib/igt_vkms.h             |  4 ++++
>  tests/vkms/vkms_configfs.c | 29 +++++++++++++++++++++++++++++
>  3 files changed, 60 insertions(+)
> 
> diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
> index 0a14f9af7..ed28adf9b 100644
> --- a/lib/igt_vkms.c
> +++ b/lib/igt_vkms.c
> @@ -258,6 +258,21 @@ void igt_vkms_get_crtc_writeback_path(igt_vkms_t *dev, const char *name,
>  				    VKMS_FILE_CRTC_WRITEBACK, path, len);
>  }
>  
> +/**
> + * igt_vkms_get_encoder_path:
> + * @dev: Device containing the encoder
> + * @name: Encoder name
> + * @path: Output path
> + * @len: Maximum @path length
> + *
> + * Returns the encoder path.
> + */
> +void igt_vkms_get_encoder_path(igt_vkms_t *dev, const char *name, char *path,
> +			       size_t len)
> +{
> +	get_pipeline_item_path(dev, VKMS_PIPELINE_ITEM_ENCODER, name, path, len);
> +}
> +
>  /**
>   * igt_vkms_device_create:
>   * @name: VKMS device name
> @@ -527,3 +542,15 @@ void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
>  
>  	write_bool(path, writeback);
>  }
> +
> +/**
> + * igt_vkms_device_add_encoder:
> + * @dev: Device to add the encoder to
> + * @name: Encoder name
> + *
> + * Add a new encoder to the VKMS device.
> + */
> +void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name)
> +{
> +	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_ENCODER, name);
> +}
> diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
> index 90cfde77a..aa6ff513d 100644
> --- a/lib/igt_vkms.h
> +++ b/lib/igt_vkms.h
> @@ -31,6 +31,8 @@ void igt_vkms_get_crtc_path(igt_vkms_t *dev, const char *name, char *path,
>  			    size_t len);
>  void igt_vkms_get_crtc_writeback_path(igt_vkms_t *dev, const char *name,
>  				      char *path, size_t len);
> +void igt_vkms_get_encoder_path(igt_vkms_t *dev, const char *name, char *path,
> +			       size_t len);
>  
>  igt_vkms_t *igt_vkms_device_create(const char *name);
>  void igt_vkms_device_destroy(igt_vkms_t *dev);
> @@ -48,4 +50,6 @@ bool igt_vkms_crtc_is_writeback_enabled(igt_vkms_t *dev, const char *name);
>  void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
>  					 bool writeback);
>  
> +void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name);
> +
>  #endif /* __IGT_VKMS_H__ */
> diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
> index 860a06f41..8939ef611 100644
> --- a/tests/vkms/vkms_configfs.c
> +++ b/tests/vkms/vkms_configfs.c
> @@ -406,6 +406,34 @@ static void test_crtc_valid_values(void)
>  	igt_vkms_device_destroy(dev);
>  }
>  
> +/**
> + * SUBTEST: encoder-default-files
> + * Description: Test that creating a encoder creates the default files and
> + *              directories.
> + */
> +
> +static void test_encoder_default_files(void)
> +{
> +	igt_vkms_t *dev;
> +	char path[PATH_MAX];
> +
> +	const char *dirs[] = {
> +		"possible_crtcs",
> +	};

checkpatch.pl suggest to use also 'static' here.

Regards,
Kamil

> +
> +	dev = igt_vkms_device_create(__func__);
> +	igt_assert(dev);
> +
> +	igt_vkms_device_add_encoder(dev, "encoder0");
> +	igt_vkms_get_encoder_path(dev, "encoder0", path, sizeof(path));
> +
> +	assert_default_files(path,
> +			     NULL, 0,
> +			     dirs, ARRAY_SIZE(dirs));
> +
> +	igt_vkms_device_destroy(dev);
> +}
> +
>  igt_main
>  {
>  	struct {
> @@ -423,6 +451,7 @@ igt_main
>  		{ "crtc-default-values", test_crtc_default_values },
>  		{ "crtc-wrong-values", test_crtc_wrong_values },
>  		{ "crtc-valid-values", test_crtc_valid_values },
> +		{ "encoder-default-files", test_encoder_default_files },
>  	};
>  
>  	igt_fixture {
> -- 
> 2.50.0
> 
