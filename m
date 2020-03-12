Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4166EB4F
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2020 23:05:36 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Thu, 12 Mar 2020 23:05:33 +0000
Message-Id: <20200312230535.4613-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] [PATCH i-g-t 0/2] Test configurable poll delay in perf OA
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>, Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Add tests that verify the configurable poll delay in perf OA.

Lionel Landwerlin (2):
  include/drm-uapi: Update i915_drm.h for perf OA APIs
  tests/perf: new tests for parameterized OA buffer polling

 include/drm-uapi/i915_drm.h |  13 ++++
 tests/perf.c                | 132 ++++++++++++++++++++++++++----------
 2 files changed, 111 insertions(+), 34 deletions(-)

-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
