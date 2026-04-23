Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E738F9936C
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 11:05:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730C510F0AC;
	Thu, 23 Apr 2026 11:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jy3N9t/m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76BEB10E350
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 11:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776942288; x=1808478288;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=udaDpaR7ql97v/LOiZlHQjsqqm4EBGwEzkXh74Li1gY=;
 b=Jy3N9t/mPvbzOgka6xmDvX8MTRmyFOobztz3kFXEBrN9MTpLjxSzy0vH
 Fd3elnjxw1Odap6Di31gsW4y8VyYwGlP6OvwY8bVabKkhy4dR1HUkgXaU
 LgfcheedE4/xGjEMjWy370ksqYPUNS3/9Jjj/5XqZhpMnwGTvTIs3FRBl
 6JB6IG56Fz92gBA3JgKxId0W7jPqVz+cbkSozRxNb6t1E/d59N/v44WLw
 OVhJlE8KkV32J83mwqyYpeLA/ktSEHVvOEsTdcprZDtIPFwWM+vU1AgCs
 iNqKp8P6ikmigXul4m2ZS04pCd1rm+rksZEQrBP3NICQyKozZDnMEvQTU g==;
X-CSE-ConnectionGUID: GKr4mQDsRb64BckPY7XKLw==
X-CSE-MsgGUID: QfwQMMFkRzu6IzvGE3Fnrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77791959"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="77791959"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 04:04:48 -0700
X-CSE-ConnectionGUID: ErLgHtNyQUCuihywGbgHRw==
X-CSE-MsgGUID: w3SJTsX4T6OWpWY2XqvzLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="232469833"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 04:04:47 -0700
Date: Thu, 23 Apr 2026 13:04:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Maslak <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com
Subject: Re: [PATCH 01/10] lib/intel/genxml: Add genxml generators, headers,
 and build integration
Message-ID: <20260423110444.ckdkq6rtk5cr4ipm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Maslak <jan.maslak@intel.com>, igt-dev@lists.freedesktop.org,
 zbigniew.kempczynski@intel.com
References: <20260415220720.1594414-1-jan.maslak@intel.com>
 <20260415220720.1594414-2-jan.maslak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260415220720.1594414-2-jan.maslak@intel.com>
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

Hi Jan,
On 2026-04-16 at 00:07:11 +0200, Jan Maslak wrote:
> Currently IGT uses raw intel_bb_out() calls for setting up the render /
> compute pipelines. Fields are set by shifting and OR-ing hand-computed
> constants, with field names and bit positions hardcoded and sometimes
> explained in comments. A lot of code has branching based on generations,
> making pipeline setup more complex as the new generations come in.
> 
> Meanwhile Mesa uses a system called genxml in which XML files describe GPU
> commands, state objects, enums, and registers - specifying the field layout
> down to individual bits. A Python generator then produces C headers with
> typed structs, pack functions, and named constants for each command/state.
> 
> By bringing genxml to IGT, we can achieve a more maintainable and less
> error-prone codebase. Instead of manually calculating bit positions and
> creating complex branching logic, we can fill out the structs generated
> from XML descriptions, and the packing functions will handle the bit
> manipulation automatically.
> 
> Import gen_pack_header.py and intel_genxml.py from Mesa (MIT-licensed, Mesa
> commit 3a62dc0218d3). Add gen_decode_header.py written for IGT.
> Add igt_genxml.h, igt_genxml_defs.h, and igt_genxml_decode.h written for IGT.
> Wire everything into the Meson build in lib/meson.build.
> 
> gen_pack_header.py produces type-safe pack and emit functions for every
> command, struct, and register defined in the XML.  Callers fill a typed
> C struct and call the generated pack function; the generator handles all
> bit-field packing and relocation recording.
> 
> gen_decode_header.py (new, IGT-only) produces decoders that identify a
> command from its opcode and print each decoded field's name and value,
> including structs and registers embedded within commands.
> 
> IGT-specific changes to gen_pack_header.py over the upstream Mesa version:
> 
>  - C90 compliance: block-scope each dword's local variable declarations in
>    the generated pack functions.
>  - Baseline deduplication: when a platform's layout exactly matches any older
>    generation the item is omitted entirely - no #define aliases are emitted.
>    A comment names the oldest generation that first defined that layout so
>    the definition can be found in one grep.  Upstream Mesa has no
>    deduplication; this keeps the generated headers free of noise as the
>    number of platform variants grows.
> 
> The Meson rules build pack and decode headers for gen9 through xe3p covering
> the render, blitter, and compute engines.  No generated files are committed
> to the source tree.
> 
> See individual file headers for per-file copyright notices.
> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>  lib/intel/genxml/gen_decode_header.py | 487 ++++++++++++++++
>  lib/intel/genxml/gen_pack_header.py   | 799 ++++++++++++++++++++++++++
>  lib/intel/genxml/igt_genxml.h         | 112 ++++
>  lib/intel/genxml/igt_genxml_decode.h  |  60 ++
>  lib/intel/genxml/igt_genxml_defs.h    | 335 +++++++++++
>  lib/intel/genxml/intel_genxml.py      | 553 ++++++++++++++++++
>  lib/intel/genxml/util.py              |  39 ++
>  lib/meson.build                       |  51 +-
>  8 files changed, 2435 insertions(+), 1 deletion(-)
>  create mode 100644 lib/intel/genxml/gen_decode_header.py
>  create mode 100644 lib/intel/genxml/gen_pack_header.py
>  create mode 100644 lib/intel/genxml/igt_genxml.h
>  create mode 100644 lib/intel/genxml/igt_genxml_decode.h
>  create mode 100644 lib/intel/genxml/igt_genxml_defs.h
>  create mode 100644 lib/intel/genxml/intel_genxml.py
>  create mode 100644 lib/intel/genxml/util.py
> 
> diff --git a/lib/intel/genxml/gen_decode_header.py b/lib/intel/genxml/gen_decode_header.py
> new file mode 100644
> index 000000000..170d2f60f
> --- /dev/null
> +++ b/lib/intel/genxml/gen_decode_header.py
> @@ -0,0 +1,487 @@
> +#encoding=utf-8
> +#
> +# Copyright (C) 2025 Intel Corporation
> +#
> +# Permission is hereby granted, free of charge, to any person obtaining a

Please replace this text with 'SPDX-License-Identifier: MIT' before
the copyright, unless it is a direct copy from other open-source
project.

If you created other python programs or C headers, also place SPDX
there instead of verbatim text.

Regards,
Kamil


> +# copy of this software and associated documentation files (the "Software"),
> +# to deal in the Software without restriction, including without limitation
> +# the rights to use, copy, modify, merge, publish, distribute, sublicense,
> +# and/or sell copies of the Software, and to permit persons to whom the
> +# Software is furnished to do so, subject to the following conditions:
> +#
> +# The above copyright notice and this permission notice (including the next
> +# paragraph) shall be included in all copies or substantial portions of the
> +# Software.
> +#
> +# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> +# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> +# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> +# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> +# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> +# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> +# IN THE SOFTWARE.
> +#
> +
> +"""Generate batch-buffer decode/annotate headers from genxml.
> +
[cut]
