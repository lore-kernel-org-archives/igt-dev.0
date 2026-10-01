Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7995CA5FCE
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 10:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E79D10E03B;
	Thu,  1 Oct 2026 10:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tn2DJN0F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B014510E03B
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 10:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790850702; x=1822386702;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=dWpD4v426lqFCMteJKz8+BNwPVfUMwCyD8Rof/UtTlE=;
 b=Tn2DJN0F2U8q/PhrwVzPraUAMc2II7kfjF7CBv+1QBwW11JxrpXpsrUz
 T3zDQr1c7tv9fWHuSLwR0gyAlJK1vky34ap+TNP15BqZ3ouwdiaTQDc9n
 qer8z6kepvLK97/pRIM7lun66n3wqluKWEmF3voQ533pMc9zUH5XVQVoX
 wP4TBxAKxAXyROi7NEHe8/rNstUmnB+hBPQ8OsScV+AxvqShx1qAjOHBm
 LBwOAZpqFIJAtEe+qIHjHluQlFuu6BmOM6efgyNQrwIN4t3Lc9ZEeh/tg
 PGsbeml8htKuJkZVSLjsmT6IKxrT/xU4FkCFVRUFzlC+AfU+YqFp7/sn2 g==;
X-CSE-ConnectionGUID: r1Wwyx2nR5W13b7vFiO8dw==
X-CSE-MsgGUID: UZ+LaiutQ4uy8BUNguTL0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91700668"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="91700668"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 03:31:42 -0700
X-CSE-ConnectionGUID: U9dDOi6ES76Fjt/ZB6/2cA==
X-CSE-MsgGUID: sx3ls3j8RCeL4TkGBDi5BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="305457041"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.3])
 ([172.28.182.3])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 03:31:40 -0700
Message-ID: <cab4d529-287f-40eb-9e42-3a0fbfbef74b@linux.intel.com>
Date: Thu, 1 Oct 2026 12:31:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_pmu: Fix test to accept single VF configs
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 igt-dev@lists.freedesktop.org, marcin.bernatowicz@intel.com,
 soham.purkait@intel.com
References: <20260928185717.2846223-2-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260928185717.2846223-2-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 9/28/2026 8:57 PM, Umesh Nerlige Ramappa wrote:
> Some platforms my support just one VF, so remove the need for 2 VFs in
> the tests.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>   tests/intel/xe_pmu.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 364e643fe5bb..d41ebba1faef 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -982,7 +982,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
>   
>   static unsigned int enable_and_provision_vfs(int fd)
>   {
> -	unsigned int num_vfs, vf;
> +	unsigned int num_vfs, vf, total_vfs;
>   	uint32_t pf_exec_quantum_ms = 64, vf_exec_quantum_ms = 32;
>   	uint32_t pf_preempt_timeout_us = 64000, vf_preempt_timeout_us = 32000;
>   
> @@ -995,11 +995,13 @@ static unsigned int enable_and_provision_vfs(int fd)
>   				       NULL);
>   	autoprobe = igt_sriov_is_driver_autoprobe_enabled(fd);
>   
> +	total_vfs = igt_sriov_get_total_vfs(fd);
> +	num_vfs = total_vfs > 2 ? 2 : total_vfs;
> +
>   	/* Enable VF's */
>   	igt_sriov_disable_driver_autoprobe(fd);
> -	igt_sriov_enable_vfs(fd, 2);
> -	num_vfs = igt_sriov_get_enabled_vfs(fd);
> -	igt_require(num_vfs == 2);
> +	igt_sriov_enable_vfs(fd, num_vfs);
> +	igt_require(igt_sriov_get_enabled_vfs(fd) == num_vfs);

LGTM,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

>   
>   	/* Set 32ms for VF execution quantum and 64ms for PF execution quantum */
>   	xe_sriov_admin_bulk_set_exec_quantum_ms(fd, vf_exec_quantum_ms);
