Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB35C021AA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 22:39:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24E110E8A7;
	Wed, 19 Feb 2025 22:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dc8s6ABs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E601D10E8A7
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 22:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740004790; x=1771540790;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=5Wba530Kh/Ei0yFKKRXPav1CbzOTI2Zzu0BEMYSBwII=;
 b=Dc8s6ABsuDX65DP0uN7+Q911CWguTQHkh/oLIjLiNY5X+AZKt0xlyNny
 TS1O3bbahNHqYUDm7kCIl3JU+6HYRvW0BzxQtgznSH8Z3x6YIu9H2qvA8
 101R06N6QTntuZWE6wM1eM4y/UTcBHmpfg+L9c1KJXI9yhP0FDI3zg8W/
 5UcjfFjGlTuggtXCpCV6k3gI3m+TnT7yyS+jrCoy5dJ4PlK8F2yPbaUn+
 Yok/e1J/h5DDMuQsYpBZj9QU9iwsv0bGq5y7GWZftTRQbe2wlGnNKtsnE
 2KmfJA/MOecgHCeKsPReyP1NWRgmqUY95Us+TNuo1BEdJ5MBuBXBOpOCc Q==;
X-CSE-ConnectionGUID: 84+C+zLuS+2cY67e7x1Plw==
X-CSE-MsgGUID: NBBfO0BXTbqMkSIMWAos2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44681380"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="44681380"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 14:39:49 -0800
X-CSE-ConnectionGUID: zQTaXEDCRd2O3nHSL4h4AA==
X-CSE-MsgGUID: Ckw+GhHLQrO+RBTSsWWR0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="114687929"
Received: from gargmani-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.124.221.131])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 14:39:49 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250217133229.104948-1-kamil.konieczny@linux.intel.com>
References: <20250217133229.104948-1-kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t] tools: rename lsfacts into igt_facts
From: Jordan Justen <jordan.l.justen@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jordan Justen <jljusten@debian.org>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Date: Wed, 19 Feb 2025 14:39:48 -0800
Message-ID: <174000478847.4281.6278758030250626912@jljusten-skl>
User-Agent: alot/0.11
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

Acked-by: Jordan Justen <jordan.l.justen@intel.com>

On 2025-02-17 05:32:29, Kamil Konieczny wrote:
> This is a follow up to GitLab issue 168 where name 'power' was
> a little too generic. Similarly, name lsfacts looks also a little
> too generic, so rename it into igt_facts.
>=20
> Cc: Jordan Justen <jljusten@debian.org>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tools/{lsfacts.c =3D> igt_facts.c} | 12 ++++++------
>  tools/meson.build                |  2 +-
>  2 files changed, 7 insertions(+), 7 deletions(-)
>  rename tools/{lsfacts.c =3D> igt_facts.c} (71%)
>=20
> diff --git a/tools/lsfacts.c b/tools/igt_facts.c
> similarity index 71%
> rename from tools/lsfacts.c
> rename to tools/igt_facts.c
> index bbe77717a..af3ea2a61 100644
> --- a/tools/lsfacts.c
> +++ b/tools/igt_facts.c
> @@ -7,12 +7,12 @@
>  #include "igt_facts.h"
> =20
>  /**
> - * SECTION:lsfacts
> - * @short_description: lsfacts
> - * @title: lsfacts
> - * @include: lsfacts.c
> + * SECTION:igt_facts
> + * @short_description: igt_facts
> + * @title: igt_facts
> + * @include: igt_facts.c
>   *
> - * # lsfacts
> + * # igtfacts
>   *
>   * Scan for igt-facts and print them on screen. Indicate if no facts are=
 found.
>   */
> @@ -20,7 +20,7 @@ int main(int argc, char *argv[])
>  {
>         igt_facts_lists_init();
> =20
> -       igt_facts("lsfacts");
> +       igt_facts("igt_facts");
> =20
>         if (igt_facts_are_all_lists_empty())
>                 igt_info("No facts found...\n");
> diff --git a/tools/meson.build b/tools/meson.build
> index f091af380..1dfe1f839 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -12,6 +12,7 @@ foreach prog : tools_progs_noisnt
>  endforeach
> =20
>  tools_progs =3D [
> +       'igt_facts',
>         'igt_power',
>         'igt_stats',
>         'intel_audio_dump',
> @@ -43,7 +44,6 @@ tools_progs =3D [
>         'intel_gem_info',
>         'intel_gvtg_test',
>         'dpcd_reg',
> -       'lsfacts',
>         'lsgpu',
>  ]
>  tool_deps =3D igt_deps
> --=20
> 2.48.1
>
