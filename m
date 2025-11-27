Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311E9D116E2
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 14:35:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC03E10E76A;
	Thu, 27 Nov 2025 14:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BHNxpq6m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1987710E76A
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 14:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764254142; x=1795790142;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yULIUefO+NUjuPsAdnvrpGKrbUPj8tYuNmlursA4LU8=;
 b=BHNxpq6moyZ8wnysmUTba4VEQ4zi3Qxgf8x92eIUmM6t6I2am6zInRzK
 E9J32cQbG8kU+mzQQtnHfpsiNHAeEY5zAAppKSj6GrObo873OhdC+Wj/X
 plgcSFnNViFs/FCxCpo2v/W/q4tjQK387tx6075j4EAUTnVhGPo5f+me7
 xI1irjGDA2Hiuvt36oLduaIRQwSKxfJ4NeRmvaeL18A2HdpSWyM6SB+PQ
 hiJyo+6n9bl+fRd3AofTyeF+fuk0J03fiRwtvidF250D/JYLFaymsDwJh
 rpNgl5/ikm0v6XTvESLdScPXVq8o1d6FyMymBH20+YXoAzKeJR7VPdVFZ w==;
X-CSE-ConnectionGUID: duVsNRR1SXuq9SMSPssvYw==
X-CSE-MsgGUID: Pn1eyg0wSZKFk6rmE1giTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66376766"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="66376766"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 06:35:42 -0800
X-CSE-ConnectionGUID: rTvtf715QcGxjZC/CJsvpA==
X-CSE-MsgGUID: FHQczILOSwugMn24wqCh2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="197561495"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 06:35:40 -0800
Date: Thu, 27 Nov 2025 15:35:38 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com
Subject: Re: [PATCH i-g-t v1] tools/registers: Add Alderlake-P register
 definitions
Message-ID: <20251127143538.d5fqsifubvxzgwi6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, karthik.b.s@intel.com
References: <20251125051458.2049269-1-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251125051458.2049269-1-ramanaidu.naladala@intel.com>
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

Hi Naladala,
On 2025-11-25 at 10:44:58 +0530, Naladala Ramanaidu wrote:
> Add register definitions for Alderlake-P (ADLP) to support IGT
> register dump and debug tools. Includes base registers, pipe
> interrupt registers, and platform manifest for ADLP.
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tools/registers/adlp_base.txt  | 2118 ++++++++++++++++++++++++++++++++
>  tools/registers/adlp_delta.txt |  231 ++++
>  tools/registers/alderlake_p    |    2 +
>  3 files changed, 2351 insertions(+)
>  create mode 100644 tools/registers/adlp_base.txt
>  create mode 100644 tools/registers/adlp_delta.txt
>  create mode 100644 tools/registers/alderlake_p

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil 

> 
> diff --git a/tools/registers/adlp_base.txt b/tools/registers/adlp_base.txt
> new file mode 100644
> index 000000000..6f4fd405c
> --- /dev/null
> +++ b/tools/registers/adlp_base.txt
> @@ -0,0 +1,2118 @@
> +('VGA_CONTROL', '0x41000', '')
> +('VGA_DEBUG', '0x41004', '')
> +('FUSE_STATUS', '0x42000', '')
> +('RM_TIMEOUT', '0x42060', '')
[cut]
