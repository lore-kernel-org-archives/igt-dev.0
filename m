Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6D26E084
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2020 10:32:08 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
Date: Fri, 23 Oct 2020 15:37:07 +0530
Message-Id: <20201023100709.5211-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/2] Add subtests for HDCP over MST
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
 tests/kms_content_protection.c        | 220 ++++++++++++++++++++++++++
 2 files changed, 226 insertions(+)

-- 
2.22.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
