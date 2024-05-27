Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12448C25B74
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 07:34:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2514410F3A2;
	Mon, 27 May 2024 07:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GOlNDj8C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7583610F3A2
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2024 07:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716795269; x=1748331269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Vk4XaAmQ7hof9cOb7DzztD0Y9xtM5qQP52LP9Zojwk=;
 b=GOlNDj8CA+QFMmivlyIobhMnAARxfVORpVwgtKfYZyCdSurtKxKZ1e5n
 eGN1UzXNTeahhVgjECWoScT5RXMYsTy4DwEWvrjaq9Fsjcrh+U4Vl6nmd
 oL5Z7ibjd+FRgIhYXELqjxcUlbk+xZFRNgR1XfEPkP6kTCv7mlxuktcqR
 yeOxZ4AUMigpWvOf9NrioLWVpDM6Wfchh9uXW94CW7IZYwF9A/0iW6OqU
 iZVKQoH+m0mWjUkAfc2aWgsx2/JQxo1uvwq31KdA/udKvDPVtaD4SJR71
 2q/SuES338D/a+N4WGZKL2KTzkgSvjB8qcUvW/dtSU8g6a/A9iI3/VJgF Q==;
X-CSE-ConnectionGUID: 8UWtiwMESnO/0HPxJHO47Q==
X-CSE-MsgGUID: 1CQ5gQbhQJOHsdINloVrwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="24225281"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="24225281"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:34:29 -0700
X-CSE-ConnectionGUID: FpcenwsXSt6J1KbgJK/OcA==
X-CSE-MsgGUID: y9d55SAzSJWlK7xUABwRfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="34584474"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:34:27 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 06/12] lib/intel_blt: Add Yf tiling in block-copy
Date: Mon, 27 May 2024 09:33:39 +0200
Message-Id: <20240527073345.54729-7-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
References: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
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

For TGL and DG1 I've noticed we have Yf, not Tile4 specified in the
documentation.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_blt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index a8433387d2..d1200ca862 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -555,6 +555,7 @@ static int __block_tiling(enum blt_tiling_type tiling)
 	case T_XMAJOR: return 1;
 	case T_YMAJOR: return 1;
 	case T_TILE4:  return 2;
+	case T_YFMAJOR: return 2;
 	case T_TILE64: return 3;
 	default:
 		break;
-- 
2.34.1

