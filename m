Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B766ECAC5B0
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 08:50:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6615D88F94;
	Tue, 23 Sep 2025 08:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W0nJlFjd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0D210E06E
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 08:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758617403; x=1790153403;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3ra1aeT+LfJAmrOBkA/lz6rLdcT1WIIgXkeLodAXX/k=;
 b=W0nJlFjdewz9rNUV8K42Y2lbp05wh///HBg5OKNkQ7Avvi3a2x2om/zZ
 VbV1lW2naNazVuhnEkdnV+OrChlmcPnNQEW/zJGr42bwDJZJSFf9TT1wO
 7m547SAATD5XCRvK32VURpsJNq6H0LZAPEpTuA6biLx832aD6owGWcWK7
 7YChfMjODYOz2H+r+v6NEvQqPGceBkoLG1PvLIkzyE2j4XUWT3IrKKf1d
 M9K190VZK70CUt1IPi9odDDfr1q2kCDxwVOfPNCZjDXHGidBtbJdxcoAW
 lNjDcrI+0iEPUnYFqgKqidn3ZWrjSJx66A5EOD0k0qyTjJ6nTQw1Z3TJW g==;
X-CSE-ConnectionGUID: i+piwP8gRIu6RxVSh7Npyw==
X-CSE-MsgGUID: j0b5RbOfSXKNYOUgfzRxBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="63520487"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="63520487"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 01:50:03 -0700
X-CSE-ConnectionGUID: rM27iGN6QR2qU5qCzs1Eiw==
X-CSE-MsgGUID: uhf6pqzGRsCnowDAdtsBMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="200411060"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.31])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 01:50:01 -0700
Date: Tue, 23 Sep 2025 10:49:58 +0200
From: Pawel Sikora <pawel.sikora@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Pawel Sikora <pawel.sikora@intel.com>
Subject: Re: [PATCH i-g-t] README: refer to lastest software version
Message-ID: <20250923084958.bx6xeuvxxuuwabd2@pawelsik-desk>
References: <20250923083136.16576-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250923083136.16576-1-kamil.konieczny@linux.intel.com>
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

Hi,

LGTM.

Reviewed-by: Pawel Sikora <pawel.sikora@intel.com>

Regards,
Paweł

On Tue, Sep 23, 2025 at 10:31:36AM +0200, Kamil Konieczny wrote:
> When talking about most recent source use 'version' word.
> 
> Cc: Pawel Sikora <pawel.sikora@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  README.md | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/README.md b/README.md
> index ed6647726..c0382ce43 100644
> --- a/README.md
> +++ b/README.md
> @@ -13,7 +13,7 @@ complicated build procedures or specific testing environments to get useful
>  results. Therefore, IGT GPU Tools includes low-level tools and tests
>  specifically for development and testing of the DRM Drivers.
>  
> -Generated documentation for the latest master is published under
> +Generated documentation for the latest version is published under
>  <https://drm.pages.freedesktop.org/igt-gpu-tools/>.
>  
>  
> @@ -29,7 +29,7 @@ install the dependencies, e.g.:
>      # dnf builddep igt-gpu-tools
>  
>  But keep in mind that this may be slightly outdated and miss some
> -recently added dependencies for building the current master.
> +recently added dependencies for building the current version.
>  
>  
>  Building
> @@ -113,7 +113,7 @@ IGT is packed into nifty docker-compatible containers for ease of execution
>  and to avoid having to install all the dependencies. You can use
>  podman/docker to to run it on your system.
>  
> -Oneliner to get you started with the latest master:
> +Oneliner to get you started with the latest version:
>  
>      # podman run --rm --privileged registry.freedesktop.org/drm/igt-gpu-tools/igt:master
>  
> -- 
> 2.51.0
> 
