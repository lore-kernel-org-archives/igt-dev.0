Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F459606A31B
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 14:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VWcMxcc6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0A910E31B;
	Mon, 26 Oct 2026 14:40:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527A010E21A
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 14:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793025572; x=1824561572;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RTxlQEsbuBnLAOUMHAC/XyJLGrH/tq5WeaQcWyaOhAE=;
 b=VWcMxcc6tdPrJqJv4seAjoM9ZqOQX3B46PHY3BtELhlpCUZSKRYwb4Mx
 iZXp1GUEj+EPBFuKnMF7e/wD2DxBk3IHe1XNCE+N83Vsnbb3ELGTtHfAx
 ITsWd1aP0031R8flT7qmccoItZ6PwBjrw0MrMmryJG5M5K0YECJdJXtOj
 qOyyA1inCGyd63Zq2lthN3aq+SSzcevCExTRGqamVmc0Y9Zd8tdFoWI5I
 L36RbAMRZjC52p5g1qgbHcCjHUI5fzZlMTKvtB5XXGUdcw1el66LaMY6E
 ewm1XBeb6DJuLSwKfONmTho6fM9EVJqQgVQS+VhF1PsFggIcahvVRAiMr g==;
X-CSE-ConnectionGUID: ExaMLJ5ORGyNc+Awi7Vz4w==
X-CSE-MsgGUID: ziqsdg+3RZ63Mab9jZWzwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1705308"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1705308"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 07:39:32 -0700
X-CSE-ConnectionGUID: GyiFKPCBRSSzy0rVEAiuIQ==
X-CSE-MsgGUID: 59fHCiOZRsKE0ghiWTiEPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4225513"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 07:39:30 -0700
Date: Mon, 26 Oct 2026 15:39:14 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Cc: igt-dev@lists.freedesktop.org, Soham Purkait <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Sk Anirban <sk.anirban@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v2 2/2] tests/intel/xe_err_injection: regex to ignore AER
 messages in dmesg
Message-ID: <20261026143914.rwdzdq3mp2dmona5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 igt-dev@lists.freedesktop.org,
 Soham Purkait <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Sk Anirban <sk.anirban@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Raag Jadav <raag.jadav@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
References: <20261023171326.982997-1-ravi.kishore.koppuravuri@intel.com>
 <20261023171326.982997-3-ravi.kishore.koppuravuri@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023171326.982997-3-ravi.kishore.koppuravuri@intel.com>
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ravi,
On 2026-10-23 at 22:43:26 +0530, Ravi Kishore Koppuravuri wrote:
> Error injection tests deliberately triggers AER error, device recovery
> messages and CORE_COMPUTE hardware error (SIGID=203) in dmesg. Add a
> regex to ignore these messages and inform igt_runner that it should not
> treat these expected error logs as failures.
> 
> Sample AER log is provided below
> 
> ```

Remove this line.

> pcieport 0000:00:06.0: AER: Uncorrectable (Non-Fatal) error message received from 0000:02:00.0
> pcieport 0000:02:00.0: PCIe Bus Error: severity=Uncorrectable (Non-Fatal), type=Transaction Layer, (Receiver ID)
> pcieport 0000:02:00.0:   device [8086:676b] error status/mask=00400000/00000000
> pcieport 0000:02:00.0:    [22] UncorrIntErr (First)
> xe 0000:04:00.0: Xe Pci error recovery: error detected state 1
> mei_csc 0000:05:00.0: error recovery: error detected. state 1
> xe 0000:04:00.0: Xe Pci error recovery: MMIO enabled
> pcieport 0000:00:06.0: AER: Root Port link has been reset (0)
> xe 0000:04:00.0: Xe Pci error recovery: Slot reset
> xe 0000:04:00.0: Xe Pci error recovery: Recovered
> mei_csc 0000:05:00.0: error recovery: resume
> pcieport 0000:00:06.0: AER: device recovery successful
> ```

Same here, remove line with "```", it is not a doc.

> 
> Cc: Soham Purkait <soham.purkait@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Sk Anirban <sk.anirban@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
> v2: simplified the regex and removed duplicate strings (Kamil)
> ---
>  tests/intel/xe_err_injection.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> index 46d9f7f42..62d4258e1 100644
> --- a/tests/intel/xe_err_injection.c
> +++ b/tests/intel/xe_err_injection.c
> @@ -260,6 +260,19 @@ static void print_aer_recovery_status(void)
>  		igt_info("AER device recovery successful\n");
>  }
>  
> +/* Dmesg regex to inform igt_runner not to treat the expected AER error messages as failures */
> +static void ignore_aer_in_dmesg(void)
> +{
> +	char *aer_msg = "AER: Uncorrectable .Non-Fatal. error message received from"
> +			"|PCIe Bus Error: severity=Uncorrectable .Non-Fatal."

Remove final dot, it is meaningless there.

> +			"|Xe Pci error recovery"

imho remove this, as this is catched by below.

> +			"|error recovery"

imho better:
			"|error recovery:"

> +			"|AER: Root Port link has been reset"
> +			"|AER: device recovery successful"

Move these two lines after first line starting with "AER", also sort
all regexes alphabetically.

Regards,
Kamil

> +			"|SIGID=203";
> +	igt_emit_ignore_dmesg_regex(aer_msg);
> +}
> +
>  static bool gt_uc_wkr_parity_recovered;
>  
>  /**
> @@ -290,6 +303,8 @@ static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
>  		igt_assert_f(false, "Failed to read error counter before injection\n");
>  	}
>  
> +	ignore_aer_in_dmesg();
> +
>  	acquire_steering_semaphore(mmio);
>  	/* Arm the injection sequence. */
>  	xe_mmio_write32(mmio, XE_MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
> -- 
> 2.34.1
> 
