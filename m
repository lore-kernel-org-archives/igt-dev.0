Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D3CCA1017
	for <igt-dev@archiver.kernel.org>; Fri,  5 Sep 2025 20:49:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C4D10EC44;
	Fri,  5 Sep 2025 20:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="C8tf8C7C";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D3510EC44
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Sep 2025 20:49:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 089EBC6B3A0;
 Fri,  5 Sep 2025 20:49:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 562886060B;
 Fri,  5 Sep 2025 20:49:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 14ED6102F1C6E; 
 Fri,  5 Sep 2025 22:49:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757105379; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=GXp4Tg0QqAtXQHEzUlL5u5djJSlDJLtUtXODtFGRHzY=;
 b=C8tf8C7C7UjO6Rsen4J68NX6pwpbP+w8GAZUWUs4CMU8g1gwfKZp24pUt9uJ/lKfugB/4d
 LDWOYFiQ3tkBd5XO/1V49cRkU2zLh6NrqO5r/54YkWRrKEWQumXtkHY8Vd+JfZClmjbElq
 jQj2Zl/m2yDqKQMXvBz0BfwHc0UcmnJ5AdVSoRvF8ka7gwECEp2KefPOg1nt4n9FtyH5ai
 yQTK3aEkO7HZ7LpB4INdaDaOy+2SueGvH75qP2E36IRHgrawwX3zRVa2vad6NVDBiVusO5
 SJU1/jIaX7J4FULGSZ1X9OjDnJHoCnhksr9aIGTH52YmfzMj/TOpw+A5RvmzyA==
Message-ID: <c7eaeb01-73c4-4911-ac7f-29c4c1572c86@bootlin.com>
Date: Fri, 5 Sep 2025 22:49:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 02/41] lib/vkms: Add minimal VKMS library and
 test device default files
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@linux.intel.com,
 karthik.b.s@intel.com, Jim Shargo <jshargo@chromium.org>,
 Marius Vlad <marius.vlad@collabora.com>
References: <20250807074550.6543-1-jose.exposito89@gmail.com>
 <20250807074550.6543-3-jose.exposito89@gmail.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250807074550.6543-3-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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



Le 07/08/2025 à 09:45, José Expósito a écrit :
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   lib/igt_vkms.c             | 206 +++++++++++++++++++++++++++++++++++++
>   lib/igt_vkms.h             |  27 +++++
>   lib/meson.build            |   1 +
>   meson.build                |   8 ++
>   tests/meson.build          |   2 +
>   tests/vkms/meson.build     |  13 +++
>   tests/vkms/vkms_configfs.c | 131 +++++++++++++++++++++++
>   7 files changed, 388 insertions(+)
>   create mode 100644 lib/igt_vkms.c
>   create mode 100644 lib/igt_vkms.h
>   create mode 100644 tests/vkms/meson.build
>   create mode 100644 tests/vkms/vkms_configfs.c
> 
> diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
> new file mode 100644
> index 000000000..03931d2e4
> --- /dev/null
> +++ b/lib/igt_vkms.c
> @@ -0,0 +1,206 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Google LLC.
> + * Copyright © 2023 Collabora, Ltd.
> + * Copyright © 2024-2025 Red Hat, Inc.
> + */
> +
> +#include <dirent.h>
> +#include <errno.h>
> +#include <ftw.h>
> +#include <limits.h>
> +#include <string.h>
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
> +	int ret;
> +
> +	configfs_path = igt_configfs_mount();
> +	igt_assert_f(configfs_path, "Error mounting configfs");
> +
> +	ret = snprintf(vkms_root_path, sizeof(vkms_root_path), "%s/%s",
> +		       configfs_path, VKMS_ROOT_DIR_NAME);
> +	igt_assert(ret >= 0 && ret < sizeof(vkms_root_path));
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
> +	ret = snprintf(dev->path, path_len, "%s/%s", vkms_root_path, name);
> +	igt_assert(ret >= 0 && ret < path_len);
> +
> +	dir = opendir(dev->path);
> +	if (dir) {
> +		igt_debug("Device at path %s already exists\n", dev->path);
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
> +	/*
> +	 * Level 4 are the links in the possible_* directories:
> +	 * vkms/<dev>/<pipeline items>/<pipeline item>/<possible_*>/<links>
> +	 */
> +	if (pathinfo->level == 4 && typeflag == FTW_SL) {
> +		igt_debug("Detaching pipeline item %s\n", path);
> +		return unlink(path);
> +	}
> +
> +	/* Ignore the other files, they are removed by remove_pipeline_items */
> +	return 0;
> +}
> +
> +static int remove_pipeline_items(const char *path, const struct stat *info,
> +				 const int typeflag, struct FTW *pathinfo)
> +{
> +	/* Level 0 is the device root directory: vkms/<dev> */
> +	if (pathinfo->level == 0) {
> +		igt_debug("Removing pipeline item %s\n", path);
> +		return rmdir(path);
> +	}
> +
> +	/*
> +	 * Level 2 directories are the pipeline items:
> +	 * vkms/<dev>/<pipeline items>/<pipeline item>
> +	 */
> +	if (pathinfo->level == 2 && typeflag == FTW_DP) {
> +		igt_debug("Removing pipeline item %s\n", path);
> +		return rmdir(path);
> +	}
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
> index 000000000..95d7a53cd
> --- /dev/null
> +++ b/lib/igt_vkms.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Google LLC.
> + * Copyright © 2023 Collabora, Ltd.
> + * Copyright © 2024-2025 Red Hat, Inc.
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
> index 2eaca42a4..62ba7f262 100644
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
> index aeed3b1d2..f7ae427b3 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -290,6 +290,7 @@ msmdir = join_paths(libexecdir, 'msm')
>   panfrostdir = join_paths(libexecdir, 'panfrost')
>   v3ddir = join_paths(libexecdir, 'v3d')
>   vc4dir = join_paths(libexecdir, 'vc4')
> +vkmsdir = join_paths(libexecdir, 'vkms')
>   vmwgfxdir = join_paths(libexecdir, 'vmwgfx')
>   mandir = get_option('mandir')
>   pkgconfigdir = join_paths(libdir, 'pkgconfig')
> @@ -352,6 +353,12 @@ if get_option('use_rpath')
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
> @@ -365,6 +372,7 @@ else
>   	panfrost_rpathdir = ''
>   	v3d_rpathdir = ''
>   	vc4_rpathdir = ''
> +	vkms_rpathdir = ''
>   	vmwgfx_rpathdir = ''
>   endif
>   
> diff --git a/tests/meson.build b/tests/meson.build
> index 5c01c64e9..a7b9375ed 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -490,6 +490,8 @@ subdir('v3d')
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
> index 000000000..f659a7a22
> --- /dev/null
> +++ b/tests/vkms/vkms_configfs.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Google LLC.
> + * Copyright © 2023 Collabora, Ltd.
> + * Copyright © 2024-2025 Red Hat, Inc.
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
> +#include <limits.h>
> +#include <string.h>
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
> +	int ret;
> +
> +	/* Check that the number of files/directories matches the expected */
> +	dir = opendir(path);
> +	igt_assert(dir);
> +	while ((ent = readdir(dir)) != NULL) {
> +		if (strcmp(ent->d_name, ".") == 0 ||
> +		    strcmp(ent->d_name, "..") == 0)
> +			continue;
> +
> +		total++;
> +	}
> +	igt_assert_eq(total, n_dirs + n_files);
> +	closedir(dir);
> +
> +	/* Check that the files/directories are present */
> +	for (int i = 0; i < n_files; i++) {
> +		char file_path[PATH_MAX];
> +		struct stat buf;
> +
> +		ret = snprintf(file_path, sizeof(file_path), "%s/%s", path,
> +			       files[i]);
> +		igt_assert(ret >= 0 && ret < sizeof(file_path));
> +
> +		igt_assert_f(stat(file_path, &buf) == 0,
> +			     "File %s does not exists\n", file_path);
> +	}
> +
> +	for (int i = 0; i < n_dirs; i++) {
> +		char dir_path[PATH_MAX];
> +
> +		ret = snprintf(dir_path, sizeof(dir_path), "%s/%s", path,
> +			       dirs[i]);
> +		igt_assert(ret >= 0 && ret < sizeof(dir_path));
> +
> +		dir = opendir(dir_path);
> +		igt_assert_f(dir, "Directory %s does not exists\n", dir_path);
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
> +	static const char *files[] = {
> +		"enabled",
> +	};
> +
> +	static const char *dirs[] = {
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
> +		drm_load_module(DRIVER_VKMS);
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

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

