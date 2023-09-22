Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16BE10E649
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 10:13:28 +0000 (UTC)
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
Date: Fri, 22 Sep 2023 10:13:22 +0000
Message-ID: <BYAPR11MB3413E57025135FDAA9646FB3D0FFA@BYAPR11MB3413.namprd11.prod.outlook.com>
References: <20230922085515.814182-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20230922085515.814182-1-janga.rahul.kumar@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/xe_debugfs: Check
 tile_count info
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



>-----Original Message-----
>From: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
>Sent: Friday, September 22, 2023 2:25 PM
>To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
><ramadevi.gandi@intel.com>; Kumar, Janga Rahul
><janga.rahul.kumar@intel.com>
>Cc: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>;
>kamil.konieczny@linux.intel.com
>Subject: [PATCH i-g-t] tests/intel/xe_debugfs: Check tile_count info
>
>From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>
>Check correctness of tile_count info.
>
>v2: Use snprintf.(kamil)
Looks good to me.
Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>
>Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>---
> tests/intel/xe_debugfs.c | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>
>diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c index
>88b51dbd4..71b93b031 100644
>--- a/tests/intel/xe_debugfs.c
>+++ b/tests/intel/xe_debugfs.c
>@@ -13,7 +13,7 @@
>  */
>
> #include "igt.h"
>-
>+#include "igt_sysfs.h"
> #include "xe_drm.h"
> #include "xe/xe_ioctl.h"
> #include "xe/xe_query.h"
>@@ -117,6 +117,9 @@ test_base(int fd, struct drm_xe_query_config *config)
> 		igt_assert(igt_debugfs_search(fd, "info", reference));
> 	}
>
>+	snprintf(reference, "tile_count %d", xe_sysfs_get_num_tiles(fd));
>+	igt_assert(igt_debugfs_search(fd, "info", reference));
>+
> 	igt_assert(igt_debugfs_exists(fd, "gt0", O_RDONLY));
> 	if (config->info[XE_QUERY_CONFIG_GT_COUNT] > 1)
> 		igt_assert(igt_debugfs_exists(fd, "gt1", O_RDONLY));
>--
>2.25.1
