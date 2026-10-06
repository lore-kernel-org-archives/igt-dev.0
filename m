Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FACACA5FF0
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 09:38:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1AC10E30C;
	Tue,  6 Oct 2026 09:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fGMSVFnY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D880510E2ED
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 09:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791279473; x=1822815473;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=5QbUdPV74AZVK+NTExUXssQXht2O616aIBYxPZPx2G0=;
 b=fGMSVFnYJT+PzOyAcdD1To63yIfdIm8cjwB5P97pWLWGGA1omYoqotxP
 lfYT7YoAlOzxkZ9h4qY6s9kND61uaa/HLKx5DgGtIh40fWJrS8wYz7iOe
 WUgOHpaN49+SPMLTy67unMJXwhV/de3myRq9Ajg4PJckVReAZcEjrmyN4
 Cp1qhJAVmhv9BvPXK5a7j9GDUPL6QrjvrLmBSVdagw6eQESUrDy0jNXjM
 twxUhNeXpennAfiFm68Ocj7NT0xP5ar9wa7VZtaPz4lJWXQEnY32UoeHy
 /TU7Zykz/Plo2HAtz06iTVtDXZQLQvVwPgZUVHKCUBx89mCXp0283QaGa g==;
X-CSE-ConnectionGUID: iZQ5icb5T+KwHQs91mqR5Q==
X-CSE-MsgGUID: ohLnCKqASVmx03EVZBD4mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="112655"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="112655"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 02:37:52 -0700
X-CSE-ConnectionGUID: NHeP9E+XSgibsxjo7Zjk0Q==
X-CSE-MsgGUID: fuaElnogQhqR2f+vOS4CZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="281885864"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.3])
 ([172.28.182.3])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 02:37:50 -0700
Message-ID: <4d320b71-3af9-4d4e-a886-b5528683805f@linux.intel.com>
Date: Tue, 6 Oct 2026 11:37:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] lib/igt_pci: Add raw configuration space helpers
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20261002113356.3652805-1-piotr.piorkowski@intel.com>
 <20261002113356.3652805-2-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20261002113356.3652805-2-piotr.piorkowski@intel.com>
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

On 10/2/2026 1:33 PM, Piórkowski, Piotr wrote:
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
> v3:
> - Share the capability list walk between the pciaccess and raw helpers.
> - Mask reserved low bits of capability pointers instead of rejecting them.
> - Stop the extended capability walk on an all-ones header.
> - Rename the capability list start parameter to cap_ptr.
> - Document the remaining raw configuration space helpers.
> - Use PCI_CFG_SPACE_EXP_SIZE from linux/pci_regs.h.
>
> v4:
> - Add igt_pci_regs.h with the required PCI register definitions instead
>    of relying on linux/pci_regs.h, which may be too old on some
>    distributions.

LGTM,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Assisted-by: GitHub Copilot:GPT-5.6 Luna
> ---
>   lib/igt_pci.c         | 191 +++++++++++++++++++++++++++++++++++++-----
>   lib/igt_pci.h         |   7 +-
>   lib/igt_pci_regs.h    |  17 ++++
>   lib/tests/igt_pci.c   |  76 +++++++++++++++++
>   lib/tests/meson.build |   1 +
>   5 files changed, 272 insertions(+), 20 deletions(-)
>   create mode 100644 lib/igt_pci_regs.h
>   create mode 100644 lib/tests/igt_pci.c
>
> diff --git a/lib/igt_pci.c b/lib/igt_pci.c
> index b63550b390..2fb54bda5a 100644
> --- a/lib/igt_pci.c
> +++ b/lib/igt_pci.c
> @@ -14,37 +14,74 @@
>   #include "igt_aux.h"
>   #include "igt_core.h"
>   #include "igt_pci.h"
> +#include "igt_pci_regs.h"
>   #include "igt_sysfs.h"
>   
> -static int find_pci_cap_offset_at(struct pci_device *dev, enum pci_cap_id cap_id,
> -				  int start_offset)
> -{
> -	uint8_t offset = 0xff;
> -	uint16_t cap_header = 0xffff;
> -	int loop = (PCI_CFG_SPACE_SIZE - PCI_TYPE0_1_HEADER_SIZE)
> -			/ sizeof(cap_header);
> +typedef int (*pci_cap_read_u16_fn)(void *ctx, unsigned int offset, uint16_t *val);
>   
> -	if (pci_device_cfg_read_u8(dev, &offset, start_offset))
> -		return -1;
> +/*
> + * Walk the standard capability list starting at @cap_ptr, the value of the
> + * capability pointer (e.g. read from PCI_CAPS_START). Returns the offset of
> + * the capability with @cap_id (any capability if 0), 0 if not found, or a
> + * negative errno: -EIO on read failure, -ENODEV if config space is
> + * inaccessible (reads back as 0xff), -EINVAL if a pointer points into the
> + * header, -ELOOP if the list doesn't terminate.
> + */
> +static int pci_cap_walk(uint8_t cap_ptr, uint8_t cap_id,
> +			pci_cap_read_u16_fn read_u16, void *ctx)
> +{
> +	int loop = (PCI_CFG_SPACE_SIZE - PCI_TYPE0_1_HEADER_SIZE) / sizeof(uint16_t);
>   
>   	while (loop--) {
> -		igt_assert_f(offset != 0xff, "pci config space inaccessible\n");
> +		uint16_t cap_header;
>   
> -		if (offset < PCI_TYPE0_1_HEADER_SIZE)
> -			break;
> +		if (!cap_ptr)
> +			return 0;
>   
> -		if (pci_device_cfg_read_u16(dev, &cap_header, (offset & 0xFC)))
> -			return -1;
> +		if (cap_ptr == 0xff)
> +			return -ENODEV;
>   
> -		if (!cap_id || cap_id == (cap_header & 0xFF))
> -			return offset;
> +		if (cap_ptr < PCI_TYPE0_1_HEADER_SIZE)
> +			return -EINVAL;
> +
> +		/* The two low bits of capability pointers are reserved */
> +		cap_ptr &= 0xfc;
> +
> +		if (read_u16(ctx, cap_ptr, &cap_header))
> +			return -EIO;
>   
> -		offset = cap_header >> 8;
> +		if (!cap_id || cap_id == (cap_header & 0xff))
> +			return cap_ptr;
> +
> +		cap_ptr = cap_header >> 8;
>   	}
>   
> -	igt_fail_on_f(loop <= 0 && offset, "pci capability offset doesn't terminate\n");
> +	return cap_ptr ? -ELOOP : 0;
> +}
>   
> -	return 0;
> +static int pciaccess_read_u16(void *ctx, unsigned int offset, uint16_t *val)
> +{
> +	return pci_device_cfg_read_u16(ctx, val, offset);
> +}
> +
> +static int find_pci_cap_offset_at(struct pci_device *dev, enum pci_cap_id cap_id,
> +				  int start_offset)
> +{
> +	uint8_t cap_ptr;
> +	int ret;
> +
> +	if (pci_device_cfg_read_u8(dev, &cap_ptr, start_offset))
> +		return -1;
> +
> +	ret = pci_cap_walk(cap_ptr, cap_id, pciaccess_read_u16, dev);
> +	igt_assert_f(ret != -ENODEV, "pci config space inaccessible\n");
> +	igt_fail_on_f(ret == -ELOOP, "pci capability offset doesn't terminate\n");
> +
> +	/* A pointer into the header has always terminated the list here */
> +	if (ret == -EINVAL)
> +		return 0;
> +
> +	return ret == -EIO ? -1 : ret;
>   }
>   
>   /**
> @@ -61,6 +98,122 @@ int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id)
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
> +/**
> + * igt_pci_config_raw_read_u16:
> + * @config: raw configuration space buffer
> + * @offset: byte offset within @config
> + *
> + * Returns the little-endian 16-bit value at @offset.
> + */
> +uint16_t igt_pci_config_raw_read_u16(const uint8_t *config, unsigned int offset)
> +{
> +	return config[offset] | (config[offset + 1] << 8);
> +}
> +
> +/**
> + * igt_pci_config_raw_read_u32:
> + * @config: raw configuration space buffer
> + * @offset: byte offset within @config
> + *
> + * Returns the little-endian 32-bit value at @offset.
> + */
> +uint32_t igt_pci_config_raw_read_u32(const uint8_t *config, unsigned int offset)
> +{
> +	return igt_pci_config_raw_read_u16(config, offset) |
> +	       ((uint32_t)igt_pci_config_raw_read_u16(config, offset + 2) << 16);
> +}
> +
> +static int raw_read_u16(void *ctx, unsigned int offset, uint16_t *val)
> +{
> +	*val = igt_pci_config_raw_read_u16(ctx, offset);
> +
> +	return 0;
> +}
> +
> +/**
> + * igt_pci_config_raw_find_cap_offset:
> + * @config: raw configuration space, at least PCI_CFG_SPACE_SIZE bytes
> + * @cap_id: searched standard capability id
> + *
> + * Returns the capability offset, 0 if not found, -ENODEV if config space
> + * is inaccessible, -EINVAL if the capability list points into the header or
> + * -ELOOP if the capability list doesn't terminate.
> + */
> +int igt_pci_config_raw_find_cap_offset(const uint8_t *config, uint8_t cap_id)
> +{
> +	return pci_cap_walk(config[PCI_CAPS_START], cap_id, raw_read_u16,
> +			    (void *)config);
> +}
> +
> +/**
> + * igt_pci_config_raw_find_ext_cap_offset:
> + * @config: raw configuration space, at least PCI_CFG_SPACE_EXP_SIZE bytes
> + * @cap_id: searched extended capability id
> + *
> + * Returns the extended capability offset, 0 if not found or the extended
> + * configuration space is not accessible, -EINVAL if the list points outside
> + * the extended configuration space or -ELOOP if it doesn't terminate.
> + */
> +int igt_pci_config_raw_find_ext_cap_offset(const uint8_t *config, uint16_t cap_id)
> +{
> +	unsigned int offset = PCI_EXT_CAPS_START;
> +	unsigned int loop = (PCI_CFG_SPACE_EXP_SIZE - offset) / 4;
> +
> +	while (loop) {
> +		uint32_t header = igt_pci_config_raw_read_u32(config, offset);
> +
> +		loop--;
> +
> +		/* All ones: extended config space is not accessible */
> +		if (!header || header == 0xffffffff)
> +			return 0;
> +		if ((header & 0xffff) == cap_id)
> +			return offset;
> +
> +		offset = (header >> 20) & 0xffc;
> +		if (!offset)
> +			return 0;
> +		if (offset < PCI_EXT_CAPS_START)
> +			return -EINVAL;
> +	}
> +
> +	return -ELOOP;
> +}
> +
>   static int open_pci_driver_dir(const char *driver)
>   {
>   	char path[PATH_MAX];
> diff --git a/lib/igt_pci.h b/lib/igt_pci.h
> index 509345b2d8..d7d6f96832 100644
> --- a/lib/igt_pci.h
> +++ b/lib/igt_pci.h
> @@ -15,7 +15,7 @@ struct pci_device;
>   
>   #define PCI_TYPE0_1_HEADER_SIZE 0x40
>   #define PCI_CAPS_START 0x34
> -#define PCI_CFG_SPACE_SIZE 0x100
> +#define PCI_EXT_CAPS_START 0x100
>   
>   enum pci_cap_id {
>   	PCI_EXPRESS_CAP_ID = 0x10
> @@ -27,6 +27,11 @@ enum pci_cap_id {
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
> diff --git a/lib/igt_pci_regs.h b/lib/igt_pci_regs.h
> new file mode 100644
> index 0000000000..5d6fece776
> --- /dev/null
> +++ b/lib/igt_pci_regs.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef __IGT_PCI_REGS_H__
> +#define __IGT_PCI_REGS_H__
> +
> +/*
> + * PCI register definitions, following <linux/pci_regs.h> naming and values.
> + * Defined here as the system header may be too old to provide all of them.
> + */
> +
> +#define PCI_CFG_SPACE_SIZE	256
> +#define PCI_CFG_SPACE_EXP_SIZE	4096
> +
> +#endif /* __IGT_PCI_REGS_H__ */
> diff --git a/lib/tests/igt_pci.c b/lib/tests/igt_pci.c
> new file mode 100644
> index 0000000000..52092eecb9
> --- /dev/null
> +++ b/lib/tests/igt_pci.c
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <errno.h>
> +#include <stdint.h>
> +#include <string.h>
> +
> +#include "igt_core.h"
> +#include "igt_pci.h"
> +#include "igt_pci_regs.h"
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
> +	igt_assert_eq(igt_pci_config_raw_find_cap_offset(config, 0xaa), -ENODEV);
> +
> +	config[PCI_CAPS_START] = PCI_TYPE0_1_HEADER_SIZE - 4;
> +	igt_assert_eq(igt_pci_config_raw_find_cap_offset(config, 0xaa), -EINVAL);
> +
> +	config[PCI_CAPS_START] = PCI_TYPE0_1_HEADER_SIZE | 3;
> +	igt_assert_eq(igt_pci_config_raw_find_cap_offset(config, 0xaa),
> +		      PCI_TYPE0_1_HEADER_SIZE);
> +
> +	config[PCI_CAPS_START] = PCI_TYPE0_1_HEADER_SIZE;
> +	config[PCI_TYPE0_1_HEADER_SIZE] = 0xbb;
> +	config[PCI_TYPE0_1_HEADER_SIZE + 1] = PCI_TYPE0_1_HEADER_SIZE;
> +	igt_assert_eq(igt_pci_config_raw_find_cap_offset(config, 0xaa), -ELOOP);
> +}
> +
> +static void test_ext_cap(void)
> +{
> +	uint8_t config[PCI_CFG_SPACE_EXP_SIZE] = {};
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
> +	memset(config, 0xff, sizeof(config));
> +	igt_assert_eq(igt_pci_config_raw_find_ext_cap_offset(config, 0xaa), 0);
> +
> +	memset(config, 0, sizeof(config));
> +	for (offset = PCI_EXT_CAPS_START;
> +	     offset < PCI_CFG_SPACE_EXP_SIZE - sizeof(uint32_t);
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
