Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239F6FD5304
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 07:00:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF26810E13A;
	Fri, 27 Feb 2026 07:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CCk6koIy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5391610E13A
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 07:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772175626; x=1803711626;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FKSMJUYigPonzNynkkURbkvYuczOP6QBgo+AZl+C0RU=;
 b=CCk6koIyb+r6cVNsFkf/q7+g9A3T5Gg6WvU8sBlVL8ur/i4v3iPqMmbh
 TPCQJhJfIIBARcCPtudNKyxsTMb2NigXyVQS+uvcuyAwrHVZAZGZXubyO
 zEwVHgBZ6YHb24w9eARvDGjNrlBuv/yFSzD5deidiV0D6C6L+gj/1fDBb
 Uf8ZKs1U1Q6SpxT5gQI+LMubgaRHRX/O1QcZ0JJKwkDeoCqTb5PEQY0dp
 JAhio4NqLsHhTilpkkSfLZcYoEdCwrWA/S22R3C2A0J9XGD2TPF/A7+ym
 Rt0D2cG5duc4ff+V3/kqRRaJ8G6MCy9kQ1c1ByjGlgKw1mewW7IT2h9Z3 g==;
X-CSE-ConnectionGUID: howwRkZ4TzegQRgviM9/WQ==
X-CSE-MsgGUID: FUKL4Y2cT1e9uzSyc9muaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73360198"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="73360198"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 23:00:26 -0800
X-CSE-ConnectionGUID: LhwXXjDrRrWL9KB6oluFmw==
X-CSE-MsgGUID: CbEzFalBT6ObUKY2fEaV5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="214697738"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.84])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 23:00:25 -0800
Date: Fri, 27 Feb 2026 08:00:22 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 4/5] scripts/generate_iga64_codes: Add support for
 xe3p and xe3
Message-ID: <drllq6ildilxq6abmgy6yaemssgywluictyiap6uxvrxe2b6mp@73pidwkar3xe>
References: <20260224082800.1581935-1-priyanka.dandamudi@intel.com>
 <20260224082800.1581935-5-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260224082800.1581935-5-priyanka.dandamudi@intel.com>
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

On Tue, Feb 24, 2026 at 01:57:59PM +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Add support for xe3p and xe3 for the existing tests and generate dynamic iga64
> codes for xe3p and xe3 for those tests.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  lib/gpgpu_fill.c.gen.iga64_codes.c            |   2 +-
>  lib/gpgpu_shader.c.gen.iga64_codes.c          | 196 +++++++++++++++++-
>  scripts/generate_iga64_codes                  |   2 +-
>  .../xe_eudebug_online.c.gen.iga64_codes.c     |  45 +++-
>  4 files changed, 241 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/gpgpu_fill.c.gen.iga64_codes.c b/lib/gpgpu_fill.c.gen.iga64_codes.c
> index 15ffb6f2d8..400ff7b18a 100644
> --- a/lib/gpgpu_fill.c.gen.iga64_codes.c
> +++ b/lib/gpgpu_fill.c.gen.iga64_codes.c
> @@ -3,7 +3,7 @@
>  
>  #include "gpgpu_shader.h"
>  
> -#define MD5_SUM_IGA64_ASMS b785dce133b8fcf480cd65b219b3e008
> +#define MD5_SUM_IGA64_ASMS ebaa9e23021939d874c576c7cea482bf
>  
>  struct iga64_template const iga64_code_gpgpu_fill[] = {
>  	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> diff --git a/lib/gpgpu_shader.c.gen.iga64_codes.c b/lib/gpgpu_shader.c.gen.iga64_codes.c
> index ee45f8263d..59172cdfd1 100644
> --- a/lib/gpgpu_shader.c.gen.iga64_codes.c
> +++ b/lib/gpgpu_shader.c.gen.iga64_codes.c
> @@ -3,7 +3,7 @@
>  
>  #include "gpgpu_shader.h"
>  
> -#define MD5_SUM_IGA64_ASMS b3ca58d01d637034cf62ec574656a2f0
> +#define MD5_SUM_IGA64_ASMS 4311fff3bece03802f3220b7d239c33b
>  
>  struct iga64_template const iga64_code_read_a64_d32[] = {
>  	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
> @@ -44,6 +44,40 @@ struct iga64_template const iga64_code_write_a64_d32[] = {
>  };
>  
>  struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
> +	{ .gen_ver = 3500, .size = 60, .code = (const uint32_t []) {
> +		0x80000966, 0x80018220, 0x02008000, 0x00008000,
> +		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
> +		0x80000961, 0x1e050330, 0x00000104, 0x00000000,
> +		0x80000040, 0x1e258220, 0x06000124, 0xffffffff,
> +		0x80000040, 0x1e358220, 0x06000134, 0xffffffff,
> +		0x80000040, 0x1e458220, 0x06000124, 0xffffffff,
> +		0x80000061, 0x1e554220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e754220, 0x00000000, 0x00000003,
> +		0x80032033, 0x1f000002, 0xf0021e0c, 0x80030000,
> +		0x80000061, 0x30014220, 0x00000000, 0x00000000,
> +		0x80008070, 0x00018220, 0x22001f04, 0xc0ded002,
> +		0x84000965, 0x80118220, 0x02008010, 0xc0ded003,
> +		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 3000, .size = 60, .code = (const uint32_t []) {
> +		0x80000966, 0x80018220, 0x02008000, 0x00008000,
> +		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
> +		0x80000961, 0x1e050330, 0x00000104, 0x00000000,
> +		0x80000040, 0x1e258220, 0x06000124, 0xffffffff,
> +		0x80000040, 0x1e358220, 0x06000134, 0xffffffff,
> +		0x80000040, 0x1e458220, 0x06000124, 0xffffffff,
> +		0x80000061, 0x1e554220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e754220, 0x00000000, 0x00000003,
> +		0x80032031, 0x1f0c0000, 0xf0061e0c, 0x00800000,
> +		0x80000061, 0x30014220, 0x00000000, 0x00000000,
> +		0x80008070, 0x00018220, 0x22001f04, 0xc0ded002,
> +		0x84000965, 0x80118220, 0x02008010, 0xc0ded003,
> +		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
>  	{ .gen_ver = 2000, .size = 48, .code = (const uint32_t []) {
>  		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>  		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
> @@ -158,6 +192,42 @@ struct iga64_template const iga64_code_breakpoint_suppress[] = {
>  };
>  
>  struct iga64_template const iga64_code_write_on_exception[] = {
> +	{ .gen_ver = 3500, .size = 64, .code = (const uint32_t []) {
> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
> +		0x80000061, 0x04050330, 0x00000104, 0x00000000,
> +		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
> +		0x80000040, 0x04358220, 0x06000134, 0xffffffff,
> +		0x80000040, 0x04458220, 0x06000124, 0xffffffff,
> +		0x80000069, 0x04558220, 0x02000014, 0x00000002,
> +		0x80001940, 0x04558220, 0x02000454, 0xc0ded000,
> +		0x80000040, 0x04658220, 0x02000064, 0xc0ded001,
> +		0x80000061, 0x04754220, 0x00000000, 0x00000003,
> +		0x80000965, 0x03058220, 0x02008010, 0xc0ded003,
> +		0x80000961, 0x30014220, 0x00000000, 0x00000000,
> +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded004,
> +		0x84032033, 0x00000000, 0xf002040c, 0x8007050c,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 3000, .size = 64, .code = (const uint32_t []) {
> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
> +		0x80000061, 0x04050330, 0x00000104, 0x00000000,
> +		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
> +		0x80000040, 0x04358220, 0x06000134, 0xffffffff,
> +		0x80000040, 0x04458220, 0x06000124, 0xffffffff,
> +		0x80000069, 0x04558220, 0x02000014, 0x00000002,
> +		0x80001940, 0x04558220, 0x02000454, 0xc0ded000,
> +		0x80000040, 0x04658220, 0x02000064, 0xc0ded001,
> +		0x80000061, 0x04754220, 0x00000000, 0x00000003,
> +		0x80000965, 0x03058220, 0x02008010, 0xc0ded003,
> +		0x80000961, 0x30014220, 0x00000000, 0x00000000,
> +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded004,
> +		0x84032031, 0x00000000, 0xf00e040c, 0x0080050c,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
>  	{ .gen_ver = 2000, .size = 52, .code = (const uint32_t []) {
>  		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>  		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
> @@ -288,6 +358,36 @@ struct iga64_template const iga64_code_clear_exception[] = {
>  };
>  
>  struct iga64_template const iga64_code_media_block_write[] = {
> +	{ .gen_ver = 3500, .size = 52, .code = (const uint32_t []) {
> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
> +		0x80000061, 0x04050330, 0x00000104, 0x00000000,
> +		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
> +		0x80000040, 0x04358220, 0x06000134, 0xffffffff,
> +		0x80000040, 0x04458220, 0x06000124, 0xffffffff,
> +		0x80000069, 0x04558220, 0x02000014, 0x00000002,
> +		0x80001940, 0x04558220, 0x02000454, 0x00000000,
> +		0x80000040, 0x04658220, 0x02000064, 0xc0ded000,
> +		0x80000061, 0x04754220, 0x00000000, 0x00000003,
> +		0x80032033, 0x00000000, 0xf002040c, 0x8007050c,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 3000, .size = 52, .code = (const uint32_t []) {
> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
> +		0x80000061, 0x04050330, 0x00000104, 0x00000000,
> +		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
> +		0x80000040, 0x04358220, 0x06000134, 0xffffffff,
> +		0x80000040, 0x04458220, 0x06000124, 0xffffffff,
> +		0x80000069, 0x04558220, 0x02000014, 0x00000002,
> +		0x80001940, 0x04558220, 0x02000454, 0x00000000,
> +		0x80000040, 0x04658220, 0x02000064, 0xc0ded000,
> +		0x80000061, 0x04754220, 0x00000000, 0x00000003,
> +		0x80032031, 0x00000000, 0xf00e040c, 0x0080050c,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
>  	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
>  		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>  		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
> @@ -380,6 +480,36 @@ struct iga64_template const iga64_code_write_aip[] = {
>  };
>  
>  struct iga64_template const iga64_code_media_block_write_aip[] = {
> +	{ .gen_ver = 3500, .size = 52, .code = (const uint32_t []) {
> +		0x80000961, 0x05050220, 0x00008020, 0x00000000,
> +		0x80000961, 0x04050330, 0x00000104, 0x00000000,
> +		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
> +		0x80000040, 0x04358220, 0x06000134, 0xffffffff,
> +		0x80000040, 0x04458220, 0x06000124, 0xffffffff,
> +		0x80000069, 0x04558220, 0x02000014, 0x00000002,
> +		0x80001940, 0x04558220, 0x02000454, 0x00000000,
> +		0x80000040, 0x04658220, 0x02000064, 0xc0ded000,
> +		0x80000061, 0x04754220, 0x00000000, 0x00000003,
> +		0x80032033, 0x00000000, 0xf002040c, 0x8007050c,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 3000, .size = 52, .code = (const uint32_t []) {
> +		0x80000961, 0x05050220, 0x00008020, 0x00000000,
> +		0x80000961, 0x04050330, 0x00000104, 0x00000000,
> +		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
> +		0x80000040, 0x04358220, 0x06000134, 0xffffffff,
> +		0x80000040, 0x04458220, 0x06000124, 0xffffffff,
> +		0x80000069, 0x04558220, 0x02000014, 0x00000002,
> +		0x80001940, 0x04558220, 0x02000454, 0x00000000,
> +		0x80000040, 0x04658220, 0x02000064, 0xc0ded000,
> +		0x80000061, 0x04754220, 0x00000000, 0x00000003,
> +		0x80032031, 0x00000000, 0xf00e040c, 0x0080050c,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
>  	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
>  		0x80000961, 0x05050220, 0x00008020, 0x00000000,
>  		0x800c0961, 0x04054220, 0x00000000, 0x00000000,
> @@ -449,6 +579,42 @@ struct iga64_template const iga64_code_media_block_write_aip[] = {
>  };
>  
>  struct iga64_template const iga64_code_common_target_write[] = {
> +	{ .gen_ver = 3500, .size = 64, .code = (const uint32_t []) {
> +		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
> +		0x80000061, 0x1f154220, 0x00000000, 0xc0ded002,
> +		0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
> +		0x80000061, 0x1f354220, 0x00000000, 0xc0ded004,
> +		0x80000061, 0x1e050330, 0x00000104, 0x00000000,
> +		0x80000040, 0x1e258220, 0x06000124, 0xffffffff,
> +		0x80000040, 0x1e358220, 0x06000134, 0xffffffff,
> +		0x80000040, 0x1e458220, 0x06000124, 0xffffffff,
> +		0x80000061, 0x1e554220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
> +		0x80032033, 0x00000000, 0xf0021e0c, 0x80071f0c,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 3000, .size = 64, .code = (const uint32_t []) {
> +		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
> +		0x80000061, 0x1f154220, 0x00000000, 0xc0ded002,
> +		0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
> +		0x80000061, 0x1f354220, 0x00000000, 0xc0ded004,
> +		0x80000061, 0x1e050330, 0x00000104, 0x00000000,
> +		0x80000040, 0x1e258220, 0x06000124, 0xffffffff,
> +		0x80000040, 0x1e358220, 0x06000134, 0xffffffff,
> +		0x80000040, 0x1e458220, 0x06000124, 0xffffffff,
> +		0x80000061, 0x1e554220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
> +		0x80032031, 0x00000000, 0xf00e1e0c, 0x00801f0c,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
>  	{ .gen_ver = 2000, .size = 52, .code = (const uint32_t []) {
>  		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
>  		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
> @@ -578,6 +744,34 @@ struct iga64_template const iga64_code_clear_r40[] = {
>  };
>  
>  struct iga64_template const iga64_code_jump_dw_neq[] = {
> +	{ .gen_ver = 3500, .size = 48, .code = (const uint32_t []) {
> +		0x80000061, 0x1e050330, 0x00000104, 0x00000000,
> +		0x80000040, 0x1e258220, 0x06000124, 0xffffffff,
> +		0x80000040, 0x1e358220, 0x06000134, 0xffffffff,
> +		0x80000040, 0x1e458220, 0x06000124, 0xffffffff,
> +		0x80000061, 0x1e554220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e754220, 0x00000000, 0x00000003,
> +		0x80032033, 0x1f000002, 0xf0021e0c, 0x80030000,
> +		0x80000061, 0x30014220, 0x00000000, 0x00000000,
> +		0x80008070, 0x00018220, 0x22001f04, 0xc0ded001,
> +		0x84000020, 0x00004000, 0x00000000, 0xffffff60,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 3000, .size = 48, .code = (const uint32_t []) {
> +		0x80000061, 0x1e050330, 0x00000104, 0x00000000,
> +		0x80000040, 0x1e258220, 0x06000124, 0xffffffff,
> +		0x80000040, 0x1e358220, 0x06000134, 0xffffffff,
> +		0x80000040, 0x1e458220, 0x06000124, 0xffffffff,
> +		0x80000061, 0x1e554220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e754220, 0x00000000, 0x00000003,
> +		0x80032031, 0x1f0c0000, 0xf0061e0c, 0x00800000,
> +		0x80000061, 0x30014220, 0x00000000, 0x00000000,
> +		0x80008070, 0x00018220, 0x22001f04, 0xc0ded001,
> +		0x84000020, 0x00004000, 0x00000000, 0xffffff60,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
>  	{ .gen_ver = 2000, .size = 36, .code = (const uint32_t []) {
>  		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
>  		0x80000061, 0x1e554220, 0x00000000, 0x00000000,
> diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
> index d196c7a016..24271ecd76 100755
> --- a/scripts/generate_iga64_codes
> +++ b/scripts/generate_iga64_codes
> @@ -7,7 +7,7 @@
>  # to minimal GPU generation supported by platform multiplied by 100 and platform
>  # is one of platforms supported by -p switch of iga64.
>  # Must be in decreasing order, the last one must have gen100 equal 0.
> -GEN_VERSIONS="2000:2 1270:12p71 1260:12p72 1250:12p5 0:12p1"
> +GEN_VERSIONS="3500:3px 3000:3 2000:2 1270:12p71 1260:12p72 1250:12p5 0:12p1"
>  
>  # Magic values to encode asm template args, must be the the same as in gpgpu_shader.c.
>  IGA64_ARG0=0xc0ded000
> diff --git a/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c b/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
> index 32009e40fe..333281a39a 100644
> --- a/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
> +++ b/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
> @@ -3,9 +3,39 @@
>  
>  #include "gpgpu_shader.h"
>  
> -#define MD5_SUM_IGA64_ASMS d8acd22fb8afb78633ac79a0ca42d8da
> +#define MD5_SUM_IGA64_ASMS e184c9b1ac9287f33544ad0737b2831a
>  
>  struct iga64_template const iga64_code_store_sr0_0[] = {
> +	{ .gen_ver = 3500, .size = 52, .code = (const uint32_t []) {
> +		0x00000961, 0x05050220, 0x00007000, 0x00000000,
> +		0x80000961, 0x04050330, 0x00000104, 0x00000000,
> +		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
> +		0x80000040, 0x04358220, 0x06000134, 0xffffffff,
> +		0x80000040, 0x04458220, 0x06000124, 0xffffffff,
> +		0x80000069, 0x04558220, 0x02000014, 0x00000002,
> +		0x80001940, 0x04558220, 0x02000454, 0x00000000,
> +		0x80000040, 0x04658220, 0x02000064, 0x00000000,
> +		0x80000061, 0x04754220, 0x00000000, 0x00000003,
> +		0x00032033, 0x00000000, 0xf002040c, 0x8007050c,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 3000, .size = 52, .code = (const uint32_t []) {
> +		0x00000961, 0x05050220, 0x00007000, 0x00000000,
> +		0x80000961, 0x04050330, 0x00000104, 0x00000000,
> +		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
> +		0x80000040, 0x04358220, 0x06000134, 0xffffffff,
> +		0x80000040, 0x04458220, 0x06000124, 0xffffffff,
> +		0x80000069, 0x04558220, 0x02000014, 0x00000002,
> +		0x80001940, 0x04558220, 0x02000454, 0x00000000,
> +		0x80000040, 0x04658220, 0x02000064, 0x00000000,
> +		0x80000061, 0x04754220, 0x00000000, 0x00000003,
> +		0x00032031, 0x00000000, 0xf00e040c, 0x0080050c,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
>  	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
>  		0x00000961, 0x05050220, 0x00007000, 0x00000000,
>  		0x800c0961, 0x04054220, 0x00000000, 0x00000000,
> @@ -24,6 +54,19 @@ struct iga64_template const iga64_code_store_sr0_0[] = {
>  };
>  
>  struct iga64_template const iga64_code_pagefault_one_of_many[] = {
> +	{ .gen_ver = 3500, .size = 44, .code = (const uint32_t []) {
> +		0x000c0061, 0x1e054330, 0x00000000, 0x00000000,
> +		0x00000061, 0x1e054330, 0x00000123, 0x45678000,
> +		0x00000061, 0x1e254220, 0x00000000, 0x0000003f,
> +		0x00000061, 0x1e454220, 0x00000000, 0x0000003f,
> +		0x00000061, 0x1e754220, 0x00000000, 0x00000003,
> +		0x0000005b, 0x14060220, 0x02020014, 0x01440064,
> +		0x00001970, 0x00018220, 0x12001404, 0xc0ded000,
> +		0x04032031, 0x1f0c0000, 0xf8061e0c, 0x00a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
>  	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>  		0x000c0061, 0x1e054330, 0x00000000, 0x00000000,
>  		0x00000061, 0x1e054330, 0x00000123, 0x45678000,
> -- 
> 2.43.0
> 
