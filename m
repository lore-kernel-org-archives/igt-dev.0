Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034CFC8303F
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 10:48:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86AE10E322;
	Thu, 28 Aug 2025 10:48:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oft5FLQV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382E010E322
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 10:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756378115; x=1787914115;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sASoIwTMe6ZtNgbLArdv+fTK9THiLT1GFoq+VFIv45A=;
 b=Oft5FLQVzf3EDS/63v8jRFohOiBVPR1GCTLcdjj1RCPMCDw9Yiu2tNcn
 5HKIso8cUgx2nKUaufQHlfb1TJeeelL20uTf+lGE32p1aOTAuOtI9jqhj
 4QDsM3lQFI0YQ3wN1SvKLN6IeGJqCSwO5mChHUpzx1+WPCLzpGRgY3Ms4
 s48BnyEUlayEm5cmAsvGvQq1i+SwMn09GCquYTjIU6WmRIGo9tC41jlIE
 3kGN1k4xKREtGZvImLeJWxO4wjMu4Bo+ZQZwyGAkjuNPY24ZVJpRiSkql
 +zaTw72nLobeodWbpdEymRoG5NrkfpTu/jB+RXYty6UeVlSDV0fp6vX/K Q==;
X-CSE-ConnectionGUID: nm7XYcp6RLe8tngBmZNZew==
X-CSE-MsgGUID: YrDmYwCDQ16uhxzBe4NQ/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="57668451"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="57668451"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 03:48:35 -0700
X-CSE-ConnectionGUID: sHibiZ+8SBygMLBdup4PEg==
X-CSE-MsgGUID: aHVJ+H+HSPStIjEYJu9StA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="201045642"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 03:48:33 -0700
Date: Thu, 28 Aug 2025 12:48:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 zbigniew.kempczynski@intel.com, karthik.b.s@intel.com
Subject: Re: [PATCH i-g-t v4 16/41] lib/vkms: Test connector invalid values
Message-ID: <20250828104830.hrvxbokiuhlqhd3z@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 zbigniew.kempczynski@intel.com, karthik.b.s@intel.com
References: <20250807074550.6543-1-jose.exposito89@gmail.com>
 <20250807074550.6543-17-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250807074550.6543-17-jose.exposito89@gmail.com>
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
On 2025-08-07 at 09:45:25 +0200, José Expósito wrote:
> For a VKMS connector, it is only possible to set invalid values in the
> connector status.
> 
> Test that setting wrong values fails and that the connector is not
> accidentally changed.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  lib/igt_vkms.c             | 24 ++++++++++++++++++
>  lib/igt_vkms.h             |  2 ++
>  tests/vkms/vkms_configfs.c | 50 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 76 insertions(+)
> 
> diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
> index 5d9e13ed7..a86d5e05d 100644
> --- a/lib/igt_vkms.c
> +++ b/lib/igt_vkms.c
> @@ -613,3 +613,27 @@ int igt_vkms_connector_get_status(igt_vkms_t *dev, const char *name)
>  
>  	return read_int(path);
>  }
> +
> +/**
> + * igt_vkms_connector_set_status:
> + * @dev: Device the connector belongs to
> + * @name: Connector name
> + * @type: DRM_MODE_CONNECTED, DRM_MODE_DISCONNECTED or
> + * DRM_MODE_UNKNOWNCONNECTION
> + *
> + * Set a new status for the connector
> + */
> +void igt_vkms_connector_set_status(igt_vkms_t *dev, const char *name,
> +				   int status)
> +{
> +	char path[PATH_MAX];
> +
> +	if (status != DRM_MODE_CONNECTED &&
> +	    status != DRM_MODE_DISCONNECTED &&
> +	    status != DRM_MODE_UNKNOWNCONNECTION)
> +		igt_assert(!"Cannot be reached: Unknown connector status");
> +
> +	igt_vkms_get_connector_status_path(dev, name, path, sizeof(path));
> +
> +	write_int(path, status);
> +}
> diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
> index 13d7ed094..596990547 100644
> --- a/lib/igt_vkms.h
> +++ b/lib/igt_vkms.h
> @@ -58,5 +58,7 @@ void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name);
>  
>  void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name);
>  int igt_vkms_connector_get_status(igt_vkms_t *dev, const char *name);
> +void igt_vkms_connector_set_status(igt_vkms_t *dev, const char *name,
> +				   int status);
>  
>  #endif /* __IGT_VKMS_H__ */
> diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
> index b3fafc069..987491373 100644
> --- a/tests/vkms/vkms_configfs.c
> +++ b/tests/vkms/vkms_configfs.c
> @@ -485,6 +485,55 @@ static void test_connector_default_values(void)
>  	igt_vkms_device_destroy(dev);
>  }
>  
> +/**
> + * SUBTEST: connector-wrong-values
> + * Description: Check that setting unexpected values doesn't work.
> + */
> +
> +static void test_connector_wrong_values(void)
> +{
> +	struct invalid_value invalid_status_values[] = {
> +		{ "", 0 },

Write of zero bytes will not reach your driver, see man 2 write.
With this line removed

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

PS. Louis - gentle ping on review this last patch.

> +		{ "\0", 1 },

btw imho 
		{ "", 1 },
is also valid.

> +		{ "-1", 2 },
> +		{ "0", 1 },
> +		{ "4", 1 },
> +		{ "connected", 10 },
> +	};
> +	igt_vkms_t *dev;
> +	char path[PATH_MAX];
> +	int fd;
> +	int ret;
> +
> +	/* Create a device with a disconnected connector */
> +	dev = igt_vkms_device_create(__func__);
> +	igt_assert(dev);
> +
> +	igt_vkms_device_add_connector(dev, "connector0");
> +	igt_vkms_connector_set_status(dev, "connector0", DRM_MODE_DISCONNECTED);
> +	igt_assert_eq(igt_vkms_connector_get_status(dev, "connector0"),
> +		      DRM_MODE_DISCONNECTED);
> +	igt_vkms_get_connector_status_path(dev, "connector0", path, sizeof(path));
> +
> +	/* Test invalid values for "status" */
> +	for (int i = 0; i < ARRAY_SIZE(invalid_status_values); i++) {
> +		struct invalid_value v = invalid_status_values[i];
> +
> +		fd = open(path, O_WRONLY);
> +		igt_assert_f(fd >= 0, "Error opening '%s'\n", path);
> +
> +		ret = write(fd, v.value, v.size);
> +		igt_assert(ret <= 0);

With zero-byte write removed this should be 'ret < 0'?

Regards,
Kamil

> +
> +		close(fd);
> +	}
> +
> +	igt_assert_eq(igt_vkms_connector_get_status(dev, "connector0"),
> +		      DRM_MODE_DISCONNECTED);
> +
> +	igt_vkms_device_destroy(dev);
> +}
> +
>  igt_main
>  {
>  	struct {
> @@ -505,6 +554,7 @@ igt_main
>  		{ "encoder-default-files", test_encoder_default_files },
>  		{ "connector-default-files", test_connector_default_files },
>  		{ "connector-default-values", test_connector_default_values },
> +		{ "connector-wrong-values", test_connector_wrong_values },
>  	};
>  
>  	igt_fixture {
> -- 
> 2.50.1
> 
