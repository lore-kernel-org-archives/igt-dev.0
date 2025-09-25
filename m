Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C737CAC5AA
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 07:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF1810E87C;
	Thu, 25 Sep 2025 07:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OfM2UAyt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E4110E87C
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 07:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758786529; x=1790322529;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WCjrpB+uHUCG/KFh542OiwkMZjLyHgczxvGzKGoiffE=;
 b=OfM2UAytQTawpCP3mcImxnMNTEs+l0z4KnnkzIODkH7189SvhSgAOM0Q
 IHj4dY50VDI552CloLP3Ul05pkpFLvXvVS45yuhI6APu+GAl6JUPGtRc1
 FxBApLB7js2qf6u2Re77cLmkevjEwC6AuSSOMCjrG8mn2N2ERKK4odnsK
 SoanxWNRjERwUj2iuB/n/D1IeEWHn3V77Pchtay99JoM0cTsjjgbxnNBp
 1azqMxRuzUjUVhfmF0pdDRN8ugk6mJB3ETrX/uqrN7HuHP0oaqs3+cl/c
 TrCMp0YS8QPnwSK9oHlad5AdVW91Z2LT+9s7Udjvix4Rf9GOw0o9Umobu Q==;
X-CSE-ConnectionGUID: GnFNmdYbRZGJ4luIWNn2yA==
X-CSE-MsgGUID: Lz243d8bSy6ep/9fX33oYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60134765"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="60134765"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 00:48:49 -0700
X-CSE-ConnectionGUID: HgGMS/4KRcy16NCEnszqGA==
X-CSE-MsgGUID: 527eH2FpQi2/BW5fQfswxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="208200610"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 00:48:48 -0700
Date: Thu, 25 Sep 2025 09:48:45 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] lib/intel_blt.c: Fix MEM_COPY instruction for xe2+
 platforms
Message-ID: <scbqoixwk3kjbk6xbduoa7tumrmyptendhyugoppqmqpi465cz@l6zhkpxft5oe>
References: <20250923150926.1829954-1-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250923150926.1829954-1-balasubramani.vivekanandan@intel.com>
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

On Tue, Sep 23, 2025 at 08:39:26PM +0530, Balasubramani Vivekanandan wrote:
> There is a difference in the MEM_COPY instruction structure starting
> with xe2 based platforms. Fixed it.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  lib/intel_blt.c | 126 +++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 93 insertions(+), 33 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 71ed891c3..1a8808688 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1800,17 +1800,32 @@ int blt_fast_copy(int fd,
>  
>  struct xe_mem_copy_data {
>  	struct {
> -		uint32_t length:			BITRANGE(0, 7);
> -		uint32_t compression_format:	BITRANGE(8, 12);
> -		uint32_t compression_enable:	BITRANGE(13, 13);
> -		uint32_t rsvd0:			BITRANGE(14, 14);
> -		uint32_t dst_compressible:	BITRANGE(15, 15);
> -		uint32_t src_compressible:	BITRANGE(16, 16);
> -		uint32_t copy_type:		BITRANGE(17, 18);
> -		uint32_t mode:			BITRANGE(19, 19);
> -		uint32_t rsvd1:			BITRANGE(20, 21);
> -		uint32_t opcode:			BITRANGE(22, 28);
> -		uint32_t client:			BITRANGE(29, 31);
> +		union {
> +			struct {
> +				uint32_t length:		BITRANGE(0, 7);
> +				uint32_t rsvd0:			BITRANGE(8, 8);
> +				uint32_t compression_format:	BITRANGE(9, 12);
> +				uint32_t rsvd1:			BITRANGE(13, 16);
> +				uint32_t copy_type:		BITRANGE(17, 18);
> +				uint32_t mode:			BITRANGE(19, 19);
> +				uint32_t rsvd2:			BITRANGE(20, 21);
> +				uint32_t opcode:		BITRANGE(22, 28);
> +				uint32_t client:		BITRANGE(29, 31);
> +			} x2;

xe2?

> +			struct {
> +				uint32_t length:		BITRANGE(0, 7);
> +				uint32_t compression_format:	BITRANGE(8, 12);
> +				uint32_t compression_enable:	BITRANGE(13, 13);
> +				uint32_t rsvd0:			BITRANGE(14, 14);
> +				uint32_t dst_compressible:	BITRANGE(15, 15);
> +				uint32_t src_compressible:	BITRANGE(16, 16);
> +				uint32_t copy_type:		BITRANGE(17, 18);
> +				uint32_t mode:			BITRANGE(19, 19);

If I'm not wrong mode is not used on gen12 and it is in rsvd1 [21:19].

> +				uint32_t rsvd1:			BITRANGE(20, 21);
> +				uint32_t opcode:		BITRANGE(22, 28);
> +				uint32_t client:		BITRANGE(29, 31);
> +			} gen12;

I think you may use 'xe' here.


> +		};
>  	} dw00;
>  
>  	struct {
> @@ -1859,9 +1874,22 @@ struct xe_mem_copy_data {
>  	} dw08;
>  
>  	struct {
> -		uint32_t dst_mocs:		BITRANGE(0, 6);
> -		uint32_t rsvd0:			BITRANGE(7, 24);
> -		uint32_t src_mocs:		BITRANGE(25, 31);
> +		union {
> +			struct {
> +				uint32_t dst_encrypt:		BITRANGE(0, 0);
> +				uint32_t rsvd0:			BITRANGE(1, 2);
> +				uint32_t dst_mocs:		BITRANGE(3, 6);
> +				uint32_t rsvd1:			BITRANGE(7, 24);
> +				uint32_t src_encrypt:		BITRANGE(25, 25);
> +				uint32_t rsvd2:			BITRANGE(26, 27);
> +				uint32_t src_mocs:		BITRANGE(28, 31);
> +			} x2;
> +			struct {
> +				uint32_t dst_mocs:		BITRANGE(0, 6);
> +				uint32_t rsvd0:			BITRANGE(7, 24);
> +				uint32_t src_mocs:		BITRANGE(25, 31);
> +			} gen12;
> +		};
>  	} dw09;
>  };
>  
> @@ -1887,18 +1915,32 @@ void blt_mem_copy_init(int fd, struct blt_mem_copy_data *mem,
>  	mem->copy_type = copy_type;
>  }
>  
> -static void dump_bb_mem_copy_cmd(struct xe_mem_copy_data *data)
> +static void dump_bb_mem_copy_cmd(int fd, struct xe_mem_copy_data *data)
>  {
>  	uint32_t *cmd = (uint32_t *) data;
> +	uint32_t devid = intel_get_drm_devid(fd);
>  
>  	igt_info("BB details:\n");
> -	igt_info(" dw00: [%08x] <client: 0x%x, opcode: 0x%x, length: %d> "
> -		 "[copy type: %d, mode: %d]\n",
> -		 cmd[0], data->dw00.client, data->dw00.opcode, data->dw00.length,
> -		 data->dw00.copy_type, data->dw00.mode);
> -	igt_info(" dw01: [%08x] width: %u\n", cmd[1],
> -		 data->dw00.mode == MODE_BYTE ? data->dw01.byte_copy.width :
> -						data->dw01.page_copy.width);
> +
> +	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
> +		igt_info(" dw00: [%08x] <client: 0x%x, opcode: 0x%x, length: %d> "
> +			 "[copy type: %d, mode: %d]\n",
> +			 cmd[0], data->dw00.x2.client, data->dw00.x2.opcode,
> +			 data->dw00.x2.length, data->dw00.x2.copy_type,
> +			 data->dw00.x2.mode);
> +		igt_info(" dw01: [%08x] width: %u\n", cmd[1],
> +			 data->dw00.x2.mode == MODE_BYTE ? data->dw01.byte_copy.width :
> +							data->dw01.page_copy.width);
> +	} else {
> +		igt_info(" dw00: [%08x] <client: 0x%x, opcode: 0x%x, length: %d> "
> +			 "[copy type: %d, mode: %d]\n",
> +			 cmd[0], data->dw00.gen12.client,
> +			 data->dw00.gen12.opcode, data->dw00.gen12.length,
> +			 data->dw00.gen12.copy_type, data->dw00.gen12.mode);
> +		igt_info(" dw01: [%08x] width: %u\n", cmd[1],
> +			 data->dw00.gen12.mode == MODE_BYTE ? data->dw01.byte_copy.width :
> +							data->dw01.page_copy.width);
> +	}
>  	igt_info(" dw02: [%08x] height: %u\n", cmd[2], data->dw02.height);
>  	igt_info(" dw03: [%08x] src pitch: %u\n", cmd[3], data->dw03.src_pitch);
>  	igt_info(" dw04: [%08x] dst pitch: %u\n", cmd[4], data->dw04.dst_pitch);
> @@ -1910,8 +1952,15 @@ static void dump_bb_mem_copy_cmd(struct xe_mem_copy_data *data)
>  		 cmd[7], data->dw07.dst_address_lo);
>  	igt_info(" dw08: [%08x] dst offset hi (0x%x)\n",
>  		 cmd[8], data->dw08.dst_address_hi);
> -	igt_info(" dw09: [%08x] mocs <dst: 0x%x, src: 0x%x>\n",
> -		 cmd[8], data->dw09.dst_mocs, data->dw09.src_mocs);
> +	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
> +		igt_info(" dw09: [%08x] mocs <dst: 0x%x, src: 0x%x>\n",
> +			 cmd[9], data->dw09.x2.dst_mocs,
> +			 data->dw09.x2.src_mocs);
> +	} else {
> +		igt_info(" dw09: [%08x] mocs <dst: 0x%x, src: 0x%x>\n",
> +			 cmd[9], data->dw09.gen12.dst_mocs,
> +			 data->dw09.gen12.src_mocs);
> +	}
>  }
>  
>  static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
> @@ -1923,6 +1972,7 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
>  	uint32_t width, height, width_max, height_max, remain;
>  	uint32_t bbe = MI_BATCH_BUFFER_END;
>  	uint32_t *bb;
> +	uint32_t devid = intel_get_drm_devid(fd);
>  
>  	if (mem->mode == MODE_BYTE) {
>  		data.dw01.byte_copy.width = -1;
> @@ -1945,19 +1995,29 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
>  	width = mem->src.width;
>  	height = mem->dst.height;
>  
> -	data.dw00.client = 0x2;
> -	data.dw00.opcode = 0x5a;
> -	data.dw00.length = 8;
> -	data.dw00.mode = mem->mode;
> -	data.dw00.copy_type = mem->copy_type;
> +	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
> +		data.dw00.x2.client = 0x2;
> +		data.dw00.x2.opcode = 0x5a;
> +		data.dw00.x2.length = 8;
> +		data.dw00.x2.mode = mem->mode;
> +		data.dw00.x2.copy_type = mem->copy_type;
> +		data.dw09.x2.src_mocs = mem->src.mocs_index;
> +		data.dw09.x2.dst_mocs = mem->dst.mocs_index;

s/x2/xe2/

> +	} else {
> +		data.dw00.gen12.client = 0x2;
> +		data.dw00.gen12.opcode = 0x5a;
> +		data.dw00.gen12.length = 8;
> +		data.dw00.gen12.mode = mem->mode;
> +		data.dw00.gen12.copy_type = mem->copy_type;
> +		data.dw09.gen12.src_mocs = mem->src.mocs_index;
> +		data.dw09.gen12.dst_mocs = mem->dst.mocs_index;

s/gen12/xe/

Rest looks good, so with above nits addressed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +	}
>  
>  	data.dw02.height = height - 1;
>  	data.dw05.src_address_lo = src_offset;
>  	data.dw06.src_address_hi = src_offset >> 32;
>  	data.dw07.dst_address_lo = dst_offset;
>  	data.dw08.dst_address_hi = dst_offset >> 32;
> -	data.dw09.src_mocs = mem->src.mocs_index;
> -	data.dw09.dst_mocs = mem->dst.mocs_index;
>  
>  	/* For matrix we don't iterate */
>  	if (mem->copy_type == TYPE_MATRIX) {
> @@ -1983,7 +2043,7 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
>  
>  		if (mem->print_bb) {
>  			igt_info("[MEM COPY]\n");
> -			dump_bb_mem_copy_cmd(&data);
> +			dump_bb_mem_copy_cmd(fd, &data);
>  		}
>  	} else {
>  		remain = mem->src.width;
> @@ -2017,7 +2077,7 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
>  
>  			if (mem->print_bb) {
>  				igt_info("[MEM COPY]\n");
> -				dump_bb_mem_copy_cmd(&data);
> +				dump_bb_mem_copy_cmd(fd, &data);
>  			}
>  		}
>  	}
> -- 
> 2.34.1
> 
