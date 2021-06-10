Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3AB6E87D
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jun 2021 12:30:51 +0000 (UTC)
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Date: Thu, 10 Jun 2021 12:30:46 +0000
Message-ID: <1bc6690fee52407c9ed683b0c0cecb48@intel.com>
References: <20210609121733.16461-1-venkata.sai.patnana@intel.com>
 <20210609121733.16461-8-venkata.sai.patnana@intel.com>
In-Reply-To: <20210609121733.16461-8-venkata.sai.patnana@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 08/11] tests/kms_addfb_basic: Add
 invalid buffer object test for discrete
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Patnana, Venkata Sai" <venkata.sai.patnana@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Mohammed Khajapasha <mohammed.khajapasha@intel.com>, "Latvala,
 Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

>-----Original Message-----
>From: Patnana, Venkata Sai <venkata.sai.patnana@intel.com>
>Sent: Wednesday, June 9, 2021 8:18 AM
>To: igt-dev@lists.freedesktop.org
>Cc: Patnana, Venkata Sai <venkata.sai.patnana@intel.com>; Mohammed
>Khajapasha <mohammed.khajapasha@intel.com>; Latvala; Latvala, Petri
><petri.latvala@intel.com>; Ruhl, Michael J <michael.j.ruhl@intel.com>
>Subject: [PATCH i-g-t 08/11] tests/kms_addfb_basic: Add invalid buffer object
>test for discrete
>
>From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
>
>Add invalid buffer object test case for discrete, to validate
>IOCTL_MODE_ADDFB2 ioctl for LMEM, the framebuffer backing
>gem objects should be from local memory for discrete.
>
>Cc: Latvala, Petri <petri.latvala@intel.com>
>Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
>Signed-off-by: Mohammed Khajapasha
><mohammed.khajapasha@intel.com>
>---
> tests/kms_addfb_basic.c | 16 ++++++++++++++++
> 1 file changed, 16 insertions(+)
>
>diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
>index 1fb18d668f..aac74a7568 100644
>--- a/tests/kms_addfb_basic.c
>+++ b/tests/kms_addfb_basic.c
>@@ -40,6 +40,7 @@
>
> #include "igt_rand.h"
> #include "igt_device.h"
>+#include "i915/intel_memory_region.h"
>
> uint32_t gem_bo;
> uint32_t gem_bo_small;
>@@ -146,6 +147,21 @@ static void invalid_tests(int fd)
> 		igt_assert(f.modifier[0] == 0);
> 	}
>
>+	igt_subtest("invalid-smem-bo-on-discrete") {
>+		int devid;
>+		uint32_t handle, stride;
>+		uint64_t size;
>+
>+		igt_require_intel(fd);
>+		devid = intel_get_drm_devid(fd);

This will only work on if the discrete card is the only card on the system.

Is there a better way to:

1) identify discrete cards and/or
2) specifically select a discrete card for testing?

Otherwise this test might never get past the next requirement.

Mike

>+		igt_require(gem_has_lmem(devid));
>+		igt_calc_fb_size(fd, f.width, f.height,
>+				DRM_FORMAT_XRGB8888, 0, &size, &stride);
>+		handle = gem_create_in_memory_regions(fd, size,
>REGION_SMEM);
>+		f.handles[0] = handle;
>+		do_ioctl_err(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f,
>EREMOTE);
>+	}
>+
> 	igt_describe("Check if addfb2 call works for legacy formats");
> 	igt_subtest("legacy-format") {
> 		struct {
>--
>2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
