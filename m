Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E1510A88D4
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 15:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C14A10E981;
	Thu, 26 Mar 2026 15:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TK2ZEWpx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8B610E981
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 15:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774540592; x=1806076592;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=kHGM/cs/Sz01PaiDQn3/cVX7nSdR8r9vET1S8VOpBKQ=;
 b=TK2ZEWpxNuEWnTfesx50mtGT2rXdZf5Wr5bMR9iRRksFOi7Tetoq5WEs
 niT5L/fYCtOHPdey4avtD1ZV6z/JMMG4LnvxafnlK4muMVVniy5PcoJrZ
 L/NCd5ektHpY+Zwi5F6z9kqUZ8wiLtljpK4QCBsNeKis4lmH6+5DRCYa9
 hYJPz7YmaH6Ze0NFtLM6T6xZ+7Q02ZANsO5/hUWhow2lA0Y9qVBE1dQYd
 ds1mZRbZYgFAIA5ej6EV9C4qD7jb25RpRckrs4BqCrpsHPK0o4KsG8WVo
 AwmYcpIhMwFFn2KZXPJwv6JVr7/2ecpLKUBRsPYQ56sCjvknr14GWlhQL A==;
X-CSE-ConnectionGUID: bAFcHgYbTcajJd3+orRUcw==
X-CSE-MsgGUID: uTRmn1DWQ86kFojynD1TgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="85908632"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="85908632"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 08:56:31 -0700
X-CSE-ConnectionGUID: EgJsNOADTliwMmV9E5ev7Q==
X-CSE-MsgGUID: ymNNgi9aS4iwHl03cuuchA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="229986965"
Received: from zzombora-mobl1 (HELO [10.245.244.25]) ([10.245.244.25])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 08:56:31 -0700
Message-ID: <7d01fe49-0d35-4876-b2f5-83516b0794ea@intel.com>
Date: Thu, 26 Mar 2026 15:56:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/intel_pat: Support other than gt0 during
 parsing debugfs PAT
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260326113425.520545-4-zbigniew.kempczynski@intel.com>
 <20260326113425.520545-5-zbigniew.kempczynski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260326113425.520545-5-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 26/03/2026 11:34, Zbigniew Kempczyński wrote:
> Main and media GTs may define different PTA entries so add gt as an
> argument during debugfs pat config selection.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

