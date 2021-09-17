Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F166EC7C
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Sep 2021 13:03:36 +0000 (UTC)
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Date: Fri, 17 Sep 2021 13:03:34 +0000
Message-ID: <079a6cbef7c746c1ae281ba4ad4cef86@intel.com>
References: <20210916133239.24596-1-ramalingam.c@intel.com>
In-Reply-To: <20210916133239.24596-1-ramalingam.c@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3] tests/kms_prime: Create the
 exporting BO with smem
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "C, Ramalingam" <ramalingam.c@intel.com>, igt-dev <igt-dev@lists.freedesktop.org>
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


>-----Original Message-----
>From: C, Ramalingam <ramalingam.c@intel.com>
>Sent: Thursday, September 16, 2021 9:33 AM
>To: igt-dev <igt-dev@lists.freedesktop.org>
>Cc: Ruhl, Michael J <michael.j.ruhl@intel.com>; Dixit, Ashutosh
><ashutosh.dixit@intel.com>
>Subject: [PATCH i-g-t v3] tests/kms_prime: Create the exporting BO with
>smem
>
>On i915, to avail the dmabuf, the sharing object needs to migratable
>into smem. So if the shared object is lmem, then it needs to have the
>smem as second placement option.

Some minor word smithing:

"the shared object needs to be migratable"

"needs to have smem as"

>Currently kms_prime sharing the dumb buffer between the devices.

s/sharing/shares/

>But dumb buffer can't have the placements and resides at lmem for the
>dgfx. Hence to meet the i915 expectation for dgfx, we create the BO
>using the gem_create with smem as second placement option.

Would it make more sense to just have i915_gem_dumb_create() create
the object with both placements?

So then for the use case, it will "just work"?

This patch looks reasonable, but the change in dumb buffer usage is a
concern because we will need to change all usages in order to cover this
new feature/ability.

Mike

>v2: Used gem_mmap__device_coherent for mmaped ptr (Ashutosh)
>v3: dumb buffer ioctls are used for non i915 drivers
>
>Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>---
> tests/kms_prime.c | 33 +++++++++++++++++++++------------
> 1 file changed, 21 insertions(+), 12 deletions(-)
>
>diff --git a/tests/kms_prime.c b/tests/kms_prime.c
>index 2e20c58bc16e..5cdb559778b3 100644
>--- a/tests/kms_prime.c
>+++ b/tests/kms_prime.c
>@@ -100,18 +100,27 @@ static void prepare_scratch(int exporter_fd, struct
>dumb_bo *scratch,
> 	scratch->height =3D mode->vdisplay;
> 	scratch->bpp =3D 32;
>
>-	scratch->handle =3D kmstest_dumb_create(exporter_fd,
>-			ALIGN(scratch->width, 256),
>-			scratch->height,
>-			scratch->bpp,
>-			&scratch->pitch,
>-			&scratch->size);
>-
>-
>-	ptr =3D kmstest_dumb_map_buffer(exporter_fd,
>-				      scratch->handle,
>-				      scratch->size,
>-				      PROT_WRITE);
>+	if (!is_i915_device(exporter_fd)) {
>+		scratch->handle =3D kmstest_dumb_create(exporter_fd,
>+						      ALIGN(scratch->width,
>256),
>+						      scratch->height, scratch-
>>bpp,
>+						      &scratch->pitch, &scratch-
>>size);
>+
>+		ptr =3D kmstest_dumb_map_buffer(exporter_fd, scratch-
>>handle,
>+					      scratch->size, PROT_WRITE);
>+	} else {
>+		igt_calc_fb_size(exporter_fd, mode->hdisplay, mode-
>>vdisplay, DRM_FORMAT_XRGB8888,
>+				 DRM_FORMAT_MOD_NONE, &scratch->size,
>&scratch->pitch);
>+		if (gem_has_lmem(exporter_fd))
>+			scratch->handle =3D
>gem_create_in_memory_regions(exporter_fd, scratch->size,
>+
>REGION_LMEM(0), REGION_SMEM);
>+		else
>+			scratch->handle =3D
>gem_create_in_memory_regions(exporter_fd, scratch->size,
>+
>REGION_SMEM);
>+
>+		ptr =3D gem_mmap__device_coherent(exporter_fd, scratch-
>>handle, 0, scratch->size,
>+						PROT_WRITE | PROT_READ);
>+	}
>
> 	for (size_t idx =3D 0; idx < scratch->size / sizeof(*ptr); ++idx)
> 		ptr[idx] =3D color;
>--
>2.20.1
