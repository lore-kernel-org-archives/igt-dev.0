Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C32FEB48F8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 11:27:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD9D10E20F;
	Thu, 12 Feb 2026 11:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aKdC4Oxg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0C110E20F
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 11:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770895652; x=1802431652;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=6Rqu9y7TuRxnIYTnopAh8hoMB87AzshbXQQVS6MXYJg=;
 b=aKdC4OxgST0+FfP1y3sgzjPmkViRwH1rBQjE0Bh4ropVVZAn6xgtubCX
 yoRhr5R6pmfMRqPU4pc2sZj6sdPfghzfIlAWJaqRaGXDZOv1BOVOWwl5o
 qk5lUCFRVe6e6epF7dReuINg4hlyZZn6rgfZ/8Hs40J9RfAOhtfs/jhrP
 UUAkbpDXOyAb+BhRmqmTm4mxDxM8alLLzPfa14qhCs+0Ozhap51rF5JH+
 vhMjS2Xc8sEwlTYVq9HRxcC5Tqf4xTQVfbzOmjhLCjoucB0du7Dd62q9t
 SyeuhYofW0CZGyOz+E/fn6xAhFsHNEJYuaLdYhThbqI4jnFvw69zPa5Vh w==;
X-CSE-ConnectionGUID: sggrJMJ0SHWnCt2w+hVwAA==
X-CSE-MsgGUID: 4uXDOR9DQE+MGHylT8Ufyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="75909316"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="75909316"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 03:27:32 -0800
X-CSE-ConnectionGUID: azTnms85TIuCf5NMuw5OfQ==
X-CSE-MsgGUID: swLD2z0ZRIqFgJe2gPJvnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="243159458"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.123])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 03:27:31 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 00/11] igt pipe vs crtc_index cleanups
In-Reply-To: <aYtu6_aJSRtQwPtp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1770736961.git.jani.nikula@intel.com>
 <aYtu6_aJSRtQwPtp@intel.com>
Date: Thu, 12 Feb 2026 13:27:27 +0200
Message-ID: <982177dbba2883ed4104dcea71be81efa02eb9eb@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 10 Feb 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, Feb 10, 2026 at 05:23:41PM +0200, Jani Nikula wrote:
>> While Ville's been focusing on mass conversions with cocci, here are
>> some specific manual pipe vs. crtc_index cleanups.
>>=20
>>=20
>> Jani Nikula (11):
>>   lib/igt_kms: rename igt_crtc_t crtc_offset member to crtc_index
>>   lib/igt_kms: rename the rest of crtc_offset to crtc_index
>>   lib/kms: rename struct kmstest_connector_config pipe member to
>>     crtc_index
>>   lib/igt_kms: rename _kmstest_connector_config_find_encoder() pipe
>>     parameter to crtc_index
>>   tests/kms_flip: switch to CRTC index terminology
>>   tests/testdisplay: switch to CRTC index terminology
>>   lib/igt_kms: use for_each_crtc() for iterating CRTCs
>>   lib/igt_kms: rename kmstest_get_vblank() param to crtc_index
>>   lib/igt_kms: remove __get_crtc_mask_for_pipe()
>>   lib/igt_kms: pass crtc to igt_crtc_init()
>>   lib/igt_kms: use for_each_crtc() for cleaning up CRTCs
>
> Apart from the missing 1<< in one patch the rest look reasonable to me:
>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks, pushed the lot to master.

BR,
Jani.


>
>>=20
>>  lib/igt_kms.c       | 106 ++++++++++++++++++--------------------------
>>  lib/igt_kms.h       |  19 ++++----
>>  tests/kms_flip.c    |  56 +++++++++++------------
>>  tests/testdisplay.c |   6 +--
>>  4 files changed, 80 insertions(+), 107 deletions(-)
>>=20
>> --=20
>> 2.47.3

--=20
Jani Nikula, Intel
