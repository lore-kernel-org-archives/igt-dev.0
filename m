Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824626FF12
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2020 06:15:13 +0000 (UTC)
From: Sreedhar Telukuntla <sreedhar.telukuntla@intel.com>
Date: Fri, 24 Jan 2020 19:46:30 +0530
Message-Id: <20200124141631.2633-1-sreedhar.telukuntla@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/1]tests/i915/gem_exec_parallel:Set
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

Set the potential engine map of the parent client's default
context to the newly created DRM client's default context.
Without doing so there is a mismatch between the intended
and actual engine used by the *-fds subtests.

Sreedhar Telukuntla (1):
  tests/i915/gem_exec_parallel:Set engine map to default context

 tests/i915/gem_exec_parallel.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
