Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFCA606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 03:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lsR+ozeJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A5110E06D;
	Mon, 16 Nov 2026 03:52:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BEE410E06D
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 03:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794801058; x=1826337058;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RtQmtTv+slDs6x2jb7Of58XxbDRIWI9YXi6x5ihWUoA=;
 b=lsR+ozeJEhBANMJgpxhutehfq3a/ydp6ImZMPFQilTBGjqRoZy6etQfg
 MiaXFYa4dMczrESNIprT66RWd/9+31hgG8uLFtiwFRNKZMZVZzF5YNvWN
 QBZStFmXshYCE9d3XCZ5hmVNGCxe1SGML7M9v01fniekvhbBY0GuLeyqF
 DvSjb9oWBQ+ZkrhfxGZPMqxw2GN6quCseyn6VM3JdTijm7SeOD4lJlDLx
 sQxhFivaBihKDUNjY+qAp3raYtrZ6cSy2AaW2i0Z0/P0XsKlovQqfWhKL
 7/SCv+n+CO5Zx5mPDsVGwpu9Ms0+KZnC8tZdndoJlqgo/klwBUpXqiYTh w==;
X-CSE-ConnectionGUID: 9N3RTkHwSyWXUZkz0CjMpA==
X-CSE-MsgGUID: n03HlMKuQsmQD98pvV3RsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3606008"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3606008"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 19:50:57 -0800
X-CSE-ConnectionGUID: 4lI9QrqvTkyRLuP7KnNH6A==
X-CSE-MsgGUID: 22wZ1h1eSAeudEb5jO0BFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9977341"
Received: from avandhic-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 19:50:56 -0800
From: Avandhica S R <avandhica.s.r@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sowmiya.s@intel.com,
	avandhica.s.r@intel.com
Subject: [PATCH i-g-t v1 0/1] Extend multiple planes with multiple pixel
 formats
Date: Mon, 16 Nov 2026 09:21:30 +0530
Message-ID: <20261116035131.452844-1-avandhica.s.r@intel.com>
X-Mailer: git-send-email 2.53.0
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

Extend kms_plane_multiple to additionally exercise a range of pixel
formats (DRM_FORMAT_XYUV8888, DRM_FORMAT_XRGB16161616F,
DRM_FORMAT_YUYV, DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB8888) on top
of the existing modifier-based subtests, for both the single-display
and 2-display test variants, to improve coverage of multi-plane
atomic commits across different pixel formats.

Avandhica S R (1):
  Extended multiple planes with multiple pixel formats

 tests/kms_plane_multiple.c | 329 ++++++++++++++++++++++---------------
 1 file changed, 194 insertions(+), 135 deletions(-)

-- 
2.53.0

