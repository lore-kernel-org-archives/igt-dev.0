Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2223710EA2E
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Dec 2023 09:06:43 +0000 (UTC)
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/1] tests/intel/xe_create: create-contexts subtest
Date: Fri,  8 Dec 2023 10:05:57 +0100
Message-Id: <20231208090558.17004-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Validates the creation of significant number of HW contexts (4096 as
default). The number of contexts to create can be adjusted using command
line '-Q' parameter representing resource quantity.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

Lukasz Laguna (1):
  tests/intel/xe_create: create-contexts subtest

 tests/intel/xe_create.c | 65 ++++++++++++++++++++++++++++++++---------
 1 file changed, 51 insertions(+), 14 deletions(-)

-- 
2.40.0
