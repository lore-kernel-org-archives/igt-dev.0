Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6196FC5AD4E
	for <igt-dev@archiver.kernel.org>; Mon, 10 Aug 2026 04:54:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD5F10E601;
	Mon, 10 Aug 2026 04:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WCW2o72i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EDB10E601
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Aug 2026 04:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786337609; x=1817873609;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xpffrsoNVz8AUUEOh7V5clQGBirv8caJicYBG4odTHs=;
 b=WCW2o72iqnnRUOy6KP7RyPdmAZNCDkhZfjWUn7li3JkbAoUYG/yFXhrH
 4KZd0uy3DPvutvfzPKDm9p4l5P7zRts3/GqeqCcr2XWiewmpZwYfw8xNC
 //1mJO0xpPMESOP527EIZADyUvyxV+XEccauN9eRbsZ8Q7PksQZEO2oMO
 UXbGCG5ZPL/YAEqbtKPvIbctmVw0VhI/DV2r7cohpqbCYwt5molU34jpB
 TvJoWJaRcSaV/IufUZC/TTCh+0v/Pys1B3I/Wkwy9eV7SdGyK4sHRATPy
 oXhZBFVrK7F31h5tNK+36k8VEoDnNLQ0mYioJyT9EOAIcoNsABOH3WxBf A==;
X-CSE-ConnectionGUID: NwZxg+pyTN25v9NEmFYZOA==
X-CSE-MsgGUID: x0ox4XozQ6S/OEEyXDNL8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="98356822"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="98356822"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2026 21:53:29 -0700
X-CSE-ConnectionGUID: p+iDxq2FSBeX61wJpHv6+g==
X-CSE-MsgGUID: pNxDRcCJS0qXl10iWa4sBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="262978754"
Received: from soc-dcgdq34.clients.intel.com (HELO [10.66.114.153])
 ([10.66.114.153])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2026 21:53:28 -0700
Message-ID: <be0235fb-43d0-4d2d-84a1-d92c0ed94015@intel.com>
Date: Mon, 10 Aug 2026 10:23:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/3] tests/intel/kms_dp_linktrain_fallback: fix
 MST traversal state leak between subtests
To: Sowmiya S <sowmiya.s@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com
References: <20260805084428.708501-1-sowmiya.s@intel.com>
 <20260805084428.708501-3-sowmiya.s@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20260805084428.708501-3-sowmiya.s@intel.com>
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

Hello Sowmiya,

On 05-08-2026 14:14, Sowmiya S wrote:
> traversed_mst_output_count is file-static and was never reset between
> subtests. In a full-binary run the count from dp-fallback causes
> setup_mst_outputs() to skip all MST outputs in subsequent subtests.
>
> Reset it at the top of run_lt_fallback_test(). The DSC path never
> reaches setup_mst_outputs() so run_dsc_sst_fallaback_test() does not
> need the reset.
In the tree this patch applies to there are exactly two subtests, 
dp-fallback
and dsc-fallback. setup_mst_outputs() is only reachable from setup_outputs()
(tests/intel/kms_dp_linktrain_fallback.c:184), setup_outputs() is only 
called
from test_fallback() (:365), and test_fallback() is only called from
run_lt_fallback_test(). So run_lt_fallback_test() is the only path that ever
touches traversed_mst_output_count, and igt_main() calls it exactly 
once. The
counter starts at 0 (file-static), and as you say yourself in the next
paragraph the DSC path never reaches setup_mst_outputs().

So "the count from dp-fallback causes setup_mst_outputs() to skip all MST
outputs in subsequent subtests" describes something that cannot happen, and
this patch is a no-op standalone. It only becomes live in 3/3, where
run_lt_fallback_test() acquires a second caller.

That is fine for a prep patch - please just say so:

         run_lt_fallback_test() tracks which MST outputs it has already
         traversed in a file-static counter that is never cleared. Today it
         has a single caller so the counter is implicitly zero, but a second
         caller would silently inherit the first run's state and skip every
         MST sibling as "already visited".

         Reset the counter on entry so the function is safe to call more 
than
         once per binary. The DSC path never reaches setup_mst_outputs(), so
         run_dsc_sst_fallaback_test() does not need the same treatment.


Thanks and Regards
Kunal Joshi

>
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>   tests/intel/kms_dp_linktrain_fallback.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index 115183d2d..44b875ab9 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -431,6 +431,13 @@ static bool run_lt_fallback_test(data_t *data)
>   	bool ran = false;
>   	igt_output_t *output;
>   
> +	/*
> +	 * Reset per invocation so MST traversal state from a previous subtest
> +	 * (e.g. dp-fallback followed by dsc-fallback) doesn't leak and cause
> +	 * MST siblings to be silently skipped as "already visited".
> +	 */
> +	traversed_mst_output_count = 0;
> +
>   	for_each_connected_output(&data->display, output) {
>   		data->output = output;
>   
