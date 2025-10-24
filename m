Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6937ACCD1AB
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 08:53:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046CB10E1A1;
	Fri, 24 Oct 2025 08:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F29AuIWx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2073810E1A1
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 08:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761296030; x=1792832030;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SnqxzcF7uQkX6EaHHcMRgrumVD9tjVrfqvwKg8mWoyM=;
 b=F29AuIWx8mJd6VRRJiULHEq7vPjMxxVvb6x6Xo+dKR4+YODBNQIPYZLy
 yE57Nhzbz3QKbxo5bgTgn5Y5ikVR/Ao7CuRtzGU2u4EQo75HiBmXGPsHf
 RxvleEfFSrnXm4HrjUaWb0owD0HY8FZ5PmvFsarJU6CLu7ZEWGtPndYZ4
 X0ZsMi9WU7rIFx9wg2gfOxmNBzi/VsNnKa14r4IX6zwZoJMW4Jc/aawWg
 n/2eKC0bxepY/HyZeWT9DLLwzIvdNlhNta5mc8RWD2DfOZIFgJ4ywdiGV
 6rK1EoisDMNIreB86B3EiJDfNuBpyitI0BbiyrsV2h1cuwM+Nn7Y8wE70 Q==;
X-CSE-ConnectionGUID: jkWfywcqRbicFORZ/way4A==
X-CSE-MsgGUID: IWKh6SceTBqqLpqO1vsnJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63401687"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63401687"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:53:50 -0700
X-CSE-ConnectionGUID: DGO8veGmSS2jobuUij02TQ==
X-CSE-MsgGUID: QsrStiZYTm2y8nZfc/O53Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="188676086"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.46])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:53:49 -0700
Date: Fri, 24 Oct 2025 10:53:45 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org, jeevaka.badrappan@intel.com, 
 kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t v7 2/3] tests/kms_concurrent: Fix for msg_queue
 failure
Message-ID: <taipwo2hbpba5vkfbyhhiayk5myufohg76eoh5aprsk5andotv@agvlxeqt3icp>
References: <20251023063113.3485132-1-s.sebinraj@intel.com>
 <20251023063113.3485132-3-s.sebinraj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251023063113.3485132-3-s.sebinraj@intel.com>
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

On Thu, Oct 23, 2025 at 12:01:12PM +0530, S Sebinraj wrote:
> Adds supports to check if the system supports SYSVIPC
> and if not found it skips the test. This removes test
> failures with msg_queue creation for systems that
> don't support SYSVIPC.
> 
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  tests/kms_concurrent.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 4f16f8b89..1f2da3001 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -396,7 +396,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  		igt_require(data.display.is_atomic);
>  		igt_display_require_output(&data.display);
>  		if (is_intel_device(data.drm_fd))
> -			intel_allocator_multiprocess_start();
> +			igt_require_f(intel_allocator_multiprocess_start(),
> +				   "Allocator failure, no SYSV IPC\n");

Check indentation. With this nit addressed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  	}
>  
>  	run_tests_for_pipe(&data);
> -- 
> 2.43.0
> 
