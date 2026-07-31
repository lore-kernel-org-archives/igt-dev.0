Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF08C5516F
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 15:55:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181E810F2EC;
	Fri, 31 Jul 2026 15:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GoJpLKXi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8AF10E208
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 15:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785513255; x=1817049255;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QZUqZxBLNla1U3uagvKjgdbHIPolE8Ugz6+jR2soJW0=;
 b=GoJpLKXimsOB94W+RE5DVQdiI/BAODsl4wk5RxWt50wWOz05QatFy+xC
 5T46hFXbceRZSCkm17cmFxeDc8WjqQYND/N/d+gKBaHYQrqAWIETJk6dw
 BOd7DjR9H1Nmf0orvdW7ps4WQ930rsZsJ8nJBJ8tjJNYlcrkFv7cnc9qL
 3/173m3rtGVrZd9tggg+N5Jy/LKoTskNdNgPwGaAqLjdkpule4/rRex8q
 SRcWFWyy0mv9WYFTFO709gk6HlcCmUNuOF3MrJhfLkC53B90f4YHAID9Z
 3mnpwlEKGvr3G1uHRyod54n36YZ32sNdVkMGzdLUyudw59FIocj2kxKg5 Q==;
X-CSE-ConnectionGUID: 1MVIZhHQQ4K4VKdR2Rs1JA==
X-CSE-MsgGUID: w6S10JddQUm5BW9cMzQrgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="103680749"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="103680749"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 08:54:15 -0700
X-CSE-ConnectionGUID: 4vQmqX+eSYmFaIriC2N3kQ==
X-CSE-MsgGUID: QuoCxqsrQjWNQbu6Cm5bnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="290556652"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.8])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 08:54:13 -0700
Date: Fri, 31 Jul 2026 17:54:11 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, adam.miszczak@linux.intel.com, 
 kamil.konieczny@linux.intel.com, lukasz.laguna@intel.com
Subject: Re: [PATCH i-g-t 3/3] tests/xe_sriov_scheduling: fix ticks_delta
 check for non-inverted logic
Message-ID: <dslty6wmwqeohnirbfmiu7ejpxbmpqvqmjqx3uj254fly2fytm@x44g6pdsjjod>
References: <20260731141806.890207-1-marcin.bernatowicz@linux.intel.com>
 <20260731141806.890207-4-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731141806.890207-4-marcin.bernatowicz@linux.intel.com>
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

On Fri, Jul 31, 2026 at 04:18:06PM +0200, Marcin Bernatowicz wrote:
> xe_spin now stores elapsed ticks directly in ticks_delta (not inverted).
> Update subm_is_work_complete() accordingly.
>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/intel/xe_sriov_scheduling.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index 47cc5d9b0..5d30b961d 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -189,7 +189,7 @@ static void subm_exec_slot(struct subm *s, unsigned int slot)
>  
>  static bool subm_is_work_complete(struct subm *s, unsigned int slot)
>  {
> -	return s->expected_ticks <= ~s->spin[slot]->ticks_delta;
> +	return s->expected_ticks <= s->spin[slot]->ticks_delta;
>  }
>  
>  static bool subm_is_exec_queue_banned(struct subm *s)
> -- 
> 2.43.0
> 
