Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A33C87FCF
	for <igt-dev@archiver.kernel.org>; Wed, 13 Aug 2025 13:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C4510E4E3;
	Wed, 13 Aug 2025 13:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U8To8eEK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4311810E4E3
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Aug 2025 13:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755092303; x=1786628303;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1hFXEoiHBkmTf0VKRdU1EOPquefAp3kqB14tFofZXlE=;
 b=U8To8eEKyWcq8yHCJnDVLgvJgMriReNSZ7+uMpMNFw/GEkZZBEaQDQqi
 1pLLDWAM3gpwMABkY8JdjKbgFHA9mUZpMYJZr9AZGRSnzH/QsBHEk90nb
 AvjBHHMhROqHHAwEUEH3OHi1vVmhiQbREYSrTJnPfhICcyyD4G2NlAYzh
 Hxd7VGeQh1lPP1fW6/VH/CVK5tKSHXa2Lt+HM40EMgNNMik9w0GDX6gc8
 SI/9GZWt36rP5wtoN3UWtChmprY88kqFwvBJa+xtvpW84tMVHF2hFxmdd
 yh69NsNQD5UzlqzLf8w+kEYAM8gCS4dQW3d6CYWKZDn9TnLP88e4PgIdj A==;
X-CSE-ConnectionGUID: g2mcGttmSj6aIhok2Wg5uA==
X-CSE-MsgGUID: I7vhDcUZRFyTtLMknboL4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="79960262"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="79960262"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 06:38:22 -0700
X-CSE-ConnectionGUID: g5+i0628QEyideQYEGwm9w==
X-CSE-MsgGUID: Kmp8wiFSTyaGcb/8qcpIfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="170686310"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 06:38:21 -0700
Date: Wed, 13 Aug 2025 15:38:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 zbigniew.kempczynski@intel.com, karthik.b.s@intel.com
Subject: Re: [PATCH i-g-t v4 05/41] lib/vkms: Test plane default files
Message-ID: <20250813133818.brot2ylczzvthdxd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 zbigniew.kempczynski@intel.com, karthik.b.s@intel.com
References: <20250807074550.6543-1-jose.exposito89@gmail.com>
 <20250807074550.6543-6-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250807074550.6543-6-jose.exposito89@gmail.com>
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
On 2025-08-07 at 09:45:14 +0200, José Expósito wrote:
> Add a helper to create a plane and a test checking that the default
> files and directories are created.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

As Louis was ok with keeping 'pipeline' name so imho you could keep
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

Btw change into const could be done later. This will leave
only 16/41 for review.

Regards,
Kamil

> ---
>  lib/igt_vkms.c             | 76 ++++++++++++++++++++++++++++++++++++++
>  lib/igt_vkms.h             |  4 ++
>  tests/vkms/vkms_configfs.c | 33 +++++++++++++++++
>  3 files changed, 113 insertions(+)
> 
> diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
> index 7d3575ca0..7c789ea0d 100644
> --- a/lib/igt_vkms.c
> +++ b/lib/igt_vkms.c
> @@ -23,6 +23,13 @@
>  #define VKMS_ROOT_DIR_NAME		"vkms"
>  #define VKMS_FILE_ENABLED		"enabled"
>  
> +enum vkms_pipeline_item {
> +	VKMS_PIPELINE_ITEM_PLANE,
> +	VKMS_PIPELINE_ITEM_CRTC,
> +	VKMS_PIPELINE_ITEM_ENCODER,
> +	VKMS_PIPELINE_ITEM_CONNECTOR,
> +};
> +
>  /**
>   * SECTION:igt_vkms
>   * @short_description: Helpers to create and configure VKMS devices
> @@ -96,6 +103,48 @@ static void write_bool(const char *path, bool value)
>  	write_int(path, value ? 1 : 0);
>  }
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
>  /**
>   * igt_require_vkms_configfs:
>   *
> @@ -130,6 +179,21 @@ void igt_vkms_get_device_enabled_path(igt_vkms_t *dev, char *path, size_t len)
>  	igt_assert(ret >= 0 && ret < len);
>  }
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
>  /**
>   * igt_vkms_device_create:
>   * @name: VKMS device name
> @@ -302,3 +366,15 @@ void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled)
>  
>  	write_bool(path, enabled);
>  }
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
> index 8b3595b00..3bda3196d 100644
> --- a/lib/igt_vkms.h
> +++ b/lib/igt_vkms.h
> @@ -23,6 +23,8 @@ typedef struct igt_vkms {
>  void igt_require_vkms_configfs(void);
>  
>  void igt_vkms_get_device_enabled_path(igt_vkms_t *dev, char *path, size_t len);
> +void igt_vkms_get_plane_path(igt_vkms_t *dev, const char *name, char *path,
> +			     size_t len);
>  
>  igt_vkms_t *igt_vkms_device_create(const char *name);
>  void igt_vkms_device_destroy(igt_vkms_t *dev);
> @@ -31,4 +33,6 @@ void igt_vkms_destroy_all_devices(void);
>  bool igt_vkms_device_is_enabled(igt_vkms_t *dev);
>  void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled);
>  
> +void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name);
> +
>  #endif /* __IGT_VKMS_H__ */
> diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
> index d38791ccf..fa429d28f 100644
> --- a/tests/vkms/vkms_configfs.c
> +++ b/tests/vkms/vkms_configfs.c
> @@ -178,6 +178,38 @@ static void test_device_wrong_values(void)
>  	igt_vkms_device_destroy(dev);
>  }
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
> +	static const char *files[] = {
> +		"type",
> +	};
> +
> +	static const char *dirs[] = {
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
>  igt_main
>  {
>  	struct {
> @@ -187,6 +219,7 @@ igt_main
>  		{ "device-default-files", test_device_default_files },
>  		{ "device-default-values", test_device_default_values },
>  		{ "device-wrong-values", test_device_wrong_values },
> +		{ "plane-default-files", test_plane_default_files },
>  	};
>  
>  	igt_fixture {
> -- 
> 2.50.1
> 
