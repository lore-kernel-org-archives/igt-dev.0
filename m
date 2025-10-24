Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A21FCCD1AB
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 08:55:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E644E10E9FE;
	Fri, 24 Oct 2025 08:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O+fHQEhO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4690210E9FE
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 08:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761296119; x=1792832119;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8E3VApxmpfbuu0ehpjD0A6X58eI+Isfxb7fOOlP6OFM=;
 b=O+fHQEhOd4kmHtBPba91GN79bv1j6y1Nm3wNApvoIQSKsPD8K9KtO+NQ
 c8jRuyFqQrDJV5rgB5tRstTWTvQq69dCqYjadAdTzPYaufVlLW3pyBx4P
 l/GS/Rg5ZEHfmheoyvJaM7Bb5QyLSToCYCZVfd0+d6eYjHzOcorvogzhd
 RBFaov6Sl1rrkN2FW+XI+6uuIN7DRjPSVKwCn/iQES+OXtwKoPo5rijCI
 5rnolkj0+C8uuOzfVNnsTSEHh+AF4Y+8XRbMLlrk920T2Y7OcyhXaz2kH
 WeCSWK2A67sRWa46Ev9PVR9vMyWa0xfV9Xg8eyesszlR2LfzJ+0eZfUPz g==;
X-CSE-ConnectionGUID: 41jmSYVEQF63SR4AJ0B1OA==
X-CSE-MsgGUID: vLbguuQwRyi/5g57y/tUhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66092269"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="66092269"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:55:15 -0700
X-CSE-ConnectionGUID: 2jVLgNRWT8q1Filf+kCQgQ==
X-CSE-MsgGUID: Nzg4mqeCR4WOMajYdhpK/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="215038220"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.46])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:55:14 -0700
Date: Fri, 24 Oct 2025 10:55:11 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org, jeevaka.badrappan@intel.com, 
 kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t v7 3/3] tests/api_intel_allocator: Check if
 multiprocess is supported
Message-ID: <2wfo32b7ddovw4rtkhrepwcrmfn5cds5lvzsxnl65cved5aasx@i4lm4mq3addr>
References: <20251023063113.3485132-1-s.sebinraj@intel.com>
 <20251023063113.3485132-4-s.sebinraj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251023063113.3485132-4-s.sebinraj@intel.com>
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

On Thu, Oct 23, 2025 at 12:01:13PM +0530, S Sebinraj wrote:
> Check if multiprocess is supported and if not, skip fork_simple_stress()
> for targets that don't have SYSVIPC enabled in their kernel.
> Without this check, the test would fail with assertion errors when
> trying to use message queues.
> 
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  tests/intel/api_intel_allocator.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/api_intel_allocator.c b/tests/intel/api_intel_allocator.c
> index 15ba4828c..773c247db 100644
> --- a/tests/intel/api_intel_allocator.c
> +++ b/tests/intel/api_intel_allocator.c
> @@ -487,7 +487,8 @@ static void fork_simple_stress(int fd, bool two_level_inception)
>  	uint64_t ahnd0, ahnd1;
>  	bool are_empty;
>  
> -	__intel_allocator_multiprocess_prepare();
> +	igt_require_f(__intel_allocator_multiprocess_prepare(),
> +			"System does not support SYSVIPC, multiprocess mode unsupported\n");

Same as in previous patch, check indentation. With this addressed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
>  
>  	igt_fork(child, 8) {
>  		if (two_level_inception) {
> -- 
> 2.43.0
> 
