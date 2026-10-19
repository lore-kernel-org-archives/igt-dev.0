Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E25CCF2E3
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 12:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E8010E112;
	Mon, 19 Oct 2026 12:59:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97C910E112
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2026 12:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792414708; x=1823950708;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sxrUjFUxfdWa0rQTwCNY8AvGPjAL+0oRmsO4hqApENM=;
 b=iWp1Z1stnbj3i4l56miAF5Kkh0jH/2C7mjWlV+4LmwAaBboS48gUsgpA
 i8mkDYhi51J1f6att0ZwWllQOFlD8JBEoblOkR0xtxbUrDWJHb08SUs5Z
 1vs1NQSSRf0rp/+o3hgE5LpuRz0rlPRp9yRkQPYksU4cZaV8zpFsIr9uz
 rcTSV2Jj5hsQCZsXNJeG97U7dZYVNRZUEuXh2fdWW15Tz8v5bvsCcQhWe
 nqJ7/MVcG2D8VUup311SIsv/9iMss8ntdEdJXQYrz+pg12/4n7mm1ZLWS
 ARULPF6sb11Do2PyIFHvJv9NvcXRZK/vrrpFhpwdBpxgtxVmUiDYFP+ys g==;
X-CSE-ConnectionGUID: Y9er6ceuQ3CygsHa5tYwow==
X-CSE-MsgGUID: YjIjDvugTrKeXyEvoaylsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1105205"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1105205"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 05:58:27 -0700
X-CSE-ConnectionGUID: nvN0HL2+Q9mgzqCepq72Tw==
X-CSE-MsgGUID: KQHsjAglQUiJUWOMQzHiXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2914283"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 05:58:25 -0700
Date: Mon, 19 Oct 2026 14:58:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Cc: igt-dev@lists.freedesktop.org, Soham Purkait <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Sk Anirban <sk.anirban@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: Re: [i-g-t v1 1/1] tests/intel/xe_err_injection: regex to ignore AER
 messages in dmesg
Message-ID: <20261019125806.k2quxzqgklb4dvuo@kamilkon-DESK.igk.intel.com>
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
References: <20261016115320.920094-1-ravi.kishore.koppuravuri@intel.com>
 <20261016115320.920094-2-ravi.kishore.koppuravuri@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016115320.920094-2-ravi.kishore.koppuravuri@intel.com>
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

Hi Ravi,
On 2026-10-16 at 17:23:20 +0530, Ravi Kishore Koppuravuri wrote:
> Error injection tests deliberately triggers AER error, device recovery
> messages and CORE_COMPUTE hardware error (SIGID=203) in dmesg. Add a
> regex to ignore these messages and inform igt_runner that it should not
> treat these expected error logs as failures
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

Could you write down here what type of messages do you want to ignore?
So reading and verifing regex below would be easier.

>  tests/intel/xe_err_injection.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 

This do not apply, rebase on current top.

> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> index 46d9f7f42..c7e73d105 100644
> --- a/tests/intel/xe_err_injection.c
> +++ b/tests/intel/xe_err_injection.c
> @@ -260,6 +260,36 @@ static void print_aer_recovery_status(void)
>  		igt_info("AER device recovery successful\n");
>  }
>  
> +/* Dmesg regex to inform igt_runner not to treat the expected AER error messages as failures */
> +static void ignore_aer_in_dmesg(void)
> +{

Can you declare it here like:

	static char *s = "your strings here";

so it will fit in 120 column line? Then just call

	igt_emit_ignore_dmesg_regex(s);

> +	igt_emit_ignore_dmesg_regex("pcieport [0-9A-Fa-f:.]*: AER: Uncorrectable "
> +				    "\\(Non-Fatal\\) error message received from "
> +				    "[0-9A-Fa-f:.]*"

Please do not split one regexes, so they will be like:
				"regex1"
				"|regex2"
and so on.

Also please do not use '(' ')' brackets, use dot instead.

> +				    "|pcieport [0-9A-Fa-f:.]*: PCIe Bus Error: "
> +				    "severity=Uncorrectable \\(Non-Fatal\\)

Or shorter:
		    "|pcieport [0-9A-Fa-f:.]*: PCIe Bus Error: severity=Uncorrectable"

> +				    "|pcieport [0-9A-Fa-f:.]*:\\s+device "
> +				    "\\[[0-9A-Fa-f]+:[0-9A-Fa-f]+\\] error "
> +				    "status/mask=[0-9A-Fa-f]+/[0-9A-Fa-f]+"

Please make it simpler.

> +				    "|pcieport [0-9A-Fa-f:.]*:\\s+\\[[0-9A-Fa-f]+\\] "
> +				    "UncorrIntErr"

Please make it simpler, use dot for matching '[' and ']'.

> +				    "|xe [0-9A-Fa-f:.]*: Xe Pci error recovery: error "
> +				    "detected state [0-9]+"

Do you need to start with "xe digits:"? Also, drop digits from end.
Imho better:
	    "|Xe Pci error recovery:"

This could then match some of other lines.

> +				    "|mei_csc [0-9A-Fa-f:.]*: error recovery: error "
> +				    "detected. state [0-9]+"
> +				    "|xe [0-9A-Fa-f:.]*: Xe Pci error recovery: MMIO "
> +				    "enabled"
> +				    "|pcieport [0-9A-Fa-f:.]*: AER: Root Port link has "
> +				    "been reset \\([0-9]+\\)"

Drop digits from end.



Regards,
Kamil

> +				    "|xe [0-9A-Fa-f:.]*: Xe Pci error recovery: Slot "
> +				    "reset"
> +				    "|xe [0-9A-Fa-f:.]*: Xe Pci error recovery: Recovered"
> +				    "|mei_csc [0-9A-Fa-f:.]*: error recovery: resume"
> +				    "|pcieport [0-9A-Fa-f:.]*: AER: device recovery "
> +				    "successful"
> +				    "|SIGID=203");
> +}
> +
>  static bool gt_uc_wkr_parity_recovered;
>  
>  /**
> @@ -290,6 +320,8 @@ static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
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
