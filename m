Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDA4CD5BA4
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 11:23:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA3710F2E8;
	Thu, 21 May 2026 11:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJZ5xBjK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8313D10F2E8
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 11:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779362604; x=1810898604;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=yHt5U+mmMJpNt+a3NXRqgrVhfHT4zNn9JoQZ4t8S1X8=;
 b=nJZ5xBjKvLlUCuDzBe+I0+PaG7x24hxvPXBMEBLkPgr8dIlbWM2tA5wM
 8N8I4MTHPTZo7nJSGmiTAG3JAn3WGFh+Kg5SbIFEJPOqI+8K2n6hiK8CA
 BL4L97OKYLKOBbKMdYm/bzscvIADJt/EUmN9gJriqp4WNo08SHHh5G0tv
 pCqoycynlf51370rIE07shMhh5/ji2QnHrzaxLS8LKRU/DSJNXbK5w2l9
 B07+tjRw9pe6IpkvetqmKTZYDpKVJQqGLMjsKTqg7MOrTG8xJRuKyCdnr
 kh5RtQXdz+3H9fTW+u0bCXqGr60SK3zAmnXOZKeLHVmUD8McJXYOAJkqS g==;
X-CSE-ConnectionGUID: svwfOM1JToqmuF2TdaNHXg==
X-CSE-MsgGUID: dZ1mB3rVQw2nxJjxg62Npw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80243660"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="80243660"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 04:23:23 -0700
X-CSE-ConnectionGUID: qTIn/5OAQD6BbVi5hkPH1g==
X-CSE-MsgGUID: x8NlqCg8Que2IJLSFVFWww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="264023794"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.189])
 ([172.28.182.189])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 04:23:22 -0700
Message-ID: <9522b4af-c054-451f-b6f5-b2cd98a86d6a@linux.intel.com>
Date: Thu, 21 May 2026 13:23:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tools/vmtb: Adjust BMG vGPU profile
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260521092256.619556-1-adam.miszczak@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260521092256.619556-1-adam.miszczak@linux.intel.com>
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


On 5/21/2026 11:22 AM, Adam Miszczak wrote:
> Reduce VRAM allocated for 1xVF vGPU profile for BMG (VRAM 12GB)
> as the original value is too agressive and causes provisioning error.
>
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   .../vmtb/vmm_flows/resources/vgpu_profiles/Bmg_g21_12.json  | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tools/vmtb/vmm_flows/resources/vgpu_profiles/Bmg_g21_12.json b/tools/vmtb/vmm_flows/resources/vgpu_profiles/Bmg_g21_12.json
> index 75ca907ab..1b2e6111d 100644
> --- a/tools/vmtb/vmm_flows/resources/vgpu_profiles/Bmg_g21_12.json
> +++ b/tools/vmtb/vmm_flows/resources/vgpu_profiles/Bmg_g21_12.json
> @@ -1,5 +1,5 @@
>   {
> -    "version": "1.2",
> +    "version": "1.3",
>       "PFResources": {
>           "Default": "MinimumPFResources",
>           "Profile": {
> @@ -17,8 +17,8 @@
>           "Profile": {
>               "Bmg_12": {
>                   "VFCount": 1,
> -                "LocalMemoryEccOff": 12717129728,
> -                "LocalMemoryEccOn": 12717129728,
> +                "LocalMemoryEccOff": 12616466432,
> +                "LocalMemoryEccOn": 12616466432,
>                   "Contexts": 1024,
>                   "Doorbells": 240,
>                   "GGTTSize": 4026531840
LGTM, Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
