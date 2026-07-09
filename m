Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEEBC44506
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 13:56:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBD210F5EB;
	Thu,  9 Jul 2026 13:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dY/niLS6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A93310F5E3
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 13:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783605367; x=1815141367;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=23ccRWYdVrIoYJZ3qqFm4cLuJsyCswjsTjaeetKDYd8=;
 b=dY/niLS6TxDQF/Et5Td4xtJWvgyOmCJ296BY5Ov8Q9NwRD0FVivBqQmX
 Cx91CBlm2Fwz044/1hF4WHJCF99qjrWWehlQ/HhW7M17mAdEJNtZONYnS
 vvccyPENXcUQB9lCh9d67kXuRLv08jkPbmAv0uWoo1J4aGEAfc2DjCNuf
 iPrn5F9EN28+4fKHup/3Llt1qALGOfCN80BBto/yz0hpXKUmZRE3jgoWB
 0mGExHN0m9WlknVlF/oYuAm91KENnuKiswt3sBZNvRYogDM+EXfvrnc3J
 VIwTxP60FamN0wAz5XZ+svK19Ro3swYx82P40PjE9DQlziL275bjTKoZr A==;
X-CSE-ConnectionGUID: /8ppuWMYTvmkdkLAejcqVg==
X-CSE-MsgGUID: GGGkn6rJTy+XKarsidpdGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84303732"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84303732"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 06:56:06 -0700
X-CSE-ConnectionGUID: vRfP4bF9TFqp8eWB4DNIcg==
X-CSE-MsgGUID: I2nWaN3mRBq0Meb5SUOFYg==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 06:56:04 -0700
Date: Thu, 9 Jul 2026 15:55:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/xe_cw_post_sync: Rename test and relax
 platform
Message-ID: <20260709135546.r26p6zqjzxaksfw5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org,
 ramadevi.gandi@intel.com
References: <20260709052746.2073312-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260709052746.2073312-2-priyanka.dandamudi@intel.com>
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

Hi priyanka.dandamudi,
On 2026-07-09 at 10:57:47 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Rename test to xe_cw_post_sync as it works for both msix and non
> msix.
> Also rename the subtest and internal shader helper functions.

Describe also how you relaxed platform.

> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  .../{xe_non_msix.c => xe_cw_post_sync.c}      | 19 +++++++++----------
>  tests/meson.build                             |  2 +-
>  2 files changed, 10 insertions(+), 11 deletions(-)
>  rename tests/intel/{xe_non_msix.c => xe_cw_post_sync.c} (92%)
> 
> diff --git a/tests/intel/xe_non_msix.c b/tests/intel/xe_cw_post_sync.c
> similarity index 92%
> rename from tests/intel/xe_non_msix.c
> rename to tests/intel/xe_cw_post_sync.c
> index 9515dc487a..1aa2f13139 100644
> --- a/tests/intel/xe_non_msix.c
> +++ b/tests/intel/xe_cw_post_sync.c
> @@ -4,11 +4,11 @@
>   */
>  
>  /**
> - * TEST: Tests for Compute walker interrupt on non msix mode.
> + * TEST: Tests for Compute walker post sync interrupt
>   * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: Compute walker interrupt
> - * Functionality: Compute walker interrupt on non msix mode
> + * Functionality: Compute walker post sync interrupt notification
>   * Test category: functionality test
>   */
>  #include "gpgpu_shader.h"
> @@ -86,7 +86,7 @@ static struct intel_bb *xe_bb_create_on_offset(int fd, uint32_t exec_queue, uint
>  	return ibb;
>  }
>  
> -static struct gpgpu_shader *get_non_msix_shader(int fd, const uint64_t flags)
> +static struct gpgpu_shader *get_cw_post_sync_shader(int fd, const uint64_t flags)
>  {
>  	static struct gpgpu_shader *shader;
>  
> @@ -137,8 +137,8 @@ static void *thread1_fn(void *arg)
>  	intel_bb_add_intel_buf(ibb, t_data->post_sync, true);
>  	intel_bb_add_intel_buf(ibb, poll_buf, true);
>  
> -	shader1 = get_non_msix_shader(t_data->fd, SHADER_SIMPLE_DWORD);
> -	shader2 = get_non_msix_shader(t_data->fd, SHADER_LOOP);
> +	shader1 = get_cw_post_sync_shader(t_data->fd, SHADER_SIMPLE_DWORD);
> +	shader2 = get_cw_post_sync_shader(t_data->fd, SHADER_LOOP);
>  
>  	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
>  
> @@ -236,8 +236,8 @@ static void *thread2_fn(void *arg)
>  }
>  
>  /**
> - * SUBTEST: walker-interrupt-notification-non-msix
> - * Description: Validate walker interrupt notification in non msix mode.
> + * SUBTEST: walker-post-sync
> + * Description: Validate walker post sync interrupt notification.
>   * Run type: FULL
>   */
>  static void test_walker_notification(int fd, struct drm_xe_engine_class_instance *hwe)
> @@ -281,16 +281,15 @@ int igt_main()
>  
>  	igt_fixture() {
>  		fd = drm_open_driver(DRIVER_XE);
> -		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) == IP_VER(35, 11));
> +		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 11));
>  	}
>  
> -	igt_subtest_with_dynamic("walker-interrupt-notification-non-msix") {
> +	igt_subtest_with_dynamic("walker-post-sync") {
>  		xe_for_each_engine(fd, hwe) {
>  			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
>  				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
>  					      hwe->engine_instance)
>  					test_walker_notification(fd, hwe);
> -				break;

Why this is removed? If it is really needed imho it should be
on separate patch (as a fix or real change).

>  			}
>  		}
>  	}
> diff --git a/tests/meson.build b/tests/meson.build
> index 6d90627b93..895d3c50d8 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -321,7 +321,7 @@ intel_xe_progs = [
>          'xe_module_load',
>          'xe_multigpu_svm',
>  	'xe_noexec_ping_pong',
> -        'xe_non_msix',
> +	'xe_cw_post_sync',

Please keep it in alphabetical order, so move it up.

Regards,
Kamil

>  	'xe_oa',
>  	'xe_page_reclaim',
>  	'xe_pat',
> -- 
> 2.43.0
> 
