Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89126C02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 20:08:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EAF210ED38;
	Fri, 14 Feb 2025 20:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DB1bCcvz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C73F10ED38
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 20:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739563695; x=1771099695;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SQYu4WEtm/0FlEcxDiXeszrG4ZYV6wNQv7K289C1pG0=;
 b=DB1bCcvzis6lmh8bEpD87/MWcXldDi/ewVAQdlDAXQYSy5VuGtBDdBNh
 7d0/juVcO44xOayWFJVcWLGIjbLtXjVquHPJ2cSAe9IsQZvhy3auwt9si
 8fXcd6l8/7+m1q1nAB8OE2S0sHMoWR2b0dvpTXdGjS7LPi7s9Uk2SzAka
 PqmtS1bHdC0xRTSSgLAllViTiU6Py7niVR9LYWljhAdyCPAT6EiSgqQXv
 5lf/2RjoXWpduljv4uDEVlykdNJSq8brb5DIrGvD5uJuWc2+NcCIuoqG4
 wWP8qcfof4J0grmTzFME2ZAKjYuq01+SYWgL+NVVn6Z/DhgurtdhJWjWD Q==;
X-CSE-ConnectionGUID: Y8xo4/zwTnKd8lUBSyWKWw==
X-CSE-MsgGUID: RzPCeSt+QTmFefTBNlMGFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50969369"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="50969369"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 12:08:14 -0800
X-CSE-ConnectionGUID: aBNWfAWwQ9eDa2dbyzhlUw==
X-CSE-MsgGUID: /P8qXgS2TeSMBWc4pz/nrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="118471901"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 12:08:14 -0800
Date: Fri, 14 Feb 2025 21:07:54 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH i-g-t v3 6/7] tests/intel/xe_pxp: Termination tests
Message-ID: <20250214200754.epzvsyei2oas4wei@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 igt-dev@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
References: <20250213003904.2059770-1-daniele.ceraolospurio@intel.com>
 <20250213003904.2059770-7-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250213003904.2059770-7-daniele.ceraolospurio@intel.com>
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

Hi Daniele,
On 2025-02-12 at 16:39:00 -0800, Daniele Ceraolo Spurio wrote:
> There are several events that can cause the PXP key to be invalidated
> and trigger a PXP termination (suspend, PXP termination irq). After a
> termination, we expect the key to be different and the raw encrypted
> data to change for the same source data.
> Additionally, all PXP objects are invalidated during a termination and
> can no longer be used in submission or kept mapped to VMs; we therefore
> need to test both the execution and bind ioctls to make sure they work
> as expected after a termination.
> 
> v2: move igt_require calls inside the subtest
> v3: block rpm for tests trying a different type of termination, rework
> invalid bind test to try a new vm as well (Alan)

I have few nits, one is from our CI fail:

../tests/intel/xe_pxp.c:1065:53: error: ‘O_RDONLY’ undeclared (first use in this function); did you mean ‘STA_RONLY’?
fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
                                                  ^~~~~~~~
						 STA_RONLY
../tests/intel/xe_pxp.c:1065:53: note: each undeclared identifier is reported only once for each function it appears in

Please include a proper lib header in a first patch which uses O_RDONLY.

Rest nits below.

> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  lib/intel_batchbuffer.c |   8 +-
>  lib/intel_batchbuffer.h |   1 +
>  lib/xe/xe_ioctl.c       |  12 +-
>  lib/xe/xe_ioctl.h       |   2 +
>  tests/intel/xe_pxp.c    | 455 +++++++++++++++++++++++++++++++++++++++-
>  5 files changed, 465 insertions(+), 13 deletions(-)
> 
[...]
>  
> +static void termination_tests(int fd, bool pxp_supported, uint32_t devid,
> +			      enum termination_type type, const char *tag)
> +{
> +	int fw_handle;
> +
> +	if (type != PXP_TERMINATION_RPM) {
> +		/* avoid rpm entry for non-rpm tests */
> +		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);

File or dir opens should happen in igt_fixture

> +		igt_require(fw_handle >= 0);

This should be in each subtest which needs this.

> +	} else {
> +		igt_setup_runtime_pm(fd);

This should also be in fixture, consider creating xe_pxp_pm test.

> +	}
> +
> +	igt_subtest_f("pxp-termination-key-update-post-%s", tag) {
> +		require_pxp_render(pxp_supported, devid);
> +		test_pxp_teardown_keychange(fd, type);
> +	}
> +	igt_subtest_f("pxp-stale-bo-bind-post-%s", tag) {
> +		require_pxp(pxp_supported);
> +		test_pxp_stale_bo_bind(fd, type);
> +	}
> +	igt_subtest_f("pxp-stale-bo-exec-post-%s", tag) {
> +		require_pxp(pxp_supported);
> +		test_pxp_stale_bo_exec(fd, type);
> +	}
> +
> +	/* An active PXP queue holds an RPM ref, so we can't test RPM with it */
> +	if (type != PXP_TERMINATION_RPM) {
> +		igt_subtest_f("pxp-stale-queue-post-%s", tag) {
> +			require_pxp(pxp_supported);
> +			test_pxp_stale_queue_execution(fd, type);
> +		}
> +
> +		close(fw_handle);
> +	} else {
> +		igt_restore_runtime_pm();
> +	}

Same here, both close() and ...restore...() should be done in
igt_fixture { ... }

To test if all is ok call your test with --show-testlist
without sudo:

./xe_pxp --show-testlist

Regards,
Kamil

> +}
> +
>  igt_main
>  {
>  	int xe_fd = -1;
> @@ -470,6 +891,28 @@ igt_main
>  		}
>  	}
>  
> +	igt_subtest_group {
> +		const struct mode {
> +			enum termination_type type;
> +			const char *tag;
> +		} modes[] = {
> +			{ PXP_TERMINATION_IRQ, "termination-irq" },
> +			{ PXP_TERMINATION_SUSPEND, "suspend" },
> +			{ PXP_TERMINATION_RPM, "rpm" },
> +			{ 0, NULL }
> +		};
> +
> +		igt_describe("Verify teardown management");
> +
> +		for (const struct mode *m = modes; m->tag; m++)
> +			termination_tests(xe_fd, pxp_supported, devid, m->type, m->tag);
> +
> +		igt_subtest("pxp-optout") {
> +			require_pxp(pxp_supported);
> +			test_pxp_optout(xe_fd);
> +		}
> +	}
> +
>  	igt_fixture {
>  		close(xe_fd);
>  	}
> -- 
> 2.43.0
> 
