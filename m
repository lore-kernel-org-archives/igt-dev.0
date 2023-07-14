Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957A310E0E7
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jul 2023 15:39:57 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Fri, 14 Jul 2023 17:39:44 +0200
Message-Id: <20230714153946.36448-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] RFC: runner: dump GPU error state on
 timeout
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Create dump of GPU error state when test is interrupted by
executor due to per-test timeout or inactivity. In those cases
dump by kernel sysrq('G') may be empty so use drm error or dri
debug info.

Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Kamil Konieczny (2):
  runner/settings: add dump-gpu-on-timeout option
  runner/executor: write GPU error on timeout

 runner/executor.c | 68 +++++++++++++++++++++++++++++++++++++++++++++--
 runner/executor.h |  2 ++
 runner/settings.c | 12 ++++++++-
 runner/settings.h |  1 +
 4 files changed, 80 insertions(+), 3 deletions(-)

-- 
2.39.2


