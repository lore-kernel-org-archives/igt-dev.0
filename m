Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F46CF07BD
	for <igt-dev@archiver.kernel.org>; Thu, 10 Oct 2024 08:06:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40F110E886;
	Thu, 10 Oct 2024 08:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="luQbqhDf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DA810E886
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Oct 2024 08:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728547573; x=1760083573;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yLE5hFoOL1bCni15Ti6fS6JgqDSf9O0eBXG6AF39UJs=;
 b=luQbqhDfLTmhP8XG/RDqu9Ql9cHxGZxKeJtlMu4/Xt1hkF9ardSiqI7F
 znlN5Pu4FPkBF2iApX83w15dErK7caSMhuHcu4dwZv+2hMSGcFny+iYZs
 uqzB3yOZP8St+ID9Ob41vlGLFOss9k86EoPiiIHUNsluOW3yfNQ+B4Q32
 Q7O8d86wSHm2W1Gi56FDCpiU63WYXYv6w9paseBFD5lx4xb9KI3zehNBJ
 dX1xlaZpUmBA+7Umm5mkV9uLWsC8NH/llQAFrVKzXyoBu+uZ25ALuMgHt
 zJvlsUTWrShhPpZk0YRArGelf9WbdrQYORuqK4FkDGsZ7KIWKCGFmjpDg g==;
X-CSE-ConnectionGUID: OQ8QPDfxSNSyLSD2NwSOnA==
X-CSE-MsgGUID: m0s6ooB9RweLihuuRHtEaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="31677687"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="31677687"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 01:06:13 -0700
X-CSE-ConnectionGUID: 9LDITl7PSKK4lS6feB7X5Q==
X-CSE-MsgGUID: ken+8XN0TuK0Xi4S8ZhNhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="107352656"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 01:06:12 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org,
	anshuman.gupta@intel.com
Cc: sk.anirban@intel.com,
	riana.tauro@intel.com,
	vinay.belgaumkar@intel.com
Subject: [i-g-t, v2,
 0/2] tests/xe: Add tests to validate GT coarse power gating status
 and toggle coarse power gating states
Date: Thu, 10 Oct 2024 13:30:46 +0530
Message-Id: <20241010080048.1989232-1-sk.anirban@intel.com>
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

 tests/intel-ci/xe-fast-feedback.testlist |  2 +
 tests/intel/xe_pm_residency.c            | 98 ++++++++++++++++++++++++
 2 files changed, 100 insertions(+)

-- 
2.34.1

