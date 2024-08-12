Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B947AC3DA7F
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 19:41:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C36910E194;
	Mon, 12 Aug 2024 19:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VHw05A82";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C612B10E194
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 19:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723491699; x=1755027699;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AFNczWIjYpJeI0AgJz50DqcLboVArNvln2vDXkJhXqU=;
 b=VHw05A82Y9Cg02MQYa8ukoxL3eDi/k4298qd+LcpO6Hr/nX0bSEpyweM
 ST+D2ToCk6jsLMtF8/F/EEKs2bg8YdOorqMGTc620DfVIe5keGHhlwMAP
 7dIaAz5UOyyEqc2qlb/upDDkOcLKquPlfjWfDC7L/JWLgw/0hZtLc5VR2
 ZWlkmVxfZ1JjVVHHBOGoxZUbdshrVuf3381rSAXU/6gZ3BL8eL6F6hne7
 R1MdF0pfGkVStTFzmdpAVAtRX4FVZJjrROeQQnnqJeMqJOGpx0YgkmmML
 AwLyttvh9ZLfwuhUqtioIQp6ePzLIjPh550OSAgybZTgAAV0oPZr0tgoW g==;
X-CSE-ConnectionGUID: 1yf8q5HUSnOOIUOs9XVOSg==
X-CSE-MsgGUID: UzvrpHEQRoG+gzqmV/qw+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21788421"
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; d="scan'208";a="21788421"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 12:41:38 -0700
X-CSE-ConnectionGUID: 422Geav8RbWLIeSCr4Zwkw==
X-CSE-MsgGUID: 8mQ5nu+qQt6OpaqurWQqqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; d="scan'208";a="58443106"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by fmviesa010.fm.intel.com with ESMTP; 12 Aug 2024 12:41:37 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Subject: [PATCH 0/2]lib/igt_sysfs: update igt_sysfs_engines to run dynamic
 tests with its
Date: Tue, 13 Aug 2024 01:11:34 +0530
Message-Id: <20240812194136.6352-1-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Correlate updates in sysfs engines queried and the work load submitted
to a engine, enhancing igt_sysfs_engines so that each update in sysfs
engine will corelates to it corresponding engine class.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Sai Gowtham Ch (2):
  lib/igt_sysfs: update igt_sysfs_engines to run dynamic tests with its
    associated engine class.
  tests/intel: Adopt igt_sysfs_engines dependent tests to use query
    engine class

 lib/igt_sysfs.c                      | 39 +++++++++++++++++++++++++---
 lib/igt_sysfs.h                      |  4 +--
 tests/intel/xe_exec_queue_property.c |  7 ++---
 tests/intel/xe_sysfs_defaults.c      |  5 ++--
 tests/intel/xe_sysfs_scheduler.c     | 10 ++++---
 5 files changed, 51 insertions(+), 14 deletions(-)

-- 
2.39.1

