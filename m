Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A0310EA8D
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Dec 2023 19:29:43 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/2] Extend xe_query to multi-GPU
Date: Fri, 15 Dec 2023 20:29:32 +0100
Message-ID: <20231215192934.83009-1-kamil.konieczny@linux.intel.com>
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

Make xe_query tests capable to run on all GPUs present on a board.
First patch prepares easy extension to multi-GPU runs, second one
adds this new capability.

Kamil Konieczny (2):
  tests/intel/xe_query: Refactor subtests
  tests/intel/xe_query: Add multigpu subtests

 tests/intel/xe_query.c | 130 ++++++++++++++++++++++++++++++-----------
 1 file changed, 96 insertions(+), 34 deletions(-)

-- 
2.42.0
