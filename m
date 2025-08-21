Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCC0CA0EDC
	for <igt-dev@archiver.kernel.org>; Thu, 21 Aug 2025 06:28:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603C010E2D2;
	Thu, 21 Aug 2025 06:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VJcgAvz1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD9010E2D2
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Aug 2025 06:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755757702; x=1787293702;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qxEc7lnsi1IdxX8nsRW1sJh57HCQacx2uDOGiv8ZDOM=;
 b=VJcgAvz1m2rudS5fbW/A63l0Y1bQABpnIIuK/DLBeaBlU5DcIUXVxoEL
 r0s37TyOIwowLu7W5lTn1BA9nbcWU6khLK2Rzx9QPtsN6U5BgWeNyWgJn
 NjDTq4nBhc8MJqHbRojI5KPLw+sRWVXxDymUWhpcSJG0Y1dMnKlNDn/VN
 BJ2npqNzyYVfQRScij8KC152+A0rvOUvhqKmCZPG0Rc6SVkyrdg8/yDZf
 gLwt54bX6poGavoMcqEs3mxrVYeD9AaH22/pHmg0scFrPNALYio9zRF6F
 ODmGUHhz27aLiCd2CqrgFhYBzjZ7imeXhPIa+fNuGnsxC2ijy2fbfktyE w==;
X-CSE-ConnectionGUID: uL0hJcJ3Rpaw36PRwLmHsg==
X-CSE-MsgGUID: 2pAupsi8Q7yTPPZtP9opUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="83456580"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="83456580"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 23:28:22 -0700
X-CSE-ConnectionGUID: fQwOEFE1SwGFMx2XqcNv4w==
X-CSE-MsgGUID: J7kCvTpDTsG9UYqs0tJHUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="192012274"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.177])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 23:28:19 -0700
Date: Thu, 21 Aug 2025 08:28:12 +0200
From: Pawel Sikora <pawel.sikora@linux.intel.com>
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Pawel Sikora <pawel.sikora@linux.intel.com>
Subject: Re: [i-g-t] tests/intel/xe_sriov_flr: Update Sub-category name
Message-ID: <20250821062812.xn6mxo6ri7y36ltj@pawelsik-desk>
References: <20250820164521.481669-1-jakub1.kolakowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820164521.481669-1-jakub1.kolakowski@intel.com>
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

On Wed, Aug 20, 2025 at 04:45:21PM +0000, Jakub Kolakowski wrote:
> The general guideline for naming is that given Sub-category can only
> be included in one Mega feature. Currently 'Reset tests'
> Sub-category is present both in 'SR-IOV' Mega feature and 'General
> Core features' Mega feature.
> Change 'Reset tests' name in 'SR-IOV' Mega feature to 'SR-IOV Reset
> tests'
> 
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
> Cc: Pawel Sikora <pawel.sikora@intel.com>
> ---
>  tests/intel/xe_sriov_flr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index 0c6a0c97e..fc08703c0 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -21,7 +21,7 @@
>   * TEST: xe_sriov_flr
>   * Category: Core
>   * Mega feature: SR-IOV
> - * Sub-category: Reset tests
> + * Sub-category: SR-IOV Reset tests
>   * Functionality: FLR
>   * Description: Examine behavior of SR-IOV VF FLR
>   *

LGTM, I will use it as an example on the incoming audit of
the tests documentation to improve markup fields for tests.

Clearly it deserves attention when we need to add the
'Mega feature' name as a prefix to 'Sub-category'.

Thanks for raising discussion on this and this
temporary (hopefully!) correction.

Regards,
Pawel

Reviewed-by: Pawel Sikora <pawel.sikora@intel.com>
