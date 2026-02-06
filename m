Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A71ECD98B
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 10:02:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC4110E674;
	Fri,  6 Feb 2026 10:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DJ8GglmB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F83F10E674
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 10:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770372163; x=1801908163;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=AF4Qbky+XDkGWPiHqLAs2Ue+ExY6uOiTD6/dvAXn694=;
 b=DJ8GglmBnkM/uuAWrIWJAymrNTbksxZS8PAoF42GmZ4CDN0mBA5d6O2I
 0k2/q80ndoa8w59Cshs4U65/KB0GPxFanH0MA7J94Uj7hua9qLPpF+F/e
 vV2AHGVr+lX6Gqa7W66eVELAcjT2GULFItF/6eCBHSjtlGOEXoqHStZul
 oxT0iW8zD4/8cfQrYtSACi/uJuD8h4zGL5eUh2vPOgQSrwsql79h0DD1j
 hHmNjen9GBbfC0inbBnKtm4xdCEwIAnQlaH0Kw5tXgrJtbnESicRN7Dcg
 KbEgaep539lBZnVDqlZlYQ2ReITS8EMh2akxoxgj9razq/AOIW9RDzFb9 Q==;
X-CSE-ConnectionGUID: aqtslbOPTrOHT+66/JI1sw==
X-CSE-MsgGUID: Ew9KCnb7T4usyRK+M/Dw6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71679384"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="71679384"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 02:02:42 -0800
X-CSE-ConnectionGUID: KIPGkrYwQB+Je7OScPD4CQ==
X-CSE-MsgGUID: xbo+KUokR+u6aWlrjViFkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="248446739"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.129])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 02:02:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 12/12] lib/kms: Nuke for_each_pipe()
In-Reply-To: <20260205133019.9161-13-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
 <20260205133019.9161-13-ville.syrjala@linux.intel.com>
Date: Fri, 06 Feb 2026 12:02:37 +0200
Message-ID: <36decc1245fb183e4017c13589a1ee3743fc9d8a@intel.com>
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

On Thu, 05 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Everything has been converted to for_each_crtc(), nuke the
> old for_each_pipe().

Yay! \o/

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_kms.h | 15 ---------------
>  1 file changed, 15 deletions(-)
>
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 057a0f5e90e0..ca039a6bb9e5 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -742,21 +742,6 @@ static inline bool igt_crtc_connector_valid(igt_crtc=
_t *crtc, igt_output_t *outp
>  #define for_each_pipe_static(pipe) \
>  	for (pipe =3D 0; pipe < IGT_MAX_PIPES; pipe++)
>=20=20
> -/**
> - * for_each_pipe:
> - * @display: a pointer to an #igt_display_t structure
> - * @pipe: The pipe to iterate.
> - *
> - * This for loop iterates over all pipes.
> - *
> - * Note that this cannot be used to enumerate per-pipe subtest names sin=
ce it
> - * depends upon runtime probing of the actual kms driver that is being t=
ested.
> - * Use #for_each_pipe_static instead.
> - */
> -#define for_each_pipe(display, pipe) \
> -	for_each_pipe_static(pipe) \
> -		for_each_if(igt_crtc_for_pipe((display), (pipe))->valid)
> -
>  /**
>   * for_each_crtc:
>   * @display: a pointer to an #igt_display_t structure

--=20
Jani Nikula, Intel
