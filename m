Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BA7606A320
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 13:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t2YM4ULO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A2C10E8F0;
	Fri, 20 Nov 2026 13:35:48 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEAA10E8F0
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2026 13:34:45 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-3b155f50c24so829412a91.3
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2026 05:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795181685; x=1795786485; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=h6Ea4a0UjPBZbObDoTd0o6TTCj4pFhia1R2lSf/EsUo=;
 b=t2YM4ULOh8OP5Vwg5l2WycXullrMqC6oK/RCccvXKThj+81xjbW6A0RV0LdhZH7G2v
 KMYWgrHmmMyCzOS7TMYM7N9uFJu2xbSIM61Bo2H4cJEEu4PWtOB0JZLskHgJP2siO9e0
 HtCxtKiTugOkaxP6pNXtjJ4JnH22zGJeAUg7CytTCq4bQNP0awZY6n1noknHUoC6BKka
 ROu6bK4aWRpjJzsXeFBsiyUVT4FfCZ6jWbDzC+GikTitwE83bwl9OGSZND5mlt8pmvgu
 Fi2fWHT1TIu6p8oqStTm87dVeLs0Ryzo8G07n6pyW/9WmhrqwkAEkugzHlygn0CNjP+i
 w+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795181685; x=1795786485;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=h6Ea4a0UjPBZbObDoTd0o6TTCj4pFhia1R2lSf/EsUo=;
 b=CM/iv3MoLBY/ycOsE+35TiEYZEd03HKMxMoFH9xRhRFHSJ6GHRniBeEnnod3wmjyPR
 zcVnrDaE4YrMbgJCJLM74IrD3KVY0kFVS2AuciIZ739gTtrrrFH4nIbVDPqvI1uA8luu
 YbTs5ErXa+3MKhcE+pC6t9DgUNuesbmyZbzV8OPxt0aZWrv+DNATrs0j4T8cQ016qYOx
 QP8AsiqrvptMfk1s8kwZwoaplkrV4OOOAbcTLfk5BseaMEkTCI/wkJVxdBWsmadTVZFt
 F799qV6ixrvt4TRcSF2YvNo8x9yi96xerLjZzbKKJePUHIQNesF4VRPsOqDyfmJcj2dN
 p+iw==
X-Forwarded-Encrypted: i=1;
 AL+hErG9A3mOy/ugumeeaOEY7UHplaiApVsSHBtvL7wrswrtXTzAeZALwAylYPuPJ6NeYNfdXCyF6+yG@lists.freedesktop.org
X-Gm-Message-State: APuU4Z8QraXCZMMOJgdGRRNU9MQGG0uErMy2hk/00wyc0FNalATy/TrE
 RGT4Wys8Xb4b1Hqbu/0pKPHLXNtvMITZZejhZjoWyviEPtehfqM9gyuZ
X-Gm-Gg: AZFdTZfuuj7W0oXjbr+hqSguVc6+w1+DcTmDW1iq2wHY0P3VOQ7BRSqrlWRj4UqT7AS
 U4TBH+D8q8ERvKqpRBHaRH4tanjcHjLsAdVf6hOkqbVd3p/9sLvhpFS4+LHAFFEYwwREyBLK7Ur
 FwPek6AzhocgPNnrsXCdb31iBoFYOw2wO4C/mONF9SBpOBt65eOIXbcBJxEEPhgHQuMapBrgXYh
 HpPYyxTcZVibO1rmcalqYRSLaN1TAfGW4bOt5d9mv2/RrNfTqnl3B9F71flPVkuv49BrWUaD13V
 09gHVhRluKDZALVr2eyp9N06AokGbQq9ZocSMMGwfsyuO+SMaLc9mKq0AR2ixkoB2dja3EBFI4L
 VpAKEk7tkmWBvU6+fTZcu0oCUuZmgoViv6G4EbS4OLU8RijkRtjIJ9m7WPzzq7mn7r6rrCXRSIP
 +4pPMaE3QDViVxz42HXSSCag96dtYmea/4LX75/oyF6ZCGSahwrjfddlKMSwWl8y44xVTKv93lB
 0feGL1YGtqU8Oi5ruGj1LDDD7W+uBvl+O48J+ZmjatqbBYtCIx60RE/2A733wgQKX6x8nRbMa2z
 AQx38Tn7co3LcSQkckwsuX89mbAO82eW9DR3WCnnD7rqsM3im8SM7VLzYtqvOhxM+Q+TQswqs/I
 7
X-Received: by 2002:a17:90b:1d03:b0:3b1:96fe:f5d2 with SMTP id
 98e67ed59e1d1-3b41c9bacc7mr3192379a91.65.1795181684585; 
 Fri, 20 Nov 2026 05:34:44 -0800 (PST)
Received: from [134.134.139.73] ([134.134.139.73])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b405d96bd3sm7622615a91.12.2026.11.20.05.34.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2026 05:34:44 -0800 (PST)
Message-ID: <6c8f3b7f-1885-470a-8893-0cf60148f8f8@gmail.com>
Date: Fri, 20 Nov 2026 15:34:40 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/intel_bufops: Add support for Tile64 in
 software.
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
References: <20261118122619.206753-4-zbigniew.kempczynski@intel.com>
 <20261118122619.206753-5-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20261118122619.206753-5-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I did sometime ago write much of the same patch but it didn't go 
anywhere as it got overrun by other stuff, I had planned to enable 
tile64 framebuffers on xe. This look all good to me.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Ville had somewhere branch that was enabling tile64 framebuffers on i915 
as well as xe if it's interesting thing to try experiment with this.

/Juha-Pekka

On 18/11/2026 14.26, Zbigniew Kempczyński wrote:
> Bufops missed Tile64 so extend it and add this feature in software.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   lib/intel_bufops.c | 113 ++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 111 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index 1196069a500..2d013ca6547 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -127,12 +127,14 @@ struct buf_ops {
>   	bo_copy linear_to_yf;
>   	bo_copy linear_to_ys;
>   	bo_copy linear_to_tile4;
> +	bo_copy linear_to_tile64;
>   	bo_copy to_linear;
>   	bo_copy x_to_linear;
>   	bo_copy y_to_linear;
>   	bo_copy yf_to_linear;
>   	bo_copy ys_to_linear;
>   	bo_copy tile4_to_linear;
> +	bo_copy tile64_to_linear;
>   };
>   
>   static const char *tiling_str(uint32_t tiling)
> @@ -428,6 +430,78 @@ static void *tile4_ptr(void *ptr,
>   	return ptr + pos;
>   }
>   
> +/*
> + * (x,y) to memory location in tile-64 surface.
> + */
> +static void *tile64_ptr(void *ptr,
> +			unsigned int x, unsigned int y,
> +			unsigned int stride, unsigned int cpp)
> +{
> +	const int tile_size = 64 * 1024;
> +	int tile_width, tile_height;
> +	int tile_x, tile_y, _x, _y;
> +	int base, vaddr, pos;
> +
> +	switch (cpp) {
> +	case 1:
> +		tile_width = 256;
> +		tile_height = 256;
> +		break;
> +	case 2:
> +		tile_width = 256;
> +		tile_height = 128;
> +		break;
> +	case 4:
> +		tile_width = 128;
> +		tile_height = 128;
> +		break;
> +	case 8:
> +	default:
> +		tile_width = 128;
> +		tile_height = 64;
> +		break;
> +	}
> +
> +	tile_x = x / tile_width;
> +	tile_y = y / tile_height;
> +	_x = x % tile_width;
> +	_y = y % tile_height;
> +
> +	switch (cpp) {
> +	case 1:
> +		vaddr = (_x & 0xf) | ((_y & 0x3) << 4) |
> +			((_x & 0x30) << 2) | ((_y & 0x4) << 6) |
> +			((_x & 0x40) << 3) | ((_y & 0x18) << 7) |
> +			((_x & 0x80) << 5) | ((_y & 0xe0) << 8);
> +		break;
> +	case 2:
> +		vaddr = ((_x & 0x7) << 1) | ((_y & 0x3) << 4) |
> +			((_x & 0x18) << 3) | ((_y & 0x4) << 6) |
> +			((_x & 0x20) << 4) | ((_y & 0x18) << 7) |
> +			((_x & 0xc0) << 6) | ((_y & 0x60) << 9);
> +		break;
> +	case 4:
> +		vaddr = ((_x & 0x3) << 2) | ((_y & 0x3) << 4) |
> +			((_x & 0xc) << 4) | ((_y & 0x4) << 6) |
> +			((_x & 0x10) << 5) | ((_y & 0x18) << 7) |
> +			((_x & 0x60) << 7) | ((_y & 0x60) << 9);
> +		break;
> +	case 8:
> +	default:
> +		vaddr = ((_x & 0x1) << 3) | ((_y & 0x3) << 4) |
> +			((_x & 0x6) << 5) | ((_y & 0x4) << 6) |
> +			((_x & 0x8) << 6) | ((_y & 0x18) << 7) |
> +			((_x & 0x70) << 8) | ((_y & 0x20) << 10);
> +		break;
> +	}
> +
> +	/* memory location */
> +	base = tile_y * (stride * tile_height) + tile_x * tile_size;
> +	pos = base + vaddr;
> +	igt_assert((pos & (cpp - 1)) == 0);
> +
> +	return ptr + pos;
> +}
>   
>   static void *yf_ptr(void *ptr,
>   		    unsigned int x, unsigned int y,
> @@ -489,6 +563,10 @@ static tile_fn __get_tile_fn_ptr(int fd, int tiling)
>   		break;
>   	case I915_TILING_4:
>   		fn = tile4_ptr;
> +		break;
> +	case I915_TILING_64:
> +		fn = tile64_ptr;
> +		break;
>   	case I915_TILING_Ys:
>   		/* To be implemented */
>   		break;
> @@ -739,6 +817,13 @@ static void copy_linear_to_tile4(struct buf_ops *bops, struct intel_buf *buf,
>   	__copy_linear_to(bops->fd, buf, linear, I915_TILING_4, 0);
>   }
>   
> +static void copy_linear_to_tile64(struct buf_ops *bops, struct intel_buf *buf,
> +				  uint32_t *linear)
> +{
> +	DEBUGFN();
> +	__copy_linear_to(bops->fd, buf, linear, I915_TILING_64, 0);
> +}
> +
>   static void __copy_to_linear(int fd, struct intel_buf *buf,
>   			     uint32_t *linear, int tiling, uint32_t swizzle)
>   {
> @@ -806,6 +891,13 @@ static void copy_tile4_to_linear(struct buf_ops *bops, struct intel_buf *buf,
>   	__copy_to_linear(bops->fd, buf, linear, I915_TILING_4, 0);
>   }
>   
> +static void copy_tile64_to_linear(struct buf_ops *bops, struct intel_buf *buf,
> +				  uint32_t *linear)
> +{
> +	DEBUGFN();
> +	__copy_to_linear(bops->fd, buf, linear, I915_TILING_64, 0);
> +}
> +
>   static void copy_linear_to_gtt(struct buf_ops *bops, struct intel_buf *buf,
>   			       uint32_t *linear)
>   {
> @@ -898,6 +990,10 @@ void intel_buf_to_linear(struct buf_ops *bops, struct intel_buf *buf,
>   		igt_assert(bops->tile4_to_linear);
>   		bops->tile4_to_linear(bops, buf, linear);
>   		break;
> +	case I915_TILING_64:
> +		igt_assert(bops->tile64_to_linear);
> +		bops->tile64_to_linear(bops, buf, linear);
> +		break;
>   	}
>   
>   	if (buf->compression)
> @@ -934,6 +1030,10 @@ void linear_to_intel_buf(struct buf_ops *bops, struct intel_buf *buf,
>   		igt_assert(bops->linear_to_tile4);
>   		bops->linear_to_tile4(bops, buf, linear);
>   		break;
> +	case I915_TILING_64:
> +		igt_assert(bops->linear_to_tile64);
> +		bops->linear_to_tile64(bops, buf, linear);
> +		break;
>   	}
>   
>   	if (buf->compression)
> @@ -1628,12 +1728,14 @@ void intel_buf_draw_pattern(struct buf_ops *bops, struct intel_buf *buf,
>   	.linear_to_yf       = copy_linear_to_yf, \
>   	.linear_to_ys       = copy_linear_to_ys, \
>   	.linear_to_tile4    = copy_linear_to_tile4, \
> +	.linear_to_tile64   = copy_linear_to_tile64, \
>   	.to_linear          = copy_wc_to_linear, \
>   	.x_to_linear        = copy_gtt_to_linear, \
>   	.y_to_linear        = copy_gtt_to_linear, \
>   	.yf_to_linear       = copy_yf_to_linear, \
>   	.ys_to_linear       = copy_ys_to_linear, \
> -	.tile4_to_linear    = copy_tile4_to_linear
> +	.tile4_to_linear    = copy_tile4_to_linear, \
> +	.tile64_to_linear   = copy_tile64_to_linear
>   
>   static const struct buf_ops buf_ops_arr[] = {
>   	{
> @@ -1648,7 +1750,7 @@ static const struct buf_ops buf_ops_arr[] = {
>   
>   	{
>   		DEFAULT_BUFOPS(12, ~0U),
> -		.supported_tiles   = TILE_NONE | TILE_X | TILE_Y | TILE_Yf | TILE_Ys | TILE_4,
> +		.supported_tiles   = TILE_NONE | TILE_X | TILE_Y | TILE_Yf | TILE_Ys | TILE_4 | TILE_64,
>   	},
>   };
>   
> @@ -1837,6 +1939,9 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
>   	if (!is_tiling_supported(bops, I915_TILING_4))
>   		igt_debug("Tile4 format not supported\n");
>   
> +	if (!is_tiling_supported(bops, I915_TILING_64))
> +		igt_debug("Tile64 format not supported\n");
> +
>   	if (check_idempotency) {
>   		idempotency_selftest(bops, I915_TILING_X);
>   		idempotency_selftest(bops, I915_TILING_Y);
> @@ -2003,6 +2108,10 @@ bool buf_ops_set_software_tiling(struct buf_ops *bops,
>   		igt_debug("-> use SW on tiling 4\n");
>   		break;
>   
> +	case I915_TILING_64:
> +		igt_debug("-> use SW on tiling 64\n");
> +		break;
> +
>   	case I915_TILING_Yf:
>   		igt_debug("-> use SW on tiling Yf\n");
>   		break;

