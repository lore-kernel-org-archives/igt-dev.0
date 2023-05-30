Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD2010E16A
 for <igt-dev@lists.freedesktop.org>; Tue, 30 May 2023 14:53:09 +0000 (UTC)
Message-ID: <81f2276a-9dbe-f472-ad79-4f37f4058b93@intel.com>
Date: Tue, 30 May 2023 16:53:05 +0200
MIME-Version: 1.0
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230529165417.347129-1-zbigniew.kempczynski@intel.com>
 <20230529165417.347129-2-zbigniew.kempczynski@intel.com>
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
In-Reply-To: <20230529165417.347129-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/gpgpu_fill/xehpc: Adjust
 gpgpu_fillfunc for PVC
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

Hi Zbigniew,

On 29.05.2023 18:54, Zbigniew Kempczyński wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> gpgpu_fillfunc for XEHPSDV can be reused for PVC with minor changes.
> PVC COMPUTE_WALKER instruction has additional restriction. Message
> SIMD(dw4:17) has to be equal to Thread SIMD.(SIMD16 in our case).
> PVC also required a kernel recompilation.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   lib/gpgpu_fill.c                              | 23 +++++++++++++++++++
>   lib/gpgpu_fill.h                              |  8 +++++++
>   lib/gpu_cmds.c                                |  3 ++-
>   .../shaders/gpgpu/gen12p72_gpgpu_kernel.asm   | 12 ++++++++++
>   lib/intel_batchbuffer.c                       |  4 +++-
>   5 files changed, 48 insertions(+), 2 deletions(-)
>   create mode 100644 lib/i915/shaders/gpgpu/gen12p72_gpgpu_kernel.asm
> 
> diff --git a/lib/gpgpu_fill.c b/lib/gpgpu_fill.c
> index 4db8775145..d854fbf7a0 100644
> --- a/lib/gpgpu_fill.c
> +++ b/lib/gpgpu_fill.c
> @@ -112,6 +112,18 @@ static const uint32_t xehp_gpgpu_kernel[][4] = {
>   	{ 0x00030031, 0x00000004, 0x3000500c, 0x00000000 },
>   };
>   
> +static const uint32_t xehpc_gpgpu_kernel[][4] = {
> +	{ 0x00080061, 0x01050000, 0x00000104, 0x00000000 },
> +	{ 0x00000069, 0x02058220, 0x02000014, 0x00000004 },
> +	{ 0x00000061, 0x02150220, 0x00000064, 0x00000000 },
> +	{ 0x000c0061, 0x04050220, 0x00460005, 0x00000000 },
> +	{ 0x00041a61, 0x04050220, 0x00220205, 0x00000000 },
> +	{ 0x00000061, 0x04254220, 0x00000000, 0x0000000f },
> +	{ 0x00101e61, 0x05050220, 0x00000104, 0x00000000 },
> +	{ 0x00132031, 0x00000000, 0xc0000414, 0x02a00000 },
> +	{ 0x000c0031, 0x00000004, 0x3000500c, 0x00000000 },
> +};
> +
>   /*
>    * This sets up the gpgpu pipeline,
>    *
> @@ -377,3 +389,14 @@ void xehp_gpgpu_fillfunc(int i915,
>   			      xehp_gpgpu_kernel,
>   			      sizeof(xehp_gpgpu_kernel));
>   }
> +
> +void xehpc_gpgpu_fillfunc(int i915,
> +			  struct intel_buf *buf,
> +			  unsigned int x, unsigned int y,
> +			  unsigned int width, unsigned int height,
> +			  uint8_t color)
> +{
> +	__xehp_gpgpu_fillfunc(i915, buf, x, y, width, height, color,
> +			      xehpc_gpgpu_kernel,
> +			      sizeof(xehpc_gpgpu_kernel));
> +}
> diff --git a/lib/gpgpu_fill.h b/lib/gpgpu_fill.h
> index 3d199acd63..f81cd0b53c 100644
> --- a/lib/gpgpu_fill.h
> +++ b/lib/gpgpu_fill.h
> @@ -67,4 +67,12 @@ xehp_gpgpu_fillfunc(int i915,
>   		    unsigned int x, unsigned int y,
>   		    unsigned int width, unsigned int height,
>   		    uint8_t color);
> +
> +void
> +xehpc_gpgpu_fillfunc(int i915,
> +		     struct intel_buf *dst,
> +		     unsigned int x, unsigned int y,
> +		     unsigned int width, unsigned int height,
> +		     uint8_t color);
> +
>   #endif /* GPGPU_FILL_H */
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index afb26d2990..1f321ae4a0 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -975,7 +975,8 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
>   	intel_bb_out(ibb, 0); /* indirect data offset */	//dw3
>   
>   	/* SIMD size */
> -	intel_bb_out(ibb, 1 << 30 | 1 << 25); /* SIMD16 | enable inline */ //dw4
> +	/* SIMD16 | enable inline | Message SIMD16 */
> +	intel_bb_out(ibb, 1 << 30 | 1 << 25 | 1 << 17);		//dw4
>   
>   	/* Execution mask */
>   	intel_bb_out(ibb, 0xffffffff);				//dw5
> diff --git a/lib/i915/shaders/gpgpu/gen12p72_gpgpu_kernel.asm b/lib/i915/shaders/gpgpu/gen12p72_gpgpu_kernel.asm
> new file mode 100644
> index 0000000000..52699a475e
> --- /dev/null
> +++ b/lib/i915/shaders/gpgpu/gen12p72_gpgpu_kernel.asm

Nit: shouldn't this be called 'xehpc_gpgpu_kernel'?

Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Christoph


> @@ -0,0 +1,12 @@
> +L0:
> +         mov (4|M0)               r1.0<1>:ub    r1.0<0;1,0>:ub
> +         shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    0x4:ud
> +         mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud
> +         mov (8|M0)               r4.0<1>:ud    r0.0<8;8,1>:ud
> +         mov (2|M0)               r4.0<1>:ud    r2.0<2;2,1>:ud                   {I@2}
> +         mov (1|M0)               r4.2<1>:ud    0xF:ud
> +         mov (16|M0)              r5.0<1>:ud    r1.0<0;1,0>:ud                   {I@6}
> +(W)      sync.nop                             null                             {I@1}
> +         send.dc1 (16|M0)         null     r4      null:0    0x0         0x40A8000  {$0} //    wr:2h+0, rd:0, Media Block Write msc:0, to #0
> +         send.gtwy (8|M0)         null     r80     null:0    0x0         0x02000000 {EOT}
> +L176:
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index dfccc4f4ac..9f65536173 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -755,7 +755,9 @@ igt_fillfunc_t igt_get_gpgpu_fillfunc(int devid)
>   {
>   	igt_fillfunc_t fill = NULL;
>   
> -	if (intel_graphics_ver(devid) >= IP_VER(12, 50))
> +	if (intel_graphics_ver(devid) >= IP_VER(12, 60))
> +		fill = xehpc_gpgpu_fillfunc;
> +	else if (intel_graphics_ver(devid) >= IP_VER(12, 50))
>   		fill = xehp_gpgpu_fillfunc;
>   	else if (IS_GEN12(devid))
>   		fill = gen12_gpgpu_fillfunc;
