Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899F2CA0EFC
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 12:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473DB10E116;
	Fri, 22 Aug 2025 12:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hj/HTtKu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E215510E116
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 12:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755865700; x=1787401700;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pvztyvDdxmpVc31bKKemGCnmraEvfVgyouK+7/Q6D88=;
 b=Hj/HTtKuc2d+WuqwkbdxBQ6CqxnYQcmMpAkb7kJsDffNrvCYNaTOxG+m
 lk9cTGsB5i4Xs/xYDhBClRjP31jh5sUGNRfPHnH9mVv29MXkHQ+pR7fix
 ktfb7wCx6DMGa+Nx/9WbQ54R3I9S9yzO5OZrDQbOrhzpUZMIQFQxH898K
 dqm+n3oPhjLue5uZZExSL0g4zcWLTd5RzPsc53LyMwDBohAjpeB79+d0x
 lxeNEVntTUBDMwqyr6aCCJ5g+YpsSLhSQAApKnmgaMwecRbxZ2xjBc1Ty
 s5YJS2sWBhpbDtTLir8+Tzd71wuCHhVBwSrRyGrSH2TndxeHX33V9jqJp w==;
X-CSE-ConnectionGUID: +VhmQiqTTR2TBfoSADWXmw==
X-CSE-MsgGUID: ZDI961fMQK6UjpLCxJ6EXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="60797714"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="60797714"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 05:28:20 -0700
X-CSE-ConnectionGUID: OvOllc+qQtCp3fX6eVphUQ==
X-CSE-MsgGUID: CrrpvYAnRC+ojJF5Qe790A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="168298173"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.190])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 05:28:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Pawel Sikora <pawel.sikora@linux.intel.com>
Cc: Pawel Sikora <pawel.sikora@intel.com>, igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Zbigniew Kempczynski
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v3 0/3] Establish MkDocs Documentation Framework
 for IGT GPU Tools
In-Reply-To: <20250822105101.7ottbv6sytmwmpjo@pawelsik-desk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250820052934.121604-1-pawel.sikora@intel.com>
 <4206527b03af5e923f42f6e1ec87e07c3935879c@intel.com>
 <20250822105101.7ottbv6sytmwmpjo@pawelsik-desk>
Date: Fri, 22 Aug 2025 15:28:14 +0300
Message-ID: <3d83d59669d62f004a507a25510b21f9bd273410@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 22 Aug 2025, Pawel Sikora <pawel.sikora@linux.intel.com> wrote:
> On Fri, Aug 22, 2025 at 12:59:26PM +0300, Jani Nikula wrote:
>> On Wed, 20 Aug 2025, Pawel Sikora <pawel.sikora@intel.com> wrote:
>> > I am submitting a series of patches to introduce a comprehensive 
>> > documentation framework for the IGT GPU Tools project using MkDocs.
>
> Hi Jani,
>
> Thanks for your feedback - below are my observations.
>
>> 
>> I'm extremely biased, but I think there'd be more synergy in using
>> Sphinx and reStructuredText, aligning with what the kernel, mesa, and
>> several fdo projects, including our maintainer-tools and intel-docs
>> projects, are doing.
>
> I agree that there would be more synergy and unification by using
> one tool instead of two, specifically by adopting MkDocs.

There are already two tools being used, Sphinx and gtk-doc. Three if you
count scripts/igt_doc.py.

It's not about adding a second one, it's about adding a third or fourth!

> The reasons for doing it this way are:
>
> 1. This is general-purpose documentation, and Markdown is sufficient.
>    If we need more complex usage, such as an API reference, 
>    we can still generate it using Sphinx and link to it as a subpage,
>    exactly as is done with the API reference in the fourth patch.
>    I consider it an advantage and a modular design approach,
>    as even documentation serves different purposes (general purpose,
>    API, backlog, feature mapping, etc.)
>    Having a different set of tools for different types
>    of documentation modules is a matter worth considering,
>    taking into account the maturity of the solution, of course. 

On the contrary, I don't think you can really get a unified experience
with 2-4 different tools. You'll get 2-4 different web sites with
completely different styles and navigation, and you're limited in the
cross-referencing between them.

> 2. There is already existing documentation in the project written
>    in Markdown, which is widely supported by editors. 
>    RST is primarily for Sphinx.

Sphinx does support writing individual pages in Markdown if that's
desirable.

> I understand that you have a bias, as do I. 
> However, I'm not so biased that I wouldn't be willing to drop the tool
> and start using Sphinx if my use of MkDocs here is rejected.
>
> Both are great tools, so why not use both and gain knowledge about them,
> rather than limiting ourselves to just one solution? 
>
> Especially since they can complement each other and be used side by side.
>
> This is just an example of MkDocs with Markdown, but the API reference 
> will continue to use Sphinx with RST.
>
> Is having a second choice of tools and methods for creating
> automatically generated documentation, and using it for different
> purposes alongside Sphinx, a waste of resources or rather
> an opportunity for the future to have more possibilities in this area?

I should think it's desirable for any project to focus on one
documentation tool, and one documentation build, not many.

I don't know enough about MkDocs to really say if it can cover all the
needs of IGT documentation, but I do know Sphinx can. (Granted, even
that does take some plumbing to convert from gtk-doc and to incorporate
scripts/igt_doc.py as an extension. But it's possible.)

I think the question to consider is, if you were to convert all IGT
documentation to one tool, as a long term goal, does MkDocs have you
covered? I don't know the answer to that question, and maybe you do.

Ultimately, you'll have to convince the IGT maintainers and
contributors, and maybe not so much about the relative merits of the
tools, but about the burden of the fragmentation. I think it's a real
issue in many projects. People are usually streched thin, and it's just
generally easier to have one way of doing things than many.

And in all honesty, I am not the one that needs convincing. I'm not
really contributing to IGT documentation anymore, no matter which tool
it uses.


BR,
Jani.


>
>> 
>> We also have extensive experience with writing Sphinx extensions in the
>> graphics community.
>
> I would like to expand my experience in this area, as I currently have
> experience writing MkDocs extensions, and I believe that could
> be valuable as well.
>
> Kind Regards,
> Pawel
>
>> 
>> 
>> BR,
>> Jani.
>> 
>> -- 
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
