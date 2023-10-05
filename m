Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDADE10E490
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Oct 2023 19:31:21 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  5 Oct 2023 18:57:21 +0000
Message-ID: <20231005185745.3056219-4-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20231005185745.3056219-1-marcin.bernatowicz@linux.intel.com>
References: <20231005185745.3056219-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 03/17] benchmarks/gem_wsim: fix duration
 range check
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@linux.intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

When scale duration (-f) command line option is provided,
the max duration check does not take it into account, fix it.

v2:
- improve error message (Tvrtko)

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 42690d3d0..9d9cbd9c2 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -1142,10 +1142,10 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 				if (sep && *sep == '-') {
 					tmpl = strtol(sep + 1, NULL, 10);
 					check_arg(tmpl <= 0 ||
-						tmpl <= step.duration.min ||
+						__duration(tmpl, scale_dur) <= step.duration.min ||
 						tmpl == LONG_MIN ||
 						tmpl == LONG_MAX,
-						"Invalid duration range at step %u!\n",
+						"Invalid maximum duration at step %u!\n",
 						nr_steps);
 					step.duration.max = __duration(tmpl,
 								       scale_dur);
-- 
2.42.0
