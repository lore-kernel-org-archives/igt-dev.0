Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0C7CCF9E3
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 06:30:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C7010E097;
	Tue, 11 Nov 2025 06:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kVe79Y/F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FFE10E097
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 06:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762842631; x=1794378631;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=E7qkpQOhWUWdxkJKnhNlfRqeusQk8xfz0hgQvqvWA5w=;
 b=kVe79Y/Fig6hCZUBOoMTDRqJjLxefLPoJNT7HH6+ABEkDiA+2D3DVIK9
 XUCsi/yFWZoyApw/+diK+u85CX9723qmLU7HeaDtJtoK2CKTnsIR5Tp+R
 00trrh7nNNruw+uMdUw6XCkOT/eJOZPKWxqtlQnqDakIghc4Hk5ag1/+E
 WN8U7WONgcUexrxdEyCWp2kZpx5wUA+7QWM+kmTp+sIYofbtmIUkN11+C
 dEir+VSXEuCOHuEcJdsTdCqxC7drBhiG+JS74RLg1Ian4mxdLs3VXszeh
 fNRkNtHlcRUMymWTA2/m6CAhjB6Tedwko0ZPJQhZJpfqeLBT94mWOCzvJ w==;
X-CSE-ConnectionGUID: 7QcZCVE8T92GfABspnwlBA==
X-CSE-MsgGUID: gx1grCtiQ5CQSrhnmUIRuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64786254"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="64786254"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 22:30:30 -0800
X-CSE-ConnectionGUID: RdyI5vd6QJanYCfJmllwgw==
X-CSE-MsgGUID: kd2Nm9QYSLOhbDRqqsJk1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188720120"
Received: from sanbuman-mobl.gar.corp.intel.com (HELO [10.247.200.233])
 ([10.247.200.233])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 22:30:28 -0800
Message-ID: <2c5bf478-202d-4c52-acc9-761ab86e5c43@intel.com>
Date: Tue, 11 Nov 2025 12:00:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1,6/8] tests/intel/kms_*: Remove FBC disable comment
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com
References: <20251110192454.44385-7-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20251110192454.44385-7-mohammed.thasleem@intel.com>
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


On 11-11-2025 00:54, Mohammed Thasleem wrote:
> Remove FBC disable workaround comments from tests.
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
LGTM
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
