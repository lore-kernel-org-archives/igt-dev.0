Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9382E10E050
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 12:25:22 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Date: Mon, 4 Dec 2023 12:25:17 +0000
Message-ID: <MW3PR11MB47487DD4CAF194036D2FFB2DAE86A@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20231201113507.3535939-1-janga.rahul.kumar@intel.com>
 <20231201113507.3535939-3-janga.rahul.kumar@intel.com>
 <20231204080725.itxtpjrg3hijvwjg@zkempczy-mobl2>
In-Reply-To: <20231204080725.itxtpjrg3hijvwjg@zkempczy-mobl2>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/intel_compute: Add XE2 compute
 implementation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> Sent: Monday, December 4, 2023 1:37 PM
> To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>
> Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/intel_compute: Add XE2 compu=
te
> implementation
>=20
> On Fri, Dec 01, 2023 at 05:05:06PM +0530, janga.rahul.kumar@intel.com wro=
te:
> > From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> >
> > Add compute pipeline and walker instrcutions for xe2lpg.
> >
> > Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > ---
> >  lib/intel_compute.c | 212
> > ++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 212 insertions(+)
> >
> > diff --git a/lib/intel_compute.c b/lib/intel_compute.c index
> > dd921bf46..22480c920 100644
> > --- a/lib/intel_compute.c
> > +++ b/lib/intel_compute.c
> > @@ -41,6 +41,13 @@
> >  #define XEHP_ADDR_INSTRUCTION_STATE_BASE	0x90000000UL
> >  #define XEHP_OFFSET_BINDING_TABLE		0x1000
> >
> > +#define XE2_ADDR_GENERAL_STATE_BASE		0x80010000UL
> > +#define XE2_ADDR_INSTRUCTION_STATE_BASE
> 	0x800100000000
> > +#define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x7F567C800000
> > +#define XE2_ADDR_SURFACE_STATE_BASE		0x7F5652600000
> > +#define XE2_ADDR_DYNAMIC_STATE_BASE		0x7F56831C8000
> > +#define XE2_OFFSET_KERNEL			0xFFFEF000
>=20
> I think instead of introducing new definitions for each platform we shoul=
d reuse
> previous definitions as long as it is possible.
>=20
> I've checked and below definitions are fine for XE2 either:
>=20
> #define ADDR_GENERAL_STATE_BASE                0x80000000UL
> #define ADDR_INSTRUCTION_STATE_BASE            0x90000000UL
> #define OFFSET_BINDING_TABLE                   0x1000
> #define XE2_ADDR_STATE_CONTEXT_DATA_BASE       0x900000UL
>=20
> May you introduce as first patch such definition rename commit and use th=
ose
> addresses in xe2 compute?

Thanks for the review, Sent v2 with the suggested changes.

-Rahul
>=20
> --
> Zbigniew
>=20
> > +
> >  struct bo_dict_entry {
> >  	uint64_t addr;
> >  	uint32_t size;
> > @@ -1137,6 +1144,206 @@ static void xehpc_compute_exec(int fd, const
> unsigned char *kernel,
> >  	bo_execenv_destroy(&execenv);
> >  }
> >
> > +static void xe2lpg_compute_exec_compute(uint32_t
> *addr_bo_buffer_batch,
> > +					uint64_t addr_general_state_base,
> > +					uint64_t addr_surface_state_base,
> > +					uint64_t addr_dynamic_state_base,
> > +					uint64_t addr_instruction_state_base,
> > +					uint64_t
> addr_state_contect_data_base,
> > +					uint64_t offset_indirect_data_start,
> > +					uint64_t kernel_start_pointer)
> > +{
> > +	int b =3D 0;
> > +
> > +	igt_debug("general   state base: %lx\n", addr_general_state_base);
> > +	igt_debug("surface   state base: %lx\n", addr_surface_state_base);
> > +	igt_debug("dynamic   state base: %lx\n", addr_dynamic_state_base);
> > +	igt_debug("instruct   base addr: %lx\n", addr_instruction_state_base)=
;
> > +	igt_debug("bindless   base addr: %lx\n", addr_surface_state_base);
> > +	igt_debug("state context data base addr: %lx\n",
> addr_state_contect_data_base);
> > +	igt_debug("offset indirect addr: %lx\n", offset_indirect_data_start);
> > +	igt_debug("kernel start pointer: %lx\n", kernel_start_pointer);
> > +
> > +	addr_bo_buffer_batch[b++] =3D GEN7_PIPELINE_SELECT |
> GEN9_PIPELINE_SELECTION_MASK |
> > +				    PIPELINE_SELECT_GPGPU;
> > +
> > +	addr_bo_buffer_batch[b++] =3D XEHP_STATE_COMPUTE_MODE | 0x1;
> > +	addr_bo_buffer_batch[b++] =3D 0xE0004000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +
> > +#define XE2_STATE_CONTEXT_DATA_BASE_ADDRESS ((3 << 29) | (0 << 27) |
> (1 << 24) | (11 << 16) | (1 << 0))
> > +	addr_bo_buffer_batch[b++] =3D
> XE2_STATE_CONTEXT_DATA_BASE_ADDRESS;
> > +	// Split into low and high 32 bits
> > +	addr_bo_buffer_batch[b++] =3D addr_state_contect_data_base &
> 0xFFFFFFFF; // Mask the low 32 bits ;
> > +	addr_bo_buffer_batch[b++] =3D (addr_state_contect_data_base >> 32) &
> > +0xFFFFFFFF;
> > +
> > +	addr_bo_buffer_batch[b++] =3D XEHP_CFE_STATE | 0x4;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x03808800;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D STATE_BASE_ADDRESS | 0x14;
> > +	addr_bo_buffer_batch[b++] =3D (addr_general_state_base & 0xffffffff) =
|
> 0x21;
> > +	addr_bo_buffer_batch[b++] =3D addr_general_state_base >> 32;
> > +	addr_bo_buffer_batch[b++] =3D 0x0002C000;
> > +	addr_bo_buffer_batch[b++] =3D (addr_surface_state_base & 0xffffffff) =
|
> 0x21;
> > +	addr_bo_buffer_batch[b++] =3D addr_surface_state_base >> 32;
> > +	addr_bo_buffer_batch[b++] =3D (addr_dynamic_state_base & 0xffffffff) =
|
> 0x21;
> > +	addr_bo_buffer_batch[b++] =3D addr_dynamic_state_base >> 32;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D (addr_instruction_state_base & 0xffffff=
ff)
> | 0x21;
> > +	addr_bo_buffer_batch[b++] =3D addr_instruction_state_base >> 32;
> > +	addr_bo_buffer_batch[b++] =3D 0xfffff001;
> > +	addr_bo_buffer_batch[b++] =3D 0x00010001;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0xfffff001;
> > +	addr_bo_buffer_batch[b++] =3D (addr_surface_state_base & 0xffffffff) =
|
> 0x21;
> > +	addr_bo_buffer_batch[b++] =3D addr_surface_state_base >> 32;
> > +	addr_bo_buffer_batch[b++] =3D 0x00007fbe;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000021;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +
> > +	addr_bo_buffer_batch[b++] =3D
> GEN8_3DSTATE_BINDING_TABLE_POOL_ALLOC | 2;
> > +	addr_bo_buffer_batch[b++] =3D (addr_surface_state_base & 0xffffffff) =
|
> 0x2;
> > +	addr_bo_buffer_batch[b++] =3D addr_surface_state_base >> 32;
> > +	addr_bo_buffer_batch[b++] =3D 0x001ff000;
> > +
> > +	addr_bo_buffer_batch[b++] =3D XEHP_COMPUTE_WALKER | 0x26;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000040;
> > +	addr_bo_buffer_batch[b++] =3D offset_indirect_data_start;
> > +	addr_bo_buffer_batch[b++] =3D 0xbe040000;
> > +	addr_bo_buffer_batch[b++] =3D 0xffffffff;
> > +	addr_bo_buffer_batch[b++] =3D 0x000003ff;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000002;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000001;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000001;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +
> > +	addr_bo_buffer_batch[b++] =3D kernel_start_pointer;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x0c000020;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00001047;
> > +	addr_bo_buffer_batch[b++] =3D ADDR_BATCH;
> > +	addr_bo_buffer_batch[b++] =3D ADDR_BATCH >> 32;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000400;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000001;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000001;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> > +
> > +	addr_bo_buffer_batch[b++] =3D MI_BATCH_BUFFER_END; }
> > +
> > +/**
> > + * xe2lpg_compute_exec - run a pipeline compatible with XE2
> > + *
> > + * @fd: file descriptor of the opened DRM device
> > + * @kernel: GPU Kernel binary to be executed
> > + * @size: size of @kernel.
> > + */
> > +static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
> > +				unsigned int size)
> > +{
> > +#define XE2_BO_DICT_ENTRIES 10
> > +	struct bo_dict_entry bo_dict[XE2_BO_DICT_ENTRIES] =3D {
> > +		{ .addr =3D XE2_ADDR_INSTRUCTION_STATE_BASE +
> XE2_OFFSET_KERNEL,
> > +		  .name =3D "instr state base"},
> > +		{ .addr =3D XE2_ADDR_DYNAMIC_STATE_BASE,
> > +		  .size =3D 0x100000,
> > +		  .name =3D "dynamic state base"},
> > +		{ .addr =3D XE2_ADDR_SURFACE_STATE_BASE,
> > +		  .size =3D 0x1000,
> > +		  .name =3D "surface state base"},
> > +		{ .addr =3D XE2_ADDR_GENERAL_STATE_BASE +
> OFFSET_INDIRECT_DATA_START,
> > +		  .size =3D  0x1000,
> > +		  .name =3D "indirect object base"},
> > +		{ .addr =3D ADDR_INPUT, .size =3D SIZE_BUFFER_INPUT,
> > +		  .name =3D "addr input"},
> > +		{ .addr =3D ADDR_OUTPUT, .size =3D SIZE_BUFFER_OUTPUT,
> > +		  .name =3D "addr output" },
> > +		{ .addr =3D XE2_ADDR_GENERAL_STATE_BASE, .size =3D 0x100000,
> > +		  .name =3D "general state base" },
> > +		{ .addr =3D XE2_ADDR_SURFACE_STATE_BASE +
> XEHP_OFFSET_BINDING_TABLE,
> > +		  .size =3D 0x1000,
> > +		  .name =3D "binding table" },
> > +		{ .addr =3D ADDR_BATCH,
> > +		  .size =3D SIZE_BATCH,
> > +		  .name =3D "batch" },
> > +		{ .addr =3D XE2_ADDR_STATE_CONTEXT_DATA_BASE,
> > +		  .size =3D 0x10000,
> > +		  .name =3D "state context data base"},
> > +	};
> > +
> > +	struct bo_execenv execenv;
> > +	float *dinput;
> > +
> > +	bo_execenv_create(fd, &execenv);
> > +
> > +	/* Sets Kernel size */
> > +	bo_dict[0].size =3D ALIGN(size, 0x1000);
> > +
> > +	bo_execenv_bind(&execenv, bo_dict, XE2_BO_DICT_ENTRIES);
> > +
> > +	memcpy(bo_dict[0].data, kernel, size);
> > +	create_dynamic_state(bo_dict[1].data, XE2_OFFSET_KERNEL);
> > +	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT,
> ADDR_OUTPUT);
> > +	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT,
> ADDR_OUTPUT);
> > +	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT,
> ADDR_OUTPUT);
> > +
> > +	dinput =3D (float *)bo_dict[4].data;
> > +	srand(time(NULL));
> > +
> > +	for (int i =3D 0; i < SIZE_DATA; i++)
> > +		((float *)dinput)[i] =3D rand() / (float)RAND_MAX;
> > +
> > +	xe2lpg_compute_exec_compute(bo_dict[8].data,
> > +				  XE2_ADDR_GENERAL_STATE_BASE,
> > +				  XE2_ADDR_SURFACE_STATE_BASE,
> > +				  XE2_ADDR_DYNAMIC_STATE_BASE,
> > +				  XE2_ADDR_INSTRUCTION_STATE_BASE,
> > +				  XE2_ADDR_STATE_CONTEXT_DATA_BASE,
> > +				  OFFSET_INDIRECT_DATA_START,
> > +				  XE2_OFFSET_KERNEL);
> > +
> > +	bo_execenv_exec(&execenv, ADDR_BATCH);
> > +
> > +	for (int i =3D 0; i < SIZE_DATA; i++) {
> > +		float f1, f2;
> > +
> > +		f1 =3D ((float *) bo_dict[5].data)[i];
> > +		f2 =3D ((float *) bo_dict[4].data)[i];
> > +
> > +		if (f1 !=3D f2 * f2)
> > +			igt_debug("[%4d] f1: %f !=3D %f\n", i, f1, f2 * f2);
> > +		igt_assert(f1 =3D=3D f2 * f2);
> > +	}
> > +
> > +	bo_execenv_unbind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
> > +	bo_execenv_destroy(&execenv);
> > +}
> > +
> >  /*
> >   * Compatibility flags.
> >   *
> > @@ -1175,6 +1382,11 @@ static const struct {
> >  		.compute_exec =3D xehpc_compute_exec,
> >  		.compat =3D COMPAT_DRIVER_XE,
> >  	},
> > +	{
> > +		.ip_ver =3D IP_VER(20, 04),
> > +		.compute_exec =3D xe2lpg_compute_exec,
> > +		.compat =3D COMPAT_DRIVER_XE,
> > +	},
> >  };
> >
> >  bool run_intel_compute_kernel(int fd)
> > --
> > 2.25.1
> >
