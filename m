Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4410FCF07B8
	for <igt-dev@archiver.kernel.org>; Thu, 10 Oct 2024 06:58:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAF710E879;
	Thu, 10 Oct 2024 06:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MrLMUNu0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD6110E879
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Oct 2024 06:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728543517; x=1760079517;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iqHKmB/p+Ipnuot/WKmxO887wQdnHFXHzbE2ctYNDJc=;
 b=MrLMUNu0YT5yZJDPvdXXv0cUWr8MmCT5q1S8vpgerK1L7kC1VEefMxSk
 UYhD05HxPDIgjWxZKevrpu5BZroEVnTxKrO1NLqFpZrLZN7Kz5uRTwJ/i
 JJxczT4rEyWyqyKfoGdsr1o46rhFVYOI8Z34xFywh70A/F3O46Disbdwk
 7rMwJcg21by17IT32u8gkd6J1HyO1F2wW/C4B1SG8RPeGro6KcKVDBNlL
 53Pkq890+1zkB1xJsxJIK3+GPMr1RRm5zatmCNNi7TAyNTBc4w7N6lT4/
 rrCgK2zZbFrbmF2keiQvztRDiBmj346tqdR4rZIDbs3oMaow40hEUZUsX g==;
X-CSE-ConnectionGUID: JMlWoRwpQDCkJari8un6Vg==
X-CSE-MsgGUID: rxlubQ1bQ62QJfowatS7lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="31779332"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="31779332"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 23:58:37 -0700
X-CSE-ConnectionGUID: dYHXs4I6RLeHnQKGU+bdgw==
X-CSE-MsgGUID: 4S87dyzFTOSGXpJIxf14Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="76104072"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 23:58:34 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org,
	anshuman.gupta@intel.com
Cc: sk.anirban@intel.com,
	riana.tauro@intel.com,
	vinay.belgaumkar@intel.com
Subject: [i-g-t, v2,
 0/2] tests/xe: Add tests to validate GT coarse power gating status
 and toggle coarse power gating states
Date: Thu, 10 Oct 2024 12:23:10 +0530
Message-Id: <20241010065312.1988533-1-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Sk Anirban <sk.anirban@intel.com>

Implement test test-cpg-basic to validate coarse power gating status
using a suspend cycle.
Add test toggle-gt-cpg to check if GT coarse power gating is up when
forcewake is acquired and down when released.

Sk Anirban (2):
  tests/xe: Add tests to validate GT coarse power gating status and
    toggle coarse power gating states
  HAX: Add Coarse power gating tests to fast feedback list

 tests/intel-ci/fast-feedback.testlist |  2 +
 tests/intel/xe_pm_residency.c         | 98 +++++++++++++++++++++++++++
 2 files changed, 100 insertions(+)

-- 
2.34.1

