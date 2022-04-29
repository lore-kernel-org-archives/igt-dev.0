Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054AE10FB92
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 06:28:53 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org,
	priyanka.dandamudi@intel.com
Date: Fri, 29 Apr 2022 11:50:16 +0530
Message-Id: <20220429062018.562391-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] HAX add description to gem_madvise
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add test description to gem_madvise.

Priyanka Dandamudi (2):
  i915/gem_madvise: added description for test case
  HAX: don't do full run

 tests/i915/gem_madvise.c              |   8 ++
 tests/intel-ci/fast-feedback.testlist | 182 +-------------------------
 2 files changed, 9 insertions(+), 181 deletions(-)

-- 
2.25.1
