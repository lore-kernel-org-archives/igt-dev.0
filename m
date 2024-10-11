Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CBDCFD2E0
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 08:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6300310EA87;
	Fri, 11 Oct 2024 08:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rc9smud/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE32910EA87
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 08:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728636417; x=1760172417;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mtQnt/M5sUDSrbE7G1jTJnBRIVdj80ln+85zr2RYwH8=;
 b=Rc9smud/LaKQn4oIBQXyYjzziopRuedO6GIFMyuAe6dq0MWf/Ii6fsfw
 FOZ1OwxZsGAfMnwlhZ3a9/SZSnfu7mxTcvpjz1kl4nW6xCyLHeE2ihqfl
 QodKJk1qztvaQ/OGk+fxZdvJqVGouM+b0QqZM6KFKBfYAdTCpBh+VmMF0
 6AUi1ZJco9ohL19xI5mMdwIDE6qEV1pRUk7NiNeGj0gHYTCcJAIiIzYLD
 cPP9sFxpuzU+YUQZaaA5T9W2BB7m2e3M9cIxOvSQ5hsg703sObnVHrM6r
 XDwsnsWEgZT/Z/I//j6nvvErqI3i5RSYxw8W8s8eRy2hz2bZKhGuBonKM A==;
X-CSE-ConnectionGUID: GAy7R+WkTjaAm7RnRwbP9Q==
X-CSE-MsgGUID: r+mvzjBBTMmWSMybJxcAPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28170527"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="28170527"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 01:46:57 -0700
X-CSE-ConnectionGUID: gAnIarKGTAuYRrR4mCZhHw==
X-CSE-MsgGUID: 3vcUdq1wQ7KeXggNCsPvDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="107709342"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 01:46:56 -0700
Date: Fri, 11 Oct 2024 10:46:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t 3/4] lib/intel: MI_STORE_DWORD doesn't need secure
 batches on i965
Message-ID: <20241011084653.jzl2rc7p6jwoack2@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>
References: <20241002104515.32164-1-ville.syrjala@linux.intel.com>
 <20241002104515.32164-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241002104515.32164-3-ville.syrjala@linux.intel.com>
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
On 2024-10-02 at 13:45:14 +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Limit the MI_STORE_DWORD secure batch usage to just g4x and ilk.
> i965 does not need this.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>


> ---
>  lib/igt_gt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/igt_gt.c b/lib/igt_gt.c
> index a1075e8bbed1..b8faf2b7bd09 100644
> --- a/lib/igt_gt.c
> +++ b/lib/igt_gt.c
> @@ -704,6 +704,7 @@ bool gem_store_dword_needs_secure(int fd)
>  
>  	switch (info->graphics_ver) {
>  	case 4:
> +		return info->is_eaglelake || info->is_cantiga;
>  	case 5:
>  		return true;
>  	default:
> -- 
> 2.45.2
> 
