Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8CBE77197
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 17:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDA910EE95;
	Thu,  9 Jan 2025 17:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h3EZNhV1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A5810EE95
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 17:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736443797; x=1767979797;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yib8pIAsQh49XmqdPdf0cJw1n3D+tly1GiiU/05WrE4=;
 b=h3EZNhV1+HNv+n92lHFpl5lPvRrLsy7fcZYth08CZsSxX8UbJGEAk/v2
 rXPrUArQQiqe+rpz0XXYw2cqXdcAI663jc4Y28b4wjQcJu8Ki2febTgFC
 eBhqnmBxYddd8foEdhQpqiwaiIrQqa2Wqcs4vQKs7Nl4KMZa1oeSGpcyg
 q0m0mgIwk4hA5AfOaLFuVd37yFb/qsF/8uCFtdZWMPqj0VTJi1Sn6nntc
 Yv40LRXCL9QC+CXm3Zb/36ksh+Z8yaNkzBwm4lre2NcUpkB9AkNIH0dI7
 OQialp6xAKR1W+vmSjG7U8LPFeT/byednueLC0P2J3Qws4mBd9Ru33iIN Q==;
X-CSE-ConnectionGUID: 3ogE8AmtRSKf0p11Sh3jSg==
X-CSE-MsgGUID: RVcCJW1vRcKXwLNBLehm7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="59190342"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="59190342"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 09:29:56 -0800
X-CSE-ConnectionGUID: H3/BZVfKR4WCEyIZUfs4xg==
X-CSE-MsgGUID: BZk2UjTFRGiCqRuhAcC17A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103349553"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.111.77])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 09:29:56 -0800
Date: Thu, 9 Jan 2025 11:29:49 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2] lib/meson.build: allow build IGT with link time
 optimization
Message-ID: <omr2ioqmwgdfxbdn74mzqar7xdf5sgu6k4wktcr64byyu343o5@xxrp7q4p2hbf>
References: <20250109-fix-lto-v2-1-3dc74d60a124@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250109-fix-lto-v2-1-3dc74d60a124@intel.com>
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

On Thu, Jan 09, 2025 at 05:26:30PM +0100, Andrzej Hajda wrote:
>Some distributions use -flto gcc flag to build IGT. With this flag
>enabled variables declared with section attribute do not appear in
>correct section in .o files. Since iga64 assembly helper script relies
>on it we need to use -ffat-lto-objects in case of files containing
>iga64 assembly. According to documentation this option is effective
>only in case lto is in use, so it should not affect non-lto builds.
>
>Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/165
>Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

is this about

         static const char t[] __attribute__ ((section(".iga64_assembly"), used)) =\
?

it's missing a "retain" attribute to be able to link with LLD.
I fixed a similar bug in kmod recently, but that  was due to linking with
LLD instead of using or not lto. See https://github.com/kmod-project/kmod/pull/274

Are you sure this is related to LTO and not the different linker? 

$ grep -r -e '\.iga64_assembly' build-lto-clang/
grep: build-lto-clang/lib/libigt-gpgpu_shader_c.a.p/gpgpu_shader.c.o: binary file matches
grep: build-lto-clang/lib/libigt.so.0: binary file matches
grep: build-lto-clang/lib/libigt-gpgpu_fill_c.a.p/gpgpu_fill.c.o: binary file matches


$ readelf -t build-lto-clang/lib/libigt.so.0 | grep -A3 -e .iga64_assembly
   [10] .iga64_assembly
        PROGBITS         00000000000657d0  00000000000657d0  0
        0000000000002c65 0000000000000000  0                 16
        [0000000000000002]: ALLOC

So it has a section with that name of size 0x2c65


Lucas De Marchi

>---
>This patch 'fixes' building IGT with link-time-optimization. I am not
>sure it is or should be supported by IGT, but build scripts can be
>modified to allow it for testing.
>Grepping internet shows at least Gentoo and Arch Linux builds IGT with
>LTO, so I guess it is working for them.
>---
>Changes in v2:
> - added Closes tag
>- Link to v1: https://lore.kernel.org/r/20241216-fix-lto-v1-1-1280b17dc70f@intel.com
>---
> lib/meson.build | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/lib/meson.build b/lib/meson.build
>index 1704ed1e1c17..9fffdd3c6218 100644
>--- a/lib/meson.build
>+++ b/lib/meson.build
>@@ -240,7 +240,7 @@ foreach f: lib_sources
> 	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
> 	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
> 	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
>-	])
>+	] + (iga64_assembly_sources.contains(f) ? [ '-ffat-lto-objects' ] : []))
>
>     lib_intermediates += lib
>     if iga64_assembly_sources.contains(f)
>
>---
>base-commit: ee7a3ac616f55f6ed1b959ff951237099bda86d8
>change-id: 20241216-fix-lto-8d3bc1488c6a
>
>Best regards,
>-- 
>Andrzej Hajda <andrzej.hajda@intel.com>
>
