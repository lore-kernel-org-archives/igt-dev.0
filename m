Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A933DE77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 08:50:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662DC10EF45;
	Fri, 20 Dec 2024 08:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U4MrZtNq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BAC10EF3F
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 08:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734684651; x=1766220651;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pACrVUIkYjxpkhLeQH6dJMh2ce3ReBbtaMrNmJu34Mw=;
 b=U4MrZtNqsJmqEnbHAKjTYwF5uiYFwTFtDFgyL9J9Lk3+wN2MHwpgXy+D
 9FlQ2LCQ+qAESFdGkHxZ0qNOQLxZa9dKjMjU/MJ6bPoN/j3/8m5ZskpoS
 hIG6YpQ30ObOTZ1MhFpppNbETXO+D/bokjhigp+7MyenDYOtlbYpYHOsg
 uw2XHhQT5yklFt0kO/l1r478McwtXX3VzchO8GvmLzY1NyIMsU8kz1hCY
 AJbhV5+CuTNNeP5XV7shnsfkUpN7+fYteuHcciB5BCLIfQw4HeJ78Yn06
 zrPBOtg3zAVOZ8U01Kx4d4a18t5NKtpCaI8V//LtpYy4gZwhpro96B7K+ Q==;
X-CSE-ConnectionGUID: IQqKvnk8RdmvvZgzfhg97g==
X-CSE-MsgGUID: cfTiQ3yNQ0qML2EFQuFfoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="45720112"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="45720112"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 00:50:51 -0800
X-CSE-ConnectionGUID: LbZsfIhmRiyweuIyw2sBKw==
X-CSE-MsgGUID: OLT8BJ19SSSI3vFqs8YKFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103070256"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 00:50:47 -0800
Date: Fri, 20 Dec 2024 09:50:28 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Rob Clark <robdclark@chromium.org>, Ryszard Knop <ryszard.knop@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 dominik.karol.piatkowski@intel.com, himal.prasad.ghimiray@intel.com,
 katarzyna.piecielska@intel.com, luciano.coelho@intel.com,
 nirmoy.das@intel.com, stuart.summers@intel.com
Subject: Re: [PATCH i-g-t v14 resend 1/3] lib/igt_facts: Library and unit
 testing for fact tracking
Message-ID: <20241220085028.uca7cojfuilc2mfh@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Helen Koike <helen.koike@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Rob Clark <robdclark@chromium.org>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 dominik.karol.piatkowski@intel.com, himal.prasad.ghimiray@intel.com,
 katarzyna.piecielska@intel.com, luciano.coelho@intel.com,
 nirmoy.das@intel.com, stuart.summers@intel.com
References: <20241216151420.43042-1-peter.senna@linux.intel.com>
 <20241216151420.43042-2-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241216151420.43042-2-peter.senna@linux.intel.com>
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

Hi Peter,
On 2024-12-16 at 16:14:18 +0100, Peter Senna Tschudin wrote:

I am going to merge your series as those checkpatch.pl are rather
a codestyle nitpicks, also as I checked current gcc compiler makes
'bool' type behaviour correct, so it is not a blocker.

Kasia I am expecting that we will followup this with code style
fixes, please help and find someone to do it.

Regards,
Kamil

> Introduces the igt_facts library, designed to collect and track system
> and GPU-related facts during test execution. It provides insights into
> the system state before and after running tests and highlights changes.
> 
> Facts collected:
> 
>  - GPUs on PCI bus: 'hardware PCI bus' 'GPU name'
>  - Associations between PCI GPU and DRM card: 'PCI bus': 'card number'
>  - Kernel taints: 'true' or 'false'
>  - GPU kernel modules loaded: 'driver name'
> 
> To use igt_facts, include "igt_facts.h", then:
> 
>  1. Add a call to igt_facts_lists_init()
>  2. Add calls to igt_facts(last_test) before each test and after
>     running the last test.
> 
> The argument should be NULL or a string with the name of the test:
> 
>  - The first call to igt_facts() will print the facts present
>    "before any test"
>  - Subsequent calls will print only changes to facts if any.
> 
> Here is an example output of using igt_facts when integrated
> with igt_runner. Lines containing '[FACT ' were printed by calls
> to igt_facts():
> 
>  [229.606139] [FACT before any test] new: hardware.pci.gpu_at_addr.0000:03:00.0: 8086:e20b Intel Battlemage (Gen20)
>  [229.606305] [FACT before any test] new: kernel.is_tainted.taint_warn: true
>  [229.608841] [001/267] (600s left) xe_module_load (load)
>  [229.641224] Starting subtest: load
>  [230.613328] Subtest load: SUCCESS (0.973s)
>  [230.678868] [FACT xe_module_load (load)] new: hardware.pci.drm_card_at_addr.0000:03:00.0: card0
>  [230.680801] [FACT xe_module_load (load)] new: kernel.kmod_is_loaded.xe: true
> 
> Unit testing for igt_facts is located at lib/tests/igt_facts.c. Run it
> locally with `meson test -C build`.
> 
> CC: Helen Koike <helen.koike@collabora.com>
> CC: Jani Nikula <jani.nikula@linux.intel.com>
> CC: Jani Saarinen <jani.saarinen@intel.com>
> CC: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> CC: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
> CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> CC: Maíra Canal <mcanal@igalia.com>
> CC: Melissa Wen <mwen@igalia.com>
> CC: Petri Latvala <adrinael@adrinael.net>
> CC: Rob Clark <robdclark@chromium.org>
> CC: Ryszard Knop <ryszard.knop@intel.com>
> CC: Swati Sharma <swati2.sharma@intel.com>
> CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> CC: dominik.karol.piatkowski@intel.com
> CC: himal.prasad.ghimiray@intel.com
> CC: katarzyna.piecielska@intel.com
> CC: luciano.coelho@intel.com
> CC: nirmoy.das@intel.com
> CC: stuart.summers@intel.com
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Reviewed-by: Ryszard Knop <ryszard.knop@intel.com>
> Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  lib/igt_facts.c       | 779 ++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_facts.h       |  47 +++
>  lib/meson.build       |   1 +
>  lib/tests/igt_facts.c |  18 +
>  lib/tests/meson.build |   1 +
>  5 files changed, 846 insertions(+)
>  create mode 100644 lib/igt_facts.c
>  create mode 100644 lib/igt_facts.h
>  create mode 100644 lib/tests/igt_facts.c
> 
> diff --git a/lib/igt_facts.c b/lib/igt_facts.c
> new file mode 100644
> index 000000000..2e04a7c86
> --- /dev/null
> +++ b/lib/igt_facts.c
> @@ -0,0 +1,779 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
...cut...

