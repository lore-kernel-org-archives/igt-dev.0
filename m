Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B114E7719C
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 15:49:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E0310F11B;
	Fri, 10 Jan 2025 15:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dat87xR3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0D710F11B
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 15:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736524168; x=1768060168;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qGzsYz4e04irDohsKCu1sJ+8j27Hg5WsgXRE86pj+Js=;
 b=dat87xR33XljHixt3lN6CuxUddhB6+pVk/18fIJy121Ir22ZF3mslfFP
 h8mvFXAqZsnPr0TrknbBDp1wOS0N11gb5f1jjfneD4E9N/LOeKhF8AHEt
 ppA2hju+wsZi90r2+ju8CWMTI1u9KqTfDA6BaaIej3309eihQSn/kKt8v
 USWpVHaI08ASCRIFLsmYeNQyRvu//qnu8YFMDOM+NeoNqKll1atUCZhH+
 NjN6IaEAogGAXbARDPmDn9KiHJtr4zUEf3AhcpHlMaYAvFrNqTywicqfm
 VD5vAoGnluYGzoTDbo08UvtZXuEBFsrTDF6AFTjMPxqx34EKtuUTinn0Z w==;
X-CSE-ConnectionGUID: QvOQ44/FT3CvZ2v6KpKJHg==
X-CSE-MsgGUID: HpFG2EulTReeN7mGh95nnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="48187695"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="48187695"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 07:49:27 -0800
X-CSE-ConnectionGUID: 1PHlD6wXRkSxZtNWNTPGfg==
X-CSE-MsgGUID: ryvFoj1lS12ti6fiSttc/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107812800"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.111.171])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 07:49:27 -0800
Date: Fri, 10 Jan 2025 09:49:22 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2] lib/meson.build: allow build IGT with link time
 optimization
Message-ID: <an6phcuicnk53etojf2ae3oqwnlx5lsuuehlsaax3dv4jkfkty@fcgjdpxxx6jv>
References: <20250109-fix-lto-v2-1-3dc74d60a124@intel.com>
 <omr2ioqmwgdfxbdn74mzqar7xdf5sgu6k4wktcr64byyu343o5@xxrp7q4p2hbf>
 <36bf601f-72a7-46cf-9d95-29baea769179@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36bf601f-72a7-46cf-9d95-29baea769179@intel.com>
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

On Fri, Jan 10, 2025 at 08:58:39AM +0100, Hajda, Andrzej wrote:
>
>W dniu 09.01.2025 o 18:29, Lucas De Marchi pisze:
>>On Thu, Jan 09, 2025 at 05:26:30PM +0100, Andrzej Hajda wrote:
>>>Some distributions use -flto gcc flag to build IGT. With this flag
>>>enabled variables declared with section attribute do not appear in
>>>correct section in .o files. Since iga64 assembly helper script relies
>>>on it we need to use -ffat-lto-objects in case of files containing
>>>iga64 assembly. According to documentation this option is effective
>>>only in case lto is in use, so it should not affect non-lto builds.
>>>
>>>Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/165
>>>Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>>
>>is this about
>>
>>        static const char t[] __attribute__ 
>>((section(".iga64_assembly"), used)) =\
>>?
>>
>>it's missing a "retain" attribute to be able to link with LLD.
>>I fixed a similar bug in kmod recently, but that  was due to linking with
>>LLD instead of using or not lto. See 
>>https://github.com/kmod-project/kmod/pull/274
>>
>Yes this is about this line, but I think we have here slightly 
>different issues.
>
>As I understand in kmod-project you want to keep the symbol in final 
>executable/so_library/whatever.

yep

>
>In case of igt we want to have access to ".iga64_assembly" section 
>after compile phase (ie see it in .o files), we do not care about 
>final executable.

oh... ok. The scripts/generate_iga64_codes script will parse the
intermediate files, not the final lib.

>
>With LTO enabled the structure of .o files drastically changes - every 
>function/variable in compile phase goes to separate section 
>(.gnu.lto_*), information about final sections is kept somewhere in 
>private metadata.
>
>With compiler option '-ffat-lto-objects' .o file contains both 
>structures of sections - classic .text/.data/.iga64_assembly and lto 
>related .gnu.lto_* and this is what we need in case of igt.

is this true for both gcc/clang? With clang it seems it seems it's even
worse:

$ file build-lto-clang/lib/libigt-gpgpu_fill_c.a.p/gpgpu_fill.c.o
build-lto-clang/lib/libigt-gpgpu_fill_c.a.p/gpgpu_fill.c.o: LLVM IR bitcode

$ readelf -t build-lto-clang/lib/libigt-gpgpu_fill_c.a.p/gpgpu_fill.c.o
readelf: Error: This is a LLVM bitcode file - try using llvm-bcanalyzer

This seems to fix it for gcc and we may handle the above as a
separate case. For fixing this separate case, maybe we should stop
inspecting the .o, add a retain attribute, inspect the final
lib/binary and use objcopy --add-symbol to add the new symbols (or the
linker again to link one additional .o at the end). Anyway, I'm
digressing.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


thanks
Lucas De Marchi

>
>
>Regards
>
>Andrzej
>
>
>>Are you sure this is related to LTO and not the different linker?
>>$ grep -r -e '\.iga64_assembly' build-lto-clang/
>>grep: 
>>build-lto-clang/lib/libigt-gpgpu_shader_c.a.p/gpgpu_shader.c.o: 
>>binary file matches
>>grep: build-lto-clang/lib/libigt.so.0: binary file matches
>>grep: build-lto-clang/lib/libigt-gpgpu_fill_c.a.p/gpgpu_fill.c.o: 
>>binary file matches
>>
>>
>>$ readelf -t build-lto-clang/lib/libigt.so.0 | grep -A3 -e 
>>.iga64_assembly
>>  [10] .iga64_assembly
>>       PROGBITS         00000000000657d0  00000000000657d0  0
>>       0000000000002c65 0000000000000000  0                 16
>>       [0000000000000002]: ALLOC
>>
>>So it has a section with that name of size 0x2c65
>>
>>
>>Lucas De Marchi
>>
>>>---
>>>This patch 'fixes' building IGT with link-time-optimization. I am not
>>>sure it is or should be supported by IGT, but build scripts can be
>>>modified to allow it for testing.
>>>Grepping internet shows at least Gentoo and Arch Linux builds IGT with
>>>LTO, so I guess it is working for them.
>>>---
>>>Changes in v2:
>>>- added Closes tag
>>>- Link to v1: https://lore.kernel.org/r/20241216-fix-lto-v1-1-1280b17dc70f@intel.com
>>>---
>>>lib/meson.build | 2 +-
>>>1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>>diff --git a/lib/meson.build b/lib/meson.build
>>>index 1704ed1e1c17..9fffdd3c6218 100644
>>>--- a/lib/meson.build
>>>+++ b/lib/meson.build
>>>@@ -240,7 +240,7 @@ foreach f: lib_sources
>>>        '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
>>>        '-DIGT_SRCDIR="@0@"'.format(srcdir),
>>>        '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
>>>-    ])
>>>+    ] + (iga64_assembly_sources.contains(f) ? [ 
>>>'-ffat-lto-objects' ] : []))
>>>
>>>    lib_intermediates += lib
>>>    if iga64_assembly_sources.contains(f)
>>>
>>>---
>>>base-commit: ee7a3ac616f55f6ed1b959ff951237099bda86d8
>>>change-id: 20241216-fix-lto-8d3bc1488c6a
>>>
>>>Best regards,
>>>-- 
>>>Andrzej Hajda <andrzej.hajda@intel.com>
>>>
