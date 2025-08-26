Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BEECA0EFA
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 07:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB4210E60D;
	Tue, 26 Aug 2025 07:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P0uT1EXB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5D810E60D
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 07:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756195041; x=1787731041;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iPG9DXcTE80dwm+s8Qo4ENj7W9TmmdSsDlG5XZ1z3ts=;
 b=P0uT1EXBXGBivOafS6GY9H9n9dLIhl5mxOkbRxe6mzX1u3pkvXzWTeFk
 nd6QdeLKSyP7XerZ7R1ppJWaWL2ihqnJ10LOhNVovNkS4Z6F4B0uQiBf6
 8Pgnh6Glz0y+0P2BKTt0lbHSexDe15D91jn72fOH2Kh0uebG7uVdhFPpO
 nXBZsJhaukbGHEoRdAfNzraNeVqWHk3ooFITuaoBEbZocZ7PVUyhHizm1
 6d2F5ygihE7+cRtExTLXudYtyCSl2yS4KWUR4oGBz0/becSMazrHZyNxJ
 V9Vk/C8dO4l7GbZufZbz4LHf30DQSzl4bL2XRJ35GvYyFTOf2ejv9Oc6C A==;
X-CSE-ConnectionGUID: qJMEeyMISC6NcaWW9W9zyw==
X-CSE-MsgGUID: +VWo5xX4Sh+/E2+QORPp9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58477872"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58477872"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 00:55:10 -0700
X-CSE-ConnectionGUID: 3pErSK+CQ0W8STaoExVVQw==
X-CSE-MsgGUID: AXfvut4aTDmtWm3I0ozSig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="206663644"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 00:55:04 -0700
Date: Tue, 26 Aug 2025 09:54:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH i-g-t v2 1/4] tests/intel/xe_configfs: Do not execute
 with open fd
Message-ID: <20250826075449.x7h5btakkdxsmaej@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 igt-dev@lists.freedesktop.org, Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
References: <20250825-configfs-unbind-v2-0-62e7508d3ed7@intel.com>
 <20250825-configfs-unbind-v2-1-62e7508d3ed7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825-configfs-unbind-v2-1-62e7508d3ed7@intel.com>
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

Hi Lucas,
On 2025-08-25 at 08:59:43 -0700, Lucas De Marchi wrote:
> The survivability_mode test does an unbind/set-configfs/bind sequence.
> If and fd is open, that will still refer to the old instance of the
> driver and is a dangling fd. Close it right when it's not needed anymore
> as in future other tests will also unbind/bind.
> 
> While moving this code around, also make sure to use drm_close_driver()
> so the fd is dropped from the cache.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

See one nit below not related to your change.

> ---
> v2:
> - Use drm_close_driver()  (Kamil)
> ---
>  tests/intel/xe_configfs.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 5c65cd01d..57f770b0b 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -101,15 +101,19 @@ static void test_engines_allowed(int configfs_device_fd)
>  	}
>  }
>  
> -static int create_device_configfs_group(int configfs_fd, int fd)
> +static void set_bus_addr(int fd)
>  {
> -	int configfs_device_fd;
>  	struct pci_device *pci_dev;
> -	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
>  
>  	pci_dev = igt_device_get_pci_device(fd);
>  	snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
>  		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +}
> +
> +static int create_device_configfs_group(int configfs_fd)
> +{
> +	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
> +	int configfs_device_fd;
>  
>  	configfs_device_fd = igt_fs_create_dir(configfs_fd, bus_addr, mode);
>  	igt_assert(configfs_device_fd);

imho this assert should be igt_require? note that it is in
an igt_fixup or function should just return it and leave
assert/require to a test.
Also if create_dir fails, will this value be -1 or -errno
so assert will not catch it.

Regards,
Kamil

> @@ -120,17 +124,22 @@ static int create_device_configfs_group(int configfs_fd, int fd)
>  igt_main
>  {
>  	int fd, configfs_fd, configfs_device_fd;
> +	uint32_t devid;
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
> +		devid = intel_get_drm_devid(fd);
> +		set_bus_addr(fd);
> +		drm_close_driver(fd);
> +
>  		configfs_fd = igt_configfs_open("xe");
>  		igt_require(configfs_fd != -1);
> -		configfs_device_fd = create_device_configfs_group(configfs_fd, fd);
> +		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  	}
>  
>  	igt_describe("Validate survivability mode");
>  	igt_subtest("survivability-mode") {
> -		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
> +		igt_require(IS_BATTLEMAGE(devid));
>  		igt_install_exit_handler(restore);
>  		test_survivability_mode(configfs_device_fd);
>  	}
> @@ -151,6 +160,5 @@ igt_main
>  		igt_fs_remove_dir(configfs_fd, bus_addr);
>  		close(configfs_device_fd);
>  		close(configfs_fd);
> -		close(fd);
>  	}
>  }
> 
> -- 
> 2.50.1
> 
