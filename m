Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C27C369A2
	for <igt-dev@archiver.kernel.org>; Fri, 11 Apr 2025 08:30:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3EA10EB33;
	Fri, 11 Apr 2025 08:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oDWCeaC+";
	dkim-atps=neutral
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0AE310EB35
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Apr 2025 08:30:41 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 6238158223B
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Apr 2025 07:54:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A72F34435D;
 Fri, 11 Apr 2025 07:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744358081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9nkro1X7096VcvJGDJNZXFfUlZE9lV2ekyxaA4BOCD8=;
 b=oDWCeaC+WMZV4LLFycR+Yf7v/03So14O6GqTP+S1FfDkvSWEAlaS/JFb/cQnxgNefoc/BH
 yXF6CIsRUV9gTRKG1TgIyWOZuKMEAcOLU5ZwImj2lUuKyb++IFdxX/5zonkSNHYWMEvW2m
 VGgBh4BGih84jAl1l1T5nc5PCV/E4pVjGhSYpA2mBmUEn6bEYVsDQZjENR4AmUhdu4jPxY
 Y+Inf6EnQ0u6OfIa0NDKxwDZw7lxeflXjEnbxQT2FqPZHPbW3U3pmNlNfxLqK3j0fihzIt
 FScKkzUqap+OIFXJWDESeC9D7vo/k2ZAcKWv9HWH3Z8Bbb5uvwFE1bhABINEGw==
Message-ID: <b1240c51-3a5c-4e5d-b6b7-afd14edbc6fc@bootlin.com>
Date: Fri, 11 Apr 2025 09:53:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/igt_configfs: Add library for configfs
To: Riana Tauro <riana.tauro@intel.com>, igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 katarzyna.piecielska@intel.com, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?=
 <jose.exposito89@gmail.com>
References: <20250410060727.1857299-1-riana.tauro@intel.com>
 <20250410060727.1857299-2-riana.tauro@intel.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 xsFNBGCG5KEBEAD1yQ5C7eS4rxD0Wj7JRYZ07UhWTbBpbSjHjYJQWx/qupQdzzxe6sdrxYSY
 5K81kIWbtQX91pD/wH5UapRF4kwMXTAqof8+m3XfYcEDVG31Kf8QkJTG/gLBi1UfJgGBahbY
 hjP40kuUR/mr7M7bKoBP9Uh0uaEM+DuKl6bSXMSrJ6fOtEPOtnfBY0xVPmqIKfLFEkjh800v
 jD1fdwWKtAIXf+cQtC9QWvcdzAmQIwmyFBmbg+ccqao1OIXTgu+qMAHfgKDjYctESvo+Szmb
 DFBZudPbyTAlf2mVKpoHKMGy3ndPZ19RboKUP0wjrF+Snif6zRFisHK7D/mqpgUftoV4HjEH
 bQO9bTJZXIoPJMSb+Lyds0m83/LYfjcWP8w889bNyD4Lzzzu+hWIu/OObJeGEQqY01etOLMh
 deuSuCG9tFr0DY6l37d4VK4dqq4Snmm87IRCb3AHAEMJ5SsO8WmRYF8ReLIk0tJJPrALv8DD
 lnLnwadBJ9H8djZMj24+GC6MJjN8dDNWctpBXgGZKuCM7Ggaex+RLHP/+14Vl+lSLdFiUb3U
 ljBXuc9v5/9+D8fWlH03q+NCa1dVgUtsP2lpolOV3EE85q1HdMyt5K91oB0hLNFdTFYwn1bW
 WJ2FaRhiC1yV4kn/z8g7fAp57VyIb6lQfS1Wwuj5/53XYjdipQARAQABzSlMb3VpcyBDaGF1
 dmV0IDxsb3Vpcy5jaGF1dmV0QGJvb3RsaW4uY29tPsLBlAQTAQgAPgIbAwULCQgHAgYVCgkI
 CwIEFgIDAQIeAQIXgBYhBItxBK6aJy1mk/Un8uwYg/VeC0ClBQJmlnw+BQkH8MsdAAoJEOwY
 g/VeC0ClyhwP/Ra6H+5F2NEW6/IMVHeXmhuly8CcZ3kyoKeGNowghIcTBo59dFh0atGCvr+y
 K9YD5Pyg9aX4Ropw1R1RVIMrWoUNZUKebRTu6iNHkE6tmURJaKLzR+9la+789jznQvbV+9gM
 YTBppX4/0cWY58jiDiDV4aJ77JDo7aWNK4hz8mZsB+Y7ezMuS4jy2r4b7dZ+YL/T9/k3/emO
 PkAuFkVhkNhytMEyOBsT7SjL4IUBeYWvOw9MIaXEl4qW/5HLGtMuNhS94NsviDXZquoOHOby
 2uuRAI0bLz1qcsnY90yyPlDJ0pMuJHbi0DBzPTIYkyuwoyplfWxnUPp1wfsjiy/B6mRKTbdE
 a/K6jNzdVC1LLjTD4EjwnCE8IZBRWH1NVC1suOkw3Sr1FYcHFSYqNDrrzO+RKtR1JMrIe8/3
 Xhe2/UNUhppsK3SaFaIsu98mVQY3bA/Xn9wYcuAAzRzhEHgrbp8LPzYdi6Qtlqpt4HcPV3Ya
 H9BkCacgyLHcdeQbBXaup9JbF5oqbdtwev3waAmNfhWhrQeqQ0tkrpJ46l9slEGEdao5Dcct
 QDRjmJz7Gx/rKJngQrbboOQz+rhiHPoJc/n75lgOqtHRePNEf9xmtteHYpiAXh/YNooXJvdA
 tgR1jAsCsxuXZnW2DpVClm1WSHNfLSWona8cTkcoSTeYCrnXzsFNBGCG6KUBEADZhvm9TZ25
 JZa7wbKMOpvSH36K8wl74FhuVuv7ykeFPKH2oC7zmP1oqs1IF1UXQQzNkCHsBpIZq+TSE74a
 mG4sEhZP0irrG/w3JQ9Vbxds7PzlQzDarJ1WJvS2KZ4AVnwc/ucirNuxinAuAmmNBUNF8w6o
 Y97sdgFuIZUP6h972Tby5bu7wmy1hWL3+2QV+LEKmRpr0D9jDtJrKfm25sLwoHIojdQtGv2g
 JbQ9Oh9+k3QG9Kh6tiQoOrzgJ9pNjamYsnti9M2XHhlX489eXq/E6bWOBRa0UmD0tuQKNgK1
 n8EDmFPW3L0vEnytAl4QyZEzPhO30GEcgtNkaJVQwiXtn4FMw4R5ncqXVvzR7rnEuXwyO9RF
 tjqhwxsfRlORo6vMKqvDxFfgIkVnlc2KBa563qDNARB6caG6kRaLVcy0pGVlCiHLjl6ygP+G
 GCNfoh/PADQz7gaobN2WZzXbsVS5LDb9w/TqskSRhkgXpxt6k2rqNgdfeyomlkQnruvkIIjs
 Sk2X68nwHJlCjze3IgSngS2Gc0NC/DDoUBMblP6a2LJwuF/nvaW+QzPquy5KjKUO2UqIO9y+
 movZqE777uayqmMeIy4cd/gg/yTBBcGvWVm0Dh7dE6G6WXJUhWIUtXCzxKMmkvSmZy+gt1rN
 OyCd65HgUXPBf+hioCzGVFSoqQARAQABwsOyBBgBCAAmAhsuFiEEi3EErponLWaT9Sfy7BiD
 9V4LQKUFAmaWfGYFCQfwx0ECQAkQ7BiD9V4LQKXBdCAEGQEIAB0WIQRPj7g/vng8MQxQWQQg
 rS7GWxAs4gUCYIbopQAKCRAgrS7GWxAs4gfGEACcA0XVNesbVIyvs5SJpJy+6csrH4yy233o
 GclX2P7pcCls55wiV6ywCtRaXWFjztYmklQieaZ/zq+pUuUDtBZo95rUP20E56gYV2XFB18W
 YeekTwH5d2d/j++60iHExWTB+sgMEv3CEGikUBj7iaMX2KtaB1k9K+3K6dx/s1KWxOClFkbJ
 EV/tmeq7Ta8LiytQM9b4yY550tzC0pEEeFcLFXo1m5KcJauYnAqrlOVY48NFpFUd9oAZf/Pz
 p3oEs+zn/8zK2PBrZZCD6AhrbotRy7irE5eimhxcsFm1+MG5ufnaQUWHrRYXVuFhvkSoqZ8j
 GPgPEpFor4NjRyX/PMLglQ7S5snkvKcr3Lun44aybXEHq/1FTzW2kOh6kFHFFOPbMv1voJKM
 IzrmDoDS+xANt/La7OwpCylCgF6t9oHHTTGfAfwtfYZbiepC66FDe/Jt/QLwkIXeIoeSS1O4
 6rJdGWG2kHthUM+uIbUbaRJW8AkJpzP1Mz7TieR/9jO4YPeUm9tGL5kP2yyNtzFilcoOeox1
 NSFNAPz+zPcovVmxAaSDGcSzhQVJVlk8xPib8g4fnI8qJ3Gj7xyw8D9dzxhCR2DIFmZL84En
 N7Rj+k4VIGY7M/cVvxL81jlbMGMERMmb96Cua9z1ROviGA1He2gbHOcp6qmLNu3nprleG8PL
 ZRNdEAC0iZapoyiXlVCKLFIwUPnxUz5iarqIfQU8sa1VXYYd/AAAFI6Wv3zfNtGicjgHP8rN
 CIegqm2Av1939XXGZJVI9f3hEoUn04rvxCgcDcUvn7I0WTZ4JB9G5qAGvQLXeXK6Byu77qTx
 eC7PUIIEKN3X47e8xTSj2reVTlanDr8yeqZhxpKHaS0laF8RbD85geZtAK67qEByX2KC9DUo
 eHBFuXpYMzGQnf2SG105ePI2f4h5iAfbTW9VWH989fx4f2hVlDwTe08/NhPdwq/Houov9f/+
 uPpYEMlHCNwE8GRV7aEjd/dvu87PQPm4zFtC3jgQaUKCbYYlHmYYRlrLQenX3QSorrQNPbfz
 uQkNLDVcjgD2fxBpemT7EhHYBz+ugsfbtdsH+4jVCo5WLb/HxE6o5zvSIkXknWh1DhFj/qe9
 Zb9PGmfp8T8Ty+c/hjE5x6SrkRCX8qPXIvfSWLlb8M0lpcpFK+tB+kZlu5I3ycQDNLTk3qmf
 PdjUMWb5Ld21PSyCrtGc/hTKwxMoHsOZPy6UB8YJ5omZdsavcjKMrDpybguOfxUmGYs2H3MJ
 ghIUQMMOe0267uQcmMNDPRueGWTLXcuyz0Tpe62Whekc3gNMl0JrNz6Gty8OBb/ETijfSHPE
 qGHYuyAZJo9A/IazHuJ+4n+gm4kQl1WLfxoRMzYHCA==
In-Reply-To: <20250410060727.1857299-2-riana.tauro@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejgeejgedutdekhfffgfegudeutdetgfeuveegteeftddtfeevueffgfevgfevkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtoheprhhirghnrgdrthgruhhrohesihhnthgvlhdrtghomhdprhgtphhtthhopehighhtqdguvghvsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheprghnshhhuhhmrghnrdhguhhpthgrsehinhhtvghlrdgtohhmpdhrtghpthhtoheplhhutggrshdruggvm
 hgrrhgthhhisehinhhtvghlrdgtohhmpdhrtghpthhtoheprhhoughrihhgohdrvhhivhhisehinhhtvghlrdgtohhmpdhrtghpthhtohepkhgrmhhilhdrkhhonhhivggtiihnhieslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehkrghtrghriiihnhgrrdhpihgvtghivghlshhkrgesihhnthgvlhdrtghomhdprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhm
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

Hi Riana,

Le 10/04/2025 à 08:07, Riana Tauro a écrit :
> Add library functions to open configfs and create
> and remove configfs directories.

Can you take a look at [1], something similar was proposed few weeks 
ago? The main difference is that [1] checks that /sys/kernel/config is 
actually a mount point.

+Cc: José Exposito

[1]:https://lore.kernel.org/all/20250218165011.9123-4-jose.exposito89@gmail.com/

> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   lib/igt_configfs.c | 88 ++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_configfs.h | 13 +++++++
>   lib/meson.build    |  1 +
>   3 files changed, 102 insertions(+)
>   create mode 100644 lib/igt_configfs.c
>   create mode 100644 lib/igt_configfs.h
> 
> diff --git a/lib/igt_configfs.c b/lib/igt_configfs.c
> new file mode 100644
> index 000000000..57d59f1c4
> --- /dev/null
> +++ b/lib/igt_configfs.c
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#include <sys/mount.h>
> +#include <sys/stat.h>
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +
> +#include "igt_configfs.h"
> +#include "igt_core.h"
> +
> +static const char *igt_configfs_mount(void)
> +{
> +	struct stat st;
> +
> +	if (stat("/sys/kernel/debug", &st) == 0)
> +		return "/sys/kernel/config";
> +
> +	if (mount("none", "/sys/kernel/config", "configfs", 0, 0))
> +		return NULL;
> +
> +	return "/sys/kernel/config";
> +}
> +
> +/**
> + * igt_configfs_open: open configfs path
> + * @name: name of the configfs directory
> + *
> + * Opens the configfs directory corresponding to the name
> + *
> + * Returns:
> + * The directory fd, or -1 on failure.
> + */
> +int igt_configfs_open(const char *name)
> +{
> +	char path[PATH_MAX];
> +	const char *configfs_path;
> +
> +	configfs_path = igt_configfs_mount();
> +	igt_assert(configfs_path);
> +
> +	snprintf(path, sizeof(path), "%s/%s", configfs_path, name);
> +
> +	return open(path, O_RDONLY);
> +}

The usage of file descriptors for folders is nice here!

@José, I think this may reduce the complexity of the vkms tests. At 
least it will avoid having snprintf(%s/%s, vkms_root, vkms_item). What 
do you think?

> +
> +/**
> + * igt_configfs_create_directory: creates configfs group
> + * @fd: fd of configfs parent directory
> + * @name: name of the directory to create
> + *
> + * creates a directory under configfs parent directory
> + *
> + * Returns: 0 on success, -errno otherwise

This seems wrong, as the function returns a file descriptor, did I miss 
something?

> + */
> +int igt_configfs_create_directory(int fd, const char *name)
> +{
> +	int ret;
> +	int dirfd;
> +
> +	ret = mkdirat(fd, name, 0755);
> +	if (ret)
> +		return -errno;
> +
> +	dirfd = openat(fd, name, O_DIRECTORY);
> +	if (dirfd < 0)
> +		return -errno;
> +
> +	return dirfd;
> +}
> +
> +/**
> + * igt_configfs_remove_directory: removes configfs group
> + * @fd: fd of configfs parent directory
> + * @name: name of directory to create
> + *
> + * removes directory under configfs parent directory
> + */
> +void igt_configfs_remove_directory(int fd, const char *name)
> +{
> +	int ret = unlinkat(fd, name, AT_REMOVEDIR);
> +
> +	if (ret)
> +		igt_warn("Unable to remove %s directory: %s\n", name, strerror(errno));
> +}

I completely understand the point of those helpers, but I don't think 
they are configfs-specific. The file descriptor is passed by argument, 
so you could use it for any interface (configfs, debugfs, sysfs...).

I don't see any igt_fs.c, do you think it beneficial to create such file?

@José, do you think it make sense to also reuse igt_sysfs helpers for 
the VKMS tests? (igt_sysfs_get/set_s32/u32/boolean only use a directory 
fd + path, if you decide to use fd for vkms, it will avoid code duplication)

Thanks a lot Riana for this implementation and new ideas.

Louis Chauvet

> diff --git a/lib/igt_configfs.h b/lib/igt_configfs.h
> new file mode 100644
> index 000000000..d839db49a
> --- /dev/null
> +++ b/lib/igt_configfs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef IGT_CONFIGFS_H
> +#define IGT_CONFIGFS_H
> +
> +int igt_configfs_open(const char *name);
> +int igt_configfs_create_directory(int fd, const char *name);
> +void igt_configfs_remove_directory(int fd, const char *name);
> +
> +#endif /* IGT_CONFIGFS_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index d7bb72c57..f087947e7 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -19,6 +19,7 @@ lib_sources = [
>   	'igt_collection.c',
>   	'igt_color_encoding.c',
>   	'igt_facts.c',
> +	'igt_configfs.c',
>   	'igt_crc.c',
>   	'igt_debugfs.c',
>   	'igt_device.c',

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

