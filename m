Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B49ECAC5B0
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 11:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2942610E6EF;
	Wed, 24 Sep 2025 11:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jidszqbl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C5910E6EF
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 11:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758711833; x=1790247833;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DwrOaqSYP7F0w92M07QU41/zIuKFbAbsVk/aJD3XiUQ=;
 b=jidszqblXXpRghHZDCCwHKplexhh3S8oKiOGbCfiN2OZNgGKrNNa4Bnr
 kRAaT6zR+3VOrY6Y4FdkOVG8L7au6W1P9ibUlCZL94K5b2lHa0RYflwAk
 1eiWkepn+XCMK6Eg12bk6teQmB+iaAU2f4VJ1kTtHzGvGcxxQoICVr90u
 U9wIXo+0UV+Jg4oP8eHVUfxS/AIWuQlMW8r2b3NCfiGNz2/8DrfCZk1Z1
 G0ORYAlPSXBpUDqojcq3E9NVXJGu8N+a5yZvPFMETxzgTVkmDUhcfNZ4+
 2ZPWYQcOgV0BJWN6wYd1DImfxf5HOtgLI2tmqzJcKVyx++ue7CgMORsf+ A==;
X-CSE-ConnectionGUID: Ms/5i2wFQSuP7z4XeGCDCA==
X-CSE-MsgGUID: 6ibYv9V3SYGylpBUA6MVoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72362378"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="72362378"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 04:03:53 -0700
X-CSE-ConnectionGUID: +hPgvWsQRrShJOFk+wOQQA==
X-CSE-MsgGUID: 5ZJ1I7C0S92emIwDHRrOPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="181298624"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 04:03:51 -0700
Date: Wed, 24 Sep 2025 13:03:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel/xe_configfs: Check
 ctx_restore_post_bb
Message-ID: <20250924110334.pxdqtw3qvjfmcq7a@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 igt-dev@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250918-configfs-ctx-restore-v2-0-5df035e27e42@intel.com>
 <20250918-configfs-ctx-restore-v2-2-5df035e27e42@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250918-configfs-ctx-restore-v2-2-5df035e27e42@intel.com>
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

Hi Lucas,
On 2025-09-18 at 21:50:21 -0700, Lucas De Marchi wrote:
> Add sanity checks for some bb written to ctx_restore_post_bb and
> ctx_restore_mid_bb. For invalid values, it validates the xe configfs
> implementation correctly rejects them. For valid values, it checks the
> values are written correctly and that later when we driver binds that
> the HW register contains the expected value.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tests/intel/xe_configfs.c | 177 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 177 insertions(+)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 794c76132..7a7a7edf4 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -26,6 +26,31 @@
>  static char bus_addr[NAME_MAX];
>  static struct pci_device *pci_dev;
>  
> +static bool check_registers(const uint32_t reg[], const uint32_t val[],
> +			    size_t max)
> +{
> +	struct intel_mmio_data mmio_data = { };
> +	bool ret = false;
> +
> +	intel_register_access_init(&mmio_data, pci_dev, 0);
> +
> +	for (int i = 0; i < max && reg[i]; i++) {
> +		uint32_t v = intel_register_read(&mmio_data, reg[i]);
> +
> +		if (v != val[i]) {
> +			igt_debug("Expecting [%x]=%x but found %x\n",
> +				  reg[i], val[i], v);
> +			goto out;
> +		}
> +	}
> +
> +	ret = true;
> +
> +out:
> +	intel_register_access_fini(&mmio_data);
> +	return ret;
> +}
> +
>  static void restore(int sig)
>  {
>  	int configfs_fd;
> @@ -124,6 +149,142 @@ static void test_engines_allowed(int configfs_device_fd)
>  	}
>  }
>  
> +/**
> + * SUBTEST: ctx-restore-post-bb-invalid
> + * Description: Validate ctx_restore_post_bb attribute for invalid values
> + *
> + * SUBTEST: ctx-restore-mid-bb-invalid
> + * Description: Validate ctx_restore_mid_bb attribute for invalid values
> + */
> +static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
> +{
> +	static const struct value {
> +		const char *test;
> +		const char *in;
> +	} values[] = {
> +		{ .test = "invalid-engine",
> +		  .in = "foobar cmd 11000001 4F100 DEADBEEF",
> +		},
> +		{ .test = "invalid-type",
> +		  .in = "rcs 11000001 4F100 DEADBEEF",
> +		},
> +		{ .test = "invalid-number",
> +		  .in = "rcs cmd 1100000g 4F100 DEADBEEF",
> +		},
> +		{ .test = "invalid-number",
> +		  .in = "rcs cmd 1100000g 4F100 DEADBEEF",

This is repeated, is it intended?

Regards,
Kamil

[cut]
