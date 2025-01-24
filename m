Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C953C02181
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jan 2025 15:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1824310E04C;
	Fri, 24 Jan 2025 15:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X+3TfsLS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648DA10E04C
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2025 15:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737731090; x=1769267090;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Z21OdgHnVEzRqicCGC5+5WRc9DXxBqHdFcnp/JCdte0=;
 b=X+3TfsLSacZemI2ZgXn6OGavtB6bMZRgu5CFdbHahhULra5oLnofZK1e
 zBMRGAbhvvrQm3slJyPwo/WH/ousOWjCoVekuGQG3FL3/5lv1bNuhqx+M
 NPbuKXpE1ajCQFjBs9mujFsU4uNNmjmAjeJqPmtQLTcapUbiILhGLbpFA
 gbqsHfqFsGmH6aWKDbmzZqWZwZy962p9dGq9Z0FU0pQ1NXw7DBHHwW2wG
 o6OalBVho4Nb4kh06r6UgZ7+Kwv8VMbVJtOus7qY4BECCAhHsUXEaP6p5
 IvkHWTDOlWj+ZZBgU3ZWB0m0+juAUPwMd9gHqmWKKLgrzQlpzSUkbb5Mt w==;
X-CSE-ConnectionGUID: Q2XZRn3nSTit1rxaX43Q+A==
X-CSE-MsgGUID: bJXO71PxRgWUmF/CvQFHxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="25871229"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="25871229"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 07:04:49 -0800
X-CSE-ConnectionGUID: 7VZul8SDShKoOgSyuAF8sg==
X-CSE-MsgGUID: q+vCZeEETfGdBBx6VGinGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111818029"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 07:04:48 -0800
Date: Fri, 24 Jan 2025 16:04:45 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org, jordan.l.justen@intel.com,
 christoph.manszewski@intel.com
Subject: Re: [PATCH i-g-t 1/3] lib/xe_eudebug: Fix 32b compilation
 warnings/errors
Message-ID: <20250124150445.qcetlk3hguafujr6@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 igt-dev@lists.freedesktop.org, jordan.l.justen@intel.com,
 christoph.manszewski@intel.com
References: <20250122144419.327706-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250122144419.327706-1-dominik.grzegorzek@intel.com>
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

Hi Dominik,
On 2025-01-22 at 15:44:17 +0100, Dominik Grzegorzek wrote:
> Fix instances casting using proper from_user_pointer macro and
> correct all debug prints which were causing compilation warnings
> on 32b archs.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---

Patchseries applied, thanks!

Regards,
Kamil

