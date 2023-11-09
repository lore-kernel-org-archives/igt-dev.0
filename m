Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE1610E8C6
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 15:18:08 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, janga.rahul.kumar@intel.com,
 igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 20:43:45 +0530
Message-Id: <20231109151347.2129614-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/2 i-g-t] Tests for engine set property
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

Added tests to check engine set property ioctl.

v2: Modified code to work for all platforms.(Rahul)

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Priyanka Dandamudi (2):
  tests/intel/xe_engine_property: Add engine set property tests
  tests/intel/xe_engine_property: Add scheduler engine set property

 tests/intel/xe_engine_property.c | 185 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 186 insertions(+)
 create mode 100644 tests/intel/xe_engine_property.c

-- 
2.25.1
