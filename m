Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A895DE7717F
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 18:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7B810E16C;
	Tue, 10 Dec 2024 18:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OviPKcen";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8D210E16C
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2024 18:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733854265; x=1765390265;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xE5jOGiW66kfdf7lLMmFgMOMjWpfTg2t2YsMOPMwVVU=;
 b=OviPKcenXY5OfrEsYdVEKMZG5qlP5CBulAQ3sKegtMgrciz9nPB0RiIh
 QrLlOz5wbIlYCMKcJn64W2oxe8errthBopeTb5Dwrdh93SXJqFKbBrkxR
 X2jGdqBVpYlRYw5rBRB+8RS5BLc4SJ8iQgoge6ySe9mFKpuwBaqVsKjYI
 mqsfugACgR8pIfFlCUEZ9BZVCqILJWq+9bEm99ZYszQGgmvQdScna1v2E
 xNzwKvGuR0vRKIiFG7vSlxvXn1jsBbzfYOyH5OMs40FeVnIk19vExhwzm
 fr6IYMJC7Rv4oYgdagzuTd9qkIUwXOUIVRNs7MA/bgVvjAbVEdju6OJ8c A==;
X-CSE-ConnectionGUID: TRr5naMHTail6n5Lfw+ijg==
X-CSE-MsgGUID: wYdZ58W+TsSU5KUF0EEVZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="56693538"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="56693538"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 10:11:04 -0800
X-CSE-ConnectionGUID: qAwdKDhhRTah4JswDG3RiA==
X-CSE-MsgGUID: jmlRxQ4aRIGDjHsuS2TLeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="95938847"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.239])
 ([10.245.246.239])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 10:11:02 -0800
Message-ID: <4d317afd-5281-4059-b36b-a34d575e1b07@intel.com>
Date: Tue, 10 Dec 2024 19:10:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] tests/intel/xe_eudebug: Add
 basic-vm-bind-ufence-delay-ack test
To: =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20241209141359.5738-1-dominik.karol.piatkowski@intel.com>
 <20241209141359.5738-2-dominik.karol.piatkowski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241209141359.5738-2-dominik.karol.piatkowski@intel.com>
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

Hi Dominik,

On 9.12.2024 15:13, Dominik Karol Piątkowski wrote:
> Add a test that gives user fence in application and checks if delayed
> ufence ack works.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Thanks,
Christoph

> ---
>   tests/intel/xe_eudebug.c | 32 ++++++++++++++++++++++----------
>   1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index 39db16457..1853dee40 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -54,16 +54,17 @@ static void test_sysfs_toggle(int fd)
>   #define STAGE_PRE_DEBUG_RESOURCES_DONE	1
>   #define STAGE_DISCOVERY_DONE		2
>   
> -#define CREATE_VMS		(1 << 0)
> -#define CREATE_EXEC_QUEUES	(1 << 1)
> -#define VM_BIND			(1 << 2)
> -#define VM_BIND_VM_DESTROY	(1 << 3)
> -#define VM_BIND_EXTENDED	(1 << 4)
> -#define VM_METADATA		(1 << 5)
> -#define VM_BIND_METADATA	(1 << 6)
> -#define VM_BIND_OP_MAP_USERPTR	(1 << 7)
> -#define EXEC_QUEUES_PLACEMENTS	(1 << 8)
> -#define TEST_DISCOVERY		(1 << 31)
> +#define CREATE_VMS			(1 << 0)
> +#define CREATE_EXEC_QUEUES		(1 << 1)
> +#define VM_BIND				(1 << 2)
> +#define VM_BIND_VM_DESTROY		(1 << 3)
> +#define VM_BIND_EXTENDED		(1 << 4)
> +#define VM_METADATA			(1 << 5)
> +#define VM_BIND_METADATA		(1 << 6)
> +#define VM_BIND_OP_MAP_USERPTR		(1 << 7)
> +#define EXEC_QUEUES_PLACEMENTS		(1 << 8)
> +#define VM_BIND_DELAY_UFENCE_ACK	(1 << 9)
> +#define TEST_DISCOVERY			(1 << 31)
>   
>   #define PAGE_SIZE SZ_4K
>   #define MDATA_SIZE (WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_NUM * PAGE_SIZE)
> @@ -2124,6 +2125,10 @@ static int wait_for_ufence_events(struct ufence_priv *priv, int timeout_ms)
>    * SUBTEST: basic-vm-bind-ufence
>    * Description:
>    *      Give user fence in application and check if ufence ack works
> + *
> + * SUBTEST: basic-vm-bind-ufence-delay-ack
> + * Description:
> + *	Give user fence in application and check if delayed ufence ack works
>    */
>   static void test_basic_ufence(int fd, unsigned int flags)
>   {
> @@ -2148,6 +2153,10 @@ static void test_basic_ufence(int fd, unsigned int flags)
>   	xe_eudebug_debugger_wait_stage(s, STAGE_CLIENT_WAIT_ON_UFENCE_DONE);
>   	xe_eudebug_assert_f(d, wait_for_ufence_events(priv, XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * MSEC_PER_SEC) == 0,
>   			    "missing ufence events\n");
> +
> +	if (flags & VM_BIND_DELAY_UFENCE_ACK)
> +		sleep(XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * 4 / 5);
> +
>   	ack_fences(d);
>   
>   	xe_eudebug_client_wait_done(c);
> @@ -2813,6 +2822,9 @@ igt_main
>   	igt_subtest("basic-vm-bind-ufence")
>   		test_basic_ufence(fd, 0);
>   
> +	igt_subtest("basic-vm-bind-ufence-delay-ack")
> +		test_basic_ufence(fd, VM_BIND_DELAY_UFENCE_ACK);
> +
>   	igt_subtest("vma-ufence")
>   		test_vma_ufence(fd, 0);
>   
