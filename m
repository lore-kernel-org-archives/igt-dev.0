Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C47210E0A0
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Apr 2022 18:27:40 +0000 (UTC)
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Apr 2022 11:22:27 -0700
Message-Id: <20220401182229.3308644-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] Unload mei_gsc before i915
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

mei_gsc is a new module [1] that binds to an aux device exposed by i915,
so it depends on it and needs to be removed before we can unload i915.

Note that the module is automatically loaded by the kernel as a follow-up
to i915 loading, which means its probe might still be in progress by the
time a test attempt to unload again, which will make the unload fail. To
avoid this, we can stall the unload if the probe is still in progress.

v2: move the wait to the recursive function, so it gets called for all
dependent modules as well (Ashutosh)

[1] https://patchwork.freedesktop.org/series/98066/

Cc: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>

Daniele Ceraolo Spurio (2):
  lib/igt_kmod: Wait for a kmod to finish its probe before unloding it.
  lib/igt_kmod: Unload mei modules before unloading i915

 lib/igt_kmod.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

-- 
2.25.1
