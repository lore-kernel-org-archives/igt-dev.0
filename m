Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383BACA0FE1
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 10:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E899210EABE;
	Fri, 22 Aug 2025 10:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DaJT4hop";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE94010EABE
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 10:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755859872; x=1787395872;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+qCrnlsYyaGjVwoVbadUEs5H7Z663gR5Whj8Zjj3Plo=;
 b=DaJT4hop6O2dPklF/Dgn9xV6EVs/4n6to0cocaCfcp+itmjP1//0CKUD
 ORU+vSYFv+/DdWKoE1x25EJxGrj4+OhHbidsnrVdwb54dKFAOSHX/7TYQ
 VduiZ8KJQZAoaVdru1kEiwBAjk4u7YGExkJWDmlUZSxbwBNIbDOXKCCRA
 3yVdZdRiXmU9vBW0qDjWR+n7ygEgM6GUenthntCcrtQgbfDNnQ7pBRWme
 XMas3pcVwv210lfQABu6aQFMfFpSWnBoZNTJnsJZUyGcRKhDW33OoMeYD
 NDmnsxOUOzBXQmQE/9qCGVORt81P8lU/pFbN1JxNdDd3dzhBD66ChTh1x w==;
X-CSE-ConnectionGUID: cspxMWFNQX6iEqIeBc/26A==
X-CSE-MsgGUID: bHqTDvxeSIKgwW8oM+PLUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58237977"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="58237977"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 03:51:10 -0700
X-CSE-ConnectionGUID: wexhwd/ORa2AjsahykORtw==
X-CSE-MsgGUID: wKgdJiHsQtm7cps/GArRcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="172943556"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.99])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 03:51:09 -0700
Date: Fri, 22 Aug 2025 12:51:01 +0200
From: Pawel Sikora <pawel.sikora@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Pawel Sikora <pawel.sikora@intel.com>, igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v3 0/3] Establish MkDocs Documentation Framework
 for IGT GPU Tools
Message-ID: <20250822105101.7ottbv6sytmwmpjo@pawelsik-desk>
References: <20250820052934.121604-1-pawel.sikora@intel.com>
 <4206527b03af5e923f42f6e1ec87e07c3935879c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4206527b03af5e923f42f6e1ec87e07c3935879c@intel.com>
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

On Fri, Aug 22, 2025 at 12:59:26PM +0300, Jani Nikula wrote:
> On Wed, 20 Aug 2025, Pawel Sikora <pawel.sikora@intel.com> wrote:
> > I am submitting a series of patches to introduce a comprehensive 
> > documentation framework for the IGT GPU Tools project using MkDocs.

Hi Jani,

Thanks for your feedback - below are my observations.

> 
> I'm extremely biased, but I think there'd be more synergy in using
> Sphinx and reStructuredText, aligning with what the kernel, mesa, and
> several fdo projects, including our maintainer-tools and intel-docs
> projects, are doing.

I agree that there would be more synergy and unification by using
one tool instead of two, specifically by adopting MkDocs.

The reasons for doing it this way are:

1. This is general-purpose documentation, and Markdown is sufficient.
   If we need more complex usage, such as an API reference, 
   we can still generate it using Sphinx and link to it as a subpage,
   exactly as is done with the API reference in the fourth patch.
   I consider it an advantage and a modular design approach,
   as even documentation serves different purposes (general purpose,
   API, backlog, feature mapping, etc.)
   Having a different set of tools for different types
   of documentation modules is a matter worth considering,
   taking into account the maturity of the solution, of course. 
2. There is already existing documentation in the project written
   in Markdown, which is widely supported by editors. 
   RST is primarily for Sphinx.

I understand that you have a bias, as do I. 
However, I'm not so biased that I wouldn't be willing to drop the tool
and start using Sphinx if my use of MkDocs here is rejected.

Both are great tools, so why not use both and gain knowledge about them,
rather than limiting ourselves to just one solution? 

Especially since they can complement each other and be used side by side.

This is just an example of MkDocs with Markdown, but the API reference 
will continue to use Sphinx with RST.

Is having a second choice of tools and methods for creating
automatically generated documentation, and using it for different
purposes alongside Sphinx, a waste of resources or rather
an opportunity for the future to have more possibilities in this area?

> 
> We also have extensive experience with writing Sphinx extensions in the
> graphics community.

I would like to expand my experience in this area, as I currently have
experience writing MkDocs extensions, and I believe that could
be valuable as well.

Kind Regards,
Pawel

> 
> 
> BR,
> Jani.
> 
> -- 
> Jani Nikula, Intel
