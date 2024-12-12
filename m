Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E39E7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 17:04:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FDE10E48A;
	Thu, 12 Dec 2024 17:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CB2421HP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF42310E48A
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 17:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734023055; x=1765559055;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=dWgzUvozZny1WLw5LUx3DCnuQrCnJNxzzX1ApS1sMlI=;
 b=CB2421HPWSukQM6D39k0IztRps9qkghZ3NYkvD/RY24tFjYvQV3/iUW9
 jgPmCq/ouq7GKFlNVAfw12CIVPsw94U6sxUbpY104hikuzMQ6D5Wna5SY
 82wK5gvQ5Yp53i527thOU5UHwY1QDAh0oIpymfHFM+uypz5XFu3vgNsuU
 XzLbH50U0d/VQCuh6oF0MHZQJoBbRryqo3muFhsTcpyuExCI+bYMET2Ry
 yL9HFHHts6ShP6oi69m9tcr873KpIk1JlpBHBnJ3kQDrdivib0KFsvNWz
 BuTAuC5N3N4KbIF54Df4P7QjSu1omJd+uzEqd5B/7FBctI5dRYQA3TtSm Q==;
X-CSE-ConnectionGUID: vy+1s8cfRQi7ss2FAWXlOg==
X-CSE-MsgGUID: pIxzbV1hRK69ZJQFSieymw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44922300"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="44922300"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 09:04:15 -0800
X-CSE-ConnectionGUID: 2pRd8fTHTxG/vgWzeSuNWg==
X-CSE-MsgGUID: krztgB8MSC6N80eVFsoBeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="127086378"
Received: from mkuoppal-desk.fi.intel.com (HELO localhost) ([10.237.72.193])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 09:04:14 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: Re: [PATCH i-g-t 1/1] tests/intel/xe_eudebug_online: Improve
 writes-caching-* tests
In-Reply-To: <20241205140352.16822-2-dominik.karol.piatkowski@intel.com>
References: <20241205140352.16822-1-dominik.karol.piatkowski@intel.com>
 <20241205140352.16822-2-dominik.karol.piatkowski@intel.com>
Date: Thu, 12 Dec 2024 19:04:36 +0200
Message-ID: <87wmg4bzob.fsf@mkuoppal-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@intel.com> writes:

> - Remove repeated calls to caching_get_instruction_count
> - Limit surface checking to each breakpoint that is after write
>   instruction
> - Fix the issue with sync between workload lifetime vs resume
>
> Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@in=
tel.com>
> ---
>  tests/intel/xe_eudebug_online.c | 39 +++++++++++++++++++++++----------
>  1 file changed, 28 insertions(+), 11 deletions(-)
>
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_onl=
ine.c
> index 750350556..c02e2b1f4 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -919,6 +919,10 @@ static void eu_attention_resume_caching_trigger(stru=
ct xe_eudebug_debugger *d,
>  	const uint32_t breakpoint_bit =3D 1 << 30;
>  	struct gpgpu_shader *shader_preamble;
>  	struct gpgpu_shader *shader_write_instr;
> +	const unsigned int instruction_count =3D
> +			caching_get_instruction_count(d->master_fd, s_dim.x, d->flags);
> +	uint64_t seqno =3D 0;
> +	int ret;
>=20=20
>  	shader_preamble =3D gpgpu_shader_create(d->master_fd);
>  	gpgpu_shader__write_dword(shader_preamble, SHADER_CANARY, 0);
> @@ -935,7 +939,7 @@ static void eu_attention_resume_caching_trigger(struc=
t xe_eudebug_debugger *d,
>  	}
>=20=20
>  	/* set breakpoint on next write instruction */
> -	if (*counter < caching_get_instruction_count(d->master_fd, s_dim.x, d->=
flags)) {
> +	if (*counter < instruction_count) {
>  		igt_assert_eq(pread(data->vm_fd, &instr_usdw, sizeof(instr_usdw),
>  				    data->bb_offset + *kernel_offset + shader_preamble->size * 4 +
>  				    shader_write_instr->size * 4 * *counter),
> @@ -949,7 +953,7 @@ static void eu_attention_resume_caching_trigger(struc=
t xe_eudebug_debugger *d,
>  	}
>=20=20
>  	/* restore current instruction */
> -	if (*counter && *counter <=3D caching_get_instruction_count(d->master_f=
d, s_dim.x, d->flags))
> +	if (*counter && *counter <=3D instruction_count)
>  		overwrite_immediate_value_in_common_target_write(data->vm_fd,
>  								 data->bb_offset + *kernel_offset +
>  								 shader_preamble->size * 4 +
> @@ -958,7 +962,7 @@ static void eu_attention_resume_caching_trigger(struc=
t xe_eudebug_debugger *d,
>  								 CACHING_VALUE(*counter - 1));
>=20=20
>  	/* poison next instruction */
> -	if (*counter < caching_get_instruction_count(d->master_fd, s_dim.x, d->=
flags))
> +	if (*counter < instruction_count)
>  		overwrite_immediate_value_in_common_target_write(data->vm_fd,
>  								 data->bb_offset + *kernel_offset +
>  								 shader_preamble->size * 4 +
> @@ -969,15 +973,28 @@ static void eu_attention_resume_caching_trigger(str=
uct xe_eudebug_debugger *d,
>  	gpgpu_shader_destroy(shader_write_instr);
>  	gpgpu_shader_destroy(shader_preamble);
>=20=20
> -	for (int i =3D 0; i < data->target_size; i +=3D sizeof(uint32_t)) {
> -		igt_assert_eq(pread(data->vm_fd, &val, sizeof(val), data->target_offse=
t + i),
> -			      sizeof(val));
> -		igt_assert_f(val !=3D CACHING_POISON_VALUE, "Poison value found at %04=
d!\n", i);
> -	}
> +	/* check surface at each breakpoint that is after write instruction */
> +	if (*counter > 1 && *counter <=3D instruction_count + 1)
> +		for (int i =3D 0; i < data->target_size; i +=3D sizeof(uint32_t)) {
> +			igt_assert_eq(pread(data->vm_fd, &val, sizeof(val),
> +					    data->target_offset + i), sizeof(val));
> +			igt_assert_f(val !=3D CACHING_POISON_VALUE,
> +				     "Poison value found at %04d!\n", i);
> +		}
>=20=20
> -	eu_ctl_resume(d->master_fd, d->fd, att->client_handle,
> -		      att->exec_queue_handle, att->lrc_handle,
> -		      att->bitmask, att->bitmask_size);
> +	ret =3D __eu_ctl(d->fd, att->client_handle, att->exec_queue_handle, att=
->lrc_handle,
> +		       att->bitmask, &att->bitmask_size, DRM_XE_EUDEBUG_EU_CONTROL_CMD=
_RESUME,
> +		       &seqno);
> +
> +	/*
> +	 * XXX: build a better sync between workload lifetime vs resume.
> +	 *
> +	 * Right now, it is possible to get attention after the workload has va=
nished - in result,
> +	 * eu_ctl above fails. Band-aid it by checking the eu_ctl return value =
only n times it is
> +	 * actually expected - that is, instruction_count of writes + 2 nops.
> +	 */

The eu_ctl seqno versus the attention seqno can be used to untangle the
async. But this should be band aid to remove timing component that
causes some fails atleast on slow setups.

Thanks for fixing this,
Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>


> +	if (*counter < instruction_count + 2)
> +		igt_assert_eq(ret, 0);
>=20=20
>  	(*counter)++;
>  }
> --=20
> 2.34.1
