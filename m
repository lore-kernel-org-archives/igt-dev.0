Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAE110E69D
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Sep 2023 18:19:33 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 28 Sep 2023 17:45:18 +0000
Message-ID: <20230928174535.2074462-4-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230928174535.2074462-1-marcin.bernatowicz@linux.intel.com>
References: <20230928174535.2074462-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 03/17] benchmarks/gem_wsim: fix scaling of
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

v2:
- apply same approach as with DELAY step (Tvrtko)

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 42690d3d0..41557517c 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -1186,6 +1186,8 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 add_step:
 		if (step.type == DELAY)
 			step.delay = __duration(step.delay, scale_time);
+		else if (step.type == PERIOD)
+			step.period = __duration(step.period, scale_time);
 
 		step.idx = nr_steps++;
 		step.request = -1;
-- 
2.42.0
