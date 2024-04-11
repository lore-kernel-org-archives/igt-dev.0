Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE45CD1297
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 06:14:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CB610EE5E;
	Thu, 11 Apr 2024 06:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j8hNDnwV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2B910EE5E
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 06:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712816088; x=1744352088;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Yah7IyOUykqnXE/Wu0ZxxBWjTb9wxDT4zCm4mTHvXY0=;
 b=j8hNDnwVUPFoHuoF+Kg6c8I7F1Qh/NXgmZxApyko/+uFnEF9M7WqPQU4
 UglH1RjET+otHZhrw513TMfTruTyRv6KKcUoARpkO2O61QHly/jlsP8Pb
 3QzJJV939whw6HVzRPwIQ3Wyd2+dqW2XTtZhuROAZ9mWfMq/EgJrK+gDH
 zSZF5mCe7DOIf2jfXpiAzTIYCf9w6NeztKa9lIRTBE86oCzUxHuxiNsCq
 eSV1Lq+oTDy1e31ykbTURbAG/sOBZNMzpyp5Ke1tIuN0xVl+t316+iihN
 pT2+rmBy4wTAiThfClzJNkn8hztzIoIOOPU9x1YbZ8EolBYRatSuPZG5v g==;
X-CSE-ConnectionGUID: bSAckh//QOOBe53DB0gw0w==
X-CSE-MsgGUID: qvcDZhh6T6SmH9vJQt8rfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="33609054"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; d="scan'208";a="33609054"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 23:14:48 -0700
X-CSE-ConnectionGUID: EwA3o+zgTjW6vDhD+QQS7A==
X-CSE-MsgGUID: 567jYm6JTveK/KTCKcSy/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; d="scan'208";a="20753862"
Received: from joshikun-mobl.gar.corp.intel.com (HELO [10.247.209.96])
 ([10.247.209.96])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 23:14:47 -0700
Message-ID: <b09b5c8e-86f8-41f3-bff1-b9093bbee4f7@intel.com>
Date: Thu, 11 Apr 2024 11:44:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,1/3] lib/kms: Introduce struct igt_forced_connector
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240410150229.28922-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20240410150229.28922-1-ville.syrjala@linux.intel.com>
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


On 4/10/2024 8:32 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Give the forced_connector[] struct a proper type name,
> and utilize it in various places to make the code
> less messy.
>
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
LGTM
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
