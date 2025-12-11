Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E86D41D69
	for <igt-dev@archiver.kernel.org>; Thu, 11 Dec 2025 16:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FAA10E386;
	Thu, 11 Dec 2025 16:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HZ7MH//m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C71510E386
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Dec 2025 16:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765470917; x=1797006917;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Y6sPBjtoo3NzlfHBLQRAxY43cttqixsyB937M3gGGpw=;
 b=HZ7MH//mHuT8mxG2z2L7Ih7v1yk0LmPYIc/RiroQtpWBardbTyzqFUCh
 1n/hu/lk/GX3HvoNYUchIUop0PqpaaYbGc6Q7mtAix5l6CoEzWJAGxU6a
 eVfAXgxulw2CrX/8Y0Uap+wi9Pu/QKGbYY+rjfWFqMuFKySWBxv0ddiIX
 fcc6AUlAGWD+XXSYafyfUXYCBfNGp8xAhDMyLdk5KqpJo+VHo/hpHFdzL
 NwtFTjYdsz+yaG0arJeu5OD6MERYGFVWnCVLEFAKFchaNpo2NXEZ52vLz
 IJfHVXc8pipSlUeFFl/I2XO9TOyuBTW9rmXrsqsB1plbhaLOXiZiqmlwe A==;
X-CSE-ConnectionGUID: eVqmRaQ0RtGNwZlAJ6stjw==
X-CSE-MsgGUID: vMXjBvokQxS5IyF2ka/0rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67499155"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="67499155"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 08:33:55 -0800
X-CSE-ConnectionGUID: PvZtlU3AQ8eT/l2x404Nkg==
X-CSE-MsgGUID: RJVG1iSlTtyNvrmw1XB0JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196906309"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 08:33:55 -0800
Date: Thu, 11 Dec 2025 17:33:51 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Tvrtko Ursulin <tursulin@igalia.com>
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH i-g-t] kms_flip_tiling test run
Message-ID: <20251211163351.yiwxbgxoskz23zc5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, igt-dev@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20251211071414.17684-1-tursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251211071414.17684-1-tursulin@igalia.com>
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

Hi Tvrtko,
On 2025-12-11 at 08:14:14 +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> Flip tiling test-with target
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  tests/intel-ci/i915.fast-feedback.testlist | 171 +--------------------
>  1 file changed, 1 insertion(+), 170 deletions(-)
> 

This looks like something for IGT trybot?
Or do you want bigger sample?

Regards,
Kamil

> diff --git a/tests/intel-ci/i915.fast-feedback.testlist b/tests/intel-ci/i915.fast-feedback.testlist
> index 2799bbaa5870..6fbf8c517c9d 100644
> --- a/tests/intel-ci/i915.fast-feedback.testlist
> +++ b/tests/intel-ci/i915.fast-feedback.testlist
> @@ -1,171 +1,2 @@
> -# Try to load the driver if it's not available yet.
>  igt@i915_module_load@load
> -
> -# Keep alphabetically sorted by default
> -igt@core_auth@basic-auth
[cut]
> -igt@dmabuf@all-tests
> +igt@kms_flip_tiling@flip-change-tiling
> -- 
> 2.52.0
> 
