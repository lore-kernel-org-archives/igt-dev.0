Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB07CE91264
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 06:11:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406C210E225;
	Thu,  5 Feb 2026 06:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8f7p/5t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB4510E225
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 06:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770271912; x=1801807912;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=IHSxJwKTgobZtOwhGxdiaS28HpiQ8RJIlGyCVXUH2sw=;
 b=h8f7p/5t7SabSIMzO6W3TdBlbQtZsfBgjVRLkM5rjAJH/gnrpVQ9TTVH
 YL44rV8jvjMxu6kUmJIa3IGItVwo6j71/dOqHE9kvMr4Y+6ChC/DHA3Cs
 Q/Ep+Ku61Rms6gL2wJvLJwxCgWs2OOBEZI/sxIOgGKUskKzfMiq0K1ie1
 Qh0vqnas6DPenIFbNDww2duDNUOrks+03/JWV+zTt9kGvo4YBSgrzQNYI
 GyPFrGp0FFtwwBNx1kVdE+1P5L1ZZhjAvo5UQXmG84MtPJLfcY24fm/Fj
 xXWx+DQlDv1pE6/1qOTCz7ZOc1XP24sFPuRHQrs02DNfNHscSR3jjW+LD Q==;
X-CSE-ConnectionGUID: +wDdURo2RwyfqhthqKuG2A==
X-CSE-MsgGUID: Xm6ds12UROanQ8N+I1/5Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="96920358"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="96920358"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 22:11:52 -0800
X-CSE-ConnectionGUID: bup/aaX/Tu2swrmAiKmVkw==
X-CSE-MsgGUID: R11VkhVjSKGXFRghxizJkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="210190002"
Received: from soc-dcgdq34.clients.intel.com (HELO [10.66.113.248])
 ([10.66.113.248])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 22:11:51 -0800
Message-ID: <fdba66f6-a4fa-42ce-ad49-48664fdfaab2@intel.com>
Date: Thu, 5 Feb 2026 11:41:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v2, 3/3] tests/kms_psr2_sf: Allow testing of both PSR2 and
 Panel Replay if supported
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260203061036.21482-4-jouni.hogander@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20260203061036.21482-4-jouni.hogander@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 03-02-2026 11:40, Jouni Högander wrote:

> Currently kms_psr2_sf is testing only Panel Replay even if PSR2 is
> supported. Allow testing both PSR2 and Panel Replay when supported.
>
> Also drop some complexity from fixture for detection of working
> PSR. Earlier working PSR support was detected in fixture by enabling PSR
> and then ensuring PSR entry happens. Now we are relying on
> pipe_output_combo_valid. Earlier approach was problematic as PSR Might be
> broken due to some earlier test which was run. This caused kms_psr2_sf to
> not run any tests on that sink/pipe setup. Now these are supposed to be
> visible as failing testcases.
>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
