Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153C910E2DA
 for <igt-dev@lists.freedesktop.org>; Sun,  7 May 2023 19:44:54 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  8 May 2023 01:09:41 +0530
Message-Id: <20230507193943.57877-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 0/2] Add negative test for extended display
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Added negative test to validte ENOSPC when two 2k-4k or 4k-4k
moniters connected through MST.
This test added to provide bandwidth issue in MST config.

Mohammed Thasleem (2):
  tests/kms_display_modes: Add negative test for extended display
  lib/igt_kms: Check for other modes to fit on bw when ENOSPC failure

 lib/igt_kms.c             |   2 +
 tests/kms_display_modes.c | 165 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 167 insertions(+)

-- 
2.25.1
