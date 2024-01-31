Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3679CC47258
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jan 2024 11:43:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33BA113B78;
	Wed, 31 Jan 2024 11:43:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48272113B78
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jan 2024 11:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706701400; x=1738237400;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+dntKG7KsVb81gU9b4TPLIxGUYfL/MI4R4AW5aILjhA=;
 b=fzNBLUocdg7k4bjR7NHpXtC0FWvT1ni3jgVdfpy+gIF8qqZQo8aA2ZbQ
 CFvvNUpZ5C8ifKkypdSypNXpJtZPDXC6/LngFgAamkNTDzZLr0DUM1vzK
 KzW5MKZXbC/1XeIgWgVUV6awXu7ucFYlT/tSEnONXD/pr9Fx6Gmm7iufs
 Hs8P0s3uPwhw0G1R2IiY5rTml23NOxjeD/5ssXzMwCQh6TN3vj1MQqQ/e
 z+97LmeU+vbR7sg0sCzO3jRtY15ZCg/DBYKt8mg/Hx3vrRDbe0Pba9D3N
 zDaUjl/oeWiJ3T2Nd92Yp5P3rmAHUyCboaK0yuH4ENUseAGZxjBYIbCoU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="434748547"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="434748547"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 03:43:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="961583629"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="961583629"
Received: from akurkina-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.19.208])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 03:43:17 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/3] lib/intel_device_info: set has_flatccs on LNL
Date: Wed, 31 Jan 2024 11:43:03 +0000
Message-ID: <20240131114305.202871-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Xe2 supports flat CCS based compression, including igpu. Currently
HAS_FLATCCS() is incorrectly returning false on LNL.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_device_info.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index a669797c3..64b5246b7 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -509,6 +509,7 @@ static const struct intel_device_info intel_lunarlake_info = {
 	.graphics_rel = 4,
 	.display_ver = 20,
 	.has_4tile = true,
+	.has_flatccs = true,
 	.is_lunarlake = true,
 	.codename = "lunarlake",
 	.cmds_info = &xe2_cmds_info,
-- 
2.43.0

