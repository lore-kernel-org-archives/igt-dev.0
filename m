Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF92F513F8
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 04:17:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FDE10E323;
	Fri,  6 Mar 2026 04:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NWqaFof1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DCD10E323
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 04:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772770648; x=1804306648;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3L1Zi/M80B0pcT7pESYGT3v3a4ugXAWK2XpMLTNyUdQ=;
 b=NWqaFof1IBlYpwstR5xl5UFOB0kU+WJtfO/IHHb1USdGed+aO6SoYGTG
 YrvjK1wsQhLEpX5AXZa4q7F9MLuCxEY/OoWWbh1XlnMeVtE2I4vKIrt7N
 WUA2p7NHA10R+PX2O/Kr2D+xuy97UIj8QDhOujPsPejVbFv/NsUNsuZ6E
 +UD+Xy9PWVhdw4eiwnoeDH+HB0Y5xoL/HQlOnhnnVYWTmert8Mcl1EMPs
 RhZ7/h7Ze4d+A2+NWvUrw+5ixFt+HiK+3As70BUxzdBcvCe+xqodkaJq5
 ovU3ouKodTcdQUPg/ilaJEiEkcRwz1DiVCEKNd3jdX+czo2bpmWbeJjNt A==;
X-CSE-ConnectionGUID: ugXD2MffQvei9YwngkXP8A==
X-CSE-MsgGUID: 5515xLAxRM6XfuY7pVZkXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="85223348"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="85223348"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 20:17:28 -0800
X-CSE-ConnectionGUID: l5znDOc5Q8SumB4lCnN38w==
X-CSE-MsgGUID: JA702KMiQTKLeFmsHARe0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="256799106"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by orviesa001.jf.intel.com with ESMTP; 05 Mar 2026 20:17:27 -0800
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 0/5] Add false sharing and XA app transient tests
Date: Fri,  6 Mar 2026 09:47:21 +0530
Message-ID: <20260306041720.1760867-7-priyanka.dandamudi@intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add tests to validate XA app transient and false sharing.

v2: Added comment for forcewake, reordered headers.

v3: Updated comment for forcewake, reordered headers, renamed string for
xa-app pat from 2way to 1way.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Priyanka Dandamudi (3):
  tests/xe_pat: Add pat indices for XA App Transient in false-sharing
    test
  tests/intel/xe_pat: Use intel_get_defer_to_pat_mocs_index() to
    exercise coherency
  tests/intel/xe_pat: Validate XA App Transient feature

Zbigniew Kempczyński (2):
  tests/xe_pat: Add false-sharing subtest
  tests/xe_pat: Handle false-sharing on Xe3

 tests/intel/xe_pat.c | 343 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 337 insertions(+), 6 deletions(-)

-- 
2.43.0

