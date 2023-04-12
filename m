Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10BE10E9A3
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Apr 2023 21:56:50 +0000 (UTC)
Date: Wed, 12 Apr 2023 14:56:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
Message-ID: <20230412215639.p4bhx7jn4wwqq73i@ldmartin-desk2.lan>
References: <20230412210558.18837-1-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230412210558.18837-1-matthew.s.atwood@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe/xe_huc_copy: check debugfs for
 huc running
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 02:05:58PM -0700, Matt Atwood wrote:
>Use debugfs to make sure that huc is loaded for xe_huc_copy. This
>function will need to be updated for multitile functionality.
>
>Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>---
> tests/xe/xe_huc_copy.c | 18 +++++++++++++++++-
> 1 file changed, 17 insertions(+), 1 deletion(-)
>
>diff --git a/tests/xe/xe_huc_copy.c b/tests/xe/xe_huc_copy.c
>index cd68dbb5ac..58d770106e 100644
>--- a/tests/xe/xe_huc_copy.c
>+++ b/tests/xe/xe_huc_copy.c
>@@ -152,6 +152,22 @@ test_huc_copy(int fd)
> 	xe_vm_destroy(fd, vm);
> }
>
>+static bool
>+is_huc_running(int fd)
>+{
>+	char buf[4096];
>+	char *s;
>+
>+	/*
>+	 * TODO: add multi tile support

can't be a todo, otherwise it doesn't work on MTL since there
the media gt is gt1. It's simple enough to add 

	int gt;

	xe_for_each_gt(fd, gt) {
		char name[256];

		sprintf(name, "gt%d/uc/huc_info", gt);
		...
		if (s)
			return true;
	}

	return false;
	
in xe it seems that when HuC is not loaded, for whatever reason
we fail module load. So this is fine for now. Eventually we will need to
differentiate "failed to load HuC" from "platform doesn't have huc"
from "huc failed to run for whatever reason".  I think this can be a
TODO.

Lucas De Marchi

>+	 */
>+
>+	igt_debugfs_read(fd, "gt0/uc/huc_info", buf);
>+	s = strstr(buf, "RUNNING");
>+
>+	return s;
>+}
>+
> igt_main
> {
> 	int xe;
>@@ -162,7 +178,7 @@ igt_main
> 	}
>
> 	igt_subtest("huc_copy") {
>-		igt_skip_on(!IS_TIGERLAKE(intel_get_drm_devid(xe)));
>+		igt_skip_on(!is_huc_running(xe));
> 		test_huc_copy(xe);
> 	}
>
>-- 
>2.39.2
>
