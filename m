Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6C7CE7AB6
	for <igt-dev@archiver.kernel.org>; Fri,  6 Sep 2024 06:55:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D4A10E759;
	Fri,  6 Sep 2024 06:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RFQUMmkJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D0D10E759
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Sep 2024 06:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725605700; x=1757141700;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cuTnQQhMQ9yAFOsdu54So3yNpflfs9kGVazxL+lIbBc=;
 b=RFQUMmkJk+ay028YfktWjyVNFvlOh2saF4ow1yk89o0KONxtdwVAmg8u
 K5wpT1Kmv0BKY0e4aLn8t2ypNZvscrmeYRjhDgKMcJe+/nl+RnRk1eJ12
 avRuZthyhu0S0FF8uatEmRYkxP8v1Et8MXFVulQSHdF5j4qdzcy3XnQVj
 G//9Ch8Vc3frC9ntf0e6sLy9AQxwkUr4yyTFGMFZNvOudjYvdJVDlSH+P
 dyuSTTr/fUXpoJyNEw/WQpMKCzQcx6BrSJ7zxTegGatrB8zL+ks4LTMbq
 XnpS43h99uZ2wTlNxhHxPH9dTzqnMrEz7sYe1ahgl2MYYc/VsDBUmN3hG g==;
X-CSE-ConnectionGUID: vcCwgDmURYOxpXUGEiqeTw==
X-CSE-MsgGUID: rPU+1fA6SeeUNFKFfqkRzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="49768631"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="49768631"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 23:54:59 -0700
X-CSE-ConnectionGUID: x8iiT158RNe96XWzl4xvUQ==
X-CSE-MsgGUID: A4lSbIZQSi+muGZsNCLYeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="65856616"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.252])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 23:54:56 -0700
Date: Fri, 6 Sep 2024 08:54:52 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH i-g-t v6 04/17] lib/gpgpu_shader: Add write_on_exception
 template
Message-ID: <20240906065452.ks3xsm5jixfnbjfw@zkempczy-mobl2>
References: <20240905092812.94553-1-christoph.manszewski@intel.com>
 <20240905092812.94553-5-christoph.manszewski@intel.com>
 <20240905105131.7sqnzdpgnfad5azw@zkempczy-mobl2>
 <e428a67e-6109-451a-bb1a-6eab330279ef@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e428a67e-6109-451a-bb1a-6eab330279ef@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Fri, Sep 06, 2024 at 07:58:16AM +0200, Andrzej Hajda wrote:
> 
> 
> On 05.09.2024 12:51, Zbigniew Kempczyński wrote:
> > On Thu, Sep 05, 2024 at 11:27:59AM +0200, Christoph Manszewski wrote:
> > > From: Andrzej Hajda <andrzej.hajda@intel.com>
> > > 
> > > Writing specific value to memory location on unexpected value in exception
> > > register allows to report errors from inside shader or siplet.
> > > 
> > > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > > Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> > > ---
> > >   lib/gpgpu_shader.c          | 53 ++++++++++++++++++++++
> > >   lib/gpgpu_shader.h          |  2 +
> > >   lib/iga64_generated_codes.c | 87 ++++++++++++++++++++++++++++++++++++-
> > >   3 files changed, 141 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> > > index dacab51dd..926eccaa0 100644
> > > --- a/lib/gpgpu_shader.c
> > > +++ b/lib/gpgpu_shader.c
> > > @@ -634,6 +634,59 @@ void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
> > >   	", 2, y_offset, 3, value, value, value, value);
> > >   }
> > > +/**
> > > + * gpgpu_shader__write_on_exception:
> > > + * @shdr: shader to be modified
> > > + * @value: dword to be written
> > > + * @y_offset: write target offset within the surface in rows
> > > + * @mask: mask to be applied on exception register
> > > + * @expected: expected value of exception register with @mask applied
> > > + *
> > > + * Check if bits specified by @mask in exception register(cr0.1) are equal
> > > + * to provided ones: cr0.1 & @mask == @expected,
> > > + * if yes fill dword in (row, column/dword) == (tg_id_y + @y_offset, tg_id_x).
> > > + */
> > > +void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t value,
> > > +				      uint32_t y_offset, uint32_t mask, uint32_t expected)
> > > +{
> > > +	emit_iga64_code(shdr, write_on_exception, "					\n\
> > > +	// Clear message header								\n\
> > > +(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud					\n\
> > I got rid off rest of instructions and appropriate xe_exec_sip tests are
> > still passing. May you check why this happens?
> 
> The "rest of instructions" are used to set error value. If you get rid of
> them, the error will not be set, and the test will report almost always
> success.

According to xe_exec_sip which is currently the only user of this shader -
error which is set should be checked if it contains expected value (error
code). Unfortunately this memory location is overwritten immediately when
invalid instruction triggers entering sip.  I understand entering sip is
explicit proof that execution of invalid instruction happened, but it doesn't
prove error code setting is working properly. Noone reads it after it is set,
what means if there's something wrong in the hardware and compare inside the
write_on_exception() shader doesn't call block write we're not aware of that.

> So this is correct behavior.

Code is correct, but I've no prove how it behaves. As test logic
overwrites error code I can't say it previously contained error
code we expect.

> On the other side, I agree block writing is quite big and complicated and
> varies between gens. So if some day the block will stop working as expected,
> the test will always report success.

Agree, we'll need to change the verification logic a bit to catch
situation when error setting doesn't work. Not a blocker for the
moment, but this deserves to be addressed.


> There are multiple ways of hardening it, for example, we can perform write
> on success (as opposed to the current situation, when we perform write only
> on error).

Whatever, but we have to be sure shader is writing error code in place
we want.

Thanks for the offline discussion yesterday.

So at the moment I can give my r-b here (code is correct), but we just
don't catch it in the test.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Regards
> Andrzej
> 
> > 
> > --
> > Zbigniew
> > 
> > > +	// Payload									\n\
> > > +(W)	mov (1|M0)               r5.0<1>:ud    ARG(3):ud				\n\
> > > +#if GEN_VER < 2000 // prepare Media Block Write						\n\
> > > +	// X offset of the block in bytes := (thread group id X << ARG(0))		\n\
> > > +(W)	shl (1|M0)               r4.0<1>:ud    r0.1<0;1,0>:ud    ARG(0):ud		\n\
> > > +	// Y offset of the block in rows := thread group id Y				\n\
> > > +(W)	mov (1|M0)               r4.1<1>:ud    r0.6<0;1,0>:ud				\n\
> > > +(W)	add (1|M0)               r4.1<1>:ud    r4.1<0;1,0>:ud   ARG(1):ud		\n\
> > > +	// block width [0,63] representing 1 to 64 bytes				\n\
> > > +(W)	mov (1|M0)               r4.2<1>:ud    ARG(2):ud				\n\
> > > +	// FFTID := FFTID from R0 header						\n\
> > > +(W)	mov (1|M0)               r4.4<1>:ud    r0.5<0;1,0>:ud				\n\
> > > +#else // prepare Typed 2D Block Store							\n\
> > > +	// Load r2.0-3 with tg id X << ARG(0)						\n\
> > > +(W)	shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    ARG(0):ud		\n\
> > > +	// Load r2.4-7 with tg id Y + ARG(1):ud						\n\
> > > +(W)	mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud				\n\
> > > +(W)	add (1|M0)               r2.1<1>:ud    r2.1<0;1,0>:ud    ARG(1):ud		\n\
> > > +	// Store X and Y block start (160:191 and 192:223)				\n\
> > > +(W)	mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud				\n\
> > > +	// Store X and Y block max_size (224:231 and 232:239)				\n\
> > > +(W)	mov (1|M0)               r4.7<1>:ud    ARG(2):ud				\n\
> > > +#endif											\n\
> > > +	// Check if masked exception is equal to provided value and write conditionally \n\
> > > +(W)      and (1|M0)              r3.0<1>:ud     cr0.1<0;1,0>:ud ARG(4):ud		\n\
> > > +(W)      mov (1|M0)              f0.0<1>:ud     0x0:ud					\n\
> > > +(W)      cmp (1|M0)     (eq)f0.0 null:ud        r3.0<0;1,0>:ud  ARG(5):ud		\n\
> > > +#if GEN_VER < 2000 // Media Block Write							\n\
> > > +(W&f0.0) send.dc1 (16|M0)        null     r4   src1_null 0    0x40A8000			\n\
> > > +#else // Typed 2D Block Store								\n\
> > > +(W&f0.0) send.tgm (16|M0)        null     r4   null:0    0    0x64000007		\n\
> > > +#endif											\n\
> > > +	", 2, y_offset, 3, value, mask, expected);
> > > +}
> > > +
> > >   /**
> > >    * gpgpu_shader__end_system_routine:
> > >    * @shdr: shader to be modified
> > > diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
> > > index da4ece983..6c6953a1a 100644
> > > --- a/lib/gpgpu_shader.h
> > > +++ b/lib/gpgpu_shader.h
> > > @@ -79,6 +79,8 @@ void gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
> > >   void gpgpu_shader__write_aip(struct gpgpu_shader *shdr, uint32_t y_offset);
> > >   void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
> > >   			       uint32_t y_offset);
> > > +void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t dw,
> > > +			       uint32_t y_offset, uint32_t mask, uint32_t value);
> > >   void gpgpu_shader__label(struct gpgpu_shader *shdr, int label_id);
> > >   void gpgpu_shader__jump(struct gpgpu_shader *shdr, int label_id);
> > >   void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
> > > diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
> > > index dd849eebc..0800496c5 100644
> > > --- a/lib/iga64_generated_codes.c
> > > +++ b/lib/iga64_generated_codes.c
> > > @@ -3,7 +3,7 @@
> > >   #include "gpgpu_shader.h"
> > > -#define MD5_SUM_IGA64_ASMS 33b7cd843e3b009c123a85a6c520d7d0
> > > +#define MD5_SUM_IGA64_ASMS 716c5b437e2abd2a1768e79182993ff6
> > >   struct iga64_template const iga64_code_gpgpu_fill[] = {
> > >   	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> > > @@ -192,6 +192,91 @@ struct iga64_template const iga64_code_breakpoint_suppress[] = {
> > >   	}}
> > >   };
> > > +struct iga64_template const iga64_code_write_on_exception[] = {
> > > +	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
> > > +		0x80100061, 0x04054220, 0x00000000, 0x00000000,
> > > +		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
> > > +		0x80000069, 0x02058220, 0x02000014, 0xc0ded000,
> > > +		0x80000061, 0x02150220, 0x00000064, 0x00000000,
> > > +		0x80001940, 0x02158220, 0x02000214, 0xc0ded001,
> > > +		0x80041961, 0x04550220, 0x00220205, 0x00000000,
> > > +		0x80000061, 0x04754220, 0x00000000, 0xc0ded002,
> > > +		0x80000965, 0x03058220, 0x02008010, 0xc0ded004,
> > > +		0x80000961, 0x30014220, 0x00000000, 0x00000000,
> > > +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded005,
> > > +		0x84134031, 0x00000000, 0xd00e0494, 0x04000000,
> > > +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> > > +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> > > +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> > > +	}},
> > > +	{ .gen_ver = 1270, .size = 60, .code = (const uint32_t []) {
> > > +		0x80040061, 0x04054220, 0x00000000, 0x00000000,
> > > +		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
> > > +		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
> > > +		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
> > > +		0x80001940, 0x04258220, 0x02000424, 0xc0ded001,
> > > +		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
> > > +		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
> > > +		0x80000965, 0x03058220, 0x02008020, 0xc0ded004,
> > > +		0x80000961, 0x30014220, 0x00000000, 0x00000000,
> > > +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded005,
> > > +		0x80001a01, 0x00010000, 0x00000000, 0x00000000,
> > > +		0x81044031, 0x00000000, 0xc0000414, 0x02a00000,
> > > +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> > > +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> > > +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> > > +	}},
> > > +	{ .gen_ver = 1260, .size = 56, .code = (const uint32_t []) {
> > > +		0x80100061, 0x04054220, 0x00000000, 0x00000000,
> > > +		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
> > > +		0x80000069, 0x04058220, 0x02000014, 0xc0ded000,
> > > +		0x80000061, 0x04150220, 0x00000064, 0x00000000,
> > > +		0x80001940, 0x04158220, 0x02000414, 0xc0ded001,
> > > +		0x80000061, 0x04254220, 0x00000000, 0xc0ded002,
> > > +		0x80000061, 0x04450220, 0x00000054, 0x00000000,
> > > +		0x80000965, 0x03058220, 0x02008010, 0xc0ded004,
> > > +		0x80000961, 0x30014220, 0x00000000, 0x00000000,
> > > +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded005,
> > > +		0x84134031, 0x00000000, 0xc0000414, 0x02a00000,
> > > +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> > > +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> > > +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> > > +	}},
> > > +	{ .gen_ver = 1250, .size = 60, .code = (const uint32_t []) {
> > > +		0x80040061, 0x04054220, 0x00000000, 0x00000000,
> > > +		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
> > > +		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
> > > +		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
> > > +		0x80001940, 0x04258220, 0x02000424, 0xc0ded001,
> > > +		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
> > > +		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
> > > +		0x80000965, 0x03058220, 0x02008020, 0xc0ded004,
> > > +		0x80000961, 0x30014220, 0x00000000, 0x00000000,
> > > +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded005,
> > > +		0x80001a01, 0x00010000, 0x00000000, 0x00000000,
> > > +		0x81044031, 0x00000000, 0xc0000414, 0x02a00000,
> > > +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> > > +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> > > +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> > > +	}},
> > > +	{ .gen_ver = 0, .size = 56, .code = (const uint32_t []) {
> > > +		0x80040061, 0x04054220, 0x00000000, 0x00000000,
> > > +		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
> > > +		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
> > > +		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
> > > +		0x80000140, 0x04258220, 0x02000424, 0xc0ded001,
> > > +		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
> > > +		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
> > > +		0x80000165, 0x03058220, 0x02008020, 0xc0ded004,
> > > +		0x80000161, 0x30014220, 0x00000000, 0x00000000,
> > > +		0x80000270, 0x00018220, 0x12000304, 0xc0ded005,
> > > +		0x8104a031, 0x00000000, 0xc0000414, 0x02a00000,
> > > +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> > > +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> > > +		0x80000101, 0x00010000, 0x00000000, 0x00000000,
> > > +	}}
> > > +};
> > > +
> > >   struct iga64_template const iga64_code_media_block_write[] = {
> > >   	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
> > >   		0x80100061, 0x04054220, 0x00000000, 0x00000000,
> > > -- 
> > > 2.34.1
> > > 
> 
