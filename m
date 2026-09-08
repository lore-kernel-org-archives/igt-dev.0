Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852F7C79F99
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 13:17:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE0410EBE4;
	Tue,  8 Sep 2026 13:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R6NzJInU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B284410E19F
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 13:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788873416; x=1820409416;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uvcUJ69yr4bP7vtfuVeVw1qIpAkleO90cNhZ1F+Q7FI=;
 b=R6NzJInUDzvyAH6OjHNQyXNBz5I3lPSPld+38tRw3ZofHFLtLWDHEkYA
 148tqNHiYeEcYEpO8mmwS5UT+2IySdIAxj9BhFnSi85j2jO1z1ZAkmlga
 iDWsvDVGeWAIcX5I2tgdUO8oMLw1PrFejkS3jEdtzYMl8okfwtVgKeirO
 DstB9apE0TR/tCzK5CLjb84tExA1By3LiRg/O3TNM/ekEyyDQMjIwrPHu
 BBY2MZxk5sPl73yN2/aa+qR3k6tEcgzFOfkH+Ygmwml7TDZXZBCsdbZci
 bD36N4xYwGdHdh7bOoWTrvXfk4OoVomi+BbgxU4ZlDkPYxmG/3idW2mzM Q==;
X-CSE-ConnectionGUID: f3KFHIvGTvykaECfZCHwWQ==
X-CSE-MsgGUID: rNK+nZWsTRK+dLa6YHdvHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106789560"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="106789560"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 06:16:55 -0700
X-CSE-ConnectionGUID: 6ScAY6z4R2yG7H68ugQBPg==
X-CSE-MsgGUID: AVML1GyrTt+yJt1CLJZ18A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="269252827"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.3])
 ([172.28.182.3])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 06:16:54 -0700
Message-ID: <6e21f3b3-894e-4b26-9cde-963418766dc1@linux.intel.com>
Date: Tue, 8 Sep 2026 15:16:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] lib/igt_sriov_device: Add helper to get SR-IOV
 function name
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, piotr.piorkowski@intel.com
References: <20260907124658.613244-1-lukasz.laguna@intel.com>
 <20260907124658.613244-2-lukasz.laguna@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260907124658.613244-2-lukasz.laguna@intel.com>
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


On 9/7/2026 2:46 PM, Lukasz Laguna wrote:
> Introduce a helper to format SR-IOV function names. It returns "PF" for
> physical function and "VF%u" for virtual functions.
>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   lib/igt_sriov_device.c | 23 +++++++++++++++++++++++
>   lib/igt_sriov_device.h |  1 +
>   2 files changed, 24 insertions(+)
>
> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
> index 6c9fbdf70..392c80346 100644
> --- a/lib/igt_sriov_device.c
> +++ b/lib/igt_sriov_device.c
> @@ -61,6 +61,29 @@ const char *igt_sriov_func_str(unsigned int vf_num)
>   	return buf;
>   }
>   
> +/**
> + * igt_sriov_function_name - Get SR-IOV function name
> + * @vf_num: VF number (1-based to identify single VF) or 0 for PF
> + * @buf: buffer
> + * @size: size of the buffer
> + *
> + * It formats the function name as "PF" when @vf_num is 0, or as "VF%u"
> + * when @vf_num is greater than 0.
> + *
> + * Return: formatted function name.
> + */
> +const char *igt_sriov_function_name(unsigned int vf_num, char *buf, size_t size)
> +{
> +	int n;
> +
> +	n = vf_num ? snprintf(buf, size, "VF%u", vf_num) :
> +		     snprintf(buf, size, "PF");
> +
> +	igt_assert(n >= 0 && (size_t)n < size);
> +
> +	return buf;
> +}
> +

NIT: We already have igt_sriov_func_str(), although it relies on a 
thread-local buffer.

Would it make sense to factor the formatting into a helper,

with lower- and uppercase wrappers, for example:

static const char *sriov_function_name(unsigned int vf_num, bool uppercase,
                        char *buf, size_t size)
{
     int ret;

     igt_assert(buf && size);

     if (vf_num)
         ret = snprintf(buf, size, uppercase ? "VF%u" : "vf%u", vf_num);
     else
         ret = snprintf(buf, size, "%s", uppercase ? "PF" : "pf");

     igt_assert(ret >= 0 && (size_t)ret < size);

     return buf;
}

const char *igt_sriov_function_name_lower(unsigned int vf_num,
                       char *buf, size_t size)
{
     return sriov_function_name(vf_num, false, buf, size);
}

const char *igt_sriov_function_name_upper(unsigned int vf_num,
                       char *buf, size_t size)
{
     return sriov_function_name(vf_num, true, buf, size);
}

igt_sriov_func_str() could initially remain as a compatibility wrapper

around the lowercase helper, with migrating its callers left for a 
follow-up.

--

marcin

>   static bool __pf_attr_get_u32(int pf, const char *attr, uint32_t *value)
>   {
>   	int sysfs;
> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
> index 4e4ba230a..a969d4172 100644
> --- a/lib/igt_sriov_device.h
> +++ b/lib/igt_sriov_device.h
> @@ -36,6 +36,7 @@ bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num);
>   bool igt_sriov_device_reset(int pf, unsigned int vf_num);
>   bool intel_is_vf_device(int device);
>   const char *igt_sriov_func_str(unsigned int vf_num);
> +const char *igt_sriov_function_name(unsigned int vf_num, char *buf, size_t size);
>   typedef void (*igt_sriov_exit_cleanup_fn)(int pf, int sig, void *user_data);
>   void igt_sriov_install_exit_handler(int pf,
>   				    igt_sriov_exit_cleanup_fn cleanup_fn,
