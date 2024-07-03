Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFB1C30653
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 16:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2238F10E053;
	Wed,  3 Jul 2024 16:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RZQ1GlI9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E3710E053
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 16:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720022949; x=1751558949;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=U96T2SxvFkJ/kZPKz5twVU+4JiU0hb9Ems/+7O10VW8=;
 b=RZQ1GlI9ZK/CjUat8cQVXZa1OFisnnpe2WsPjSG5eNKZHPI8rqB/QTDX
 irsVXD8Vhs2oBnfCzCbI9rj3hkAyjNSlSI/LQr0p4aPe2WW8sdAD+Tyeo
 Fb083qEDzoadlorpAotAcTorOzi74kEPhH1MTReZ79SWvfy8J+sNgwJ6b
 D+qyKvFluWaxQcjJ9e74t+cJB2mYe7yvdEeG+n+mYbWYmBQsnYSNQRKRP
 0LiQTnGoyhSmMRIM59/bXHua0Rr8NKPueMr2HYgbqquDgEOkpV6h6Wo2o
 +iXNBUJstKbcRtyOJkBBr3Lf1cMYh+lQwMK/KH8uC9SA5UW4SAMq0kFQL A==;
X-CSE-ConnectionGUID: uAkr3poeSN6LA9hDfEiS+Q==
X-CSE-MsgGUID: ov+JDHfmQemhQDBcSvmCNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="12379068"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="12379068"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 09:09:09 -0700
X-CSE-ConnectionGUID: FiQrWaDMRCeJQfVVJizPJg==
X-CSE-MsgGUID: efQRBrsIQpi3hLOnX1Sh+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="46443667"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 09:09:08 -0700
Date: Wed, 3 Jul 2024 18:08:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Adam Miszczak <adam.miszczak@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel-ci/fast-feedback: Add SR-IOV tests
Message-ID: <20240703160851.wkeaof4txzan2xa5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20240703111221.616274-1-jakub1.kolakowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240703111221.616274-1-jakub1.kolakowski@intel.com>
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

Hi Jakub,
On 2024-07-03 at 11:12:21 +0000, Jakub Kolakowski wrote:
> This commit adds SR-IOV tests to fast-feedback testlist so that

s/fast-feedback/xe-fast-feedback/
here and in subject, with this

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> they will be executed in BAT runs. Added tests are about basic
> single VF enablement with and without autoprobe.
> 
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Adam Miszczak <adam.miszczak@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index aa98b37e6..fc312a123 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -65,6 +65,8 @@ igt@kms_prop_blob@basic
>  igt@kms_psr@psr-primary-page-flip
>  igt@kms_psr@psr-cursor-plane-move
>  igt@kms_psr@psr-sprite-plane-onoff
> +igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-1
> +igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1
>  igt@xe_compute@compute-square
>  igt@xe_create@create-execqueues-noleak
>  igt@xe_create@create-execqueues-leak
> -- 
> 2.25.1
> 
