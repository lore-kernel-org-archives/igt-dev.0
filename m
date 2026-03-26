Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDA410A1E7C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 11:36:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BB710E95F;
	Thu, 26 Mar 2026 11:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hrqprxzb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BE410E95F
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 11:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774524982; x=1806060982;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vuJwhpUMNfkcLYH/KoNupPsML6h7OXH07k0rULBjM0c=;
 b=hrqprxzbHuOl4aqOooFQWhka8Vg9+xrivyV6Ubn5ehfsEOqCMvIcPr++
 FyKRBZmxPs5plCGCKLDetmDXbc5hVz/1MhgE8ZQAXVG6dO1vUK9MiRHTD
 5QLz5O9PRwc1IvQIAnCGN7NylOScdIEUqQa468mKfQ+KSGV8KZbIEzpxw
 +MYVHMTuZLe31bbNSDqWqrSDOpkneYvR8DMz9FMdQLyH9OXFiSDUZGSfh
 jWQ03wyULF2gebXMjllhJ2VENwuVukGj5rWRvIW8qS03ilOl1Y3i1SXIK
 hZ9KaTZUjX7ksgzXJmWK2uotfZg3sZcuBZ5kAAncsCFG0Waqy31492BEh g==;
X-CSE-ConnectionGUID: xF7k1u4ARSGeDIna2XP5yQ==
X-CSE-MsgGUID: i98DPUmRQoOuswfSMvKCRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75468659"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75468659"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 04:36:21 -0700
X-CSE-ConnectionGUID: jX7rrTS1QGqZyccckPtRlw==
X-CSE-MsgGUID: 4lmME352T6SyfZSYQtRAJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="229918700"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.14])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 04:36:19 -0700
Date: Thu, 26 Mar 2026 13:36:16 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/3] lib/kms: use CRTC index for
 __igt_output_crtc_populate()
Message-ID: <acUaMLSxqYTN63hG@intel.com>
References: <cover.1774267502.git.jani.nikula@intel.com>
 <5f13f6e087209ee05ffc9e3cfd0f58cf2f82b83a.1774267502.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f13f6e087209ee05ffc9e3cfd0f58cf2f82b83a.1774267502.git.jani.nikula@intel.com>
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

On Mon, Mar 23, 2026 at 02:06:26PM +0200, Jani Nikula wrote:
> Fill the valid output/crtc combos in __igt_output_crtc_populate() using
> CRTC index instead of pipe. This avoids buffer overruns if we reduce
> igt_display_n_crtcs() to the actual number of CRTCs on the device.
> 
> To keep the for_each_crtc_with_single_output() iteration in pipe order
> on Intel devices, sort the resulting array in a separate
> step. Presumably the performance impact of qsort() on an array of at
> most 16 elements is neglible.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  lib/igt_kms.c | 29 +++++++++++++++++++++++------
>  1 file changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 42329ad0303c..b92bb16aaf9c 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3588,6 +3588,18 @@ bool output_is_internal_panel(igt_output_t *output)
>  	}
>  }
>  
> +static int output_crtc_pipe_compare(const void *_a, const void *_b)
> +{
> +	const igt_output_crtc_t *a = _a, *b = _b;
> +
> +	/* pipe order for valid output/crtc combos */
> +	if (a->crtc && b->crtc)
> +		return a->crtc->pipe - b->crtc->pipe;
> +
> +	/* valid combos before empty elements */
> +	return !b->crtc - !a->crtc;
> +}
> +
>  igt_output_crtc_t *__igt_output_crtc_populate(igt_display_t *display, igt_output_crtc_t *chosen_outputs)
>  {
>  	unsigned int full_crtc_index_mask = 0, assigned_crtc_index_mask = 0;
> @@ -3634,17 +3646,17 @@ igt_output_crtc_t *__igt_output_crtc_populate(igt_display_t *display, igt_output
>  					/* We found an unassigned CRTC, use it! */
>  					found = true;
>  					assigned_crtc_index_mask |= 1 << crtc->crtc_index;
> -					chosen_outputs[crtc->pipe].output = output;
> -					chosen_outputs[crtc->pipe].crtc = crtc;
> -				} else if (!chosen_outputs[crtc->pipe].output ||
> -					   output_is_internal_panel(chosen_outputs[crtc->pipe].output)) {
> +					chosen_outputs[crtc->crtc_index].output = output;
> +					chosen_outputs[crtc->crtc_index].crtc = crtc;
> +				} else if (!chosen_outputs[crtc->crtc_index].output ||
> +					   output_is_internal_panel(chosen_outputs[crtc->crtc_index].output)) {
>  					/*
>  					 * Overwrite internal panel if not
>  					 * assigned, external outputs are faster
>  					 * to do modesets
>  					 */
> -					chosen_outputs[crtc->pipe].output = output;
> -					chosen_outputs[crtc->pipe].crtc = crtc;
> +					chosen_outputs[crtc->crtc_index].output = output;
> +					chosen_outputs[crtc->crtc_index].crtc = crtc;
>  				}
>  			}
>  
> @@ -3654,6 +3666,11 @@ igt_output_crtc_t *__igt_output_crtc_populate(igt_display_t *display, igt_output
>  		}
>  	}
>  
> +	/* For Intel, sort the output/crtc combos in pipe order */
> +	if (is_intel_device(display->drm_fd))
> +		qsort(chosen_outputs, igt_display_n_crtcs(display),
> +		      sizeof(*chosen_outputs), output_crtc_pipe_compare);

Maybe one day we can drop this sorting entirely. But that needs some
testing, so this seems good for the moment.

Didn't spot anything bad, so for the series
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> +
>  	return chosen_outputs;
>  }
>  
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
