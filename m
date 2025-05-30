Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB76C5B543
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 15:03:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5B410E7F8;
	Fri, 30 May 2025 15:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDOs/Xfj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF9210E0CA
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 15:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748617420; x=1780153420;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5PQkkTxDUq68Jla+bR2dy4ii89aiy0No818rTes5tWc=;
 b=aDOs/XfjZL1WblVFC+Wjg3IgkcemUf+M/X1YC/Rm1Mx0+0jpkwHERMRf
 d1OCOPqDNAbowXpnE4o8EUie5XViGPgiv0kkmBM4tQa2BSUwB3nF3r7eT
 TxHy1sNslhtPqyGTUPhc+Cxi9sxoTwaQHq1o1YaodktvXcKjsRMbjTIYy
 VbyJwzM8jD0XFSK7qnGnO2djkErx2/rqnfxp0LWJzGqNosG6DdTC9kGUN
 E3DUqpKhz+9qTj/9bkg7KI8hHBJ2i6YXuleeXoA8oOQnV+oshYp5Do1PG
 a7unpPzc/6cXXqsjBJ+l/tld9QGGN9k/sDrAWIYV6H0bl3i2/sKJQc8SP g==;
X-CSE-ConnectionGUID: 8MYWN6kFQQWcJ2DPZW0EtQ==
X-CSE-MsgGUID: cDcQBRO4QaCiWpwECHnl3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="60969228"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="60969228"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 08:03:38 -0700
X-CSE-ConnectionGUID: ksBpDJ0MTEyZFuRZCBw9fA==
X-CSE-MsgGUID: Nzc2WdA1QSqLE8s3xouacA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="143862469"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 08:03:37 -0700
Date: Fri, 30 May 2025 17:03:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] Revert "lib/meson: refactor GPGPU assembly build process"
Message-ID: <20250530150318.36jyikby5mspxmbt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250530-revert_meson-v1-1-69c9ad1ea87f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530-revert_meson-v1-1-69c9ad1ea87f@intel.com>
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

Hi Andrzej,
On 2025-05-30 at 16:22:11 +0200, Andrzej Hajda wrote:
> Commit causes warnigs in old meson which are treated as error:
> WARNING: Project targetting '>=0.47.2' but tried to use feature introduced in '0.48.0': console arg in custom_target
> As build system uses old meson for checks let's revert it.

Hmm, it seems it is time to update meson a little,
now it seems rather old. What about bumping it up to at least 0.48.2?

> 
> This reverts commit 62557300fee4509d3adbcdaf4ee402c6e61b846f.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/gpgpu_fill.c.gen.iga64_codes.c                 | 80 ----------------------
>  ...c.gen.iga64_codes.c => iga64_generated_codes.c} | 76 +++++++++++++++++++-
>  lib/meson.build                                    | 40 +++++------
>  scripts/generate_iga64_codes                       | 14 ++--
>  4 files changed, 98 insertions(+), 112 deletions(-)
> 
> diff --git a/lib/gpgpu_fill.c.gen.iga64_codes.c b/lib/gpgpu_fill.c.gen.iga64_codes.c
> deleted file mode 100644
> index b223425d049a51096a2314a759d238af6887b2b9..0000000000000000000000000000000000000000
> --- a/lib/gpgpu_fill.c.gen.iga64_codes.c
> +++ /dev/null
> @@ -1,80 +0,0 @@
> -// SPDX-License-Identifier: MIT
> -// Generated using Intel Graphics Assembler 1.1.0-int
> -
> -#include "gpgpu_shader.h"
> -
> -#define MD5_SUM_IGA64_ASMS 8304c8bb11385470bfd6ac32e1c36840
> -
> -struct iga64_template const iga64_code_gpgpu_fill[] = {
> -	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> -		0x00080061, 0x01050000, 0x00000104, 0x00000000,
> -		0x00000069, 0x02058220, 0x02000014, 0x00000004,
> -		0x00000061, 0x02150220, 0x00000064, 0x00000000,
> -		0x000c0061, 0x04054220, 0x00000000, 0x00000000,
> -		0x00101c61, 0x05050220, 0x00000104, 0x00000000,
> -		0x00041b61, 0x04550220, 0x00220205, 0x00000000,
> -		0x00000061, 0x04754550, 0x00000000, 0x000f000f,
> -		0x00132031, 0x00000000, 0xd00e0494, 0x04000000,
> -		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> -		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> -		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> -	}},
> -	{ .gen_ver = 1270, .size = 52, .code = (const uint32_t []) {
> -		0x00020061, 0x01050000, 0x00000104, 0x00000000,
> -		0x00000069, 0x02058220, 0x02000024, 0x00000004,
> -		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
> -		0x00030061, 0x04054220, 0x00000000, 0x00000000,
> -		0x00041c61, 0x05050220, 0x00000104, 0x00000000,
> -		0x00011b61, 0x04050220, 0x00220205, 0x00000000,
> -		0x00000061, 0x04454220, 0x00000000, 0x0000000f,
> -		0x00000061, 0x04850220, 0x000000a4, 0x00000000,
> -		0x80001901, 0x00010000, 0x00000000, 0x00000000,
> -		0x00044031, 0x00000000, 0xc0000414, 0x02a00000,
> -		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> -		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> -		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> -	}},
> -	{ .gen_ver = 1260, .size = 48, .code = (const uint32_t []) {
> -		0x00080061, 0x01050000, 0x00000104, 0x00000000,
> -		0x00000069, 0x02058220, 0x02000014, 0x00000004,
> -		0x00000061, 0x02150220, 0x00000064, 0x00000000,
> -		0x000c0061, 0x04054220, 0x00000000, 0x00000000,
> -		0x00101c61, 0x05050220, 0x00000104, 0x00000000,
> -		0x00041b61, 0x04050220, 0x00220205, 0x00000000,
> -		0x00000061, 0x04254220, 0x00000000, 0x0000000f,
> -		0x00000061, 0x04450220, 0x00000054, 0x00000000,
> -		0x00132031, 0x00000000, 0xc0000414, 0x02a00000,
> -		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> -		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> -		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> -	}},
> -	{ .gen_ver = 1250, .size = 52, .code = (const uint32_t []) {
> -		0x00020061, 0x01050000, 0x00000104, 0x00000000,
> -		0x00000069, 0x02058220, 0x02000024, 0x00000004,
> -		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
> -		0x00030061, 0x04054220, 0x00000000, 0x00000000,
> -		0x00041c61, 0x05050220, 0x00000104, 0x00000000,
> -		0x00011b61, 0x04050220, 0x00220205, 0x00000000,
> -		0x00000061, 0x04454220, 0x00000000, 0x0000000f,
> -		0x00000061, 0x04850220, 0x000000a4, 0x00000000,
> -		0x80001901, 0x00010000, 0x00000000, 0x00000000,
> -		0x00044031, 0x00000000, 0xc0000414, 0x02a00000,
> -		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> -		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> -		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> -	}},
> -	{ .gen_ver = 0, .size = 48, .code = (const uint32_t []) {
> -		0x00020061, 0x01050000, 0x00000104, 0x00000000,
> -		0x00000069, 0x02058220, 0x02000024, 0x00000004,
> -		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
> -		0x00030061, 0x04054220, 0x00000000, 0x00000000,
> -		0x00040461, 0x05050220, 0x00000104, 0x00000000,
> -		0x00010361, 0x04050220, 0x00220205, 0x00000000,
> -		0x00000061, 0x04454220, 0x00000000, 0x0000000f,
> -		0x00000061, 0x04850220, 0x000000a4, 0x00000000,
> -		0x00049031, 0x00000000, 0xc0000414, 0x02a00000,
> -		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> -		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> -		0x80000101, 0x00010000, 0x00000000, 0x00000000,
> -	}}
> -};
> diff --git a/lib/gpgpu_shader.c.gen.iga64_codes.c b/lib/iga64_generated_codes.c
> similarity index 89%
> rename from lib/gpgpu_shader.c.gen.iga64_codes.c
> rename to lib/iga64_generated_codes.c
> index fffe242fe138cd56b5cd73a5f149637b284db02e..551dead2be173d0e48f807e3471f914e898556c4 100644
> --- a/lib/gpgpu_shader.c.gen.iga64_codes.c
> +++ b/lib/iga64_generated_codes.c
> @@ -3,7 +3,81 @@
>  
>  #include "gpgpu_shader.h"
>  
> -#define MD5_SUM_IGA64_ASMS f5d2183439f5e7b18097c3c2c2957dbb
> +#define MD5_SUM_IGA64_ASMS 22a5a4671242c3257209f4051f1c0c7e
> +
> +struct iga64_template const iga64_code_gpgpu_fill[] = {
> +	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> +		0x00080061, 0x01050000, 0x00000104, 0x00000000,
> +		0x00000069, 0x02058220, 0x02000014, 0x00000004,
> +		0x00000061, 0x02150220, 0x00000064, 0x00000000,
> +		0x000c0061, 0x04054220, 0x00000000, 0x00000000,
> +		0x00101c61, 0x05050220, 0x00000104, 0x00000000,
> +		0x00041b61, 0x04550220, 0x00220205, 0x00000000,
> +		0x00000061, 0x04754550, 0x00000000, 0x000f000f,
> +		0x00132031, 0x00000000, 0xd00e0494, 0x04000000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1270, .size = 52, .code = (const uint32_t []) {
> +		0x00020061, 0x01050000, 0x00000104, 0x00000000,
> +		0x00000069, 0x02058220, 0x02000024, 0x00000004,
> +		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
> +		0x00030061, 0x04054220, 0x00000000, 0x00000000,
> +		0x00041c61, 0x05050220, 0x00000104, 0x00000000,
> +		0x00011b61, 0x04050220, 0x00220205, 0x00000000,
> +		0x00000061, 0x04454220, 0x00000000, 0x0000000f,
> +		0x00000061, 0x04850220, 0x000000a4, 0x00000000,
> +		0x80001901, 0x00010000, 0x00000000, 0x00000000,
> +		0x00044031, 0x00000000, 0xc0000414, 0x02a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1260, .size = 48, .code = (const uint32_t []) {
> +		0x00080061, 0x01050000, 0x00000104, 0x00000000,
> +		0x00000069, 0x02058220, 0x02000014, 0x00000004,
> +		0x00000061, 0x02150220, 0x00000064, 0x00000000,
> +		0x000c0061, 0x04054220, 0x00000000, 0x00000000,
> +		0x00101c61, 0x05050220, 0x00000104, 0x00000000,
> +		0x00041b61, 0x04050220, 0x00220205, 0x00000000,
> +		0x00000061, 0x04254220, 0x00000000, 0x0000000f,
> +		0x00000061, 0x04450220, 0x00000054, 0x00000000,
> +		0x00132031, 0x00000000, 0xc0000414, 0x02a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1250, .size = 52, .code = (const uint32_t []) {
> +		0x00020061, 0x01050000, 0x00000104, 0x00000000,
> +		0x00000069, 0x02058220, 0x02000024, 0x00000004,
> +		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
> +		0x00030061, 0x04054220, 0x00000000, 0x00000000,
> +		0x00041c61, 0x05050220, 0x00000104, 0x00000000,
> +		0x00011b61, 0x04050220, 0x00220205, 0x00000000,
> +		0x00000061, 0x04454220, 0x00000000, 0x0000000f,
> +		0x00000061, 0x04850220, 0x000000a4, 0x00000000,
> +		0x80001901, 0x00010000, 0x00000000, 0x00000000,
> +		0x00044031, 0x00000000, 0xc0000414, 0x02a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 48, .code = (const uint32_t []) {
> +		0x00020061, 0x01050000, 0x00000104, 0x00000000,
> +		0x00000069, 0x02058220, 0x02000024, 0x00000004,
> +		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
> +		0x00030061, 0x04054220, 0x00000000, 0x00000000,
> +		0x00040461, 0x05050220, 0x00000104, 0x00000000,
> +		0x00010361, 0x04050220, 0x00220205, 0x00000000,
> +		0x00000061, 0x04454220, 0x00000000, 0x0000000f,
> +		0x00000061, 0x04850220, 0x000000a4, 0x00000000,
> +		0x00049031, 0x00000000, 0xc0000414, 0x02a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000101, 0x00010000, 0x00000000, 0x00000000,
> +	}}
> +};
>  
>  struct iga64_template const iga64_code_read_a64_d32[] = {
>  	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
> diff --git a/lib/meson.build b/lib/meson.build
> index c903aaa14bc9d5835ddffbddfb1e610d770b0a43..f5419805177f3b87448b4a3c16dae55fa0847595 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -236,30 +236,9 @@ lib_version = vcs_tag(input : 'version.h.in', output : 'version.h',
>  		      command : vcs_command )
>  
>  iga64_assembly_sources = [ 'gpgpu_shader.c', 'gpgpu_fill.c' ]
> -libiga64_asms = static_library('iga64_asms',
> -	iga64_assembly_sources,
> -	include_directories: inc,
> -	dependencies : lib_deps,
> -	c_args : [
> -	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
> -	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
> -	    '-DIGT_LOG_DOMAIN="gpu_codes"',
> -	    '-ffat-lto-objects' ]
> -)
> -
> -iga64_codes_targets = []
> -foreach f: iga64_assembly_sources
> -	name = f.underscorify() + '.gen.iga64_codes.c'
> -	iga64_codes_targets += custom_target(name,
> -		input: [ f + '.gen.iga64_codes.c', libiga64_asms.extract_objects(f) ],
> -		output: name,
> -		depend_files: [ 'iga64_macros.h', generate_iga64_codes.path() ],
> -		command: [ 'env', 'IGT_SRCDIR=@SOURCE_ROOT@', generate_iga64_codes, '-o', '@OUTPUT@', '-i', '@INPUT0@', '@INPUT1@' ],
> -		console: true,
> -	)
> -endforeach
>  
>  lib_intermediates = []
> +iga64_assembly_libs = []
>  foreach f: lib_sources
>      name = f.underscorify()
>      lib = static_library('igt-' + name,
> @@ -270,12 +249,25 @@ foreach f: lib_sources
>  	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
>  	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
>  	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
> -	])
> +	] + (iga64_assembly_sources.contains(f) ? [ '-ffat-lto-objects' ] : []))
>  
>      lib_intermediates += lib
> +    if iga64_assembly_sources.contains(f)
> +	iga64_assembly_libs += lib
> +    endif
>  endforeach
>  
> -lib_intermediates += static_library('iga64_gpu_codes', iga64_codes_targets)
> +iga64_generated_codes = custom_target(
> +    'iga64_generated_codes.c',
> +    input : [ 'iga64_generated_codes.c' ] + iga64_assembly_libs,
> +    output : 'iga64_generated_codes.c',
> +    depend_files : 'iga64_macros.h',
> +    command : [ 'env', 'IGT_SRCDIR=@0@'.format(source_root), generate_iga64_codes, '-o', '@OUTPUT@', '-i', '@INPUT@' ]
> +)
> +
> +lib_intermediates += static_library('igt-iga64_generated_codes.c',
> +			[ iga64_generated_codes, lib_version ]
> +		     )
>  
>  lib_igt_build = shared_library('igt',
>      ['dummy.c'],
> diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
> index d196c7a016b75a680e38987a1f349fcc6ec934e6..1675ffe639b3bb3228266846ade3ac1f25b55f4f 100755
> --- a/scripts/generate_iga64_codes
> +++ b/scripts/generate_iga64_codes
> @@ -29,17 +29,17 @@ while getopts ':i:o:' opt; do
>      case $opt in
>      i) INPUT=$OPTARG;;
>      o) OUTPUT=$OPTARG;;
> -    ?) die "Usage: $0 -i pre-generated-iga64-file -o generated-iga64-file obj-with-iga64-assembly [...]"
> +    ?) die "Usage: $0 -i pre-generated-iga64-file -o generated-iga64-file libs-with-iga64-assembly [...]"
>      esac
>  done
> -OBJ=${@:OPTIND}
> +LIBS=${@:OPTIND}
>  
>  # read all assemblies into ASMS array
>  ASMS=()
>  while  read -d $'\0' asm; do
>      test -z "$asm" && continue
>      ASMS+=( "$asm" )
> -done < <(objcopy --dump-section .iga64_assembly=/dev/stdout $OBJ /dev/null)
> +done < <(for f in $LIBS; do objcopy --dump-section .iga64_assembly=/dev/stdout $f.p/*.o /dev/null; done)
>  
>  # check if we need to recompile - checksum difference and compiler present
>  MD5_ASMS="$(md5sum <<< "$(< $IGT_SRCDIR/lib/iga64_macros.h) ${ASMS[@]}" | cut -b1-32)"
> @@ -47,13 +47,13 @@ MD5_PRE="$(grep -Po '(?<=^#define MD5_SUM_IGA64_ASMS )\S{32,32}' $INPUT 2>/dev/n
>  
>  if [ "$MD5_ASMS" = "$MD5_PRE" ]; then
>      echo "iga64 assemblies not changed, reusing pre-compiled file $INPUT."
> -    cp -p $INPUT $OUTPUT
> +    cp $INPUT $OUTPUT
>      exit 0
>  fi
>  
>  type iga64 >/dev/null || {
>      warn "WARNING: iga64 assemblies changed, but iga64 compiler not present, CHANGES will have no effect. Install iga64 (libigc-tools package) to re-compile code."
> -    cp -p $INPUT $OUTPUT
> +    cp $INPUT $OUTPUT
>      exit 0
>  }
>  
> @@ -67,7 +67,7 @@ for gen in $GEN_VERSIONS; do
>      gen_name="${gen#*:}"
>      iga64 -p=$gen_name -d $WD/empty 2>/dev/null || {
>          warn "WARNING: iga64 assemblies changed, but iga64 compiler does not support platform '$gen_name', CHANGES will have no effect. Update iga64 (libigc-tools package) to re-compile code."
> -        cp -p $INPUT $OUTPUT
> +        cp $INPUT $OUTPUT
>          exit 0
>      }
>  done
> @@ -127,4 +127,4 @@ for asm in "${ASMS[@]}"; do
>      echo -e "\t{ .gen_ver = $cur_ver, .size = $(dword_count "$cur_code"), .code = (const uint32_t []) {\n$cur_code\n\t}}\n};" >>$OUTPUT
>  done
>  
> -cp -vp $OUTPUT $INPUT
> +cp $OUTPUT $INPUT
> 
> ---
> base-commit: 62557300fee4509d3adbcdaf4ee402c6e61b846f
> change-id: 20250530-revert_meson-36dce81e0a9a
> 
> Best regards,
> -- 
> Andrzej Hajda <andrzej.hajda@intel.com>
> 
