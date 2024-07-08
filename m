Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA84C3271E
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jul 2024 06:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C584310E226;
	Mon,  8 Jul 2024 06:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lckdytvK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D11110E226
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jul 2024 06:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720421896; x=1751957896;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KdVJ3k7gDAMAVq9vMcf3mWXrS3ssldD6wUsiqa3ZQEU=;
 b=lckdytvKPPQ5JitReF2dGAaxKS9Wpc7Ecsm9SL3FIpRrEAI4BUv0AyS2
 JZmXgSDLlXZEV3rfz3Rj8ZWPEgGmKgUPsAeNDWUIYVhGEHPK/buGL6gI6
 Yz4/fpiFX3G/8Rm5whEbPOYoWkhO8GIA0y031txUFnQWxXpkO8C+TIlQz
 8wijGLfFXeapk8b8ZIggj8TynMWuuJJnUuvhv2M/4vaZQCySwd8NZwNNu
 FpaKM3iTKMAPHhEK0JhQPJ6QlHd1jGWnCXlKaKBGE0YMK4pLi076NexcK
 owB4KR951g60eb5fUuvsfugTNZ7Z/PI/EK4Qy3TofkV0y5AQkSSuOPBmH Q==;
X-CSE-ConnectionGUID: 9TecURsLTfaRudi+K9P+qQ==
X-CSE-MsgGUID: qzbWNuGGTS+Q/c4b/YlFGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="21418598"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="21418598"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 23:58:16 -0700
X-CSE-ConnectionGUID: zXWDN3ltSoWUdfLAon7mbg==
X-CSE-MsgGUID: h3uq/Z/lTfKL9/3AP752cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="52603473"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.237])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 23:58:14 -0700
Date: Mon, 8 Jul 2024 08:58:11 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 michal.wajdeczko@intel.com
Subject: Re: [PATCH i-g-t] lib/igt_device_scan: Skip attributes in
 subdirectories
Message-ID: <20240708065811.6uu7tahrzkoysojp@zkempczy-mobl2>
References: <20240704164437.1543161-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240704164437.1543161-1-marcin.bernatowicz@linux.intel.com>
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

On Thu, Jul 04, 2024 at 06:44:37PM +0200, Marcin Bernatowicz wrote:
> Skip attributes in subdirectories as they are not used for filtering.
> This change improves speed and reduces the impact of non-DRM related
> component bugs on testing, such as ASPM issues.
> 
> Rename function is_on_blacklist to is_on_blocklist to promote more
> inclusive language.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>  lib/igt_device_scan.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 9a2da3d62..6473ca7ad 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -433,7 +433,7 @@ static enum dev_type __pci_devtype(uint16_t vendor, uint16_t device, const char
>  /* Reading sysattr values can take time (even seconds),
>   * we want to avoid reading such keys.
>   */
> -static bool is_on_blacklist(const char *what)
> +static bool is_on_blocklist(const char *what)
>  {
>  	static const char *keys[] = { "config", "modalias", "modes",
>  				      "resource",
> @@ -442,16 +442,18 @@ static bool is_on_blacklist(const char *what)
>  				      "resource0_wc", "resource1_wc", "resource2_wc",
>  				      "resource3_wc", "resource4_wc", "resource5_wc",
>  				      "uevent", NULL};
> -	const char *key;
> -	int i = 0;
> +	const char **key;
>  
>  	if (what == NULL)
>  		return false;
>  
> -	while ((key = keys[i++])) {
> -		if (strcmp(key, what) == 0)
> +	/* Skip attributes in subdirectories */
> +	if (strchr(what, '/') != NULL)
> +		return true;

As we already drop some attributes I have nothing against further
list expanding. I've checked what attributes I see on 'lsgpu -p'
on devices I have an access to and it is mostly 'power/*'. Only
doubt I have is if someone is using this for its scripting but
we can revert this change then.

So from me:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew


> +
> +	for (key = keys; *key; key++)
> +		if (strcmp(*key, what) == 0)
>  			return true;
> -	}
>  
>  	return false;
>  
> @@ -553,7 +555,7 @@ static void get_attrs(struct udev_device *dev, struct igt_device *idev)
>  		const char *key = udev_list_entry_get_name(entry);
>  		const char *value;
>  
> -		if (is_on_blacklist(key)) {
> +		if (is_on_blocklist(key)) {
>  			entry = udev_list_entry_get_next(entry);
>  			continue;
>  		}
> -- 
> 2.31.1
> 
