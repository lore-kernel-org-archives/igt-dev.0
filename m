Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B377C83030
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 12:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49E010E431;
	Mon, 30 Jun 2025 12:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cd3ocATS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C880510E431
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 12:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751286586; x=1782822586;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Bh24tCNNwW9m3+0cOaeF68O465GoYPasoGw3rlURc4E=;
 b=Cd3ocATSZyKAUsuDYFce5+t0Fo3vxuE0XYZzzUWnQjbnHPDLQL/Ennln
 3rJ/ChHFpCMxHEfEKtMSL6XKQbhZna3mCFenPjZg5RoQ9Saw/H8sDrOsC
 5pD2+yOfjT+4yTHGts8ELouO1P0q41h8svjFn5/4b/tW9gFyk6mI96iuI
 qzRRjAy/RqRbXjDn9KJwcXg83I2y3UEQu8HWuppoDoazdq7F25Ms+tC0x
 GCkgX1TQjunrS4wqhoOKZ+zDF1gM8aoqSSTfsmI0rFQ+LHH/XdrZ4wb9I
 55JCXobCopHvBn1gCqSu6HVi+21eycDcEfdkdB9CZMTdFoW09ciW0wJYn A==;
X-CSE-ConnectionGUID: BQN3AWzSTK+pF/CKQ7MVuw==
X-CSE-MsgGUID: /YXHsF+hQhm96aSbyL471g==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="57288703"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="57288703"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 05:29:46 -0700
X-CSE-ConnectionGUID: ENSRJrPOSUObEjK8QMhwUg==
X-CSE-MsgGUID: RgqDDnh/R6eS+VQHLoJyEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="153631042"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 05:29:45 -0700
Date: Mon, 30 Jun 2025 14:29:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, david.e.box@linux.intel.com
Subject: Re: [PATCH] test/intel/xe_pmt: Add testing for BMG crashlog
Message-ID: <20250630122942.n3u5vsttysdknkxp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, david.e.box@linux.intel.com
References: <20250627204846.521691-1-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250627204846.521691-1-michael.j.ruhl@intel.com>
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

Hi Michael,
On 2025-06-27 at 16:48:42 -0400, Michael J. Ruhl wrote:
> The BMG devices has the PMT crashlog feature. If the devices present
> is a BMG, test PMT api.
> 
> NOTE: the testing order is not flexible and must be done in
> the currently specified order.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  tests/intel/xe_pmt.c | 561 +++++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build    |   1 +
>  2 files changed, 562 insertions(+)
>  create mode 100644 tests/intel/xe_pmt.c
> 
> diff --git a/tests/intel/xe_pmt.c b/tests/intel/xe_pmt.c
> new file mode 100644
> index 000000000..21a2e74e7
> --- /dev/null
> +++ b/tests/intel/xe_pmt.c
> @@ -0,0 +1,561 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +/**
> + * TEST: Verify BMG PMT files operations

Is it PMT == Platform Monitoring Technology
?

Regards,
Kamil

...cut...
