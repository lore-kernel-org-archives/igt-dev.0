Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68255D767D8
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 16:31:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81AF10E0A6;
	Thu, 31 Oct 2024 16:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OC8OMTDK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F1410E0A6
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 16:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730392283; x=1761928283;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T/noB5pMvS+HzkNBqL2hZWzXemrvXXdZzC6UkZGGw9Q=;
 b=OC8OMTDK90kbKp5jYaFrpuHfiIRyVd0opg5AlsyTtbHIuq7mUhXdUogV
 zL9M34Y5vPiUxsGJuxx2jipNZIU8BKHNLjrmjBUt7nX3tD7Bo+ZUcBuse
 SOKBpbfBl+VXeWa0c3yFrWrHuFkw5dewhs+Hx6w4sJL3UFlDxbL9hP6MV
 /5GYG4ksUqd7bOGdYTYI1uYthWQYYFCJLLI6nI/Pca2lyKFQIpJLzN6cf
 yDn7CLvUMtZhE29pW8a/ZSnD4TYUJr5lUVrss52gJkiL4M/ewm7NJZUIV
 FJgs8bxXH9Eob1fX1SkDp0dXgvifgXSU2OZOfRwRn0NxWr7ijE8KzJtmB w==;
X-CSE-ConnectionGUID: Hy4Lczk8QYW3HIN24r2Agg==
X-CSE-MsgGUID: hZEg61vNQ7KH8J+wmuQ/2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="17782502"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="17782502"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 09:31:22 -0700
X-CSE-ConnectionGUID: fadaFQT7QeGaPGFb2pW9Kw==
X-CSE-MsgGUID: a16+Tc5OSdW5pfpI2g+GjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="82804805"
Received: from dut138lnl.fm.intel.com ([10.105.23.14])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 09:31:23 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 kamil.konieczny@linux.intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH v2 0/2] test/intel/xe_sysfs: Restore sysfs params correctly
Date: Thu, 31 Oct 2024 16:31:20 +0000
Message-ID: <20241031163122.37356-1-jonathan.cavitt@intel.com>
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

The xe_sysfs_timeslice_duration and xe_sysfs_preempt_timeout tests do
not correctly restore modified sysfs params on test failure.
Additionally, xe_sysfs_timeslice_duration modifies but does not restore
preempt_timeout_us.  Repair these issues.

Jonathan Cavitt (2):
  tests/intel/sysfs: Restore sysfs values on test failure
  tests/intel/xe_sysfs_timeslice_duration: Restore preempt timeout

 tests/intel/xe_sysfs_preempt_timeout.c    | 34 ++++++++++++------
 tests/intel/xe_sysfs_timeslice_duration.c | 44 +++++++++++++++++------
 2 files changed, 58 insertions(+), 20 deletions(-)

-- 
2.43.0

