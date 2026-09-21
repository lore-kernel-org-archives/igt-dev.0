Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12175C982ED
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 13:56:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D54410E791;
	Mon, 21 Sep 2026 13:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eVrYR8X5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DEC10E791
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 13:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789998922; x=1821534922;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RjcZdzU3hgnpqMHa8Mq2PkhVNsp/I3o9peMKg+JZLxk=;
 b=eVrYR8X56MLXMqFl1+hMVjgM4fCK6xaS3CXr+nCPj+VTTpQTqVF4dFH1
 feehNl7MoW2gPYRdCNRoyg2d5Mwjqn0gQra6ZzPb+6LIip3DSXEHAqEWx
 K+Y+nz1CV+PXcV9r880ieSlZKtuL8PoNusgBXu23lbo3i+9hnEL8rcRcG
 3dHRrZQYPnjk0L7K+FOlYilX4JJ49ebB/523nDysLInkvvTUNzoum3QrP
 vWEkRDb0p20TghyMXk5X3RWSuaMXJUadYMC+GWbapsEztk+tueaPbBam7
 ZkGSeQZVSIWfHTOdt7+6Jtm7KXd3JLxoHG3exiWiEOL2mcZRHO8B4Ajuf Q==;
X-CSE-ConnectionGUID: YAh0OYBpT2iq8T4ALhGsVw==
X-CSE-MsgGUID: nl/go3wnRy+TdPp+WiSwRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1019782"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="1019782"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 06:55:22 -0700
X-CSE-ConnectionGUID: hK3U7E4mQHGhrZ8ANh8U+g==
X-CSE-MsgGUID: e6O0rZ5BTn6NZpY8gWQtuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="3708520"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.209])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 06:55:20 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v6 0/1] lib/igt_core: Make build reproducible
Date: Mon, 21 Sep 2026 15:55:14 +0200
Message-ID: <20260921135515.137949-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Create a new way for searching for data files, PNG images used
by kms_3d test. Also remove build/data path from libigt.so.0 as
this breaks reproducibility, according to
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/190

Before this patch:

strings build/lib/libigt.so.0 | grep build/data
/home/user/igt/build/data

After applying this, it was not found.

Link to v5: https://patchwork.freedesktop.org/series/174509/

v2: changed subject of patch, as I will not verified reproducibility,
  only addresed a build data path present in lib (Kamil)
  reworded description, added second HAX patch for testing (Kamil)

v3: reworded subject and description (Kamil)

v4: removed last HAX patch (Kamil)

v5: addressed review comments (Zbigniew)
  corrected function description, reworded cover letter (Kamil)

v6: simplify data patch s!./data!data! (Zbigniew)
  corrected subject in cover letter in v5 s/ib/lib/ (Kamil)

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Kamil Konieczny (1):
  lib/igt_core: Create new way for finding PNG data files

 lib/igt_core.c  | 62 ++++++++++++++++++++++++++++++++++---------------
 lib/igt_core.h  |  3 +--
 lib/meson.build |  1 -
 3 files changed, 44 insertions(+), 22 deletions(-)

-- 
2.55.0

