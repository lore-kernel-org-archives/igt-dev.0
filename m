Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49E410E651
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Nov 2023 05:32:08 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, janga.rahul.kumar@intel.com,
 igt-dev@lists.freedesktop.org
Date: Fri, 10 Nov 2023 10:57:44 +0530
Message-Id: <20231110052746.2131907-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Tests for exec queue set property
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

Added tests to check exec queue set property ioctl.

v2: Modified code to work for all platforms.(Rahul)

v3: Some minor changes.(Rahul,Matt,Kamil)

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Priyanka Dandamudi (2):
  tests/intel/xe_exec_queue_property: Add exec queue set property tests
  tests/intel/xe_exec_queue_property: Add scheduler exec queue set
    property

 tests/intel/xe_exec_queue_property.c | 189 +++++++++++++++++++++++++++
 tests/meson.build                    |   1 +
 2 files changed, 190 insertions(+)
 create mode 100644 tests/intel/xe_exec_queue_property.c

-- 
2.25.1
