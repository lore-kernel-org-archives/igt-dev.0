Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF7E10E772
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Dec 2023 10:56:13 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t 0/2] Add Persistent support.
Date: Fri, 22 Dec 2023 16:23:51 +0530
Message-Id: <20231222105353.23355-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This series has two changes as followes:
1. Add persistent batch buffer instruction to the lib.
2. Add Persistent subtest to xe_exec_store.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Sai Gowtham Ch (2):
  include/intel_gpu_commands: Add persistent batch buffer instruction.
  intel/xe_exec_store: Add Persistent subtest

 include/intel_gpu_commands.h |  1 +
 tests/intel/xe_exec_store.c  | 86 ++++++++++++++++++++++++++++++++++++
 2 files changed, 87 insertions(+)

-- 
2.39.1
