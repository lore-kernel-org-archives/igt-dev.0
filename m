Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E91E7719C
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 14:55:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D46510F0F2;
	Fri, 10 Jan 2025 14:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n680vJEF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B68010F0F2
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 14:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736520936; x=1768056936;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q79brUCUJGGtAtQ9f7KRYgpmwcf3miT7OaBDzgXK854=;
 b=n680vJEFNYVTOLWwMorMVck61Q55uzqTm7g8+yCHJrqqOmEW72/zfKsM
 KynwtG0QrRoANdK00h6CIQn+GNs5NsA1rao8nxYshxXoFpJd51IeyvdUZ
 cKs71RiQGJVmONJb4xZHmBJ+JO69TFT0ZNLhykzN944k/b9VTdc7vaMcs
 bnl7wOVLCLGxLzNn07nq+RaNkz+6oMRAzDgrC5KVe5dqyRbcpWaoV+ipZ
 rWkDGf67aZ2zTtzRUu1rVMfqRiK3ilFE1oVr6cXKDN7nlQ9i40DL5kb6/
 fOHhaT9AjYYk3jUFeUemsGCPOrBEbL6Qxa/mnQQ0b5S8j/o0hRan/xwxq A==;
X-CSE-ConnectionGUID: aanh+cGwTByOh1XPrWKNUQ==
X-CSE-MsgGUID: D0EcW0fFRvGvZu4h/gAM1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="59294809"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="59294809"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 06:55:35 -0800
X-CSE-ConnectionGUID: n+OiLRJHSfqv00rQKzVl5g==
X-CSE-MsgGUID: jYjLoSrwSO21NxeNsDLHRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="108797525"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 06:55:35 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>
Subject: Re: [PATCH i-g-t] Revert tests/kms_histogram: Fix build breakage
Date: Fri, 10 Jan 2025 06:55:22 -0800
Message-ID: <173652090306.2395795.2062650229973862214.b4-ty@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250108205251.1645069-1-lucas.demarchi@intel.com>
References: <20250108205251.1645069-1-lucas.demarchi@intel.com>
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


On Wed, 08 Jan 2025 12:52:51 -0800, Lucas De Marchi wrote:
> This reverts commits
> 8911eff2c6c0 ("tests/kms_histogram: Add check for libghe version")
> 6e93c2e807b3 ("tests/kms_histogram: Added IGT support to validate global histogram")
> 
> Ths addition of libghe version check didn't really work as the released
> libghe exposes a 1.0.0 version:
> 
> [...]

Applied, thanks!

[1/1] Revert tests/kms_histogram: Fix build breakage
      commit: ec6262ea1c05ac7371f45948cca875dc06852838

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
