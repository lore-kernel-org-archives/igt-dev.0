Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE2F606A319
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 04:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K3LoZV96
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE9310E1F9;
	Thu, 22 Oct 2026 04:53:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF0710E1F9
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 04:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792644759; x=1824180759;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3d3GrFHZkiqVpkmuVhr4gY+pZRl7iXg/kQ79TPwxBBY=;
 b=K3LoZV961Dmg23jFkIT5CbTzq383XsvyCfPEuDh8UjIyel992M89eC/h
 xkk9Y1tRYLOvwzjGrgiOe0/Yxb88XnBSoP+oOKTZDDmlJDjDVMHUq2zbF
 8g4o/YzBLFOw+tptHg7aKugL66NKMO2SKIVz4utMEIsvZUBMUgT9iw7lX
 HG/842DwHoY7B4BKYUBpxXaIHPVJJP4X6uEWbnscMHkB1NwudbjHjOTKQ
 z6q7wgwHvPN9Bp1Za6lkoSpml89PAXKjkuGh9WrmzzxA675wNgmr0kaAF
 Q2/Ud3zCbsonNIU0ne7thcGMiXvM8cvJPesi1QHlrU2NO1JRJ4RAD2UdM Q==;
X-CSE-ConnectionGUID: YqrJukuGRdSSvDgyyxhpaQ==
X-CSE-MsgGUID: XJ6Z8pHUQzK5k+nmskthOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1485703"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1485703"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 21:52:38 -0700
X-CSE-ConnectionGUID: j4+AutT0SICbHg0/l/DdnQ==
X-CSE-MsgGUID: OMHBE0R+Sp2lUvmmoVlQMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3266153"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 21:52:37 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH i-g-t 0/3] lib/intel_compute: Restore compute coverage for
 missing IPs
Date: Thu, 22 Oct 2026 06:52:18 +0200
Message-ID: <20261022045221.823182-1-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The switch to runtime graphics-IP detection exposed missing compute
and preemption entries for 20.02, 30.01 and 30.05. These devices
previously used hard-coded versions 20.01, 30.00 and 30.04.

Add the missing entries using the existing kernels. WMTP and TGP
were verified on hardware for all three IP versions.

Jan Maslak (3):
  lib/intel_compute: Restore support for graphics IP 20.02
  lib/intel_compute: Restore support for graphics IP 30.01
  lib/intel_compute: Restore support for graphics IP 30.05

 lib/intel_compute.c                | 33 ++++++++++++++++++++++++++++++
 lib/intel_compute_square_kernels.c | 33 ++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)


base-commit: d40c5ca415f6eed36d83a752600a7d7c1f10f17c
-- 
2.43.0
