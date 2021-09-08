Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C367C6E2DF
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Sep 2021 20:59:09 +0000 (UTC)
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Date: Wed, 8 Sep 2021 20:59:08 +0000
Message-ID: <fa0da20a94394e819b7519bb6277a703@intel.com>
References: <20210908104137.28851-1-ramalingam.c@intel.com>
 <87tuiukd0u.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87tuiukd0u.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_prime: Create the
 exporting BO with smem placement
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "C, Ramalingam" <ramalingam.c@intel.com>
Cc: igt-dev <igt-dev@lists.freedesktop.org>, "Wilson, Chris P" <chris.p.wilson@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

>-----Original Message-----
>From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
>Sent: Wednesday, September 8, 2021 4:50 PM
>To: C, Ramalingam <ramalingam.c@intel.com>
>Cc: igt-dev <igt-dev@lists.freedesktop.org>; Wilson, Chris P
><chris.p.wilson@intel.com>; Ruhl, Michael J <michael.j.ruhl@intel.com>
>Subject: Re: [PATCH i-g-t v2] tests/kms_prime: Create the exporting BO wit=
h
>smem placement
>
>On Wed, 08 Sep 2021 03:41:37 -0700, Ramalingam C wrote:
>>
>> On i915, to avail the dmabuf, the sharing object needs to migratable
>> into smem. So if the shared object is lmem, then it needs to have the
>> smem as second placement option.
>>
>> Currently kms_prime sharing the dumb buffer between the devices.
>> But dumb buffer can't have the placements and resides at lmem for the
>> dgfx. Hence to meet the i915 expectation for dgfx, we create the BO
>> using the gem_create with smem as second placement option.
>
>Maybe someone else should also take a look at the premise and the patch bu=
t
>it looks ok to me overall so:

This looks reasonable to me as well.

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

M

>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>
>> v2: Used gem_mmap__device_coherent for mmaped ptr (Ashutosh)
>>
>> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>> ---
>>  tests/kms_prime.c | 23 +++++++++++------------
>>  1 file changed, 11 insertions(+), 12 deletions(-)
>>
>> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
>> index 2e20c58bc16e..ccbb2feadd29 100644
>> --- a/tests/kms_prime.c
>> +++ b/tests/kms_prime.c
>> @@ -100,18 +100,17 @@ static void prepare_scratch(int exporter_fd, struc=
t
>dumb_bo *scratch,
>>	scratch->height =3D mode->vdisplay;
>>	scratch->bpp =3D 32;
>>
>> -	scratch->handle =3D kmstest_dumb_create(exporter_fd,
>> -			ALIGN(scratch->width, 256),
>> -			scratch->height,
>> -			scratch->bpp,
>> -			&scratch->pitch,
>> -			&scratch->size);
>> -
>> -
>> -	ptr =3D kmstest_dumb_map_buffer(exporter_fd,
>> -				      scratch->handle,
>> -				      scratch->size,
>> -				      PROT_WRITE);
>> +	igt_calc_fb_size(exporter_fd, mode->hdisplay, mode->vdisplay,
>DRM_FORMAT_XRGB8888,
>> +			 DRM_FORMAT_MOD_NONE, &scratch->size,
>&scratch->pitch);
>> +	if (gem_has_lmem(exporter_fd))
>> +		scratch->handle =3D
>gem_create_in_memory_regions(exporter_fd, scratch->size,
>> +							       REGION_LMEM(0),
>REGION_SMEM);
>> +	else
>> +		scratch->handle =3D
>gem_create_in_memory_regions(exporter_fd, scratch->size,
>> +							       REGION_SMEM);
>> +
>> +	ptr =3D gem_mmap__device_coherent(exporter_fd, scratch->handle,
>0, scratch->size,
>> +					PROT_WRITE | PROT_READ);
>>
>>	for (size_t idx =3D 0; idx < scratch->size / sizeof(*ptr); ++idx)
>>		ptr[idx] =3D color;
>> --
>> 2.20.1
>>
