Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BE4C79F82
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 08:07:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1EC10E0B0;
	Tue,  8 Sep 2026 08:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Syiv8iqS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5DA10E0B0
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 08:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788854798; x=1820390798;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=trMqxf3c164gfjNTWKMovzmDrWsLcE/Fv5YdSplHrec=;
 b=Syiv8iqS5jOSdnCgv6jCY+Rup0FG76KKXngcJKPL5QAWKK312AYAxhU8
 7RNgdpGeYpHNhJ9jrREhKS/AGUDUojVHTibIb9M2Ynh0RGvMLpICInM5e
 xF3pn/lvAD0dh7Q9tacWI3wRQCBRNSeLBZwCUoA4heYCs1aBMpONMuX0O
 OQcCfb79GuwPlkbM+fc310ppsdiOQdwVvquzqXOvG/RLov8+Pwlq8Oz3r
 slVQawNJmQbuqlwpr2Aso4v1hBRmhADq8jNbSUbv4ruUu9TaIanNCKXst
 smeJ41W6svUhZbA9GQAhxBy66b8t9/JewdZWbqMk6POVqi5EqcyIjbhYb Q==;
X-CSE-ConnectionGUID: PlVtHFRUTP6Evfc5b8of4A==
X-CSE-MsgGUID: 7k6NBqP4TqywM6WCVW5WFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89292533"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89292533"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 01:06:37 -0700
X-CSE-ConnectionGUID: pC+DJxz9Q0Wf5ts4Ijh6uw==
X-CSE-MsgGUID: zZQ9i/HbRDGFB2LdRbg0CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="276185901"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.3])
 ([172.28.182.3])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 01:06:36 -0700
Message-ID: <1157dbba-66a9-4a29-a283-1f1b7898fb5c@linux.intel.com>
Date: Tue, 8 Sep 2026 10:06:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] tests/intel/xe_sriov_ggtt: Install SR-IOV exit handler
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com
References: <20260907125537.617132-1-lukasz.laguna@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260907125537.617132-1-lukasz.laguna@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 9/7/2026 2:55 PM, Lukasz Laguna wrote:
> Install SR-IOV exit handler in the test to disable VFs and restore
> driver autoprobe on exit.
>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   tests/intel/xe_sriov_ggtt.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tests/intel/xe_sriov_ggtt.c b/tests/intel/xe_sriov_ggtt.c
> index 2c2184930..bcd763eb0 100644
> --- a/tests/intel/xe_sriov_ggtt.c
> +++ b/tests/intel/xe_sriov_ggtt.c
> @@ -701,6 +701,7 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
>   		igt_require(igt_sriov_is_pf(pf_fd));
>   		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>   		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
> +		igt_sriov_install_exit_handler(pf_fd, NULL, NULL);
>   	}
>   
>   	igt_describe("Verify that the VF ID in the GGTT PTE has been correctly assigned");
> @@ -752,6 +753,7 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
>   			    igt_sriov_disable_driver_autoprobe(pf_fd);
>   		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
>   			       "Failed to restore sriov_drivers_autoprobe value\n");
> +		igt_sriov_clear_exit_handler();
>   		drm_close_driver(pf_fd);
>   	}
>   }

LGTM,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

