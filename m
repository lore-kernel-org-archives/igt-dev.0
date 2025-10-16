Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BA4CCD199
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 14:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3FDC10E9F7;
	Thu, 16 Oct 2025 14:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jKxrlW9j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAAA610E9F7
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 14:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760625659; x=1792161659;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=15MPxhTiFyeZGQRU50C9CZvJ6k/ZTEDz6fP7GissuSc=;
 b=jKxrlW9jQHRfx1R1TxOTQWcIJQtRr4kBiVOMiW9g57ArASagV3ctOlqR
 Y+jEm+yB82c/yygj6MO8fTK59vD2b8eVcAaekhoq5+nTHiHYmPqZ1QyrR
 rxjXn3adjyvwTy4XRMFKYkiUvQLxZZUqRkDcoxJLmD9X5EuPgtX6cH/HA
 IFZOjhxrTSWQyQ1OcGkA9z+rK9ADt9TFObk4W8dSQF1p4VYn9ek6MZsPY
 P2RFhFcQFzZpshC5MCamMQ420tUdpaeGjW/+xMR65Dt4ruqm2JYg1nQUP
 A6nk1P7srPp2Ruiob283qDEIy45woCBAFtLrVrylLXKtu/fgv9vJgNfPb Q==;
X-CSE-ConnectionGUID: /GVYSBkVSQyzWIINW9oBHQ==
X-CSE-MsgGUID: 790CTUQSR96j3YTe1dkL9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62720286"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62720286"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 07:40:58 -0700
X-CSE-ConnectionGUID: 0WXskeYbQ2SPZ00viz0m+Q==
X-CSE-MsgGUID: 3bX1rSVPRYeLxDW4pRVR9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183269865"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 07:40:56 -0700
Date: Thu, 16 Oct 2025 16:40:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t 5/6] tests/kms_content_protection: Add MediaTek
 device support
Message-ID: <20251016144053.3wbjvkfujo74tf76@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 igt-dev@lists.freedesktop.org, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
 <20251012171459.3773990-6-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251012171459.3773990-6-jason-jh.lin@mediatek.com>
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

Hi Jason-JH,
On 2025-10-13 at 01:13:15 +0800, Jason-JH Lin wrote:
> Add is_mtk_device() check and support for reading
> "mtk_hdcp_sink_capability" from debugfs to enable HDCP tests on
> MediaTek platforms. Add "SDC" to the HDCP panel blocklist for
> improved compatibility. Also, mark outputs with no EDID sink name
> as test exempt to avoid unnecessary failures.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  tests/kms_content_protection.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 51fc1d3be99f..2620631a62d7 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -141,6 +141,7 @@ __u8 facsimile_srm[] = {
>   */
>  static const char *const hdcp_blocklist[] = {
>  	"DPF90435", /* Example monitor name */
> +	"SDC",
>  	/* Add more monitor names here as needed */
>  };

I am not sure if this should be a separate patch,
Karthik or Swati could you look into this?

>  
> @@ -509,6 +510,8 @@ static bool sink_hdcp_capable(igt_output_t *output)
>  	 */
>  	if (is_intel_device(data.drm_fd))
>  		debugfs_read(fd, "i915_hdcp_sink_capability", buf);
> +	else if (is_mtk_device(data.drm_fd))
> +		debugfs_read(fd, "mtk_hdcp_sink_capability", buf);
>  	else
>  		debugfs_read(fd, "hdcp_sink_capability", buf);
>  
> @@ -531,6 +534,8 @@ static bool sink_hdcp2_capable(igt_output_t *output)
>  	/* FIXME: XE specific debugfs as mentioned above. */
>  	if (is_intel_device(data.drm_fd))
>  		debugfs_read(fd, "i915_hdcp_sink_capability", buf);
> +	else if (is_mtk_device(data.drm_fd))
> +		debugfs_read(fd, "mtk_hdcp_sink_capability", buf);
>  	else
>  		debugfs_read(fd, "hdcp_sink_capability", buf);
>  
> @@ -617,6 +622,12 @@ static bool is_output_hdcp_test_exempt(igt_output_t *output)
>  
>  	drmModeFreePropertyBlob(edid_blob);
>  
> +	/* Not all monitors have sink names */
> +	if (sink_name[0] == '\0') {
> +		igt_debug("no sink name\n");
> +		return true;
> +	}
> +

Please send this last hunk as a separate change, also
+cc Karthik and Swati.

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

>  	return igt_is_panel_blocked(sink_name, hdcp_blocklist, ARRAY_SIZE(hdcp_blocklist));
>  }
>  
> -- 
> 2.43.0
> 
