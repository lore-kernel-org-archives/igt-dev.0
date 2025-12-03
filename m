Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41697D12D56
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 12:56:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03A410E129;
	Wed,  3 Dec 2025 12:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d4w2CSKX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1075110E129
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 12:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764766603; x=1796302603;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Dw2RJff9L8pA3mZ61CP6CQEwOAvR09I0Zz3qBnMWXWg=;
 b=d4w2CSKXEnf351F/AdXLNePpzeytmrLi/SdDJoef8vX1KKmp7TS2NcLl
 kcSvMUHSpmTFyP51P4FFhKmiBVtwP/8CsY66ugPfRltI9peSKIXWU3G9q
 IIW9uAKLg/VjPHv/FyBvrvErkq1L57flAw/2Y+RBfKpGi+tBgnt63psMR
 KXZgTGdPqNhSyhPB2w3cGRLJSffC+IuGt/sg9tvdIxPfGcABLbT4AjViu
 FoeP0InEGFlU7uS1VPiGSfpccee8rU80RQ9RhpLWqzHZIAbBjs3XoeNYh
 AQ+qBnbnQw6M+PaIm4Kv7tXh+c5ayoq8C9eSHsCkPrTPYNQSsY+huTRrN Q==;
X-CSE-ConnectionGUID: GlWKabe5QxiTnyXz9O6ugw==
X-CSE-MsgGUID: Aw/uzVRXQaOOWiy6khYlxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77381527"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="77381527"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 04:56:42 -0800
X-CSE-ConnectionGUID: zoIBUgQIQhWnQBSJTWK3Ww==
X-CSE-MsgGUID: KQAaCoepSNGMYcuNKqxQuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="195464732"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 04:56:40 -0800
Date: Wed, 3 Dec 2025 13:56:23 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com,
 kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t v1 3/3] tests/intel/xe_pmu: Refine engine activity
 accuracy test
Message-ID: <20251203125623.vx6akxryh25ouqfj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com,
 kamil.konieczny@intel.com
References: <20251113124936.3878794-1-soham.purkait@intel.com>
 <20251113124936.3878794-4-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251113124936.3878794-4-soham.purkait@intel.com>
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

Hi Soham,
On 2025-11-13 at 18:19:36 +0530, Soham Purkait wrote:
> Instead of creating a new spinner during each pass, it's more efficient to
> instantiate the spinner once and reuse it by properly ending and resetting
> it between iterations.
> This approach reduces the overhead associated with repeated spinner creation,
> saving time across multiple passes. By eliminating the cumulative time spent
> on spinner initialization (i.e., creation time * number of passes),
> the spinner's active duration more accurately reflects the actual engine busyness.
> This leads to more precise measurements of the percentage of engine busyness in
> terms of spinner running time.
> 
> With this change engine-activity-accuracy test result clearly shows the difference:

please describe here what is a difference, in percentage gain,
not diff number.

> 
> Before spinner reuse :
> 
> Starting subtest: engine-activity-accuracy-90
> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_RENDER0
> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
[cut]

Remove this from here, it should be in cover letter or after
---

here you could write bigger explantation, it will be ignored by
git am your_series*.patch

Regards,
Kamil
