Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F18EB28FA
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 09:31:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE0F10E6D0;
	Fri,  6 Feb 2026 09:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NV5XDuCq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701FB10E675
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 09:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770370289; x=1801906289;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=Wvj1u04py+7QP6yoakpTaa/XcbE3AhmvlP/J0/mmkgU=;
 b=NV5XDuCqyHwENKUh8JAo40TfH0ebhForQBZXSMjlyzhumTG4PCEW/t4I
 IX5MpKPQOXAllIV8czIXZ/u25yQmyfMEomghImy1zq3XMe9ZWeitnzVQY
 9l/8MYpd+Cys2Yw04W4M9dhxxRb1na7VdwPi9geD4YWfHRWv7wRzLbIUQ
 hBfaJdE8+RaXTlrXNaHKAilm+uVzDQbWT+GqLJzBylCEcXgJ6NdLoY0Dx
 QuUaVXFezXjtKdheKoTTOdTv9kpGewDli0QY+FvyDt5LnYXU7S93l+dsR
 oYrOQsfZvnu7LZQGlh9f0PTOGy3642zk4K5lBU5KD6NiXcUS8SQMZ9PIj A==;
X-CSE-ConnectionGUID: XNjmfER5SVeTBE7Yfs7Bgw==
X-CSE-MsgGUID: /UhsieDlS3atB0kbdXilDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71676735"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="71676735"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 01:31:29 -0800
X-CSE-ConnectionGUID: w5lLAsSeR8+313GylQkkLw==
X-CSE-MsgGUID: mXfeNzpMQDaszcrhGOR0TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="210870170"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.129])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 01:31:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 03/12] tests/kms: Convert problematic tests to use
 for_each_crtc()
In-Reply-To: <20260205133019.9161-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
 <20260205133019.9161-4-ville.syrjala@linux.intel.com>
Date: Fri, 06 Feb 2026 11:31:25 +0200
Message-ID: <23774495c672ff6379caa521af350565a1e40221@intel.com>
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
> Convert more for_each_pipe()s into for_each_crtc().
>
> Take care of specific tests that are problemtic for

*problematic

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> coccinelle. The conversion is done mostly with cocci
> but I did not manage to add the new 'crtc' iterator
> declarations without hitting some pathological
> performance problems in cocci. So that part was
> done manually on top of the semantic patch.
>
>  #include "scripts/iterators.cocci"
>

--=20
Jani Nikula, Intel
