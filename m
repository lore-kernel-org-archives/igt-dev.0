Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EC9C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 09:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021E810E3EE;
	Wed, 24 Apr 2024 09:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N34WeBtc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C3D10E3EE
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 09:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713949686; x=1745485686;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1ecsF21tubNOd9JyHI8bcC5POlUUbl5ni1Krca6uJUU=;
 b=N34WeBtcx+svLS+LYdl5bMhYNkWphPMvPP5Tz0gJm36Jn0L5QPv5mju+
 kCCd45fWKK48LqrIxxgwq8dcuJ2ORVn82fFs2JVT6Sv68BD4HZfrRn1Cj
 EZizPVanYQrLFBFWXHyyizpl5wxjVFOmBZ7pWnuSddMM66qb9J0/ywrEx
 z2Ig1iEQd67OeewqPxwobT/g9q84FXhdyhI0Jdd6jR75j3AlF/lhzFpHO
 NLyovca/IQ12wi0+f+q2I3Nrfpl5hIK9cLGjh606I4VFKO7kzmjZniejb
 vM9sXCssiZ6MeanNZID4udgPL5gQM3+NIThxZxhiCalG8vm4hxAZ4QFEG A==;
X-CSE-ConnectionGUID: CHgidTP1SuGq/0GJ5UDFwA==
X-CSE-MsgGUID: SeH+88cBSEeR82ngg1+qKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9500249"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9500249"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 02:08:05 -0700
X-CSE-ConnectionGUID: bQOWkPaURGm8ptFw/yv3fg==
X-CSE-MsgGUID: 9hbQ01tmTfm0l5qEYM8PBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="24540626"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 02:08:05 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.155])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 6B41E206D89D;
 Wed, 24 Apr 2024 02:08:03 -0700 (PDT)
Date: Wed, 24 Apr 2024 11:08:01 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Kamil Konieczny
 <kamil.konieczny@intel.com>, Jari Tahvanainen <jari.tahvanainen@intel.com>
Subject: Re: [PATCH i-g-t v3 0/3] Put "Run type" highest in documentation
 hierarchy
Message-ID: <20240424110801.582c0091@maurocar-mobl2>
In-Reply-To: <20240424080533.3611723-1-katarzyna.piecielska@intel.com>
References: <20240424080533.3611723-1-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 24 Apr 2024 08:05:30 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> Let's put "Run type" at highest place in documentation hierarchy. It
> will be reflected in html generated documentation.
> 
> v2: Make that change in Xe, i915 and KMS (Mauro)
> v3: move only required fields under 'Run type'
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@intel.com>
> Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> 
> Katarzyna Piecielska (3):
>   tests/intel: Put "Run type" highest in Xe documentation hierarchy
>   tests/intel: Put "Run type" highest in KMS documentation hierarchy
>   tests/intel: Put "Run type" highest in i915 documentation hierarchy
> 
>  tests/intel/i915_test_config.json | 66 +++++++++++++++----------------
>  tests/intel/kms_test_config.json  | 56 +++++++++++++-------------
>  tests/intel/xe_test_config.json   | 66 +++++++++++++++----------------
>  3 files changed, 94 insertions(+), 94 deletions(-)
> 

The entire series LGTM.

Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>
