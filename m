Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA923E9A756
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 09:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F62F10E5B9;
	Tue, 24 Mar 2026 09:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BycOUO5/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF5910E5B9
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 09:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774346311; x=1805882311;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tvPSipxsy10YM98RNYywnTekc3xYcgtY5gIOmBQLVss=;
 b=BycOUO5/4dCJh8F8bSlul8l5Ubf+cNMXx6iZU4GcVuyEzq1zW1EApfae
 f1pDjEamtbMEeVE9TA5UFb4EJ+AvCsiVfmsG0qKBS+SoTsF5EiHrGW4ij
 l9y36D6ZE5bm9H9fNITM/u3ZGC6UNXYN+/m++ULIbVbQjv2pJMyI3opVx
 u5HHawNvvkSL3hcnmr0Vj5RYNnhysSuCOFsTEjKLJ4WjPKKv+Q5nLsrxq
 DJgNLeS/VlFd4CZ0vH/1E1e58GPAzp/T1HvrF1CoBOFBa5LFgRUcStiog
 Z8yCEtXCyHOYLX/pbmFUgK9doZkRWkYc/15PCLnHplg7bzHOky+rrUaaD g==;
X-CSE-ConnectionGUID: H/rgkIsXQ0Gz/xTLZ4b7Mw==
X-CSE-MsgGUID: liQbIggEQsGVSky3VXW3qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="100802866"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="100802866"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 02:58:31 -0700
X-CSE-ConnectionGUID: 8B7LUfVzSp+EWpfAnabVjQ==
X-CSE-MsgGUID: ckn5g+HRRKi/qe7Q+goaTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="228784973"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 02:58:29 -0700
Date: Tue, 24 Mar 2026 10:58:26 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, kory.maincent@bootlin.com,
 markyacoub@google.com, khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v9 20/49] lib/unigraf: Initial Unigraf support
Message-ID: <20260324095826.anyud5gwou5ritix@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, kory.maincent@bootlin.com,
 markyacoub@google.com, khaled.almahallawy@intel.com
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-20-a01dffc3b0cb@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260316-unigraf-integration-v9-20-a01dffc3b0cb@bootlin.com>
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

Hi Louis,
On 2026-03-16 at 17:17:41 +0100, Louis Chauvet wrote:
> This introduce the basic boilerplate to connect to a unigraf device.
> 
> This integration currently only supports one device opened to simplify
> its usage and cleanup.
> 
> The functions unigraf_open_device and unigraf_require_device will register
> a handler to do proper cleanup on IGT exit.
> 
> Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/meson.build       |  10 +++++
>  lib/unigraf/unigraf.c | 120 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/unigraf/unigraf.h |  43 ++++++++++++++++++
>  meson.build           |  14 ++++++
>  4 files changed, 187 insertions(+)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index cd03e8f634e4..268f3238cbfa 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -151,6 +151,13 @@ lib_deps = [
>  	zlib
>  ]
>  
> +if libtsi.found()
> +	lib_deps += libtsi
> +	lib_sources += [
> +		'unigraf/unigraf.c'
> +	]
> +endif
> +
>  if libdrm_nouveau.found()
>  	lib_deps += libdrm_nouveau
>  	lib_sources += [
> @@ -232,6 +239,9 @@ endif
>  if chamelium.found()
>  	lib_deps += chamelium
>  	lib_sources += [ 'igt_chamelium.c', 'igt_chamelium_stream.c' ]
> +endif
> +
> +if chamelium.found() or libtsi.found()
>  	lib_sources += 'monitor_edids/monitor_edids_helper.c'
>  endif
>  
> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
> new file mode 100644
> index 000000000000..df18ab178e16
> --- /dev/null
> +++ b/lib/unigraf/unigraf.c
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Google
> + *
> + * Authors:
> + *   Louis Chauvet <louis.chauvet@bootlin.com>
> + */
> +
> +#include "igt_core.h"
> +#include <stdint.h>

Please include first system headers, then igt ones,
all in alphabetical order. Also separate them with
one empty line, so here it should look:

#include <stdint.h>

#include "igt_core.h"

> +
> +#include "unigraf.h"
> +#include "TSI.h"
> +#include "TSI_types.h"

Up to you if you prefer to keep all unigraf includes
in one section or mixed in igt ones, just keep it
consistent in all other files.

Few more nits below.

> +
> +#define unigraf_debug(fmt, ...)	igt_debug("TSI:%p: " fmt, unigraf_device, ##__VA_ARGS__)
> +
> +static TSI_HANDLE unigraf_device;
> +static char *unigraf_default_edid;
> +static char *unigraf_connector_name;
> +
> +static void unigraf_close_device(void)
> +{
> +	if (!unigraf_device)
> +		return;
> +
> +	unigraf_debug("Closing...\n");
> +	unigraf_assert(TSIX_DEV_CloseDevice(unigraf_device));
> +	TSI_Clean();
> +	unigraf_device = NULL;
> +	free(unigraf_default_edid);
> +	free(unigraf_connector_name);
> +}
> +
> +/**
> + * unigraf_exit_handler - Handle the exit signal and clean up unigraf resources.
> + * @sig: The signal number received.
> + *
> + * This function is called when the program receives an exit signal. It ensures
> + * that all unigraf resources are properly cleaned up by calling unigraf_deinit
> + * for each open instance.
> + */
> +static void unigraf_exit_handler(int sig)
> +{
> +	unigraf_close_device();
> +}
> +
> +static void unigraf_init(void)
> +{
> +	int ret;
> +
> +	unigraf_debug("Initialize unigraf...\n");
> +	ret = TSI_Init(TSI_CURRENT_VERSION);
> +	unigraf_assert(ret);
> +	igt_install_exit_handler(unigraf_exit_handler);
> +}
> +
> +/**
> + * unigraf_device_count() - Return the number of scanned devices
> + *
> + * Must be called after a unigraf_rescan_devices().
> + */
> +static unsigned int unigraf_device_count(void)
> +{
> +	return unigraf_assert(TSIX_DEV_GetDeviceCount());
> +}
> +
> +/**
> + * unigraf_open_device() - Search and open a device.
> + * @drm_fd: File descriptor of the currently used drm device
> + *
> + * Returns: true if a device was found and initialized, otherwise false.
> + *
> + * This function searches for a compatible device and opens it.

I see asserts in code, please document that behaviour.

> + */
> +bool unigraf_open_device(int drm_fd)
> +{
> +	TSI_RESULT r;
> +	int device_count;
> +	int chosen_device = 0;
> +	int chosen_role = 0;
> +	int chosen_input = 0;
> +
> +	assert(igt_can_fail());
> +
> +	if (unigraf_device)
> +		return true;
> +
> +	unigraf_init();
> +
> +	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
> +
> +	device_count = unigraf_device_count();
> +	if (device_count < 1) {
> +		unigraf_debug("No device found.\n");
> +		return false;
> +	}
> +
> +	unigraf_device = TSIX_DEV_OpenDevice(chosen_device, &r);
> +	unigraf_assert(r);
> +	igt_assert(unigraf_device);
> +	unigraf_debug("Successfully opened the unigraf device %d.\n", chosen_device);
> +
> +	unigraf_assert(TSIX_DEV_SelectRole(unigraf_device, chosen_role));
> +	unigraf_assert(TSIX_VIN_Select(unigraf_device, chosen_input));
> +	unigraf_assert(TSIX_VIN_Enable(unigraf_device, chosen_input));
> +
> +	return true;
> +}
> +
> +/**
> + * unigraf_require_device() - Search and open a device.
> + * @drm_fd: File descriptor of the currently used drm device
> + *
> + * This is a shorthand to reduce test boilerplate when a unigraf device must be present.
> + */
> +void unigraf_require_device(int drm_fd)
> +{
> +	igt_require(unigraf_open_device(drm_fd));
> +}
> diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
> new file mode 100644
> index 000000000000..c08ce62894c5
> --- /dev/null
> +++ b/lib/unigraf/unigraf.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Google
> + *
> + * Authors:
> + *   Louis Chauvet <louis.chauvet@bootlin.com>
> + */
> +
> +#ifndef UNIGRAF_H
> +#define UNIGRAF_H
> +
> +#include <stdbool.h>
> +#include <stdint.h>
> +
> +/**
> + * unigraf_assert: Helper macro to assert a TSI return value and retrieve a detailed error message.
> + * @result: libTSI return value to check
> + *
> + * This macro checks the return value of a libTSI function call. If the return value indicates an
> + * error, it retrieves a detailed error message and asserts with that message.
> + * If retrieving the error description fails, it asserts with a generic error message.
> + */
> +#define unigraf_assert(result)									\
> +({												\
> +	char msg[256];										\
> +	TSI_RESULT __r = (result);								\
> +	if (__r < TSI_SUCCESS) {								\
> +		TSI_RESULT __r2 = TSI_MISC_GetErrorDescription(__r, msg, sizeof(msg));		\
> +		if (__r2 < TSI_SUCCESS)								\
> +			igt_assert_f(false,							\
> +				     "unigraf error: %d (get error description failed: %d)\n",	\
> +				     __r, __r2);						\
> +		else										\
> +			igt_assert_f(false, "unigraf error: %d (%s)\n", __r, msg);		\
> +	}											\
> +	(__r);											\
> +})
> +
> +bool unigraf_open_device(int drm_fd);
> +
> +void unigraf_require_device(int drm_fd);
> +
> +#endif // UNIGRAF_H
> diff --git a/meson.build b/meson.build
> index 57849648a377..127abbf62024 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -166,6 +166,12 @@ libpci = dependency('libpci', required : true)
>  libudev = dependency('libudev', required : true)
>  glib = dependency('glib-2.0', required : true)
>  
> +libtsi = cc.find_library('TSI', required : false)
> +
> +if libtsi.found()
> +	config.set('HAVE_UNIGRAF', 1)
> +endif
> +
>  xmlrpc = dependency('xmlrpc', required : false)
>  xmlrpc_util = dependency('xmlrpc_util', required : false)
>  xmlrpc_client = dependency('xmlrpc_client', required : false)
> @@ -290,6 +296,7 @@ amdgpudir = join_paths(libexecdir, 'amdgpu')
>  msmdir = join_paths(libexecdir, 'msm')
>  panfrostdir = join_paths(libexecdir, 'panfrost')
>  panthordir = join_paths(libexecdir, 'panthor')
> +unigrafdir = join_paths(libexecdir, 'unigraf')
>  v3ddir = join_paths(libexecdir, 'v3d')
>  vc4dir = join_paths(libexecdir, 'vc4')
>  vkmsdir = join_paths(libexecdir, 'vkms')
> @@ -372,6 +379,12 @@ if get_option('use_rpath')
>  		vmwgfx_rpathdir = join_paths(vmwgfx_rpathdir, '..')
>  	endforeach
>  	vmwgfx_rpathdir = join_paths(vmwgfx_rpathdir, libdir)
> +
> +	unigraf_rpathdir = '$ORIGIN'
> +	foreach p : unigrafdir.split('/')
> +		unigraf_rpathdir = join_paths(unigraf_rpathdir, '..')
> +	endforeach
> +	unigraf_rpathdir = join_paths(unigraf_rpathdir, libdir)
>  else
>  	bindir_rpathdir = ''
>  	libexecdir_rpathdir = ''
> @@ -383,6 +396,7 @@ else
>  	vc4_rpathdir = ''
>  	vkms_rpathdir = ''
>  	vmwgfx_rpathdir = ''
> +	unigraf_rpathdir = ''

Move this to proper alphabetical place before v3d_rpathdir.

Regards,
Kamil

>  endif
>  
>  build_testplan = get_option('testplan')
> 
> -- 
> 2.52.0
> 
