Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBDEEB104A
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 11:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE0710E129;
	Tue, 10 Mar 2026 11:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jUP1atet";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F5310E129
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 11:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773141903; x=1804677903;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=PpfY2TTpaN4b0+I9oyiR0/G1GT9z0YYpE/RYkSYi86Q=;
 b=jUP1atetP0/h9FTfUdTjln9lE0QnFirkIbQO5dW21wkeIiZPaqHl/ebn
 LRONST9Bnagd6mppDSfGx/At7go9bJZYB5ZrBjYlBy1BIEwU/VhbiIGsf
 3+UFPEq3bsjX+xycfk3GlxPbUknRSaedcXahPgB7Bn2G9YTx4B9BzhegO
 T35N/di0xsvKMD8+2feZra09K4O9sZh/dALownYPzoHIdUE5l/6i8iApp
 AJQGrxBO9a38BDeOqJwrp26Re3d3pHWwS1az2FRwi/5ia2NVq/qhyZCFw
 JxHQi+4nxybpG7C2NLKEsZLuzL3GLeHXKT5xVwyj0SAyU9Y2VWGPUQc8f A==;
X-CSE-ConnectionGUID: LDXaEQNoSnaY1y2ZtNj+jg==
X-CSE-MsgGUID: 3ZoHBw85TzuT57eCkWuD+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84895850"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="84895850"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 04:25:03 -0700
X-CSE-ConnectionGUID: LxcO2QZDRMq5wDxPbylaDg==
X-CSE-MsgGUID: tvabuk2jRwyDaYSerJtNjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="216874204"
Received: from wtcline-desk20.amr.corp.intel.com (HELO localhost)
 ([10.245.246.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 04:25:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 00/10] tests: avoid using crtc->pipe where possible
In-Reply-To: <aa_wYugxXowLvlTI@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1773066012.git.jani.nikula@intel.com>
 <aa_wYugxXowLvlTI@intel.com>
Date: Tue, 10 Mar 2026 13:24:58 +0200
Message-ID: <c3b6c540d1b644a7c0576b8df9a4daa9287e8946@intel.com>
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
> On Mon, Mar 09, 2026 at 04:21:34PM +0200, Jani Nikula wrote:
>> Tests should generally avoid using crtc->pipe if possible. It's an Intel
>> implementation detail, and crtc->crtc_index is the generic thing to
>> use. Do some conversions to crtc_index use.
>>=20
>>=20
>> Jani Nikula (10):
>>   tests/kms_writeback: use igt_crtc_name()
>>   tests/kms_colorop: use igt_crtc_name()
>>   tests/kms_color_pipeline: use igt_crtc_name()
>>   tests/kms_cursor_crc: use CRTC indexes instead of pipes for CRTC
>>     tracking
>>   tests/kms_cursor_edge_walk: use CRTC indexes instead of pipes for CRTC
>>     tracking
>>   tests/kms_pipe_crc_basic: use CRTC indexes instead of pipes for CRTC
>>     tracking
>>   tests/kms_plane_alpha_blend: use CRTC indexes instead of pipes for
>>     CRTC tracking
>>   tests/kms_vblank: use CRTC indexes instead of pipes for CRTC tracking
>>   tests/kms_cursor_legacy: use CRTC indexes instead of pipes for CRTC
>>     tracking
>>   tests/kms_debugfs: use CRTC indexes instead of pipes for fb tracking
>
> I'd just nuke the array from kms_debugfs.
>
> But no big deal either way. Series is

I opted to leave that refactor for another patch.

> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks, pushed the lot.

BR,
Jani.


--=20
Jani Nikula, Intel
