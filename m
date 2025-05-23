Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50ABC3DA6D
	for <igt-dev@archiver.kernel.org>; Fri, 23 May 2025 10:16:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E8610E7C2;
	Fri, 23 May 2025 10:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jat/8+bH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C797E10E7C2
 for <igt-dev@lists.freedesktop.org>; Fri, 23 May 2025 10:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747995365; x=1779531365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GuWIXGOKFZeke5oaIn3eloHA8lLh9XAWWi7qX1uwoZI=;
 b=Jat/8+bHU9aqfvVCvLm6nySqYZjH/fTl3IGWTjIeYnuoNBYtuu3GiQJm
 WVWQmfzHO1ZNr3c5nd6PCSP66EqOtVyp3aX7+DoGCDQdzb1cl2ysI9We6
 Yg7G2A/nfOGA5Gap6u8z6Zy4N7tIZx+f3oAukpWusWb7kGk+8K8dGvs4O
 wjFa3582dV/aluFNzN87gPQ/3sNygB98bChzNDITasf/aUPYhfnCIGmj5
 X9cRvf/Bp23gj1Xx1d2sDDmmcekVqP7dR6EiOMJD82eUwGQHMTSjrxAEa
 F7ZRR9IdPumyOlxEEwYhbaM+XRG+Wg4Z4hybzxXHqCLicVXATvqvdVGSZ Q==;
X-CSE-ConnectionGUID: hg67va4ESCCzGgyQvOf7hA==
X-CSE-MsgGUID: fMgE8C2HQzqDx7rK7ijlYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50161375"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="50161375"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 03:16:04 -0700
X-CSE-ConnectionGUID: k2XaYSkjSKSmJxqNsbgI/A==
X-CSE-MsgGUID: PKJ37Fc5QeuB0BZtSVaVRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="141644410"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.146])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 03:16:03 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>
Subject: Re: [PATCH i-g-t 1/1] lib/igt_ktap: fix parsing problems for
 parametrized tests with no params
Date: Fri, 23 May 2025 12:16:00 +0200
Message-ID: <2001558.taCxCBeP46@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250523083544.13787-1-jan.sokolowski@intel.com>
References: <20250523083544.13787-1-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Friday, 23 May 2025 10:35:44 CEST Jan Sokolowski wrote:
> In some cases, parametrized test might have no params and therefore no
> results to be reported, which causes parser failures.

Please add an excerpt from an error report and a related KTAP report from 
dmesg to your commit description for reference.

> 
> Add a condition that checks for that in the parser.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Please provide a reference to a real issue, if there is one tracked publicly.

> ---
>  lib/igt_ktap.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/lib/igt_ktap.c b/lib/igt_ktap.c
> index 300fb2bb5..34306a1a0 100644
> --- a/lib/igt_ktap.c
> +++ b/lib/igt_ktap.c
> @@ -250,6 +250,10 @@ int igt_ktap_parse(const char *buf, struct igt_ktap_results *ktap)
>  		return -EINPROGRESS;
>  	}
>  
> +	/* in case of parametrized test having no params and hence no results */
> +	if (igt_debug_on(ktap->expect == SUB_RESULT && code == IGT_EXIT_SKIP))
> +		ktap->expect = CASE_RESULT;

NAK.

That looks like you are trying to address a case when a test case opens a 
parametrized subtest section but returns no results from parametrized 
subtests.  If that case is now recognized by the parser as protocol violation 
while it should not, i.e., empty parametrized results section should be 
allowed, then that should be fixed in the input parser section, not in a next 
section that evaluates parsing results.

After the parser detects a KTAP parametrized test case header and a KTAP 
parametrized test case name, it shouldn't expect any parametrized subtest 
results like it does now but should just expect a test case result.  KTAP 
parametrized subtest result lines detected when the KTAP test case result line 
is expected should still be accepted.  Please find relevant steps in the 
parser code and fix them.  Then, as soon as the current requirement of at 
lease one result of a parametrised subtest expected is killed, the SUB_RESULT 
phase may be dropped from the list of parsing phases as no longer needed.

Please also add a corresponding test case, based on the now problematic KTAP 
output, to lib/tests/igt_ktap_parser.c

Thanks,
Janusz

> +
>  	/* neither a test case name nor result */
>  	if (ktap->expect != SUB_RESULT && code == IGT_EXIT_INVALID)
>  		return -EINPROGRESS;
> 




