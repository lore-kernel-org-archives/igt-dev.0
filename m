Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9150E77180
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 02:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C30E10E5C0;
	Tue, 10 Dec 2024 02:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jl4Wuxi5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88DF10E5AD
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2024 02:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733796507; x=1765332507;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I8hrdVmHW84EOzmcsCFqKOGXzVJ+f3MuPVdegH8zO3Y=;
 b=Jl4Wuxi5iB1pEEUFpYJ11RN/ilg2pocS5UqeC/7soayYhkfwG+xiye/N
 OoTuMUqfftL6+YaxvRN1M6QeepU6+jgO0hw6vnjNMroXUASHCUXAx2lAb
 AYPNpZYHKcPeYwUZBBHXJD/pka5Hd5oskGkmpU9WUGswBTaYiSnq/LSLe
 Rxckw5M2ah/mkGORO2/O3eHp1BsPVPkdTKeCtURp0uKLrYhrP1s3bcoTL
 7VGz5uGQ8/s6hbnMkRmNXVNQnDRjs2yTkCUClSZilFsYmoCvb8TNHhOoF
 VzbhVUD0ls2FdDGgI2/EVePMiJc/z16vjYyQjYKTDXqX7S+/ob1fgxJ0s g==;
X-CSE-ConnectionGUID: OvXC9r6sRfq7o6BMxiZiyg==
X-CSE-MsgGUID: 5xUnDSRSQJqvV+nMuHnUVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="44724569"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; d="scan'208";a="44724569"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 18:08:18 -0800
X-CSE-ConnectionGUID: hd7mOBaAShelm4YmeUu/fQ==
X-CSE-MsgGUID: W68Re3oUQjWJAalnU7uLPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; d="scan'208";a="100203714"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 18:08:19 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/xe_oa: Use buf->bo_size for xe_bo_map
Date: Mon,  9 Dec 2024 18:08:12 -0800
Message-ID: <20241210020812.1513475-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210020812.1513475-1-ashutosh.dixit@intel.com>
References: <20241210020812.1513475-1-ashutosh.dixit@intel.com>
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

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Doing so fixes crashes on ATSM.

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index c660720ea0..4483a5a19c 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -742,7 +742,7 @@ static void *buf_map(int fd, struct intel_buf *buf, bool write)
 	void *p;
 
 	if (is_xe_device(fd)) {
-		buf->ptr = xe_bo_map(fd, buf->handle, buf->surface[0].size);
+		buf->ptr = xe_bo_map(fd, buf->handle, buf->bo_size);
 		p = buf->ptr;
 	} else {
 		if (gem_has_llc(fd))
-- 
2.47.1

