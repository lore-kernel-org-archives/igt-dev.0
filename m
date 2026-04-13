Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5588E64007
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 11:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BFE10E0F7;
	Mon, 13 Apr 2026 11:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B+ZUZss0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D4810E40B
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 11:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776079461; x=1807615461;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dvABnnNnpoBrgFGwUBcyNQy922WVudYhYCi0WbZbpko=;
 b=B+ZUZss0a7Ba9Vnvnyf2SgQvv3mMmzeJXWhAtphDbsN2d8kp9o5UTY5O
 y0yUD1qe8hy0HnyPE6CdpGFnjoFHqjHLqiiY+38fAWiL7Wt6MjBlzussz
 YthTjyXiqv2Z+Ib2E/qPY2CVMOCGY6SF4CVd59IqLM9XjDM+OWLu7A9Ix
 HhseMPOv2E7lC3uaC1IiuF16idokaa27tX1WNUlHQSHLxeTQRo/E2sWUN
 /z27tiJYiemiExL7DuwlcMUyR5RJ0ilKTb2F4LK25c4h7U+L55E3Vpx97
 7JX+Egx2OI7IsmdBNyItQM/afV7C0UggqWClqA+PTC/SCkMuoeRosmZMw Q==;
X-CSE-ConnectionGUID: Uh7I/p2ERkCAu18gcpwA5g==
X-CSE-MsgGUID: W/VYXE2wSgaywfnLliDQ1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="76177558"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="76177558"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 04:24:21 -0700
X-CSE-ConnectionGUID: AMGG8zVfR+iK1RP5lOYSVg==
X-CSE-MsgGUID: bPEKeyuNT62/MFsHJG4ljQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="252952069"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.64])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 04:24:19 -0700
Date: Mon, 13 Apr 2026 14:24:16 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: Re: [PATCH i-g-t] intel-ci: Block SR-IOV tests on i915
Message-ID: <adzSYHFIURjTxWzz@intel.com>
References: <20260413112013.102762-1-jakub1.kolakowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260413112013.102762-1-jakub1.kolakowski@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Mon, Apr 13, 2026 at 11:20:13AM +0000, Jakub Kolakowski wrote:
> SR-IOV isn't supported on i915 - block SR-IOV tests from execution with
> i915 driver.

What is broken in the sriov tests that they fail on some
platforms and skip on others?

> 
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>  tests/intel-ci/i915.blocklist.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
> index 1068e2e15..3a54853f1 100644
> --- a/tests/intel-ci/i915.blocklist.txt
> +++ b/tests/intel-ci/i915.blocklist.txt
> @@ -207,3 +207,7 @@ igt@kms_color_pipeline@plane-lut3d-green-only
>  igt@kms_frontbuffer_tracking@.*a(bgr|rgb)161616f.*
>  igt@kms_flip_scaled_crc@.*linear-reflect-x
>  ##################################################################
> +# SR-IOV: not supported in i915
> +##################################################################
> +igt@.*sriov.*
> +##################################################################
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
