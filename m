Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F460C02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 17:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C667410E29A;
	Thu, 23 Jan 2025 17:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lV3SQ7IQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5980110E29A
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 17:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737653836; x=1769189836;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KsSDYnmfTptCvbLgfQlF9Mdw3n3VkXCGsJAMvLwPAog=;
 b=lV3SQ7IQn18x4FoMCXLtNjQfPrnP09H0XW2ip8UczLwe1qmGke4PNici
 NEa0JcCdsaNr4CQ0VZSi71aLF5WohN+UvWo6R+BIIvjAv137CIBOZ0pDs
 /6W5BME8AapIyZgrkLrCMZSifBJ1aORBn382xN8arfTUqgev1eqVEqFiV
 Mhq+bA7ZVLNAmqxfQmG8CxCXMtdqdE/r32pruUVFeMQ+A6HdGHTeb1mA5
 NicFz7429cxDf4rtD+S5m6itjTIdJ3r/AJmOJopKcXKgqvN22QZ2/DR20
 UWOyZkwYH/dfjiWKgAdHEqjAvwQznzTI2B5ouoyThnFO4Alsye0vY7P81 A==;
X-CSE-ConnectionGUID: QXppgiu8RcO2jaxNPSVwcQ==
X-CSE-MsgGUID: 7W1VHldrT0iDxoZW/dGEvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49586128"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="49586128"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 09:37:16 -0800
X-CSE-ConnectionGUID: sLrxhOHlR8G1Zvvw2nAqmA==
X-CSE-MsgGUID: jEhixq7KSGyX4lsJZ1FNHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111564465"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 09:37:15 -0800
Date: Thu, 23 Jan 2025 11:37:09 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 2/3] lib/igt_device_scan: change device list
 variable visibility
Message-ID: <aoypfstn5hra573ojfwosbnlajddzlyge4nuydc2pfjlzv2y7z@syje22lbo4uv>
References: <20250123092210.48249-1-zbigniew.kempczynski@intel.com>
 <20250123092210.48249-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250123092210.48249-3-zbigniew.kempczynski@intel.com>
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

On Thu, Jan 23, 2025 at 10:22:09AM +0100, Zbigniew Kempczyński wrote:
>In commit: 2e8f3e06fb (tests/xe_evict|exec_threads: Use fd reopen
>to avoid corrupting global data) I simply changed tests which
>corrupted device list global variable. i915 didn't use opening
>devices in multithreaded tests but this changed with xe.
>
>Device scan is now unconditional so we may change device list
>variable visibility to TLS. With this reverting of above commit
>should be safe (but I'm not sure is it worth to do this).
>
>Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>---
> lib/igt_device_scan.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
>index 304cfa17a8..c1b0e0e5ff 100644
>--- a/lib/igt_device_scan.c
>+++ b/lib/igt_device_scan.c
>@@ -247,7 +247,7 @@ struct igt_device {
> };
>
> /* Scanned devices */
>-static struct {
>+static __thread struct {
> 	struct igt_list_head all;
> 	struct igt_list_head filtered;
> 	bool devs_scanned;
>-- 
>2.34.1
>
