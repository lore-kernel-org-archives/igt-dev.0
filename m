Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C068D3EE7C
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 15:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C0710E9CF;
	Thu, 22 Jan 2026 15:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JXQ3cYFG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B07710E9CF
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 15:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769094152; x=1800630152;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=4W+ntuia7gqAVgtA+3SI+KSk8uM4tn2jbBPPUl401I4=;
 b=JXQ3cYFGZKMI09Tn8vBsXfLB031BiiJbd5UOwLHZISlAssR/VlzGS1fO
 SNzLpOJkRuDQHo9KGOs4ZMPY3VoIRkxbjIzFwoFnD7QHTcwVwLvLDFrE9
 s7ctmZf3RJxx5qJ11ntyqKb+SKU3Yg4fg4YLok/BEc6uCuzF7PHo126DA
 xcwPRtnYS65kKXQjT8aUSBx5dutAT8iVqe5aO9ehvgXfs6GgKv6vRVJFM
 srKr9mz/iwZv8awU/yHc7hAdul8RF+nojpmE0qmmaTtrbrRWsOaJDid2I
 79RWJBJmUxNY78kSnReuKc9PxL2vZ6op0rc2Lq9M78mc0clSy8Hp+TBdE Q==;
X-CSE-ConnectionGUID: LvGccD66SoihgBooi0eFCw==
X-CSE-MsgGUID: 4mlQAKsfQsqO3Eznc5JghQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87752316"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="87752316"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 07:02:32 -0800
X-CSE-ConnectionGUID: jv0JFVf1Tsivgm5hg/BYFw==
X-CSE-MsgGUID: fOIgURioSZ25TZB5mRhgMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="237421855"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 07:02:31 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 08/10] lib/kms: Rename 'pipe' variables to 'crtc'
In-Reply-To: <20260122125937.10807-9-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260122125937.10807-1-ville.syrjala@linux.intel.com>
 <20260122125937.10807-9-ville.syrjala@linux.intel.com>
Date: Thu, 22 Jan 2026 17:02:27 +0200
Message-ID: <838f416f838e9e6eb2b6bb889e0a298aba6795ad@intel.com>
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

On Thu, 22 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Rename a lot of the igt_crtc_t* variables to
> 'crtc' from the misleading 'pipe'/etc names they
> are using currently.

[snip]

>  /**
>   * igt_crtc_clear_prop_changed:
> - * @pipe_obj: Pipe object to check.
> + * @crtc: CRRTC to check.

*CRTC

Did you plant this to check if I actually read the patches? ;D

Can be fixed while applying.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


--=20
Jani Nikula, Intel
