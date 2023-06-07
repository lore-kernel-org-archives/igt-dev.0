Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35F510E54A
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jun 2023 20:53:37 +0000 (UTC)
Date: Wed, 7 Jun 2023 13:53:24 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZIDuRKsn7kVBVEbi@orsosgc001.jf.intel.com>
References: <20230606012150.2119065-1-ashutosh.dixit@intel.com>
 <20230606012150.2119065-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230606012150.2119065-3-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] lib/igt_sysfs: Don't assert in
 igt_sysfs_dir_id_to_name
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

On Mon, Jun 05, 2023 at 06:21:48PM -0700, Ashutosh Dixit wrote:
>Old platforms (BLB/ELK) don't have any freq attributes even in legacy
>per-device sysfs. Asserting for this platforms shows up as a CI
>regression. So don't assert, just return the device level attribute and let
>file open on the non-existent attribute fail to preserve previous behavior.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> lib/igt_sysfs.c | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)
>
>diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
>index 8021ba9cbb2e..35a4faa9aab5 100644
>--- a/lib/igt_sysfs.c
>+++ b/lib/igt_sysfs.c
>@@ -115,10 +115,8 @@ const char *igt_sysfs_dir_id_to_name(int dir, enum i915_attr_id id)
>
> 	if (igt_sysfs_has_attr(dir, i915_attr_name[RPS][id]))
> 		return i915_attr_name[RPS][id];
>-	if (igt_sysfs_has_attr(dir, i915_attr_name[GT][id]))
>-		return i915_attr_name[GT][id];
>
>-	igt_assert_f(0, "attr_id not found %d\n", id);
>+	return i915_attr_name[GT][id];

lgtm,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

> }
>
> /**
>-- 
>2.38.0
>
