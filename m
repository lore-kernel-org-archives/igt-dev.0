Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA4B6F3CB
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2020 06:38:24 +0000 (UTC)
From: Sreedhar Telukuntla <sreedhar.telukuntla@intel.com>
Date: Fri, 17 Jan 2020 20:09:35 +0530
Message-Id: <20200117143936.5726-1-sreedhar.telukuntla@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/1] tests/i915/gem_exec_parallel: Set
 engine map to default context
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

All the *-fds tests are using default kernel context for submitting
the workload to gpu. As CCS0 is not supported in legacy exec flow,
CCS0-fds is failing with error -22. Set the supported engine map to
default context to allow the workload submission to CCS engine.


Sreedhar Telukuntla (1):
  tests/i915/gem_exec_parallel: Set engine map to default context

 tests/i915/gem_exec_parallel.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
