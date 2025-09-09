Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81641CA0FED
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 11:31:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B3C10E6CB;
	Tue,  9 Sep 2025 11:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="daOcpDgH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6944210E6CB
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 11:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757417475; x=1788953475;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=mmg8POBUDN7r0MV3J2wA6w1qDojkjl4NrJ7tGCGOuHQ=;
 b=daOcpDgHn5mXG3noLVkg2/12/NiVVqWbBoGx7NCslMmMUEBOEq1C0CE1
 gQPFVoSNyaCc/ZVdPpXentBVsNCUyGyadRpoRwkaesvVIYvgMhDbHqWoG
 brwqCeevhTWmLRMc0v8oZXVS3Abblgz2O8JIcQh5SNQle8KWVCpCBIiwV
 YSH6epr2niTavEY7Ry9ELMjgAjYk4bviADzIf4sTiHGfhmYAGiuKo5HF8
 k7JZ5yQrLvQaPAfauvZnp7e4i3oWNQGH4IfJFT5NYgzELv12bt5bt/KbU
 UrGJaJUJKobahCEYSqs/d8KKjhBmIsIYSRVe72aYUGEbKCW0yzxbf667t Q==;
X-CSE-ConnectionGUID: +qk95AQQTBOvZ1XtOwdJeA==
X-CSE-MsgGUID: dnMuWhK9SHW8DuMzx9CmKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59555894"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="59555894"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 04:31:14 -0700
X-CSE-ConnectionGUID: 52ZCuh9wRs2q9RpeG9adMg==
X-CSE-MsgGUID: ipys5kdlQXOFymG1Z/0VAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="177116776"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.129])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 04:31:12 -0700
Date: Tue, 9 Sep 2025 13:31:08 +0200
From: Pawel Sikora <pawel.sikora@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v9 1/5] docs: Set up MkDocs for documentation site
Message-ID: <20250909113108.ppmd4hwk3l4uxekf@pawelsik-desk>
References: <20250909084233.183885-1-pawel.sikora@intel.com>
 <20250909084233.183885-2-pawel.sikora@intel.com>
 <20250909102727.m6j7h6dkfiso7qnq@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250909102727.m6j7h6dkfiso7qnq@kamilkon-DESK.igk.intel.com>
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


Hi Kamil,

On Tue, Sep 09, 2025 at 12:27:27PM +0200, Kamil Konieczny wrote:
> Hi Pawel,
> On 2025-09-09 at 10:42:27 +0200, Pawel Sikora wrote:
> > This establishes the initial framework configuration
> > for the IGT GPU Tools documentation site using MkDocs.
> > 
> >  * Add mkdocs.yml for site configuration, including project
> >    info, navigation, theme, and plugins.
> >  * Create requirements-docs.txt for MkDocs dependencies.
> >  * Add extra.css for custom styling with Monokai theme.
> >  * Include logo and CSS assets.
> > 
> > For details regarding MkDocs please refer to:
> > https://www.mkdocs.org/
> > 
> > v2:
> >  - Colorblind friendly theme (Kamil)
> > 
> > v5:
> >  - Remove Intel logo (Lucas)
> >  - Remove unnecessary plugins/extras from mkdocs.yml (Pawel)
> > 
> > v6:
> >  - Add information about MIT licence in footer
> >  - Change Download section to separate .md page instead of url
> > 
> > Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
> > ---
> >  docs/css/extra.css         | 323 +++++++++++++++++++++++++++++++++++++
> >  docs/requirements-docs.txt |   7 +
> >  mkdocs.yml                 | 191 ++++++++++++++++++++++
> 
> This looks almost ok, I am not an expert with www sites
> but do we need external dependency?
> 
> >  3 files changed, 521 insertions(+)
> >  create mode 100644 docs/css/extra.css
> >  create mode 100644 docs/requirements-docs.txt
> >  create mode 100644 mkdocs.yml
> > 
> [cut]
> 
> Found in yml file:
> 
> > +
> > +extra_css:
> > +  - css/extra.css
> > +
> > +extra_javascript:
> > +  - https://polyfill.io/v3/polyfill.min.js?features=es6
> 
> Can we avoid using it?
> 

Yes, I removed it.

> > +
> [cut]
> > +
> > +copyright: 'Copyright Intel, 2025 , made by IGT Team. SPDX-License-Identifier: MIT'
> 
> It is useally:
> Copyright © 2025 Intel Corporation
> 
> e.g. (c) year copyright-holder
> 
> Not sure also about 'made by' here. imho better:
> 
> Copyright © 2025 Intel Corporation . SPDX-License-Identifier: MIT'

Changed to this - thanks

Regards,
Pawel

> 
> > -- 
> > 2.51.0
> 
> Regards,
> Kamil
> 
