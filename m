Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11849CA0EF9
	for <igt-dev@archiver.kernel.org>; Fri, 30 Aug 2024 09:37:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C48B610EA40;
	Fri, 30 Aug 2024 09:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OCCXOL6H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A43E10EA3D
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Aug 2024 09:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725010662; x=1756546662;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oExI1tYnxXtmzKl3sZJRdgZYwfruYwloJgYV97w5rVw=;
 b=OCCXOL6HKTTS06Y4srisFWigtiahYl4/nBAuzL/XNH1MbrdzPEI5Xd3E
 nbg/kLhdc3nLIWy5zf9gv+UQ1cvC4NGxcMCVyHuyUmqEKCAVzlOWLprfE
 yJZUC/Uk/JUjuaV0/wmgxe26+8yOuAljM4CYRCOWTOLFXMfqYZiWGlkLn
 ATon05x9nnFJccPb5/v5GKj2IAgWgv2s/fSiOOsNRLkURJ+sT4lHuj/qp
 3HXON82KZf4s3cUq4ayZq88QBvbLJRSGpeBughUPGyieGDCrIz8aby1E6
 KWZyKhQS0k0SuU8hzge9N4y/ovg5z0e1PvSr/ydl7ZeyWLV+x5A2C6IeD g==;
X-CSE-ConnectionGUID: b7xnEvFqQuOH7Dp2jipU8A==
X-CSE-MsgGUID: 1J0P7dcxTJKCjBFzFLaqIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="35050664"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="35050664"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 02:37:41 -0700
X-CSE-ConnectionGUID: Kr3F7jHvRN6C1711DvQN4Q==
X-CSE-MsgGUID: MfBXmy+uTtK3Nba3jnizTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="94677453"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 02:37:38 -0700
Date: Fri, 30 Aug 2024 11:37:35 +0200
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
Subject: Re: [PATCH i-g-t v5 08/17] tests/xe_exec_sip: Add
 sanity-after-timeout test
Message-ID: <20240830093735.7ooqxgxou5uq2ymq@zkempczy-mobl2>
References: <20240829144547.105371-1-christoph.manszewski@intel.com>
 <20240829144547.105371-9-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240829144547.105371-9-christoph.manszewski@intel.com>
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

On Thu, Aug 29, 2024 at 04:45:38PM +0200, Christoph Manszewski wrote:
> Add a subtest that checks if we are able to submit workloads after gpu
> was reset due to hung job.
> 
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  tests/intel/xe_exec_sip.c | 41 ++++++++++++++++++++++++++++++++-------
>  1 file changed, 34 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
> index ea1770cd6..3b46f5618 100644
> --- a/tests/intel/xe_exec_sip.c
> +++ b/tests/intel/xe_exec_sip.c
> @@ -31,6 +31,11 @@
>  
>  #define SHADER_CANARY 0x01010101
>  
> +enum shader_type {
> +	SHADER_HANG,
> +	SHADER_WRITE,
> +};
> +
>  static struct intel_buf *
>  create_fill_buf(int fd, int width, int height, uint8_t color)
>  {
> @@ -50,21 +55,32 @@ create_fill_buf(int fd, int width, int height, uint8_t color)
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
> @@ -125,8 +141,10 @@ xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
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
> @@ -153,7 +171,7 @@ static void test_sip(struct drm_xe_engine_class_instance *eci, uint32_t flags)
>  	ibb = intel_bb_create_with_context(fd, exec_queue_id, vm_id, NULL, 4096);
>  
>  	igt_nsec_elapsed(&ts);
> -	handle = gpgpu_shader(fd, ibb, threads, width, height);
> +	handle = gpgpu_shader(fd, ibb, shader, threads, width, height);
>  
>  	intel_bb_sync(ibb);
>  	igt_assert_lt_u64(igt_nsec_elapsed(&ts), timeout);
> @@ -186,7 +204,16 @@ igt_main
>  		fd = drm_open_driver(DRIVER_XE);
>  
>  	test_render_and_compute("sanity", fd, eci)
> -		test_sip(eci, 0);
> +		test_sip(SHADER_WRITE, eci, 0);
> +
> +	test_render_and_compute("sanity-after-timeout", fd, eci) {
> +		test_sip(SHADER_HANG, eci, 0);
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

LGTM,

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

