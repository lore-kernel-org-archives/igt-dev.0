Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0124510E44D
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 11:20:07 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Sep 2022 13:19:53 +0200
Message-Id: <20220928111954.19569-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/1] i915/hangman: Fix gt hang/error tests
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

This is resend of the patch from Umesh
https://patchwork.freedesktop.org/series/103845/

with only two minor fixes to whitespaces.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Umesh Nerlige Ramappa (1):
  i915/hangman: Fix gt hang/error tests

 tests/i915/i915_hangman.c | 75 +++++++++++++++++++++++++++++++--------
 1 file changed, 60 insertions(+), 15 deletions(-)

-- 
2.34.1
