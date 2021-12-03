Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A976EE48
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Dec 2021 05:59:49 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  3 Dec 2021 06:59:43 +0100
Message-Id: <20211203055944.9183-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/1] Isolate wait bb within gem_exec_fence
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

As I'm working on same test so to avoid painful rebase later
I send Chris patch in which wait bb is isolated and no additional
fields for it in common structure are required.

Chris Wilson (1):
  INTEL_DII: i915/gem_exec_fence: Allow wait_bb to run on !rcs

 tests/i915/gem_exec_fence.c | 141 ++++++++++++++++++------------------
 1 file changed, 72 insertions(+), 69 deletions(-)

-- 
2.26.0
