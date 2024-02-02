Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49ADAC47DB3
	for <igt-dev@archiver.kernel.org>; Fri,  2 Feb 2024 11:24:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E6010EBBB;
	Fri,  2 Feb 2024 11:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NxEhnxPc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B8710EBBB
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Feb 2024 11:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706873077; x=1738409077;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=S5kSaa0pV1L6H7rPDzvYZNXLfY1Xs+GLOsIGMXZxazI=;
 b=NxEhnxPcbNZSY+Cyq92l/0sApDNM0C04+mmtU9qVJZuZQxjgiFJj6CD/
 8uZZcLSJdi81iGt3DPd5cQ1OHMJLkX97LiNIkSlSNNACCxlvcKE2gm9uL
 795X7Zk4t5ECvZ4xJ/QNUoVG4amDpfxmAUdfaWLxpbAid6kUwojXKRRDQ
 9CWTQFeEjftiyWh5vKvL9suPMv4nMtlqkDS1Y9P/80oLvAeLUW/6REhCV
 U3PotH/h+RSRapzUUjezNDIiy++kgZJ9c5D8Z8Tee9sZDPj56YtRXpzlE
 +6uQU2Aybi5rccSo9oPpJMiJF/KFMbc7l7QSmHbxsDh8Oa1delWqYsJBC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="51904"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="51904"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 03:24:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="23339881"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 03:24:35 -0800
Date: Fri, 2 Feb 2024 12:24:32 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v2 1/3] lib/intel_device_info: set has_flatccs on LNL
Message-ID: <20240202112432.6iid7caquiys2rtf@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240201103017.321466-1-matthew.auld@intel.com>
 <94889edf-c50b-473b-9d9b-8d2f581d58b3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94889edf-c50b-473b-9d9b-8d2f581d58b3@intel.com>
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

Hi Akshata,
On 2024-02-01 at 21:33:50 -0800, Jahagirdar, Akshata wrote:
> 
> On 2/1/2024 2:30 AM, Matthew Auld wrote:
> > Xe2 supports flat CCS based compression, including igpu. Currently
> > HAS_FLATCCS() is incorrectly returning false on LNL.
> > 
> > Signed-off-by: Matthew Auld<matthew.auld@intel.com>
> > Cc: Akshata Jahagirdar<akshata.jahagirdar@intel.com>
> > Cc: Zbigniew Kempczyński<zbigniew.kempczynski@intel.com>
> > Reviewed-by: Zbigniew Kempczyński<zbigniew.kempczynski@intel.com>
> > ---
> >   lib/intel_device_info.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> > index a669797c3..64b5246b7 100644
> > --- a/lib/intel_device_info.c
> > +++ b/lib/intel_device_info.c
> > @@ -509,6 +509,7 @@ static const struct intel_device_info intel_lunarlake_info = {
> >   	.graphics_rel = 4,
> >   	.display_ver = 20,
> >   	.has_4tile = true,
> > +	.has_flatccs = true,
> >   	.is_lunarlake = true,
> >   	.codename = "lunarlake",
> >   	.cmds_info = &xe2_cmds_info,

Reviewed-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>

Please subscribe to igt-dev mailing list,
https://lists.freedesktop.org/mailman/listinfo/igt-dev

Please also do not use html in your replays, only plain text.

Regards,
Kamil
