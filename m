Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942CEC982EA
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 11:27:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234DB10E71D;
	Wed, 23 Sep 2026 11:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mTPP/o0+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8ED10E71D
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 11:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790162792; x=1821698792;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SirOIQ8jT+hDHi7WJPfNQFkNetHDBF/35gDCmfJV3N4=;
 b=mTPP/o0+Y+DZ52FI8j56Ic8Wd+0udk8WvgwjdDiT43iK0IHQWUVqusUO
 P0bLjWRjWxzE8ZP3JNCCq1CN0aSqrrigvpdVDzvhXhzqKaLnUu0Ld8Eit
 +ObnGoUX5If/rLsnYQ8CcPC65fv04za/fMPSSsnHQIU4XQKZTw6ZNWrCY
 1ED8eFriNT7v8AqP4aGBipsx3hQ3m1Ltoezaq86uzkvMwuTg5Xs17k0TI
 jSOdyGoFCC9dZ+yyiibc1fXB/IBBpq/SooDlf54lDPpa97bDvj+9Ei1Y/
 rbpfpg3eUBNjHdpFWWsV20YG+Hx0vAaHMhWPI2+7qWkk3ibVZTMZMM5i9 g==;
X-CSE-ConnectionGUID: fU4O895NTqCGdMIcFRoFbQ==
X-CSE-MsgGUID: kNPqqb6lQxCPYPi+8OT3Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90960152"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="90960152"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 04:26:32 -0700
X-CSE-ConnectionGUID: oBMXgfMJRS6KnqpIsySPcw==
X-CSE-MsgGUID: E/ezQBhZQXefDIy04AjXSA==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 04:26:29 -0700
Date: Wed, 23 Sep 2026 13:26:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com,
 thomas.petazzoni@bootlin.com, Jani Nikula <jani.nikula@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t 4/4] tests/kms_content_protection: Add test to
 ensure HDCP is properly detected by the DUT
Message-ID: <20260923112627.esouffhwrgphag6r@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org, markyacoub@google.com,
 thomas.petazzoni@bootlin.com, Jani Nikula <jani.nikula@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20260731-b4-unigraf-hdcp-v1-0-495df88ebbbd@google.com>
 <20260731-b4-unigraf-hdcp-v1-4-495df88ebbbd@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260731-b4-unigraf-hdcp-v1-4-495df88ebbbd@google.com>
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
On 2026-07-31 at 20:21:57 +0200, Louis Chauvet wrote:
> Add a tests that ensure that the DUT properly detect an HDCP 2.2 sink.

Please add here that this needs an external HW for really work.

> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  tests/kms_content_protection.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 680204981f58..30311f93a959 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -35,6 +35,7 @@
>  #include <sys/epoll.h>
>  #include <sys/stat.h>
>  #include <libudev.h>
> +#include <xf86drmMode.h>

Add a newline here before igt.h

>  #include "igt.h"
>  #include "igt_edid.h"
>  #include "igt_sysfs.h"
> @@ -89,7 +90,7 @@
>   * @legacy-hdcp14:  Test HDCP1.4 content protection with legacy style commit.
>   * @atomic-hdcp14:  Test HDCP1.4 content protection with atomic modesetting.
>   * @atomic-dpms-hdcp14: Test HDCP1.4 content protection with atomic modesetting and DPMS.
> - *
> + * @detection:      content type 1 that can be handled only through HDCP2.2.

This change do not compile, see build log on patchwork.
For a solution see below.

>   */
>  
>  /**
> @@ -1271,6 +1272,25 @@ int igt_main()
>  		}
>  	}
>  
> +#if HAVE_UNIGRAF
> +	igt_describe("Check if the HDCP connection is properly detected by the driver");

Please add also to description a need for external HW for this to work.
 
> +	igt_subtest("detection") {

Should this be more specific? hdcp-detection or ext-hdcp-detection
seems better name ('ext' marks a need for external HW for this to
really work).

> +		drmModeConnectorPtr connector;
> +		igt_output_t *output;
> +
> +		unigraf_require_device(data.drm_fd);
> +		connector = unigraf_get_connector(data.drm_fd);
> +		output = igt_output_from_connector(&data.display, connector);
> +		igt_assert(output);
> +
> +		unigraf_disable_hdcp();
> +		igt_assert(!sink_hdcp2_capable(output));
> +		unigraf_enable_hdcp();
> +		sleep(igt_default_display_detect_timeout());
> +		igt_assert(sink_hdcp2_capable(output));
> +	}
> +#endif

This should be other way around:

	igt_describe("Check if the HDCP connection is properly detected by the driver");
	igt_subtest("detection") {
#if !HAVE_UNIGRAF
	igt_skip("Needs external HW for testing ...\n");
#else
	/* your code here */
		drmModeConnectorPtr connector;
#endif

Btw this needs an external hardware for testing so maybe it should be
a new tool, not a test?

+cc few other developers

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>



Regards,
Kamil

>  	igt_fixture() {
>  		test_content_protection_cleanup();
>  		igt_display_fini(&data.display);
> 
> -- 
> 2.54.0
> 
