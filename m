Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6B5CD4F26
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jun 2026 09:17:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5321C10E327;
	Fri, 26 Jun 2026 09:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y/h/d8tt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A0210E327
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jun 2026 09:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782465393; x=1814001393;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=NQuyEGNdyQ3Jx8ucT97594gq0g0P/JGCDGrZAAzhOfw=;
 b=Y/h/d8ttE+TEcLV2jqiK481454jMEmXatMcQkReWX0OGhaXgrP3p0wZ8
 OEJGhlrs8I6l5sVSKA0u7R43tE8RCRoulNEUDR+xJg5ieZ5An7nZHrft3
 14v8ePjy61WSbt6/6jMiPKjUDOTwYTO+B4WVO9kHVj7jpOD4i+PdA89Hy
 bn2dZdNiteRGaQ9Mm+RYu4XfhzLee/3bry8IKsAM7gudZGDnNUkH0LpHN
 ZAFCZwvrNzayHHXhDgWJrz+FbFZ9K9TNeyvgc7raEhCMOQzEKvhP8n/vU
 AAefqiTzghuDj5aopMP5hlsNWE8uMfBYsqOAUl4lRVDmOLcOL+fcV9Abc g==;
X-CSE-ConnectionGUID: mQ51MBeURMy8+BlbMm8DmA==
X-CSE-MsgGUID: J6Q++6+wQ8OOR1FxKvbHgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83314821"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="83314821"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 02:16:33 -0700
X-CSE-ConnectionGUID: YzxQrWXtT4udd+0OK43DDQ==
X-CSE-MsgGUID: 1hh3ZgWpSzuljnmpSQyl6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="249625725"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.21])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 02:16:18 -0700
Message-ID: <5942c40ec90e036c6f61cb0f6138ace57a12982e.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 1/3] tests/intel-ci: Remove dmabuf tests from
 i915 fast feedback
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>, 
 igt-dev@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Kamil Konieczny	
 <kamil.konieczny@linux.intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>,  Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Date: Fri, 26 Jun 2026 11:16:15 +0200
In-Reply-To: <20260625192850.56004-2-krzysztof.niemiec@intel.com>
References: <20260625192850.56004-1-krzysztof.niemiec@intel.com>
 <20260625192850.56004-2-krzysztof.niemiec@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
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

On Thu, 2026-06-25 at 21:28 +0200, Krzysztof Niemiec wrote:
> Intel CI runs KUnit tests separately from regular tests. Remove the
> dmabuf tests from the i915 fast feedback testlist, as they are now
> KUnit tests, instead of selftests.
>=20
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

> ---
>  tests/intel-ci/i915.fast-feedback.testlist | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/tests/intel-ci/i915.fast-feedback.testlist b/tests/intel-ci/=
i915.fast-feedback.testlist
> index 2799bbaa5..5b33f29e4 100644
> --- a/tests/intel-ci/i915.fast-feedback.testlist
> +++ b/tests/intel-ci/i915.fast-feedback.testlist
> @@ -168,4 +168,3 @@ igt@i915_pm_rpm@module-reload
> =20
>  # Kernel selftests
>  igt@i915_selftest@live
> -igt@dmabuf@all-tests
