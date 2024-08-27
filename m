Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BCEC5320E
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 09:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2876410E2C1;
	Tue, 27 Aug 2024 09:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IBbTMeHt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FCC10E2B1
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 09:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724749567; x=1756285567;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9pDlScHZMA+vw1XYFK1s2rv3n7II7bCH+nSVyygBbUg=;
 b=IBbTMeHtJSZCPkKwgDnpkYyvaidjwmIyYRHKxWn1wuG3qmwQCm2gE+MB
 maYC723OzqbURRT5eDijQ0KLImS5IXnYhB/F8yrLoQsViMZ63kwdOe+Mv
 aRcudxgQMDEjqlxZNM2g+dKDFAE+hebg7xa3ogwmqCuatIjDjRwosEk1P
 NWuDljCnPfOT1nda3ueujum6utiu2HjF0JCfRIxQKbKYYm5IgnphMWAwj
 JmArlcMiGnfjshefffIF9BefoWylE4+5nj7AEkcC8UVNwDzD+VzWVeE+C
 dvI4imflRHvEAvv/V4ix9bdfmfAwic7lDcd+nxVCNMS/N1gH0VJho/E9q g==;
X-CSE-ConnectionGUID: Fr/2rhXXS9uf41JWj7CJNg==
X-CSE-MsgGUID: ipy0I4/KSaqBgifvLQ6SOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="34587779"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="34587779"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 02:06:06 -0700
X-CSE-ConnectionGUID: 0p1pxd7VQPeca1MbiZCedw==
X-CSE-MsgGUID: UBZXX6D3R0WngV3JSu7IZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="66937377"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO [10.245.246.214])
 ([10.245.246.214])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 02:06:03 -0700
Message-ID: <05c902e4-bf24-4de5-b520-1a75f4468f71@intel.com>
Date: Tue, 27 Aug 2024 11:06:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 09/17] tests/xe_exec_sip: Add
 sanity-after-timeout test
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
References: <20240823182222.305965-1-christoph.manszewski@intel.com>
 <20240823182222.305965-10-christoph.manszewski@intel.com>
 <20240827081944.hichpdxh6lh2s26d@zkempczy-mobl2>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240827081944.hichpdxh6lh2s26d@zkempczy-mobl2>
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

On 27.08.2024 10:19, Zbigniew Kempczyński wrote:
> On Fri, Aug 23, 2024 at 08:22:14PM +0200, Christoph Manszewski wrote:
>> Add a subtest that checks if we are able to submit workloads after gpu
>> was reset due to hung job.
>>
>> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
>> ---
>>   tests/intel/xe_exec_sip.c | 39 ++++++++++++++++++++++++++++++++-------
>>   1 file changed, 32 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
>> index ea1770cd6..5d57d2c78 100644
>> --- a/tests/intel/xe_exec_sip.c
>> +++ b/tests/intel/xe_exec_sip.c
>> @@ -31,6 +31,9 @@
>>   
>>   #define SHADER_CANARY 0x01010101
>>   
>> +#define SHADER_HANG 0
>> +#define SHADER_WRITE 1
>> +
> 
> Please introduce a new enum for this, it's more readable.
> 
>>   static struct intel_buf *
>>   create_fill_buf(int fd, int width, int height, uint8_t color)
>>   {
>> @@ -50,21 +53,32 @@ create_fill_buf(int fd, int width, int height, uint8_t color)
>>   	return buf;
>>   }
>>   
>> -static struct gpgpu_shader *get_shader(int fd)
>> +static struct gpgpu_shader *get_shader(int fd, const int shadertype)
>>   {
>>   	static struct gpgpu_shader *shader;
>>   
>>   	shader = gpgpu_shader_create(fd);
>>   	gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
>> +
>> +	switch (shadertype) {
>> +	case SHADER_HANG:
>> +		gpgpu_shader__label(shader, 0);
>> +		gpgpu_shader__nop(shader);
>> +		gpgpu_shader__jump(shader, 0);
>> +		break;
>> +	case SHADER_WRITE:
>> +		break;
>> +	}
>> +
>>   	gpgpu_shader__eot(shader);
>>   	return shader;
>>   }
>>   
>> -static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, unsigned int threads,
>> -			     unsigned int width, unsigned int height)
>> +static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, const int shadertype,
>> +			     unsigned int threads, unsigned int width, unsigned int height)
>>   {
>>   	struct intel_buf *buf = create_fill_buf(fd, width, height, COLOR_C4);
>> -	struct gpgpu_shader *shader = get_shader(fd);
>> +	struct gpgpu_shader *shader = get_shader(fd, shadertype);
>>   
>>   	gpgpu_shader_exec(ibb, buf, 1, threads, shader, NULL, 0, 0);
>>   	gpgpu_shader_destroy(shader);
>> @@ -125,8 +139,10 @@ xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
>>    * SUBTEST: sanity
>>    * Description: check basic shader with write operation
>>    *
>> + * SUBTEST: sanity-after-timeout
>> + * Description: check basic shader execution after job timeout
>>    */
>> -static void test_sip(struct drm_xe_engine_class_instance *eci, uint32_t flags)
>> +static void test_sip(int shader, struct drm_xe_engine_class_instance *eci, uint32_t flags)
>>   {
>>   	unsigned int threads = 512;
>>   	unsigned int height = max_t(threads, HEIGHT, threads * 2);
>> @@ -153,7 +169,7 @@ static void test_sip(struct drm_xe_engine_class_instance *eci, uint32_t flags)
>>   	ibb = intel_bb_create_with_context(fd, exec_queue_id, vm_id, NULL, 4096);
>>   
>>   	igt_nsec_elapsed(&ts);
>> -	handle = gpgpu_shader(fd, ibb, threads, width, height);
>> +	handle = gpgpu_shader(fd, ibb, shader, threads, width, height);
>>   
>>   	intel_bb_sync(ibb);
>>   	igt_assert_lt_u64(igt_nsec_elapsed(&ts), timeout);
>> @@ -186,7 +202,16 @@ igt_main
>>   		fd = drm_open_driver(DRIVER_XE);
>>   
>>   	test_render_and_compute("sanity", fd, eci)
>> -		test_sip(eci, 0);
>> +		test_sip(SHADER_WRITE, eci, 0);
>> +
>> +	test_render_and_compute("sanity-after-timeout", fd, eci) {
>> +		test_sip(SHADER_HANG, eci, 0);
> 
> It seems job will hang, but what will happen if it will be submitted
> on LR mode? Doesn't it stuck here forever? Do we support eudebugger
> on !LR mode?

Sorry I missed this one. I haven't really thought what would happen in 
lr mode since the test simply doesn't use it. We no longer intend to 
support non-lr mode in eudebug, but that goes only for contexts marked 
as debugable through the 'DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG' exec 
queue property which also isn't set here. So this subtest shouldn't be 
affected by eudebug hence I left it in 'xe_exec_sip'.

Thanks,
Christoph


> 
> --
> Zbigniew
> 
>> +
>> +		xe_for_each_engine(fd, eci)
>> +			if (eci->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
>> +			    eci->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
>> +				test_sip(SHADER_WRITE, eci, 0);
>> +	}
>>   
>>   	igt_fixture
>>   		drm_close_driver(fd);
>> -- 
>> 2.34.1
>>
