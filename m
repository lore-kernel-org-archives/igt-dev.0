Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510B7CCF9E0
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 16:43:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C411310E51C;
	Mon, 27 Oct 2025 16:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UmlPglaw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C559110E51C
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 16:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761583420; x=1793119420;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=25QJlGJJgjfN9KLtw+GBNJDfIrP6Rdc9NyrukIPQYaE=;
 b=UmlPglawtPxvVPsLnjMq83ndsMLHZrUOem6269LfHUWy44Rer6KhdrjN
 Jc4XXMicZP00/+WaGVoDRtFw9t2N7EYBJNKpY7NEavW7REdWXIC6Tx40p
 dQcmSq+6RmnioDzvnhYeQhST9p0HfPuUf0Dlx9dR59tUKqiVhiB2E6tQt
 v09gXryVxurVZND53T97OPsZL2QhADOXmFA9P1Qw+dnx6JGHTg5o6Q4a7
 gywlD+uzznUFIpxOB4fvREFIgl4m3CTOPQMkTRfOzrSxwbZdpUzqIxcET
 YtHERHlN2yc30WRB8x5B+b8NFxXwBhgGrMGAJ22OIOzPGVi9RFAB7ZOMR Q==;
X-CSE-ConnectionGUID: jgXlpMZ7SKuaeruzfH1jHA==
X-CSE-MsgGUID: oWl61e46SeqV/WKvadAK6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67504482"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67504482"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 09:43:39 -0700
X-CSE-ConnectionGUID: +4gptS1WRdS9ZTL9bohzfg==
X-CSE-MsgGUID: WgJ/Gm8NQI2yV8uHWXiqaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184269595"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 09:43:38 -0700
Date: Mon, 27 Oct 2025 17:43:22 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Gustavo Sousa <gustavo.sousa@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: Re: [PATCH i-g-t v1 0/2] Sync PCI ids with kernel: split BMG to
 BMG-G21 and add NVL-S
Message-ID: <20251027164322.ht4lppo5cmnjxmqb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 igt-dev@lists.freedesktop.org,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>
References: <20251024121517.73013-1-kamil.konieczny@linux.intel.com>
 <3loc66jqittg2apyos7jvnn73r3p3jkcdlzua5icxlgxuncxev@fve2uvhiqyt6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3loc66jqittg2apyos7jvnn73r3p3jkcdlzua5icxlgxuncxev@fve2uvhiqyt6>
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
On 2025-10-27 at 09:25:12 -0500, Lucas De Marchi wrote:
> On Fri, Oct 24, 2025 at 02:15:15PM +0200, Kamil Konieczny wrote:
> > This syncs Intel GPU PCI ids with drm-next kernel commits
> > 
> > edb660ad79ff ("drm/intel/pciids: Add match on vendor/id only")
> > 78de8f876683 ("drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workarounds")
> > c002b1764e7b ("drm/xe/nvl: Define NVL-S platform")
> > 
> > Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
> > 
> > Kamil Konieczny (2):
> >  lib/pciids: Split out BMG-G21
> >  lib/pciids: Add NovaLake NVL-S PCI ids
> 
> any adavantage on splitting the sync? I'd rather just have one and
> already go with the tip of drm-xe-next, which also contains the PCI ID
> for Crescent Island that we are also upstreaming:
> 5e0de2dfbc1b ("drm/xe/cri: Add CRI platform definition")
> 
> thanks
> Lucas De Marchi
> 

It will be a little clear in git log --oneline, but I could also
squash them if you prefer it.

Regards,
Kamil

> > 
> > lib/pciids.h | 21 +++++++++++++++++++--
> > 1 file changed, 19 insertions(+), 2 deletions(-)
> > 
> > -- 
> > 2.51.1
> > 
