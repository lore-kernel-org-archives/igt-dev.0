Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAF6C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 15:00:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A72112AE5;
	Mon, 11 Mar 2024 15:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L1G3iqu3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AED4112AE5
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 15:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710169222; x=1741705222;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=T0KP8F/H3Ix8LRHAWyX6gD5LZWh8sjzmLqd4v6eMEG8=;
 b=L1G3iqu3ogtvW0mTAxzh26ltHzMfW/P1SHBmQ6Ji+N02HvR6Vc+LlSik
 REUlI1b12/cvRC5VVIbwjFjtcAZ/rtNw4yD+l9knjUjZ0FeP/x+L2FIiH
 kg2DbudQK9IsN7T/IeeoV/+LZXlCKJ9dogM1cxc+iO3ZGHgK17BA7AWIi
 0X9ASkSUi5mxWhSHo15UVC7/PvdDuHOhzHNCQjelCRTikLpS8palDMHe8
 DSoWArfBn3RN6PIytC1fNIBoWhv6VuQrkcuTcysAiH4bbdnXY/t4wCcDG
 uadf+1y22iT4ORXXW6kd+oalD7ZpMgDptA5/5KIArgLO70hTyoyS/Ue5V g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="27305225"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="27305225"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 08:00:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="42178329"
Received: from unknown (HELO [10.245.244.200]) ([10.245.244.200])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 08:00:20 -0700
Message-ID: <df874725-a65b-4a11-9f31-30d4a30e8406@intel.com>
Date: Mon, 11 Mar 2024 15:00:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/xe_ccs: Separate inc dimension start width
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240311114730.77947-1-zbigniew.kempczynski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240311114730.77947-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 11/03/2024 11:47, Zbigniew Kempczyński wrote:
> Instead of manipulating param width/heigth add dedicated variable
> used in inc-dimension subtests. This fixes issue when all subtests
> are run one-by-one what causes failures on comparing surfaces due
> to different sizes.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
