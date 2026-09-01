Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E53C624D3
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 16:42:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23CC510E406;
	Tue,  1 Sep 2026 16:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ai1TJnh+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E2210E406
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 16:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788280914; x=1819816914;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LzieaCxs4nVL6Q2E3sL/tB+h+4E7wfD/0n9M3BX1BIU=;
 b=Ai1TJnh+fsWdK0hBzaaK1KM5SMXpExAeSg9nl8jmIJ91Vrd3JNAtgFQ3
 6cXL0rP0dnlhQuPlND6IqRGubBSHo4+a80t+qm5M/CAlcBS14mSSzXSnl
 G/UNRiM7qKQn8CfYb2iVYoq6SSkTTo8LhGURx8XhtPqS6qdtHz15xTynr
 Lwom40V1d7F4dTcb4nQv764dIRfnMVaCq2lPFwErIYkCwOW8PG4O3wrx4
 eOpW/fawh68oYC4KH46WpE5vk/19RpOv06ZJRIu1X77jeOR+rt8oNI3vG
 hsGO+xygqpmQekL2c7CMulUTqN5nWNVuJz00wjoo7awVGZqYt0b4XN/Po Q==;
X-CSE-ConnectionGUID: kzE+UnFpTQ+VRWvFvFU1Wg==
X-CSE-MsgGUID: lI9mMJAYSfaUVlIr1vzvZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99881254"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="99881254"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 09:41:54 -0700
X-CSE-ConnectionGUID: PyJfvTPTQtCBg6AK15RR1g==
X-CSE-MsgGUID: bb8LZdtWSJiweMlCfrZrMw==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 09:41:51 -0700
Date: Tue, 1 Sep 2026 18:41:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly prosyak <vprosyak@amd.com>
Cc: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "Zuo, Jerry" <Jerry.Zuo@amd.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "chaitanya.kumar.borah@intel.com" <chaitanya.kumar.borah@intel.com>,
 "Broadworth, Mark" <Mark.Broadworth@amd.com>,
 "Hung, Alex" <Alex.Hung@amd.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH i-g-t] tools: rename HDMI compliance utility
Message-ID: <20260901164129.c2p7nrh3jiiiy55q@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly prosyak <vprosyak@amd.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>,
 "Zuo, Jerry" <Jerry.Zuo@amd.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "chaitanya.kumar.borah@intel.com" <chaitanya.kumar.borah@intel.com>,
 "Broadworth, Mark" <Mark.Broadworth@amd.com>,
 "Hung, Alex" <Alex.Hung@amd.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
References: <20260827185355.378279-1-swati2.sharma@intel.com>
 <20260828095854.7apqo5c7hy3n7oet@kamilkon-DESK.igk.intel.com>
 <7f78ff21-e4bf-417c-bf9d-c605b13a4beb@amd.com>
 <7fa2630a-424d-4156-b18d-0b4b3e50df23@amd.com>
 <CHXPR12MB9992204E4BC30CC3411A15975FE5AC2@CHXPR12MB999220.namprd12.prod.outlook.com>
 <33ec7288-0774-4449-8bd5-4215ca982ebb@amd.com>
 <96bd463b-6a25-4b3d-9eb3-80cdeccdf349@intel.com>
 <e022b211-4cb7-4f2f-9ab3-1872243de898@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e022b211-4cb7-4f2f-9ab3-1872243de898@amd.com>
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

Hi Vitaly,
On 2026-09-01 at 11:13:37 -0400, vitaly prosyak wrote:
> Yes,
> 
> Acked-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> 
> Thanks , Vitaly
> 
> On 2026-09-01 04:43, Sharma, Swati2 wrote:
> > Hi Vital
> >
> > Can you please rb if everything looks good at your end?
> >

Applied, thanks!

Regards,
Kamil

[cut]
