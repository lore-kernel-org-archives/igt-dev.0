Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91E0C3DA7F
	for <igt-dev@archiver.kernel.org>; Thu, 15 Aug 2024 17:31:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFF110E4A4;
	Thu, 15 Aug 2024 17:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ff6hMeih";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1783D10E4A4
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Aug 2024 17:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723743098; x=1755279098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W/AsommxbYhEx0pJvW6k++PM+AdoU9BqH+PgO9kpigo=;
 b=ff6hMeih0y/48OAXpNzP4pPqE5NXxWiq/ZJWu+Kc4Dbmff9Nlub8q7bH
 nRkHmj2U/HIybmkwqab6vCj3iId1UAwDIjAVp6KDo1htfWXRfqiZHrayK
 WhsK0v4bCCLVYYSaYnUV7N6EdidZxHzt96xknKsgVLye20zN0P7Kk3gxo
 R8HZGDh55f7A94Wa7jzULHs7EmbUgTL9I67QnHqQyhyh5mWl9vnzZXbW7
 c7+mjqc24te87cWlF8Pmxz1RggLJjeJSbHkDZ4H9RxyJUUV4A1MhyOTQT
 UBIBzeLMCazAqHwqrDwgTZppQ1FLuMxLaZ6zdv24PBEKYEoweksMz24Ig g==;
X-CSE-ConnectionGUID: Dvp+qvHVQOuyNSSFHvhjaw==
X-CSE-MsgGUID: URkJ5qoIQ26Kx+gldBw2Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="21656633"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="21656633"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 10:31:38 -0700
X-CSE-ConnectionGUID: MC/IyKKKS1yQJmOg6u38lQ==
X-CSE-MsgGUID: fgaZ7U4aS3GsCH/X/Yc3zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="63592970"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 10:31:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH i-g-t 1/3] lib/igt_core: Use unsigned constants for time
 conversion
Date: Thu, 15 Aug 2024 10:31:21 -0700
Message-ID: <172374302306.3784041.11151040561268332409.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814214705.3718355-1-lucas.demarchi@intel.com>
References: <20240814214705.3718355-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Wed, 14 Aug 2024 14:47:03 -0700, Lucas De Marchi wrote:
> Time conversion is usually done with unsigned constant as it could
> otherwise give warnings on signed/unsigned comparisons.
> 
> 

Thanks Gustavo for reviewing. I fixed the comments and applied.

[1/3] lib/igt_core: Use unsigned constants for time conversion
      commit: d1990dcb44c80cb07f11f15ef4412a45acb4601b
[2/3] lib/igt_core: Add a couple of time conversion macros
      commit: 63780d7d1cc09d5c13e00d161149bcdfa3b36cb8
[3/3] lib/xe: Remove MS_TO_NS()
      commit: 54f99657bd69295e49e1ab376fde82d3135bba7a

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
