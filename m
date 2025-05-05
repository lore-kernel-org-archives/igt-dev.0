Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E68BC369C2
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 07:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DE810E28B;
	Mon,  5 May 2025 07:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LVoT7R8g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C4D10E28B
 for <igt-dev@lists.freedesktop.org>; Mon,  5 May 2025 07:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746428901; x=1777964901;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=D+De71F34nSy2SsVgOUpEx/EBHBmvaR26C3tJA/H0U8=;
 b=LVoT7R8gmAN0LxTgAeRqssSEGxZ8JT4oGYgzi9LBDTjic8ZJGI3HnGSh
 0qdS/aWskBE/MBkJH4Rcx1efNvyIZU+OGYWm5pUzSkwIeCMdcyQ1hTlT2
 anpD7l6PJ5fIpl0HXhhRWyPOGrquPcs4xk0OFjyr//DUXkLr8Ya95e2PI
 z8EXYp8rX7skEpayLnoozEpnjFSEnNxjcJ+LQsA/dBj7fJWeESYzD32SC
 Fq/EtExHkj/h/3cvx1/YT2EnBqZXY2Hi80fZhYXlZ0H8yj36+N3cVF/XR
 gM6kITxbcWEwClyRY6tbRUe3+emXZcWYQfV8+od//Jo7IFr2uDI94LGh1 g==;
X-CSE-ConnectionGUID: kvk6N2kyRuqxSQuhO+nX9A==
X-CSE-MsgGUID: VVUz3dghSkiULf3YcvB0bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="47280998"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="47280998"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 00:08:19 -0700
X-CSE-ConnectionGUID: krGtks6LRUOSbWPG4XjgZw==
X-CSE-MsgGUID: qR32nePpQwOeNRmK4Nx35Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="135124473"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.235.34])
 ([10.247.235.34])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 00:08:17 -0700
Message-ID: <da1100ab-79ba-42a8-923c-dea399557e3f@linux.intel.com>
Date: Mon, 5 May 2025 12:38:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_configfs: Add test to validate
 survivability mode
To: Riana Tauro <riana.tauro@intel.com>, igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 louis.chauvet@bootlin.com
References: <20250422095602.55041-1-riana.tauro@intel.com>
 <20250422095602.55041-6-riana.tauro@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20250422095602.55041-6-riana.tauro@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>


On 22-04-2025 15:26, Riana Tauro wrote:
> The test validates if survivability mode is enabled on supported
> platforms when configured using configfs attribute.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  tests/intel/xe_configfs.c | 112 ++++++++++++++++++++++++++++++++++++++
>  tests/meson.build         |   1 +
>  2 files changed, 113 insertions(+)
>  create mode 100644 tests/intel/xe_configfs.c
>
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> new file mode 100644
> index 000000000..414af4a86
> --- /dev/null
> +++ b/tests/intel/xe_configfs.c
> @@ -0,0 +1,112 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#include <limits.h>
> +
> +#include "igt.h"
> +#include "igt_configfs.h"
> +#include "igt_device.h"
> +#include "igt_fs.h"
> +#include "igt_kmod.h"
> +#include "igt_sysfs.h"
> +
> +/**
> + * TEST: Check configfs userspace API
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: uapi
> + * Functionality: configfs
> + * Description: validate configfs entries
> + * Test category: functionality test
> + */
> +
> +static char bus_addr[NAME_MAX];
> +static uint32_t dev_id;
> +
> +static void restore(int sig)
> +{
> +	/* Restore after survivability mode */
> +	igt_kmod_unbind("xe", bus_addr);
> +	igt_kmod_bind("xe", bus_addr);
> +}
> +
> +static void set_survivability_mode(int dir_fd, bool value)
> +{
> +	igt_kmod_unbind("xe", bus_addr);
> +	igt_sysfs_set_boolean(dir_fd, "survivability_mode", value);
> +	igt_kmod_bind("xe", bus_addr);
> +}
> +
> +static void check_survivability_mode(void)
> +{
> +	char path[PATH_MAX], buf[4096];
> +	int fd, len;
> +
> +	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s", bus_addr);
> +	fd = open(path, O_RDONLY);
> +	igt_assert_f(fd >= 0, "Cannot open %s\n", path);
> +
> +	len = igt_sysfs_read(fd, "survivability_mode", buf, sizeof(buf) - 1);
> +	if (len > 0) {
> +		buf[len] = '\0';
> +		igt_info("Survivability Mode:\n%s", buf);
> +	}
> +	close(fd);

Also, existence of survivability_mode file should be sufficient to
indicate we are in that mode, no need to read it.

> +
> +	if (IS_BATTLEMAGE(dev_id))
> +		igt_assert_f(len > 0, "Survivability mode not set\n");
> +}
> +
> +/**
> + * SUBTEST: survivability-mode
> + * Description: Validate survivability mode by setting configfs
> + */
> +static void test_survivability_mode(int dir_fd)
> +{
> +	/* Enable survivability mode */
> +	set_survivability_mode(dir_fd, true);
> +
> +	check_survivability_mode();
> +}
> +
> +static int create_device_configfs(int configfs_fd, int fd)
> +{
> +	int dir_fd;
> +	struct pci_device *pci_dev;
> +
> +	pci_dev = igt_device_get_pci_device(fd);
> +	snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +
> +	dir_fd = igt_fs_create_dir(configfs_fd, bus_addr, 0755);

it would be good to use S_IRWXU type flags rather than 0755

> +	igt_assert(dir_fd);
> +
> +	return dir_fd;
> +}
> +
> +igt_main
> +{
> +	int fd, configfs_fd, dir_fd;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +		dev_id = intel_get_drm_devid(fd);
> +		configfs_fd = igt_configfs_open("xe");
> +		igt_require(configfs_fd != -1);
> +		dir_fd = create_device_configfs(configfs_fd, fd);
> +	}
> +
> +	igt_describe("Validate survivability mode");
> +	igt_subtest("survivability-mode") {
> +		igt_install_exit_handler(restore);
> +		test_survivability_mode(dir_fd);
should this be restricted to platforms which support survivability mode.
> +	}
> +
> +	igt_fixture {
> +		igt_fs_remove_dir(configfs_fd, bus_addr);
> +		close(dir_fd);
> +		close(configfs_fd);
> +		close(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 8cb3fc4d2..e0e9ed299 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -279,6 +279,7 @@ intel_xe_progs = [
>  	'xe_compute',
>  	'xe_compute_preempt',
>  	'xe_copy_basic',
> +	'xe_configfs',
>  	'xe_dma_buf_sync',
>  	'xe_drm_fdinfo',
>  	'xe_eu_stall',
Thanks,
Aravind.
