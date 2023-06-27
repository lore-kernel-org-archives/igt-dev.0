Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E6010E2DB
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 10:24:19 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Jun 2023 15:56:54 +0530
Message-Id: <20230627102656.475578-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2]  Remove rc6 tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Remove rc6 tests from guc_pc. The sysfs paths of rc6 has
been changed and is generic

New tests will be added

Riana Tauro (2):
  tests/xe/xe_guc_pc: Remove rc6 tests
  xe-fast-feedback.testlist: Remove rc6 tests from BAT

 tests/intel-ci/xe-fast-feedback.testlist |  2 --
 tests/xe/xe_guc_pc.c                     | 44 ------------------------
 2 files changed, 46 deletions(-)

-- 
2.40.0
