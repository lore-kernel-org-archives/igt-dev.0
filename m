Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A20CA0EE1
	for <igt-dev@archiver.kernel.org>; Fri, 30 Aug 2024 07:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B8C10E81B;
	Fri, 30 Aug 2024 07:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihFZh3VY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032CE10E81B
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Aug 2024 07:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725001544; x=1756537544;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wx+j0brUtEtkA//j7Hxonge/1VPTnHdG4u8ngWmDkGQ=;
 b=ihFZh3VYBcHIiuIgddO/zo4LmiaOsrD+LCOOZfgBqRRDkDsPIe0PLdmb
 ug86EAUnu59ty9tDkwiWu2jQaFr7761p7CLSn/XnOiwYYDu+UuCqam9UK
 ReVrxH2iWb9YOt0Qnm5rMsY/tRB1TXRri3Ov5mpDwpc6efNj06umT3JBA
 kYwAf6LmMdo81QAHM7P7MhZT65hJpq0AF+BUVqmL7sVJXS4ABV3SW2Vft
 t1x2233F+qSAk3KU0PYQq0Nrywc6gFzi47g/1DtRuFsFemewk/EqesS/k
 wDPC17EyEnMjnXlpf751WhqvLfn/cKCGjOMyehsXQgKZqvMs3xWJRt6pL w==;
X-CSE-ConnectionGUID: egJ0ouIISwK/uubcMlqAxA==
X-CSE-MsgGUID: tqULCPADS6WRtVBetBCWPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="49015943"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="49015943"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 00:05:43 -0700
X-CSE-ConnectionGUID: +3ffK82OQiK3d4ZWwlg8Hw==
X-CSE-MsgGUID: JmpBcSCyT1iSnXC/rNid2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="64170376"
Received: from swatish2-mobl2.gar.corp.intel.com (HELO [10.215.119.92])
 ([10.215.119.92])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 00:05:40 -0700
Message-ID: <b3d41a9f-f4f8-4db0-bb0a-552168a8f939@intel.com>
Date: Fri, 30 Aug 2024 12:35:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 0/3] tests/kms_plane_scaling: Update scaling
 functions to retry on valid outputs
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com, karthik.b.s@intel.com
References: <20240826045630.1340226-1-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20240826045630.1340226-1-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Ramanaidu,

There seems to be crashes with your PW. Please fix that.

On 26-Aug-24 10:26 AM, Naladala Ramanaidu wrote:
> It will retry scaling operation on next valid output if current output
> is unsupported.
> 
> Naladala Ramanaidu (3):
>    tests/kms_plane_scaling: Update scaling functions to return error
>      codes
>    tests/kms_plane_scaling: Update Multi-plane scaling functions
>    HAX patch do not merge
> 
>   tests/intel-ci/fast-feedback.testlist    | 212 ++++-----------
>   tests/intel-ci/xe-fast-feedback.testlist | 319 ++++-------------------
>   tests/kms_plane_scaling.c                | 299 ++++++++++++---------
>   3 files changed, 268 insertions(+), 562 deletions(-)
> 
