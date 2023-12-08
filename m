Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C1010E292
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Dec 2023 11:58:46 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Ch, Sai Gowtham"
 <sai.gowtham.ch@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/xe_exec_store: Test to check
 CONDITIONAL_BATCH_BUFFER_END
Date: Fri, 8 Dec 2023 11:58:42 +0000
Message-ID: <MW3PR11MB47483DA2FD21A430F28450C2AE8AA@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20231208051831.2276393-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20231208051831.2276393-1-priyanka.dandamudi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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



> -----Original Message-----
> From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Sent: Friday, December 8, 2023 10:49 AM
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Kumar, Janga
> Rahul <janga.rahul.kumar@intel.com>; Ch, Sai Gowtham
> <sai.gowtham.ch@intel.com>; igt-dev@lists.freedesktop.org
> Subject: [PATCH i-g-t] tests/intel/xe_exec_store: Test to check
> CONDITIONAL_BATCH_BUFFER_END
>=20
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Added a basic test to check MI_CONDITIONAL_BATCH_BUFFER_END
> instruction.
>=20
> v2: Remove BATCH_BUFFER_END instruction, add else to check for wrong
> inst_type. (Rahul) and modified random value. (kamil)
>=20
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

LGTM,
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/intel/xe_exec_store.c | 46 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 43 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c in=
dex
> dec8546a3..6d5a1bbac 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -21,6 +21,8 @@
>   */
>=20
>  #define MAX_INSTANCE 9
> +#define STORE 0
> +#define COND_BATCH 1
>=20
>  struct data {
>  	uint32_t batch[16];
> @@ -48,11 +50,37 @@ static void store_dword_batch(struct data *data,
> uint64_t addr, int value)
>  	data->addr =3D batch_addr;
>  }
>=20
> +static void cond_batch(struct data *data, uint64_t addr, int value) {
> +	int b;
> +	uint64_t batch_offset =3D (char *)&(data->batch) - (char *)data;
> +	uint64_t batch_addr =3D addr + batch_offset;
> +	uint64_t sdi_offset =3D (char *)&(data->data) - (char *)data;
> +	uint64_t sdi_addr =3D addr + sdi_offset;
> +
> +	b =3D 0;
> +	data->batch[b++] =3D MI_ATOMIC | MI_ATOMIC_INC;
> +	data->batch[b++] =3D sdi_addr;
> +	data->batch[b++] =3D sdi_addr >> 32;
> +	data->batch[b++] =3D MI_CONDITIONAL_BATCH_BUFFER_END |
> MI_DO_COMPARE | 5 << 12 | 2;
> +	data->batch[b++] =3D value;
> +	data->batch[b++] =3D sdi_addr;
> +	data->batch[b++] =3D sdi_addr >> 32;
> +	data->batch[b++] =3D MI_BATCH_BUFFER_START | 1;
> +	data->batch[b++] =3D lower_32_bits(batch_addr);
> +	data->batch[b++] =3D upper_32_bits(batch_addr);
> +	igt_assert(b <=3D ARRAY_SIZE(data->batch));
> +
> +	data->addr =3D batch_addr;
> +}
> +
>  /**
>   * SUBTEST: basic-store
>   * Description: Basic test to verify store dword.
> + * SUBTEST: basic-cond-batch
> + * Description: Basic test to verify cond batch end instruction.
>   */
> -static void store(int fd)
> +static void basic_inst(int fd, int inst_type)
>  {
>  	struct drm_xe_sync sync =3D {
>  		.type =3D DRM_XE_SYNC_TYPE_SYNCOBJ,
> @@ -88,7 +116,16 @@ static void store(int fd)
>=20
>  	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0, addr, bo_size,
> &sync, 1);
>  	data =3D xe_bo_map(fd, bo, bo_size);
> -	store_dword_batch(data, addr, value);
> +
> +	if (inst_type =3D=3D STORE)
> +		store_dword_batch(data, addr, value);
> +	else if (inst_type =3D=3D COND_BATCH) {
> +		/* A random value where it stops at the below value. */
> +		value =3D 20 + random() % 10;
> +		cond_batch(data, addr, value);
> +	}
> +	else
> +		igt_assert_f(inst_type < 2, "Entered wrong inst_type.\n");
>=20
>  	exec_queue =3D xe_exec_queue_create(fd, vm, &engine->instance, 0);
>  	exec.exec_queue_id =3D exec_queue;
> @@ -306,7 +343,10 @@ igt_main
>  	}
>=20
>  	igt_subtest("basic-store")
> -		store(fd);
> +		basic_inst(fd, STORE);
> +
> +	igt_subtest("basic-cond-batch")
> +		basic_inst(fd, COND_BATCH);
>=20
>  	igt_subtest("basic-all") {
>  		xe_for_each_gt(fd, gt)
> --
> 2.25.1
