Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF55FE77182
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 16:21:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5341510EE2F;
	Thu, 12 Dec 2024 16:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gbth/Qnr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F0310EE2F
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 16:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734020515; x=1765556515;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0sMZ3zA5o3sOMDXsGdI9rir0UBxdbsYzq0y++kNcRyA=;
 b=gbth/QnrEfshRr/+5rgeK7pgn5BucSzCueErVOJxzXJKMdRM4CyUt8d9
 WJPn/4rcX6K34z1x/xW4Riz2jE13dDTmvh5+LmopXrVKfhPobLETCdzQZ
 pur56IYYSA5Di1erEtwDiRf1lzRSK6No/tkoZ3s2fwMIh7SAWknxfN8jv
 lYU/DdxG/5Trs7Pjvuztkt5VqivhMlqNjKNc0ZlCd7GIf1S5wBZn4g9Hp
 03bjIkq5p5pRbNeTdz0GALG07yKAWH2tHjAncDcWawcDd9SLwJxPlf6iy
 QIeVjPuGgUAJteblyZuxucfAy4T+Zylh1v2PxhRn4NNyYvcWUhLF3el3H w==;
X-CSE-ConnectionGUID: cEFHQnoKTKKbLmiWqWl8Tw==
X-CSE-MsgGUID: jm5qapb0S8GSPPuiqxTQtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38378596"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="38378596"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 08:20:53 -0800
X-CSE-ConnectionGUID: UDn/GC3aQu+/+Xv9l/mrXQ==
X-CSE-MsgGUID: Ytbkxv87SIaga19TH1Qvuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133648517"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 08:20:46 -0800
Date: Thu, 12 Dec 2024 17:20:42 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Rob Clark <robdclark@chromium.org>, Ryszard Knop <ryszard.knop@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 dominik.karol.piatkowski@intel.com, himal.prasad.ghimiray@intel.com,
 katarzyna.piecielska@intel.com, luciano.coelho@intel.com,
 nirmoy.das@intel.com, stuart.summers@intel.com
Subject: Re: [PATCH i-g-t v12 2/3] tools/lsfacts: Add tool for listing facts
Message-ID: <20241212162042.l76zqcsemy3mb6vo@zkempczy-mobl2>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <20241212071527.64595-1-peter.senna@linux.intel.com>
 <20241212071527.64595-3-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241212071527.64595-3-peter.senna@linux.intel.com>
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

On Thu, Dec 12, 2024 at 08:15:26AM +0100, Peter Senna Tschudin wrote:
> Report the facts that are present on the system or 'No facts found...'
> if no facts are detected.
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
> CC: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
> CC: katarzyna.piecielska@intel.com
> CC: luciano.coelho@intel.com
> CC: nirmoy.das@intel.com
> CC: stuart.summers@intel.com
> Reviewed-by: Ryszard Knop <ryszard.knop@intel.com>
> Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  tools/lsfacts.c   | 30 ++++++++++++++++++++++++++++++
>  tools/meson.build |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 tools/lsfacts.c
> 
> diff --git a/tools/lsfacts.c b/tools/lsfacts.c
> new file mode 100644
> index 000000000..efdec5da4
> --- /dev/null
> +++ b/tools/lsfacts.c
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include "igt.h"
> +#include "igt_facts.h"
> +
> +/**
> + * SECTION:lsfacts
> + * @short_description: lsfacts
> + * @title: lsfacts
> + * @include: lsfacts.c
> + *
> + * # lsfacts
> + *
> + * Scan for igt-facts and print them on screen. Indicate if no facts are found.
> + */
> +int main(int argc, char *argv[])
> +{
> +	/* enable facts */
> +	igt_facts_config.enabled = true;

Drop this external config and call igt_facts() unconditionally here.

With this:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +
> +	igt_facts_lists_init();
> +
> +	igt_facts("lsfacts");
> +
> +	if (igt_facts_are_all_lists_empty())
> +		igt_info("No facts found...\n");
> +}
> diff --git a/tools/meson.build b/tools/meson.build
> index 38b04851c..511aec69e 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -42,6 +42,7 @@ tools_progs = [
>  	'intel_gem_info',
>  	'intel_gvtg_test',
>  	'dpcd_reg',
> +	'lsfacts',
>  	'lsgpu',
>  	'power',
>  ]
> -- 
> 2.34.1
> 
