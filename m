Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB22606A319
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 15:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jH+FBt5e
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF3B10FEB2;
	Wed, 21 Oct 2026 15:54:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8E41F10E021
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 15:53:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFA832A68
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 08:53:31 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 F364D3F7D8
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 08:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
 t=1792598015; bh=alskUB6ppDBkIWFyx9yLgIMedSKkLXjM2/RvQ1NuobQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jH+FBt5eM+SIDyEdA/fIjzw69DQqWlRNzZGYlVQQo4ImlnKd4TaD6lXfPY+epy3Bt
 7AaZc8+HAmk+S0E6VNkCzd3zUqkBkWSRV6O/Hnqv6ql6SlDe44NhkSRL45VKb4ki09
 eElx4hPPz5yx0LJCYfRtUcvGl7ONtev5YWIbpoL0=
Date: Wed, 21 Oct 2026 16:53:33 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Daniel Stone <daniels@collabora.com>
Cc: igt-dev@lists.freedesktop.org, boris.brezillon@collabora.com,
 laura.nao@collabora.com, adrian.larumbe@collabora.com,
 daniel.almeida@collabora.com
Subject: Re: [PATCH 3/4] panthor: Add more CSF instructions
Message-ID: <atjf_eDTuIksWbCV@e142607>
References: <20261015130837.710795-1-daniels@collabora.com>
 <20261015130837.710795-4-daniels@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261015130837.710795-4-daniels@collabora.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 15, 2026 at 02:05:48PM +0100, Daniel Stone wrote:
> Add a few more CSF instructions which we will need to execute shader
> workloads.
> 
> Signed-off-by: Daniel Stone <daniels@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  lib/igt_panthor.h | 126 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 126 insertions(+)
> 
> diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
> index 3056ebd75..dfeb0ac60 100644
> --- a/lib/igt_panthor.h
> +++ b/lib/igt_panthor.h
> @@ -64,8 +64,13 @@ enum cs_opcode {
>  	CS_OPCODE_MOVE48 = 1,
>  	CS_OPCODE_MOVE32 = 2,
>  	CS_OPCODE_WAIT = 3,
> +	CS_OPCODE_RUN_COMPUTE = 4,
>  	CS_OPCODE_STM = 21,
> +	CS_OPCODE_SET_SB_ENTRY = 23,
> +	CS_OPCODE_CALL = 32,
> +	CS_OPCODE_REQ_RESOURCE = 34,
>  	CS_OPCODE_FLUSH_CACHE = 36,
> +	CS_OPCODE_ERROR_BARRIER = 47,
>  };
>  
>  enum cs_flush_mode {
> @@ -75,6 +80,12 @@ enum cs_flush_mode {
>  	CS_FLUSH_MODE_CLEAN_AND_INVALIDATE = 3,
>  };
>  
> +enum cs_task_axis {
> +	CS_TASK_AXIS_X = 0,
> +	CS_TASK_AXIS_Y = 1,
> +	CS_TASK_AXIS_Z = 2,
> +};
> +
>  /* There's no plan to support big endian in the UMD, so keep
>   * things simple and don't bother supporting it.
>   */
> @@ -108,6 +119,19 @@ struct cs_instr {
>  			uint64_t unused1: 23;
>  			uint64_t opcode: 8;
>  		} wait;
> +		struct {
> +			uint64_t task_increment: 14;
> +			uint64_t task_axis: 2;
> +			uint64_t unused0: 16;
> +			uint64_t progress: 1;
> +			uint64_t unused1: 7;
> +			uint64_t srt_entry: 2;
> +			uint64_t spd_entry: 2;
> +			uint64_t tsd_entry: 2;
> +			uint64_t fau_entry: 2;
> +			uint64_t unused2: 8;
> +			uint64_t opcode: 8;
> +		} run_compute;
>  		struct {
>  			uint64_t offset: 16;
>  			uint64_t mask: 16;
> @@ -116,6 +140,27 @@ struct cs_instr {
>  			uint64_t src: 8;
>  			uint64_t opcode: 8;
>  		} stm;
> +		struct {
> +			uint64_t ep_entry: 4;
> +			uint64_t other_entry: 4;
> +			uint64_t unused: 48;
> +			uint64_t opcode: 8;
> +		} set_sb_entry;
> +		struct {
> +			uint64_t unused0: 32;
> +			uint64_t len: 8;
> +			uint64_t addr: 8;
> +			uint64_t unused1: 8;
> +			uint64_t opcode: 8;
> +		} call;
> +		struct {
> +			uint64_t compute: 1;
> +			uint64_t fragment: 1;
> +			uint64_t tiler: 1;
> +			uint64_t idvs: 1;
> +			uint64_t unused: 52;
> +			uint64_t opcode: 8;
> +		} req_resource;
>  		struct {
>  			uint64_t l2_mode: 4;
>  			uint64_t lsc_mode: 4;
> @@ -128,6 +173,10 @@ struct cs_instr {
>  			uint64_t unused2: 4;
>  			uint64_t opcode: 8;
>  		} flush;
> +		struct {
> +			uint64_t unused: 56;
> +			uint64_t opcode: 8;
> +		} error_barrier;
>  		uint64_t raw;
>  	};
>  };
> @@ -186,6 +235,27 @@ cs_wait(uint16_t wait_mask, bool progress_inc)
>  	return instr.raw;
>  }
>  
> +static inline uint64_t
> +cs_run_compute(uint16_t task_increment, enum cs_task_axis task_axis, bool progress,
> +	       uint32_t srt_entry, uint32_t spd_entry, uint32_t tsd_entry,
> +	       uint32_t fau_entry)
> +{
> +	struct cs_instr instr = {
> +		.run_compute = {
> +			.task_increment = task_increment,
> +			.task_axis = task_axis,
> +			.progress = progress,
> +			.srt_entry = srt_entry,
> +			.spd_entry = spd_entry,
> +			.tsd_entry = tsd_entry,
> +			.fau_entry = fau_entry,
> +			.opcode = CS_OPCODE_RUN_COMPUTE,
> +		},
> +	};
> +
> +	return instr.raw;
> +}
> +
>  static inline uint64_t
>  cs_stm(uint8_t address, uint8_t src, uint16_t mask, int16_t offset)
>  {
> @@ -214,6 +284,50 @@ cs_stm64(uint8_t address, uint8_t src, int16_t offset)
>  	return cs_stm(address, src, 0x3, offset);
>  }
>  
> +static inline uint64_t
> +cs_set_sb_entry(uint32_t ep_entry, uint32_t other_entry)
> +{
> +	struct cs_instr instr = {
> +		.set_sb_entry = {
> +			.ep_entry = ep_entry,
> +			.other_entry = other_entry,
> +			.opcode = CS_OPCODE_SET_SB_ENTRY,
> +		},
> +	};
> +
> +	return instr.raw;
> +}
> +
> +static inline uint64_t
> +cs_call(uint8_t addr, uint8_t len)
> +{
> +	struct cs_instr instr = {
> +		.call = {
> +			.addr = addr,
> +			.len = len,
> +			.opcode = CS_OPCODE_CALL,
> +		},
> +	};
> +
> +	return instr.raw;
> +}
> +
> +static inline uint64_t
> +cs_req_resource(bool compute, bool fragment, bool tiler, bool idvs)
> +{
> +	struct cs_instr instr = {
> +		.req_resource = {
> +			.compute = compute,
> +			.fragment = fragment,
> +			.tiler = tiler,
> +			.idvs = idvs,
> +			.opcode = CS_OPCODE_REQ_RESOURCE,
> +		},
> +	};
> +
> +	return instr.raw;
> +}
> +
>  static inline uint64_t
>  cs_flush(enum cs_flush_mode l2_mode,
>  	 enum cs_flush_mode lsc_mode,
> @@ -237,4 +351,16 @@ cs_flush(enum cs_flush_mode l2_mode,
>  	return instr.raw;
>  }
>  
> +static inline uint64_t
> +cs_error_barrier(void)
> +{
> +	struct cs_instr instr = {
> +		.error_barrier = {
> +			.opcode = CS_OPCODE_ERROR_BARRIER,
> +		},
> +	};
> +
> +	return instr.raw;
> +}
> +
>  #endif /* IGT_PANTHOR_H */
> -- 
> 2.47.3
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
