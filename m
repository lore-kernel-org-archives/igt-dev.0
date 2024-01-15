Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E5610E2EF
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jan 2024 15:44:57 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/2] benchmarks/gem_wsim: Extend engine selection syntax
Date: Mon, 15 Jan 2024 16:44:46 +0100
Message-Id: <20240115154448.29263-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Introduces significant changes to the engine selection syntax:
- Dynamically generates the list of available physical engines.
- Identifies engines using [class:instance:gt] tuples.
- Allows specifying engine instance and gt as 
  `engine_class[<engine_instance>-<gt_id>]`.
- Adds support for compute engine class (CCS).
- Maintains 1-based engine instance ids for compatibility 
  with existing workload definitions.
- Enhances `w_step` with `engine_idx`
  and `request_idx` for throttling functionality
  (both populated during prepare workload phase).

Adds command line option (-l) to list physical engines.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Marcin Bernatowicz (2):
  benchmarks/gem_wsim: Extend engine selection syntax
  benchmarks/gem_wsim: Option to list physical engines

 benchmarks/gem_wsim.c | 831 ++++++++++++++++++++++--------------------
 1 file changed, 444 insertions(+), 387 deletions(-)

-- 
2.31.1
