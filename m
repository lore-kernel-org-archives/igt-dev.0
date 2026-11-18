Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A01606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 14:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IhUmY6+x
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB6010EEC8;
	Wed, 18 Nov 2026 14:50:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C66A510FD56
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 14:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795013373; x=1826549373;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=OAVA0ZDOTgu/ic5uOCTcRRVk27P07rWlm0PEFpguaLo=;
 b=IhUmY6+xkI7yncwr3T6sH8u5TVl0wx/vCFZ2V7TIj+FI52tY96xZRiuq
 rYXBM6sRos2GC0+aQM+154h/nehcdgy1Xgh9iU0SpELESx+MqYA+g3yY/
 oTNyXQ7hwAXlkpKfmWfnNOP56MK9YXDnr3Z0YfquP0A+HUE6VxUhGDjNi
 Pe3J0b9lV5uCpk1flu1dtpkV3O+DEfA+sAqRLpPJd+/LK+iwhM/bMLBds
 FrAqDB/xcFGHDecEMYdGTCLomJRyexp9aYhaQZXn3ixJlkcqpada7uELy
 koqYmKExRg9c71xghOoNxOj7SJxuzpfjhlEF8OJUhADJNHi2xw/He/88/ A==;
X-CSE-ConnectionGUID: KMFwX2SyQsCYnrm5FsVpLw==
X-CSE-MsgGUID: GjlvMYQJS5yChTK3UyPtyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3711324"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3711324"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 06:49:32 -0800
X-CSE-ConnectionGUID: VOYuXX5ARU+1utT7AHiENw==
X-CSE-MsgGUID: VNwS6A5LTH2vD0ENQ8vSOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10047153"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 06:49:30 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 0/2] xe/shaders: re-generate shaders
Date: Wed, 18 Nov 2026 15:47:18 +0100
Message-Id: <20261118-rebuild_shaders-v1-0-92bf629f4f27@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHa6/WoC/yWM0QrCMAxFf2Xk2cI6cai/IiJNGm1E6kisDMb+f
 a0+nss9ZwFjFTY4dwsof8XknSv4XQeUQn6wk1gZhn4YvfdHp4xFXvFmKURWcxRiPx5OiLQnqNa
 kfJf5V7xc/2wFn0yflmkPDMYONWRKbSqTwbpusUwI14kAAAA=
X-Change-ID: 20261118-rebuild_shaders-cad0659bbc3c
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.17-dev-6be7c
X-Developer-Signature: v=1; a=openpgp-sha256; l=581;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=OAVA0ZDOTgu/ic5uOCTcRRVk27P07rWlm0PEFpguaLo=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBq/bqASBHfwx/KiW2rbgxssqMqkBwaEmQZWzhOT
 RSRVIHT9ouJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCav26gAAKCRAjYrKT3hD9
 1xbxC/97MsVydW5y8tCUE5RxUAK1u5GhuA4SyGCEkYavmrlaNUXjSXAbmN6/gEhNBAJmM4CtG3d
 F//wKAhVrBNVeSZ1YkTPt6m8TR2UjiGsCfhEEZxocRqKn9FVSo1X/guiw3JbDOe5jTwLdhJeNAH
 KFiMgVq99ap2vgam/CT/CiO3uf+O5G+FWiKUEvbHsigV+tKLC7UjgL6yfwwcO54s+6whlujkD1s
 TVM/XVW7N3DB4ItBCgA4CfVPZ80WVYk67desOpd1RiMuEOrIOtw7/qlXBv2bcyXNdidLo6xLCUf
 9yt6DI+zsLPfgf7GhFL+xs2mHgfPCY5BxBMO/Iv+ESQ/SeBeA0gSo7ehKpRFYeaCJpj5RLUyGYO
 xI5gU/zevmBY8GNwDZi0E48gY/kT6RWFIyLg226+Wf4En8wxSIaH39hTEMy5KTLVUs2LOLR+kd1
 AA4ghWnMkBsho3QhIVYSIs6laiuQEz6z/I/Vs818+m+etASoAYsyo7pTd++47riuIkV5k=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Andrzej Hajda (2):
      lib/gpgpu: re-generate shaders
      tests/intel/xe_prefetch_fault: re-generate shaders

 lib/gpgpu_fill.c.gen.iga64_codes.c                | 2 +-
 lib/gpgpu_shader.c.gen.iga64_codes.c              | 2 +-
 tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 7f06fc9ccbb309dec2091bcfbbd74326b2981f81
change-id: 20261118-rebuild_shaders-cad0659bbc3c

Best regards,
--  
Andrzej Hajda <andrzej.hajda@intel.com>

