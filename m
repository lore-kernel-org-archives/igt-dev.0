Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F8B606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 09:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jY4BeqEE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0466810EDDB;
	Mon, 16 Nov 2026 09:41:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8BB10EDDB
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 09:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794822017; x=1826358017;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=tk1UUwQOr2xZ7JgQw8QXtTNqT7m6Mp9uVER0KFfGZUU=;
 b=jY4BeqEE/vn06ojWvjIOjl/C1L2TbJi/PvyJF7DrRc3FdFYKAIPcxGoG
 SpW8F1VzjVmB8C6xLEfbBGFurZVKVUP75db7xB+JRrEqp6Oidoq2caYXs
 rZ9+l8NwwKYMEB2W6TVALOsmn9H3roRGUzcAiUqQg55WEpkndEy6Fsu9q
 ppviD4zocs9RO56gfQHzejWn1TEl8BKOL6lXyeXAc7pIsnqXQj8OF7uMm
 1i2Ll4RLyo/Aj1JBE2Br+s8eKS99p/Vz8h6jV0IOgThJZw0PdD4vbh/oJ
 YEd+Je3cKSJdoTPrHxdyTIjG+YlT6BlzFaRTTvcpwGqCRDr5LQGw+KS0k w==;
X-CSE-ConnectionGUID: zxRKq0wtQYqs5eACUhz9bg==
X-CSE-MsgGUID: jPW8fTVgQteWwLu+RY7a4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3405072"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3405072"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:40:16 -0800
X-CSE-ConnectionGUID: KlNjJ7wFRH+GsRicKBCtzQ==
X-CSE-MsgGUID: ked/DaMlT3qxB78sldKCBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9830080"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.117])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:40:15 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Gil Dekel <gildekel@google.com>, igt-dev@lists.freedesktop.org
Cc: Gil Dekel <gildekel@google.com>, Swati Sharma <swati2.sharma@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Mark Yacoub <markyacoub@google.com>,
 kunal1.joshi@intel.com
Subject: Re: [PATCH i-g-t 0/3] lib/igt_hdr: Find HDR in DisplayID EDIDs
In-Reply-To: <20261114222911.1405626-1-gildekel@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261114222911.1405626-1-gildekel@google.com>
Date: Mon, 16 Nov 2026 11:40:12 +0200
Message-ID: <7d0886fd698760ab0b2163f6853b64f76199d4ee@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 14 Nov 2026, Gil Dekel <gildekel@google.com> wrote:
> igt_is_panel_hdr() only looks in CTA-861 extensions. eDP panels that
> describe HDR inside a DisplayID extension are therefore treated as SDR,
> and kms_hdr runs invalid-hdr on them, which then fails. Patch 1 splits
> the EDID parser out so it can be tested on the host, bounds it by the
> blob size, and adds lib/tests/igt_hdr. Patch 2 also walks the CTA data
> blocks inside DisplayID extensions. Patch 3 makes invalid-hdr read only
> the kernel log written by its own commit.

I suggested using libdisplay-info in IGT in April [1]. Has anything
happened in that front?

The more EDID parsing gets added to IGT, the harder it will be to
migrate, and the cost of maintaining the local parser increases.

BR,
Jani.


[1] https://lore.kernel.org/r/57222f9789fda352ed26606c1f80e35fcdeb3d37@intel.com


>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Mark Yacoub <markyacoub@google.com>
>
> Gil Dekel (3):
>   lib/igt_hdr: Add a testable igt_is_edid_hdr()
>   lib/igt_hdr: Parse DisplayID CTA data blocks
>   tests/kms_hdr: Use /dev/kmsg in invalid-hdr
>
>  lib/igt_hdr.c         | 147 ++++++++++++++++++++++++++++++++----------
>  lib/igt_hdr.h         |   1 +
>  lib/tests/igt_hdr.c   | 136 ++++++++++++++++++++++++++++++++++++++
>  lib/tests/meson.build |   1 +
>  tests/kms_hdr.c       |  49 +++++++++++++-
>  5 files changed, 300 insertions(+), 34 deletions(-)
>  create mode 100644 lib/tests/igt_hdr.c

-- 
Jani Nikula, Intel
