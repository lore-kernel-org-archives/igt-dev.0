Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77BFD609B1
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 15:44:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCF810E516;
	Tue, 16 Dec 2025 15:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MioPfkcs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D5510E516
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 15:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765899841; x=1797435841;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qiu1n0onTX6thCa5FAOaTUDCkvgzl9NJZW2Ks6Gq52A=;
 b=MioPfkcsSBEph5IUbMgpYP5Ub8jFkQOr14+gntdSGE7PmomNQuoP86Rx
 yoDSu9KYIUHJvuwzF0O6/ZbRdcNjjtT9nnqiuzUxqC+lJ3Q1ApG5ryQSR
 QB8Dj/1X984CO/yYdzHqDx7rPIKsB0YO3vzuFWiIYbIEkhRX7XMh6Aa8m
 paCbNj0JzCv5bz5FKZPGF4MHnE9svtdUWTrO5jHYUsaD1BnWaJ/gBj9BM
 SYaSaKi+IbYc5TvjotBV1FXTH53YYJ6YgDa7NE56Bo6nakZn1AurWZtB5
 Rx4ztrHfGTxErHTpm9k+rxRFGAm2j5f8A9X4yHkhAjfxUy3jznECfvsSj Q==;
X-CSE-ConnectionGUID: OhqFwsJqTRaPddntC3sHcA==
X-CSE-MsgGUID: z9gdEGH6Th+VnJU5fNpFiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67702830"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="67702830"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 07:44:00 -0800
X-CSE-ConnectionGUID: Cxy1/YFqR3imfJCScKtrwQ==
X-CSE-MsgGUID: /Gt14QedR1aYptsD1IYRbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="228728318"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 07:43:59 -0800
Date: Tue, 16 Dec 2025 16:43:57 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Piotr Rudnicki <piotr.rudnicki@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Himanshu Girotra <himanshu.girotra@intel.com>
Subject: Re: [PATCH 1/1] intel-ci: add eudebug tests to multigpu blocklist
Message-ID: <20251216154357.vwarupdxrkgqohaz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Piotr Rudnicki <piotr.rudnicki@intel.com>,
 igt-dev@lists.freedesktop.org,
 Himanshu Girotra <himanshu.girotra@intel.com>
References: <20251216132249.478112-2-piotr.rudnicki@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251216132249.478112-2-piotr.rudnicki@intel.com>
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

Hi Piotr,
On 2025-12-16 at 14:22:50 +0100, Piotr Rudnicki wrote:
> Add eudebug tests to multigpu blocklist, as they are not yet supported
> on Xe multigpu setups.
> 
> Cc: Himanshu Girotra <himanshu.girotra@intel.com>
> Signed-off-by: Piotr Rudnicki <piotr.rudnicki@intel.com>
> ---
>  tests/intel-ci/xe.multigpu.blocklist.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/xe.multigpu.blocklist.txt b/tests/intel-ci/xe.multigpu.blocklist.txt
> index 387c3413e..b4fe21d2e 100644
> --- a/tests/intel-ci/xe.multigpu.blocklist.txt
> +++ b/tests/intel-ci/xe.multigpu.blocklist.txt
> @@ -1,5 +1,5 @@
>  #####################################################
>  # Blocklist for Xe MuitiGPU tests
>  #####################################################
> -igt@(?!.*xe.*multigpu.*|xe_peer2peer.*).*
> +igt@(?!.*xe.*multigpu.*|xe_peer2peer.*).*|igt@.*eudebug.*
>  #####################################################

You do not need to block it, this should alredy be blocked
by existing regex:

igt@(?!.*xe.*multigpu.*|xe_peer2peer.*).*

match all names which are not (multigpu OR xe_peer2peer)
so this eudebug should be blocked.

If this do not work we should fix it in first place.

Regards,
Kamil

> -- 
> 2.43.0
> 
> ---------------------------------------------------------------------
> Intel Technology Poland sp. z o.o.
> ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.
> Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu ustawy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w transakcjach handlowych.
> 
> Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
> This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.
> 
