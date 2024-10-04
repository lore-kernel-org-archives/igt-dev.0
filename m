Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A80CFA774
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 12:26:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC92610E2A4;
	Fri,  4 Oct 2024 12:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QV4bNlgx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A8810E2A4
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 12:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728044788; x=1759580788;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=If+A2gvaLP/HdEZg41dFsg7Y+zL4288zsX4TMpOHeN8=;
 b=QV4bNlgxYNDDy4ZYx7JpYAnOL6Q/n2xEl08RwBdsO3rk2MOJiSBP2Loi
 A8d+nSP/Cvihuya4vP3QsDcq5SbtzFv7B0lu0HV1q+CLJ2n3+L+TJRHzb
 YIiKQF/MLkP4vp+JYgqN/BK8onwGT0E6+9M3tUiDH7/8nHtw6QQC7erpu
 nHIVuIRuohYftzObCG73TqhjaqFQPgzJ4ZjeMW1Jy43Z95OnGB8VNWYRV
 J7Pr1zLVlspQmeEJIXxiHYmcjmMIPcFaf15qoshC4fAcuNVqXeCIABQbu
 rprKo/euauOQZyWghp7rHCNKbbN0hTWrbNrSEdPFtKLh5k4lSYWNw7tJl Q==;
X-CSE-ConnectionGUID: SsDo8VTdRDqrNEKw9GdXQA==
X-CSE-MsgGUID: kigLANV9Q/6/g5uz6gvwwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="30141059"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="30141059"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 05:26:28 -0700
X-CSE-ConnectionGUID: s0WM2zQaQ+q7N/N03YvRWg==
X-CSE-MsgGUID: CFOxJK0yQMKLpbf+Egq6rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="112156669"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.245.140])
 ([10.245.245.140])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 05:26:27 -0700
Message-ID: <918790cf-f8e2-4ba5-93df-5e2191a9cdc2@intel.com>
Date: Fri, 4 Oct 2024 14:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/xe_exec_sip: Write on invalidinstr
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>
References: <20240925133003.41959-1-christoph.manszewski@intel.com>
 <20240925133003.41959-3-christoph.manszewski@intel.com>
 <20241002075000.ygzmnjgytw4z4lpz@zkempczy-mobl2>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241002075000.ygzmnjgytw4z4lpz@zkempczy-mobl2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Zbigniew,

On 2.10.2024 09:50, Zbigniew Kempczyński wrote:
> On Wed, Sep 25, 2024 at 03:30:03PM +0200, Christoph Manszewski wrote:
>> Currently we use 'gpgpu_shader__write_on_exception' only in a negative
>> way which causes the write not happening in the default (passing) case.
>> Change one of the usages to positive, to ensure the expected value has
>> been written.
>>
>> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
>> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> ---
>>   tests/intel/xe_exec_sip.c | 80 ++++++++++++++++++++++++---------------
>>   1 file changed, 49 insertions(+), 31 deletions(-)
>>
>> diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
>> index ed27d9c32..2294468c2 100644
>> --- a/tests/intel/xe_exec_sip.c
>> +++ b/tests/intel/xe_exec_sip.c
>> @@ -27,10 +27,12 @@
>>   #define WIDTH 64
>>   #define HEIGHT 64
>>   
>> -#define COLOR_C4 0xc4
>> +#define COLOR_C4 0xc4c4c4c4
>>   
>>   #define SHADER_CANARY 0x01010101
>> -#define SIP_CANARY 0x02020202
>> +#define SHADER_CANARY2 0x02020202
>> +#define SIP_CANARY 0x03030303
>> +#define SIP_CANARY2 0x04040404
>>   
>>   enum shader_type {
>>   	SHADER_HANG,
>> @@ -71,7 +73,7 @@ create_fill_buf(int fd, int width, int height, uint8_t color)
>>   static struct gpgpu_shader *get_shader(int fd, enum shader_type shader_type)
>>   {
>>   	static struct gpgpu_shader *shader;
>> -	uint32_t bad;
>> +	uint32_t expected_cr0_bit;
>>   
>>   	shader = gpgpu_shader_create(fd);
>>   	if (shader_type == SHADER_INV_INSTR_WALKER_ENABLED)
>> @@ -92,15 +94,17 @@ static struct gpgpu_shader *get_shader(int fd, enum shader_type shader_type)
>>   		__attribute__ ((fallthrough));
>>   	case SHADER_INV_INSTR_DISABLED:
>>   	case SHADER_INV_INSTR_WALKER_ENABLED:
>> -		bad = (shader_type == SHADER_INV_INSTR_DISABLED) ? ILLEGAL_OPCODE_ENABLE : 0;
>> -		gpgpu_shader__write_on_exception(shader, 1, 0, 0, ILLEGAL_OPCODE_ENABLE, bad);
>> +		expected_cr0_bit = shader_type == SHADER_INV_INSTR_DISABLED ?
>> +				   0 : ILLEGAL_OPCODE_ENABLE;
>> +		gpgpu_shader__write_on_exception(shader, SHADER_CANARY2, 1, 0,
>> +						 ILLEGAL_OPCODE_ENABLE, expected_cr0_bit);
>>   		gpgpu_shader__nop(shader);
>>   		gpgpu_shader__nop(shader);
>>   		/* modify second nop, set only opcode bits[6:0] */
>>   		shader->instr[gpgpu_shader_last_instr(shader)][0] = 0x7f;
>> -		/* SIP should clear exception bit */
>> -		bad = ILLEGAL_OPCODE_STATUS;
>> -		gpgpu_shader__write_on_exception(shader, 2, 0, 0, ILLEGAL_OPCODE_STATUS, bad);
>> +		/* SIP should clear exception bit, negative check */
>> +		gpgpu_shader__write_on_exception(shader, SHADER_CANARY2, 0, 0,
>> +						 ILLEGAL_OPCODE_STATUS, ILLEGAL_OPCODE_STATUS);
>>   		break;
>>   	}
>>   
>> @@ -120,7 +124,8 @@ static struct gpgpu_shader *get_sip(int fd, enum sip_type sip_type, unsigned int
>>   
>>   	switch (sip_type) {
>>   	case SIP_INV_INSTR:
>> -		gpgpu_shader__write_on_exception(sip, 1, 0, y_offset, ILLEGAL_OPCODE_STATUS, 0);
>> +		gpgpu_shader__write_on_exception(sip, SIP_CANARY2, 0, y_offset,
>> +						 ILLEGAL_OPCODE_STATUS, 0);
>>   		break;
>>   	default:
>>   		break;
>> @@ -135,7 +140,7 @@ static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, enum shader_type shad
>>   			     enum sip_type sip_type, unsigned int threads, unsigned int width,
>>   			     unsigned int height)
>>   {
>> -	struct intel_buf *buf = create_fill_buf(fd, width, height, COLOR_C4);
>> +	struct intel_buf *buf = create_fill_buf(fd, width, height, (uint8_t)COLOR_C4);
>>   	struct gpgpu_shader *sip = get_sip(fd, sip_type, height / 2);
>>   	struct gpgpu_shader *shader = get_shader(fd, shader_type);
>>   
>> @@ -148,59 +153,72 @@ static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, enum shader_type shad
>>   	return buf->handle;
>>   }
>>   
>> -static void check_fill_buf(uint8_t *ptr, const int width, const int x,
>> -			   const int y, const uint8_t color)
>> +static void check_fill_buf(uint32_t *ptr, const int dword_width, const int x, const int y,
>> +			   const uint32_t color)
>>   {
>> -	const uint8_t val = ptr[y * width + x];
>> +	const uint32_t val = ptr[y * dword_width + x];
>>   
>>   	igt_assert_f(val == color,
>> -		     "Expected 0x%02x, found 0x%02x at (%d,%d)\n",
>> +		     "Expected 0x%08x, found 0x%08x at (%d,%d)\n",
>>   		     color, val, x, y);
>>   }
>>   
>> -static void check_buf(int fd, uint32_t handle, int width, int height,
>> -		      enum shader_type shader_type, enum sip_type sip_type, uint8_t poison_c)
>> +static void check_buf(int fd, uint32_t handle, int width, int height, int thread_count_expected,
>> +		      enum shader_type shader_type, enum sip_type sip_type, uint32_t poison_c)
>>   {
>> +	int thread_count = 0, sip_count = 0, invalidinstr_count = 0;
>>   	unsigned int sz = ALIGN(width * height, 4096);
>> -	int thread_count = 0, sip_count = 0;
>> +	const uint32_t dword_width = width / 4;
>>   	uint32_t *ptr;
>>   	int i, j;
>>   
>>   	ptr = xe_bo_mmap_ext(fd, handle, sz, PROT_READ);
>>   
>> -	for (i = 0, j = 0; j < height / 2; ++j) {
>> -		if (ptr[j * width / 4] == SHADER_CANARY) {
>> +	for (i = 1, j = 0; j < height / 2; ++j) {
>> +		if (ptr[j * dword_width] == SHADER_CANARY)
>>   			++thread_count;
>> -			i = 4;
>> +		else
>> +			check_fill_buf(ptr, dword_width, 0, j, poison_c);
>> +
>> +		if (ptr[j * dword_width + 1] == SHADER_CANARY2) {
>> +			++invalidinstr_count;
>> +			++i;
>>   		}
>>   
>> -		for (; i < width; i++)
>> -			check_fill_buf((uint8_t *)ptr, width, i, j, poison_c);
>> +		for (; i < dword_width; i++)
>> +			check_fill_buf(ptr, dword_width, i, j, poison_c);
>>   
>> -		i = 0;
>> +		i = 1;
>>   	}
>>   
>>   	for (i = 0, j = height / 2; j < height; ++j) {
>> -		if (ptr[j * width / 4] == SIP_CANARY) {
>> +		if (ptr[j * dword_width] == SIP_CANARY) {
>>   			++sip_count;
>>   			i = 4;
>>   		}
>>   
>> -		for (; i < width; i++)
>> -			check_fill_buf((uint8_t *)ptr, width, i, j, poison_c);
>> +		for (; i < dword_width; i++)
>> +			check_fill_buf(ptr, dword_width, i, j, poison_c);
>>   
>>   		i = 0;
>>   	}
> 
> I thought to simplify above to avoid looping twice, especially you've
> added x position in write_on_exception(). This would require to write
> SHADER_CANARY on x == 0, SHADER_CANARY2 on x == 1, SHADER_SIP on x == 2
> and SHADER_SIP2 on x == 3. I think this would make code clearer, especially
> you wouldn't need to double the surface size. But this is not a blocker
> for this patch, especially it is doing what I asked for (proves
> write_on_exception() has the reflection in the memory).
> 
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Thanks, I'll allow myself to take that r-b and leave the check buf logic 
refactor for another day =)

Thanks,
Christoph

> 
> --
> Zbigniew
> 
>>   
>>   	igt_assert(thread_count);
>> -	if (shader_type == SHADER_INV_INSTR_DISABLED)
>> -		igt_assert(!sip_count);
>> -	else if (sip_type == SIP_INV_INSTR && shader_type != SHADER_INV_INSTR_DISABLED)
>> +
>> +	if (shader_type >= SHADER_INV_INSTR_DISABLED &&
>> +	    shader_type <= SHADER_INV_INSTR_WALKER_ENABLED)
>> +		igt_assert_f(thread_count == invalidinstr_count,
>> +			     "Thread and invalid instruction count mismatch, %d != %d\n",
>> +			     thread_count, invalidinstr_count);
>> +	else
>> +		igt_assert_eq(invalidinstr_count, 0);
>> +
>> +	if (sip_type == SIP_INV_INSTR && shader_type != SHADER_INV_INSTR_DISABLED)
>>   		igt_assert_f(thread_count == sip_count,
>>   			     "Thread and SIP count mismatch, %d != %d\n",
>>   			     thread_count, sip_count);
>>   	else
>> -		igt_assert(sip_count == 0);
>> +		igt_assert_eq(sip_count, 0);
>>   
>>   	munmap(ptr, sz);
>>   }
>> @@ -270,7 +288,7 @@ static void test_sip(enum shader_type shader_type, enum sip_type sip_type,
>>   	intel_bb_sync(ibb);
>>   	igt_assert_lt_u64(igt_nsec_elapsed(&ts), timeout);
>>   
>> -	check_buf(fd, handle, width, height, shader_type, sip_type, COLOR_C4);
>> +	check_buf(fd, handle, width, height, threads, shader_type, sip_type, COLOR_C4);
>>   
>>   	gem_close(fd, handle);
>>   	intel_bb_destroy(ibb);
>> -- 
>> 2.34.1
>>
