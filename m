Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B842DC369AB
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 17:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F3E10E1D3;
	Thu, 24 Apr 2025 17:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W3ghliII";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC74D10E1D3
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 17:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745515128; x=1777051128;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aiSLUG6Ti7PDDfCm+/0m5KpI8gdEWgtlfPgZxHsi2tg=;
 b=W3ghliII+oIEcQYNaafjKCG2xRB6q49hkBoTPMWHSOvHjhWDj8jPdpgI
 mYpPdhjqvDSqAdtbdNrOhm0H+dS3P8RbVPpQdBBjYgmdRFNxLRh8XXQMK
 H5vBgMye2pRZ76SKRKcCoY2CT1W/prDuUT33ESPW0PDZVrjLjGrU4IGre
 BVLJ8/sF3thP3oa3eWy44Ftt1nBj9IVAh+nhTFJS4wJpff/EAao22we9P
 NO5lFDgeIsuMZ3l3LEQ7IulGSBaF6LFmiNBpM5qKxwejhLSshGzjA3YhD
 75Y9Sxrc/33RLUkMEdc3QyAUEeMK9iErhWyHyi5ej1buavE8gXbCNfuqj w==;
X-CSE-ConnectionGUID: +RcnbMxmQze0NaHvKW71UA==
X-CSE-MsgGUID: 0BKbO3DTRBKkWCHrz0OUag==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="58534556"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="58534556"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 10:18:47 -0700
X-CSE-ConnectionGUID: H+xf/+s9Rnq3fkX4oCJnOQ==
X-CSE-MsgGUID: relyBXHgRTC0Sf2dIZCyHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="132417574"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 10:18:46 -0700
Date: Thu, 24 Apr 2025 19:18:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/chamelium/kms_chamelium_color: print
 output name in assert
Message-ID: <20250424171842.bflhqhlce6o6jjf3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20250415063742.3026718-1-kunal1.joshi@intel.com>
 <20250415063742.3026718-3-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250415063742.3026718-3-kunal1.joshi@intel.com>
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

Hi Kunal,
On 2025-04-15 at 12:07:42 +0530, Kunal Joshi wrote:
> Print output name in assert
> 
> v2: print output name for better log readability (Swati)
> 
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_chamelium.c                   | 62 --------------------------
>  lib/igt_chamelium.h                   | 64 ++++++++++++++++++++++++---

Unrelated change, you didn't describe it, imho should go in separate patch.

>  lib/intel_compute.c                   |  2 +

Same here, unrelated.

>  tests/chamelium/kms_chamelium_color.c |  2 +-

This is a change described.

Regards,
Kamil

>  4 files changed, 61 insertions(+), 69 deletions(-)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index a96e36b5b..87ac1a1ca 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -24,28 +24,7 @@
>   *  Lyude Paul <lyude@redhat.com>
>   */
>  
> -#include "config.h"
> -
> -#include <stdbool.h>
> -#include <string.h>
> -#include <errno.h>
> -#include <math.h>
> -#include <xmlrpc-c/base.h>
> -#include <xmlrpc-c/client.h>
> -#include <pthread.h>
> -#include <glib.h>
> -#include <pixman.h>
> -#include <cairo.h>
> -
>  #include "igt_chamelium.h"
> -#include "igt_core.h"
> -#include "igt_aux.h"
> -#include "igt_edid.h"
> -#include "igt_frame.h"
> -#include "igt_list.h"
> -#include "igt_kms.h"
> -#include "igt_pipe_crc.h"
> -#include "igt_rc.h"
>  
>  /**
>   * SECTION:igt_chamelium
> @@ -90,47 +69,6 @@
>   * Especially with modern, more complex hardware where we may have LSPcons and
>   * USB controllers in the way.
>   */
> -#define CHAMELIUM_HOTPLUG_DETECTION_DELAY 10
> -
> -struct chamelium_port {
> -	unsigned int type;
> -	int id;
> -	int connector_id;
> -	char *name;
> -	bool adapter_allowed;
> -	char *connector_path;
> -	bool is_mapped;
> -};
> -
> -struct chamelium_frame_dump {
> -	unsigned char *bgr;
> -	size_t size;
> -	int width;
> -	int height;
> -	struct chamelium_port *port;
> -};
> -
> -struct chamelium_fb_crc_async_data {
> -	cairo_surface_t *fb_surface;
> -
> -	pthread_t thread_id;
> -	igt_crc_t *ret;
> -};
> -
> -struct chamelium {
> -	xmlrpc_env env;
> -	xmlrpc_client *client;
> -	char *url;
> -
> -	/* Indicates the last port to have been used for capturing video */
> -	struct chamelium_port *capturing_port;
> -
> -	int drm_fd;
> -
> -	struct igt_list_head edids;
> -	struct chamelium_port ports[CHAMELIUM_MAX_PORTS];
> -	int port_count;
> -};
>  
>  bool igt_chamelium_allow_fsm_handling = true;
>  
> diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
> index 8882e13fb..b2b97434f 100644
> --- a/lib/igt_chamelium.h
> +++ b/lib/igt_chamelium.h
> @@ -28,23 +28,35 @@
>  
>  #include "config.h"
>  
> -#include <stdbool.h>
> +#include <cairo.h>
> +#include <errno.h>
> +#include <glib.h>
> +#include <math.h>
> +#include <pixman.h>
> +#include <pthread.h>
>  #include <stddef.h>
> +#include <stdbool.h>
> +#include <string.h>
>  #include <xf86drmMode.h>
> +#include <xmlrpc-c/base.h>
> +#include <xmlrpc-c/client.h>
>  
> +#include "igt_aux.h"
> +#include "igt_core.h"
>  #include "igt_debugfs.h"
> +#include "igt_edid.h"
> +#include "igt_frame.h"
>  #include "igt_kms.h"
>  #include "igt_list.h"
> +#include "igt_pipe_crc.h"
> +#include "igt_rc.h"
> +
> +#define CHAMELIUM_HOTPLUG_DETECTION_DELAY 10
>  
>  struct igt_fb;
>  struct edid;
>  typedef struct _igt_crc igt_crc_t;
>  
> -struct chamelium;
> -struct chamelium_port;
> -struct chamelium_frame_dump;
> -struct chamelium_fb_crc_async_data;
> -
>  /**
>   * chamelium_check:
>   * @CHAMELIUM_CHECK_ANALOG: Fuzzy checking method for analog interfaces
> @@ -107,6 +119,46 @@ extern bool igt_chamelium_allow_fsm_handling;
>  
>  #define CHAMELIUM_HOTPLUG_TIMEOUT 20 /* seconds */
>  
> +struct chamelium_port {
> +        unsigned int type;
> +        int id;
> +        int connector_id;
> +        char *name;
> +        bool adapter_allowed;
> +        char *connector_path;
> +        bool is_mapped;
> +};
> +
> +struct chamelium_frame_dump {
> +        unsigned char *bgr;
> +        size_t size;
> +        int width;
> +        int height;
> +        struct chamelium_port *port;
> +};
> +
> +struct chamelium_fb_crc_async_data {
> +        cairo_surface_t *fb_surface;
> +
> +        pthread_t thread_id;
> +        igt_crc_t *ret;
> +};
> +
> +struct chamelium {
> +        xmlrpc_env env;
> +        xmlrpc_client *client;
> +        char *url;
> +
> +        /* Indicates the last port to have been used for capturing video */
> +        struct chamelium_port *capturing_port;
> +
> +        int drm_fd;
> +
> +        struct igt_list_head edids;
> +        struct chamelium_port ports[CHAMELIUM_MAX_PORTS];
> +        int port_count;
> +};
> +
>  /**
>   * chamelium_edid:
>   * @chamelium: instance of the chamelium where the EDID will be applied
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 825bfb110..827b72f54 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -22,7 +22,9 @@
>  
>  #define PIPE_CONTROL			0x7a000004
>  #define MEDIA_STATE_FLUSH		0x0
> +#ifndef MAX
>  #define MAX(X, Y)			(((X) > (Y)) ? (X) : (Y))
> +#endif
>  #define SIZE_DATA			64
>  #define SIZE_BATCH			0x10000
>  #define SIZE_BUFFER_INPUT		MAX(sizeof(float) * SIZE_DATA, 0x10000)
> diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
> index bf6510969..88b3717d4 100644
> --- a/tests/chamelium/kms_chamelium_color.c
> +++ b/tests/chamelium/kms_chamelium_color.c
> @@ -758,7 +758,7 @@ igt_main
>  			igt_assert_f(chamelium_reprobe_connector(&data.display,
>  								 data.chamelium,
>  								 data.ports[i]) == DRM_MODE_CONNECTED,
> -								 "Output not connected\n");
> +								 "%s not connected\n", data.chamelium->ports[i].name);
>  		}
>  
>  		kmstest_set_vt_graphics_mode();
> -- 
> 2.25.1
> 
