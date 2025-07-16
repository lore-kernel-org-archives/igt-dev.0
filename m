Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D7AC83F1B
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 09:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F154F10E778;
	Wed, 16 Jul 2025 09:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NiSug4fX";
	dkim-atps=neutral
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CBD10E774
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 09:58:12 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 73F4D58791A
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 09:22:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEA4E43910;
 Wed, 16 Jul 2025 09:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752657772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6T9UL+6SL7KBwpZFioF4gVU9Rd7vmFcMKUC+3QIqg5Q=;
 b=NiSug4fXP80FBOguqGRry3+6VYYikK8mdxnutGWKhDXlVT+1Uusw5UnZLuEU1Od6hjRTKG
 RjY7XuaYGYW6bLleNASl/Y4OAFasixnHea/urEsOhgMoMPuHcJn9xKK9+ej2eOegnUWG7z
 Cu44sFIXpyYC+afGDDd+6C1AsewkmSntgGTvp7EyPbHExF9OwinaEFW/swDdpOHY0iwvZI
 LCQw13XAj88pVy2wOSf/OvmlxWU9kSVVUxfJIPPw2tTuxPT4l/b+kZb/LxbywZZ1cF5o8V
 R13lKVcwau++6ALYriObHIL3z8jIiHBtWN/r5AOx56L4DvXwgGfbb4F/kreIqA==
Message-ID: <99507698-bd73-4b55-bf33-e85e0de1a6a8@bootlin.com>
Date: Wed, 16 Jul 2025 11:22:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t v3 03/41] lib/vkms: Allow to enable/disable VKMS
 devices
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com
References: <20250715102513.5636-1-jose.exposito89@gmail.com>
 <20250715102513.5636-4-jose.exposito89@gmail.com>
Content-Language: en-US
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250715102513.5636-4-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehjeefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfhffuvfevfhgjtgfgsehtkeertddtvdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteffhfdtiefgheffudeuvdekfefgvdduudfgffetteffvdetfffgjeevudfggfffnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhegnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhgthdqu
 ggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopeiisghighhnihgvfidrkhgvmhhptgiihihnshhkihesihhnthgvlhdrtghomh
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



Le 15/07/2025 à 12:24, José Expósito a écrit :
> Add helper to enable, disable and check the enabled status of a VKMS
> device and add a test to ensure that the default value is correctly set.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   lib/igt_vkms.c             | 98 ++++++++++++++++++++++++++++++++++++++
>   lib/igt_vkms.h             |  7 +++
>   tests/vkms/vkms_configfs.c | 18 +++++++
>   3 files changed, 123 insertions(+)
> 
> diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
> index fa41f741e..1fd00afd7 100644
> --- a/lib/igt_vkms.c
> +++ b/lib/igt_vkms.c
> @@ -7,7 +7,12 @@
>   
>   #include <dirent.h>
>   #include <errno.h>
> +#include <fcntl.h>
> +#include <stddef.h>
> +#include <stdio.h>
> +#include <stdlib.h>
>   #include <string.h>
> +#include <unistd.h>
>   
>   #include <ftw.h>
>   #include <linux/limits.h>
> @@ -17,6 +22,7 @@
>   #include "igt_vkms.h"
>   
>   #define VKMS_ROOT_DIR_NAME		"vkms"
> +#define VKMS_FILE_ENABLED		"enabled"
>   
>   /**
>    * SECTION:igt_vkms
> @@ -47,6 +53,50 @@ static const char *mount_vkms_configfs(void)
>   	return vkms_root_path;
>   }
>   
> +static int read_int(const char *path)
> +{
> +	FILE *file;
> +	int value;
> +	int ret;
> +
> +	file = fopen(path, "r");
> +	igt_assert_f(file, "Error opening '%s'\n", path);
> +
> +	ret = fscanf(file, "%d", &value);
> +	fclose(file);
> +	igt_assert_f(ret == 1, "Error reading integer from '%s'\n", path);
> +
> +	return value;
> +}
> +
> +static bool read_bool(const char *path)
> +{
> +	int ret;
> +
> +	ret = read_int(path);
> +
> +	return !!ret;
> +}
> +
> +static void write_int(const char *path, int value)
> +{
> +	FILE *file;
> +	int ret;
> +
> +	file = fopen(path, "w");
> +	igt_assert_f(file, "Error opening '%s'\n", path);
> +
> +	ret = fprintf(file, "%d", value);
> +	igt_assert_f(ret >= 0, "Error writing to '%s'\n", path);
> +
> +	fclose(file);
> +}
> +
> +static void write_bool(const char *path, bool value)
> +{
> +	write_int(path, value ? 1 : 0);
> +}
> +
>   /**
>    * igt_require_vkms_configfs:
>    *
> @@ -65,6 +115,22 @@ void igt_require_vkms_configfs(void)
>   		closedir(dir);
>   }
>   
> +/**
> + * igt_vkms_get_device_enabled_path:
> + * @dev: Device to get the enabled path from
> + * @path: Output path
> + * @len: Maximum @path length
> + *
> + * Returns the device "enabled" file path.
> + */
> +void igt_vkms_get_device_enabled_path(igt_vkms_t *dev, char *path, size_t len)
> +{
> +	int ret;
> +
> +	ret = snprintf(path, len, "%s/%s", dev->path, VKMS_FILE_ENABLED);
> +	igt_assert(ret >= 0 && ret < len);
> +}
> +
>   /**
>    * igt_vkms_device_create:
>    * @name: VKMS device name
> @@ -167,6 +233,8 @@ void igt_vkms_device_destroy(igt_vkms_t *dev)
>   
>   	igt_assert(dev);
>   
> +	igt_vkms_device_set_enabled(dev, false);
> +
>   	ret = remove_device_dir(dev);
>   	igt_assert_f(ret == 0,
>   		     "Unable to rmdir device directory '%s'. Got errno=%d (%s)\n",
> @@ -205,3 +273,33 @@ void igt_vkms_destroy_all_devices(void)
>   
>   	closedir(dir);
>   }
> +
> +/**
> + * igt_vkms_device_is_enabled:
> + * @dev: The device to check
> + *
> + * Indicate whether a VKMS device is enabled or not.
> + */
> +bool igt_vkms_device_is_enabled(igt_vkms_t *dev)
> +{
> +	char path[PATH_MAX];
> +
> +	igt_vkms_get_device_enabled_path(dev, path, sizeof(path));
> +
> +	return read_bool(path);
> +}
> +
> +/**
> + * igt_vkms_device_set_enabled:
> + * @dev: Device to enable or disable
> + *
> + * Enable or disable a VKMS device.
> + */
> +void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled)
> +{
> +	char path[PATH_MAX];
> +
> +	igt_vkms_get_device_enabled_path(dev, path, sizeof(path));
> +
> +	write_bool(path, enabled);
> +}
> diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
> index 48c48f296..d3741b6ee 100644
> --- a/lib/igt_vkms.h
> +++ b/lib/igt_vkms.h
> @@ -8,6 +8,8 @@
>   #ifndef __IGT_VKMS_H__
>   #define __IGT_VKMS_H__
>   
> +#include <stdbool.h>
> +
>   /**
>    * igt_vkms_t:
>    * @path: VKMS root directory inside configfs mounted directory
> @@ -20,8 +22,13 @@ typedef struct igt_vkms {
>   
>   void igt_require_vkms_configfs(void);
>   
> +void igt_vkms_get_device_enabled_path(igt_vkms_t *dev, char *path, size_t len);
> +
>   igt_vkms_t *igt_vkms_device_create(const char *name);
>   void igt_vkms_device_destroy(igt_vkms_t *dev);
>   void igt_vkms_destroy_all_devices(void);
>   
> +bool igt_vkms_device_is_enabled(igt_vkms_t *dev);
> +void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled);
> +
>   #endif /* __IGT_VKMS_H__ */
> diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
> index b942cec64..aa7cd9e4e 100644
> --- a/tests/vkms/vkms_configfs.c
> +++ b/tests/vkms/vkms_configfs.c
> @@ -103,6 +103,23 @@ static void test_device_default_files(void)
>   	igt_vkms_device_destroy(dev);
>   }
>   
> +/**
> + * SUBTEST: device-default-values
> + * Description: Check that the default values for the device are correct.
> + */
> +
> +static void test_device_default_values(void)
> +{
> +	igt_vkms_t *dev;
> +
> +	dev = igt_vkms_device_create(__func__);
> +	igt_assert(dev);
> +
> +	igt_assert(!igt_vkms_device_is_enabled(dev));
> +
> +	igt_vkms_device_destroy(dev);
> +}
> +
>   igt_main
>   {
>   	struct {
> @@ -110,6 +127,7 @@ igt_main
>   		void (*fn)(void);
>   	} tests[] = {
>   		{ "device-default-files", test_device_default_files },
> +		{ "device-default-values", test_device_default_values },
>   	};
>   
>   	igt_fixture {

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


