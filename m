Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91B3C53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 14:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7339710EC47;
	Wed, 29 Jul 2026 14:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BovVWXyZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E32310EC45
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 14:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785333718; x=1816869718;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ptQu07GliDNAFEgFiu7/4yDsDlnNDBsZsyZwDocyHH8=;
 b=BovVWXyZwz/H57ao4Yx5ySXmsVyfejWBFcSdPQPFe5/VLNrf3NR6mmbr
 UBNooaUlye2LlzdARrlNtxl+oIXpj+u3gORl8h3+nkag6748/ZyYbwa6h
 tRwFFps+nAfFnlqhGVyYP/7ne7LYQyZmOuuSMbQ9uqiUBOCMXVIm9ETN7
 TPEAXtwNkh1T10z6bELiTLr5/9jzMVABP14BUN87hzG0TwOkXDkppYs6A
 1z2akP6nEr9Moj5rpkF24F6wrjCl6rhq1XQo6Suiij0fNweQrzZ/0NkkX
 x8Uo9EO+xpGyhVA6xprx5vTLDOOtomB/31rNrN+6jsNSEGqMl07CSjBUD w==;
X-CSE-ConnectionGUID: rAVGYZcIQsyXA8A2P+We/Q==
X-CSE-MsgGUID: lDZdSlfOQ7WUQrQGWJ0XMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103479126"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="103479126"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 07:01:57 -0700
X-CSE-ConnectionGUID: sR3RvCD9SZWEGLiFrdYRXw==
X-CSE-MsgGUID: l+MCriLYRFqbUg5E+Xr+mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="284582104"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 07:01:56 -0700
Date: Wed, 29 Jul 2026 16:01:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 krzysztof.niemiec@intel.com, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v4 13/31] tools/intel_gpu_frequency: link with
 minimal sub-libraries
Message-ID: <20260729140153.xwchvx6t2a6djyz2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 krzysztof.niemiec@intel.com,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <cover.1785152675.git.sebastian.brzezinka@intel.com>
 <cc5550d4b89b9ce64648ff1381af6a90fd2d95f2.1785152675.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cc5550d4b89b9ce64648ff1381af6a90fd2d95f2.1785152675.git.sebastian.brzezinka@intel.com>
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
On 2026-07-27 at 15:22:41 +0200, Sebastian Brzezinka wrote:
> intel_gpu_frequency needs only intel_gen/devid helpers and a DRM device
> opener to query the GPU frequency.  Link it against lib_igt_chipset for
> the devid helpers and lib_igt_drm_stub for driver detection and device
> opening, instead of the full libigt.so stack.
> 
> ldd before: 35  (ldd intel_gpu_frequency | wc -l)
> ldd after:   5  (ldd intel_gpu_frequency | wc -l)

On my system it was:

$ ldd build/tools/intel_gpu_frequency
linux-vdso.so.1 (0x00007ffedf5f5000)
libdrm.so.2 => /lib/x86_64-linux-gnu/libdrm.so.2 (0x00007bdd60cfa000)
libpciaccess.so.0 => /lib/x86_64-linux-gnu/libpciaccess.so.0 (0x00007bdd60cef000)
libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007bdd60a00000)
/lib64/ld-linux-x86-64.so.2 (0x00007bdd60d43000)
libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1 (0x00007bdd60cd3000)

$ ldd build/tools/intel_gpu_frequency |wc -l
6

and it is big drop, compared to old:

ldd build/tools/intel_gpu_frequency |wc -l
74

Btw looking at raw output, it seems that there are still more
room for future improvement, like removing linked libs libdrm,
libpciaccess and libz. I guess some other tools also do not
need some of them.

Regards,
Kamil

> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 53aa31056..01400f53e 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -23,7 +23,6 @@ tools_progs = [
>  	'intel_dump_decode',
>  	'intel_error_decode',
>  	'intel_forcewaked',
> -	'intel_gpu_frequency',
>  	'intel_framebuffer_dump',
>  	'intel_gpu_time',
>  	'intel_gtt',
> @@ -66,6 +65,11 @@ executable('intel_firmware_decode', 'intel_firmware_decode.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_gpu_frequency', 'intel_gpu_frequency.c',
> +	   dependencies : [lib_igt_chipset, lib_igt_tools_stub, lib_igt_drm_stub],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 
> 2.53.0
> 
