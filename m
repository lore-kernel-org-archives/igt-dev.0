Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3190EEA8550
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 09:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D528E10E69D;
	Tue, 10 Mar 2026 09:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AwhH1v2z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB9910E69D
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 09:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773135324; x=1804671324;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=1hNYLKE/Wyi1nRDGr1EIB/9s6OIvLl3nEdM8dCqIIO4=;
 b=AwhH1v2zZzPWlpnVikw0Qf8/Dnkp2x/tV4xBeuLxGLbVvSY+AJndn2z9
 OO/Wq2K67CCTlTgHUYSSwe3GhII1RZNLlo2I3gQXsPP2vgC4i6ttoIBTV
 3kMtuKrmMSmKEr76KluCUsDerGK8sDKJ7jwZdgtBJrf7WSsSDSteIgKkA
 XlGVuPsJPeCRR90SwQTQWK5JCTooXAwbGvzwfrCj2H4l1Yz1K3nkcGG8g
 LEy46upotSKWV+nH717ElzmuVWF5ubnjpqCRw1T6n1nEkdKvcsWKZP/ZW
 D+HEakLuPNtF0JVHiTv6AqnYCt/QW2wPlqOTAIUdiMEtTeJ+o7jIv077G g==;
X-CSE-ConnectionGUID: doqAE1c7T0uhse8kft9sWQ==
X-CSE-MsgGUID: 8yiuPL1jS8urig39oJZ+Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="76783996"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="76783996"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 02:35:24 -0700
X-CSE-ConnectionGUID: T7i0yyu+R4WIdJYFghZ2GA==
X-CSE-MsgGUID: iXdIaTyOR62akMF5yib5Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="243070743"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 02:35:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 0/3] lib/kms: fix a CRTC index and pipe mask mixup
In-Reply-To: <aa_hKq8zi6tdcva6@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1773059939.git.jani.nikula@intel.com>
 <aa_hKq8zi6tdcva6@intel.com>
Date: Tue, 10 Mar 2026 11:35:19 +0200
Message-ID: <e40f95947dfd51f64ec090f7215e143ea3d1e348@intel.com>
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

On Tue, 10 Mar 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Mon, Mar 09, 2026 at 02:40:11PM +0200, Jani Nikula wrote:
>> Clean up __igt_pipe_populate_outputs() to use CRTC indexes where
>> possible, and fix a CRTC index vs. pipe mask confusion.
>>=20
>> Jani Nikula (3):
>>   igt/kms: add some braces for clarity in __igt_pipe_populate_outputs()
>>   lib/kms: use for_each_crtc() in __igt_pipe_populate_outputs()
>>   lib/kms: avoid mixing CRTC index and pipe masks in
>>     __igt_pipe_populate_outputs()
>
> Series is
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks, pushed, with patch 1 igt/kms prefix fixed to lib/kms.

BR,
Jani.

>
>>=20
>>  lib/igt_kms.c | 39 +++++++++++++++++++++------------------
>>  1 file changed, 21 insertions(+), 18 deletions(-)
>>=20
>> --=20
>> 2.47.3

--=20
Jani Nikula, Intel
