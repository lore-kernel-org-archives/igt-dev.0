Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2EEC3ABCC
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 14:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CCF10E26F;
	Wed, 14 May 2025 14:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CCf7cuP5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D5B10E26F
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 14:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747233966; x=1778769966;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EWsT8LZbFPT1+8noZq22eoJODOXwEXYVUYCSYxfoOXA=;
 b=CCf7cuP5yRsNv9mMR4puqYtiD/EoTNBLd2MciIggfp+zSG+MbxQRmK/o
 fyLpwbp+uOui1PHSuNJFdFGOrg5Rq/TL87G6Awf2pXEijtxE7p3ErjVtt
 8HjwZm67of0J8I5GAfV4FJe1DpYEV26PE3C3h/VLM9H+oTxmSGmhaaBSM
 Z8BF2Mrbpln1uUY/sZo241sC9cdbIXH4EKa/ivXJz1WQ50Me/M/mP3DRs
 dZ7cFNX/CVZuVJlrH2DOr2fgXo4V/yqVq0YqPcv1zR0IH0bXCUCRBe5v+
 FZW7dBkzm0ULMrqHK8kd9N/k8pRk0bMO8IvTYfLe9SjMCQh0uHNXWBEDg A==;
X-CSE-ConnectionGUID: adydxngOT3+lO5ibULeSng==
X-CSE-MsgGUID: raEg1hyYQv2hnQeEfPoz0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="51775183"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="51775183"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 07:46:06 -0700
X-CSE-ConnectionGUID: mFaHWnWNT9WgHI4/T1Lhow==
X-CSE-MsgGUID: tWdutQkTTd6sggtkngA+LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="169148300"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.199.227])
 ([10.247.199.227])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 07:46:03 -0700
Message-ID: <75e2a181-a44a-4599-a618-59ad659d80d0@linux.intel.com>
Date: Wed, 14 May 2025 20:16:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 5/5] tests/intel/xe_configfs: Add test to
 validate survivability mode
To: Riana Tauro <riana.tauro@intel.com>, igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 kamil.konieczny@intel.com, rodrigo.vivi@intel.com, louis.chauvet@bootlin.com
References: <20250513142827.1129334-1-riana.tauro@intel.com>
 <20250513142827.1129334-6-riana.tauro@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20250513142827.1129334-6-riana.tauro@intel.com>
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


On 13-05-2025 19:58, Riana Tauro wrote:
> The test validates if survivability mode is enabled on supported
> platforms when configured using configfs attribute.
>
> v2: make test platform specific
>     check for presence of file for survivability mode
>     use mode_t flags (Aravind)

LGTM

Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>

Thanks,
Aravind.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  tests/intel/xe_configfs.c | 100 ++++++++++++++++++++++++++++++++++++++
>  tests/meson.build         |   1 +
>  2 files changed, 101 insertions(+)
>  create mode 100644 tests/intel/xe_configfs.c
>
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> new file mode 100644
> index 000000000..4d244321c
> --- /dev/null
> +++ b/tests/intel/xe_configfs.c
> @@ -0,0 +1,100 @@
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
> +/**
> + * SUBTEST: survivability-mode
> + * Description: Validate survivability mode by setting configfs
> + */
> +static void test_survivability_mode(int dir_fd)
> +{
> +	char path[PATH_MAX];
> +	int fd;
> +
> +	/* Enable survivability mode */
> +	set_survivability_mode(dir_fd, true);
> +
> +	/* check presence of survivability mode sysfs */
> +	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
> +
> +	fd = open(path, O_RDONLY);
> +	igt_assert_f(fd >= 0, "Survivability mode not set\n");
> +	close(fd);
> +}
> +
> +static int create_device_configfs(int configfs_fd, int fd)
> +{
> +	int dir_fd;
> +	struct pci_device *pci_dev;
> +	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
> +
> +	pci_dev = igt_device_get_pci_device(fd);
> +	snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +
> +	dir_fd = igt_fs_create_dir(configfs_fd, bus_addr, mode);
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
> +		configfs_fd = igt_configfs_open("xe");
> +		igt_require(configfs_fd != -1);
> +		dir_fd = create_device_configfs(configfs_fd, fd);
> +	}
> +
> +	igt_describe("Validate survivability mode");
> +	igt_subtest("survivability-mode") {
> +		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
> +		igt_install_exit_handler(restore);
> +		test_survivability_mode(dir_fd);
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
> index 20ddddb89..55bcf57ec 100644
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
