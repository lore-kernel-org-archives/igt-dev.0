Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C141EC19F2E
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 13:12:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCB910E369;
	Thu, 27 Feb 2025 13:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gg3GlkxI";
	dkim-atps=neutral
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF3610EAD7
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 13:12:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8135444217;
 Thu, 27 Feb 2025 13:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740661948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xfs+j2IrC4lU5EtKlTI/X51D9EQw40xWUJwCkUBXCPY=;
 b=gg3GlkxIGLKTuC4dKRSQl/fmL2b8VDX6Yi83N0jdgL6DqLbI1rplEEl71ExK2uKzFXfk2R
 zKspXJ/o8Zs95DZKpgy7BcBNFAzSKFdSJTbAqKvLBoP3bWRdr7qDShFhw4Hk/lmewsKrjB
 5mxB03Ob4/6tctyJZmAb6NbllCY/xTvdEtlEw5iNrAQM3tK4shLW3y0KFA3d/ffhJg3w7r
 THSmj4YlGBN4qI7W4pVfr2S4l0D3ZypiNvCb8RWSI/OyRAp48/1UHBb+pdhKTWbraTRorW
 bcuNKNdsICgqQAXRiymQbpIx/Rg11vrBDM/se/1HYno0JDMcFgdPHyXN+AnZag==
Message-ID: <b13690de-4b8b-4079-99b5-a23b89f50a01@bootlin.com>
Date: Thu, 27 Feb 2025 14:12:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t 04/39] lib/vkms: Add minimal VKMS library and test
 device default files
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 igt-dev@lists.freedesktop.org
Cc: Jim Shargo <jshargo@chromium.org>, Marius Vlad <marius.vlad@collabora.com>
References: <20250218165011.9123-1-jose.exposito89@gmail.com>
 <20250218165011.9123-5-jose.exposito89@gmail.com>
Content-Language: en-US
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250218165011.9123-5-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekjeehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfhffuvfevfhgjtgfgsehtkeertddtvdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteffhfdtiefgheffudeuvdekfefgvdduudfgffetteffvdetfffgjeevudfggfffnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepjhhoshgvrdgvgihpohhsihhtohekleesghhmrghilhdrtghomhdprhgtphhtthhopehighhtqdguvghvsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepjhhshhgrrhhgohestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtohepmhgrrhhiuhhsrdhvlhgrugestgholhhlrggsohhrr
 gdrtghomh
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



Le 18/02/2025 à 17:49, José Expósito a écrit :
> Create a library containing helpers for creating VKMS devices and
> configuring them dynamically using configfs.
> For the moment, add the minimal number of helpers to be able to start
> testing VKMS's configfs support: Create device, destroy device and
> destroy all devices.
> 
> Also, include the simplest possible test using those helpers (checking
> the device's default files) and the scaffolding required to generate
> the documentation.
> 
> Co-developed-by: Jim Shargo <jshargo@chromium.org>
> Signed-off-by: Jim Shargo <jshargo@chromium.org>
> Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>   docs/testplan/meson.build        |   7 +-
>   lib/igt_vkms.c                   | 191 +++++++++++++++++++++++++++++++
>   lib/igt_vkms.h                   |  27 +++++
>   lib/meson.build                  |   1 +
>   meson.build                      |   8 ++
>   tests/meson.build                |   2 +
>   tests/vkms/meson.build           |  13 +++
>   tests/vkms/vkms_configfs.c       | 122 ++++++++++++++++++++
>   tests/vkms/vkms_test_config.json |  72 ++++++++++++
>   9 files changed, 441 insertions(+), 2 deletions(-)
>   create mode 100644 lib/igt_vkms.c
>   create mode 100644 lib/igt_vkms.h
>   create mode 100644 tests/vkms/meson.build
>   create mode 100644 tests/vkms/vkms_configfs.c
>   create mode 100644 tests/vkms/vkms_test_config.json
> 
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index 5560347f1..9e22f4c7d 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -11,6 +11,7 @@ stylesheet = join_paths(meson.current_source_dir(), 'testplan.css')
>   xe_test_config = join_paths(source_root, 'tests', 'intel', 'xe_test_config.json')
>   kms_test_config = join_paths(source_root, 'tests', 'intel', 'kms_test_config.json')
>   i915_test_config = join_paths(source_root, 'tests', 'intel', 'i915_test_config.json')
> +vkms_test_config = join_paths(source_root, 'tests', 'vkms', 'vkms_test_config.json')
>   
>   check_testlist = []
>   kms_check_testlist = []
> @@ -37,12 +38,14 @@ if build_xe
>   	test_dict = {
>   		'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
>   		'kms_tests': { 'input': kms_test_config, 'extra_args': kms_check_testlist },
> -		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
> +		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist },
> +		'vkms_tests': { 'input': vkms_test_config, 'extra_args': check_testlist }
>   	    }
>   else
>   	test_dict = {
>   	      'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
> -	      'kms_tests': { 'input': kms_test_config, 'extra_args': kms_check_testlist }
> +	      'kms_tests': { 'input': kms_test_config, 'extra_args': kms_check_testlist },
> +	      'vkms_tests': { 'input': vkms_test_config, 'extra_args': check_testlist }
>   	    }
>   endif
>   
> diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
> new file mode 100644
> index 000000000..8cea94901
> --- /dev/null
> +++ b/lib/igt_vkms.c
> @@ -0,0 +1,191 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Google LLC.
> + * Copyright © 2023 Collabora, Ltd.
> + * Copyright © 2024 Red Hat, Inc.
> + */
> +
> +#include <dirent.h>
> +#include <errno.h>
> +#include <string.h>
> +
> +#include <ftw.h>
> +#include <linux/limits.h>
> +#include <sys/stat.h>
> +
> +#include "igt.h"
> +#include "igt_vkms.h"
> +
> +#define VKMS_ROOT_DIR_NAME		"vkms"
> +
> +/**
> + * SECTION:igt_vkms
> + * @short_description: Helpers to create and configure VKMS devices
> + * @title: VKMS
> + * @include: igt_vkms.h
> + *
> + * Helpers for creating VKMS devices and configuring them dynamically.
> + *
> + * First, create a VKMS device, next, add pipeline items (planes, CRTCs,
> + * encoders, CRTCs and connectors) compose the pipeline by attaching each item
> + * using the _attach_ functions and finally, enable the VKMS device.
> + */
> +
> +static const char *mount_vkms_configfs(void)
> +{
> +	static char vkms_root_path[PATH_MAX];
> +	const char *configfs_path;
> +
> +	configfs_path = igt_configfs_mount();
> +	igt_assert_f(configfs_path, "Error mounting configfs");
> +
> +	snprintf(vkms_root_path, sizeof(vkms_root_path), "%s/%s", configfs_path,
> +		 VKMS_ROOT_DIR_NAME);

As in PATCH 02/39, maybe you can add a check:

	igt_assert_lt(snprintf(...), sizeof(vkms_root_path));

> +
> +	return vkms_root_path;
> +}
> +
> +/**
> + * igt_require_vkms_configfs:
> + *
> + * Require that VKMS supports configfs configuration.
> + */
> +void igt_require_vkms_configfs(void)
> +{
> +	const char *vkms_root_path;
> +	DIR *dir;
> +
> +	vkms_root_path = mount_vkms_configfs();
> +
> +	dir = opendir(vkms_root_path);
> +	igt_require(dir);
> +	if (dir)
> +		closedir(dir);
> +}
> +
> +/**
> + * igt_vkms_device_create:
> + * @name: VKMS device name
> + *
> + * Create a directory in the ConfigFS VKMS root directory, where the entire
> + * pipeline will be configured.
> + */
> +igt_vkms_t *igt_vkms_device_create(const char *name)
> +{
> +	igt_vkms_t *dev;
> +	const char *vkms_root_path;
> +	size_t path_len;
> +	DIR *dir;
> +	int ret;
> +
> +	dev = calloc(1, sizeof(*dev));
> +
> +	vkms_root_path = mount_vkms_configfs();
> +
> +	path_len = strlen(vkms_root_path) + strlen(name) + 2;
> +	dev->path = malloc(path_len);
> +	snprintf(dev->path, path_len, "%s/%s", vkms_root_path, name);
> +
> +	dir = opendir(dev->path);
> +	if (dir) {

Can we add some debug logging here? I think it is important to quickly 
know if a device is reused or not.

> +		closedir(dir);
> +	} else {
> +		ret = mkdir(dev->path, 0777);
> +		if (ret != 0) {
> +			free(dev->path);
> +			free(dev);
> +			dev = NULL;
> +		}
> +	}
> +
> +	return dev;
> +}
> +
> +static int detach_pipeline_items(const char *path, const struct stat *info,
> +				 const int typeflag, struct FTW *pathinfo)
> +{
> +	/* Level 4 are the links in the possible_* directories */

Can you add an example path to clarify this comment? Same for other 
usage of pathinfo->level

	/*
	 * Level 4 are the links in the possible_* directories
	 * i.e: vkms/<DEV>/<OBJECT>/<POSSIBLE_*>/*
	 */

Can we also log the unlinked files?

> +	if (pathinfo->level == 4 && typeflag == FTW_SL)
> +		return unlink(path);
> +
> +	/* Ignore the other files, they are removed by remove_pipeline_items */
> +	return 0;
> +}
> +
> +static int remove_pipeline_items(const char *path, const struct stat *info,
> +				 const int typeflag, struct FTW *pathinfo)
> +{
> +	/* Level 0 is the device root directory */
> +	if (pathinfo->level == 0)
> +		return rmdir(path);
> +
> +	/* Level 2 directories are the pipeline items */
> +	if (pathinfo->level == 2 && typeflag == FTW_DP)
> +		return rmdir(path);

Can we log the deleted files? I think it can be useful because 
igt_vkms_device_destroy only prints the root directory, not which file 
we fail to remove.

> +
> +	/* Ignore the other files, they are removed by VKMS */
> +	return 0;
> +}
> +
> +static int remove_device_dir(igt_vkms_t *dev)
> +{
> +	int ret;
> +
> +	ret = nftw(dev->path, detach_pipeline_items, 64, FTW_DEPTH | FTW_PHYS);
> +	if (ret)
> +		return ret;
> +
> +	ret = nftw(dev->path, remove_pipeline_items, 64, FTW_DEPTH | FTW_PHYS);
> +	return ret;
> +}
> +
> +/**
> + * igt_vkms_device_destroy:
> + * @dev: Device to destroy
> + *
> + * Remove and free the VKMS device.
> + */
> +void igt_vkms_device_destroy(igt_vkms_t *dev)
> +{
> +	int ret;
> +
> +	igt_assert(dev);
> +
> +	ret = remove_device_dir(dev);
> +	igt_assert_f(ret == 0,
> +		     "Unable to rmdir device directory '%s'. Got errno=%d (%s)\n",
> +		     dev->path, errno, strerror(errno));
> +
> +	free(dev->path);
> +	free(dev);
> +}
> +
> +/**
> + * igt_vkms_destroy_all_devices:
> + *
> + * Remove all VKMS devices created via configfs.
> + */
> +void igt_vkms_destroy_all_devices(void)
> +{
> +	igt_vkms_t *dev;
> +	const char *vkms_root_path;
> +	DIR *dir;
> +	struct dirent *ent;
> +
> +	vkms_root_path = mount_vkms_configfs();
> +	dir = opendir(vkms_root_path);
> +	igt_assert_f(dir, "VKMS configfs directory not available at '%s'. "
> +		     "Got errno=%d (%s)\n", vkms_root_path, errno,
> +		     strerror(errno));
> +
> +	while ((ent = readdir(dir)) != NULL) {
> +		if (strcmp(ent->d_name, ".") == 0 ||
> +		    strcmp(ent->d_name, "..") == 0)
> +			continue;
> +
> +		dev = igt_vkms_device_create(ent->d_name);
> +		igt_vkms_device_destroy(dev);
> +	}
> +
> +	closedir(dir);
> +}
> diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
> new file mode 100644
> index 000000000..48c48f296
> --- /dev/null
> +++ b/lib/igt_vkms.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Google LLC.
> + * Copyright © 2023 Collabora, Ltd.
> + * Copyright © 2024 Red Hat, Inc.
> + */
> +
> +#ifndef __IGT_VKMS_H__
> +#define __IGT_VKMS_H__
> +
> +/**
> + * igt_vkms_t:
> + * @path: VKMS root directory inside configfs mounted directory
> + *
> + * A struct representing a VKMS device.
> + */
> +typedef struct igt_vkms {
> +	char *path;
> +} igt_vkms_t;
> +
> +void igt_require_vkms_configfs(void);
> +
> +igt_vkms_t *igt_vkms_device_create(const char *name);
> +void igt_vkms_device_destroy(igt_vkms_t *dev);
> +void igt_vkms_destroy_all_devices(void);
> +
> +#endif /* __IGT_VKMS_H__ */
> diff --git a/lib/meson.build b/lib/meson.build
> index 201b1fbb4..8e0b4b7e3 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -50,6 +50,7 @@ lib_sources = [
>   	'igt_types.c',
>   	'igt_vec.c',
>   	'igt_vgem.c',
> +	'igt_vkms.c',
>   	'igt_x86.c',
>   	'instdone.c',
>   	'intel_allocator.c',
> diff --git a/meson.build b/meson.build
> index 2f663dc03..aec49152b 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -287,6 +287,7 @@ msmdir = join_paths(libexecdir, 'msm')
>   panfrostdir = join_paths(libexecdir, 'panfrost')
>   v3ddir = join_paths(libexecdir, 'v3d')
>   vc4dir = join_paths(libexecdir, 'vc4')
> +vkmsdir = join_paths(libexecdir, 'vkms')
>   vmwgfxdir = join_paths(libexecdir, 'vmwgfx')
>   mandir = get_option('mandir')
>   pkgconfigdir = join_paths(libdir, 'pkgconfig')
> @@ -348,6 +349,12 @@ if get_option('use_rpath')
>   	endforeach
>   	vc4_rpathdir = join_paths(vc4_rpathdir, libdir)
>   
> +	vkms_rpathdir = '$ORIGIN'
> +	foreach p : vkmsdir.split('/')
> +		vkms_rpathdir = join_paths(vkms_rpathdir, '..')
> +	endforeach
> +	vkms_rpathdir = join_paths(vkms_rpathdir, libdir)
> +
>   	vmwgfx_rpathdir = '$ORIGIN'
>   	foreach p : vmwgfxdir.split('/')
>   		vmwgfx_rpathdir = join_paths(vmwgfx_rpathdir, '..')
> @@ -361,6 +368,7 @@ else
>   	panfrost_rpathdir = ''
>   	v3d_rpathdir = ''
>   	vc4_rpathdir = ''
> +	vkms_rpathdir = ''
>   	vmwgfx_rpathdir = ''
>   endif
>   
> diff --git a/tests/meson.build b/tests/meson.build
> index f8a0ab836..b2ec1361d 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -474,6 +474,8 @@ subdir('v3d')
>   
>   subdir('vc4')
>   
> +subdir('vkms')
> +
>   subdir('vmwgfx')
>   
>   gen_testlist = find_program('generate_testlist.sh')
> diff --git a/tests/vkms/meson.build b/tests/vkms/meson.build
> new file mode 100644
> index 000000000..e55ba32ba
> --- /dev/null
> +++ b/tests/vkms/meson.build
> @@ -0,0 +1,13 @@
> +vkms_progs = [
> +	'vkms_configfs',
> +]
> +vkms_deps = test_deps
> +
> +foreach prog : vkms_progs
> +	test_executables += executable(prog, prog + '.c',
> +				       dependencies : vkms_deps,
> +				       install_dir : vkmsdir,
> +				       install_rpath : vkms_rpathdir,
> +				       install : true)
> +	test_list += join_paths('vkms', prog)
> +endforeach
> diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
> new file mode 100644
> index 000000000..441c39a47
> --- /dev/null
> +++ b/tests/vkms/vkms_configfs.c
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Google LLC.
> + * Copyright © 2023 Collabora, Ltd.
> + * Copyright © 2024 Red Hat, Inc.
> + */
> +
> +/**
> + * TEST: Tests for VKMS configfs support.
> + * Category: Display
> + * Mega feature: General Display Features
> + * Sub-category: uapi
> + * Functionality: vkms,configfs
> + * Test category: functionality test
> + */
> +
> +#include <dirent.h>
> +#include <string.h>
> +
> +#include <linux/limits.h>
> +#include <sys/stat.h>
> +
> +#include "drmtest.h"
> +#include "igt.h"
> +#include "igt_vkms.h"
> +
> +static void assert_default_files(const char *path,
> +				 const char **files, size_t n_files,
> +				 const char **dirs, size_t n_dirs)
> +{
> +	DIR *dir;
> +	struct dirent *ent;
> +	int total = 0;
> +
> +	/* Check that the number of files/directories matches the expected.
> +	 * Plus 2 because of "." and "..".
> +	 */
> +	dir = opendir(path);
> +	igt_assert(dir);
> +	while ((ent = readdir(dir)) != NULL)
> +		total++;

Can we simply skip "." and ".." as you did in 
igt_vkms_destroy_all_devices? This way we don't have this "magic" +2

> +	igt_assert_eq(total, n_dirs + n_files + 2);
> +	closedir(dir);
> +
> +	/* Check that the files/directories are present */
> +	for (int i = 0; i < n_files; i++) {
> +		char file_path[PATH_MAX];
> +		struct stat buf;
> +
> +		snprintf(file_path, sizeof(file_path), "%s/%s", path, files[i]);
> +
> +		igt_assert_eq(stat(file_path, &buf), 0);

Can you transform this igt_assert_eq into:

	igt_assert_f(stat(...) == 0, "File %s does not exists\n", file_path)

So it is easier to know exactly the fail reason

> +	}
> +
> +	for (int i = 0; i < n_dirs; i++) {
> +		char dir_path[PATH_MAX];
> +
> +		snprintf(dir_path, sizeof(dir_path), "%s/%s", path, dirs[i]);

Ditto

Thanks,
Louis Chauvet

> +		dir = opendir(dir_path);
> +		igt_assert(dir);
> +		closedir(dir);
> +	}
> +}
> +
> +/**
> + * SUBTEST: device-default-files
> + * Description: Test that creating a VKMS device creates the default files and
> + *              directories.
> + */
> +
> +static void test_device_default_files(void)
> +{
> +	igt_vkms_t *dev;
> +
> +	const char *files[] = {
> +		"enabled",
> +	};
> +
> +	const char *dirs[] = {
> +		"planes",
> +		"crtcs",
> +		"encoders",
> +		"connectors",
> +	};
> +
> +	dev = igt_vkms_device_create(__func__);
> +	igt_assert(dev);
> +
> +	assert_default_files(dev->path,
> +			     files, ARRAY_SIZE(files),
> +			     dirs, ARRAY_SIZE(dirs));
> +
> +	igt_vkms_device_destroy(dev);
> +}
> +
> +igt_main
> +{
> +	struct {
> +		const char *name;
> +		void (*fn)(void);
> +	} tests[] = {
> +		{ "device-default-files", test_device_default_files },
> +	};
> +
> +	igt_fixture {
> +		igt_require_vkms();
> +		igt_require_vkms_configfs();
> +		igt_vkms_destroy_all_devices();
> +	}
> +
> +	for (int i = 0; i < ARRAY_SIZE(tests); i++) {
> +		igt_subtest(tests[i].name)
> +			tests[i].fn();
> +	}
> +
> +	igt_fixture {
> +		igt_require_vkms();
> +		igt_require_vkms_configfs();
> +		igt_vkms_destroy_all_devices();
> +	}
> +}
> diff --git a/tests/vkms/vkms_test_config.json b/tests/vkms/vkms_test_config.json
> new file mode 100644
> index 000000000..4e84e184a
> --- /dev/null
> +++ b/tests/vkms/vkms_test_config.json
> @@ -0,0 +1,72 @@
> +{
> +    "description": "JSON file to be used to parse VKMS documentation",
> +    "name": "Tests for VKMS Driver",
> +    "drivers": [ "vkms" ],
> +    "files": [ "*.c" ],
> +    "fields": {
> +        "Run type": {
> +            "_properties_": {
> +                "mandatory": true
> +            },
> +            "Category": {
> +                "_properties_": {
> +                    "description": "Contains the major group for the tested functionality 'Display'"
> +                },
> +                "Mega feature": {
> +                    "_properties_": {
> +                        "mandatory": true,
> +                        "description": "Contains the mega feature for end to end use case"
> +                    },
> +                    "Sub-category": {
> +                        "_properties_": {
> +                            "mandatory": true,
> +                            "description": "Contains the technical feature/functionality"
> +                        },
> +                        "Functionality": {
> +                            "_properties_": {
> +                                "mandatory": true,
> +                                "description": "Groups page table tests on buckets containing more detailed functionality"
> +                            },
> +                            "Feature": {
> +                                "_properties_": {
> +                                    "description": "Describes the lowest level feature bucket"
> +                                }
> +                            }
> +                        }
> +                    }
> +                }
> +            }
> +        },
> +        "Test category": {
> +            "_properties_": {
> +                "description": "Defines the test category. Usually used at subtest level."
> +            }
> +        },
> +        "Test requirement": {
> +            "_properties_": {
> +                "description": "Defines Kernel parameters required for the test to run"
> +            }
> +        },
> +        "Issue": {
> +            "_properties_": {
> +                "description": "If the test is used to solve an issue, point to the URL containing the issue."
> +            }
> +        },
> +        "Depends on": {
> +            "_properties_": {
> +                "description": "List other subtests that are required to not be skipped before calling this one."
> +            }
> +        },
> +        "TODO": {
> +            "_properties_": {
> +                "description": "Point to known missing features at the test or subtest."
> +            }
> +        },
> +        "Description": {
> +            "_properties_": {
> +                "mandatory": true,
> +                "description": "Provides a description for the test/subtest."
> +            }
> +        }
> +    }
> +}


-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


