Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F11610E032
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Apr 2023 18:24:45 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Apr 2023 20:24:37 +0200
Message-Id: <20230420182440.49442-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Add multi-gpu basic error state subtest
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

This adds basic error state check subtest for multi-GPU hw
config. First two patches are preparation for change and do only
moving out global vars into local ones.

Kamil Konieczny (3):
  tests/i915_hangman: make sysfs var local
  tests/i915_hangman: make device var local
  tests/i915_hangman: add multigpu basic error state subtest

 tests/i915/i915_hangman.c | 166 ++++++++++++++++++++++++--------------
 1 file changed, 107 insertions(+), 59 deletions(-)

-- 
2.37.2
