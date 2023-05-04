Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC1710E002
 for <igt-dev@lists.freedesktop.org>; Thu,  4 May 2023 20:39:52 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  5 May 2023 01:43:32 +0530
Message-Id: <20230504201334.23492-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 0/2] Add negative test for extended display
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

Return false on ENOSPC bandwidth failure in MST config.

Mohammed Thasleem (2):
  tests/kms_display_modes: Add negative test for extended display
  lib/igt_kms: Return false on ENOSPC bandwidth failure

 lib/igt_kms.c             |   2 +
 tests/kms_display_modes.c | 165 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 167 insertions(+)

-- 
2.25.1
