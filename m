Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC09DCCA476
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 09:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4830F10EB98;
	Fri, 10 Oct 2025 09:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="apJ7zt6T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F74610EB98
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 09:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760088277; x=1791624277;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0o2VHIOmmcLcuDEUprvBzhLRdCDEHyHqLvhXH52XyAs=;
 b=apJ7zt6TV9Ag7EP9yXlBqvyNxPFAiTaMcy8sCzu2Vcld8ZdaBG4Fjdw6
 gQ/amhqNnGawH6haR03yJm3kQe9s6fP4+dJAxkJUEnqkE9m0APpvn2Z+U
 kL3d8QnAXT6H3BR0jLOd08CLKKimPN8Xw+/b0ymOev6J2kmCnrmnrbZFE
 R0qZ1ev/NaypX3l/iJeVJ582WHfab9t7D70e8jdvd0obidx7WaD5yK9xJ
 tbYqbAAIrvn7pBJEb0/d/Oi7BlERNEGKmZRETZ7kxNrVVRRMfrt1d2sci
 pxL8sDe+MGKSfE+t13lA6U2Gy5jq0qQkX2SDlBhFPHbN0loq6zv4I+iJw Q==;
X-CSE-ConnectionGUID: EIzJNpphS3qH5pcR0L3L2g==
X-CSE-MsgGUID: U8VCse48S9WajJs+U7Yp+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62406094"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="62406094"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 02:24:36 -0700
X-CSE-ConnectionGUID: dbWRyZ+XTuuaJ8ztbpHpKg==
X-CSE-MsgGUID: 1bANEVbERfKGOGwW7BZsXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="204637964"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.136])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 02:24:35 -0700
Date: Fri, 10 Oct 2025 11:24:33 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com, 
 priyanka.dandamudi@intel.com
Subject: Re: [PATCH i-g-t v9 3/3] lib/intel_compute: Adjust long kernel usage
 for WMTP
Message-ID: <lzzbubaynvz6k754mftzlvbldyoe6rfx4zrskwhbilaw755775@euw73cgmziw5>
References: <20251003052640.56068-1-sobin.thomas@intel.com>
 <20251003052640.56068-4-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251003052640.56068-4-sobin.thomas@intel.com>
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

On Fri, Oct 03, 2025 at 05:26:21AM +0000, Sobin Thomas wrote:
> WMTP uses different shaders SIP and loop kernel and does not
> require a separate long_kernel; This will make long kernel test to
> be enabled or Thread group preemption tests.
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  lib/intel_compute.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index ade0b44c1..23931f089 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -72,7 +72,6 @@
>   * WMTP - Walker Mid Thread Preemption
>   */
>  #define TGP_long_kernel_loop_count		10
> -#define WMTP_long_kernel_loop_count		1000000
>  #define XE2_THREADGROUP_PREEMPT_XDIM		0x4000
>  
>  struct bo_dict_entry {
> @@ -2135,8 +2134,6 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  
>  	if (threadgroup_preemption)
>  		long_kernel_loop_count = TGP_long_kernel_loop_count;
> -	else
> -		long_kernel_loop_count = WMTP_long_kernel_loop_count;
>  
>  	for (int i = 0; i < entries; ++i)
>  		bo_dict_short[i] = bo_dict_long[i];
> -- 
> 2.51.0
> 
