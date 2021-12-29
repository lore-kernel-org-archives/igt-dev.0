Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472C710EB21
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Dec 2021 11:48:13 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 29 Dec 2021 12:48:04 +0100
Message-Id: <20211229114806.24218-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Bugfix series in bufops and allocator
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

Series contains two bugfix patches - bufops which fixes gem_render_copy
test on discrete (not exercised on CI yet) and allocator strategy overlook.

Zbigniew Kempczyński (2):
  lib/intel_bufops: Add fixed mapping for reading ccs data
  lib/intel_allocator: Fix invalid strategy on allocator helper code

 lib/intel_allocator.h |  2 +-
 lib/intel_bufops.c    | 14 ++++++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

-- 
2.32.0
