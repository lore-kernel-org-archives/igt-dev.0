Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD85FF8868
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 16:03:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E281410E810;
	Mon, 27 Apr 2026 16:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JsCh4dv2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA8B10E80C
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 16:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777305807; x=1808841807;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VZqw3M9DzAlhdsO/LhDRpp+IDyk4QzDL16KGpKayLfE=;
 b=JsCh4dv2iYxZPMQOOLTSiXT5sRlhsrXUw6r6fmUPuhiuwTw1+pG7kLno
 STCjZuhvqbtac/RBpsmQZYbUty1bQ6hB5WanO1CbB2te6KEJxut3vR0KN
 xkyGr7K5ZBj+BrliS11VQv2/AwmtxH9Z29TJTv0nYsLc62L4sHge1EbQw
 LNAXJGnhSZBDvrsiHU129ZYd6bX9JxNUbmbjPG1J1Yst6x80pGASj6wUq
 ppYnVZuNtCI4avbMdVcjOJAIiMIPqHIHU2MkgPZOsT7Vmmw5azHG6a2wY
 doz4vzuTCAmienJFLuQMTTdkGfRlyJLhxeidc834m60c81OHds2jMrtxI A==;
X-CSE-ConnectionGUID: nDfSdR7rTE+7Ov7MJxv97g==
X-CSE-MsgGUID: aRzL/TyvS1SVgHjgEn0wVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="89285169"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="89285169"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 09:03:26 -0700
X-CSE-ConnectionGUID: AOS2QmBfSkibqWh35jcUPA==
X-CSE-MsgGUID: fY19gEsOTxKa6gtz5jtsXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="238710200"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 09:03:23 -0700
Date: Mon, 27 Apr 2026 18:03:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
Cc: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Nilawar, Badal" <badal.nilawar@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Musial, Ewelina" <ewelina.musial@intel.com>,
 "Zuchowiecki, Grzegorz" <grzegorz.zuchowiecki@intel.com>,
 "Girotra, Himanshu" <himanshu.girotra@intel.com>,
 "Grabski, Mateusz" <mateusz.grabski@intel.com>,
 "Drab, Pawel" <pawel.drab@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t] intel-ci: Add a testlist for D3cold tests
Message-ID: <20260427160320.tlrrwjbyvs3lar56@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Gandi, Ramadevi" <ramadevi.gandi@intel.com>,
 "Poosa, Karthik" <karthik.poosa@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Nilawar, Badal" <badal.nilawar@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Musial, Ewelina" <ewelina.musial@intel.com>,
 "Zuchowiecki, Grzegorz" <grzegorz.zuchowiecki@intel.com>,
 "Girotra, Himanshu" <himanshu.girotra@intel.com>,
 "Grabski, Mateusz" <mateusz.grabski@intel.com>,
 "Drab, Pawel" <pawel.drab@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20260422152254.858478-1-karthik.poosa@intel.com>
 <IA3PR11MB90130EA677C4CE6B8FC412C385362@IA3PR11MB9013.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <IA3PR11MB90130EA677C4CE6B8FC412C385362@IA3PR11MB9013.namprd11.prod.outlook.com>
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

Hi Gandi,,
On 2026-04-27 at 07:14:49 +0000, Gandi, Ramadevi wrote:
> Prefix with "tests/intel-ci"
> with that 
> Acked-by: Gandi Ramadevi <ramadevi.gandi@intel.com>
> 

I am fine with shortened intel-ci:

+cc Ashutosh, Karthik and Swati

Regards,
Kamil

> > -----Original Message-----
> > From: Poosa, Karthik <karthik.poosa@intel.com>
> > Sent: Wednesday, April 22, 2026 8:53 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
> > <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Vivi,
> > Rodrigo <rodrigo.vivi@intel.com>; Gandi, Ramadevi
> > <ramadevi.gandi@intel.com>; Musial, Ewelina <ewelina.musial@intel.com>;
> > Zuchowiecki, Grzegorz <grzegorz.zuchowiecki@intel.com>; Girotra,
> > Himanshu <himanshu.girotra@intel.com>; Grabski, Mateusz
> > <mateusz.grabski@intel.com>; Drab, Pawel <pawel.drab@intel.com>; Jadav,
> > Raag <raag.jadav@intel.com>; Poosa, Karthik <karthik.poosa@intel.com>
> > Subject: [PATCH i-g-t] intel-ci: Add a testlist for D3cold tests
> > 
> > Introduce a dedicated testlist for D3cold‑related tests.
> > This list is intended for use on CI platforms that support D3cold.
> > 
> > Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> > ---
> >  tests/intel-ci/xe.pm.d3cold.testlist | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >  create mode 100644 tests/intel-ci/xe.pm.d3cold.testlist
> > 
> > diff --git a/tests/intel-ci/xe.pm.d3cold.testlist b/tests/intel-
> > ci/xe.pm.d3cold.testlist
> > new file mode 100644
> > index 000000000..783859fc7
> > --- /dev/null
> > +++ b/tests/intel-ci/xe.pm.d3cold.testlist
> > @@ -0,0 +1,11 @@
> > +igt@xe_pm@s2idle-d3cold-basic-exec
> > +igt@xe_pm@s3-d3cold-basic-exec
> > +igt@xe_pm@s4-d3cold-basic-exec
> > +igt@xe_pm@d3cold-basic
> > +igt@xe_pm@d3cold-basic-exec
> > +igt@xe_pm@d3cold-i2c
> > +igt@xe_pm@d3cold-multiple-execs
> > +igt@xe_pm@d3cold-mmap-system
> > +igt@xe_pm@d3cold-mmap-vram
> > +igt@xe_pm@d3cold-mocs
> > +igt@xe_pm@vram-d3cold-threshold
> > --
> > 2.25.1
> 
