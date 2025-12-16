Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90304D609D7
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 18:09:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409C010E86B;
	Tue, 16 Dec 2025 18:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MaJn3V+m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45B810E86B
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 18:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765908546; x=1797444546;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wpgaM29wci0Wt20v2LP9yBj5MG8UF9W3aF9+q3w7xZ4=;
 b=MaJn3V+m7AZR7NCNJGE/6+DQD0DbFE99Z3DUA/vAHLAVMQVLEVVjPOAL
 In1Vl6hOMPMhcMLDEyETQ6gx8ghWxBLHMKySe6F2LmD4opn/6kIWhbxJN
 ZTfHeZjcXTjetT4Ss0WyoxNIu0BuEC1HgjhQjro0c0vHEfXodVwD3zZnH
 c+t8nchmbX3elJJg/VdhMk1EEaQWsxOdm+k/HqhtlAKGcELCzogW0OgIf
 0GPinUygJDcLhjawVLPY8dEuovoGabOZqfUOA3RjJ0CeQG2EcepfWFH3S
 ufLmBAj0zKZIEqaLMYxkXOWhn//8OAAnK6iJuwqAO7vH0WqB4FJsxFC5p Q==;
X-CSE-ConnectionGUID: bWMKzADHTaahrJdDR2qEkw==
X-CSE-MsgGUID: awYWwrmSSAibXBZts5MBHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67989534"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="67989534"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 10:09:05 -0800
X-CSE-ConnectionGUID: C5eLZKUDTOevr9hqTmIH6A==
X-CSE-MsgGUID: PnH1FD6eRr+wN5FN3Hl4jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="197841863"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 10:09:05 -0800
Date: Tue, 16 Dec 2025 19:09:01 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Piotr Rudnicki <piotr.rudnicki@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Himanshu Girotra <himanshu.girotra@intel.com>
Subject: Re: [PATCH 1/1] intel-ci: add eudebug tests to multigpu blocklist
Message-ID: <20251216180901.ytlp33eozon3kbss@kamilkon-DESK.igk.intel.com>
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

one more nit, see below.

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

Please remove this footer from your upstream e-mails.

Regards,
Kamil
