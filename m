Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1E3606A338
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 13:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X/ta0IhW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCC610E81F;
	Thu, 29 Oct 2026 13:46:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6959112301
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 13:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793281555; x=1824817555;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ctge7cadGBhAjPKgjhrs/bLQ45dY6tg0qaJNTO278EA=;
 b=X/ta0IhWHyRz25jIfRhJQkq/UYg03ojEqEMQ47dacV4SH1a/o+tTDYjp
 GVtix5gxMXNSt6cGzkVrLhZ6AbvByUgXOcJwmR6SWvr7R0bnIEjECNx+A
 2E8WwaqVsJ9jGQtLfnVMZIm6/bMvbKknL1YJE4dNAeavD8Bms63VHu5K4
 APs6dPgiBPgWwGP2QWUFS9IHKICxK5/aVwfjEWIA8fp8e311QvUYUifu1
 CdPunEZOq7F63/cZ2W1yWM/2KYbP0W4CiE8T08BFMkoqxPD52YlhySqNO
 DUGCz2ICV2lvR/XyqIOIYZKxu/lmzLoEgj9qIREyE/Trzgb3uwd/wRRQH g==;
X-CSE-ConnectionGUID: B6AI2HD4QLuc7x41W0Ds8g==
X-CSE-MsgGUID: QQ5nOPG8S/mQFC7xltQO5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1916522"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1916522"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 06:45:55 -0700
X-CSE-ConnectionGUID: ianMv2OMS/GnMEi4cIgmfw==
X-CSE-MsgGUID: 8i1KJFfDTzKZRr4IjWVKAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5275861"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 06:45:53 -0700
Date: Thu, 29 Oct 2026 14:45:29 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Cc: igt-dev@lists.freedesktop.org, soham.purkait@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com, sk.anirban@intel.com
Subject: Re: [PATCH v3 2/2] tests/intel/xe_err_injection: regex to ignore AER
 messages in dmesg
Message-ID: <20261029134529.footw3g75jthg7ot@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 igt-dev@lists.freedesktop.org, soham.purkait@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com,
 sk.anirban@intel.com
References: <20261029115320.1235169-1-ravi.kishore.koppuravuri@intel.com>
 <20261029115320.1235169-3-ravi.kishore.koppuravuri@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029115320.1235169-3-ravi.kishore.koppuravuri@intel.com>
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

Hi Ravi,
On 2026-10-29 at 17:23:20 +0530, Ravi Kishore Koppuravuri wrote:
> Error injection tests deliberately triggers AER error, device recovery
> messages and CORE_COMPUTE hardware error (SIGID=203) in dmesg. Add a
> regex to ignore these messages and inform igt_runner that it should not
> treat these expected error logs as failures.
> 
> Sample dmesg log is provided below
> pcieport 0000:00:06.0: AER: Uncorrectable (Non-Fatal) error message received from 0000:02:00.0
> pcieport 0000:02:00.0: PCIe Bus Error: severity=Uncorrectable (Non-Fatal), type=Transaction Layer, (Receiver ID)
> pcieport 0000:02:00.0:   device [8086:676b] error status/mask=00400000/00000000
> pcieport 0000:02:00.0:    [22] UncorrIntErr           (First)
> xe 0000:04:00.0: Xe Pci error recovery: error detected state 1
> mei_csc 0000:05:00.0: error recovery: error detected. state 1
> xe 0000:04:00.0: Xe Pci error recovery: MMIO enabled
> pcieport 0000:00:06.0: AER: Root Port link has been reset (0)
> xe 0000:04:00.0: Xe Pci error recovery: Slot reset
> xe 0000:04:00.0: Xe Pci error recovery: Recovered
> mei_csc 0000:05:00.0: error recovery: resume
> pcieport 0000:00:06.0: AER: device recovery successful
> 
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
> v3: Removed redundant strings and arranged the regex in alphabetical order (Kamil)
> v2: simplified the regex and removed duplicate strings (Kamil)
> ---
>  tests/intel/xe_err_injection.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> index 46d9f7f42..df5f73b8c 100644
> --- a/tests/intel/xe_err_injection.c
> +++ b/tests/intel/xe_err_injection.c
> @@ -260,6 +260,18 @@ static void print_aer_recovery_status(void)
>  		igt_info("AER device recovery successful\n");
>  }
>  
> +/* Dmesg regex to inform igt_runner not to treat the expected AER error messages as failures */
> +static void ignore_aer_in_dmesg(void)
> +{
> +	char *aer_msg = "AER: device recovery successful"
> +			"|AER: Root Port link has been reset"
> +			"|AER: Uncorrectable .Non-Fatal. error"
> +			"|error recovery"
> +			"|PCIe Bus Error: severity=Uncorrectable .Non-Fatal"
> +			"|SIGID=203";
> +	igt_emit_ignore_dmesg_regex(aer_msg);
> +}
> +
>  static bool gt_uc_wkr_parity_recovered;
>  
>  /**
> @@ -290,6 +302,8 @@ static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
>  		igt_assert_f(false, "Failed to read error counter before injection\n");
>  	}
>  
> +	ignore_aer_in_dmesg();
> +
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  	acquire_steering_semaphore(mmio);
>  	/* Arm the injection sequence. */
>  	xe_mmio_write32(mmio, XE_MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
> -- 
> 2.34.1
> 
