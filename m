Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CAC46E503
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2020 09:13:18 +0000 (UTC)
Date: Thu, 27 Feb 2020 11:13:13 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200227091313.GI3839@platvala-desk.ger.corp.intel.com>
References: <20200227000925.16988-1-akeem.g.abodunrin@intel.com>
 <20200227000925.16988-2-akeem.g.abodunrin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227000925.16988-2-akeem.g.abodunrin@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v6 1/1] tools/generate_cb_kernel: Add
 script to assemble CB kernel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Cc: tony.luck@intel.com, jani.nikula@intel.com, chris.p.wilson@intel.com, igt-dev@lists.freedesktop.org, jon.bloomfield@intel.com, daniel.vetter@intel.com, mika.kuoppala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 27, 2020 at 12:09:25AM +0000, Akeem G Abodunrin wrote:
> This patch adds script and applicable assembly sources, so that we can use
> igt to assemble Clear Batch Buffer kernel for gen7 and gen7.5 devices -
> Resultant header files would be imported to i915, and used as they are...
> =

> With this patch, user need to have mesa configured on their platform,
> before igt could be used to achieve the purpose of assembling the kernel
> from source.
> =

> This is needed for "Security mitigation for Intel Gen7/7.5 HWs"
> Intel ID: PSIRT-TA-201910-001/CVEID: CVE-2019-14615
> =

> v2: Addressed formatting, -g option and other minor issues (Petri)
> v3: Update script due to suggested changes in i915, and Mesa tool
> v4: Update help comment with Mesa build option with meson (Petri)
> v5: Modify how user specify i965_asm - script now takes binary, instead
> of Mesa tool source directory (Ville).
> v6: Update script to reflect Mesa tool final changes to assemble CB
> kernel - and renamed files based on Petri's suggestion...
> =

> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Bloomfield Jon <jon.bloomfield@intel.com>
> Signed-off-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>

Patch subject slightly off but I'll change that when merging.

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  lib/i915/shaders/clear_kernel/hsw.asm | 141 ++++++++++++++++++++++++
>  lib/i915/shaders/clear_kernel/ivb.asm | 139 ++++++++++++++++++++++++
>  scripts/generate_clear_kernel.sh      | 151 ++++++++++++++++++++++++++
>  3 files changed, 431 insertions(+)
>  create mode 100644 lib/i915/shaders/clear_kernel/hsw.asm
>  create mode 100644 lib/i915/shaders/clear_kernel/ivb.asm
>  create mode 100755 scripts/generate_clear_kernel.sh
> =

> diff --git a/lib/i915/shaders/clear_kernel/hsw.asm b/lib/i915/shaders/cle=
ar_kernel/hsw.asm
> new file mode 100644
> index 00000000..bc29baf2
> --- /dev/null
> +++ b/lib/i915/shaders/clear_kernel/hsw.asm
> @@ -0,0 +1,141 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =A9 2020 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
> + *
> + */
> +
> +/**
> + * Kernel name: hsw_clear_buf.asm
> + *
> + * Kernel for PAVP buffer clear.
> + *
> + *	1. Clear all 64 GRF registers assigned to the kernel with designated =
value;
> + *	2. Write 32x16 block of all "0" to render target buffer which indirec=
tly clears
> + *	   512 bytes of Render Cache.
> + */
> +
> +/* Store designated "clear GRF" value */
> +mov(1)          f0.1<1>UW       g1.2<0,1,0>UW                   { align1=
 1N };
> +
> +/**
> + * Curbe Format
> + *
> + * DW 1.0 - Block Offset to write Render Cache
> + * DW 1.1 [15:0] - Clear Word
> + * DW 1.2 - Delay iterations
> + * DW 1.3 - Enable Instrumentation (only for debug)
> + * DW 1.4 - Rsvd (intended for context ID)
> + * DW 1.5 - [31:16]:SliceCount, [15:0]:SubSlicePerSliceCount
> + * DW 1.6 - Rsvd MBZ (intended for Enable Wait on Total Thread Count)
> + * DW 1.7 - Rsvd MBZ (inteded for Total Thread Count)
> + *
> + * Binding Table
> + *
> + * BTI 0: 2D Surface to help clear L3 (Render/Data Cache)
> + * BTI 1: Wait/Instrumentation Buffer
> + *  Size : (SliceCount * SubSliceCount  * 16 EUs/SubSlice) rows * (16 th=
reads/EU) cols (Format R32_UINT)
> + *         Expected to be initialized to 0 by driver/another kernel
> + *  Layout:
> + *          RowN: Histogram for EU-N: (SliceID*SubSlicePerSliceCount + S=
SID)*16 + EUID [assume max 16 EUs / SS]
> + *          Col-k[DW-k]: Threads Executed on ThreadID-k for EU-N
> + */
> +add(1)          g1.2<1>UD       g1.2<0,1,0>UD   0x00000001UD    { align1=
 1N }; /* Loop count to delay kernel: Init to (g1.2 + 1) */
> +cmp.z.f0.0(1)   null<1>UD       g1.3<0,1,0>UD   0x00000000UD    { align1=
 1N };
> +(+f0.0) jmpi(1) 352D                                            { align1=
 WE_all 1N };
> +
> +/**
> + * State Register has info on where this thread is running
> + *	IVB: sr0.0 :: [15:13]: MBZ, 12: HSID (Half-Slice ID), [11:8]EUID, [2:=
0] ThreadSlotID
> + *	HSW: sr0.0 :: 15: MBZ, [14:13]: SliceID, 12: HSID (Half-Slice ID), [1=
1:8]EUID, [2:0] ThreadSlotID
> + */
> +mov(8)          g3<1>UD         0x00000000UD                    { align1=
 1Q };
> +shr(1)          g3<1>D          sr0<0,1,0>D     12D             { align1=
 1N };
> +and(1)          g3<1>D          g3<0,1,0>D      1D              { align1=
 1N }; /* g3 has HSID */
> +shr(1)          g3.1<1>D        sr0<0,1,0>D     13D             { align1=
 1N };
> +and(1)          g3.1<1>D        g3.1<0,1,0>D    3D              { align1=
 1N }; /* g3.1 has sliceID */
> +mul(1)          g3.5<1>D        g3.1<0,1,0>D    g1.10<0,1,0>UW  { align1=
 1N };
> +add(1)          g3<1>D          g3<0,1,0>D      g3.5<0,1,0>D    { align1=
 1N }; /* g3 =3D sliceID * SubSlicePerSliceCount + HSID */
> +shr(1)          g3.2<1>D        sr0<0,1,0>D     8D              { align1=
 1N };
> +and(1)          g3.2<1>D        g3.2<0,1,0>D    15D             { align1=
 1N }; /* g3.2 =3D EUID */
> +mul(1)          g3.4<1>D        g3<0,1,0>D      16D             { align1=
 1N };
> +add(1)          g3.2<1>D        g3.2<0,1,0>D    g3.4<0,1,0>D    { align1=
 1N }; /* g3.2 now points to EU row number (Y-pixel =3D V address )  in ins=
trumentation surf */
> +
> +mov(8)          g5<1>UD         0x00000000UD                    { align1=
 1Q };
> +and(1)          g3.3<1>D        sr0<0,1,0>D     7D              { align1=
 1N };
> +mul(1)          g3.3<1>D        g3.3<0,1,0>D    4D              { align1=
 1N };
> +
> +mov(8)          g4<1>UD         g0<8,8,1>UD                     { align1=
 1Q }; /* Initialize message header with g0 */
> +mov(1)          g4<1>UD         g3.3<0,1,0>UD                   { align1=
 1N }; /* Block offset */
> +mov(1)          g4.1<1>UD       g3.2<0,1,0>UD                   { align1=
 1N }; /* Block offset */
> +mov(1)          g4.2<1>UD       0x00000003UD                    { align1=
 1N }; /* Block size (1 row x 4 bytes) */
> +and(1)          g4.3<1>UD       g4.3<0,1,0>UW   0xffffffffUD    { align1=
 1N };
> +
> +/* Media block read to fetch current value at specified location in inst=
rumentation buffer */
> +sendc(8)        g5<1>UD         g4<8,8,1>F      0x02190001
> +
> +                            render MsgDesc: media block read MsgCtrl =3D=
 0x0 Surface =3D 1 mlen 1 rlen 1 { align1 1Q };
> +add(1)          g5<1>D          g5<0,1,0>D      1D              { align1=
 1N };
> +
> +/* Media block write for updated value at specified location in instrume=
ntation buffer */
> +sendc(8)        g5<1>UD         g4<8,8,1>F      0x040a8001
> +                            render MsgDesc: media block write MsgCtrl =
=3D 0x0 Surface =3D 1 mlen 2 rlen 0 { align1 1Q };
> +
> +/* Delay thread for specified parameter */
> +add.nz.f0.0(1)  g1.2<1>UD       g1.2<0,1,0>UD   -1D             { align1=
 1N };
> +(+f0.0) jmpi(1) -32D                                            { align1=
 WE_all 1N };
> +
> +/* Store designated "clear GRF" value */
> +mov(1)          f0.1<1>UW       g1.2<0,1,0>UW                   { align1=
 1N };
> +
> +/* Initialize looping parameters */
> +mov(1)          a0<1>D          0D                              { align1=
 1N }; /* Initialize a0.0:w=3D0 */
> +mov(1)          a0.4<1>W        127W                            { align1=
 1N }; /* Loop count. Each loop contains 16 GRF's */
> +
> +/* Write 32x16 all "0" block */
> +mov(8)          g2<1>UD         g0<8,8,1>UD                     { align1=
 1Q };
> +mov(8)          g127<1>UD       g0<8,8,1>UD                     { align1=
 1Q };
> +mov(2)          g2<1>UD         g1<2,2,1>UW                     { align1=
 1N };
> +mov(1)          g2.2<1>UD       0x000f000fUD                    { align1=
 1N }; /* Block size (16x16) */
> +and(1)          g2.3<1>UD       g2.3<0,1,0>UW   0xffffffefUD    { align1=
 1N };
> +mov(16)         g3<1>UD         0x00000000UD                    { align1=
 1H };
> +mov(16)         g4<1>UD         0x00000000UD                    { align1=
 1H };
> +mov(16)         g5<1>UD         0x00000000UD                    { align1=
 1H };
> +mov(16)         g6<1>UD         0x00000000UD                    { align1=
 1H };
> +mov(16)         g7<1>UD         0x00000000UD                    { align1=
 1H };
> +mov(16)         g8<1>UD         0x00000000UD                    { align1=
 1H };
> +mov(16)         g9<1>UD         0x00000000UD                    { align1=
 1H };
> +mov(16)         g10<1>UD        0x00000000UD                    { align1=
 1H };
> +sendc(8)        null<1>UD       g2<8,8,1>F      0x120a8000
> +                            render MsgDesc: media block write MsgCtrl =
=3D 0x0 Surface =3D 0 mlen 9 rlen 0 { align1 1Q };
> +add(1)          g2<1>UD         g1<0,1,0>UW     0x0010UW        { align1=
 1N };
> +sendc(8)        null<1>UD       g2<8,8,1>F      0x120a8000
> +                            render MsgDesc: media block write MsgCtrl =
=3D 0x0 Surface =3D 0 mlen 9 rlen 0 { align1 1Q };
> +
> +/* Now, clear all GRF registers */
> +add.nz.f0.0(1)  a0.4<1>W        a0.4<0,1,0>W    -1W             { align1=
 1N };
> +mov(16)         g[a0]<1>UW      f0.1<0,1,0>UW                   { align1=
 1H };
> +add(1)          a0<1>D          a0<0,1,0>D      32D             { align1=
 1N };
> +(+f0.0) jmpi(1) -64D                                            { align1=
 WE_all 1N };
> +
> +/* Terminante the thread */
> +sendc(8)        null<1>UD       g127<8,8,1>F    0x82000010
> +                            thread_spawner MsgDesc: mlen 1 rlen 0       =
    { align1 1Q EOT };
> diff --git a/lib/i915/shaders/clear_kernel/ivb.asm b/lib/i915/shaders/cle=
ar_kernel/ivb.asm
> new file mode 100644
> index 00000000..b21bc948
> --- /dev/null
> +++ b/lib/i915/shaders/clear_kernel/ivb.asm
> @@ -0,0 +1,139 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =A9 2020 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
> + *
> + */
> +
> +/**
> + * Kernel name: ivb_clear_buf.asm
> + *
> + * Kernel for PAVP buffer clear.
> + *
> + *	1. Clear all 64 GRF registers assigned to the kernel with designated =
value;
> + *	2. Write 32x16 block of all "0" to render target buffer which indirec=
tly clears
> + *	   512 bytes of Render Cache.
> + */
> +
> +/* Store designated "clear GRF" value */
> +mov(1)          f0.1<1>UW       g1.2<0,1,0>UW                   { align1=
 1N };
> +
> +/**
> + * Curbe Format
> + *
> + * DW 1.0 - Block Offset to write Render Cache
> + * DW 1.1 [15:0] - Clear Word
> + * DW 1.2 - Delay iterations
> + * DW 1.3 - Enable Instrumentation (only for debug)
> + * DW 1.4 - Rsvd (intended for context ID)
> + * DW 1.5 - [31:16]:SliceCount, [15:0]:SubSlicePerSliceCount
> + * DW 1.6 - Rsvd MBZ (intended for Enable Wait on Total Thread Count)
> + * DW 1.7 - Rsvd MBZ (inteded for Total Thread Count)
> + *
> + * Binding Table
> + *
> + * BTI 0: 2D Surface to help clear L3 (Render/Data Cache)
> + * BTI 1: Wait/Instrumentation Buffer
> + *  Size : (SliceCount * SubSliceCount  * 16 EUs/SubSlice) rows * (16 th=
reads/EU) cols (Format R32_UINT)
> + *         Expected to be initialized to 0 by driver/another kernel
> + *  Layout :
> + *           RowN: Histogram for EU-N: (SliceID*SubSlicePerSliceCount + =
SSID)*16 + EUID [assume max 16 EUs / SS]
> + *           Col-k[DW-k]: Threads Executed on ThreadID-k for EU-N
> + */
> +add(1)          g1.2<1>UD       g1.2<0,1,0>UD   0x00000001UD    { align1=
 1N }; /* Loop count to delay kernel: Init to (g1.2 + 1) */
> +cmp.z.f0.0(1)   null<1>UD       g1.3<0,1,0>UD   0x00000000UD    { align1=
 1N };
> +(+f0.0) jmpi(1) 44D                                             { align1=
 WE_all 1N };
> +
> +/**
> + * State Register has info on where this thread is running
> + *	IVB: sr0.0 :: [15:13]: MBZ, 12: HSID (Half-Slice ID), [11:8]EUID, [2:=
0] ThreadSlotID
> + *	HSW: sr0.0 :: 15: MBZ, [14:13]: SliceID, 12: HSID (Half-Slice ID), [1=
1:8]EUID, [2:0] ThreadSlotID
> + */
> +mov(8)          g3<1>UD         0x00000000UD                    { align1=
 1Q };
> +shr(1)          g3<1>D          sr0<0,1,0>D     12D             { align1=
 1N };
> +and(1)          g3<1>D          g3<0,1,0>D      1D              { align1=
 1N }; /* g3 has HSID */
> +shr(1)          g3.1<1>D        sr0<0,1,0>D     13D             { align1=
 1N };
> +and(1)          g3.1<1>D        g3.1<0,1,0>D    3D              { align1=
 1N }; /* g3.1 has sliceID */
> +mul(1)          g3.5<1>D        g3.1<0,1,0>D    g1.10<0,1,0>UW  { align1=
 1N };
> +add(1)          g3<1>D          g3<0,1,0>D      g3.5<0,1,0>D    { align1=
 1N }; /* g3 =3D sliceID * SubSlicePerSliceCount + HSID */
> +shr(1)          g3.2<1>D        sr0<0,1,0>D     8D              { align1=
 1N };
> +and(1)          g3.2<1>D        g3.2<0,1,0>D    15D             { align1=
 1N }; /* g3.2 =3D EUID */
> +mul(1)          g3.4<1>D        g3<0,1,0>D      16D             { align1=
 1N };
> +add(1)          g3.2<1>D        g3.2<0,1,0>D    g3.4<0,1,0>D    { align1=
 1N }; /* g3.2 now points to EU row number (Y-pixel =3D V address )  in ins=
trumentation surf */
> +
> +mov(8)          g5<1>UD         0x00000000UD                    { align1=
 1Q };
> +and(1)          g3.3<1>D        sr0<0,1,0>D     7D              { align1=
 1N };
> +mul(1)          g3.3<1>D        g3.3<0,1,0>D    4D              { align1=
 1N };
> +
> +mov(8)          g4<1>UD         g0<8,8,1>UD                     { align1=
 1Q }; /* Initialize message header with g0 */
> +mov(1)          g4<1>UD         g3.3<0,1,0>UD                   { align1=
 1N }; /* Block offset */
> +mov(1)          g4.1<1>UD       g3.2<0,1,0>UD                   { align1=
 1N }; /* Block offset */
> +mov(1)          g4.2<1>UD       0x00000003UD                    { align1=
 1N }; /* Block size (1 row x 4 bytes) */
> +and(1)          g4.3<1>UD       g4.3<0,1,0>UW   0xffffffffUD    { align1=
 1N };
> +
> +/* Media block read to fetch current value at specified location in inst=
rumentation buffer */
> +sendc(8)        g5<1>UD         g4<8,8,1>F      0x02190001
> +                            render MsgDesc: media block read MsgCtrl =3D=
 0x0 Surface =3D 1 mlen 1 rlen 1 { align1 1Q };
> +add(1)          g5<1>D          g5<0,1,0>D      1D              { align1=
 1N };
> +
> +/* Media block write for updated value at specified location in instrume=
ntation buffer */
> +sendc(8)        g5<1>UD         g4<8,8,1>F      0x040a8001
> +                            render MsgDesc: media block write MsgCtrl =
=3D 0x0 Surface =3D 1 mlen 2 rlen 0 { align1 1Q };
> +/* Delay thread for specified parameter */
> +add.nz.f0.0(1)  g1.2<1>UD       g1.2<0,1,0>UD   -1D             { align1=
 1N };
> +(+f0.0) jmpi(1) -4D                                             { align1=
 WE_all 1N };
> +
> +/* Store designated "clear GRF" value */
> +mov(1)          f0.1<1>UW       g1.2<0,1,0>UW                   { align1=
 1N };
> +
> +/* Initialize looping parameters */
> +mov(1)          a0<1>D          0D                              { align1=
 1N }; /* Initialize a0.0:w=3D0 */
> +mov(1)          a0.4<1>W        127W                            { align1=
 1N }; /* Loop count. Each loop contains 16 GRF's */
> +
> +/* Write 32x16 all "0" block */
> +mov(8)          g2<1>UD         g0<8,8,1>UD                     { align1=
 1Q };
> +mov(8)          g127<1>UD       g0<8,8,1>UD                     { align1=
 1Q };
> +mov(2)          g2<1>UD         g1<2,2,1>UW                     { align1=
 1N };
> +mov(1)          g2.2<1>UD       0x000f000fUD                    { align1=
 1N }; /* Block size (16x16) */
> +and(1)          g2.3<1>UD       g2.3<0,1,0>UW   0xffffffefUD    { align1=
 1N };
> +mov(16)         g3<1>UD         0x00000000UD                    { align1=
 1H };
> +mov(16)         g4<1>UD         0x00000000UD                    { align1=
 1H };
> +mov(16)         g5<1>UD         0x00000000UD                    { align1=
 1H };
> +mov(16)         g6<1>UD         0x00000000UD                    { align1=
 1H };
> +mov(16)         g7<1>UD         0x00000000UD                    { align1=
 1H };
> +mov(16)         g8<1>UD         0x00000000UD                    { align1=
 1H };
> +mov(16)         g9<1>UD         0x00000000UD                    { align1=
 1H };
> +mov(16)         g10<1>UD        0x00000000UD                    { align1=
 1H };
> +sendc(8)        null<1>UD       g2<8,8,1>F      0x120a8000
> +                            render MsgDesc: media block write MsgCtrl =
=3D 0x0 Surface =3D 0 mlen 9 rlen 0 { align1 1Q };
> +add(1)          g2<1>UD         g1<0,1,0>UW     0x0010UW        { align1=
 1N };
> +sendc(8)        null<1>UD       g2<8,8,1>F      0x120a8000
> +                            render MsgDesc: media block write MsgCtrl =
=3D 0x0 Surface =3D 0 mlen 9 rlen 0 { align1 1Q };
> +
> +/* Now, clear all GRF registers */
> +add.nz.f0.0(1)  a0.4<1>W        a0.4<0,1,0>W    -1W             { align1=
 1N };
> +mov(16)         g[a0]<1>UW      f0.1<0,1,0>UW                   { align1=
 1H };
> +add(1)          a0<1>D          a0<0,1,0>D      32D             { align1=
 1N };
> +(+f0.0) jmpi(1) -8D                                             { align1=
 WE_all 1N };
> +
> +/* Terminante the thread */
> +sendc(8)        null<1>UD       g127<8,8,1>F    0x82000010
> +                            thread_spawner MsgDesc: mlen 1 rlen 0       =
    { align1 1Q EOT };
> diff --git a/scripts/generate_clear_kernel.sh b/scripts/generate_clear_ke=
rnel.sh
> new file mode 100755
> index 00000000..af628a86
> --- /dev/null
> +++ b/scripts/generate_clear_kernel.sh
> @@ -0,0 +1,151 @@
> +#!/bin/bash
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +# Copyright =A9 2020 Intel Corporation
> +#
> +# Permission is hereby granted, free of charge, to any person obtaining a
> +# copy of this software and associated documentation files (the "Softwar=
e"),
> +# to deal in the Software without restriction, including without limitat=
ion
> +# the rights to use, copy, modify, merge, publish, distribute, sublicens=
e,
> +# and/or sell copies of the Software, and to permit persons to whom the
> +# Software is furnished to do so, subject to the following conditions:
> +#
> +# The above copyright notice and this permission notice (including the n=
ext
> +# paragraph) shall be included in all copies or substantial portions of =
the
> +# Software.
> +#
> +# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
> +# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
> +# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHA=
LL
> +# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR O=
THER
> +# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> +# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DE=
ALINGS
> +# IN THE SOFTWARE.
> +
> +export ASSEMBLY_SOURCE=3D./lib/i915/shaders/clear_kernel
> +
> +function get_help {
> +        echo "Usage:    asm_eu_kernel.sh [options]"
> +        echo "Note: hsw_clear_kernel.c/ivb_clear_kernel.c automatically =
generated by this script should never be modified - it would be imported to=
 i915, to use as it is..."
> +        echo " "
> +        echo "Please make sure your Mesa tool is compiled with "-Dtools=
=3Dintel" and "-Ddri-drivers=3Di965", and run this script from IGT source r=
oot directory"
> +        echo " "
> +        echo "Options are:"
> +        echo " -h                       display this help message, and e=
xit"
> +        echo " -g=3Dplatform              generation of device: use "hsw=
" for gen7.5, and "ivb" for gen7 devices"
> +        echo " -o=3Dname_of_file          output file to store Mesa asse=
mbled c-literal for the device - If none specified, default file will be us=
ed - ivb/hsw-cb_assembled"
> +        echo " -m=3Dmesa                  Path to Mesa i965_asm binary"
> +        echo " "
> +        echo " Usage example: \"scripts/generate_clear_kernel.sh -g hsw =
-o hsw_clear_buffer.h -m /path/to/Mesa/i965_asm/binary\""
> +}
> +
> +function include_array # $1=3Darray_name - update Mesa output with desir=
ed format
> +{
> +        array_declaration=3D"static const u32 $(basename $1)_clear_kerne=
l[] =3D {"
> +        close_array=3D";"
> +        sed -i "1s/.*/$array_declaration/" $output_file
> +        sed -i "$ s/$/$close_array/" $output_file
> +}
> +function prefix_header # $1=3Dfilename $2=3Dcomment
> +{
> +	cat <<EOF
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =A9 2020 Intel Corporation
> + *
> + * Generated by: IGT Gpu Tools on $(date)
> + */
> +
> +EOF
> +}
> +
> +function check_output_file #check output file
> +{
> +        if [ "x$output_file" !=3D "x" ]; then
> +                if [ -f "$output_file" ]; then
> +                        echo -e "Warning: The \"$output_file\" file alre=
ady exist - choose another file\n"
> +                        get_help
> +                        exit 1
> +                fi
> +        else
> +                # It is okay to overwrite default file created
> +                echo -e "Output file not specified - using default file =
\"$gen_device-cb_assembled\"\n"
> +                output_file=3D"$gen_device-cb_assembled"
> +        fi
> +}
> +function asm_cb_kernel # as-root <args>
> +{
> +        check_output_file
> +
> +        # Using i965_asm tool to assemble hex file from assembly source
> +        $mesa_i965_asm -g $gen_device -t c_literal  $input_asm_source -o=
 $output_file
> +
> +        if [ ! -f ${output_file} ]; then
> +                echo -e "Failed to assemble CB Kernel with Mesa tool\n"
> +                get_help
> +                exit 1
> +        fi
> +
> +        # Generate header file
> +        if [ "$gen_device" =3D=3D "hsw" ]; then
> +                echo "Generating gen7.5 CB Kernel assembled file \"hsw_c=
lear_kernel.c\" for i915 driver..."
> +
> +                i915_filename=3Dhsw_clear_kernel.c
> +                include_array $gen_device
> +                prefix_header > $i915_filename
> +                cat $output_file >> $i915_filename
> +
> +        elif [ "$gen_device" =3D=3D "ivb" ]; then
> +                echo "Generating gen7 CB Kernel assembled file \"ivb_cle=
ar_kernel.c\" for i915 driver..."
> +
> +                i915_filename=3Divb_clear_kernel.c
> +                include_array $gen_device
> +                prefix_header $gen_device > $i915_filename
> +                cat $output_file >> $i915_filename
> +        fi
> +}
> +
> +while getopts "hg:o:m:" opt; do
> +	case $opt in
> +		h) get_help; exit 0;;
> +		g) gen_device=3D"$OPTARG" ;;
> +		o) output_file=3D"$OPTARG" ;;
> +                m) mesa_i965_asm=3D"$OPTARG" ;;
> +		\?)
> +			echo -e "Unknown option: -$OPTARG\n"
> +			get_help
> +			exit 1
> +			;;
> +	esac
> +done
> +shift $(($OPTIND-1))
> +
> +if [ "x$1" !=3D "x" ]; then
> +	echo -e "Unknown option: $1\n"
> +	get_help
> +	exit 1
> +fi
> +
> +if [ "x$mesa_i965_asm" =3D=3D "x" ]; then
> +        echo -e "i965_asm binary not found\n"
> +        get_help
> +        exit 1
> +fi
> +
> +if [ "x$gen_device" !=3D "x" ]; then
> +        if [ "$gen_device" =3D=3D "hsw" ]; then
> +                input_asm_source=3D"${ASSEMBLY_SOURCE}/hsw.asm"
> +        elif [ "$gen_device" =3D=3D "ivb" ]; then
> +                input_asm_source=3D"${ASSEMBLY_SOURCE}/ivb.asm"
> +        else
> +                echo -e "Unknown platform specified\n"
> +                get_help
> +                exit 1
> +        fi
> +	asm_cb_kernel
> +else
> +        echo -e "Platform generation not specified\n"
> +        get_help
> +        exit 1
> +fi
> -- =

> 2.24.0
> =

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
