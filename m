Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F95112BC9
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Jul 2022 11:51:27 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Jul 2022 13:51:14 +0200
Message-Id: <20220701115115.5984-2-nirmoy.das@intel.com>
In-Reply-To: <20220701115115.5984-1-nirmoy.das@intel.com>
References: <20220701115115.5984-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: [igt-dev] [PATCH i-g-t 2/3] lib/i915: Assign graphics_rel for dg2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Assign graphics_rel subvesrsion to dg2.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 lib/intel_device_info.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index cb2f1b578..408a42e49 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -397,6 +397,7 @@ static const struct intel_device_info intel_dg2_info = {
 	.is_dg2 = true,
 	.codename = "dg2",
 	.has_flatccs = true,
+	.graphics_rel = 55
 };
 
 static const struct intel_device_info intel_alderlake_s_info = {
-- 
2.35.1

Intel Deutschland GmbH
Registered Address: Am Campeon 10, 85579 Neubiberg, Germany
Tel: +49 89 99 8853-0, www.intel.de <http://www.intel.de>
Managing Directors: Christin Eisenschmid, Sharon Heck, Tiffany Doon Silva  
Chairperson of the Supervisory Board: Nicole Lau
Registered Office: Munich
Commercial Register: Amtsgericht Muenchen HRB 186928
