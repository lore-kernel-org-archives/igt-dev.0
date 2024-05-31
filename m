Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F2DC25B75
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 08:34:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FAC10E8E2;
	Fri, 31 May 2024 08:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="auBY+OUz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0010610E8E2
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 08:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717144439; x=1748680439;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=rZUt4zWIo8rs7nbRxjP4ak7vjtCwLpXsKlVRqmv7two=;
 b=auBY+OUznlEio+bWSPv3EkwcTX3fcNwYnLTgxeaB45ogG5QexE7iTgHQ
 C2gO1At2QnshwN9JikcMWC+DSX8CG1J3SfuiKQks8EHV/WLtLZJciWD+2
 +4rhAAwVjKixAdI96w4bdmEEHFAMEWfJMKl2OGRRaLxeDw2vfyoG9KOWz
 /sM8SRCXY6RkgfGoerUZMvF4lLXdrwMQpFNndjl5PFEgCNNv7/OCMJK9k
 aEQJD/29tb2bwWgO7/iuwNK+FgyfxYa/Qex73qnRUvbLlRDszgCMJxXRM
 kuKWk4f1LScHAT+/mQr1d8wdf8m9oFB4kK+qW9Ujb4SJG1pUodnLy5iSx g==;
X-CSE-ConnectionGUID: D6PdxCaNRZSPDbtHjn185w==
X-CSE-MsgGUID: rmfUMghmQ2+fnVyN8hZ/lQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13495689"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="13495689"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 01:33:58 -0700
X-CSE-ConnectionGUID: MWwT0fcoSoWJDNfcIdrGFQ==
X-CSE-MsgGUID: bkbESY10QjyyMTQWaaXxcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="36088540"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.190])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 01:33:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 0/5] tools/intel_vbt_decode: vbt defs update
In-Reply-To: <Zll2vyok_bzcjvhK@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1717082630.git.jani.nikula@intel.com>
 <Zll2vyok_bzcjvhK@intel.com>
Date: Fri, 31 May 2024 11:33:53 +0300
Message-ID: <87wmnafki6.fsf@intel.com>
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

On Fri, 31 May 2024, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> Series is
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks, pushed.

BR,
Jani.


--=20
Jani Nikula, Intel
