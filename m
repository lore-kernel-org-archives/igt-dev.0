Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107AAE6816F
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 11:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA84610E208;
	Tue, 17 Feb 2026 11:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DlEjlzmD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F68E10E4C1
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 11:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771326028; x=1802862028;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=napoLKbM/O76RNUlyUJ5IRXs2bxTi6CK9fcm6GA9T8A=;
 b=DlEjlzmD7oyq6AzrKtYFbQMC2wdNUIYaH+ivnY7g01fdkhwGavDjOAOk
 tslqLSIZWxinoQ8/zcY76odHQt+PCDYkCxI/kl5X5142fGK1U5T/saaf8
 6B90rt8jS64Bn7YHj42BkOGuoYFQfOVjGmgsZ8ixEI+hCeV68aHV33YfX
 dHbkFQVL3Mzmv3K1o7EPASI8oUdfBIRq5OBqaaoBm3t7ScI58KPFC4Siu
 W0VB33Rlq3fFTdG1gFSEd8+UGpjzqMONP1eXcmvbHMk0P9AJ85hBT5GF4
 oBQjrWGWIla2aRpBJN8l82i98b7tKt+cf0c3GvzhvcQEklRzR5VzjiNFi Q==;
X-CSE-ConnectionGUID: ivBMNc5mRgOFwl9Scuzj1g==
X-CSE-MsgGUID: 9Fx8gQp9SwaExhQtzuBqgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="89976247"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="89976247"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 03:00:28 -0800
X-CSE-ConnectionGUID: D1areMgCQfeSaUkrq31l3w==
X-CSE-MsgGUID: mf/RoeJCTFeQ+sYPqHk+yQ==
X-ExtLoop1: 1
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.125])
 ([10.245.245.125])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 03:00:27 -0800
Message-ID: <c806696e-7fc9-499c-8adb-b79aa7727c6e@intel.com>
Date: Tue, 17 Feb 2026 11:00:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/5] tests/xe_pat: Handle false-sharing on Xe3
To: priyanka.dandamudi@intel.com, zbigniew.kempczynski@intel.com,
 igt-dev@lists.freedesktop.org
References: <20260213084603.1404162-1-priyanka.dandamudi@intel.com>
 <20260213084603.1404162-3-priyanka.dandamudi@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260213084603.1404162-3-priyanka.dandamudi@intel.com>
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

On 13/02/2026 08:46, priyanka.dandamudi@intel.com wrote:
> From: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> 
> Add Xe3 settings which differentiates subtest behavior from Xe2.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
