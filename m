Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D41CD4F3D
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 13:55:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FA610E2A5;
	Wed, 20 May 2026 13:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="naeIKJ0H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA55010E46D
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 13:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779285304; x=1810821304;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2GgLN3YfcCajreQKuVbP13Xkd1FuBeQKsEQcCXWBTqE=;
 b=naeIKJ0HLGWclceDTU+kPyZ05NqxSvHmFeF33U50vBOj8zK0dJBpRQsK
 Ol5ETctyg2xVJhfafRoNCsSVUiodzIys089vgEi0FKWF2Sl9OQ6kv9+oX
 Od6475nigjOJMSfucJt3edrDARPBMdSdRTmo9zG3Cz8Mzmd2hW6D5Wjk5
 59YzN1kTpLrBchWg6I9H+UdWWtqXZWTDoNprNMTpb3oM7TZJRmXVq8oF8
 2FFYk9f4XxOYaSZ1ifXvzttzW/P08+0l1LDtOtym5utyZNhVQdw0gkJbv
 /0zp6u+ex3Wji42e+Ed3Ntcyx0lEdHWh1rAQ9J/fJYimqqwivnP61u5hn A==;
X-CSE-ConnectionGUID: sk0ymlCZRBGfBqlr98uMAA==
X-CSE-MsgGUID: MRGq56yUSe6gEl2gOjMmkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80086232"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="80086232"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 06:55:03 -0700
X-CSE-ConnectionGUID: ODNa6oanT6WtO/zZEAMTBg==
X-CSE-MsgGUID: U0DRBYFVSSWulGTbaUAs3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="245172844"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.189])
 ([172.28.182.189])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 06:55:02 -0700
Message-ID: <cf44a778-e349-4805-b671-5ec7b9225d95@linux.intel.com>
Date: Wed, 20 May 2026 15:54:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/intel/xe_sriov_vfio: Ensure VFIO fds are closed
 in fixture
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, jakub1.kolakowski@intel.com
References: <20260519120055.201038-1-lukasz.laguna@intel.com>
 <20260519120055.201038-3-lukasz.laguna@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260519120055.201038-3-lukasz.laguna@intel.com>
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


On 5/19/2026 2:00 PM, Lukasz Laguna wrote:
> Close VFIO file descriptors in the final cleanup fixture to prevent stale
> open VFIO fds from blocking VF teardown when disabling VFs.
>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   tests/intel/xe_sriov_vfio.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_sriov_vfio.c b/tests/intel/xe_sriov_vfio.c
> index bb1c02696..f445b6a75 100644
> --- a/tests/intel/xe_sriov_vfio.c
> +++ b/tests/intel/xe_sriov_vfio.c
> @@ -341,6 +341,9 @@ static void restore_xe_vfio_module(void)
>   
>   int igt_main()
>   {
> +	struct vfio_dev_fds fds = { .container_fd = -1, .group_fd = -1, .device_fd = -1,
> +				    .group_id = NULL };
> +
>   	igt_fixture() {
>   		xe_vfio_loaded_initially = igt_kmod_is_loaded(XE_VFIO_PCI_MOD);
>   	}
> @@ -404,7 +407,6 @@ int igt_main()
>   	igt_describe("Bind VF to xe-vfio-pci and query VFIO region info (BAR sizes). ");
>   	igt_subtest("region-info") {
>   		unsigned int vf_num = 1;
> -		struct vfio_dev_fds fds;
>   		char *slot = NULL;
>   
>   		igt_skip_on_f(igt_kmod_load(XE_VFIO_PCI_MOD, NULL),
> @@ -432,6 +434,7 @@ int igt_main()
>   	}
>   
>   	igt_fixture() {
> +		vfio_close_device(&fds);
>   		cleanup_pf();
>   		restore_xe_vfio_module();
>   	}
LGTM, Thanks,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

