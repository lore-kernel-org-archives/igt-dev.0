Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F76C5DF6D
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 05:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A695710E0B8;
	Wed, 19 Aug 2026 05:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OhmxiWBt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E6910E0B8
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 05:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787117076; x=1818653076;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LZ0ZC/4eMx2d5TFi6h+NHFBowlzFl8uv34Ohho3xhQ8=;
 b=OhmxiWBtpUV2gq+nez2vcQgVrm57Mmi6sPsJ3tSv9TYaNyuL1zc7+Fia
 moMStFgul7sqwx69bjBgwFBNVknv+56+kZmJg8HxV6wUna90zI87GLelo
 3h3jVHckUsR5zlYnIrEFWLn9cu9XnK0Bo1rprV1rsRz8BAO3qRsGzRJAi
 q7Iad1h4yrPXua0OXbs9V/cr3Dj56957/ww+Zo24/13jUnph/mGt39zd9
 8DzEqSJMghVjXn2PPSij7IqCzmdsT0YSWU9UxF+Dd759N6k+DjM3a4/ew
 UMDns/8vyvDLvT/TMoI7K0BRuLmBtHxtFdoUZY+nU1T9EifRkDBT8+KJJ Q==;
X-CSE-ConnectionGUID: 5802naygTrOgRpj6WJTPmA==
X-CSE-MsgGUID: tBT9YuvFR6W5ND4AZDzMsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="97956939"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="97956939"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 22:24:36 -0700
X-CSE-ConnectionGUID: 3AWatdYPSN+JV1o2pqW3KQ==
X-CSE-MsgGUID: vSckHlUnQlexwtPbdHWHzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="303647774"
Received: from rbalaar-mobl1.gar.corp.intel.com (HELO [10.247.151.71])
 ([10.247.151.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 22:24:36 -0700
Message-ID: <4bf86a0f-25a2-43d9-89b9-ed737d9b94a8@intel.com>
Date: Wed, 19 Aug 2026 10:54:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 2/4] tests/intel/kms_dp_linktrain_fallback: Reset
 traversed MST output count
To: Sowmiya S <sowmiya.s@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com
References: <20260817082612.1101382-1-sowmiya.s@intel.com>
 <20260817082612.1101382-3-sowmiya.s@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20260817082612.1101382-3-sowmiya.s@intel.com>
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


On 17-08-2026 13:56, Sowmiya S wrote:
> run_lt_fallback_test() tracks which MST outputs it has already
> traversed in a file-static counter that is never cleared. Today it
> has a single caller so the counter is implicitly zero, but a second
> caller would silently inherit the first run's state and skip every
> MST sibling as "already visited".
>
> Reset the counter on entry so the function is safe to call more than
> once per binary. The DSC path never reaches setup_mst_outputs(), so
> run_dsc_sst_fallaback_test() does not need the same treatment.
>
> v4: reworded commit message to explain this is a no-op prep patch
>      until run_lt_fallback_test() gains a second caller (Kunal)
>
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
