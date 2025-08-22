Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D7ECA0FE1
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 07:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9899C10EA82;
	Fri, 22 Aug 2025 07:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JvVEWjgU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C3610EA84
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 07:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755848469; x=1787384469;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V3AK5KZbGAzlPhXgIcS0HM0gG2VoQXhrOD+beWsodKQ=;
 b=JvVEWjgUK/sg/nzvLKew9W/SgGYGllLsjDu3zRTI07XI3S8G6eRqm4WB
 dbpFINtGsGk/0DaVBqDA9AGpzBfVtNRAvWnDTM1Ik/Ihpg0bqDXfpE/O0
 VzEoNSQXMUuYgZz+CYSvD0XpkJL9jo0qJB74oSO3lgPBvfLrnFmWlBqOM
 tN3R4ISaeYuHVe43HBKlpNzkyU+0rXAM+QkzmGpfRscXC7c9o7Kp0uQLz
 DgaW8cWGV84ov/qKsLzSGJfIXe/gkCAxjcz3ABvWFTeXGuC0FRMw0Gyj2
 nojtkjmfmlHO4U+pmG1c7SGIymS/KI7nuIIHPUR9enfU/ZM6W8ND0R2D4 A==;
X-CSE-ConnectionGUID: pcww8BIdQ0yTfwQzFkN5Nw==
X-CSE-MsgGUID: IYE8jM+4QoeU/9JWRxVD3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68754303"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="68754303"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 00:41:08 -0700
X-CSE-ConnectionGUID: uRf6LFRbR56IpNvmbYMo9g==
X-CSE-MsgGUID: G3tLMiOMS1G1oXg4sgBLdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="199601325"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by orviesa002.jf.intel.com with ESMTP; 22 Aug 2025 00:41:06 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t 0/5] Madvise Tests in IGT
Date: Fri, 22 Aug 2025 07:41:00 +0000
Message-ID: <20250822074105.479234-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

Added madvise tests in IGT which validate different features related
to attributes passed. Madvise tests related to Atomic operation,
Preferred Loc have been added and validated. Madvise tests are called as
part of different struct section and available as madvise-<test-name> in
list of subtests.


Nishit Sharma (5):
  include/drm-uap: Added drm_xe_madvise structure
  lib/xe: Added xe_vm_madvise ioctl support
  lib/xe: Helper added to get memory attributes
  tests/intel/xe_exec_system_allocator: Added preferred_loc_smem test
  tests/intel/xe_exec_system_allocator: Added atomic_batch test in IGT

 include/drm-uapi/xe_drm.h              | 289 +++++++++-
 lib/xe/xe_ioctl.c                      | 148 +++++
 lib/xe/xe_ioctl.h                      |   9 +-
 tests/intel/xe_exec_system_allocator.c | 742 +++++++++++++++++++++----
 4 files changed, 1074 insertions(+), 114 deletions(-)

-- 
2.43.0

