Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F51610E762
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Dec 2023 10:59:24 +0000 (UTC)
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [igt-dev] [PATCH i-g-t] intel/xe_exec_compute_mode: Add
 non-blocking subtest
Date: Wed, 13 Dec 2023 10:59:18 +0000
Message-ID: <BYAPR11MB3413CA29BB1FF5E3CF41B43ED08DA@BYAPR11MB3413.namprd11.prod.outlook.com>
References: <20231207070503.6705-1-sai.gowtham.ch@intel.com>
 <ZXkqzYn2F9Fq6a88@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZXkqzYn2F9Fq6a88@DUT025-TGLU.fm.intel.com>
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
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



>-----Original Message-----
>From: Brost, Matthew <matthew.brost@intel.com>
>Sent: Wednesday, December 13, 2023 9:24 AM
>To: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>
>Cc: igt-dev@lists.freedesktop.org
>Subject: Re: [igt-dev] [PATCH i-g-t] intel/xe_exec_compute_mode: Add non-
>blocking subtest
>
>On Thu, Dec 07, 2023 at 12:35:03PM +0530, sai.gowtham.ch@intel.com wrote:
>> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>>
>> Fill the ring with maximum workload and expecte kernel to return
>> -EWOULDBLOCK error.
>>
>> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>> ---
>>  tests/intel/xe_exec_compute_mode.c | 95
>> ++++++++++++++++++++++++++++++
>>  1 file changed, 95 insertions(+)
>>
>> diff --git a/tests/intel/xe_exec_compute_mode.c
>> b/tests/intel/xe_exec_compute_mode.c
>> index 7d3004d65..56bd6cb49 100644
>> --- a/tests/intel/xe_exec_compute_mode.c
>> +++ b/tests/intel/xe_exec_compute_mode.c
>> @@ -290,6 +290,97 @@ test_exec(int fd, struct drm_xe_engine_class_instan=
ce
>*eci,
>>  		close(map_fd);
>>  }
>>
>> +/**
>> + * SUBTEST: non-blocking
>> + * Description: Fill the ring and check we get expected errors.
>> + * Test category: functionality test
>> + */
>> +static void non_block(int fd, int expect) {
>> +	struct drm_xe_sync sync =3D {
>> +		.type =3D DRM_XE_SYNC_TYPE_SYNCOBJ,
>
>DRM_XE_SYNC_TYPE_SYNCOBJ this type shouldn't work with LR VMs. Does this
>test pass? AFAIK this shouldn't work... (e.g. bind and execs should return=
 -
>EOPNOTSUPP here).
>
>> +		.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
>> +	};
>> +
>> +	struct drm_xe_exec exec =3D {
>> +		.num_batch_buffer =3D 1,
>> +		.num_syncs =3D 1,
>> +		.syncs =3D to_user_pointer(&sync),
>> +	};
>> +	struct {
>> +		uint32_t batch[16];
>> +		uint64_t pad;
>> +		uint32_t data;
>> +		uint64_t addr;
>> +	} *data;
>> +	struct drm_xe_engine *engine;
>> +	uint32_t vm, exec_queue, syncobj;
>> +	size_t bo_size;
>> +	int value =3D 0x123456;
>> +	uint64_t addr =3D 0x100000;
>> +	uint32_t bo =3D 0;
>> +	int b, count, intr, err;
>> +
>> +	syncobj =3D syncobj_create(fd, 0);
>> +	sync.handle =3D syncobj;
>> +
>> +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
>> +			      DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>> +	bo_size =3D sizeof(*data);
>> +	bo_size =3D ALIGN(bo_size + xe_cs_prefetch_size(fd),
>> +xe_get_default_alignment(fd));
>> +
>> +	engine =3D xe_engine(fd, 1);
>> +	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine-
>>instance.gt_id),
>> +
>DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +
>> +	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0, addr, bo_size,
>&sync, 1);
>> +	exec_queue =3D xe_exec_queue_create(fd, vm, &engine->instance, 0);
>> +	data =3D xe_bo_map(fd, bo, bo_size);
>> +
>> +	count =3D 0;
>> +	intr =3D 0;
>
>The below loop doesn't make tons of sense. It would make a lot more sense =
to
>issue a spin batch first and then a bunch of execs until -EWOULDBLOCK is h=
it. Then
>release the spin batch, wait that batch to complete, issue another exec an=
d verify
>it works.
>
May be issuing another exec and verify it would make sense to me, However I=
'm wondering why do we need to issue a spin batch first ?=20
Isn't just submitting bunch of exec in a loop till it hits -EWOULDBLOCK wou=
ldn't be enough ?

--
Gowtham
>Matt
>
>> +	do {
>> +		uint64_t batch_offset =3D (char *)&(data->batch) - (char *)data;
>> +		uint64_t batch_addr =3D addr + batch_offset;
>> +		uint64_t sdi_offset =3D (char *) & (data->data) - (char *)data;
>> +		uint64_t sdi_addr =3D addr + sdi_offset;
>> +
>> +		b =3D 0;
>> +		data->batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
>> +		data->batch[b++] =3D sdi_addr;
>> +		data->batch[b++] =3D sdi_addr >> 32;
>> +		data->batch[b++] =3D value;
>> +		data->batch[b++] =3D MI_BATCH_BUFFER_END;
>> +		igt_assert(b <=3D ARRAY_SIZE(data->batch));
>> +
>> +		exec.exec_queue_id =3D exec_queue;
>> +		exec.address =3D batch_addr;
>> +		sync.flags &=3D DRM_XE_SYNC_FLAG_SIGNAL;
>> +
>> +		err =3D __xe_exec(fd, &exec);
>> +		igt_assert(syncobj_wait(fd, &sync.handle, 1,
>> +					INT64_MAX, 0, NULL));
>> +
>> +		if (err =3D=3D -EWOULDBLOCK) {
>> +			if (intr !=3D count)
>> +				err =3D 0;
>> +			intr =3D count + 1;
>> +		}
>> +		if (err)
>> +			break;
>> +		count++;
>> +	} while (1);
>> +
>> +	igt_assert_eq(err, expect);
>> +
>> +	syncobj_destroy(fd, syncobj);
>> +	munmap(data, bo_size);
>> +	gem_close(fd, bo);
>> +
>> +	xe_exec_queue_destroy(fd, exec_queue);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>>  igt_main
>>  {
>>  	struct drm_xe_engine_class_instance *hwe; @@ -347,6 +438,10 @@
>> igt_main
>>  					  s->flags);
>>  	}
>>
>> +	igt_subtest("non-blocking")
>> +		non_block(fd, -EWOULDBLOCK);
>> +
>> +
>>  	igt_fixture
>>  		drm_close_driver(fd);
>>  }
>> --
>> 2.39.1
>>
