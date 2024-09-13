Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC81EFC6166
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 16:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931F410EC85;
	Fri, 13 Sep 2024 16:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OOAug5OX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B0D10EC85
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 16:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726245642; x=1757781642;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OIEac/Ka2581bGQv8bWg+/CzINNijFHZ4Pn757nJk28=;
 b=OOAug5OX+ai0HkZlIROCci1QEiJkpRdSOfjLfcthsYCgUfLV9a2809Qw
 hdcOY3oKpdRx0XboWT0YzjKwSM5ny1A0wReF6Rzq0r45Xk6YgnqmfLpIr
 GhzlOunucweDu370ggZA5smQV3AI2piEeJXmCQlqzKm/XhHDnvJ60B72Y
 ae3C/BwbfbU82IimI7fSs4tiwXk56ojcc9YxsAVJ1bLtPHg/uUutSrMry
 zCDHKxrcJBmqePpwyG2UI9CW/gY8RY8KAR2qTXLTO1wJYw3754pU8HZzI
 wUxY2EgV9x7x6Ib6Dblnn3rWSn3sK/U5xKuslwttNgIx29Mk5VFuk3Go5 A==;
X-CSE-ConnectionGUID: FrtyxX5GT0GlHxYzoh3j1w==
X-CSE-MsgGUID: liIty0JZSuC+DLvbqxViyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25353168"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="25353168"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 09:40:42 -0700
X-CSE-ConnectionGUID: rDFJ2kbYSKai0r9MVWaX/A==
X-CSE-MsgGUID: aQpOKK7rTomr9H5p2Qqwjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="98969715"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 09:40:38 -0700
Date: Fri, 13 Sep 2024 18:40:15 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: Re: [PATCH i-g-t v6 12/17] scripts/igt_doc: Add '--exclude-files'
 parameter
Message-ID: <20240913164015.n7ovzylh33eskefa@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20240905092812.94553-1-christoph.manszewski@intel.com>
 <20240905092812.94553-13-christoph.manszewski@intel.com>
 <20240909113125.ex5tvqjvnomavbv3@kamilkon-DESK.igk.intel.com>
 <20240909135742.sdv3s4fe2bmt6y4b@zkempczy-mobl2>
 <8b34f7f2-8968-4bb9-be5a-d77a8e420f42@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b34f7f2-8968-4bb9-be5a-d77a8e420f42@intel.com>
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

Hi Manszewski,,
On 2024-09-13 at 15:24:13 +0200, Manszewski, Christoph wrote:
> Hi all,
> 
> On 9.09.2024 15:57, Zbigniew Kempczyński wrote:
> > On Mon, Sep 09, 2024 at 01:31:25PM +0200, Kamil Konieczny wrote:
> > > Hi Christoph,
> > > On 2024-09-05 at 11:28:07 +0200, Christoph Manszewski wrote:
> > > > Currently the doc scripts relies on a static list of files passed
> > > > through the respective '<config>.json' file for generating
> > > > documentation. This results in a compilation error when we exclude some
> > > > tests from building since the doc script notices documentation generated
> > > > for missing binaries.
> > > > 
> > > > Make it possible to dynamically exclude files from doc generation using
> > > > '--exclude-files' parameter. Merge excluded files passed with that parameter
> > > > with files excluded from the test config '.json' files. Align the behavior
> > > > of the '--files' parameter to also merge with files included from the config.
> > > 
> > > Could we get rid of this option and instead check if there was
> > > a binary file generated for a given C source file?
> > > As I understand it, we could skip C source checks if there are
> > > no binary generated.

Now I see I did something opposite, as Christoph wrote below.

> > 
> > I like this idea, I'll ask Christoph for drop exclude-files option and
> > check corresponding .c files only if binary exists.
> 
> I already replied to Kamil's patch and will include it in this series
> instead of this one. Note however that this results in generating
> documentation for tests that weren't included in the build. I was
> specifically trying to avoid that but since Kamil suggests a change like
> this I guess it's fine.
> 
> Thanks,
> Christoph

We could ask Jari or Katarzyna if that is ok, imho it is - we started to develop
those tests so it should be ok to have them in documentation.

Regards,
Kamil

> > 
> > --
> > Zbigniew
> > 
> > > 
> > > Or are there any other constrains like tests planned?
> > > 
> > > Adding Jari and Katarczyna on Cc.
> > > 
> > > Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
> > > Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> > > 
> > > Regards,
> > > Kamil
> > > 
> > > > 
> > > > Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> > > > Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > > ---
> > > >   scripts/igt_doc.py   |  3 +++
> > > >   scripts/test_list.py | 47 +++++++++++++++++++++++++-------------------
> > > >   2 files changed, 30 insertions(+), 20 deletions(-)
> > > > 
[...cut...]

