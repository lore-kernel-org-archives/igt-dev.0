Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E395AEB2700
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 10:31:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F7810E3A4;
	Wed, 11 Feb 2026 10:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="De8sE8ys";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9666910E38A
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 10:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770805868; x=1802341868;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=+YXllHtcPug4Dduz3aLmB8kjdNF8WyztW0HVCVfSXRA=;
 b=De8sE8ysFUpRGiEyd/fAsQa0kb4e3lVZ7KQy1jkBq7y1/eBfvSW8YwjR
 B+Nd/+7p0hJGASeoJNfGu/6Mzb4u3CBdp4HojJJD+p0yw5D4xHY4qckgA
 EbBUIoKnIimuDWSanYhWzgnm4C2TMBbt/j02a1Oiq9GgdS4AL7cAqwO3o
 esoKQoWLmdeP3Uf0n/cg/ZV65XHLL9ooujR8jZxcL9WtdO/CgY5aeQdSh
 Suz3HBvBTHtik/EqNWztpRj430/VHm9n5ZXvKXrFk0+JcF4cwxkkEpF4C
 Pk/zSRECYHhg6FHQuc508+Jn+OyXoAXleueua+v+uRNi3y/OKZoIw1Tqo g==;
X-CSE-ConnectionGUID: kAiu1CizQUCsDj0wb9jaZQ==
X-CSE-MsgGUID: mmqi9U+7Tiq4EJ7tPit1fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72137678"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="72137678"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 02:31:07 -0800
X-CSE-ConnectionGUID: MJe67z/vTvSf8EKBqsNeYg==
X-CSE-MsgGUID: FLdjcCxJQdePbGHw7LuOXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216719455"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.57])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 02:31:06 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 5/5] tests/kms: Introduce local 'crtc' variables
In-Reply-To: <20260210161016.29459-6-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260210161016.29459-1-ville.syrjala@linux.intel.com>
 <20260210161016.29459-6-ville.syrjala@linux.intel.com>
Date: Wed, 11 Feb 2026 12:31:02 +0200
Message-ID: <75d3c970cbe7defa8ecd7557dcd37390389e3ff0@intel.com>
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

On Tue, 10 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Try to collect most 'pipe' usage within each function
> to a single igt_crtc_for_pipe() call, and subsequently
> use the resulting 'crtc' (and 'crtc->pipe') where
> appropriate.
>
> This will help further cocci based cleanups around
> igt_crtc_for_pipe() usage.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


--=20
Jani Nikula, Intel
