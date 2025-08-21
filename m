Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE6ACA0EEB
	for <igt-dev@archiver.kernel.org>; Thu, 21 Aug 2025 15:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DA110E9C6;
	Thu, 21 Aug 2025 15:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h9SH5trS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABB110E9C6
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Aug 2025 15:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755789788; x=1787325788;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1pMJvFTjhF8dts0R4EXEnZ7Y4Nqq6mtyDUW+7BNy/VE=;
 b=h9SH5trSLMv9cXLAr08VCTm9RBdaTyQJOJADlzzqfbUWBkXja+lE0xKz
 XK+FWmsintoQSpq7F/H+6QgehJidkqPFkjOXPFbZEn1ecm+EBjJc1bxFr
 CCGCAY9Rf82LB43s004uft+hqHQMck1j6LaeW5BE7KlMIOBV46w1n5gYY
 H11uXEFCc5rLHliZ+cevtaz0h5T907Y3C1hXFTiVPOSpxEiTi1IUjm4hL
 CI6qDa3ZZUZ+ONv74uKVoTgNpE6dgDrd9UOzOf3bwR5TZ2q8zxMTlzApt
 hMC8/5a44B5PcX/y5rzHotVSvxHPCHQFM4baZEojTpkL4DWNlsbZYqbAo Q==;
X-CSE-ConnectionGUID: m+mZT1bLROyXZapRfEWHOQ==
X-CSE-MsgGUID: kLs8lAWFSvOX5+hE0SgLmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="83501125"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="83501125"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 08:23:08 -0700
X-CSE-ConnectionGUID: LTX9YTuOQwumD17G47l3cg==
X-CSE-MsgGUID: TPUU+CBPT4yClPUGhEmQgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="173775452"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 08:23:06 -0700
Date: Thu, 21 Aug 2025 17:23:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sk Anirban <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org, raag.jadav@intel.com,
 anshuman.gupta@intel.com, riana.tauro@intel.com
Subject: Re: [PATCH v2] tests/intel/xe_configfs: Add i2c adapter check in
 survivability mode
Message-ID: <20250821152303.ykhyym5ikjnl6ly7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sk Anirban <sk.anirban@intel.com>, igt-dev@lists.freedesktop.org,
 raag.jadav@intel.com, anshuman.gupta@intel.com,
 riana.tauro@intel.com
References: <20250813100117.910824-2-sk.anirban@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813100117.910824-2-sk.anirban@intel.com>
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

Hi Sk,
On 2025-08-13 at 15:31:11 +0530, Sk Anirban wrote:

please make it explicit that this is adding new test, maybe
something like:

[PATCH v2] tests/intel: Add new xe_survivability test for i2c adapter

Few more nits below.

> Add i2c adapter presence check in survivability mode to ensure
> the Add-In Management Controller (AMC) can receive firmware updates
> when the device is in survivability mode.

Could above be also a part of a comment or description
in a test or subtest?

> 
> v2: Create new file for test (Riana)
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>  tests/intel/xe_configfs.c      |  36 +------
>  tests/intel/xe_survivability.c | 174 +++++++++++++++++++++++++++++++++
>  tests/meson.build              |   1 +
>  3 files changed, 177 insertions(+), 34 deletions(-)
>  create mode 100644 tests/intel/xe_survivability.c
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 5c65cd01d..e573421aa 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -2,7 +2,9 @@
>  /*
>   * Copyright © 2025 Intel Corporation
>   */
> +#include <dirent.h>
>  #include <limits.h>
> +#include <fcntl.h>

Move fcntl.h  after dirent.h

>  
>  #include "igt.h"
>  #include "igt_configfs.h"
> @@ -31,33 +33,6 @@ static void restore(int sig)
>  	igt_kmod_bind("xe", bus_addr);
>  }
>  
> -static void set_survivability_mode(int configfs_device_fd, bool value)
> -{
> -	igt_kmod_unbind("xe", bus_addr);
> -	igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode", value);
> -	igt_kmod_bind("xe", bus_addr);
> -}
> -
> -/**
> - * SUBTEST: survivability-mode
> - * Description: Validate survivability mode by setting configfs
> - */
> -static void test_survivability_mode(int configfs_device_fd)
> -{
> -	char path[PATH_MAX];
> -	int fd;
> -
> -	/* Enable survivability mode */
> -	set_survivability_mode(configfs_device_fd, true);
> -
> -	/* check presence of survivability mode sysfs */
> -	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
> -
> -	fd = open(path, O_RDONLY);
> -	igt_assert_f(fd >= 0, "Survivability mode not set\n");
> -	close(fd);
> -}
> -
>  /**
>   * SUBTEST: engines-allowed-invalid
>   * Description: Validate engines_allowed attribute for invalid values
> @@ -128,13 +103,6 @@ igt_main
>  		configfs_device_fd = create_device_configfs_group(configfs_fd, fd);
>  	}
>  
> -	igt_describe("Validate survivability mode");
> -	igt_subtest("survivability-mode") {
> -		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
> -		igt_install_exit_handler(restore);
> -		test_survivability_mode(configfs_device_fd);
> -	}
> -
>  	igt_describe("Validate engines_allowed with invalid options");
>  	igt_subtest("engines-allowed-invalid") {
>  		igt_install_exit_handler(restore);
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> new file mode 100644
> index 000000000..1bfcb2756
> --- /dev/null
> +++ b/tests/intel/xe_survivability.c
> @@ -0,0 +1,174 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#include <dirent.h>
> +#include <limits.h>
> +#include <fcntl.h>

Same here, fcntl.h header should be after dirent.h

> +
> +#include "igt.h"
> +#include "igt_configfs.h"
> +#include "igt_device.h"
> +#include "igt_fs.h"
> +#include "igt_kmod.h"
> +#include "igt_sysfs.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * TEST: Comprehensive survivability mode testing
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: survivability
> + * Functionality: survivability mode
> + * Description: validate survivability mode functionality including i2c and runtime behavior
> + * Test category: functionality test
> + */
> +
> +static char bus_addr[NAME_MAX];
> +
> +static int find_i2c_adapter(struct pci_device *pci_xe)
> +{
> +	char device_path[PATH_MAX];
> +	struct dirent *dirent;
> +	int i2c_adapter = -1;
> +	DIR *device_dir;
> +	int ret;
> +
> +	igt_require(igt_kmod_load("i2c-dev", NULL) == 0);
> +
> +	snprintf(device_path, sizeof(device_path), "/sys/bus/pci/devices/%s/%s.%hu", bus_addr,
> +		 "i2c_designware", (pci_xe->bus << 8) | (pci_xe->dev));
> +	device_dir = opendir(device_path);
> +
> +	if (!device_dir)
> +		return -1;
> +
> +	while ((dirent = readdir(device_dir))) {
> +		if (strncmp(dirent->d_name, "i2c-", 4) == 0) {
> +			ret = sscanf(dirent->d_name, "i2c-%d", &i2c_adapter);
> +			igt_assert_f(ret == 1, "Failed to parse i2c adapter number");
> +			closedir(device_dir);
> +			return i2c_adapter;
> +		}
> +	}
> +
> +	closedir(device_dir);
> +	return i2c_adapter;
> +}
> +
> +static void restore(int sig)
> +{
> +	/* Restore after survivability mode */
> +	igt_kmod_unbind("xe", bus_addr);
> +	igt_kmod_bind("xe", bus_addr);
> +}
> +
> +static void set_survivability_mode(int configfs_device_fd, bool value)
> +{
> +	igt_kmod_unbind("xe", bus_addr);
> +	igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode", value);
> +	igt_kmod_bind("xe", bus_addr);
> +}
> +
> +/**
> + * SUBTEST: i2c-functionality
> + * Description: Validate i2c adapter functionality in survivability mode
> + */
> +static void test_i2c_functionality(int configfs_device_fd, struct pci_device *pci_xe)
> +{
> +	int i2c_adapter_before, i2c_adapter_after;
> +	char path[PATH_MAX];
> +	int fd;
> +
> +	/* Check i2c adapter before survivability mode */
> +	i2c_adapter_before = find_i2c_adapter(pci_xe);
> +
> +	/* Enable survivability mode */
> +	set_survivability_mode(configfs_device_fd, true);
> +
> +	/* check presence of survivability mode sysfs */
> +	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
> +
> +	fd = open(path, O_RDONLY);
> +	igt_assert_f(fd >= 0, "Survivability mode not set\n");
> +	close(fd);
> +
> +	/* Check i2c adapter after survivability mode */
> +	i2c_adapter_after = find_i2c_adapter(pci_xe);
> +	if (i2c_adapter_before >= 0) {
> +		igt_assert_f(i2c_adapter_after >= 0,
> +			     "i2c adapter disappeared in survivability mode (was %d)",
> +			     i2c_adapter_before);
> +	}
> +}
> +
> +/**
> + * SUBTEST: survivability-mode
> + * Description: Validate survivability mode by setting configfs
> + */
> +static void test_survivability_mode(int configfs_device_fd)
> +{
> +	char path[PATH_MAX];
> +	int fd;
> +
> +	/* Enable survivability mode */
> +	set_survivability_mode(configfs_device_fd, true);
> +
> +	/* check presence of survivability mode sysfs */
> +	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
> +
> +	fd = open(path, O_RDONLY);
> +	igt_assert_f(fd >= 0, "Survivability mode not set\n");
> +	close(fd);
> +}
> +
> +static int create_device_configfs_group(int configfs_fd, int fd)
> +{
> +	int configfs_device_fd;
> +	struct pci_device *pci_dev;
> +	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
> +
> +	pci_dev = igt_device_get_pci_device(fd);
> +	snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +
> +	configfs_device_fd = igt_fs_create_dir(configfs_fd, bus_addr, mode);
> +	igt_assert(configfs_device_fd);
> +
> +	return configfs_device_fd;
> +}
> +
> +igt_main
> +{
> +	int fd, configfs_fd, configfs_device_fd;
> +	struct pci_device *pci_xe;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +		pci_xe = igt_device_get_pci_device(fd);
> +		configfs_fd = igt_configfs_open("xe");
> +		igt_require(configfs_fd != -1);
> +		configfs_device_fd = create_device_configfs_group(configfs_fd, fd);
> +		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
> +	}
> +
> +	igt_describe("Validate survivability mode");
> +	igt_subtest("survivability-mode") {
> +		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
> +		igt_install_exit_handler(restore);
> +		test_survivability_mode(configfs_device_fd);
> +	}
> +
> +	igt_describe("Validate i2c adapter functionality in survivability mode");
> +	igt_subtest("i2c-functionality") {
> +		igt_install_exit_handler(restore);
> +		test_i2c_functionality(configfs_device_fd, pci_xe);
> +	}
> +
> +	igt_fixture {
> +		igt_fs_remove_dir(configfs_fd, bus_addr);
> +		close(configfs_device_fd);
> +		close(configfs_fd);
> +		close(fd);

Use drm_close_driver() here. Also see Lucas patchseries

https://patchwork.freedesktop.org/series/153175/
tests/intel/xe_configfs: Unbind before tests

for possible improvements needed in your test.

Regards,
Kamil

> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 5c01c64e9..8f264d8e8 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -329,6 +329,7 @@ intel_xe_progs = [
>  	'xe_sriov_auto_provisioning',
>  	'xe_sriov_flr',
>  	'xe_sriov_scheduling',
> +	'xe_survivability',
>  	'xe_sysfs_defaults',
>  	'xe_sysfs_preempt_timeout',
>  	'xe_sysfs_scheduler',
> -- 
> 2.43.0
> 
