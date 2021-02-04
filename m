Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329C56EC73
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Feb 2021 04:37:05 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
Date: Thu,  4 Feb 2021 09:39:32 +0530
Message-Id: <20210204040934.19488-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6 0/2] Add subtests for HDCP over MST
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

Add subtests to verify content protection on MST set up.

Karthik B S (2):
  tests/kms_content_protection: Add MST subtests
  CI HAX: Add MST tests to fast feedback testlist

 tests/intel-ci/fast-feedback.testlist |   6 +
 tests/kms_content_protection.c        | 277 ++++++++++++++++++++++++--
 2 files changed, 261 insertions(+), 22 deletions(-)

-- 
2.22.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
