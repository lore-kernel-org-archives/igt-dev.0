Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F257DC3ABAC
	for <igt-dev@archiver.kernel.org>; Tue,  6 May 2025 10:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A489010E24C;
	Tue,  6 May 2025 10:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TbXxhMnx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CA210E24C
 for <igt-dev@lists.freedesktop.org>; Tue,  6 May 2025 10:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746526581; x=1778062581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TR3vA0bKDJ561zo/VlRLqQTRXD98PCcm2iuQ4nHH4Jk=;
 b=TbXxhMnxgipbEkA6Ah44UqUqJxupWJCuAij/RTZs8FZsFRSnJ3AKcJFb
 cVXGSKXqQy5Nhs/o98Jm2p4mRmLL+EBjDcPbnK+XyIWx/Xksr6Epp8YtM
 IBPcC2tyPNZP6rT3kod06/czj1vpgd5v78jvGPbZcxkBLrUO0/+zgB3PO
 AIwCs9rOXFxfzN+HGonIv951A+qm6njVtrH7fd+9ICfwjxQjO3HgDKMMM
 UAcmXdNAvzxc2qoztlCVhg+MScyCu0SC8JT29YDBedY2YMgLXqHMxuzSy
 V5JeQWT6YmCFafFV4Gf4P4KDkMCgm2SytLgyCb7QO/xKaswvJu+tCnQBU A==;
X-CSE-ConnectionGUID: j0H5YeZsQWOT8xg9yHQwSw==
X-CSE-MsgGUID: 18C9vn0ARgG9bpjKAgXlaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="59576034"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="59576034"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 03:16:21 -0700
X-CSE-ConnectionGUID: XylxbHcjSpSa1o8a+iCLGw==
X-CSE-MsgGUID: dTaCAao6TB+bUDSVpjW4DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="139627976"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.101.99])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 03:16:19 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_pmu: Check default scheduling
 attributes before test
Date: Tue,  6 May 2025 12:15:54 +0200
Message-Id: <20250506101554.629218-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250506101554.629218-1-marcin.bernatowicz@linux.intel.com>
References: <20250506101554.629218-1-marcin.bernatowicz@linux.intel.com>
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

Ensure that default scheduling attributes are set before running the
test. This avoids unexpected configuration during VF provisioning.

Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel/xe_pmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 8cbbf6916..806a62cdb 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -471,6 +471,7 @@ static unsigned int enable_and_provision_vfs(int fd)
 
 	igt_require(igt_sriov_is_pf(fd));
 	igt_require(igt_sriov_get_enabled_vfs(fd) == 0);
+	xe_sriov_require_default_scheduling_attributes(fd);
 	autoprobe = igt_sriov_is_driver_autoprobe_enabled(fd);
 
 	/* Enable VF's */
-- 
2.31.1

