Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68B2D3F096
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 16:47:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719DA10E1D6;
	Wed, 28 Jan 2026 16:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Coi6tmKo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D360410E1D6
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 16:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769618837; x=1801154837;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=rjCAHuFdyI0JYZx+X9gs9d8pBPBJnWhSaTULANewQlM=;
 b=Coi6tmKop9ivZWXhbSqv27Q8sNqm/PgCuH5LTgyjVhGhXuNuV7rYMRe7
 bXWIG4M1wC4d93f+6RWMsZZEkc8ACH7XjvD5dym7tnq9bMolI5OLKduer
 jCv1EIgE1vzbju8K9T08p6DU9Mpz4VPYwdnaVRfDWwltGoyIVKpn6L+JF
 sGkX2AMlFGSBqt3DpBLUXk5LJWL+TD3VWnueWz9/jDlywhb34XXPiPi7A
 tUTdydEJ6BCMZPf1qpV32R/qYDXoTVYh+91nnSC6nAevxqa+JZ7mDjSYd
 FYYWMoFxrwKE0AwGSd60jc+sTkAU5anQDG3rXswe+eGXbqdvlbtM3EwQ4 Q==;
X-CSE-ConnectionGUID: tZItZ29/Q6KEwZXGI66bBg==
X-CSE-MsgGUID: EDGD05vaR02Ekqbgu5cxQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74698490"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="74698490"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:47:17 -0800
X-CSE-ConnectionGUID: dx/ftSSOTWKol+qyS8NHZw==
X-CSE-MsgGUID: l1dUOTldT9eYg8QdTfBs5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208750584"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:47:16 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 0/8] lib/igt_kms: pipe vs CRTC index cleanups
In-Reply-To: <aXon4Dk6azuIFd4w@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1769514879.git.jani.nikula@intel.com>
 <aXon4Dk6azuIFd4w@intel.com>
Date: Wed, 28 Jan 2026 18:47:13 +0200
Message-ID: <d6530c2859f5e77f84be1e69aa48625a036a0c76@intel.com>
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

On Wed, 28 Jan 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, Jan 27, 2026 at 01:55:57PM +0200, Jani Nikula wrote:
>> Jani Nikula (8):
>>   lib/igt_kms: Drop the ioctl fallback for CRTC id to pipe mapping
>>   lib/igt_kms: Remove kmstest_pipe_to_index()
>>   tests/kms_setmode: drop redundant drmModeGetCrtc() call
>>   tests/kms_setmode: use CRTC index instead of pipe for
>>     intel_drrs_disable()
>>   tests/kms_setmode: use __intel_get_pipe_from_crtc_index() directly
>>   lib/igt_kms: Always return CRTC index from
>>     kmstest_get_pipe_from_crtc_id()
>>   lib/igt_debugfs: rename igt_debugfs_pipe_dir() to
>>     igt_debugfs_crtc_dir()
>>   lib/i915/drrs: switch the interface from pipe to CRTC index
>
> Series is
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks, all pushed to master, the CI issues seem unrelated.

Do you have more cocci changes in the, uh, pipeline?

BR,
Jani.


--=20
Jani Nikula, Intel
