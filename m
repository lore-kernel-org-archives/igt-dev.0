Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA80EC25B10
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 10:42:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DB510E2AE;
	Fri, 10 May 2024 10:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lhhd9Zs8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28AA10E2AE
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2024 10:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715337772; x=1746873772;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=N7FoRt8BTIr3FDO66cWk+4JNfU0YHovWC8bXEIzwnvY=;
 b=Lhhd9Zs8nbY7u/HmgvNZszgmibYszGTE3AgmrUb1FLVvf2Tb6YTRQDuX
 dH0dSQmsMtzBYSKGFq4SsxAjoWowScqSQSITxfBJfcsQyiufyFupHnrDo
 TIQUWhuib39fM0bUjgfaXPgjoMkGtwyMBHVDD/YOfyD3s/yqI3TqpLHbJ
 HpOPdYCvPAyW16/ADTUjQMWXLCHfIGUwu22CjVewojMSjLkBcjKM7sjEm
 V27XGzVH3nQ6dE/Acr3etgc7N/njzqsIq0g/txSbB/6xSJQLq/oRzbPsq
 wI9kKS7J6klz8RIHKxO+z2+Xi7PWMMCFc2YhyzTeRW/aEx7r2W68obnpS A==;
X-CSE-ConnectionGUID: x17wYA7MTZ+AMGiVrGcvJw==
X-CSE-MsgGUID: hX5oo7+mSPqLA9YI+pU6VQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="33822618"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="33822618"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 03:42:51 -0700
X-CSE-ConnectionGUID: vxdGU/11Q5mzbvemyWdZlg==
X-CSE-MsgGUID: R525pZAIS06ZY//l1y78Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="29682636"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.189])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 03:42:49 -0700
Date: Fri, 10 May 2024 12:42:46 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>
Subject: Re: [PATCH 3/4] lib/gpgpu_shader: add inline support for iga64
 assembly
Message-ID: <20240510104246.cpw4jvt3sj7ajw6u@zkempczy-mobl2>
References: <20240429-iga64_inline_ups-v1-0-2e9ac46cf6ba@intel.com>
 <20240429-iga64_inline_ups-v1-3-2e9ac46cf6ba@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240429-iga64_inline_ups-v1-3-2e9ac46cf6ba@intel.com>
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

On Mon, Apr 29, 2024 at 02:08:19PM +0200, Andrzej Hajda wrote:
<cut>

> +# check if we need to recompile - checksum difference and compiler present
> +MD5_ASMS="$(for a in "${ASMS[@]}"; do echo "${a#*:}"; done | md5sum|cut -b1-32)"

Why not use:
MD5_ASMS=$(echo "${ASMS[@]}" | md5sum | cut -b1-32)

I'm not sure but your check doesn't support function (asm) rename.
--
Zbigniew
