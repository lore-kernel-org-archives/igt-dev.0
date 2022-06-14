Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8442910E8AF
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 09:19:35 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Jun 2022 14:50:23 +0530
Message-Id: <20220614092025.11404-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 0/2] Addition of test to validate scaling filters
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

New tests are added to validate scaling filters.

Swati Sharma (2):
  lib/igt_kms: Add scaling filter property
  tests/kms_scaling_filters: New IGT to validate scaling filters

 lib/igt_kms.c               |  24 ++++++
 lib/igt_kms.h               |   3 +
 tests/kms_scaling_filters.c | 163 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 4 files changed, 191 insertions(+)
 create mode 100644 tests/kms_scaling_filters.c

-- 
2.25.1
