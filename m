Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5C5606BF06
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 09:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IHu8aipv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5449310EF02;
	Tue, 10 Nov 2026 09:49:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8125110EEEF
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 09:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794304132; x=1825840132;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Euu91d0OLe5d2jZU0QArcfmIDH8kbwUP/ZpeMW0g4VM=;
 b=IHu8aipvsgkiA9VuHek6PFh69VE1dEpsfO/wLSecVwRD0Kp28yob3wWg
 XVZlD3UyKBgrUqtHKBkUeUZg2A6ApgmpX6HXZKKc3QMs7Xwlind+M5fDg
 IToe8ZlFQI53sVRIHDdLffr5I5Kn809fVtgbRLLh4WXE14IRI/11ovNpN
 XODiYckUdJwOFIcW7HDgDWaYdAssHVKzIhjb2VmUTF4tnSKs+M+zubYE+
 oYCvJIWb7myti5NdBGgLH/DueLxF91yqO816o+27VSDKjO9rnPs+XRz/O
 bLuNhrR32gEYNGl8VmUQ1xRIUxSukTFpgXuekRdqW0oTnFIU92kqhg57j g==;
X-CSE-ConnectionGUID: /9hnlz0OR3eCQK4rSAM6aw==
X-CSE-MsgGUID: ockGn+E0SKuafGJmnevN+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3070576"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3070576"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 01:48:51 -0800
X-CSE-ConnectionGUID: TCjIsnUkTJC5poW3AwznBg==
X-CSE-MsgGUID: /Y5IH2UYQcGZKkklraJF8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8693538"
Received: from unknown (HELO [172.28.182.154]) ([172.28.182.154])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 01:48:50 -0800
Message-ID: <a8f45efb-d8d1-41c0-8314-67d60a9b548b@linux.intel.com>
Date: Tue, 10 Nov 2026 10:48:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] lib/igt_sriov_device: Add helpers to get SR-IOV
 function name
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, piotr.piorkowski@intel.com
References: <20261110082838.2034264-1-lukasz.laguna@intel.com>
 <20261110082838.2034264-2-lukasz.laguna@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20261110082838.2034264-2-lukasz.laguna@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

LGTM,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

On 11/10/2026 9:28 AM, Lukasz Laguna wrote:
> Introduce helpers to format SR-IOV function names in lowercase and
> uppercase variants. They format PF as "pf" or "PF" and VFs as "vf%u" or
> "VF%u" depending on the variant.
>
> Keep igt_sriov_func_str() as a compatibility wrapper around the
> lowercase, so existing callers continue to work while the code migrates
> to the new API.
>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   lib/igt_sriov_device.c | 53 +++++++++++++++++++++++++++++++++++++++---
>   lib/igt_sriov_device.h |  2 ++
>   2 files changed, 52 insertions(+), 3 deletions(-)
>
> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
> index 6c9fbdf70..de446aca1 100644
> --- a/lib/igt_sriov_device.c
> +++ b/lib/igt_sriov_device.c
> @@ -54,13 +54,60 @@ const char *igt_sriov_func_str(unsigned int vf_num)
>   {
>   	static __thread char buf[16];
>   
> -	if (vf_num == 0)
> -		return "pf";
> +	return igt_sriov_function_name_lower(vf_num, buf, sizeof(buf));
> +}
> +
> +static const char *sriov_function_name(unsigned int vf_num, bool uppercase,
> +				       char *buf, size_t size)
> +{
> +	int ret;
> +
> +	igt_assert(buf && size);
> +
> +	if (vf_num)
> +		ret = snprintf(buf, size, uppercase ? "VF%u" : "vf%u", vf_num);
> +	else
> +		ret = snprintf(buf, size, uppercase ? "PF" : "pf");
> +
> +	igt_assert(ret >= 0 && (size_t)ret < size);
>   
> -	snprintf(buf, sizeof(buf), "vf%u", vf_num);
>   	return buf;
>   }
>   
> +/**
> + * igt_sriov_function_name_lower - Get SR-IOV function name in lowercase
> + * @vf_num: VF number (1-based to identify single VF) or 0 for PF
> + * @buf: buffer
> + * @size: size of the buffer
> + *
> + * It formats the function name as "pf" when @vf_num is 0, or as "vf%u"
> + * when @vf_num is greater than 0.
> + *
> + * Return: formatted function name.
> + */
> +const char *igt_sriov_function_name_lower(unsigned int vf_num, char *buf,
> +					 size_t size)
> +{
> +	return sriov_function_name(vf_num, false, buf, size);
> +}
> +
> +/**
> + * igt_sriov_function_name_upper - Get SR-IOV function name in uppercase
> + * @vf_num: VF number (1-based to identify single VF) or 0 for PF
> + * @buf: buffer
> + * @size: size of the buffer
> + *
> + * It formats the function name as "PF" when @vf_num is 0, or as "VF%u"
> + * when @vf_num is greater than 0.
> + *
> + * Return: formatted function name.
> + */
> +const char *igt_sriov_function_name_upper(unsigned int vf_num, char *buf,
> +					 size_t size)
> +{
> +	return sriov_function_name(vf_num, true, buf, size);
> +}
> +
>   static bool __pf_attr_get_u32(int pf, const char *attr, uint32_t *value)
>   {
>   	int sysfs;
> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
> index 4e4ba230a..0e94c521a 100644
> --- a/lib/igt_sriov_device.h
> +++ b/lib/igt_sriov_device.h
> @@ -36,6 +36,8 @@ bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num);
>   bool igt_sriov_device_reset(int pf, unsigned int vf_num);
>   bool intel_is_vf_device(int device);
>   const char *igt_sriov_func_str(unsigned int vf_num);
> +const char *igt_sriov_function_name_lower(unsigned int vf_num, char *buf, size_t size);
> +const char *igt_sriov_function_name_upper(unsigned int vf_num, char *buf, size_t size);
>   typedef void (*igt_sriov_exit_cleanup_fn)(int pf, int sig, void *user_data);
>   void igt_sriov_install_exit_handler(int pf,
>   				    igt_sriov_exit_cleanup_fn cleanup_fn,
