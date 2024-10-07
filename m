Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E306CFB44F
	for <igt-dev@archiver.kernel.org>; Mon,  7 Oct 2024 17:05:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFD010E3E7;
	Mon,  7 Oct 2024 17:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xb1mDh61";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB78C10E3E7
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Oct 2024 17:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728320725; x=1759856725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LXwl1e5Snb+rXzsijL3OvBYJ1PSeeeG/hhx7CgTaeRc=;
 b=Xb1mDh61k6filIxcDh4lyA3DfIjz3D+BZUXETGqpA61pJ95EEnjUGttD
 Lw22zvK+B/51kf4wGuZmcjL6vM+rfcn85DyW1kDd8A6onZV9ZrCLDfC7N
 cvoGz32J+96OnD86n7PNYowgl/QJ9QSbOCbJg53wxAJoGN5/GNxxoikJe
 1rbQYOOgdaD36RMQdIzWmwM/gZKt0lB/FNgFnr50+uve6D4R7OO9L90W/
 7TlE/I0eosM+1H4oE1/P+qZruD2M9TBQTNVQEh1YtIt4dahLGTL05WVXv
 v8cSQn732nmB7gPKNr7HMR8bCtU1aDZoVSHL9d3oGjLClBjpqpAjeAoEn Q==;
X-CSE-ConnectionGUID: GjaLU7qWQX6ggl2xjS9I7w==
X-CSE-MsgGUID: CDSamu8nS763Q5sfYkIM5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="50016040"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="50016040"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 10:05:25 -0700
X-CSE-ConnectionGUID: 9sB4r1hlTq+f72y4o15dIQ==
X-CSE-MsgGUID: E0Y0L4eVRb2b6iBNC7lphQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="75495259"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa009.jf.intel.com with ESMTP; 07 Oct 2024 10:05:22 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_pm_residency: Limit max usleep time
 to 50sec.
Date: Mon,  7 Oct 2024 22:53:56 +0530
Message-Id: <20241007172356.1747943-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007172356.1747943-1-himal.prasad.ghimiray@intel.com>
References: <20241007172356.1747943-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
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

There may be an approximately 1-second delay between xe_exec and
xe_sched_job_run, which could result in the usleep duration exceeding IGT
timeouts. To address this, limit the maximum usleep time to 50 seconds

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/intel/xe_pm_residency.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index f4d05889c..a86107eca 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -150,7 +150,7 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe, unsigned
 		 * Execute the above workload for ~1% of the elapsed time and sleep for
 		 * the rest of the time (~99%)
 		 */
-		usleep(elapsed / 10);
+		usleep(min_t(elapsed, elapsed / 10, 50 * 1000));
 	} while (!READ_ONCE(*done));
 
 	xe_vm_unbind_sync(fd, vm, 0, addr, bo_size);
-- 
2.34.1

