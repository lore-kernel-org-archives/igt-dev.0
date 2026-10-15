Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA8FCC6B33
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 15:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6170210EC40;
	Thu, 15 Oct 2026 15:56:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075C310EC40
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 15:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792079740; x=1823615740;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+X+uXR5rEFmzz242LNrLlywZVALlzyAR+8+iIYO9Qtg=;
 b=jDkI5V8+dU+e8TvP9gPdXF7BRxoeSCpHh8+5nIHvx6blll7KBNuRFsgf
 vPHWYdb4hgmVzIA10oz1dOmei8GNgapLzbMT2EfFMAWXCkZ4eEctCJHkp
 QybEo+RfgdZ5Hs5gb15+QDDKohRKNOc2eY0i/b9S9YZSNU9YmboQeesar
 RWPrFQTgvkiYQkWSQrr8cL4PqYT2l0W5GVWTZGjoZd3a6HBGUHBnl58LY
 OFPiWL5blXNmTsi9AG9/71QxMS5z+gi3JVx2d318bTaPQh+zc4Yk+xTUl
 GTprKOk7mAIH1fADGQegO+tcly8YYYvtNkDHuVlpkDkR4VH6EtOFHR/ph A==;
X-CSE-ConnectionGUID: YED9pzKITF2pai/x5Zmcwg==
X-CSE-MsgGUID: TU2obG5CSmChtdZy1yivDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="959200"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="959200"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 08:55:39 -0700
X-CSE-ConnectionGUID: cAcNpUoXTUml00uGBAA3jQ==
X-CSE-MsgGUID: c6yd4vShQ6eQsluj/iSmvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2082068"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 08:55:37 -0700
Date: Thu, 15 Oct 2026 17:55:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Daniel Stone <daniels@collabora.com>
Cc: igt-dev@lists.freedesktop.org, boris.brezillon@collabora.com,
 laura.nao@collabora.com, adrian.larumbe@collabora.com,
 daniel.almeida@collabora.com, liviu.dudau@arm.com
Subject: Re: [PATCH 3/4] panthor: Add more CSF instructions
Message-ID: <20261015155535.r7kpj6cagxzkyuei@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniel Stone <daniels@collabora.com>, igt-dev@lists.freedesktop.org,
 boris.brezillon@collabora.com, laura.nao@collabora.com,
 adrian.larumbe@collabora.com, daniel.almeida@collabora.com,
 liviu.dudau@arm.com
References: <20261015130837.710795-1-daniels@collabora.com>
 <20261015130837.710795-4-daniels@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261015130837.710795-4-daniels@collabora.com>
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

Hi Daniel,
On 2026-10-15 at 14:05:48 +0100, Daniel Stone wrote:
> Add a few more CSF instructions which we will need to execute shader
> workloads.
> 
> Signed-off-by: Daniel Stone <daniels@collabora.com>
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

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
