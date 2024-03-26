Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552D7C54E67
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 05:19:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91F310ECAC;
	Tue, 26 Mar 2024 05:19:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R60jokIz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39C410ECAC
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 05:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711430383; x=1742966383;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Q2id0eRqFioI/JkrdJzaeJJVaUcktngE4/G2On+b6ME=;
 b=R60jokIz52mmxKwYCLgKMXJapfqT+5MZvwE++jccPnnN7zx9Os/IKh7R
 7+r59YUpDFXRCwQIpCcws4/xlt/wKlAnWHpn7TZ9XUBTeYAyjvIwVK36G
 x3qrF66iA1KjJvTub0TVjWtqI50HGqLkxL4xVwcYBAE3A6sikdpy7cIou
 xWNBzvzT2fDDO0IAxNrGWvTkdCNUuywpYpLU4k/pzlN4SJNiyHxbRi37B
 nxceIT9lUPAsxxfj0iCShQokOpc1/xGiJNQ4wBb3zM/LDdib572cbOUcr
 D+Ppa3ast0glCNQWqZMyx8MB9tXt5lSfNdhaSY6ifNAoS4/QFfLQDqCy1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6329800"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6329800"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 22:19:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="20527899"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.33])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 22:19:40 -0700
Date: Tue, 26 Mar 2024 06:19:37 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v1 1/3] drm-uapi/xe_drm: Read flat ccs value from
 drm_xe_query_config
Message-ID: <20240326051937.d62ix7ni6sbbdbjx@zkempczy-mobl2>
References: <cover.1711444735.git.akshata.jahagirdar@intel.com>
 <64b587ec51ad3f803ec51afc32f894f05761aadd.1711444735.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64b587ec51ad3f803ec51afc32f894f05761aadd.1711444735.git.akshata.jahagirdar@intel.com>
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

On Tue, Mar 26, 2024 at 02:54:36AM -0700, Akshata Jahagirdar wrote:
> Add an additional drm_xe_query_config_flag for reading the value
> of flat_ccs of the platform.
> This can be used in respective igt testcases.
> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 4353595a4..b43c8cf76 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -389,6 +389,8 @@ struct drm_xe_query_mem_regions {
>   *
>   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>   *      has usable VRAM
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_FLAT_CCS - Flag is set if the device
> + *      has flat ccs enabled
>   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>   *    required by this device, typically SZ_4K or SZ_64K
>   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> @@ -405,6 +407,7 @@ struct drm_xe_query_config {
>  #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>  #define DRM_XE_QUERY_CONFIG_FLAGS			1
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_FLAT_CCS	(1 << 1)

May you point me out which kernel patch includes this flag into
xe_query.c?

--
Zbigniew

>  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> -- 
> 2.34.1
> 
