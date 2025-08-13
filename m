Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3465C87FCF
	for <igt-dev@archiver.kernel.org>; Wed, 13 Aug 2025 13:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9622010E1E4;
	Wed, 13 Aug 2025 13:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2FilVOq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4872510E1E3
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Aug 2025 13:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755091711; x=1786627711;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QBqCrpHQUKeSVn9Zz4STQsMk/ZO7Xu5NfiPSGjfCbFg=;
 b=m2FilVOqdwe5lnQJNzE25au1TELZydfH34edbA+J7lZ06nznIa/AUKGK
 6EoS+QtczpNF/OtEj0vEYfzyaKUR0kSmHU6prauh1L/W/6BNkSk5hW6VU
 EmnuIGUg/Zg3wZkrsU0xevhCc3HA0SrqlEJEy6WU9VDYLsywemFqDaj0D
 VggQ3EHvwN7wpcCiNhLTWilWDuJBCGkhcgqwcg6gy1Ufk+xj+OJWscy2T
 Sd6JGIThtifv8AHgspn/wvL6aynlQLJU5kb2cdL0KlDzJyYH4Ig6VODnh
 v+/qgFWwjwVRoS9hLtBekLLveodIzI9dEJCFxnMOmod782/4Ptt5JK30R w==;
X-CSE-ConnectionGUID: 6gcI5Rg6Tt+Iz9vcHJr/GQ==
X-CSE-MsgGUID: sSPrT/jfQ+SgvEGLlhm9hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56594954"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="56594954"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 06:28:30 -0700
X-CSE-ConnectionGUID: UB2KdFbeR+6g98Q6g2xijA==
X-CSE-MsgGUID: R4jrrPu6SKGeQOtSeaRuow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166452158"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 06:28:29 -0700
Date: Wed, 13 Aug 2025 15:28:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 zbigniew.kempczynski@intel.com, karthik.b.s@intel.com,
 Jim Shargo <jshargo@chromium.org>, Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH i-g-t v4 02/41] lib/vkms: Add minimal VKMS library and
 test device default files
Message-ID: <20250813132826.oogpkwws3524ddx5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 zbigniew.kempczynski@intel.com, karthik.b.s@intel.com,
 Jim Shargo <jshargo@chromium.org>,
 Marius Vlad <marius.vlad@collabora.com>
References: <20250807074550.6543-1-jose.exposito89@gmail.com>
 <20250807074550.6543-3-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250807074550.6543-3-jose.exposito89@gmail.com>
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

Hi José,
On 2025-08-07 at 09:45:11 +0200, José Expósito wrote:
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
>  lib/igt_vkms.c             | 206 +++++++++++++++++++++++++++++++++++++
>  lib/igt_vkms.h             |  27 +++++
>  lib/meson.build            |   1 +
>  meson.build                |   8 ++
>  tests/meson.build          |   2 +
>  tests/vkms/meson.build     |  13 +++
>  tests/vkms/vkms_configfs.c | 131 +++++++++++++++++++++++

I checked changes as they are only minimal, imho you could keep
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

Also, you removed changes from testplan and docs building so
for build/meson changes
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Btw checkpatch suggests even one more const 
static const char * array should probably be static const char * const
but you could fix that later.

Regards,
Kamil

>  7 files changed, 388 insertions(+)
>  create mode 100644 lib/igt_vkms.c
>  create mode 100644 lib/igt_vkms.h
>  create mode 100644 tests/vkms/meson.build
>  create mode 100644 tests/vkms/vkms_configfs.c
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
>  	'igt_types.c',
>  	'igt_vec.c',
>  	'igt_vgem.c',
> +	'igt_vkms.c',
>  	'igt_x86.c',
>  	'instdone.c',
>  	'intel_allocator.c',
> diff --git a/meson.build b/meson.build
> index aeed3b1d2..f7ae427b3 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -290,6 +290,7 @@ msmdir = join_paths(libexecdir, 'msm')
>  panfrostdir = join_paths(libexecdir, 'panfrost')
>  v3ddir = join_paths(libexecdir, 'v3d')
>  vc4dir = join_paths(libexecdir, 'vc4')
> +vkmsdir = join_paths(libexecdir, 'vkms')
>  vmwgfxdir = join_paths(libexecdir, 'vmwgfx')
>  mandir = get_option('mandir')
>  pkgconfigdir = join_paths(libdir, 'pkgconfig')
> @@ -352,6 +353,12 @@ if get_option('use_rpath')
>  	endforeach
>  	vc4_rpathdir = join_paths(vc4_rpathdir, libdir)
>  
> +	vkms_rpathdir = '$ORIGIN'
> +	foreach p : vkmsdir.split('/')
> +		vkms_rpathdir = join_paths(vkms_rpathdir, '..')
> +	endforeach
> +	vkms_rpathdir = join_paths(vkms_rpathdir, libdir)
> +
>  	vmwgfx_rpathdir = '$ORIGIN'
>  	foreach p : vmwgfxdir.split('/')
>  		vmwgfx_rpathdir = join_paths(vmwgfx_rpathdir, '..')
> @@ -365,6 +372,7 @@ else
>  	panfrost_rpathdir = ''
>  	v3d_rpathdir = ''
>  	vc4_rpathdir = ''
> +	vkms_rpathdir = ''
>  	vmwgfx_rpathdir = ''
>  endif
>  
> diff --git a/tests/meson.build b/tests/meson.build
> index 5c01c64e9..a7b9375ed 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -490,6 +490,8 @@ subdir('v3d')
>  
>  subdir('vc4')
>  
> +subdir('vkms')
> +
>  subdir('vmwgfx')
>  
>  gen_testlist = find_program('generate_testlist.sh')
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
> -- 
> 2.50.1
> 
