Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED181113B4D
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jun 2022 06:31:53 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 sai.gowtham.ch@intel.com
Date: Thu, 16 Jun 2022 12:01:21 +0530
Message-Id: <20220616063123.11029-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] HAX add description to
 gem_tiled_pread_basic
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

Add test description to gem_tiled_pread_basic.

Sai Gowtham Ch (2):
  i915/gem_tiled_pread_basic: Add test description
  HAX: don't do full run

 tests/i915/gem_tiled_pread_basic.c    |   4 +-
 tests/intel-ci/fast-feedback.testlist | 188 +-------------------------
 2 files changed, 4 insertions(+), 188 deletions(-)

-- 
2.35.1
