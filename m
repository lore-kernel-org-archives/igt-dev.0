Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AF4D2CDE6
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 15:52:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743DE10E15D;
	Tue, 22 Oct 2024 15:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TSyp2Fgx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2369310E15D
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 15:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729612355; x=1761148355;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mxizkX8rkTcXmCRXQWT/GITN+ymJ6djBKn/M6QEeksg=;
 b=TSyp2Fgxg+0KDO5La7kJXR12YCT/YWiPO8jf7rstgj7nsK8mtdnNY7K6
 emMrJCrq+jrHfjb1J/N0JoxJOfk3FpyioZNi2cr33TJLak9dbJjmOqduV
 9BKnmA+yKgjBIrNBH8seUaaOIyPOcqdk3csAb3waV2FM3SMAWMXUMnElq
 KxpSe0B9jDlBgbj7/XC7nmBtizbEJjvEVlup8S7Wb6W/6HZ4nmKTfDEYV
 AQyI94ZXzC5tLqMbBAssR2Mt9t+Dv+ial6yzPt0KTuGFeuJUz//LjHrhV
 KV5hV3OVsHIyIQexRy/fO/wENRXbIL6GGePHUb48zYrwO2f69HE9TpQ6E Q==;
X-CSE-ConnectionGUID: ZJzNsz1jS4Ok+YkUR6go2Q==
X-CSE-MsgGUID: 1p21UWMDTwejM6ENjq0IMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="28594283"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="28594283"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 08:52:35 -0700
X-CSE-ConnectionGUID: pSZ2jldhSlmMvMigBmhnGQ==
X-CSE-MsgGUID: yeuJOrJpRkSQW4iinpP7SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="79834919"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 08:52:33 -0700
Date: Tue, 22 Oct 2024 17:52:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t 13/14] lib/igt_aux: Add igt_ror() and igt_rol()
Message-ID: <20241022155231.mc7mgq5ouv5dl2hc@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
 <20241004104121.32750-14-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241004104121.32750-14-ville.syrjala@linux.intel.com>
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

Hi Ville,
On 2024-10-04 at 13:41:20 +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Add helpers to do bitwise rotate operatios.
> igt_rol(): bitwise rotate left
> igt_ror(): bitwise rotate right
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_aux.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/lib/igt_aux.h b/lib/igt_aux.h
> index 4b8116dc0998..bfd83adcacb9 100644
> --- a/lib/igt_aux.h
> +++ b/lib/igt_aux.h
> @@ -337,6 +337,13 @@ void pipewire_pulse_stop_reserve(void);
>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>  #define DIV_ROUND_CLOSEST(n, d) (((n) + (d) / 2) / (d))
>  
> +#define igt_rol(value, shift, size) \
> +	(((value) << (shift)) | \
> +	 ((value) >> ((size) - (shift))))
> +#define igt_ror(value, shift, size) \
> +	(((value) >> (shift)) | \
> +	 ((value) << ((size) - (shift))))
> +
>  uint64_t vfs_file_max(void);
>  
>  void *igt_memdup(const void *ptr, size_t len);
> -- 
> 2.45.2
> 
