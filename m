Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4369AF531F8
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 07:00:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E257A10E577;
	Tue, 14 Apr 2026 07:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BsW2VS+G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824E610E577
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 07:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776150022; x=1807686022;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=vVeSe/5JfIerY6KR0XnOMQjvcF4J2UEL17u9SZKftHY=;
 b=BsW2VS+GN2zl5xopmFLUo7bxN3kTTnHziUqDkbnQXnUAedHdd2UA5lpp
 q1l4derGeDxT6S6UObeBiIS57JCdKrUD491hxcijzbRUE2llQ6TNXJNKQ
 rFAmDsSNKmHTzlucqMo6wC/fxCBxIEQaHNtsdMiiQ9NhhkmsWis/9MZxr
 tDWBHDKAvAdWu29SNckR4wRZo4t4VRjU/lXu3JcRmQLq42aK7+dZPmu5B
 eugWRi3l/7zkejICIjviIr1wy5juSKHDoAP33FiUyKAgvoWnYL205Fddt
 6Qg77SXnexL7dNtbEBik3gYD8cBIj+2a9wymkFXSpage680O0cevVhGAK A==;
X-CSE-ConnectionGUID: FMfm6BoxRTuaUlriyr2nAQ==
X-CSE-MsgGUID: 2xSqpYf9QkeM3IxwmhKDxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80982987"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="80982987"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:00:22 -0700
X-CSE-ConnectionGUID: 8jqsaUKrQx2wej6CqesZ4g==
X-CSE-MsgGUID: NndWBh0eQN+mXpH9tw+2mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234940685"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:00:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 0/3] tests/kms: Nuke local iterator macros
In-Reply-To: <20260413200021.29485-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260413200021.29485-1-ville.syrjala@linux.intel.com>
Date: Tue, 14 Apr 2026 10:00:18 +0300
Message-ID: <3238a98e67cbbf45c31e42612d24aa9af1aaf8d5@intel.com>
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

On Mon, 13 Apr 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Clear out some local iterator macros from tests.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Ville Syrj=C3=A4l=C3=A4 (3):
>   lib/kms: Avoid local iterator variable in for_each_output()
>   tests/kms: Nuke local copies of for_each_valid_output_on_crtc()
>   tests/kms: Use for_each_crtc_with_valid_output()
>
>  lib/igt_kms.h              |  7 ++--
>  tests/kms_display_modes.c  | 71 +++++++++++++-----------------------
>  tests/kms_plane_multiple.c | 73 +++++++++++++-------------------------
>  3 files changed, 53 insertions(+), 98 deletions(-)

--=20
Jani Nikula, Intel
