Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C1510E389
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 09:18:44 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 26 Sep 2023 08:44:18 +0000
Message-ID: <20230926084451.1732748-4-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230926084451.1732748-1-marcin.bernatowicz@linux.intel.com>
References: <20230926084451.1732748-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 03/14] benchmarks/gem_wsim: fix scaling of
 period steps
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

Period steps take scale time (-F) command line option into account.
This allows to scale workload without need to modify .wsim file

ex. having following example.wsim

1.VCS1.3000.0.1
1.RCS.500-1000.-1.0
1.RCS.3700.0.0
1.RCS.1000.-2.0
1.VCS2.2300.-2.0
1.RCS.4700.-1.0
1.VCS2.600.-1.1
p.16000

we can scale the whole workload x10 with:

gem_wsim -w example.wsim -f 10 -F 10

-f is for batch duration steps, -F for period and delay steps

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 90a36f7de..65061461d 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -899,8 +899,14 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 				int_field(DELAY, delay, tmp <= 0,
 					  "Invalid delay at step %u!\n");
 			} else if (!strcmp(field, "p")) {
-				int_field(PERIOD, period, tmp <= 0,
-					  "Invalid period at step %u!\n");
+				field = strtok_r(fstart, ".", &fctx);
+				if (field) {
+					tmp = atoi(field);
+					check_arg(tmp <= 0, "Invalid period at step %u!\n", nr_steps);
+					step.type = PERIOD;
+					step.period = __duration(tmp, scale_time);
+					goto add_step;
+				}
 			} else if (!strcmp(field, "P")) {
 				unsigned int nr = 0;
 				while ((field = strtok_r(fstart, ".", &fctx))) {
-- 
2.42.0
