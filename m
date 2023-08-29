Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B8110E046
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Aug 2023 07:31:41 +0000 (UTC)
From: "Dec, Katarzyna" <katarzyna.dec@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Tue, 29 Aug 2023 07:31:08 +0000
Message-ID: <IA1PR11MB609715E573D6E5D3900CED85E2E7A@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20230829055835.1750432-1-himal.prasad.ghimiray@intel.com>
 <20230829055835.1750432-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230829055835.1750432-2-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/xe_sysfs_tile: Update
 documentation fields
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
<Acked-by: Katarzyna Dec <katarzyna.dec@intel.com>

Kasia

-----Original Message-----
From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>=20
Sent: Tuesday, August 29, 2023 7:59 AM
To: igt-dev@lists.freedesktop.org
Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Dec, Katarzyn=
a <katarzyna.dec@intel.com>; Kamil Konieczny <kamil.konieczny@linux.intel.c=
om>
Subject: [PATCH i-g-t 1/2] tests/xe_sysfs_tile: Update documentation fields

Update Category, Run type and Test Category fields for test.

Cc: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/xe/xe_sysfs_tile.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/xe/xe_sysfs_tile.c b/tests/xe/xe_sysfs_tile.c index 3be9=
c93f7..f8782b3e6 100644
--- a/tests/xe/xe_sysfs_tile.c
+++ b/tests/xe/xe_sysfs_tile.c
@@ -5,9 +5,13 @@
=20
 /**
  * TEST: Verify physical_vram_size_bytes of each tiles
- * SUBTEST: physical_vram_size_bytes
+ * Category: Software building block
  * Functionality: Vram
  * Sub-category: Total vram per tile
+ * Test category: functionality test
+ * Run type: FULL
+ *
+ * SUBTEST: physical_vram_size_bytes
  * Description:
  *             Read sysfs entry for physical_vram_size_bytes and compare w=
ith
  *             vram size. physical_vram_size_bytes should be more than vra=
m size.
--
2.25.1
