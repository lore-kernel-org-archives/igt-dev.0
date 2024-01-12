Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A78B10EA57
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jan 2024 08:46:15 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/2] add support for choosing big joiner mode
Date: Fri, 12 Jan 2024 14:25:45 +0530
Message-Id: <20240112085547.673712-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

add support to choose big joiner mode with environment
variable, use mode with highest clock if no mode with big joiner
found.

Kunal Joshi (2):
  lib/igt_kms: move bigjoiner_mode_found to lib.
  lib/igt_kms: add support for choosing big joiner mode

 lib/igt_kms.c                | 25 ++++++++++++++++++++++++-
 lib/igt_kms.h                |  3 +++
 tests/intel/kms_big_joiner.c | 14 ++------------
 3 files changed, 29 insertions(+), 13 deletions(-)

-- 
2.25.1
