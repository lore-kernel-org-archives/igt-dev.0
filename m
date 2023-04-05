Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426A310E2DD
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Apr 2023 07:01:54 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  5 Apr 2023 12:28:30 +0530
Message-Id: <20230405065832.3485469-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] List engines belonging to a gt
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

Add a function that returns all engines belonging to a gt.
Create a intel_ctx_t with physical engines belonging to a gt

Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Ashutosh Dixit (1):
  lib/intel_ctx: Create intel_ctx with physical engines in a single gt

Riana Tauro (1):
  lib/i915/gem_engine_topology: list engines specific to gt

 lib/i915/gem_engine_topology.c | 73 ++++++++++++++++++++++++++++++++++
 lib/i915/gem_engine_topology.h |  6 +++
 lib/intel_ctx.c                | 42 +++++++++++++++++++
 lib/intel_ctx.h                |  2 +
 4 files changed, 123 insertions(+)

-- 
2.25.1
