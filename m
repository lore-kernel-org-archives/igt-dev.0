Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C2ECAC586
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 11:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6655B10E143;
	Mon,  8 Sep 2025 11:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="emaLh0bM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124AA10E143
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 11:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757331039; x=1788867039;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rOjRvPFYIYYTYYNWRSc1ruQ+KfKje3RwL65qpuaRSkA=;
 b=emaLh0bMJVmjeeN5yazWiqDZWwnFiAgldyK87r7JXeUhUV/thKOAr7+c
 uGxYfdaUQSHjJtb5mKXhYpDlxLAMUkeIYhKUwe1QHq6dETEj3KsoV3Vdo
 H0lOXHzCnKO8ioqG76hXsAeTXHLEowrJS3uGVZV/keW2LcIxZ36/qPEnh
 0ZOAoxb7NVg4LaNrX0kll3j22plJWuKTAkudEgz2pl3zxwUoqR+bYhVYG
 Re+qDRSnfmcDFX4dddPHElNB7+j9lJTV9aABZb2gpjxQTdN4+gtBgqhAL
 A2z720CjTtIl/wTcD1vMz0WoQiey9Nza6dEnnKL5jFvsKojdinR6M+DsU g==;
X-CSE-ConnectionGUID: 3bdZukVLQyKr3/i7uPLrEQ==
X-CSE-MsgGUID: n6kqL9x5RSOzFGuv3ZevNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59539123"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59539123"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 04:30:39 -0700
X-CSE-ConnectionGUID: KPaesImcQjGDqoDe2lQDGA==
X-CSE-MsgGUID: 7fAHerLkTeubWDgCLcDMJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="173556672"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 04:30:36 -0700
Date: Mon, 8 Sep 2025 13:30:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 zbigniew.kempczynski@intel.com, karthik.b.s@intel.com,
 Jim Shargo <jshargo@chromium.org>, Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH i-g-t v4 02/41] lib/vkms: Add minimal VKMS library and
 test device default files
Message-ID: <20250908113034.o6rfynttugchy7gz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 zbigniew.kempczynski@intel.com, karthik.b.s@intel.com,
 Jim Shargo <jshargo@chromium.org>,
 Marius Vlad <marius.vlad@collabora.com>
References: <20250807074550.6543-1-jose.exposito89@gmail.com>
 <20250807074550.6543-3-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250807074550.6543-3-jose.exposito89@gmail.com>
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

Hi José,
On 2025-08-07 at 09:45:11 +0200, José Expósito wrote:
> Create a library containing helpers for creating VKMS devices and
> configuring them dynamically using configfs.
> For the moment, add the minimal number of helpers to be able to start
> testing VKMS's configfs support: Create device, destroy device and
> destroy all devices.
> 
> Also, include the simplest possible test using those helpers (checking
> the device's default files) and the scaffolding required to generate
> the documentation.
> 
> Co-developed-by: Jim Shargo <jshargo@chromium.org>
> Signed-off-by: Jim Shargo <jshargo@chromium.org>
> Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---

Thank you all for your work, I merged this series.

Regards,
Kamil

>  lib/igt_vkms.c             | 206 +++++++++++++++++++++++++++++++++++++
>  lib/igt_vkms.h             |  27 +++++
>  lib/meson.build            |   1 +
>  meson.build                |   8 ++
>  tests/meson.build          |   2 +
>  tests/vkms/meson.build     |  13 +++
>  tests/vkms/vkms_configfs.c | 131 +++++++++++++++++++++++
>  7 files changed, 388 insertions(+)
>  create mode 100644 lib/igt_vkms.c
>  create mode 100644 lib/igt_vkms.h
>  create mode 100644 tests/vkms/meson.build
>  create mode 100644 tests/vkms/vkms_configfs.c
> 
> diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
> new file mode 100644
> index 000000000..03931d2e4
> --- /dev/null
> +++ b/lib/igt_vkms.c
> @@ -0,0 +1,206 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Google LLC.
> + * Copyright © 2023 Collabora, Ltd.
> + * Copyright © 2024-2025 Red Hat, Inc.
> + */
[cut]
