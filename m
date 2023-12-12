Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C524510E1FA
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 17:48:25 +0000 (UTC)
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 0/2] Add create-contexts subtest
Date: Tue, 12 Dec 2023 18:48:14 +0100
Message-Id: <20231212174816.5292-1-lukasz.laguna@intel.com>
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

Validate the creation of significant number of HW contexts.

Lukasz Laguna (2):
  lib/xe/xe_ioctl: add __xe_exec_sync() helper
  tests/intel/xe_create: create-contexts subtest

 lib/xe/xe_ioctl.c       | 12 ++++--
 lib/xe/xe_ioctl.h       |  2 +
 tests/intel/xe_create.c | 81 ++++++++++++++++++++++++++++++++++-------
 3 files changed, 78 insertions(+), 17 deletions(-)

-- 
2.40.0
