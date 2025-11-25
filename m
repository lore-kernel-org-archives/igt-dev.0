Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEBBCFD370
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 12:07:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A388C10E1E7;
	Tue, 25 Nov 2025 12:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L5BW/Ahs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA65A10E177
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 12:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764072443; x=1795608443;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vjQSSuFNO50NLewMEkwmUsENDAaKUn7craVgHCrPVPg=;
 b=L5BW/AhsNKydd68D60ZstvqNbLUtyV9MIQ+cGvp8REGpn/UphKEQPYFF
 82qJnguXySrn+LjoH3BjYiM4vBMKEpQOkcQ5sA8Crq/7HEnJcR88lpvnW
 jx1V/eCGnGLfgnO+8IX1rZj72WQ0l9BAwaVDxiESojUXtYhwpYz3eZge2
 kCObhlOy/jptFY8F8b28Bvxo4olvkjZRXxAdTJ+ODlx0DcDyVChXZgDG3
 HUSd/KnY9pzElrwfzFdchurFv9SOnbwP/lo7Qpk/wFSmStrV2x66wZAi1
 ZOYKuRiYx2kxLTKtyl3U7NtEcEKBdcpdR8YUkUHHBMCIcsLG8YG75HKQ0 Q==;
X-CSE-ConnectionGUID: Br5UTQy3QV64J0SJuWqVpA==
X-CSE-MsgGUID: Otq2oolCS2+yxZZrlsHEnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65977865"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="65977865"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 04:07:22 -0800
X-CSE-ConnectionGUID: feqoEWU+STe4Z+ViWLTc6g==
X-CSE-MsgGUID: MlfvCKaNTo+0lF8q8/FwSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="196783972"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 04:07:21 -0800
Date: Tue, 25 Nov 2025 13:07:01 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t, v2] tests/kms_plane_scaling: Clarify skip on early
 -EINVAL
Message-ID: <20251125120701.xbnureddnvvvw4gw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20251124191259.1115713-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251124191259.1115713-1-swati2.sharma@intel.com>
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
On 2025-11-25 at 00:42:59 +0530, Swati Sharma wrote:
> Clarify the skip message for cases where scaler requirements
> are not met and the test exits early with -EINVAL, avoiding
> confusion with a driver failure.
> 
> v2: -add func() instead of copy-paste(Kamil)
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/kms_plane_scaling.c | 35 ++++++++++++++---------------------
>  1 file changed, 14 insertions(+), 21 deletions(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 63d35d76b..a9a44fbf2 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -562,6 +562,13 @@ static void cleanup_crtc(data_t *data)
>  	cleanup_fbs(data);
>  }
>  
> +static void skip_if_erange_or_einval(int ret)
> +{
> +	igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> +		      "Unsupported scaling operation (ret = %s)\n",
> +		      ret == -EINVAL ? "-EINVAL" : "-ERANGE");
> +}
> +
>  static uint32_t
>  check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>  			     uint32_t pixel_format,
> @@ -1385,9 +1392,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  							igt_info("Required scaling operation not supported on %s trying on next output\n",
>  								 igt_output_name(output));
>  						}
> -						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> -							      "Unsupported scaling operation in driver with return value %s\n",
> -							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
> +						skip_if_erange_or_einval(ret);
>  					}
>  				}
>  			}
> @@ -1415,9 +1420,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  							igt_info("Required scaling operation not supported on %s trying on next output\n",
>  								 igt_output_name(output));
>  						}
> -						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> -							      "Unsupported scaling operation in driver with return value %s\n",
> -							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
> +						skip_if_erange_or_einval(ret);
>  					}
>  				}
>  			}
> @@ -1445,9 +1448,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  							igt_info("Required scaling operation not supported on %s trying on next output\n",
>  								 igt_output_name(output));
>  						}
> -						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> -							      "Unsupported scaling operation in driver with return value %s\n",
> -							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
> +						skip_if_erange_or_einval(ret);
>  					}
>  				}
>  			}
> @@ -1472,9 +1473,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  						igt_info("Required scaling operation not supported on %s trying on next output\n",
>  							 igt_output_name(output));
>  					}
> -					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> -						      "Unsupported scaling operation in driver with return value %s\n",
> -						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
> +					skip_if_erange_or_einval(ret);
>  				}
>  			}
>  		}
> @@ -1499,9 +1498,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  						igt_info("Required scaling operation not supported on %s trying on next output\n",
>  							 igt_output_name(output));
>  					}
> -					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> -						      "Unsupported scaling operation in driver with return value %s\n",
> -						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
> +					skip_if_erange_or_einval(ret);
>  				}
>  			}
>  		}
> @@ -1525,9 +1522,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  						igt_info("Required scaling operation not supported on %s trying on next output\n",
>  							 igt_output_name(output));
>  					}
> -					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> -						      "Unsupported scaling operation in driver with return value %s\n",
> -						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
> +					skip_if_erange_or_einval(ret);
>  				}
>  			}
>  		}
> @@ -1554,9 +1549,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  							igt_info("Required scaling operation not supported on %s trying on next output\n",
>  								 igt_output_name(output));
>  						}
> -						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> -							      "Unsupported scaling operation in driver with return value %s\n",
> -							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
> +						skip_if_erange_or_einval(ret);
>  					}
>  				}
>  			}
> -- 
> 2.25.1
> 
