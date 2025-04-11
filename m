Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CC9C36010
	for <igt-dev@archiver.kernel.org>; Fri, 11 Apr 2025 08:30:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2710210EB35;
	Fri, 11 Apr 2025 08:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="MI1DRzwG";
	dkim-atps=neutral
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE49B10EB33
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Apr 2025 08:30:41 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 15DF1581C79
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Apr 2025 07:54:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1519E4434D;
 Fri, 11 Apr 2025 07:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744358066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zkL2bLZ5tPPz2sCbk034xNoXVUS86XX5u7Ibx6rZbDk=;
 b=MI1DRzwGaOrc+hD9oEfX5f5gOWFcYBKbq3CrxGinHmvAx52u6TE6GLFwmUyWIPIpWU5NF8
 ycqDAeXGhidH+ZN57Y1J1gXE/wm4CFV7YMYnVo8kFOWGBZRxl6HZXwZ48ry9lY4Ffct8D3
 GBFD3s2Q7MRArhMiHnlkeCSrmlV7fWq8iZjo4b7DhpfvvdafjC/CDyWcqkQrzRUOwes8QJ
 7S/dznvjfX3aWi/YovuSPJiHute0dg8z3IDItV5lL45hlTUW0k9a3L6NAM7DF19EGY+7gi
 OiwZO12hX38zcLn68HcXqno/YL4LD1MiX8NZM1E2RfKl6KyV8OA49MxYTQ+GdA==
Message-ID: <4edbe1e1-b8d4-4598-bd9e-2a72cf18feaa@bootlin.com>
Date: Fri, 11 Apr 2025 09:53:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_configfs: Add test to validate
 survivability mode
To: Riana Tauro <riana.tauro@intel.com>, igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 katarzyna.piecielska@intel.com
References: <20250410060727.1857299-1-riana.tauro@intel.com>
 <20250410060727.1857299-3-riana.tauro@intel.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250410060727.1857299-3-riana.tauro@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekieevtdefgedtkeehteehtddttdefhffhgeejleejjeeluddvhfdugedvkeehveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehrihgrnhgrrdhtrghurhhosehinhhtvghlrdgtohhmpdhrtghpthhtohepihhgthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegrnhhshhhumhgrnhdrghhuphhtrgesihhnthgvlhdrtghomhdprhgtphhtthhopehluhgtrghsrdguvghmrghrtghhihesihhnthgvl
 hdrtghomhdprhgtphhtthhopehrohgurhhighhordhvihhvihesihhnthgvlhdrtghomhdprhgtphhtthhopehkrghmihhlrdhkohhnihgvtgiinhihsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepkhgrthgrrhiihihnrgdrphhivggtihgvlhhskhgrsehinhhtvghlrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 10/04/2025 à 08:07, Riana Tauro a écrit :
> The test validates if survivability mode is enabled on supported
> platforms when configured using configfs attribute.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   tests/intel/xe_configfs.c | 138 ++++++++++++++++++++++++++++++++++++++
>   tests/meson.build         |   1 +
>   2 files changed, 139 insertions(+)
>   create mode 100644 tests/intel/xe_configfs.c
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> new file mode 100644
> index 000000000..8954ed87c
> --- /dev/null
> +++ b/tests/intel/xe_configfs.c
> @@ -0,0 +1,138 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#include <limits.h>
> +
> +#include "igt.h"
> +#include "igt_configfs.h"
> +#include "igt_device.h"
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
> +static int driver_fd(void)
> +{
> +	int fd;
> +
> +	fd = open("/sys/bus/pci/drivers/xe", O_RDONLY);
> +	igt_assert_f(fd >= 0, "Can't open path\n");
> +
> +	return fd;
> +}
> +
> +static void driver_bind(void)
> +{
> +	int fd;
> +
> +	fd = driver_fd();
> +	igt_sysfs_write(fd, "bind", bus_addr, sizeof(bus_addr));
> +	close(fd);
> +}
> +
> +static void driver_unbind(void)
> +{
> +	int fd;
> +
> +	fd = driver_fd();
> +	igt_sysfs_write(fd, "unbind", bus_addr, sizeof(bus_addr));
> +	close(fd);
> +}

Did you see the functions xe_sysfs_driver_do in igt_sysfs.c? It seems to 
do the same thing as driver_bind/unbind here.

Thanks,
Louis Chauvet

> +
> +static void restore(int sig)
> +{
> +	/* Restore after survivability mode */
> +	driver_unbind();
> +	driver_bind();
> +}
> +
> +static void set_survivability_mode(int dir_fd, bool value)
> +{
> +	driver_unbind();
> +	igt_sysfs_set_boolean(dir_fd, "survivability_mode", value);
> +	driver_bind();
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
> +	dir_fd = igt_configfs_create_directory(configfs_fd, bus_addr);
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
> +	}
> +
> +	igt_fixture {
> +		igt_configfs_remove_directory(configfs_fd, bus_addr);
> +		close(dir_fd);
> +		close(configfs_fd);
> +		close(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 2a63d888f..74684ea35 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -279,6 +279,7 @@ intel_xe_progs = [
>   	'xe_create',
>   	'xe_compute',
>   	'xe_compute_preempt',
> +        'xe_configfs',
>   	'xe_copy_basic',
>   	'xe_dma_buf_sync',
>   	'xe_debugfs',

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

