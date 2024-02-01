Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1C7C47DDB
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 10:30:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A307210EB4E;
	Thu,  1 Feb 2024 10:30:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995F410EB4E
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 10:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706783433; x=1738319433;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=78uUGdPZP3RXhk0BkzZOi+1cZhLfuI3fEUh6GrgrdZ8=;
 b=SfDsSeOYEbKWcbSz5MnFvL6YDAJhDvknrdYpwe12atVkS3Uh5Fj9HbFB
 8h+rbbjmP54xDuboUrovYjqS3tTleilmlKNU6qpic80Dg9yXeloMtmkQg
 Uyb1UvHSYaenRkZOHjaUuPK3ZeZqRG53llx1lx3F/T2hXnUabrpkGiYUG
 rpsbZxDVZ8z+ANl8wmRPQQEUCHE2u/MM4gBdTDY3Z4zFb5twGzHsarZ90
 3wXIv4OxOXwo0t6FpeCSJ+J+ej89wLLKpM8xzvcD5v2dAZ/4nyjDyw/YW
 fSmpXJx4TAqxF4pIDayxIU2vPh/Z7HRvP9HwiuG1xZQNx39kkbeTwZQiq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="2798466"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="2798466"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 02:30:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="30834664"
Received: from abojovix-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.0.176])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 02:30:31 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 1/3] lib/intel_device_info: set has_flatccs on LNL
Date: Thu,  1 Feb 2024 10:30:15 +0000
Message-ID: <20240201103017.321466-1-matthew.auld@intel.com>
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
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
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

