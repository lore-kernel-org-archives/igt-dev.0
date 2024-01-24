Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68533C46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 04:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C6E10EF33;
	Wed, 24 Jan 2024 04:43:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDC510EF33
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 04:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706071429; x=1737607429;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=balWlPNLvpS2Th4El89tOV/WMZ6soYJacDc+vq79TAM=;
 b=ASVGGD+EBdES5GgW43onOZbPNdeQ2RwihzU8xqy1GgdBod5dzqDk8/ih
 dypCVGB4Ch3yfZSTmdK5Mp88IhBJQTY6CIktrPz/0ahP9ccRFLf3G+Zgb
 dCcAd16Eu2gd9P2osy9DSBUeWWZ0MO4wUTP7kBOwtyS6hzXNbICpaOzYJ
 ZmV+ek2auOgMFsXgzEBMMOs3lT1Cl0YCGYwENXXz9MVJ3jF/I+SfM6DXz
 TeWCRR9el5YEU6CjtSe7px0yVyU1DQcp/miMtTk8Ea93BrV+4aQPosYc1
 M4aL8tnudzAu8/EyHyyjW/KwVl4LY1pNs9baJd4q2iibGnc+ScshRykqb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="432892579"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="432892579"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 20:43:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="905482855"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="905482855"
Received: from unknown (HELO localhost) ([10.246.3.92])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 20:43:48 -0800
Date: Wed, 24 Jan 2024 05:43:45 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t] lib/xe: Boost prefetch size to 4KB
Message-ID: <20240124044345.krncezblcojr6r7z@zkempczy-mobl2>
References: <20240122154302.54660-1-matthew.auld@intel.com>
 <hz2mhm64qw3vusw4qgwvf5pvib3xskw6ldn7zjgjeqgfm7j5f2@swwcz2vw5s4l>
 <20240123055636.l367u7xqd6jcqygn@zkempczy-mobl2>
 <hdqniyfp5pdav3joeygl224j7t6kmukz5uwapnp6am54fjxow2@qhkhq472gka6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hdqniyfp5pdav3joeygl224j7t6kmukz5uwapnp6am54fjxow2@qhkhq472gka6>
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
Cc: igt-dev@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Tue, Jan 23, 2024 at 12:18:19PM -0600, Lucas De Marchi wrote:
> On Tue, Jan 23, 2024 at 06:56:36AM +0100, Zbigniew Kempczyński wrote:
> > On Mon, Jan 22, 2024 at 10:22:29AM -0600, Lucas De Marchi wrote:
> > > On Mon, Jan 22, 2024 at 03:43:02PM +0000, Matthew Auld wrote:
> > > > From: Lucas De Marchi <lucas.demarchi@intel.com>
> > > >
> > > > For Xe2, the prefetch for RCS is 4KB, so boost it.
> > > >
> > > > BSpec: 60223
> > > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > 
> > > 
> > > humn... looks like I forgot to merge this?
> > > 
> > > pushed now. Thanks for the reminder.
> > 
> > Nice, but where's r-b?
> 
> Note the 2 s-o-b, with me being the author of the patch.
> It wouldn't make sense for me to add a r-b on my own
> patch.
> 
> Would it make sense if Matthew added his? Maybe, but I don't think
> there's a real need in this oneliner where 2 devs agreed on the
> implementation.
> 
> Lucas De Marchi

In this case change is safe but I would like to avoid merging
code without r-b. Multiple s-o-b's don't replace review - otherwise
we could upstream most of the code without r-b, couldn't we?

Anyway - we can close this thread.

--
Zbigniew
