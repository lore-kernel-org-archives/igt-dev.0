Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46898CFC26E
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 12:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B3710E030;
	Fri, 21 Nov 2025 12:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V99TCPA4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F35210E030
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 12:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763728128; x=1795264128;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=A+nk8VHRWR53iXlvc/DfGK10OhDPSZsQN5JqTx9D7Kg=;
 b=V99TCPA4+tLonn16H+cXiH8leVwrMheV7DWORJjaMFpzJffr9Rr6Oe6N
 AB9wcNR1tv5xPxSNyzCUBQmL+A0NL62hucvsOSMojV1TyfAE2Ku7WiqD/
 bN8h7FuUvidBdAykUs+/XYjslDBjQb2FQgJCZQni/QW49U4lHMpRTceek
 cVSR6W4AC5v4q6tE4HTAPVODJ1fCs3PNcImJcyHUfgNgK6SPoVPzeIeMt
 sPWRNWP+GjuyvCLOQfxba5qdpYzk+B2uEFkkFcEaMbDshCFdmAM1Atq6K
 +cZHMGq5qRrU+YU58XM1xe4bhd7jjfYsVqWaWFy8zjwIm5R1Z3UodB6KB A==;
X-CSE-ConnectionGUID: InIbz/G+RCm9CfqO/blWDg==
X-CSE-MsgGUID: x/ziKZbZREavy9P9B5jszw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65851740"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="65851740"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 04:28:48 -0800
X-CSE-ConnectionGUID: 3XLgVJTDQE+aBiDr5C1iig==
X-CSE-MsgGUID: 74A6/l9kSYO5d01LPpXu8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="196626869"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 04:28:40 -0800
Date: Fri, 21 Nov 2025 13:27:15 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 ville.syrjala@linux.intel.com, ankit.k.nautiyal@intel.com
Subject: Re: [PATCH i-g-t] tests/kms_plane_scaling: Clarify skip on early
 -EINVAL
Message-ID: <20251121122715.hmbvcncii26x3m5s@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 ville.syrjala@linux.intel.com, ankit.k.nautiyal@intel.com
References: <20251120123327.1056280-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251120123327.1056280-1-swati2.sharma@intel.com>
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

Hi Swati,
On 2025-11-20 at 18:03:27 +0530, Swati Sharma wrote:
> Clarify the skip message for cases where scaler requirements
> are not met and the test exits early with -EINVAL, avoiding
> confusion with a driver failure.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/kms_plane_scaling.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 63d35d76b..7de1b802d 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -1386,7 +1386,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  								 igt_output_name(output));
>  						}
>  						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> -							      "Unsupported scaling operation in driver with return value %s\n",
> +							      "Unsupported scaling operation (ret = %s)\n",
>  							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");

Overall looks good but can it be one function call?
something like:

static void skip_if_erange_or_einval(int err)
{
	...
}

and use it instead of copy-paste.

Regards,
Kamil

>  					}
>  				}
> @@ -1416,7 +1416,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  								 igt_output_name(output));
>  						}
>  						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> -							      "Unsupported scaling operation in driver with return value %s\n",
> +							      "Unsupported scaling operation (ret = %s)\n",
>  							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
>  					}
>  				}
> @@ -1446,7 +1446,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  								 igt_output_name(output));
>  						}
>  						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> -							      "Unsupported scaling operation in driver with return value %s\n",
> +							      "Unsupported scaling operation (ret = %s)\n",
>  							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
>  					}
>  				}
> @@ -1473,7 +1473,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  							 igt_output_name(output));
>  					}
>  					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> -						      "Unsupported scaling operation in driver with return value %s\n",
> +						      "Unsupported scaling operation (ret = %s)\n",
>  						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
>  				}
>  			}
> @@ -1500,7 +1500,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  							 igt_output_name(output));
>  					}
>  					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> -						      "Unsupported scaling operation in driver with return value %s\n",
> +						      "Unsupported scaling operation (ret = %s)\n",
>  						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
>  				}
>  			}
> @@ -1526,7 +1526,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  							 igt_output_name(output));
>  					}
>  					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> -						      "Unsupported scaling operation in driver with return value %s\n",
> +						      "Unsupported scaling operation (ret = %s)\n",
>  						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
>  				}
>  			}
> @@ -1555,7 +1555,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  								 igt_output_name(output));
>  						}
>  						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> -							      "Unsupported scaling operation in driver with return value %s\n",
> +							      "Unsupported scaling operation (ret = %s)\n",
>  							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
>  					}
>  				}
> -- 
> 2.25.1
> 
