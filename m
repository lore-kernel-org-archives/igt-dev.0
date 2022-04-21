Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E7D10F40E
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 06:10:01 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 21 Apr 2022 08:09:52 +0200
Message-Id: <20220421060955.21016-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Fix couple of gem_exec_schedule subtests
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

This is first series of fixing gem_exec_schedule subtests. Other are
in work in progress but as there's time required for review I decided
to split it to separate series.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Chris Wilson (1):
  i915/gem_exec_schedule: Fix context creation for shared-vm

Zbigniew Kempczyński (2):
  tests/i915/gem_exec_schedule: Don't use default context
  tests/i915/gem_exec_schedule: Use separate context for spinner

 tests/i915/gem_exec_schedule.c | 40 ++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 14 deletions(-)

-- 
2.32.0
