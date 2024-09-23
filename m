Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41DECF9C69
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 11:53:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4CF10E1D0;
	Mon, 23 Sep 2024 11:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XDzSVqKB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EAA10E1D0
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 11:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727092429; x=1758628429;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=KfO3zPntHVM9n1S5t6+brVNhN66Bw4JsxmQRzCdS8dY=;
 b=XDzSVqKBhKCj9TFNYPCU42jiWPgyTAs1Pki01z6FzR4hnReodnRWdHmT
 iqexO0h3K9nx+efqprscK8BOFoP98P5Xbc+E01UicGU1FqIX6jZrsiCzW
 2PEvFPQyHCkmYPPPflXMD3v339TNhsCT/1/ODgBPSSAO2GAgfChItqbF/
 wwv5oQOaItb7PMhB65FW8CXBlj6n3XTXkvcA2bVsWwJ/eAaOIQovFYWW2
 xaVZQXAo5gNl4sTPiD2Z2zW3W7WDFRWncNGwxPetAyalXOXKtWS8o2NkI
 Tdn7mqc3qEJU2jyuGJKEZlGH6VW5oSYtaHq3TTb+hQc1Umf7eSnMR/tDI g==;
X-CSE-ConnectionGUID: y2YKj4A4QuuDlPDURNYWvg==
X-CSE-MsgGUID: SozcY3QxQ8y9eHSPXx417A==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25552902"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="25552902"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 04:53:49 -0700
X-CSE-ConnectionGUID: P/SEXH1xT/SPtWMjlFVb3A==
X-CSE-MsgGUID: gLg9/H9NSaqJ7NI/m9aI/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="101785598"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 04:53:48 -0700
Date: Mon, 23 Sep 2024 14:54:13 +0300
From: Imre Deak <imre.deak@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 5/7] lib/igt_kms.c: refactor parse_path_connector
Message-ID: <ZvFW5bKFREEA0u7Z@ideak-desk.fi.intel.com>
References: <20240922212549.1361889-1-kunal1.joshi@intel.com>
 <20240922212549.1361889-6-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240922212549.1361889-6-kunal1.joshi@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Mon, Sep 23, 2024 at 02:55:47AM +0530, Kunal Joshi wrote:
> Use strdup() to make a copy of connector_path
> before passing it to strtok(), so the original
> string remains unmodified
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 96da33a48..3d2a88b76 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6670,10 +6670,10 @@ static int parse_path_connector(char *connector_path)
>  {
>  	int connector_id;
>  	char *encoder;
> +	char *connector_path_copy = strdup(connector_path);
>  
> -	encoder = strtok(connector_path, ":");
> +	encoder = strtok(connector_path_copy, ":");
>  	igt_assert_f(!strcmp(encoder, "mst"), "PATH connector property expected to have 'mst'\n");

The copy is leaked, sould be freed. This doesn't look like a refactor,
rather a fix, the commit subject should reflect that. With these fixed:

Reviewed-by: Imre Deak <imre.deak@intel.com>

> -
>  	connector_id = atoi(strtok(NULL, "-"));
>  
>  	return connector_id;
> @@ -6688,13 +6688,11 @@ static int parse_path_connector(char *connector_path)
>  int igt_get_dp_mst_connector_id(igt_output_t *output)
>  {
>  	int connector_id;
> -	char *connector_path;
>  
>  	if (!igt_check_output_is_dp_mst(output))
>  		return -EINVAL;
>  
> -	connector_path = output->config.connector_path;
> -	connector_id = parse_path_connector(connector_path);
> +	connector_id = parse_path_connector(output->config.connector_path);
>  
>  	return connector_id;
>  }
> -- 
> 2.43.0
> 
