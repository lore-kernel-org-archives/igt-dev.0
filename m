Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAD1C25B75
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 06:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD8910E1B5;
	Fri, 31 May 2024 06:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BgSEgVPR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F60B10E1B5
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 06:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717135583; x=1748671583;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JYrxQ6xy3Fgq1mpiZac9ibH9MZK1uPXwrJjYfoN+lII=;
 b=BgSEgVPRAJJtmEF5Y/m/K5BzeB6vPAXfDDLuI3FT19y41xHhg/go9VAU
 HHg4LCri1gP9QU6ywb8n15RelsuT8iFGDRCIoIqN4LCux/5Z+qmLxqdgX
 YwvJLFfxc+KK4QjqRqSZMGPY6xvr8H2vw64tsHjPSQ4Gofs1wvhpd4fP/
 cEyiU62uQKM6dhYrA8sWQq+lbCKg0F6jhrDwKbZHg9g5bv2SWF+A3+KOE
 AY8/4i5bR2KG9NhsrHjwJuphlVUSh9mHo+g0mZTkvSi7ulNqElJKWTZFJ
 5preMOkmr/zctrKZVxFpN18zZ/WgXBQhTJ1bjBMXw41fGGhNI201ExCG8 g==;
X-CSE-ConnectionGUID: Q7OV+yvuRB2AoQCmUMUtww==
X-CSE-MsgGUID: irZpSG0SSf2EyJsCyB2wUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13534256"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="13534256"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 23:06:22 -0700
X-CSE-ConnectionGUID: zGhUYIhjQdO0R4rg0nAnMQ==
X-CSE-MsgGUID: yCo2o3LGT+qe/UnkMhUULw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="35993399"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa007.fm.intel.com with ESMTP; 30 May 2024 23:06:20 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 0/2] Update kms_plane test
Date: Fri, 31 May 2024 11:36:20 +0530
Message-Id: <20240531060622.489881-1-pranay.samala@intel.com>
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

First patch reduces the CI loggings.
Second patch converts the test structure to execute on multiple planes
on dynamic level.

v3: The test is running on local simulation (Juha-pekka)

Pranay Samala (2):
  tests/kms_plane: Reduce CI logging
  tests/kms_plane: Convert to dynamic subtests

 tests/kms_plane.c | 72 +++++++++++++++++++++++++++--------------------
 1 file changed, 42 insertions(+), 30 deletions(-)

-- 
2.34.1

