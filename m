Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBD3C02193
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 17:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBB310E84D;
	Wed, 29 Jan 2025 17:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQG8kj+N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090A910E84F
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 17:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738171433; x=1769707433;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p9i5lH5pduldrrsxAN+eZ8JA3B6VEByGBpcPXjCE+Cs=;
 b=IQG8kj+NJxGESKuv+xDltoXwVchHz4mf8ArgPCZMf+/hGZ+wz4a4LBl0
 kLo3Iek3tU/9U8OCZKr91OeyKKJ9RZM2lgg3nDBFsSruoMI+oKpXqeBwU
 l0u0qJxourTcunGazgTIMpcpUHiq/rSGcQV6+ASd4xRAtl9lZO9p1FLi3
 F0zlV0XrvYWG2pPaJZiuDt7QPe73PYsP+jp78QV+b75AzrXXHTL8qP3vj
 hDVPUqOu89HdW4bCkqZJCoOHx+oqxbO7Skt2cEgOiYBSrKri+dJAycSIP
 LpAhlQyC1tmKmLVDLFpDQ5OTmTnHi4/iS4dbtwOkQ9KuthBs9m9FzaPi5 A==;
X-CSE-ConnectionGUID: VKbFo1K1R6avnhx3BwYPxg==
X-CSE-MsgGUID: vkj3rRLKSnOHTtTPL7SW/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="37895307"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="37895307"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 09:23:53 -0800
X-CSE-ConnectionGUID: 1h/E3b0JSLOVgbNiuCcdKw==
X-CSE-MsgGUID: rnajtTRaSrG3NFsJwnNQBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="139959452"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 09:23:51 -0800
Date: Wed, 29 Jan 2025 18:23:48 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v2 6/7] runner/settings: Serialize command line
Message-ID: <20250129172348.x5osrkk4yocdmdpk@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 igt-dev@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-7-lucas.demarchi@intel.com>
 <20250128183744.zegxv5uougqwvc4a@kamilkon-desk.igk.intel.com>
 <wfzokcb257qutd6324fku62dkdxkm552xtcftue7m2zaxdryuz@e5sdrclgnjxr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <wfzokcb257qutd6324fku62dkdxkm552xtcftue7m2zaxdryuz@e5sdrclgnjxr>
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

Hi Lucas,
On 2025-01-28 at 13:34:24 -0600, Lucas De Marchi wrote:
> On Tue, Jan 28, 2025 at 07:37:44PM +0100, Kamil Konieczny wrote:
> > Hi Lucas,
> > On 2025-01-21 at 14:57:32 -0800, Lucas De Marchi wrote:
> > > Serialize the command line to metadata.txt. The expected format in the
> > > metadata.txt is like below:
> > > 
> > > 	cmdline.argc : 6
> > > 	cmdline.argv[0] : ./build/runner/igt_runner
> > > 	cmdline.argv[1] : -o
> > 
> > Sorry for late reponse but imho it should be saved for debugging
> > purpose but not for reading this in metadata.txt, especially that
> > this option '-o' is 'override existing results folder', so it
> > should be used only once by igt_runner in setup phase but not for
> > igt_resume.
> > 
> > From igt_runner --help:
> > -o, --overwrite       If the results-path already exists, delete it
> 
> if you are using -o it's just because you don't care about the previous
> results and want to completely overwrite it.
> 
> igt_resume doesn't have any option - it doesn't have a -o and it
> basically does:
> 
> "Load the settings from the state dir back into the settings struct"...
> igt_resume will read it back and create the settings object.
> 
> The results.json as architected in igt_runner discards everything and
> is basically a conversion format from the state dir to a .json file at
> the end of the execution.
> 
> > 
> > imho we should save it into some different file and include it into
> > results.json
> 
> not sure I follow... metadata.txt has the details of how we are running
> igt_runner and it's basically a dump of the settings object. I don't
> follow what's the relation with the -o option you mentioned above.
> 
> End goal is to have the value in the results.json, but I see no reason
> why the intermediary state needs to be in a different file.
> 
> Lucas De Marchi

Well, what I try to comment on a commit description:

> Serialize the command line to metadata.txt. [...]

imho this should be written in setup.txt and setup.txt should be
included in results.json There is no need for igt_runner options
in metadata.txt, as it is used by igt_resume in shard re-runs
after a reboot happens in a middle of testlist.

Regards,
Kamil

> 
> > 
> > Also +Cc Petri
> > Cc: Petri Latvala <adrinael@adrinael.net>
> > 
> > Regards,
> > Kamil
> > 
> > > 	cmdline.argv[2] : --test-list
> > > 	cmdline.argv[3] : /tmp/testlist.txt
> > > 	cmdline.argv[4] : build/tests/
> > > 	cmdline.argv[5] : /tmp/results
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  runner/settings.c | 42 ++++++++++++++++++++++++++++++++++++++++++
> > >  runner/settings.h |  5 +++++
> > >  2 files changed, 47 insertions(+)
...cut...
