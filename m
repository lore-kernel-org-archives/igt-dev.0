Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9688EFF60DC
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 07:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A8F10E8C1;
	Tue, 31 Mar 2026 07:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LVWozM1r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D4D10E8C1
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 07:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774943433; x=1806479433;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=3toSxfpHAjVDxvQzw/MJMvEQkOP304JFuj8qxQN26Lg=;
 b=LVWozM1rwQnhzXwl+qO0rqo9O0S2DEyK/r5ykP+fjLPAP2/RkK9bC82K
 zXvclNn2SPpCoGBPwQoXoAXVecKc5o6MPsqY5hqv8RQgVuPFNLSl5JZ+N
 4r7eWjjTPy74dSf+/48ZM/OYOdvdjVCXNOM4CJV2EaZcTRbGI6smQPKeG
 dHc6otbkH8bimSGLYWURiWpqhsnPR664ItDDvvqSUZVyM2RDwYT0Ah4ap
 MPXcVw1//uGcjj6G6f+mHhTPxJoDIPqqMRIlKPiOmxPZE1+6YagUpJqUI
 sO7mn113TwpiGgerotrdtf3rD6IPXKTfVfUDz+PdFKC6Ntn3aqQwy9m+/ g==;
X-CSE-ConnectionGUID: 4P+HG7I7R1K2xvxYCjzENw==
X-CSE-MsgGUID: zOd+fXU8S36SQYxCPyPd4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86563862"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="86563862"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 00:50:33 -0700
X-CSE-ConnectionGUID: w3WpxrSnSeeXlCPRnZHV9Q==
X-CSE-MsgGUID: ZrcKYLxdTKqLqnab4i5fJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="219646738"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.73])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 00:50:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 0/3] lib/kms: only keep valid igt_crtc_t around
In-Reply-To: <acr_yGTKiF9n2jVH@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1774856079.git.jani.nikula@intel.com>
 <acr_yGTKiF9n2jVH@intel.com>
Date: Tue, 31 Mar 2026 10:50:29 +0300
Message-ID: <91b83f2ab9e75e887aeca01adff0647299a42987@intel.com>
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

On Tue, 31 Mar 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Mon, Mar 30, 2026 at 10:36:27AM +0300, Jani Nikula wrote:
>> Only keep valid igt_crtc_t in display->crtcs[] and make
>> igt_display_n_crtcs() return the actual number of CRTCs on the device.
>>=20
>> Jani Nikula (3):
>>   lib/kms: start returning NULL for invalid pipes from
>>     igt_crtc_for_pipe()
>>   lib/kms: use a for_each_crtc() loop in igt_crtc_for_pipe()
>>   lib/kms: only keep valid CRTCs in display->crtcs[]
>
> Series is
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks, pushed.

This pretty much marks the end of the pipe <-> CRTC index deconflation
all over IGT. \o/

Sure, there's still cleanups here and there that could be done, but the
bulk of the functional changes is there.

BR,
Jani.


--=20
Jani Nikula, Intel
