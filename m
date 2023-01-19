Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF17A10E99C
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jan 2023 16:56:03 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 19 Jan 2023 22:27:00 +0530
Message-Id: <20230119165702.9558-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/2] lib/igt_draw: Change MOCS settings for MTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: lucas.demarchi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On MTL, we want the table entry labelled "UC (GO:Mem)"
which has index 5.  This means that the MOCS value is 10.

v2: Add define for MOCS settings. (Lucas)
v3: Extending get_mocs_index and using get_mocs_index
    to get mocs val. (Zbigniew)
v4: Spliting the patches as Fix and MTL changes.
v5: Remove comment line.

Jeevan B (2):
  lib/igt_draw: Use intel_get_uc_mocs to get MOCS value
  lib/igt_draw: Add MOCS values for MTL

 lib/i915/intel_mocs.c | 12 ++++++++----
 lib/igt_draw.c        |  4 ++--
 2 files changed, 10 insertions(+), 6 deletions(-)

-- 
2.19.1
