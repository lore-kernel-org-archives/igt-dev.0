Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DD3C48260
	for <igt-dev@archiver.kernel.org>; Thu,  8 Feb 2024 17:54:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5653910E168;
	Thu,  8 Feb 2024 17:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FqNu/xup";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06AB210E168
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Feb 2024 17:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707414849; x=1738950849;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=uqJIckvpXv0vS5uth6ZA1G8OhGKRNgtmv0veefeZcmI=;
 b=FqNu/xupveJWDLEpPOjkUjmcgOtOpTGfwG9A3S3G3eOt+B5fjE5kgwka
 LfukfpIGbqsCSOByG2eM6BWfsmd1a8GCBwXUCftSwozn+9+4/uq/X78ud
 ppJKLbCjHbUmV9OMu+jrFyZXBGjnRGnx31Y0Dn+50AcBaxqcpsli0VeSV
 x5bezPUYM5dHLPfrCAKjSFH5XqS3qF6IdTZdAAmZuzqPvILOAtoSTklIM
 8q++LoTka+RzmPFIBCLXwMEzngLCpmEUFg70EaP63MApUcX8ZflNH+HDC
 R/mmMAraCFrmDAEmN/98SDn6h1lp+/btk55IaN1eCe0Aatx1ClSw1O1Tj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="5072238"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="5072238"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 09:54:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="6372910"
Received: from unknown (HELO localhost) ([10.245.101.179])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 09:54:07 -0800
Date: Thu, 8 Feb 2024 18:54:05 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [ANNOUNCEMENT] Lore meets IGT
Message-ID: <20240208175320.xvoc55mor4tdptyt@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi.

Thanks Mauro we may use b4 to annotate series with link to IGT
on lore (https://lore.kernel.org/igt-dev/).

We encourage to use it when commiting patches. Using it we may
easily find mailing list thread what is very useful to get whole
context regarding merged code.

For unfamiliar with b4:
https://b4.docs.kernel.org/en/latest/index.html

Generally before merging patches b4 might be used in form:

$ b4 shazam -l <msg-id>

like for series https://patchwork.freedesktop.org/series/129417/

$ b4 shazam -l 20240201171840.412905-1-zbigniew.kempczynski@intel.com

Thanks Mauro!

--
Zbigniew
