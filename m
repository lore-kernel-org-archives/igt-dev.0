Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8E3CD128A
	for <igt-dev@archiver.kernel.org>; Mon,  1 Apr 2024 18:47:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD5110F3DE;
	Mon,  1 Apr 2024 18:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQ6MI8+s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFF710F3DA
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Apr 2024 18:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711997262; x=1743533262;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WrRfqz2nXJPHuZyo0FkxQR8+dWGLBo5MbPqimiXZbNw=;
 b=gQ6MI8+s18WbE+8Jh+HMBtjIeM4LDAd2bVKACQRJR01iAm6FAKl9y8eI
 lKsrqCHqJd/dQPIBVi1YOBaZ6ZIsxAS/Apk2ntp998iiNk6mcXjvNvDox
 rZ64Qt8VuubB4JGuH3GUichU8qbyU3A+nN+CkzDf9ezmQWy4IWZ2sAz/Q
 7ETp4MynGj3EgLKxhbxQ/yQ9rD7Q3MOetHFAVrF9zWz+PIVOFtaYL7+wl
 dYV9gbTIiCDL+g30TYP+x3DpmLbM2V/3rAT290qiosEni3z+gyClm8hUo
 QKiQ+dgZKV47QARTOhPDMViI8tmqnwZLnbPK4h27xPBgRCCOie2mbuRvA w==;
X-CSE-ConnectionGUID: tfx7KqwjTnqAJJvVBVGCUA==
X-CSE-MsgGUID: +uuG8Eh2SsKIXE/ZcBkWKA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7349554"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="7349554"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 11:47:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="18260678"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by orviesa006.jf.intel.com with ESMTP; 01 Apr 2024 11:47:40 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, rodrigo.vivi@intel.com,
 sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t 0/3] tests/intel/xe_pm: Tests to validate vm-bind with
 S&R 
Date: Tue,  2 Apr 2024 00:16:28 +0530
Message-Id: <20240401184631.346-1-sai.gowtham.ch@intel.com>
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

This patch series has following changes:
1. Validate functionality of VM_BIND USERPTR/PREFETCH op with S&R
2. Test vm_unbind op by binding multiple va's to a vm and check the
functionality with S&R.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Sai Gowtham Ch (3):
  tests/intel/xe_pm: Test validates vm-bind userptr flag with suspend
    and resume
  tests/intel/xe_pm: Validate vm-bind prefetch flag with suspend and
    resume
  tests/intel/xe_pm: Tests vm-unbind all flag functionality with S&R

 tests/intel/xe_pm.c | 102 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 82 insertions(+), 20 deletions(-)

-- 
2.39.1

