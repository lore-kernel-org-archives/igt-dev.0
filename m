Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F349E6E9A0
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2020 11:25:45 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Wed, 25 Nov 2020 13:25:37 +0200
Message-Id: <20201125112540.426554-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/3] tests/i915/perf: verify non zero
 reason field in OA reports
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

In the process of checking those reason values, I found out about the
reports with the same timestamps.

Thanks a lot to Umesh for suggesting those changes.

Cheers,

Lionel Landwerlin (3):
  tests/i915/perf: constify report checks functions
  tests/i915/perf: deal with 0 delta reports
  tests/i915/perf: verify reason field in OA reports is never 0

 tests/i915/perf.c | 201 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 151 insertions(+), 50 deletions(-)

--
2.29.2
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
