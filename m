Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346676E55C
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2020 05:27:10 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
Date: Thu, 26 Nov 2020 10:33:18 +0530
Message-Id: <20201126050320.2434-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 0/2] Add subtests for HDCP over MST
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
 tests/kms_content_protection.c        | 280 ++++++++++++++++++++++++--
 2 files changed, 264 insertions(+), 22 deletions(-)

-- 
2.22.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
