Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEA010EB48
 for <igt-dev@lists.freedesktop.org>; Mon,  9 May 2022 21:21:22 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 May 2022 14:21:26 -0700
Message-Id: <20220509212128.1844629-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Resurrect GuC Relay Logging
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

This series brings GuC relay logging back to life by
re-aligning the (previously implicit, now query-able)
guc-log-relay subbuffer-specs, debugfs file handle names
and usages between intel_guc_logger tool and i915.

This series depends on fixes and updates on the
kernel side via this series:
https://patchwork.freedesktop.org/series/103767/

Alan Previn (2):
  tools/intel_guc_logger: Re-enable basic functionality
  tools/intel_guc_logger: Refactor intel_guc_logger globals into structs

 tools/intel_guc_logger.c | 517 ++++++++++++++++++++++++++-------------
 1 file changed, 348 insertions(+), 169 deletions(-)


base-commit: cffa5fffe9acddf49565b4caeeb5e3355ff2ea44
-- 
2.25.1
