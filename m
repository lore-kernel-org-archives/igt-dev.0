Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7219FC88E53
	for <igt-dev@archiver.kernel.org>; Tue, 15 Sep 2026 09:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5EF10E59D;
	Tue, 15 Sep 2026 09:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A696j/+5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA21610E59D
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Sep 2026 09:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789464101; x=1821000101;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fdLkmTqsDKgpVdsBdpfbSKzFSkXbnt+FLdxnDNvUN0Q=;
 b=A696j/+5+kCI9AVrSGzGoS+REefwTXBtd+GegCSGoPpWomBZE7d+cBPR
 MeMMoX1rIC/697PuVC2mDNVEjgpzReshud7Ra/+pw2VAwScFtz8H9xLj0
 d2sbKMaxMwFLM+X3ESePQLM+zohJair94D9N4G7m2j+9I4YRYyk9rlWUL
 6WvP61wEB3AeLsv/RVSPH2p3scFxmx0YBD1wGWXtIu+cMGh/R8YX/NtRp
 TSX0yCiHzTOIG/KNpBaxMD8gr6T7FDBwMn33MO9r2CZ6jeU7cE1FxCzvs
 DohKB6xD/hKhRRPUjsFcNV5sFRhmZHfxjonJMCEB8+iK/6HZgJwsJLE+O w==;
X-CSE-ConnectionGUID: VcgGEu+JSRKii8Sf2s9rcw==
X-CSE-MsgGUID: HQLQ0DuJTZKlQ9jXJsJ/0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107332898"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="107332898"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 02:21:41 -0700
X-CSE-ConnectionGUID: rGhWGvfSTPGYi4BiJj4yFw==
X-CSE-MsgGUID: uIaDi+WsQUO4ZE/LO2MclQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="278189308"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.201])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 02:21:39 -0700
Date: Tue, 15 Sep 2026 11:21:28 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] man: Make man pages reproducible
Message-ID: <fftvju5sspzcnj4wecwl3umy2dqah4xzgox7mv5ncncrt7xvf6@oeugxfpcdrua>
References: <20260909111551.48722-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260909111551.48722-1-kamil.konieczny@linux.intel.com>
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

On Wed, Sep 09, 2026 at 01:15:51PM +0200, Kamil Konieczny wrote:
> Man pages are compressed by gzip and default options write to
> archive file a timestamp, which leads to different binaries when
> generated again after some time.   Do not save timestamp in
> archive and make building man pages reproducible.
> 
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/194
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

I wondered will -n --no-name won't break Arch fix:
https://gitlab.archlinux.org/archlinux/packaging/packages/intel-gpu-tools/-/commit/af6e5f6c1e6643914172b32d1d9bfa7a263b826c

but it's fine, so from me:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  man/rst2man.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/man/rst2man.sh b/man/rst2man.sh
> index b7f289910..f7afcab37 100755
> --- a/man/rst2man.sh
> +++ b/man/rst2man.sh
> @@ -14,4 +14,6 @@ cp "$input" "$out_dir"
>  ${rst2man} "$out_dir/$in_file" "${output%.gz}"
>  
>  rm -f "${output}"
> -gzip "${output%.gz}"
> +# Do not save timestamp in generated file, so it will be the same binary file
> +# when generated again after some time.
> +gzip --no-name "${output%.gz}"
> -- 
> 2.55.0
> 
