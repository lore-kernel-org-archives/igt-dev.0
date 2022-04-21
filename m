Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E23910E11D
 for <igt-dev@lists.freedesktop.org>; Sat, 26 Aug 2023 19:08:18 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 21 Apr 2022 19:06:36 +0530
Message-Id: <20220421133638.1492-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v1 0/2] kms lease
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

kms lease test check

Mohammed Thasleem (2):
  tests/kms_lease: Terminate lease fd before subtests execution
  HAX: Check kms lease

 tests/intel-ci/xe-fast-feedback.testlist |  21 ++
 tests/kms_lease.c                        | 261 +++++++++++------------
 2 files changed, 151 insertions(+), 131 deletions(-)

-- 
2.25.1
