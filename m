Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDD710E456
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jun 2023 08:03:26 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Wed,  7 Jun 2023 13:33:50 +0530
Message-Id: <20230607080352.950226-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add VM error capture tests
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Add tests to check VM error capture.

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Janga Rahul Kumar (2):
  tests/xe_vm.c: Add VM bind error capture test
  tests/xe_vm.c: Add Negative test to VM error capture

 tests/xe/xe_vm.c | 81 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

-- 
2.25.1
