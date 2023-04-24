Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CF810E12B
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Apr 2023 16:26:49 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 24 Apr 2023 18:26:41 +0200
Message-Id: <20230424162642.116013-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/1] Use new library libproc2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Craig Small <csmall@dropbear.xyz>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This is resend of https://patchwork.freedesktop.org/series/111015/
"Use the new procps library libproc2"

with some minor editions and rebase. With this igt will compile
on current Ubuntu 23.04

Cc: Craig Small <csmall@dropbear.xyz>
Cc: Petri Latvala <adrinael@adrinael.net>
Craig Small (1):
  Use the new procps library libproc2

 lib/igt_aux.c   | 243 ++++++++++++++++++++++++++++++++++++++++--------
 lib/meson.build |   7 +-
 meson.build     |  10 +-
 3 files changed, 218 insertions(+), 42 deletions(-)

-- 
2.37.2
