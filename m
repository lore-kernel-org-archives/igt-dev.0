Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616EE10E1EE
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 04:44:24 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 sai.gowtham.ch@intel.com
Date: Tue, 28 Jun 2022 10:13:37 +0530
Message-Id: <20220628044339.14809-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] HAX add description to gem_exec_create
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Add test description to gem_exec_create.

Sai Gowtham Ch (2):
  i915/gem_exec_create: Added test description for test case.
  HAX: don't do full run

 tests/i915/gem_exec_create.c          |  13 ++
 tests/intel-ci/fast-feedback.testlist | 178 +-------------------------
 2 files changed, 14 insertions(+), 177 deletions(-)

-- 
2.35.1
