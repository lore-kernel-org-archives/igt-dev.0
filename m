Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAF310E0F4
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Aug 2023 19:22:09 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Fri, 18 Aug 2023 21:22:00 +0200
Message-Id: <20230818192203.75155-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] RFC: runner/resultgen: lower dmesg
 copied when size limit was exceeded
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

When dmesg kernel log exceed its limit then copy into
results.json only limited number of lines. Add also
possibility for compressing dmesg.txt after is was processed.

Bug: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/129

Previous RFC: https://patchwork.freedesktop.org/series/119630/

Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Kamil Konieczny (3):
  runner/resultgen: limit dmesg added into results
  runner/settings: add compressor option
  runner/resultgen: compress dmesg if size limit hit

 runner/resultgen.c | 146 +++++++++++++++++++++++++++++++++++++++------
 runner/settings.c  |  34 ++++++++++-
 runner/settings.h  |   1 +
 3 files changed, 162 insertions(+), 19 deletions(-)

-- 
2.39.2


