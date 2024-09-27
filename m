Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE80ACDD1CE
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 17:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6A410ED04;
	Fri, 27 Sep 2024 17:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iPVx8Kay";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2C910ECF6
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 17:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727458865; x=1758994865;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=FjEObPZkaG/+m7ZWDh4+s1wmhKDgbZEoATm734id2JM=;
 b=iPVx8KayTJnNZAf1fIfH03kjZAa90wIF+NequRGeIH/9vGLoww+99zJG
 KOIWAad95nMwT+EXCAHEVh+fKtyQML9hg4FwnNUVJLzmY0qFXchmCoBCq
 Sw0Pu/XtTqqMzEqTiHf39vnZg+qd4vhRZdMiTD1TJ46S5j7Mib6f1NAQG
 HbBoCGDVeUUeZ7S/VRLy4i/+1VumZcSz3IqS3i0AoVblzB6Nc5LrZnDcy
 kq8l3nw+lycOHA8MXGV7l8ducc0I/ln5DxNsNseI+P3Uz5NEdTh2PT9r3
 ptv3HM6u9BOPWoFMTi3i7nsQC3VkP6uysvdqCx8xiaCayJfximkqm0RBg g==;
X-CSE-ConnectionGUID: pAvCfjBSR0eCr5Dl6gdwqg==
X-CSE-MsgGUID: Kc81PbU+TpyEAVI7/CfUVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26776080"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="26776080"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 10:41:04 -0700
X-CSE-ConnectionGUID: a2ziS5J3RtaPQt3mNLcn3Q==
X-CSE-MsgGUID: Yp1MuVsDQiqI1yFp2YSAOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="77542932"
Received: from skuruba-mobl.gar.corp.intel.com (HELO [10.215.112.152])
 ([10.215.112.152])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 10:41:03 -0700
Message-ID: <c075de84-dd29-4a11-9c25-6df325f40028@intel.com>
Date: Fri, 27 Sep 2024 23:10:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v3,
 2/3] tests/kms_plane_scaling: Improve error handling in
 kms_plane_scaling tests
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240926181150.2148704-3-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20240926181150.2148704-3-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 26-09-2024 23:41, Naladala Ramanaidu wrote:
> Refactor error handling in test_planes_scaling_combo to use break
> statements instead of immediate returns. This ensures cleanup_fbs
> is always called before exiting the loop. Additionally, adjust log
> message formatting in igt_main_args for consistency.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/kms_plane_scaling.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 96ceedee2..a55720ed9 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -998,12 +998,12 @@ test_planes_scaling_combo(data_t *d, double sf_plane1,
>   							  pipe, output, p1, p2,
>   							  &d->fb[1], &d->fb[2],
>   							  test_type);
> -			if (ret != 0) {
> -				cleanup_fbs(d);
> -				return ret;
> -			}
> +			if (ret != 0)
> +				break;
>   		}
>   		cleanup_fbs(d);
> +		if (ret == 0)
> +			break;
>   	}
>   	return ret;
>   }
> @@ -1543,7 +1543,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   								scaler_with_2_planes_tests[index].test_type);
>   							if (ret == 0)
>   								break;
> -							igt_info("Required Scaling operation not supported on %s trying on next output\n",
> +							igt_info("Required scaling operation not supported on %s trying on next output\n",
>   								 igt_output_name(output));
>   						}
>   						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
