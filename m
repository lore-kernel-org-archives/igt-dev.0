Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C2B10F9958
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 15:45:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8B510E68D;
	Wed,  8 Apr 2026 15:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OgNEev99";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1CD10E68D
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 15:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775663103; x=1807199103;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vALyRTZ6Gpab5enVMumEc5yoY5ExwMxuqJej2xNrUu0=;
 b=OgNEev99w3h2gU9FieQKT9FfzYY6cN5mbALUT89OaYKMSObcRr7yBwyw
 KfyFAp6YPGQ/1sDx6rJAGdFk4A2xjARuqwrt/0959G+JG83lpF+Mv83BO
 8GNHC8A/QJD5EvJx71Gjd2QnGnrgDFbJli9QD251rUGsAJC1RuF0hfMkP
 +6FMXLJBOPmYGh/XKdfV67qvvwVomWo5JI9DepDto43a4GUp09sZF069p
 G4iXVtBxpJokAcgbWayoFl1nap6F5aW7fosjZgRbV/UFJeJtXq3kPY3iX
 gqswvUJhGYDBTwlmx64kBGevQg9Y7e8FWynh8vK5CyU7uudFWJBfE0EGi w==;
X-CSE-ConnectionGUID: QXQuTP72TFaiEUcg9JLlJQ==
X-CSE-MsgGUID: Bpq3WaI7TMy719VcRog3YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="102105228"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="102105228"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 08:45:03 -0700
X-CSE-ConnectionGUID: 0XpCkDL5QoWt3QrVGIoUuw==
X-CSE-MsgGUID: zgUm2l8QRmOpnq+8DWQ2pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="228438458"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:45:02 -0700
Date: Wed, 8 Apr 2026 17:44:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Maslak <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com
Subject: Re: [PATCH 1/3] lib/genxml: Import genxml definitions and generators
 from Mesa
Message-ID: <20260408154459.nxwp5os5t3b6rdnh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Maslak <jan.maslak@intel.com>, igt-dev@lists.freedesktop.org,
 zbigniew.kempczynski@intel.com
References: <20260407132620.1397340-1-jan.maslak@intel.com>
 <20260407132620.1397340-2-jan.maslak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260407132620.1397340-2-jan.maslak@intel.com>
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
On 2026-04-07 at 15:26:18 +0200, Jan Maslak wrote:
> Import the hardware command/state XML definitions, gen_pack_header.py, and
> intel_genxml.py from Mesa (MIT-licensed, Mesa commit 3a62dc0218d3).  Add a
> new gen_decode_header.py written for IGT.  The generators produce per-platform
> *_pack.h and *_decode.h headers at build time into the build directory - no
> generated files are committed to the source tree.  Meson custom_target rules
> build headers for gen9 through xe3p covering the render, blitter, and compute
> engines.
> 
> gen_pack_header.py produces type-safe pack and emit functions for every
> command, struct, and register in the XML.  Callers fill a typed struct and
> call the pack function; the generator handles all bit-field packing.
> 
> gen_decode_header.py (new, IGT-only) produces decoders that identify a command
> from its opcode and print each decoded field's name and value.  Also decodes
> structs and registers embedded within commands.
> 
> IGT-specific changes to gen_pack_header.py over the upstream Mesa version:
> 
>  - C90 compliance: block-scope each dword's local variable declarations in the
>    generated pack functions.
>  - Baseline deduplication: when a platform's layout exactly matches any older
>    generation, the item is omitted entirely - no #define aliases are emitted.
>    A comment names the oldest generation that first defined that layout so
>    the definition can be found in one grep.  Upstream Mesa has no
>    deduplication; this keeps the generated headers free of noise as the
>    number of platform variants grows.
> 
> See individual file headers for per-file copyright notices.
> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>  lib/genxml/gen110.xml           | 3358 +++++++++++++++++++++++++

All this imho should be placed in lib/intel/genxml
as this is Intel specific. Could you also split this into
commits under 1MB each? For example, two commits for XMLs
and third for python scripts?

Also, as Jani noted, please describe 'Why?' part in one of commits,
preferably python one so it will stay in git history.

Regards,
Kamil

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
>  lib/meson.build                 |   65 +-
>  22 files changed, 31105 insertions(+), 1 deletion(-)
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
> 
[cut]
