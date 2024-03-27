Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E678CD11DD
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 14:35:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4D810FCEB;
	Wed, 27 Mar 2024 14:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UlDTUurH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A666710F2ED
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 14:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711550106; x=1743086106;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=upV5q94aOdUXEKaBgnpn57nTrQr5FiJSdNsP04Y/JuU=;
 b=UlDTUurHr1bO7Kh7qJf4pZF9sg5hDx53YgPDFQ8U06naSwm+ieAYNR8l
 pQcvsKYt933V74gqpobcPJb3mpKxSF210nQi63I9NoMx6Je6Hsd46IF5Y
 Vz8fKUfSRm6O2FQyw/MWXLs5vFReH1ndNoJ4XpHLOnXK8QAHNrri0SLfa
 0hRJ4sDxXJiHBB3wa6uYIe0at2uJ1xlPWrLay8J4p30oSBtJ+cByxODjs
 +Jo5QHMmk1/AQwRyPZF+pZewSMAiOoiEPdAlFL3lecyjwPQIVREZ7vkw2
 W3lO86qBzjj4BVt9cy5HpE2hIaZ4OHSPcLrLrw178H4IyI37pQNmTrtyK w==;
X-CSE-ConnectionGUID: ouPIr/aMRSeyGH9g7b0v9A==
X-CSE-MsgGUID: hNtqA5JHQa2bqIyHb673cg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="24145429"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="24145429"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 07:35:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="20964386"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 07:35:04 -0700
Date: Wed, 27 Mar 2024 15:35:00 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>,
 matthew.d.roper@intel.com, balasubramani.vivekanandan@intel.com,
 lucas.demarchi@intel.com, clinton.a.taylor@intel.com,
 haridhar.kalvala@intel.com, radhakrishna.sripada@intel.com,
 matthew.s.atwood@intel.com, dnyaneshwar.bhadane@intel.com,
 shekhar.chauhan@intel.com
Subject: Re: [PATCH] lib/pci: Add new and missing PCI IDs to DG2 platform
Message-ID: <20240327143500.qbmnm77wkeg256ef@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>,
 matthew.d.roper@intel.com, balasubramani.vivekanandan@intel.com,
 lucas.demarchi@intel.com, clinton.a.taylor@intel.com,
 haridhar.kalvala@intel.com, radhakrishna.sripada@intel.com,
 matthew.s.atwood@intel.com, dnyaneshwar.bhadane@intel.com,
 shekhar.chauhan@intel.com
References: <20240326134843.3841519-1-ravi.kumar.vodapalli@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240326134843.3841519-1-ravi.kumar.vodapalli@intel.com>
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
On 2024-03-26 at 19:18:43 +0530, Ravi Kumar Vodapalli wrote:
> New PCI ID is added in Bspec and some are missing in IGT, add them
------------------------ ^^^^^
Instead of this you should write about Linux kernel commit,
with a link to lore.kernel.org

> to driver
> 
> Bspec: 44477
- ^^^^^^^^^^^^
Please do not write this nor JIRA here. See also reply from Matt.

Regards,
Kamil

> Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
> ---
>  lib/i915_pciids.h |  4 +++-
>  lib/xe_pciids.h   | 10 ++++++++--
>  2 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index fcf1849aa..16221ce77 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -709,7 +709,9 @@
>  	INTEL_VGA_DEVICE(0x5692, info), \
>  	INTEL_VGA_DEVICE(0x56A0, info), \
>  	INTEL_VGA_DEVICE(0x56A1, info), \
> -	INTEL_VGA_DEVICE(0x56A2, info)
> +	INTEL_VGA_DEVICE(0x56A2, info), \
> +	INTEL_VGA_DEVICE(0x56BE, info), \
> +	INTEL_VGA_DEVICE(0x56BF, info)
>  
>  #define INTEL_DG2_G11_IDS(info) \
>  	INTEL_VGA_DEVICE(0x5693, info), \
> diff --git a/lib/xe_pciids.h b/lib/xe_pciids.h
> index 29f07a00a..77aa412d2 100644
> --- a/lib/xe_pciids.h
> +++ b/lib/xe_pciids.h
> @@ -128,7 +128,9 @@
>  	MACRO__(0x5692, ## __VA_ARGS__),	\
>  	MACRO__(0x56A0, ## __VA_ARGS__),	\
>  	MACRO__(0x56A1, ## __VA_ARGS__),	\
> -	MACRO__(0x56A2, ## __VA_ARGS__)
> +	MACRO__(0x56A2, ## __VA_ARGS__),	\
> +	MACRO__(0x56BE, ## __VA_ARGS__),	\
> +	MACRO__(0x56BF, ## __VA_ARGS__)
>  
>  #define XE_DG2_G11_IDS(MACRO__, ...)		\
>  	MACRO__(0x5693, ## __VA_ARGS__),	\
> @@ -138,7 +140,11 @@
>  	MACRO__(0x56A5, ## __VA_ARGS__),	\
>  	MACRO__(0x56A6, ## __VA_ARGS__),	\
>  	MACRO__(0x56B0, ## __VA_ARGS__),	\
> -	MACRO__(0x56B1, ## __VA_ARGS__)
> +	MACRO__(0x56B1, ## __VA_ARGS__),	\
> +	MACRO__(0x56BA, ## __VA_ARGS__),	\
> +	MACRO__(0x56BB, ## __VA_ARGS__),	\
> +	MACRO__(0x56BC, ## __VA_ARGS__),	\
> +	MACRO__(0x56BD, ## __VA_ARGS__)
>  
>  #define XE_DG2_G12_IDS(MACRO__, ...)		\
>  	MACRO__(0x5696, ## __VA_ARGS__),	\
> -- 
> 2.25.1
> 
