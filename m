Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D813C5320E
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 08:19:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF37810E0AD;
	Tue, 27 Aug 2024 08:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K/8IlUxI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45EA510E0AD
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 08:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724746792; x=1756282792;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cca6CNlMTvv0iAUKZPG9vUs0JecgOdoH4okr5m6pqG4=;
 b=K/8IlUxIQUPWE8Zc3we+x+fqH6F4VLdoJB5D3rHQwcJX/JieswjcaPbM
 daRKWVm0B+Gpt3xV3Frf+Ud8qHyk983v5a0MRiFi7ZpKc3QZvCpUCy/yb
 gGEr4sLadHti6JKdlnfpfy3nz1O7PPFw9FUkS7gakgaGyCLJ+1ztBLjo1
 g2bJ0/3R7CuzdViqN77YLvymYOYqIcH4FS++h63AhlDy+PZzyvp93ZnV4
 /myC7PX6i5Mbfxa5mwyU4js1vJfJ9WETkOGeQ9YpTRrKsk9M1ddpeRcej
 4znBN67/fFRCMI5KZObGfBHzu/MRweTdNFHvdv4hIwxrE6YYwCaPFsz94 w==;
X-CSE-ConnectionGUID: uihzaya3RV+ro6jMHFORcQ==
X-CSE-MsgGUID: lHf4tYzPSM6WKfrt6Ldqzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="33869838"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="33869838"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 01:19:52 -0700
X-CSE-ConnectionGUID: 4Ynf3IZ5TvSVZZ7j7SMQqw==
X-CSE-MsgGUID: AM0QIEQISPqP48IsxHtZkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="62462255"
Received: from lbogdanm-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.187])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 01:19:48 -0700
Date: Tue, 27 Aug 2024 10:19:44 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH i-g-t v4 09/17] tests/xe_exec_sip: Add
 sanity-after-timeout test
Message-ID: <20240827081944.hichpdxh6lh2s26d@zkempczy-mobl2>
References: <20240823182222.305965-1-christoph.manszewski@intel.com>
 <20240823182222.305965-10-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823182222.305965-10-christoph.manszewski@intel.com>
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

On Fri, Aug 23, 2024 at 08:22:14PM +0200, Christoph Manszewski wrote:
> Add a subtest that checks if we are able to submit workloads after gpu
> was reset due to hung job.
> 
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  tests/intel/xe_exec_sip.c | 39 ++++++++++++++++++++++++++++++++-------
>  1 file changed, 32 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
> index ea1770cd6..5d57d2c78 100644
> --- a/tests/intel/xe_exec_sip.c
> +++ b/tests/intel/xe_exec_sip.c
> @@ -31,6 +31,9 @@
>  
>  #define SHADER_CANARY 0x01010101
>  
> +#define SHADER_HANG 0
> +#define SHADER_WRITE 1
> +

Please introduce a new enum for this, it's more readable.

>  static struct intel_buf *
>  create_fill_buf(int fd, int width, int height, uint8_t color)
>  {
> @@ -50,21 +53,32 @@ create_fill_buf(int fd, int width, int height, uint8_t color)
>  	return buf;
>  }
>  
> -static struct gpgpu_shader *get_shader(int fd)
> +static struct gpgpu_shader *get_shader(int fd, const int shadertype)
>  {
>  	static struct gpgpu_shader *shader;
>  
>  	shader = gpgpu_shader_create(fd);
>  	gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
> +
> +	switch (shadertype) {
> +	case SHADER_HANG:
> +		gpgpu_shader__label(shader, 0);
> +		gpgpu_shader__nop(shader);
> +		gpgpu_shader__jump(shader, 0);
> +		break;
> +	case SHADER_WRITE:
> +		break;
> +	}
> +
>  	gpgpu_shader__eot(shader);
>  	return shader;
>  }
>  
> -static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, unsigned int threads,
> -			     unsigned int width, unsigned int height)
> +static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, const int shadertype,
> +			     unsigned int threads, unsigned int width, unsigned int height)
>  {
>  	struct intel_buf *buf = create_fill_buf(fd, width, height, COLOR_C4);
> -	struct gpgpu_shader *shader = get_shader(fd);
> +	struct gpgpu_shader *shader = get_shader(fd, shadertype);
>  
>  	gpgpu_shader_exec(ibb, buf, 1, threads, shader, NULL, 0, 0);
>  	gpgpu_shader_destroy(shader);
> @@ -125,8 +139,10 @@ xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
>   * SUBTEST: sanity
>   * Description: check basic shader with write operation
>   *
> + * SUBTEST: sanity-after-timeout
> + * Description: check basic shader execution after job timeout
>   */
> -static void test_sip(struct drm_xe_engine_class_instance *eci, uint32_t flags)
> +static void test_sip(int shader, struct drm_xe_engine_class_instance *eci, uint32_t flags)
>  {
>  	unsigned int threads = 512;
>  	unsigned int height = max_t(threads, HEIGHT, threads * 2);
> @@ -153,7 +169,7 @@ static void test_sip(struct drm_xe_engine_class_instance *eci, uint32_t flags)
>  	ibb = intel_bb_create_with_context(fd, exec_queue_id, vm_id, NULL, 4096);
>  
>  	igt_nsec_elapsed(&ts);
> -	handle = gpgpu_shader(fd, ibb, threads, width, height);
> +	handle = gpgpu_shader(fd, ibb, shader, threads, width, height);
>  
>  	intel_bb_sync(ibb);
>  	igt_assert_lt_u64(igt_nsec_elapsed(&ts), timeout);
> @@ -186,7 +202,16 @@ igt_main
>  		fd = drm_open_driver(DRIVER_XE);
>  
>  	test_render_and_compute("sanity", fd, eci)
> -		test_sip(eci, 0);
> +		test_sip(SHADER_WRITE, eci, 0);
> +
> +	test_render_and_compute("sanity-after-timeout", fd, eci) {
> +		test_sip(SHADER_HANG, eci, 0);

It seems job will hang, but what will happen if it will be submitted
on LR mode? Doesn't it stuck here forever? Do we support eudebugger
on !LR mode?

--
Zbigniew

> +
> +		xe_for_each_engine(fd, eci)
> +			if (eci->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
> +			    eci->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
> +				test_sip(SHADER_WRITE, eci, 0);
> +	}
>  
>  	igt_fixture
>  		drm_close_driver(fd);
> -- 
> 2.34.1
> 
