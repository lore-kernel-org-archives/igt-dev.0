Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946ABFB518C
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 09:23:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C9310E607;
	Wed,  8 Apr 2026 09:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HSw0jR/v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CEE10E5F5
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 09:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775640230; x=1807176230;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=peIiUiRny4EIEr4eAgeQH2drcXjs/4jGk0xM03kja5Q=;
 b=HSw0jR/vWBqW8dgtL93+00avcCuHot93ONrfrFCKHNp+NXRj2wV8Hswu
 fjVQ1+7ytlhycOytwcDaQaXd8IeGFD/XVCvlSRBwjdN2uDHeG3xm5m2u1
 GqhCcZgK8mBQDHE/Ke91+A7k+uAQ5JfijhEOKSVQgUeAmk+NaHpexnVOK
 RN85oGpmmLp52CZDA8TJLr5VJMwCsQrT1Wx0+SXcLtZzRy37ZvcScNl/z
 MhiWexdv70FIfDfr4i8t5ftZtk6cfdPZ3vh4pOMoxDlTHKnUlyWYqGDbf
 D56m9lmRfoR2269lYe03K0ROgk4GzYvabcrP2rtCJabya+ZisMLGf92V+ g==;
X-CSE-ConnectionGUID: zAd7D3PsSkiYgkUKF2GROA==
X-CSE-MsgGUID: 0V1miN33T2KmXsuISaAQJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76519200"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="76519200"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 02:23:49 -0700
X-CSE-ConnectionGUID: KRDNHZlrTCWXEYc93czX9Q==
X-CSE-MsgGUID: pwmoYWIARZ+UsdspNvOPEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="232791022"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 02:23:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jan Maslak <jan.maslak@intel.com>, igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, Jan Maslak <jan.maslak@intel.com>
Subject: Re: [PATCH 0/3] lib/genxml: Introduce Mesa genxml infrastructure to
 IGT
In-Reply-To: <20260407132620.1397340-1-jan.maslak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260407132620.1397340-1-jan.maslak@intel.com>
Date: Wed, 08 Apr 2026 12:23:44 +0300
Message-ID: <ad51718ea34c50b7e1c4c889bc6ac71d5c65516a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 07 Apr 2026, Jan Maslak <jan.maslak@intel.com> wrote:
> This series brings Mesa's hardware XML command/state definitions and
> gen_pack_header.py code generator into IGT, adds a new IGT-written
> batch buffer decoder (gen_decode_header.py), and converts rendercopy_gen9
> to use the generated pack headers.

The cover letter and the commit messages contain a lot of the "What?"
but there not much in terms of the "Why?" here.

I can make assumptions, but the rationale is something that should be
spelled out in the commit messages.

BR,
Jani.

>
> Patch 1 imports the XML definitions and generators. gen_pack_header.py
> is taken from Mesa with C90 compliance fixes and a new baseline
> deduplication mechanism - when a platform's command layout matches any
> older generation exactly, the item is omitted entirely.
> gen_decode_header.py is a new IGT-only file that generates per-platform
> decoders for instructions, structs, and registers.
>
> Patch 2 converts rendercopy_gen9.c to use the generated pack headers,
> replacing hand-written struct assignments and intel_bb_out() calls with
> igt_genxml_emit and igt_genxml_pack_state.
>
> Patch 3 adds an opt-in annotated batch dump to intel_bb_dump(): when
> IGT_BB_ANNOTATE=1 is set a companion .annotated file is written alongside
> the raw hex dump, decoding each command's field names and values.
>
> Tested on LNL and DG2 (xe_render_copy render-square, render-full;
> xe_intel_bb render) and TGL (gem_render_copy_redux; api_intel_bb).
>
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
>
> Jan Maslak (3):
>   lib/genxml: Import genxml definitions and generators from Mesa
>   lib/rendercopy: Convert rendercopy_gen9 to use genxml pack headers
>   lib: Add genxml annotated batch buffer decode
>
>  lib/genxml/gen110.xml           | 3358 +++++++++++++++++++++++++
>  lib/genxml/gen120.xml           | 2432 ++++++++++++++++++
>  lib/genxml/gen125.xml           | 2628 +++++++++++++++++++
>  lib/genxml/gen40.xml            | 1012 ++++++++
>  lib/genxml/gen45.xml            |  507 ++++
>  lib/genxml/gen50.xml            |  648 +++++
>  lib/genxml/gen60.xml            | 2606 +++++++++++++++++++
>  lib/genxml/gen70.xml            | 3067 ++++++++++++++++++++++
>  lib/genxml/gen75.xml            | 2424 ++++++++++++++++++
>  lib/genxml/gen80.xml            | 2993 ++++++++++++++++++++++
>  lib/genxml/gen90.xml            | 4192 +++++++++++++++++++++++++++++++
>  lib/genxml/gen_decode_header.py |  487 ++++
>  lib/genxml/gen_pack_header.py   |  799 ++++++
>  lib/genxml/igt_genxml.h         |  112 +
>  lib/genxml/igt_genxml_decode.h  |   60 +
>  lib/genxml/igt_genxml_defs.h    |  335 +++
>  lib/genxml/intel_genxml.py      |  553 ++++
>  lib/genxml/util.py              |   39 +
>  lib/genxml/xe2.xml              | 1969 +++++++++++++++
>  lib/genxml/xe3.xml              |  816 ++++++
>  lib/genxml/xe3p.xml             |    4 +
>  lib/intel_batchbuffer.c         |   32 +-
>  lib/meson.build                 |   65 +-
>  lib/rendercopy_gen9.c           | 1117 ++++----
>  24 files changed, 31687 insertions(+), 568 deletions(-)
>  create mode 100644 lib/genxml/gen110.xml
>  create mode 100644 lib/genxml/gen120.xml
>  create mode 100644 lib/genxml/gen125.xml
>  create mode 100644 lib/genxml/gen40.xml
>  create mode 100644 lib/genxml/gen45.xml
>  create mode 100644 lib/genxml/gen50.xml
>  create mode 100644 lib/genxml/gen60.xml
>  create mode 100644 lib/genxml/gen70.xml
>  create mode 100644 lib/genxml/gen75.xml
>  create mode 100644 lib/genxml/gen80.xml
>  create mode 100644 lib/genxml/gen90.xml
>  create mode 100644 lib/genxml/gen_decode_header.py
>  create mode 100644 lib/genxml/gen_pack_header.py
>  create mode 100644 lib/genxml/igt_genxml.h
>  create mode 100644 lib/genxml/igt_genxml_decode.h
>  create mode 100644 lib/genxml/igt_genxml_defs.h
>  create mode 100644 lib/genxml/intel_genxml.py
>  create mode 100644 lib/genxml/util.py
>  create mode 100644 lib/genxml/xe2.xml
>  create mode 100644 lib/genxml/xe3.xml
>  create mode 100644 lib/genxml/xe3p.xml

-- 
Jani Nikula, Intel
