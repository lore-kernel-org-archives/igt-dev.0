Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3166E422
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2020 13:39:00 +0000 (UTC)
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date: Tue, 23 Jun 2020 19:04:13 +0530
Message-Id: <20200623133416.4275-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [Patch][i-g-t v3 0/3] Add support to detect HDCP events
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This patch-series modifies the igt_kms to add support to detect
connector events. This support is then used for detecting
HDCP events in kms_content_protection. 
Third patch, renames the APIs to have generic names.

Ankit Nautiyal (3):
  lib/igt_kms: Add support for detecting connector events
  tests/kms_content_protection: Use library functions for handling
    uevents
  lib: Use generic names for APIs that handle uevents

 lib/igt_kms.c                  |  99 ++++++++++++++--------
 lib/igt_kms.h                  |   8 +-
 tests/kms_chamelium.c          |  36 ++++----
 tests/kms_content_protection.c | 146 ++-------------------------------
 tests/kms_flip.c               |   6 +-
 tests/kms_lease.c              |   6 +-
 6 files changed, 103 insertions(+), 198 deletions(-)

-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
