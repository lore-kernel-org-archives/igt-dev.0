Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1643FCF8855
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 13:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A5F10E067;
	Thu, 20 Nov 2025 13:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WlzADbZp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F5A10E067
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 13:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763644681; x=1795180681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zUzHFS2Y81bIrzcOO/v8p2j7e0VfcLgE9i5gm4Ska4w=;
 b=WlzADbZp8EqcSnLwZDfn22rb4CnH5cDHAaOPqaOcFaJIlz0azlYEzVKb
 exNQWBll+nyNRYt5h4jhAfNh7TD3EdzfemNuY8nOClFaCooa+jQRgwXMo
 RkX3Ft2+VQrXGtLrs2Om53xj9ZQHFlwF0frNuM5L0cGKVmjvu96d0sZrS
 8+CJUoMATSq3JARtgrtU+/9NukvXSf3FEOo39FSb/IvuhfHc+mlxE9wlQ
 efs9xkYFXQA2XaSD528NZKli+4I1V7irV/PnDW3MaEK+xVHzbd4eemCjJ
 BIfAlnCXhq0fkETOlknGsmCAcwoRorBEG9hjBXjbBoocYavKK2sRNPu2E g==;
X-CSE-ConnectionGUID: 32ugM22vSle/D7vsI4DM+g==
X-CSE-MsgGUID: 6Veo7JyCQe6i2KwBwSdpDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76321858"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="76321858"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 05:18:01 -0800
X-CSE-ConnectionGUID: fMkw0JsIT1iVwwqMYlFDZA==
X-CSE-MsgGUID: SzZK5Li8TJKBGOaKmleLhw==
X-ExtLoop1: 1
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.18])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 05:18:00 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= Xe.CI.Full: failure for tests/intel/gem_eio:
 Avoid skips in stress subtests
Date: Thu, 20 Nov 2025 14:17:57 +0100
Message-ID: <3249864.TQGk6oTFT5@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <176356796211.8491.7562881726781317166@a3b018990fe9>
References: <20251119111205.1297907-5-janusz.krzysztofik@linux.intel.com>
 <176356796211.8491.7562881726781317166@a3b018990fe9>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hi I915-ci-infra@lists.freedesktop.org,

On Wednesday, 19 November 2025 16:59:22 CET Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_eio: Avoid skips in stress subtests
> URL   : https://patchwork.freedesktop.org/series/157768/
> State : failure
> 
> == Summary ==
> 
> ERROR: The runconfig 'XEIGT_8632_FULL' does not exist in the database

It looks like your service is broken, what should I do to get green results 
for my series?

Thanks,
Janusz

> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14081/index.html
> 




