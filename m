Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84E7CD5BAE
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 21:13:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8A110E0C6;
	Wed, 20 May 2026 21:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M1MDrebY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC2B10E0C6
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 21:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779311572; x=1810847572;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=V1PprGfoU3ZXapxGoiJDqNBntk3WnMXc7pmaiafMGlM=;
 b=M1MDrebYiGM9KUhrTpAbn7IpzPPgVWHGLO/mys420BzWwQ+NqG5Rpc03
 /wYw6cLcZnKb4fla+bakIH59MLhdxw+lvF65QV4nPka3lMvZR0y3W73ee
 kq9OJKpcOliNgnL5alYj3WFq/PGqRROnkFhVKZXyQXYRNQF7L/NxzqiBl
 SeOB02bJFKNbWf2DfLR2R6YrMbaTf2zFynfdTAc7FmT/pyrxAf1D6Xsjl
 aXENxHZv2sPUiOIJ0I360+O6njLMtFDN7DXzSAJh2HlMHHAMr5NVPVfZO
 HEa5lvn2uBgTi557R8CjVHLTEw83aBlPYp1F4mHHBvGZRmXW5U3vgGS+C Q==;
X-CSE-ConnectionGUID: RNOIU+s2QEWJeT8dl/e1uQ==
X-CSE-MsgGUID: aL6/opg9TwyJ1O5mGaPNVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80204026"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="80204026"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 14:12:52 -0700
X-CSE-ConnectionGUID: dRSVZfMhRgasRG/SSSy+Uw==
X-CSE-MsgGUID: Edp5q4/nS9S9mljtpbOZ2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="242128158"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.99])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 14:12:51 -0700
Date: Wed, 20 May 2026 23:12:48 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH 2/3] lib/gpgpu_shader: replace open coded ibb data copy
 with helper
Message-ID: <tvxvgvwwjzk6k6wjzm5xrokrcanpepxiayqq2wdvezgnlabgqo@inejub433h6v>
References: <20260520-ibb_fixes-v1-0-d0c8ab2d07d3@intel.com>
 <20260520-ibb_fixes-v1-2-d0c8ab2d07d3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520-ibb_fixes-v1-2-d0c8ab2d07d3@intel.com>
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

On Wed, May 20, 2026 at 11:56:22AM +0200, Andrzej Hajda wrote:
> Helper, beside code compaction and increased readability, adds buffer
> overflow checks, which are missing here.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  lib/gpgpu_shader.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index dbaa9a459454..72b05959e879 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -76,18 +76,7 @@ static uint32_t fill_sip(struct intel_bb *ibb,
>  			 const uint32_t sip[][4],
>  			 const size_t size)
>  {
> -	uint32_t *sip_dst;
> -	uint32_t offset;
> -
> -	intel_bb_ptr_align(ibb, 16);
> -	sip_dst = intel_bb_ptr(ibb);
> -	offset = intel_bb_offset(ibb);
> -
> -	memcpy(sip_dst, sip, size);
> -
> -	intel_bb_ptr_add(ibb, size);
> -
> -	return offset;
> +	return intel_bb_copy_data(ibb, sip, size, 16);

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  }
>  
>  static void emit_sip(struct intel_bb *ibb, const uint64_t offset)
> 
> -- 
> 2.54.0
> 
