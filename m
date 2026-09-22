Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B908C982FF
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 11:01:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAAAC10E6C1;
	Tue, 22 Sep 2026 11:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DgFqJQ2/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1292010E6A6
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 11:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790074832; x=1821610832;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=L/k9XsCKhBOehJ3QPn/oTTCDJ3rj5AAFfSbQcLWq2f0=;
 b=DgFqJQ2/A9uPZ2Eu0eoWx+b2plUbZwoed8yM2dFj7t+9aUVoB5V0gyv6
 QUsjvVqOGDCO7BCi85Vz8KKYhjeO/veaJt7cA0ITZxr+rAr3Ko7hvKOjA
 w/lCBeIvOF/iHvi7CBKK86mG1s2jp3eY4E6Bbg83cgO01RXtoaSsn4orH
 zcmL6AjgkDek7KFwSD6JVw9Zc3ZdXpxwTNYSxzQalhx2uHKSiyhAK7d/X
 0hjOMD+j7YoamTCq2Jqi5j/PALkvpvnwPhENn82X9ETAF1WD/Vbpl+wFy
 vfpgEnZ/Ky7QfAvHWF8Fui4Ch5VPJGtq59+xhryFrfHLl9CDDMZPB7Jz3 w==;
X-CSE-ConnectionGUID: 6ZE+3nDiQlKWjYZ5gFMT7Q==
X-CSE-MsgGUID: vG79W7R2TxS4bP6wCZVt9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="94497405"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="94497405"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 04:00:32 -0700
X-CSE-ConnectionGUID: nBeDuoEdRiCckg1DET9CvA==
X-CSE-MsgGUID: t0e2NAzgQROKuD2iOvtxuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="299321273"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.3])
 ([172.28.182.3])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 04:00:31 -0700
Message-ID: <f5fab9e2-33e4-4555-bd45-85bacf5ef069@linux.intel.com>
Date: Tue, 22 Sep 2026 13:00:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] lib/igt_pci: Add raw configuration space helpers
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260921143707.2117970-1-piotr.piorkowski@intel.com>
 <20260921143707.2117970-2-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260921143707.2117970-2-piotr.piorkowski@intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>


On 9/21/2026 4:37 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Add helpers to read raw PCI configuration space from sysfs and access
> its contents.
> Provide little-endian u16/u32 readers and standard and extended
> capability lookup helpers for configuration-space buffers.
>
> v2:
> - Validate malformed and cyclic capability chains.
> - Add unit tests for capability lookup and malformed chains.
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Assisted-by: GPT-5.6 Luna
> ---
>   lib/igt_pci.c         | 90 +++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_pci.h         |  8 +++-
>   lib/tests/igt_pci.c   | 66 +++++++++++++++++++++++++++++++
>   lib/tests/meson.build |  1 +
>   4 files changed, 164 insertions(+), 1 deletion(-)
>   create mode 100644 lib/tests/igt_pci.c
>
> diff --git a/lib/igt_pci.c b/lib/igt_pci.c
> index b63550b390..7cc9f2dfd6 100644
> --- a/lib/igt_pci.c
> +++ b/lib/igt_pci.c
> @@ -8,6 +8,7 @@
>   #include <errno.h>
>   #include <fcntl.h>
>   #include <limits.h>
> +#include <linux/pci_regs.h>
>   #include <string.h>
>   #include <unistd.h>
>   #include <pciaccess.h>
> @@ -61,6 +62,95 @@ int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id)
>   	return find_pci_cap_offset_at(dev, cap_id, PCI_CAPS_START);
>   }
>   
> +/**
> + * igt_pci_config_raw_read:
> + * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
> + * @buffer: destination buffer
> + * @length: number of configuration-space bytes to read
> + *
> + * Read raw PCI configuration space through the device sysfs config attribute.
> + *
> + * Returns 0 on success, otherwise a negative errno-like value.
> + */
> +int igt_pci_config_raw_read(const char *pci_slot, void *buffer, size_t length)
> +{
> +	char path[PATH_MAX];
> +	ssize_t ret;
> +	int err;
> +	int fd;
> +
> +	if (!pci_slot || !buffer || !length)
> +		return -EINVAL;
> +
> +	snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s/config", pci_slot);
> +	fd = open(path, O_RDONLY | O_CLOEXEC);
> +	if (fd < 0)
> +		return -errno;
> +
> +	ret = pread(fd, buffer, length, 0);
> +	err = errno;
> +	close(fd);
> +	if (ret < 0)
> +		return -err;
> +
> +	return (size_t)ret == length ? 0 : -EIO;
> +}
> +
> +uint16_t igt_pci_config_raw_read_u16(const uint8_t *config, unsigned int offset)
> +{
> +	return config[offset] | (config[offset + 1] << 8);
> +}
> +
> +uint32_t igt_pci_config_raw_read_u32(const uint8_t *config, unsigned int offset)
> +{
> +	return igt_pci_config_raw_read_u16(config, offset) |
> +	       ((uint32_t)igt_pci_config_raw_read_u16(config, offset + 2) << 16);
> +}
> +
> +int igt_pci_config_raw_find_cap_offset(const uint8_t *config, uint8_t cap_id)
> +{
> +	unsigned int offset = config[PCI_CAPS_START];
> +	unsigned int loop = (PCI_CFG_SPACE_SIZE - PCI_TYPE0_1_HEADER_SIZE) / 2;
> +
> +	while (offset && loop--) {
> +		if (offset < PCI_TYPE0_1_HEADER_SIZE ||
> +		    offset > PCI_CFG_SPACE_SIZE - 2 || offset & 3)
> +			return -EINVAL;
> +
> +		if (config[offset] == cap_id)
> +			return offset;
> +
> +		offset = config[offset + 1];
> +	}
> +
> +	return offset ? -ELOOP : 0;
> +}
Can we consolidate/reuse the loop logic into a common helper shared by 
igt_pci_config_raw_find_cap_offset
and find_pci_cap_offset_at ?
There's also a discrepancy in low-2-bit handling - those bits should be 
masked off, not validated/rejected.
> +
> +int igt_pci_config_raw_find_ext_cap_offset(const uint8_t *config, uint16_t cap_id)
> +{
> +	unsigned int offset = PCI_EXT_CAPS_START;
> +	unsigned int loop = (PCI_EXT_CFG_SPACE_SIZE - offset) / 4;
> +
> +	while (loop) {
> +		uint32_t header = igt_pci_config_raw_read_u32(config, offset);
> +
> +		loop--;
> +
> +		if (!header)
> +			return 0;
> +		if ((header & 0xffff) == cap_id)
> +			return offset;
> +
> +		offset = (header >> 20) & 0xffc;
> +		if (!offset)
> +			return 0;
> +		if (offset < PCI_EXT_CAPS_START || offset >= PCI_EXT_CFG_SPACE_SIZE)
> +			return -EINVAL;
> +	}
> +
> +	return -ELOOP;
> +}
> +
Maybe it's worth to check a special-case an all-0xffffffff header (what 
you get back when extended config space isn't implemented/accessible) 
instead of walking it as real data?
>   static int open_pci_driver_dir(const char *driver)
>   {
>   	char path[PATH_MAX];
> diff --git a/lib/igt_pci.h b/lib/igt_pci.h
> index 509345b2d8..628cc24766 100644
> --- a/lib/igt_pci.h
> +++ b/lib/igt_pci.h
> @@ -15,7 +15,8 @@ struct pci_device;
>   
>   #define PCI_TYPE0_1_HEADER_SIZE 0x40
>   #define PCI_CAPS_START 0x34
> -#define PCI_CFG_SPACE_SIZE 0x100
> +#define PCI_EXT_CAPS_START 0x100
> +#define PCI_EXT_CFG_SPACE_SIZE 0x1000
>   
>   enum pci_cap_id {
>   	PCI_EXPRESS_CAP_ID = 0x10
> @@ -27,6 +28,11 @@ enum pci_cap_id {
>   #define  PCI_SLOT_PWR_CTRL_PRESENT (1 << 1)
>   
>   int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id);
> +int igt_pci_config_raw_read(const char *pci_slot, void *buffer, size_t length);
> +uint16_t igt_pci_config_raw_read_u16(const uint8_t *config, unsigned int offset);
> +uint32_t igt_pci_config_raw_read_u32(const uint8_t *config, unsigned int offset);
> +int igt_pci_config_raw_find_cap_offset(const uint8_t *config, uint8_t cap_id);
> +int igt_pci_config_raw_find_ext_cap_offset(const uint8_t *config, uint16_t cap_id);
>   int igt_pci_device_unbind(const char *pci_slot);
>   int igt_pci_driver_bind(const char *driver, const char *pci_slot);
>   int igt_pci_driver_unbind(const char *driver, const char *pci_slot);
> diff --git a/lib/tests/igt_pci.c b/lib/tests/igt_pci.c
> new file mode 100644
> index 0000000000..191edb95c5
> --- /dev/null
> +++ b/lib/tests/igt_pci.c
> @@ -0,0 +1,66 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <errno.h>
> +#include <linux/pci_regs.h>
> +#include <stdint.h>
> +#include <string.h>
> +
> +#include "igt_core.h"
> +#include "igt_pci.h"
> +
> +static void write_u32(uint8_t *config, unsigned int offset, uint32_t value)
> +{
> +	config[offset] = value;
> +	config[offset + 1] = value >> 8;
> +	config[offset + 2] = value >> 16;
> +	config[offset + 3] = value >> 24;
> +}
> +
> +static void test_cap(void)
> +{
> +	uint8_t config[PCI_CFG_SPACE_SIZE] = {};
> +
> +	config[PCI_CAPS_START] = PCI_TYPE0_1_HEADER_SIZE;
> +	config[PCI_TYPE0_1_HEADER_SIZE] = 0xaa;
> +	igt_assert_eq(igt_pci_config_raw_find_cap_offset(config, 0xaa),
> +		      PCI_TYPE0_1_HEADER_SIZE);
> +
> +	config[PCI_CAPS_START] = 0xff;
> +	igt_assert_eq(igt_pci_config_raw_find_cap_offset(config, 0xaa), -EINVAL);
> +
> +	config[PCI_CAPS_START] = PCI_TYPE0_1_HEADER_SIZE;
> +	config[PCI_TYPE0_1_HEADER_SIZE] = 0xbb;
> +	config[PCI_TYPE0_1_HEADER_SIZE + 1] = PCI_TYPE0_1_HEADER_SIZE;
> +	igt_assert_eq(igt_pci_config_raw_find_cap_offset(config, 0xaa), -ELOOP);
> +}
> +
> +static void test_ext_cap(void)
> +{
> +	uint8_t config[PCI_EXT_CFG_SPACE_SIZE] = {};
> +	unsigned int offset;
> +
> +	write_u32(config, PCI_EXT_CAPS_START, 0xaa);
> +	igt_assert_eq(igt_pci_config_raw_find_ext_cap_offset(config, 0xaa),
> +		      PCI_EXT_CAPS_START);
> +
> +	write_u32(config, PCI_EXT_CAPS_START,
> +		  0xbb | (PCI_EXT_CAPS_START << 20));
> +	igt_assert_eq(igt_pci_config_raw_find_ext_cap_offset(config, 0xaa), -ELOOP);
> +
> +	memset(config, 0, sizeof(config));
> +	for (offset = PCI_EXT_CAPS_START;
> +	     offset < PCI_EXT_CFG_SPACE_SIZE - sizeof(uint32_t);
> +	     offset += sizeof(uint32_t))
> +		write_u32(config, offset, 0xbb | ((offset + sizeof(uint32_t)) << 20));
> +
> +	igt_assert_eq(igt_pci_config_raw_find_ext_cap_offset(config, 0xaa), 0);
> +}
> +
> +int igt_simple_main()
> +{
> +	test_cap();
> +	test_ext_cap();
> +}
> \ No newline at end of file
> diff --git a/lib/tests/meson.build b/lib/tests/meson.build
> index f1db66d07c..0a7c903f16 100644
> --- a/lib/tests/meson.build
> +++ b/lib/tests/meson.build
> @@ -19,6 +19,7 @@ lib_tests = [
>   	'igt_invalid_subtest_name',
>   	'igt_nesting',
>   	'igt_no_exit',
> +	'igt_pci',
>   	'igt_runnercomms_packets',
>   	'igt_segfault',
>   	'igt_simulation',
