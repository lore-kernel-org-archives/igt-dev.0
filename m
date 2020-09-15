Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F816E039
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Sep 2020 07:53:17 +0000 (UTC)
Date: Tue, 15 Sep 2020 10:33:34 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200915073334.GS7444@platvala-desk.ger.corp.intel.com>
References: <20200904005439.17146-1-abhinavk@codeaurora.org>
 <20200904005439.17146-2-abhinavk@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904005439.17146-2-abhinavk@codeaurora.org>
Subject: Re: [igt-dev] [PATCH i-g-t 1/5] tools: rename
 intel_dp_compliance_hotplug to igt_dp_compliance_hotplug
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: khsieh@codeaurora.org, tanmay@codeaurora.org, swboyd@chromium.org, igt-dev@lists.freedesktop.org, nganji@codeaurora.org, seanpaul@chromium.org, aravindh@codeaurora.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 03, 2020 at 05:54:35PM -0700, Abhinav Kumar wrote:
> Rename intel_dp_compliance_hotplug to igt_dp_compliance_hotplug so that
> other modules can use the APIs.
> =

> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  tools/Makefile.sources                                   | 4 ++--
>  tools/{intel_dp_compliance.h =3D> igt_dp_compliance.h}     | 5 +++--
>  ..._compliance_hotplug.c =3D> igt_dp_compliance_hotplug.c} | 9 +++++----
>  tools/intel_dp_compliance.c                              | 7 ++++---
>  tools/meson.build                                        | 2 +-
>  5 files changed, 15 insertions(+), 12 deletions(-)
>  rename tools/{intel_dp_compliance.h =3D> igt_dp_compliance.h} (89%)
>  rename tools/{intel_dp_compliance_hotplug.c =3D> igt_dp_compliance_hotpl=
ug.c} (93%)
> =

> diff --git a/tools/Makefile.sources b/tools/Makefile.sources
> index b7a43d47..c28bef2f 100644
> --- a/tools/Makefile.sources
> +++ b/tools/Makefile.sources
> @@ -63,8 +63,8 @@ intel_l3_parity_SOURCES =3D	\
>  =

>  intel_dp_compliance_SOURCES =3D \
>          intel_dp_compliance.c \
> -        intel_dp_compliance.h \
> -        intel_dp_compliance_hotplug.c \
> +        igt_dp_compliance.h \
> +        igt_dp_compliance_hotplug.c \
>          $(NULL)
>  =

>  amd_hdmi_compliance_SOURCES =3D \
> diff --git a/tools/intel_dp_compliance.h b/tools/igt_dp_compliance.h
> similarity index 89%
> rename from tools/intel_dp_compliance.h
> rename to tools/igt_dp_compliance.h
> index 50a9662e..bf2b0701 100644
> --- a/tools/intel_dp_compliance.h
> +++ b/tools/igt_dp_compliance.h
> @@ -1,4 +1,5 @@
>  /*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>   * Copyright 2017 Intel Corporation
>   * Manasi Navare <manasi.d.navare@intel.com>
>   *
> @@ -28,8 +29,8 @@
>  =

>  extern int drm_fd;
>  =

> -gboolean intel_dp_compliance_setup_hotplug(void);
> -void intel_dp_compliance_cleanup_hotplug(void);
> +gboolean igt_dp_compliance_setup_hotplug(void);
> +void igt_dp_compliance_cleanup_hotplug(void);
>  =

>  /* called by the hotplug code */
>  int update_display(int mode, bool is_compliance_test);
> diff --git a/tools/intel_dp_compliance_hotplug.c b/tools/igt_dp_complianc=
e_hotplug.c
> similarity index 93%
> rename from tools/intel_dp_compliance_hotplug.c
> rename to tools/igt_dp_compliance_hotplug.c
> index b57f8a27..d05e45ca 100644
> --- a/tools/intel_dp_compliance_hotplug.c
> +++ b/tools/igt_dp_compliance_hotplug.c
> @@ -1,4 +1,5 @@
>  /*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>   * Copyright 2017 Intel Corporation
>   *   Jesse Barnes <jesse.barnes@intel.com>
>   *   Manasi Navare <manasi.d.navare@intel.com>
> @@ -29,7 +30,7 @@
>  =

>  #include <sys/stat.h>
>  =

> -#include "intel_dp_compliance.h"
> +#include "igt_dp_compliance.h"
>  #include <libudev.h>
>  static struct udev_monitor *uevent_monitor;
>  static struct udev *udev;
> @@ -62,7 +63,7 @@ out:
>  }
>  =

>  =

> -gboolean intel_dp_compliance_setup_hotplug(void)
> +gboolean igt_dp_compliance_setup_hotplug(void)
>  {
>  	int ret;
>  =

> @@ -109,11 +110,11 @@ gboolean intel_dp_compliance_setup_hotplug(void)
>  	return TRUE;
>  =

>  out:
> -	intel_dp_compliance_cleanup_hotplug();
> +	igt_dp_compliance_cleanup_hotplug();
>  	return FALSE;
>  }
>  =

> -void intel_dp_compliance_cleanup_hotplug(void)
> +void igt_dp_compliance_cleanup_hotplug(void)
>  {
>  	if (udevchannel)
>  		g_io_channel_shutdown(udevchannel, TRUE, NULL);
> diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
> index f26108b5..5c423897 100644
> --- a/tools/intel_dp_compliance.c
> +++ b/tools/intel_dp_compliance.c
> @@ -1,4 +1,5 @@
>  /*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>   * Copyright =A9 2017 Intel Corporation
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining=
 a
> @@ -125,7 +126,7 @@
>  #include <fcntl.h>
>  #include <time.h>
>  =

> -#include "intel_dp_compliance.h"
> +#include "igt_dp_compliance.h"
>  =

>  #include <stdlib.h>
>  #include <signal.h>
> @@ -1067,7 +1068,7 @@ int main(int argc, char **argv)
>  		goto out_close;
>  	}
>  =

> -	if (!intel_dp_compliance_setup_hotplug()) {
> +	if (!igt_dp_compliance_setup_hotplug()) {
>  		igt_warn("Failed to initialize hotplug support\n");
>  		goto out_mainloop;
>  	}
> @@ -1108,7 +1109,7 @@ int main(int argc, char **argv)
>  out_stdio:
>  	g_io_channel_shutdown(stdinchannel, TRUE, NULL);
>  out_hotplug:
> -	intel_dp_compliance_cleanup_hotplug();
> +	igt_dp_compliance_cleanup_hotplug();
>  out_mainloop:
>  	g_main_loop_unref(mainloop);
>  out_close:
> diff --git a/tools/meson.build b/tools/meson.build
> index 34f95e79..05f2a172 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -60,7 +60,7 @@ endforeach
>  if libudev.found()
>  	intel_dp_compliance_src =3D [
>  		'intel_dp_compliance.c',
> -		'intel_dp_compliance_hotplug.c'
> +		'igt_dp_compliance_hotplug.c'
>  	]
>  	executable('intel_dp_compliance', sources : intel_dp_compliance_src,
>  		   dependencies : [tool_deps, libudev],
> -- =

> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
