Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0620C54798
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 07:14:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CAF10E078;
	Thu, 29 Feb 2024 07:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MUkfheGy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211A010E078
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 07:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709190873; x=1740726873;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jzhDoOQtXv1HULVg6rzLoNlRkRpTZ19LujBMhLUIN+A=;
 b=MUkfheGyv2gPpD/t56nN0eV8QG+RWQRQMT/KJ8iA6UH+OdLV7Y0cMYHm
 zvPjRlrMJt4cGgb6DKB1ELWRU/W2id/GbnGmDLtpZDdcjfgiBnodm7JLG
 SRrujYX76BoP4+vTz0CharLs7Zo0WBr7P0OJO7Gm+Z2ryVlAdN/RDgRRx
 8I3Jh8M2KZb5zzkvuIAR1VnjcEvSxzoh3bzibFvDxClWsKbLBITgWMfGk
 Zg2m7aefefGJ5ISTEhI5I81w3NoxiFI82kZAyu6NLpz9GvfvjhAyicdlx
 ybtqMylUe8HUAonfRtOosTCNPgLTffZqL9xLJsVD9KdaNeiurYLAuKN8I A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3511286"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="3511286"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 23:14:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="7642783"
Received: from gbretter-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.96.15])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 23:14:30 -0800
Date: Thu, 29 Feb 2024 08:14:27 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_compute_preempt: Add
 compute-preempt-many
Message-ID: <20240229071427.onbhjsiyw6mclstx@zkempczy-mobl2>
References: <20240228162118.14654-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240228162118.14654-1-nirmoy.das@intel.com>
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

On Wed, Feb 28, 2024 at 05:21:18PM +0100, Nirmoy Das wrote:
> Add compute-preempt-many which should exercise multiple
> mid-thread preemption at a time for multiple contexts.
> 
> v2: move igt_fork within the test(Zbigniew).
> 
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  tests/intel/xe_compute_preempt.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
> index a4e0e1454..0aeb10547 100644
> --- a/tests/intel/xe_compute_preempt.c
> +++ b/tests/intel/xe_compute_preempt.c
> @@ -22,6 +22,11 @@
>   * Description:
>   *      Exercise compute walker mid thread preemption scenario
>   * Functionality: compute openCL kernel
> + * SUBTEST: compute-preempt-many
> + * GPU requirement: LNL
> + * Description:
> + *      Exercise multiple walker mid thread preemption scenario
> + * Functionality: compute openCL kernel
>   */
>  static void
>  test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe)
> @@ -48,6 +53,20 @@ igt_main
>  		}
>  	}
>  
> +	igt_subtest_with_dynamic("compute-preempt-many") {
> +		xe_for_each_engine(xe, hwe) {
> +			/* TODO: This subtest fails on RCS engine */

Hmm, aren't compute engines separated from render engines now?

> +			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
> +				continue;
> +
> +			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class)) {
> +				igt_fork(child, 100)

I'm curious - why arbitrary number 100 was taken? Regardless
answer code looks good to me, so:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +					test_compute_preempt(xe, hwe);
> +				igt_waitchildren();
> +			}
> +		}
> +	}
> +
>  	igt_fixture
>  		drm_close_driver(xe);
>  
> -- 
> 2.42.0
> 
