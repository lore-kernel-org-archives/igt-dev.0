Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A18C43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 09:12:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363CB10E346;
	Mon, 13 Jul 2026 09:12:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aOXhQxwh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5081910E346
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 09:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783933931; x=1815469931;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aoCvB5hHFwBk81q6HPzIDMJfP8YnWDCusMoEAi6o7Hk=;
 b=aOXhQxwhAo6ny6fCJ8cfP5DwWBQTvKeSai5fdRo826Cvlf5+R8WXZZXO
 aNsUisR1Dl3frGxpVDKx0XSYv8sLk5tmNjWpHzr+jpvq35KD+uTK1KEQe
 Vt+dOVDkHvIchnQPV8kaT9/8nRAsdRMl3oColPbqMsh6S2cpqGZkdV00H
 Qo8gjcgLsxltM3w+GD7Slfzcsf/mxyHiBPg0ALcTiqrY5jr396c2K/cjs
 KxTL/gluNHqRCZk0L1yf/xcfcXQUzk8koOlilIsGD9JRc19ZJdDnC8Hvw
 PPZLWS6eStUUnKFquntGTTjUlk/8IGopvHFw+oS9DU6ipKHX2n0rJ+oy/ A==;
X-CSE-ConnectionGUID: SGPJZ1cAQLiW5s6q4N4dig==
X-CSE-MsgGUID: 3/PujOC5Rm6Yx6ouhy1www==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84654393"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84654393"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 02:12:11 -0700
X-CSE-ConnectionGUID: UMSuOd9cTB+EpeOa+OpqLA==
X-CSE-MsgGUID: tjIZdwE6Q3K4IJTilc19zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="249136303"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 02:12:10 -0700
Date: Mon, 13 Jul 2026 11:11:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_cw_post_sync: Rename test and
 relax platform
Message-ID: <20260713091152.72xiroiwq5ymi23e@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org
References: <20260713052820.2231844-4-priyanka.dandamudi@intel.com>
 <20260713052820.2231844-5-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713052820.2231844-5-priyanka.dandamudi@intel.com>
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
On 2026-07-13 at 10:58:22 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Rename test to xe_cw_post_sync as it works for both msix and non
> msix.Also rename the subtest and internal shader helper functions.
> Relax the platform requirement from an exact match on IP_VER(35, 11)
> to a minimum of IP_VER(35, 11), as the compute walker post sync
> interrupt notification is supported on all platforms starting from
> xe3p xpc and beyond.
> 
> v2: Update commit description to explain more about relaxing
> platform.(Kamil)
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  .../intel/{xe_non_msix.c => xe_cw_post_sync.c} | 18 +++++++++---------
>  tests/meson.build                              |  2 +-
>  2 files changed, 10 insertions(+), 10 deletions(-)
>  rename tests/intel/{xe_non_msix.c => xe_cw_post_sync.c} (93%)
> 
> diff --git a/tests/intel/xe_non_msix.c b/tests/intel/xe_cw_post_sync.c
> similarity index 93%
> rename from tests/intel/xe_non_msix.c
> rename to tests/intel/xe_cw_post_sync.c
> index 9515dc487a..5e65673115 100644
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
> @@ -281,10 +281,10 @@ int igt_main()
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
> diff --git a/tests/meson.build b/tests/meson.build
> index 6d90627b93..d73aaecd9e 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -288,6 +288,7 @@ intel_xe_progs = [
>  	'xe_compute_preempt',
>  	'xe_copy_basic',
>  	'xe_configfs',
> +	'xe_cw_post_sync',
>  	'xe_debugfs',
>  	'xe_dma_buf_sync',
>  	'xe_drm_fdinfo',
> @@ -321,7 +322,6 @@ intel_xe_progs = [
>          'xe_module_load',
>          'xe_multigpu_svm',
>  	'xe_noexec_ping_pong',
> -        'xe_non_msix',
>  	'xe_oa',
>  	'xe_page_reclaim',
>  	'xe_pat',
> -- 
> 2.43.0
> 
