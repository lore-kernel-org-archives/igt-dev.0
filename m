Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96AF6E878
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2020 08:51:05 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
Date: Tue,  3 Nov 2020 13:56:26 +0530
Message-Id: <20201103082628.9287-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 0/2] Add subtests for HDCP over MST
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
 tests/kms_content_protection.c        | 234 +++++++++++++++++++++++++-
 2 files changed, 239 insertions(+), 1 deletion(-)

-- 
2.22.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
