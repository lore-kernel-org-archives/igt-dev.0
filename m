Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E726E6E0D8
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Jan 2021 11:18:00 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Tue,  5 Jan 2021 13:17:43 +0200
Message-Id: <20210105111749.463432-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/6] lib/i915/perf: Synchronize perf metrics
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

A small update on the perf files. Nothing ground breaking.

Cheers,

Lionel Landwerlin (6):
  lib/i915/perf: update gen9/10/11 TestOa configs
  lib/i915/perf: update Gen11 RenderBasic programming
  lib/i915/perf: update gen10/11 ComputeBasic programming
  lib/i915/perf: add EHL availability condition to HDCAndSF counters
  lib/i915/perf: reorder CNL counter
  lib/i915/perf: update Gen9/11 programming for AsyncCompute

 lib/i915/perf-configs/guids.xml     | 46 ++++++++++++++---------------
 lib/i915/perf-configs/oa-cflgt2.xml | 10 +++++--
 lib/i915/perf-configs/oa-cflgt3.xml | 10 +++++--
 lib/i915/perf-configs/oa-cnl.xml    | 36 ++++++++++++----------
 lib/i915/perf-configs/oa-ehl.xml    | 18 +++++++----
 lib/i915/perf-configs/oa-icl.xml    | 18 ++++++-----
 lib/i915/perf-configs/oa-kblgt2.xml | 10 +++++--
 lib/i915/perf-configs/oa-kblgt3.xml | 10 +++++--
 lib/i915/perf-configs/oa-sklgt2.xml | 10 +++++--
 lib/i915/perf-configs/oa-sklgt3.xml | 10 +++++--
 lib/i915/perf-configs/oa-sklgt4.xml | 10 +++++--
 11 files changed, 116 insertions(+), 72 deletions(-)

--
2.30.0
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
