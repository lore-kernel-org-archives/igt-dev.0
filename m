Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF77CEA90
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Aug 2022 17:08:56 +0000 (UTC)
Date: Mon, 15 Aug 2022 10:05:53 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <Yvp88SKKSswq7+qo@orsosgc001.jf.intel.com>
References: <20220812005039.450842-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220812005039.450842-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_sysfs: Drop igt_debug_on from
 igt_sysfs_gt_open
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

On Thu, Aug 11, 2022 at 05:50:39PM -0700, Ashutosh Dixit wrote:
>igt_sysfs_gt_open() is called from for_each_sysfs_gt_dirfd() which counts
>to 1 greater than the actual number of gt's where igt_sysfs_gt_open() fails
>and the loop exits. This means that the final failure is an expected
>condition which happens during normal course of operation.
>
>Therefore drop igt_debug_on() from igt_sysfs_gt_open() since the debug
>print is a false positive which makes it appear that something has gone
>wrong when it hasn't.
>
>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> lib/igt_sysfs.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
>index 40c9a2e36a90..9c3076947b35 100644
>--- a/lib/igt_sysfs.c
>+++ b/lib/igt_sysfs.c
>@@ -258,7 +258,7 @@ int igt_sysfs_gt_open(int device, int gt)
> {
> 	char path[96];
>
>-	if (igt_debug_on(!igt_sysfs_gt_path(device, gt, path, sizeof(path))))
>+	if (!igt_sysfs_gt_path(device, gt, path, sizeof(path)))
> 		return -1;

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Regards,
Umesh
>
> 	return open(path, O_RDONLY);
>-- 
>2.34.1
>
