Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCC4C83F25
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 16:33:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6847810E39D;
	Mon, 21 Jul 2025 16:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g5S9LtYd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518B610E39D
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jul 2025 16:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753115602; x=1784651602;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7aJuQSe4tFRju67fUsFttH7Q+9/DV6N/RQxIFcCLySw=;
 b=g5S9LtYdWwzcCPSkKldefcFxrAG/qX5ayon2R4ZnIa24XGeEF/TOTesA
 iy/o+5V6k5JdwL6EomTyObsI5kniuep2GSeKSTkgySffxG4iIG5rmgCw4
 bunJJeSlfgCdOfMc4FeCUPqd9nxKcXNlGo9FbH9mjbAg6Z4vqVfkTpvUH
 6hXzowky2p9wZRv1xnLEkqmWSmPKTLrKikA9YRZF34sLZuo2/ENz0c2mA
 aEId3D8Gy5kSlJF7mTK/880i0zs1nAES5JWoW+j4pXolP/XVuhW+O7MSz
 NuuQEy+a7PcMfx/QCEHVxf/c8Wm7E79AvMZw40ACjki7/SPDf37n1uAmF w==;
X-CSE-ConnectionGUID: 7DqirfQfSuuNQ4ANXAqEgA==
X-CSE-MsgGUID: 67qosJHaTRSUldJsNf3gZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="66407852"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="66407852"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 09:33:22 -0700
X-CSE-ConnectionGUID: lcClynIaQkCT+fsOBQMXLw==
X-CSE-MsgGUID: NWrwR+BDSreheqpysfCXWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="158941628"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 09:33:20 -0700
Date: Mon, 21 Jul 2025 18:33:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 zbigniew.kempczynski@intel.com, Jim Shargo <jshargo@chromium.org>,
 Marius Vlad <marius.vlad@collabora.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t v3 02/41] lib/vkms: Add minimal VKMS library and
 test device default files
Message-ID: <20250721163317.g56z3bvqdonod2lp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 zbigniew.kempczynski@intel.com, Jim Shargo <jshargo@chromium.org>,
 Marius Vlad <marius.vlad@collabora.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20250715102513.5636-1-jose.exposito89@gmail.com>
 <20250715102513.5636-3-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250715102513.5636-3-jose.exposito89@gmail.com>
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
On 2025-07-15 at 12:24:34 +0200, José Expósito wrote:
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
>  docs/testplan/meson.build        |   7 +-
>  lib/igt_vkms.c                   | 207 +++++++++++++++++++++++++++++++
>  lib/igt_vkms.h                   |  27 ++++
>  lib/meson.build                  |   1 +
>  meson.build                      |   8 ++
>  tests/meson.build                |   2 +
>  tests/vkms/meson.build           |  13 ++
>  tests/vkms/vkms_configfs.c       | 132 ++++++++++++++++++++
>  tests/vkms/vkms_test_config.json |  72 +++++++++++
>  9 files changed, 467 insertions(+), 2 deletions(-)
>  create mode 100644 lib/igt_vkms.c
>  create mode 100644 lib/igt_vkms.h
>  create mode 100644 tests/vkms/meson.build
>  create mode 100644 tests/vkms/vkms_configfs.c
>  create mode 100644 tests/vkms/vkms_test_config.json
> 
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index 5560347f1..9e22f4c7d 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -11,6 +11,7 @@ stylesheet = join_paths(meson.current_source_dir(), 'testplan.css')
>  xe_test_config = join_paths(source_root, 'tests', 'intel', 'xe_test_config.json')
>  kms_test_config = join_paths(source_root, 'tests', 'intel', 'kms_test_config.json')
>  i915_test_config = join_paths(source_root, 'tests', 'intel', 'i915_test_config.json')
> +vkms_test_config = join_paths(source_root, 'tests', 'vkms', 'vkms_test_config.json')

I am not sure if we need them in a testplan here and below?
+cc Karthik and Swati

>  
>  check_testlist = []
>  kms_check_testlist = []
> @@ -37,12 +38,14 @@ if build_xe
>  	test_dict = {
>  		'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
>  		'kms_tests': { 'input': kms_test_config, 'extra_args': kms_check_testlist },
> -		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
> +		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist },
> +		'vkms_tests': { 'input': vkms_test_config, 'extra_args': check_testlist }
>  	    }
>  else
>  	test_dict = {
>  	      'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
> -	      'kms_tests': { 'input': kms_test_config, 'extra_args': kms_check_testlist }
> +	      'kms_tests': { 'input': kms_test_config, 'extra_args': kms_check_testlist },
> +	      'vkms_tests': { 'input': vkms_test_config, 'extra_args': check_testlist }
>  	    }
>  endif
>  
> diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
> new file mode 100644
> index 000000000..fa41f741e
> --- /dev/null
> +++ b/lib/igt_vkms.c
> @@ -0,0 +1,207 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Google LLC.
> + * Copyright © 2023 Collabora, Ltd.
> + * Copyright © 2024 Red Hat, Inc.

Should it also be 2025 here?

> + */
> +
> +#include <dirent.h>
> +#include <errno.h>
> +#include <string.h>
> +
> +#include <ftw.h>
> +#include <linux/limits.h>

Why not <limits.h> ?

> +#include <sys/stat.h>

Why not <stat.h> ?

Btw please keep all system libs sorted alphabetically.
The same goes for other code below.

Regards,
Kamil

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
> index 35ca0e0e9..c47ab29b1 100644
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
> index 4efad72cf..dce46e0b2 100644
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
> index 881b204a5..8886c1cb8 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -487,6 +487,8 @@ subdir('v3d')
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
> index 000000000..b942cec64
> --- /dev/null
> +++ b/tests/vkms/vkms_configfs.c
> @@ -0,0 +1,132 @@
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
> -- 
> 2.50.0
> 
