Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D3DC43458
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jul 2026 12:53:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADCD10F356;
	Thu,  2 Jul 2026 12:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DKRRcsP6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CB210F356
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2026 12:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782996769; x=1814532769;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wUq2RxogQQ/6gGM/bPlNKE8XBvJ4a20ihJAfyGWc1qw=;
 b=DKRRcsP6XPnA1sklHXdY4CNRh0bQEmbdk5FDdMmQ8XoQuGmCTtsIE/fX
 V6u5UXFTJqP+P/OQHsARmoVKZ24WJ7eeun40c43AdhnJoTi2nK/f8kUmS
 /7bTMpNvBvY5fU8IitNRBtkGZ1EBE6Voik2kYZt4d90G2NO9U1QCl7iDD
 ba0X6Vk0x0oG4MKglJA1khtF3n+F3kUC7pCVSt0GC91tu8MNY+tWvXIj1
 cR0vaahGb/Yr2BY+x3Y8Ov0X3bPTgmJ/WZSeYrbwuBD2yL2dsldiL87LN
 fQqyPmFy7Y0CDB0NAljEV3a389lgDWw19mUOCTkUOOSM7OU+x9pnou9uP w==;
X-CSE-ConnectionGUID: fA4TvC49RqiQyjXf6CDlKA==
X-CSE-MsgGUID: 1aTlwcYUSoqnmVFVqmFi3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94405171"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="94405171"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 05:52:48 -0700
X-CSE-ConnectionGUID: T1+eo1YTQ6m5HxDNoTokCw==
X-CSE-MsgGUID: VeZZSqsIQ7CrxoJiI3G/UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="276065405"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 05:52:46 -0700
Date: Thu, 2 Jul 2026 14:52:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 krzysztof.niemiec@intel.com
Subject: Re: [PATCH i-g-t 02/25] tools: intel_firmware_decode: drop
 libigt.so, link against minimal sub-libraries
Message-ID: <20260702125244.yy2imsawqpv36ypr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 krzysztof.niemiec@intel.com
References: <cover.1782288071.git.sebastian.brzezinka@intel.com>
 <758f127a782a80c1725b6f98df441f13621d38de.1782288071.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <758f127a782a80c1725b6f98df441f13621d38de.1782288071.git.sebastian.brzezinka@intel.com>
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

Hi Sebastian,
On 2026-06-24 at 10:47:09 +0200, Sebastian Brzezinka wrote:

please reword all you patches, now they are:

[PATCH i-g-t 02/25] tools: intel_firmware_decode: drop libigt.so, link against minimal sub-libraries

imho they should be:

[PATCH i-g-t 02/25] tools/intel_firmware_decode: link with minimal sub-libraries

They should follow pattern tools/name_of_tool: short change description

Also add Acked-by to all pacthes, you got from Ashutosh and then
resend.

Regards,
Kamil


> intel_firmware_decode only needs the lightweight assert stub used by
> igt_assert(), so the full libigt.so stack is unnecessary.
> 
> Switch to linking against lib_igt_tools_stub only.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   3   (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 286a718c8..4c67dde4f 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -24,7 +24,6 @@ tools_progs = [
>  	'intel_error_decode',
>  	'intel_forcewaked',
>  	'intel_gpu_frequency',
> -	'intel_firmware_decode',
>  	'intel_framebuffer_dump',
>  	'intel_gpu_time',
>  	'intel_gtt',
> @@ -62,6 +61,11 @@ executable('igt_stats', 'igt_stats.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_firmware_decode', 'intel_firmware_decode.c',
> +	   dependencies : [lib_igt_tools_stub],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 
> 2.53.0
> 
