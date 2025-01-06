Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C591E77188
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 21:29:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1996B89FA7;
	Mon,  6 Jan 2025 21:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nVpq9d6C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8176E89FA7
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 21:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736198944; x=1767734944;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XfalfV82oqrFNOjyhk6wApTandf75JM2CU2BIaUCWPk=;
 b=nVpq9d6CIKPBspFSKsbSgW4mdPrmOFMgZfj+zLNlYeYraw7Vyygm6Qxp
 tTEabS3lYUUDiv2Igq5gfZIP5xsapL2+tOEdcDO/C3c9Km3Y2qfiFR74+
 F0WWrseORQeH7oAj8puYXW06H75v+asygh5KVuf24Uo+IMb2+oCIA5C9V
 VmymaQLGeUVhWA98q/At9lNGpXAprzuPEg2sB2Bif83VDG8cREB32xK1a
 sKb4l3igZ8xnQdPYWuk77359TBb7pU9TC6f0fV57F/gFJhwIrPP0mQuwv
 R7tGVgrXLxcrCHc9/Qaawpbp7AB77p2GoJjkCGyfxzTxQqnZPm7mnnt01 A==;
X-CSE-ConnectionGUID: VJLcgrITSZSxb0E16/xjsQ==
X-CSE-MsgGUID: 0D/dW7LFSeiymwPMtsS06w==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="40303190"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="40303190"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 13:29:04 -0800
X-CSE-ConnectionGUID: 1TmO6gxlQZ+8gjbAM9E/zA==
X-CSE-MsgGUID: XD4+GszZSEuG0O4dBDORTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107179136"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 13:29:03 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v3 1/3] lib/igt_kmod: fix check to confirm correct
 driver unload
Date: Mon,  6 Jan 2025 13:28:49 -0800
Message-ID: <173619891521.1204290.7371929389483252935.b4-ty@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241220190440.2543689-1-daniele.ceraolospurio@intel.com>
References: <20241220190440.2543689-1-daniele.ceraolospurio@intel.com>
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


On Fri, 20 Dec 2024 11:04:38 -0800, Daniele Ceraolo Spurio wrote:
> The driver variable is a string, so we need to pass it in as a variable
> for the driver name instead of stringifying it.
> 
> 

Applied, thanks!

[1/3] lib/igt_kmod: fix check to confirm correct driver unload
      commit: 41fe1911ecd58017c17178591b19c369b72e2c6a
[2/3] lib/igt_kmod: Drop errno checking from igt_kmod_unbind
      commit: ae85f3d05a3f6940e5f6870cfa90c278f963dee6
[3/3] lib/igt_kmod: Do not explicitly unload intel mei driver
      commit: 5e65135d3d7cf5298a58bcd6137c77205704bcf9

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
