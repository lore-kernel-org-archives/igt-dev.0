Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055BFCCFA03
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 11:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22E910E722;
	Thu,  6 Nov 2025 11:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z2fzGQF8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E610310E722
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 11:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762428868; x=1793964868;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WcA3VBdvT/VreNQ4/9RFKUrFgVxTY7HrRoAL474StJ8=;
 b=Z2fzGQF8N6LM8PgAtWVFnosimkLZRc7ovprOELu5qaxqkm9ECZj2ywUd
 Dr/jCZZMIqvKcaV4bfabHQj4IydnoK1qM7vOU74M8vaJTPFJoKKqbd5AM
 c0LfCR1MXukpHD/DLsr+b4NqR5Udu5u6C0+FWXyUUKCCoI1E18cyJoKiJ
 32gL9UO5DVXAzm73x9ubo68BpqWCK59h7feZRxxpd+RDkOqtWV0N+r8m6
 SrZlZrsiGFIpvGjsnLHQJJqeHfT86LqmT0IpP7OtuJiXTDt1Q3AT6M44d
 qUSvq/q5S4w+YHmDVRZdY57jlvc9LHxF1KUzRQtIOdV6sxLoB714gzs49 g==;
X-CSE-ConnectionGUID: BQgHahdjRmiahK3DB1sZPQ==
X-CSE-MsgGUID: LjjJe1CVTS+5gdvGqcqkuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64597562"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="64597562"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 03:34:28 -0800
X-CSE-ConnectionGUID: h0fcJHstT3Ob9XiL4yFquw==
X-CSE-MsgGUID: pc5jNcgNRI2nA8Rc4tqctA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="191830694"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 03:34:26 -0800
Date: Thu, 6 Nov 2025 12:34:24 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Cc: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 balasubramani.vivekanandan@intel.com
Subject: Re: [PATCH i-g-t v1 2/3] lib: Add Crescent Island Support
Message-ID: <20251106113424.7nvgiojdqntwmpvb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 balasubramani.vivekanandan@intel.com
References: <20251106053425.1731151-1-shekhar.chauhan@intel.com>
 <20251106053425.1731151-3-shekhar.chauhan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251106053425.1731151-3-shekhar.chauhan@intel.com>
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

Hi Shekhar,
On 2025-11-06 at 11:04:24 +0530, Shekhar Chauhan wrote:
> From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> Add device info for Crescent Island (CRI).
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> ---
>  lib/intel_chipset.h     |  2 ++
>  lib/intel_device_info.c | 10 ++++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 93275eac9..b857afc7f 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -94,6 +94,7 @@ struct intel_device_info {
>  	bool is_battlemage : 1;
>  	bool is_pantherlake : 1;
>  	bool is_novalake: 1;
> +	bool is_crescentisland: 1;
>  
>  	const struct intel_cmds_info *cmds_info;
>  	const char *codename;
> @@ -212,6 +213,7 @@ void intel_check_pch(void);
>  #define IS_BATTLEMAGE(devid)	(intel_get_device_info(devid)->is_battlemage)
>  #define IS_PANTHERLAKE(devid)  (intel_get_device_info(devid)->is_pantherlake)
>  #define IS_NOVALAKE(devid)  (intel_get_device_info(devid)->is_novalake)
> +#define IS_CRESCENTISLAND(devid)  (intel_get_device_info(devid)->is_crescentisland)

Here also make it one space (pinstead of two).

With this
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  
>  #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
>  
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index fe452d50f..bb36c6968 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -549,6 +549,14 @@ static const struct intel_device_info intel_novalake_info = {
>  	.cmds_info = &xe2_cmds_info,
>  };
>  
> +static const struct intel_device_info intel_crescentisland_info = {
> +	.graphics_ver = 35,
> +	.graphics_rel = 11,
> +	.display_ver = 0,
> +	.codename = "crescentisland",
> +	.cmds_info = &xe2_cmds_info,
> +};
> +
>  #define INTEL_PCI_ID_INIT(_id, _info) { \
>  	.vendor_id = 0x8086, .device_id = (_id), \
>  	.subvendor_id = PCI_MATCH_ANY, .subdevice_id = PCI_MATCH_ANY, \
> @@ -669,6 +677,8 @@ static const struct pci_id_match intel_device_match[] = {
>  
>  	INTEL_NVLS_IDS(INTEL_PCI_ID_INIT, &intel_novalake_info),
>  
> +	INTEL_CRI_IDS(INTEL_PCI_ID_INIT, &intel_crescentisland_info),
> +
>  	INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info),
>  };
>  
> -- 
> 2.51.1
> 
