Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CE96E0A1
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Oct 2021 10:18:45 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Thu, 28 Oct 2021 12:18:16 +0200
Message-Id: <20211028101819.17967-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Change duplicate names
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
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Change tests names to ensure uniqness.

Kamil Konieczny (2):
  tests/gem_sync: Change duplicate subtest names
  tests/gem_exec_whisper: Change duplicated test names

Petri Latvala (1):
  tests/igt_command_line.sh: Check for duplicate subtest names

 tests/i915/gem_exec_whisper.c |  2 +-
 tests/i915/gem_sync.c         |  2 +-
 tests/igt_command_line.sh     | 11 +++++++++++
 3 files changed, 13 insertions(+), 2 deletions(-)

-- 
2.30.2
