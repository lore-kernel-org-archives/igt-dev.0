Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004E1D1F9C5
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 11:37:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8884810E8EA;
	Thu,  4 Dec 2025 11:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E6Txzq5r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC69010E8EA
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 11:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764848268; x=1796384268;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JtbwiZmUg209yJKCWXS9VEHJSt4LWh5MT9FFy7xikng=;
 b=E6Txzq5rJScKALWDFTBa79s9jQEC2e3ZWEQNpzgFTerQx85emApIsEIo
 uLHqy1MH+Ry/PoTLUCXIubXuNrs1iscVp5iIU/ZpXDwQbIkcNyLTPam/A
 t9+IX2tWDwU9VMqdeWoy/XvRVAitCYlAm1s2rT62aEFjPpkUYYPJtIS/F
 zkusR7w12e4cg7tIRXRRcFhQMTa2/k1VgdK9MZ1OKT+C5fjUkPkbGeSK2
 4YRCGXL0bSTrCyKD/2k22LOZLS/Rghys4dUL9MioPHjJDOMW4lN+d6XAC
 D7zaCYhYkQ7mXblSEJN21hJU3g5UgdplQ+414xNzUt51mBJnlU9EJC4W4 g==;
X-CSE-ConnectionGUID: vGJdCZMwQpSFf5lLbF/cMw==
X-CSE-MsgGUID: XE9Gs944S9SB6Jje0XYNRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78330983"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="78330983"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 03:37:47 -0800
X-CSE-ConnectionGUID: VfbpcDWnQ5GcqfEoymxxKA==
X-CSE-MsgGUID: qm08HUqBQjiq1qYIyA3EyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="195372499"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.245.165])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 03:37:46 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 0/2] Enhance SVM compute tests
Date: Thu,  4 Dec 2025 12:35:57 +0100
Message-ID: <20251204113726.567142-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add new tests used for SVM performance profiling.

Francois Dugast (2):
  tests/intel/xe_exec_system_allocator: Cleanup compute test
  tests/intel/xe_exec_system_allocator: Add new SVM compute tests

 tests/intel/xe_exec_system_allocator.c | 74 +++++++++++++++++++++-----
 1 file changed, 60 insertions(+), 14 deletions(-)

-- 
2.43.0

