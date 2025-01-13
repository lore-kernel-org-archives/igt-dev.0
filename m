Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68754E7719F
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jan 2025 12:25:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E7210E66E;
	Mon, 13 Jan 2025 12:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="koKQ88kF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D090310E66E
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jan 2025 12:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736771123; x=1768307123;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nyglrT7k4vOaH+eSMOpTT3BxoaiYzqmZj3It97W7yJQ=;
 b=koKQ88kFeO8Ux2p74fZdKqSOF6doZ/NYeYENpFOCtfylfJT9loQEs6qU
 dIpzHwg1AS7zV29uQ07yjtV1tH1WxrVdWwVNdgGmvQDjJoZtL6VqtJhad
 IyQ4FLnmwuRBUdNLKf+wnwgV5oqHcskQucD3qeFVdTrGiSCzVIYJEqKZt
 FNhHg7SzxsGPAbA3uhXSDBz6jeshbp2ynoiBTDYeSkuAJfLHvP4X05B9V
 Pq1QBYY2xdIQ+hoZCVYDZvF+lQIftRBG8VAzjqhWAAjRgh1tTNXTDr2J0
 0Ye5WmE0tHIr0KuK1y1ZYKqEGekl0bfzyBDsuxd2myTNkQAFZnDsR4SQO A==;
X-CSE-ConnectionGUID: 41YCmpLYTtK1IqmsbN8M4g==
X-CSE-MsgGUID: 34czBVEsTpW0VD4L3flNGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="54575604"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="54575604"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 04:25:22 -0800
X-CSE-ConnectionGUID: j57zw8WgT0u5fnxwkgc5Cg==
X-CSE-MsgGUID: qiKU85fPTLuRmopt6ucamg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135360803"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 04:25:19 -0800
Date: Mon, 13 Jan 2025 13:25:07 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, stylon.wang@amd.com,
 Rodrigo.Siqueira@amd.com, ramadevi.gandi@intel.com,
 ryszard.knop@intel.com, sameer.lattannavar@intel.com,
 lucas.demarchi@intel.com, jani.saarinen@intel.com,
 katarzyna.piecielska@intel.com, matthew.d.roper@intel.com,
 gregory.f.germano@intel.com, clinton.a.taylor@intel.com,
 balasubramani.vivekanandan@intel.com, jianshui.yu@intel.com,
 jonathan.cavitt@intel.com
Subject: Re: [PATCH i-g-t] lib/igt_kmemleak: library to interact with kmemleak
Message-ID: <20250113122507.73kgyxkf5qkncmjv@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, stylon.wang@amd.com,
 Rodrigo.Siqueira@amd.com, ramadevi.gandi@intel.com,
 ryszard.knop@intel.com, sameer.lattannavar@intel.com,
 lucas.demarchi@intel.com, jani.saarinen@intel.com,
 katarzyna.piecielska@intel.com, matthew.d.roper@intel.com,
 gregory.f.germano@intel.com, clinton.a.taylor@intel.com,
 balasubramani.vivekanandan@intel.com, jianshui.yu@intel.com,
 jonathan.cavitt@intel.com
References: <20250109181027.90402-1-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250109181027.90402-1-peter.senna@linux.intel.com>
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

Hi Peter,
On 2025-01-09 at 19:10:27 +0100, Peter Senna Tschudin wrote:
> Adds a simple library for interacting with kmemleak ispired by
> 'tests/amdgpu/amd_mem_leak.c'. Also adds unit testing for the
> library.
> 
> To use the library include "igt_kmemleak.h" and:
>  1. igt_kmemleak_init(NULL) /* Returns true if kmemleak is active */
>  2. igt_kmemleak_clear()
>  3. /* Run your test */
>  4. igt_kmemleak_scan()
>  5. if (igt_kmemleak_found_leaks())
>        igt_kmemleak_cp_leaks_file(*dst)

I have few small nits, see below.

> 
> CC: stylon.wang@amd.com
> CC: Rodrigo.Siqueira@amd.com>
> CC: ramadevi.gandi@intel.com
> CC: ryszard.knop@intel.com
> CC: sameer.lattannavar@intel.com
> CC: lucas.demarchi@intel.com
> CC: jani.saarinen@intel.com
> CC: katarzyna.piecielska@intel.com
> CC: matthew.d.roper@intel.com
> CC: gregory.f.germano@intel.com
> CC: clinton.a.taylor@intel.com
> CC: balasubramani.vivekanandan@intel.com
> CC: jianshui.yu@intel.com
> CC: jonathan.cavitt@intel.com
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  lib/igt_kmemleak.c       | 149 ++++++++++++++++++++
>  lib/igt_kmemleak.h       |  17 +++
>  lib/meson.build          |   1 +
>  lib/tests/igt_kmemleak.c | 289 +++++++++++++++++++++++++++++++++++++++
>  lib/tests/meson.build    |   1 +
>  5 files changed, 457 insertions(+)
>  create mode 100644 lib/igt_kmemleak.c
>  create mode 100644 lib/igt_kmemleak.h
>  create mode 100644 lib/tests/igt_kmemleak.c
> 
> diff --git a/lib/igt_kmemleak.c b/lib/igt_kmemleak.c
> new file mode 100644
> index 000000000..c3f0f06a7
> --- /dev/null
> +++ b/lib/igt_kmemleak.c
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <ctype.h>
> +#include <libudev.h>
> +#include <stdio.h>
> +#include <sys/time.h>
> +#include <time.h>
> +
> +#include "igt_core.h"
> +#include "igt_device_scan.h"
> +#include "igt_kmemleak.h"
> +#include "igt_kmod.h"
> +#include "igt_list.h"
> +
> +/* We can change the path for unit testing, see igt_kmemleak_init() */
> +static char igt_kmemleak_file[256] = "/sys/kernel/debug/kmemleak";
> +
> +/**
> + * igt_kmemeak_init:
> + * @igt_kmemleak_file: update the path to kmemleak file to enable unit testing
> + *
> + * Check if kmemleak is enabled in the kernel, if debugfs is mounted and
> + * if kmemleak file is present and readable.
> + *
> + * Returns: true if kmemleak is enabled, false otherwise.
> + */
> +bool igt_kmemleak_init(const char *unit_test_kmemleak_file)
> +{
> +	FILE *fp;
> +
> +	if (unit_test_kmemleak_file)
> +		snprintf(igt_kmemleak_file,
> +			 sizeof(igt_kmemleak_file),
> +			 "%s",
> +			 unit_test_kmemleak_file);
> +
> +	fp = fopen(igt_kmemleak_file, "r");
> +	if (!fp)
> +		return false;
> +
> +	fclose(fp);

Add newline before return.

> +	return true;
> +}
> +
> +/**
> + * igt_kmemeak_cmd:
> + * @cmd: command to send to kmemleak
> + *
> + * Send a command to kmemleak.
> + *
> + * Returns: true if sending the command was successful, false otherwise.
> + */
> +bool igt_kmemleak_cmd(const char *cmd)
> +{
> +	FILE *fp;
> +	size_t wlen;
> +
> +	fp = fopen(igt_kmemleak_file, "r+");
> +	if (!fp)
> +		return false;

Add newline here.

> +	wlen = fwrite(cmd, 1, strlen(cmd), fp);
> +	fclose(fp);
> +
> +	return wlen == strlen(cmd);
> +}
> +
> +/**
> + * igt_kmemeak_scan:
> + *
> + * Trigger an immediate scan on kmemleak.
> + *
> + * Returns: true if sending the command to scan was successful, false otherwise.
> + */
> +bool igt_kmemleak_scan(void)
> +{
> +	return igt_kmemleak_cmd("scan");
> +}
> +
> +/**
> + * igt_kmemeak_clear:
> + *
> + * Trigger an immediate clear on kmemleak.
> + *
> + * Returns: true if sending the command to clear was successful, false
> + * otherwise.
> + */
> +bool igt_kmemleak_clear(void)
> +{
> +	return igt_kmemleak_cmd("clear");
> +}
> +
> +/**
> + * igt_kmemeak_found_leaks:
> + *
> + * Check if kmemleak found any leaks.
> + *
> + * Returns: true if kmemleak found any leaks, false otherwise.
> + */
> +bool igt_kmemleak_found_leaks(void)
> +{
> +	FILE *fp;
> +	char buf[1];
> +	size_t rlen;
> +
> +	fp = fopen(igt_kmemleak_file, "r");
> +	if (!fp)
> +		return false;
> +
> +	rlen = fread(buf, 1, 1, fp);
> +	fclose(fp);
> +
> +	return rlen == 1;
> +}
> +
> +/**
> + * igt_kmemeak_cp_leaks_file:
> + * @dst: path of destination file including the file name
> + *
> + * Copy kmemleak file to dst.
> + *
> + * Returns: true if copy was successful, false otherwise
> + */
> +bool igt_kmemleak_cp_leaks_file(const char *dst)
> +{
> +	FILE *src, *dest;
> +	char buf[1024];
> +	size_t n;
> +
> +	src = fopen(igt_kmemleak_file, "r");
> +	if (!src)
> +		return false;
> +
> +	dest = fopen(dst, "w");
> +	if (!dest) {
> +		fclose(src);
> +		return false;
> +	}
> +
> +	while ((n = fread(buf, 1, sizeof(buf), src)) > 0)
> +		fwrite(buf, 1, n, dest);
> +
> +	fclose(dest);
> +	fclose(src);
> +
> +	return true;
> +}
> diff --git a/lib/igt_kmemleak.h b/lib/igt_kmemleak.h
> new file mode 100644
> index 000000000..c0c187847
> --- /dev/null
> +++ b/lib/igt_kmemleak.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef IGT_KMEMLEAK_H
> +#define IGT_KMEMLEAK_H
> +
> +#include <stdbool.h>
> +
> +bool igt_kmemleak_init(const char *unit_test_kmemleak_file);
> +bool igt_kmemleak_cmd(const char *cmd);
> +bool igt_kmemleak_scan(void);
> +bool igt_kmemleak_clear(void);
> +bool igt_kmemleak_found_leaks(void);
> +bool igt_kmemleak_cp_leaks_file(const char *dst);
> +
> +#endif /* IGT_KMEMLEAK_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index 640513e6c..24423ef37 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -96,6 +96,7 @@ lib_sources = [
>  	'igt_dummyload.c',
>  	'igt_store.c',
>  	'uwildmat/uwildmat.c',
> +	'igt_kmemleak.c',
>  	'igt_kmod.c',
>  	'igt_ktap.c',
>  	'igt_panfrost.c',
> diff --git a/lib/tests/igt_kmemleak.c b/lib/tests/igt_kmemleak.c
> new file mode 100644
> index 000000000..e683158a5
> --- /dev/null
> +++ b/lib/tests/igt_kmemleak.c
> @@ -0,0 +1,289 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <ctype.h>
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <zlib.h>
> +
> +#include "igt_core.h"
> +#include "igt_kmemleak.h"
> +
> +const char *kmemleak_file_example =
> +"unreferenced object 0xffff888102a2e638 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   00 00 00 00 00 00 00 00 0d 01 a2 00 00 00 00 00  ................\n"
> +"   f0 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .|..............\n"
> +" backtrace (crc 2df71a7e):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2ed18 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   38 e6 a2 02 81 88 ff ff 0d 11 2d 00 00 00 00 00  8.........-.....\n"
> +"   f2 7c 03 00 00 c9 ff ff 58 ea a2 02 81 88 ff ff  .|......X.......\n"
> +" backtrace (crc ec2a8bdc):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2ea58 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   38 e6 a2 02 81 88 ff ff 0d 01 a0 00 00 00 00 00  8...............\n"
> +"   f6 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .|..............\n"
> +" backtrace (crc f911c0d1):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e428 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   58 ea a2 02 81 88 ff ff 0d 01 35 00 00 00 00 00  X.........5.....\n"
> +"   fc 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .|..............\n"
> +" backtrace (crc cb8aaffd):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e008 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   28 e4 a2 02 81 88 ff ff 0d 01 2d 00 00 00 00 00  (.........-.....\n"
> +"   fc 7c 03 00 00 c9 ff ff c8 e2 a2 02 81 88 ff ff  .|..............\n"
> +" backtrace (crc 7f883e78):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2b9e5>] acpi_ps_get_next_namepath+0x1f5/0x390\n"
> +"   [<ffffffff81c2cc15>] acpi_ps_parse_loop+0x4a5/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e2c8 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   28 e4 a2 02 81 88 ff ff 0d 01 73 00 00 00 00 00  (.........s.....\n"
> +"   00 7d 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .}..............\n"
> +" backtrace (crc 338c016):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e378 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   c8 e2 a2 02 81 88 ff ff 0d 01 0d 00 00 00 00 00  ................\n"
> +"   01 7d 03 00 00 c9 ff ff 98 e7 a2 02 81 88 ff ff  .}..............\n"
> +" backtrace (crc 665fb8a7):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e798 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   7c8 e2 a2 02 81 88 ff ff 0d 01 98 00 00 00 00 00  ................\n"
> +"   1b 7d 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .}..............\n"
> +" backtrace (crc b7a23a1c):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e0b8 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   98 e7 a2 02 81 88 ff ff 0d 01 2d 00 00 00 00 00  ..........-.....\n"
> +"   1c 7d 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .}..............\n"
> +" backtrace (crc 14d67a9c):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170\n";
> +
> +static unsigned long crc32_file(int fd)
> +{
> +	unsigned long crc;
> +	char buf[1024];
> +	ssize_t n;
> +
> +	crc = crc32(0, Z_NULL, 0);
> +	while ((n = read(fd, buf, sizeof(buf))) > 0)
> +		crc = crc32(crc, (const Bytef *)buf, n);
> +
> +	return crc;
> +}
> +
> +static void test_igt_kmemleak_cp_leaks_file(void)
> +{
> +	char src_file_path[256] = "/tmp/igt_kmemleak_test_XXXXXX";
> +	char dst_file_path[256] = "/tmp/igt_kmemleak_dstfile_XXXXXX";
> +	unsigned long crc_src, crc_dst;
> +	int fd;
> +
> +	/* Emulate a kmemleak file */
> +	fd = mkstemp(src_file_path);
> +	write(fd, kmemleak_file_example, strlen(kmemleak_file_example));
> +	close(fd);
> +
> +	/* Init the library */
> +	igt_kmemleak_init(src_file_path);
> +
> +	/* Copy the emulated kmemleak file */
> +	igt_assert(igt_kmemleak_cp_leaks_file(dst_file_path));
> +
> +	/* Test that both files have the same content */
> +	fd = open(src_file_path, O_RDONLY);
> +	crc_src = crc32_file(fd);
> +	close(fd);
> +
> +	fd = open(dst_file_path, O_RDONLY);
> +	crc_dst = crc32_file(fd);
> +	close(fd);
> +
> +	igt_assert(crc_src == crc_dst);
> +

Remove this empty line.

> +}

Rest looks good,

Regards,
Kamil

> +
> +static void test_kmemleak_file(bool test_write)
> +{
> +	char tmp_file_path[256] = "/tmp/igt_kmemleak_test_XXXXXX";
> +	int fd;
> +
> +	fd = mkstemp(tmp_file_path);
> +	igt_assert(fd >= 0);
> +
> +	if (test_write)
> +		write(fd, kmemleak_file_example, strlen(kmemleak_file_example));
> +
> +	igt_assert(igt_kmemleak_init(tmp_file_path));
> +}
> +
> +static void test_empty_file(void)
> +{
> +	test_kmemleak_file(false);
> +	igt_assert(!igt_kmemleak_found_leaks());
> +}
> +
> +static void test_non_empty_file(void)
> +{
> +	test_kmemleak_file(true);
> +	igt_assert(igt_kmemleak_found_leaks());
> +}
> +
> +igt_simple_main
> +{
> +	test_empty_file();
> +	test_non_empty_file();
> +	test_igt_kmemleak_cp_leaks_file();
> +}
> diff --git a/lib/tests/meson.build b/lib/tests/meson.build
> index df8092638..bcbea9ba4 100644
> --- a/lib/tests/meson.build
> +++ b/lib/tests/meson.build
> @@ -15,6 +15,7 @@ lib_tests = [
>          'igt_ktap_parser',
>  	'igt_list_only',
>  	'igt_invalid_subtest_name',
> +	'igt_kmemleak',
>  	'igt_nesting',
>  	'igt_no_exit',
>  	'igt_runnercomms_packets',
> -- 
> 2.34.1
> 
