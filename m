Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF4910E351
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Sep 2022 12:57:02 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Mon,  5 Sep 2022 18:23:19 +0530
Message-Id: <20220905125320.3475254-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/1] lib/igt_core.h: Introduce
 igt_subtest_group_named
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

igt_subtest_group_named will check for requirements only
when the subtest inside igt_subtest_group_named are executed.

This will help in avoiding the logging related to requirements of
subgroup tests when tests outside the subgroup are executed
individually.

Janga Rahul Kumar (1):
  lib/igt_core.h: Introduce igt_subtest_group_named

 lib/igt_core.c | 23 +++++++++++++++++++++++
 lib/igt_core.h | 20 ++++++++++++++++++++
 2 files changed, 43 insertions(+)

-- 
2.25.1
