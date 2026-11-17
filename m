Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD69606A31C
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 09:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ePFm469v
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD73310F5BD;
	Tue, 17 Nov 2026 09:58:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DAC10E592
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 09:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794909465; x=1826445465;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iqWfMWi892kFPASROuw/mn601RwWXReZFcXhb4MhFh4=;
 b=ePFm469vH++FnrjxZUEdB1bbgiMC3LVuhwxHeV0rufHC1Ot8NxcYaIvB
 6xOMu0vKMPpuEmrl9K8TQu7BbenVL5S80Hzo5FE6tVq5eCWXVMp/+4+Sw
 RnhNPiwdhXIIv9uxZ7t1qteJQcc/R0/QdPC6O1PPI0STK0KiRcC4GiLuC
 FDA/hEtc23pQHKMb1708B2mWoclx/z4/0s1z480nUySCzS3ULURvg7gra
 DU5fTRkCjKFTmQhmM6EInGyhbnmdIadTYKYYCEQb0vIqbl3KoRYNf4viI
 xl3NY7hYkQqqSwKfFqdudoI4F6tPWfUt4LseXx4vVfON9wJxK56XKDW5w g==;
X-CSE-ConnectionGUID: So/Ag/RkRY6vUVuwQQv8xg==
X-CSE-MsgGUID: Gz/VFZu0RZCnlaKah+8AnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3687297"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3687297"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 01:57:45 -0800
X-CSE-ConnectionGUID: 9jL4HrAlQIuvOq5E74/ZXA==
X-CSE-MsgGUID: 8+Aqib8FTBSVAZqPAq7N6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9641355"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 01:57:44 -0800
Date: Tue, 17 Nov 2026 10:57:23 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/i915_pm_rpm: Stop setting the
 i915.mmio_debug modparam
Message-ID: <fabrhaviobghdtqurf6jybmgi2blwha3ylm6ilzbv53rbxjgkz@q3fabfq6utvs>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
References: <20261116143448.29338-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261116143448.29338-1-ville.syrjala@linux.intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ville,
On 2026-11-16 at 16:34:48 +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> The i915.mmio_debug modparam is going first change from an
> int to a boolean, and then move to the display mode (once
> that split finally happens). The kernel will reject a -1
> value for a boolean modparam, so the test would start to
> fail when the type changes. Stop setting the modparam on
> the i915 module in the test to avoid that. With the modparam
> removed the test will work on any version of the driver.
> 
> The modparam will anyway default to -1 (as in mmio_debug is
> always enabled) if the kernel was built with DRM_I915_DEBUG_MMIO=y,
> or I915_DEBUG (which selects the former). So explicitly setting
> the modparam in the test would only benefit someone running the
> test on a non-debug build of the driver. I915_DEBUG should
> be enabled in the i915 CI builds.
> 
> If someone really wants to set modparams in the test perhaps igt
> should grow a more generic mechanism for doing that eg. via
> environment variables...

s/..././

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  tests/intel/i915_pm_rpm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
> index b4da27b21b20..ca4f645c18eb 100644
> --- a/tests/intel/i915_pm_rpm.c
> +++ b/tests/intel/i915_pm_rpm.c
> @@ -1432,7 +1432,7 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
>  		igt_i915_driver_unload();
>  
>  		igt_kmsg(KMSG_INFO "Reloading i915 w/o display\n");
> -		igt_assert_eq(igt_i915_driver_load("disable_display=1 mmio_debug=-1"), 0);
> +		igt_assert_eq(igt_i915_driver_load("disable_display=1"), 0);
>  
>  		igt_assert(setup_environment(false));
>  		pci_dev = igt_device_get_pci_device(drm_fd);
> @@ -1443,7 +1443,7 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
>  		igt_i915_driver_unload();
>  
>  		igt_kmsg(KMSG_INFO "Reloading i915 as normal\n");
> -		igt_assert_eq(igt_i915_driver_load("mmio_debug=-1"), 0);
> +		igt_assert_eq(igt_i915_driver_load(""), 0);
>  
>  		igt_assert(setup_environment(true));
>  		pci_dev = igt_device_get_pci_device(drm_fd);
> -- 
> 2.56.0
> 
