Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B73610E09A
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Apr 2023 16:22:17 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 26 Apr 2023 18:22:06 +0200
Message-Id: <20230426162207.36995-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/1] Use new library libproc2
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

This is resend of https://patchwork.freedesktop.org/series/111015/
"Use the new procps library libproc2"

with some minor editions and rebase. With this igt will compile
on current Ubuntu 23.04

v2: instead of igt_fork use igt_fork_helper, add also error print
  and exit with errno if getting procps_pids_new info fails

Craig Small (1):
  Use the new procps library libproc2

 lib/igt_aux.c   | 245 ++++++++++++++++++++++++++++++++++++++++--------
 lib/meson.build |   7 +-
 meson.build     |  10 +-
 3 files changed, 220 insertions(+), 42 deletions(-)

-- 
2.37.2
