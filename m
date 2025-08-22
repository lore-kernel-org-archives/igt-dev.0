Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF616CA0EED
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 13:21:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B7510E0DE;
	Fri, 22 Aug 2025 13:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nMtitL8e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA55A10E0DE
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 13:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755868893; x=1787404893;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xdBkmluGqyO6i1vrrejlLZeRIuf2/1afHbDJ16cWOMw=;
 b=nMtitL8eJqHSHg7ndL8Td+nunTMHOdIl7QgHwnVXRDG/eGwzyg222tsK
 Lc0mM4aune+3DtPD9AQrWBJDFA6o345QM51p9Z+3+RXzvjjCVkR6vqYz6
 Thyz2CaE76k1428j2/5BcIpnBmURReT0lTBl/5jeoqurXM2hALyX2dY/0
 Hnp1wu9NhCtuLsyCR6Ecyai2kefBqNRaDsfFn7cdZcrPJwvD+NPrY5j21
 MGNRXDxzgu6eArUC6GBtazD/l+dYbmIPG03XvWecRo4u13uDHE+SRDGVv
 EUOii+rmqKkivQrKaDSd6Gp+9VqrZtVXZg2evZO7cAuGXPWZHTjbFmZSy Q==;
X-CSE-ConnectionGUID: BdxxF2jEQTKI1lfHaGrpWQ==
X-CSE-MsgGUID: kRzmYw4aSDODcTTUAa45HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="60801580"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="60801580"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 06:21:33 -0700
X-CSE-ConnectionGUID: WfNYuRmCTmmENOpTkF/0RQ==
X-CSE-MsgGUID: mE0j9b/aRcCFzUHeCkaglA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="199583660"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 06:21:31 -0700
Date: Fri, 22 Aug 2025 15:21:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH i-g-t 1/4] tests/intel/xe_configfs: Do not execute with
 open fd
Message-ID: <20250822132128.nwalcgd6fb6v3grz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 igt-dev@lists.freedesktop.org, Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
References: <20250819-configfs-unbind-v1-0-8359e66e3241@intel.com>
 <20250819-configfs-unbind-v1-1-8359e66e3241@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250819-configfs-unbind-v1-1-8359e66e3241@intel.com>
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
On 2025-08-19 at 13:40:40 -0700, Lucas De Marchi wrote:
> The survivability_mode test does an unbind/set-configfs/bind sequence.
> If and fd is open, that will still refer to the old instance of the
> driver and is a dangling fd. Close it right when it's not needed anymore
> as in future other tests will also unbind/bind.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tests/intel/xe_configfs.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 5c65cd01d..f01b13e13 100644
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
> +		close(fd);

Please use drm_close_driver().

Regards,
Kamil

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
