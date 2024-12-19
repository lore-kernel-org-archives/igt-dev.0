Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C6CE7718A
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 23:21:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF2C10E4B2;
	Thu, 19 Dec 2024 23:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kd1NSPgS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406E410E4B2
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 23:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734650477; x=1766186477;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p+5GvcparkXZBagp09wkqn+51BjbHIzcmU2jPiHG7gs=;
 b=Kd1NSPgSrMztS/KslaSHDE1qfG7D3obj07fE/fXa7nrOmK4TAyKMXTUI
 H1pxND67nkJT27IARI4XGi5z1z3PII0zM1blrUuSm8/Hk09/6NuQ3t0Hk
 PBbez4zXsQCmXuNXfGnWs9f4jCjzX9ltl/J+jbY/Nz72xRwhvu+RKIfco
 14esVZSfn3zFffmjvdy93OMQ9u9B97e+CQiCeCdWwDnExaGzJqJ1x4R3l
 uVeEILGd3yi+yqjoLXBmzTsWl1hIrYiHhib91BBCMGfUvg38qcf8dHWil
 Y/A7W/1ERjDT03Q18ldCHnqaK1qm/8qLdlB81k5owBATh8YbaEuUORXzg g==;
X-CSE-ConnectionGUID: Vpzsy2aqQhKr8xB6noDJSg==
X-CSE-MsgGUID: 8ZscyhRrSUSjFlNPxsw+Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35354535"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="35354535"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 15:21:16 -0800
X-CSE-ConnectionGUID: WKiwd3DaRf61aUsHdYm+7w==
X-CSE-MsgGUID: RZc/fMx8S0C8T9RcxowkPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="98143827"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.87])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 15:21:16 -0800
Date: Thu, 19 Dec 2024 17:21:09 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 1/3] lib/igt_kmod: fix check to confirm correct
 driver unload
Message-ID: <7wwa62ww3z2qfxh55fe4zimiqz6gocsbvpp3lp7wumv2ool2tg@ktawtwberw3b>
References: <20241219230517.2492196-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241219230517.2492196-1-daniele.ceraolospurio@intel.com>
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

On Thu, Dec 19, 2024 at 03:05:15PM -0800, Daniele Ceraolo Spurio wrote:
>The driver variable is a string, so we need to pass it in as a variable
>for the driver name instead of stringifying it.
>
>Fixes: e5edf7ea7 ("lib/igt_kmod: add support for Xe driver")
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

yeah, also got it:
https://patchwork.freedesktop.org/patch/625232/?series=141532&rev=1

"Now that xe unbind+unload logic is working, extend it to i915.
Note that there was a buggy call igt_kmod_is_loaded("driver") that would
never trigger: no point fixing that if we are dropping it though."

unfortunately that got blocked in other issues and I forgot to extract
this part

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
