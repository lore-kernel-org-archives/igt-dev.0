Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B6AC5AD49
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 20:54:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D476710E0A4;
	Mon,  2 Jun 2025 20:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gl7rJdUO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BA510E0A4
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 20:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748897673; x=1780433673;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=GmNyAjKiqbV6WrZw3UFz2gTcgz7dcErkD7VWNY7YTPI=;
 b=gl7rJdUOwq693iANMKWiElKmfDfFYwqhK9vUMcc5Eix+MD4rnlpxNnwE
 0lvB7lMGcRfwXk1RKygOtDQkeQZvFGCAkFUQl1983NOw7IaIebUdpFB+k
 5BLFouFZaFvvXM4nhwZu78vJWhyML/RNVzFM7I39Iihky5iIxSkCfHDaJ
 MGfK3Gg5qScXpuo6KReqmnpooI7UFNcdyGmUZGJHdaym4u3w/wye87xiT
 2tTW25OwaGdUGeufAY6JGBT7X0Aknprie/mkN0xOc98PX6Ur7DUxLHp30
 zd3XySqD+Z4n2e2aFukJLblHfVOj1UeQ/P+UQymQt8jl1NaSvxoOW/NAw w==;
X-CSE-ConnectionGUID: Ii7RjqDHSFSabGxF1cxcNQ==
X-CSE-MsgGUID: Eq9v2eXFRoO42ZETsvpz4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="62308781"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="62308781"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 13:54:33 -0700
X-CSE-ConnectionGUID: 2xcUf7OeQ2qvA1EwIlcnFQ==
X-CSE-MsgGUID: L/7d+YVTQYCBlPhIAht7dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="149425657"
Received: from kmularsk-mobl1.ger.corp.intel.com (HELO [10.245.80.230])
 ([10.245.80.230])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 13:54:31 -0700
Message-ID: <b2c7f3b4-24ee-4c79-bfa9-a728accf5e82@linux.intel.com>
Date: Mon, 2 Jun 2025 22:54:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 9/9] tests/intel/xe_eudebug: fixup print
 formatting for xe_eudebug tests
To: Jan Sokolowski <jan.sokolowski@intel.com>, igt-dev@lists.freedesktop.org
References: <20250527120421.79026-1-jan.sokolowski@intel.com>
 <20250527120421.79026-10-jan.sokolowski@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250527120421.79026-10-jan.sokolowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 5/27/2025 2:04 PM, Jan Sokolowski wrote:
> Compiling on other architectures than x86-64 causes a lot
> of print formatting warnings.
> 
> Fix formatting by using proper formatters, eg. PRIu64.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> ---
>  tests/intel/xe_eudebug.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index 60700a8bb..bdf73c4e9 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c

My version of tests/intel/xe_eudebug.c does not have the #include <inttypes.h>.
Do we need it? Please add the include if needed, otherwise:

Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

> @@ -1156,7 +1156,7 @@ static void *discovery_race_thread(void *data)
>  
>  			xe_eudebug_debugger_stop_worker(s->debugger, 1);
>  
> -			igt_debug("Resources discovered: %lu\n", s->debugger->event_count);
> +			igt_debug("Resources discovered: %" PRIu64 "\n", s->debugger->event_count);
>  			if (!s->client->done) {
>  				xe_eudebug_for_each_event(e, s->debugger->log) {
>  					if (e->type == DRM_XE_EUDEBUG_EVENT_OPEN) {
> @@ -2669,7 +2669,7 @@ static void vma_ufence_trigger(struct xe_eudebug_debugger *d,
>  				    ef->vm_bind_ref_seqno);
>  		xe_eudebug_assert_f(d, eb->flags & DRM_XE_EUDEBUG_EVENT_VM_BIND_FLAG_UFENCE,
>  				    "vm bind event does not have ufence: %s\n", event_str);
> -		igt_debug("vm bind ufence event received with ref %lld, addr 0x%lx, range 0x%lx\n",
> +		igt_debug("vm bind ufence event received with ref %lld, addr 0x%" PRIu64 ", range 0x%" PRIu64 "\n",
>  			  ef->vm_bind_ref_seqno,
>  			  addr,
>  			  range);

