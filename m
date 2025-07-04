Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49D7C83F03
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 12:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777FD10EA13;
	Fri,  4 Jul 2025 12:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uh/DujZu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E2C10EA13
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 12:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751631683; x=1783167683;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=e6T3m4JsT/dfJszUCD9XijPz74dVuDGs5NYKaQ0bv9c=;
 b=Uh/DujZuhF2aecF2eWcE9F1o7jzNs2FJO9T4Q6y4sX87DI84grwFU+zN
 Q9JQdKYX4K+Kr8B6v38Sfvq9twGsjoB7LG1JjK/FeJks9s8sFSFW3mSBi
 Dsd05sjNSCskRJTlUbqMsBunUFPMjSPRb++fnSuuxGOeOJ30U070VgoJU
 yd3d5qGXw3N9FAFQfho6myVnBX9V2vnbdaXU6nim6lWaEOZ9DYEfG8PHH
 xVofYbivRtOajvqbOdofBLH3Cwyf1r7qPTbBqOKgVRzh/ufivWzsgJtDd
 MnB+LSW6sjkowJuDTWgvwiIIwJEccNW5ciTECYLXcAsKFz5zopazCsN6j Q==;
X-CSE-ConnectionGUID: NTlBlQeCRbGQCr2SGqmOjA==
X-CSE-MsgGUID: hlAhAqIISkmpIPbGraGygw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76513893"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="76513893"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:21:23 -0700
X-CSE-ConnectionGUID: FMrSc5INTselvojKApa+bw==
X-CSE-MsgGUID: zd6/N8gDTkGtFW9WJsCsHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="160148392"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:21:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: balasubramani.vivekanandan@intel.com, Ravi Kumar Vodapalli
 <ravi.kumar.vodapalli@intel.com>
Subject: Re: [PATCH] lib/pciids: Add one more PCI ID to BMG
In-Reply-To: <20250704113356.100859-1-ravi.kumar.vodapalli@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250704113356.100859-1-ravi.kumar.vodapalli@intel.com>
Date: Fri, 04 Jul 2025 15:21:17 +0300
Message-ID: <24129ab046212a1b989c94fa79b4e3c660dc6118@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 04 Jul 2025, Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com> wrote:
> Align with kernel commit f7814ac1cc23 ("drm/xe/bmg: Add one additional PCI ID")

$ git show f7814ac1cc23
fatal: ambiguous argument 'f7814ac1cc23': unknown revision or path not in the working tree.

So you've sent a patch but it hasn't been merged. Please wait with the
IGT change until it has actually been merged to the kernel.

BR,
Jani.

> It Adds one more pci id to BMG.
>
> Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
> ---
>  lib/pciids.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/lib/pciids.h b/lib/pciids.h
> index 129c3172a..666265b5f 100644
> --- a/lib/pciids.h
> +++ b/lib/pciids.h
> @@ -846,6 +846,7 @@
>  /* BMG */
>  #define INTEL_BMG_IDS(MACRO__, ...) \
>  	MACRO__(0xE202, ## __VA_ARGS__), \
> +	MACRO__(0xE209, ## __VA_ARGS__), \
>  	MACRO__(0xE20B, ## __VA_ARGS__), \
>  	MACRO__(0xE20C, ## __VA_ARGS__), \
>  	MACRO__(0xE20D, ## __VA_ARGS__), \

-- 
Jani Nikula, Intel
