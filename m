Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAA2C30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 15:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3D410E079;
	Tue,  2 Jul 2024 15:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h562warc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F5A10E079
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 15:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719933964; x=1751469964;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5R4qrFMVWefcf4Zz2NGjgfWg+yWwKvXcvIy5A7LiJj4=;
 b=h562warcCM+fU8+8cNZR226JdIhIdofxCX6NT8i7LHhszd7brxEQPM5Z
 8a1HZRylAHEKEhMBH7Tkso4xEZxnlgK9B1rz4spTLbp2RuHpVMRfDu4xK
 IUJZUPsMf+lKM8lzxNTquSw5xIHnmVSF+fEIeXI8yyIXziFy37vkmIwYV
 xp6SBqPOGeLrElwQ7IrjpBfOxvAEZkWQS4v3hmPxFmiBkwztpov5rxq85
 yYPHuH2mESjYeGbxQnqX7JVm+U2KFMvxtdqVc5b7B44NTu/cz0512YxjW
 UhdUu1NwNgpvoK4HY3cB/O2iMoz/rxfMY33nn65LIUu7dwuAG7+Nwr3pT g==;
X-CSE-ConnectionGUID: U6yX8quKST+D8E1pNknQlA==
X-CSE-MsgGUID: kM5l2QbdQYS2F4iYI4T1Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="39631094"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="39631094"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 08:26:04 -0700
X-CSE-ConnectionGUID: IjtvN8uQQ627vooL34bAQA==
X-CSE-MsgGUID: mB+SEexGTAK1qnMpUluitQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="46005431"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 08:26:01 -0700
Date: Tue, 2 Jul 2024 17:25:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>
Subject: Re: [PATCH] tests/intel-ci/fast-feedback.testlist: Add SR-IOV tests
Message-ID: <20240702152543.jrwr2rwgrvlnrt74@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>
References: <20240702150701.611426-1-jakub1.kolakowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240702150701.611426-1-jakub1.kolakowski@intel.com>
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
On 2024-07-02 at 15:07:01 +0000, Jakub Kolakowski wrote:
> This commit adds SR-IOV tests to fast-feedback testlist so that
> they will be executed in BAT runs. Added tests are about basic
> single VF enablement with and without autoprobe.
> 
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Adam Miszczak <adam.miszczak@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@intel.com>

I will replace this with
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

As for subject, at merge '.testlist' should be dropped, so
it will be:

[PATCH] tests/intel-ci/fast-feedback: Add SR-IOV tests

With this
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel-ci/fast-feedback.testlist | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index be0965110..d18625625 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -142,6 +142,8 @@ igt@prime_vgem@basic-fence-read
>  igt@prime_vgem@basic-gtt
>  igt@prime_vgem@basic-read
>  igt@prime_vgem@basic-write
> +igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-1
> +igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1
>  igt@vgem_basic@setversion
>  igt@vgem_basic@create
>  igt@vgem_basic@debugfs
> -- 
> 2.25.1
> 
> ---------------------------------------------------------------------
> Intel Technology Poland sp. z o.o.
> ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.
> Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu ustawy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w transakcjach handlowych.
> 
> Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
> This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.
> 
