Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4145510E19F
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Oct 2023 05:12:18 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Oct 2023 10:49:57 +0530
Message-Id: <20231003051959.461527-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] PR related lib changes
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

We have patches in ml for panel replay for kmd,
based on that igt has some changes figuring out
the mode from debugfs info

Kunal Joshi (2):
  lib/igt_psr: added enum for PR mode
  lib/igt_psr: updated functions to check PR support

 lib/igt_psr.c | 56 +++++++++++++++++++++++++++++----------------------
 lib/igt_psr.h |  2 ++
 2 files changed, 34 insertions(+), 24 deletions(-)

-- 
2.25.1
