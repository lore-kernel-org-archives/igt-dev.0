Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351A5C44536
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 19:21:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E0A10E217;
	Wed, 22 Jul 2026 19:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MchtWMmJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C501710E217
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 19:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784748032; x=1816284032;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lKB9WdvRd855kJU5ok5kZkNYeezWDPu5prXSCzy6hno=;
 b=MchtWMmJ6xQpQ9mp8WsPxydcPcpKVUbif+WiKoSoi8sY097JH/8tf9f7
 hK1nC3q2Qth9VHuug1lRKXu2i3zniMkjZIek6lz7+km2UUGSPuEcDdbx7
 mrGpJCHejNKc1luPzzElJ+MAJiXVC3A84hbrDf3d9yJfhdPYQb3ObZozJ
 rEKRdsLWnrycyBAvgKBWPhBQqH1QNttE0Sa3+Er7rofPO9Pqbj2t01ZC4
 Q661CzhukVkMbwjj0BYc62N7ApwiLWnJKmSvLkRdqMhSPov22EJsGJHG1
 qCYMoacf9tdK5d7UzhKIi1+o7uxYCrknVfgn8t4hKFv5/ZO4k+d+hFz8p A==;
X-CSE-ConnectionGUID: GQgw1XXURZuGDvWUDJHgdg==
X-CSE-MsgGUID: tK8hnio4QVSP/IFWy3g1NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="110938027"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="110938027"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 12:20:31 -0700
X-CSE-ConnectionGUID: DL0N1z6IQJmtXd0adg/wvA==
X-CSE-MsgGUID: oPy6wvt8Tj+iI0xAt6a8Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="262503048"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 12:20:30 -0700
Date: Wed, 22 Jul 2026 21:20:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: igt-dev@lists.freedesktop.org, Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH i-g-t] intel-ci: Rename drm_buddy to gpu_buddy in blocklist
Message-ID: <20260722192012.ljalczjcm5omw4ic@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 igt-dev@lists.freedesktop.org,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <20260722164416.41225-2-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260722164416.41225-2-krzysztof.niemiec@intel.com>
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

Hi Krzysztof,
On 2026-07-22 at 18:44:17 +0200, Krzysztof Niemiec wrote:
> The drm_buddy kunit test was renamed to gpu_buddy, but the blocklist
> wasn't changed accordingly in the series where the renaming was done.
> Change the name in the blocklist.
> 
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel-ci/xe.blocklist.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 80cc98608..8ac4147c5 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -29,7 +29,7 @@ igt@.*@i915.*
>  # time on Intel CI
>  #################################################################
>  igt@dmabuf.*
> -igt@drm_buddy
> +igt@gpu_buddy
>  igt@drm_mm
>  igt@kms_selftest.*
>  ##################################################################
> -- 
> 2.55.0
> 
