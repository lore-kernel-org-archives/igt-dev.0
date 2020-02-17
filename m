Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBADE6E976
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2020 14:59:12 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon, 17 Feb 2020 16:59:09 +0200
Message-Id: <20200217145910.510225-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6 0/1] tests: add i915-query perf tests
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

Hi all,

Hopefully everything is right now.

Cheers,

Lionel Landwerlin (1):
  tests/i915-query: add new tests for perf configurations queries

 tests/i915/i915_query.c | 615 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 615 insertions(+)

--
2.25.0
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
