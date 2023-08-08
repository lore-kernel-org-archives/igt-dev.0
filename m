Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A11B10E0CB
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 15:22:33 +0000 (UTC)
From: "Dec, Katarzyna" <katarzyna.dec@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Tue, 8 Aug 2023 15:22:30 +0000
Message-ID: <IA1PR11MB6097ACCC40A705E922AF557EE20DA@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20230808144913.600790-1-himal.prasad.ghimiray@intel.com>
 <20230808144913.600790-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230808144913.600790-2-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] tests/xe_sysfs_tile: Update
 documentation fields.
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

LGTM
Reviewed-by: Katarzyna Dec <katarzyna.dec@intel.com>

-----Original Message-----
From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>=20
Sent: Tuesday, August 8, 2023 4:49 PM
To: igt-dev@lists.freedesktop.org
Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Dec, Katarzyn=
a <katarzyna.dec@intel.com>; Kamil Konieczny <kamil.konieczny@linux.intel.c=
om>; Dixit, Ashutosh <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 1/2] tests/xe_sysfs_tile: Update documentation fie=
lds.

- Update functionality and sub-category fields.

v2
- Fix compilation failure.

Cc: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/xe/xe_sysfs_tile.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/xe/xe_sysfs_tile.c b/tests/xe/xe_sysfs_tile.c index c4c3=
f5446..3be9c93f7 100644
--- a/tests/xe/xe_sysfs_tile.c
+++ b/tests/xe/xe_sysfs_tile.c
@@ -6,6 +6,8 @@
 /**
  * TEST: Verify physical_vram_size_bytes of each tiles
  * SUBTEST: physical_vram_size_bytes
+ * Functionality: Vram
+ * Sub-category: Total vram per tile
  * Description:
  *             Read sysfs entry for physical_vram_size_bytes and compare w=
ith
  *             vram size. physical_vram_size_bytes should be more than vra=
m size.
--
2.25.1
