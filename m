Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1006410E116
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Dec 2021 08:34:41 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu,  9 Dec 2021 09:34:27 +0100
Message-Id: <20211209083429.20441-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Predicate for CI only
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

Just for test purposes

Zbigniew Kempczyński (2):
  tests/gem_exec_predicate: Leave predicate set before bbe
  HAX: don't do full run

 tests/i915/gem_exec_predicate.c       |  61 +++++++++
 tests/intel-ci/fast-feedback.testlist | 179 +-------------------------
 tests/meson.build                     |   1 +
 3 files changed, 64 insertions(+), 177 deletions(-)
 create mode 100644 tests/i915/gem_exec_predicate.c

-- 
2.26.0
