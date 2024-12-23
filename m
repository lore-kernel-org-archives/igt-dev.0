Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4908EE7718B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Dec 2024 17:55:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0201B10E21C;
	Mon, 23 Dec 2024 17:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SFYZP3ta";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B7F10E21C
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Dec 2024 17:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734976548; x=1766512548;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=A2QsO+qv7M0mrDqAIap9lLhy3Bs9pJaNeQiA3ob+R48=;
 b=SFYZP3taZpypHUuVcI0gM1QT+sKokaKuyoxpxCqISfIO2blh7fJFPgj2
 2FnrpbuOZSO8sqXof4zRDgRFp7GaXehpFw90eeoExX1FMmM1HRJ91sJd9
 3BobxwrzXTwFCmvLj4X2e9oCEqn04I/KjYkEIGB39kjHyj/7Cjr8MHVpn
 D0YcRao9PKmQ64FWk7xf7FaGCcx9fRndafiOJspt9OuxodX4Vt4jonfaa
 QbIrWVUtqWeqQ41n+BN1HtjlpzfmAK8kUmbgSYBNPgzMbIQRKvqCJpNRK
 GknkYQTwge0JdgK4v7r7obX6CQix0Y76RLjX4m0UKc4gRBEdw8fsQijQ6 g==;
X-CSE-ConnectionGUID: oAX5a0mbQYaNdkkM7U39oA==
X-CSE-MsgGUID: 7dOf+fAXQvyV4M0zF82pjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="34756361"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; d="scan'208";a="34756361"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 09:55:48 -0800
X-CSE-ConnectionGUID: XBzoPueeR1aU3y8VOVEbXw==
X-CSE-MsgGUID: X6rCoh+YSjG5jaQ2YLQDgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103882737"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.74])
 ([10.245.246.74])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 09:55:46 -0800
Message-ID: <671d8f0c726448ee10e652719e89152ee9b411cc.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_live_ktest: Add xe_bo_shrink subtest
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Mon, 23 Dec 2024 18:55:44 +0100
In-Reply-To: <20241223180116.3857785-1-nirmoy.das@intel.com>
References: <20241223180116.3857785-1-nirmoy.das@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
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

On Mon, 2024-12-23 at 19:01 +0100, Nirmoy Das wrote:
> xe_bo_shrink_kunit, sub-dynamic test is now updated to be a subtest
> in the kernel so update this accordingly.
>=20
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
> =C2=A0tests/intel/xe_live_ktest.c | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/tests/intel/xe_live_ktest.c
> b/tests/intel/xe_live_ktest.c
> index 50af97ecc..164c90501 100644
> --- a/tests/intel/xe_live_ktest.c
> +++ b/tests/intel/xe_live_ktest.c
> @@ -16,6 +16,11 @@
> =C2=A0 *	being handled properly.
> =C2=A0 * Functionality: bo
> =C2=A0 *
> + * SUBTEST: xe_bo_shrink
> + * Description:
> + *	Kernel dynamic selftests to check BO swap path and shrinking
> path.
> + * Functionality: bo
> + *
> =C2=A0 * SUBTEST: xe_dma_buf
> =C2=A0 * Description: Kernel dynamic selftests for dmabuf functionality.
> =C2=A0 * Functionality: dmabuf test
> @@ -39,6 +44,7 @@
> =C2=A0
> =C2=A0static const char *live_tests[] =3D {
> =C2=A0	"xe_bo",
> +	"xe_bo_shrink",
> =C2=A0	"xe_dma_buf",
> =C2=A0	"xe_migrate",
> =C2=A0	"xe_mocs",

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


