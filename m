Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBAAC27C4F
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 05:02:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD8610E759;
	Wed, 26 Jun 2024 05:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ayK7IGLU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9955510E76F
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jun 2024 05:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719378136; x=1750914136;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=bPf7WtODXCwoNF2irnlJtfWoliYuTfZIsL/RVzzuvrk=;
 b=ayK7IGLUp9pdeOAVel9gBrSqaouL59iW6VKQFzmJxV1rvFnDOSv562T3
 1RjelzN5h+Cx8BilL+ue9gSYDevQqZ4sx6MAdOBmZ+iT+oiGv5VmxnxWw
 qQ1PBYyEp4r/3rkRMU/IcCUtIaUL/sFVo7l0P2gPBTtDwtUFclqxMGCwx
 AJCmw7m8d91Y4acs7ztjsIcQPo2ihp1IA4UJzs6UpGzHnf7YKn5dsykFX
 +JvGyqwVLAOHXu+BMCfjBG4jdlR84eJYkW6K3JQcnFo02u57POrRHDAzD
 IOSCkTw+Ctp3qotvga8N1nL9eJAulSppfeNsMCjwZ8gQRrAqAhrMuPq42 A==;
X-CSE-ConnectionGUID: tYbUfaFKTT+JzdYcZ9vIoA==
X-CSE-MsgGUID: +nSeO9OkQJqAG2szdHqnmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="27117621"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208,217";a="27117621"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 22:02:16 -0700
X-CSE-ConnectionGUID: TusKdz0ESuq7GtxsAFetrA==
X-CSE-MsgGUID: XbNkZQ86Qqm2xATx/HLw1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208,217";a="43769295"
Received: from joshikun-mobl.gar.corp.intel.com (HELO [10.247.240.203])
 ([10.247.240.203])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 22:02:05 -0700
Content-Type: multipart/alternative;
 boundary="------------yi5lf8y6fIcZ8o0ARJ0LboVq"
Message-ID: <aabb925a-b578-407b-bbdd-05d6c019b539@intel.com>
Date: Wed, 26 Jun 2024 10:31:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,1/2] tests/kms_bw: add subtest for only connected outputs
To: igt-dev@lists.freedesktop.org
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
References: <20240619080408.1161329-2-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20240619080408.1161329-2-kunal1.joshi@intel.com>
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

This is a multi-part message in MIME format.
--------------yi5lf8y6fIcZ8o0ARJ0LboVq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/19/2024 1:34 PM, Kunal Joshi wrote:
> forcing DP connector doesn't work well and tests are skipping
> with unsupported mode, add new test which runs test on connected
> outputs only.
>
> v2: added debug print for better clarity of skips on unsupported mode
>
> v3: added new line in info
>      moved skip after test_init
>      updated test_init logic based on physical flag
>
> Cc: Aurabindo Pillai<aurabindo.pillai@amd.com>
> Signed-off-by: Kunal Joshi<kunal1.joshi@intel.com>
> Reviewed-by: Aurabindo Pillai<aurabindo.pillai@amd.com>

Hello Aurabindo,

Since the changes are minor i am keeping your rb, planning to merge this 
by EOD.
Please let me know if you see any concerns.


Thanks and Regards
Kunal Joshi

--------------yi5lf8y6fIcZ8o0ARJ0LboVq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/19/2024 1:34 PM, Kunal Joshi
      wrote:<br>
    </div>
    <blockquote type="cite">
      <pre class="moz-quote-pre" wrap="">forcing DP connector doesn't work well and tests are skipping
with unsupported mode, add new test which runs test on connected
outputs only.

v2: added debug print for better clarity of skips on unsupported mode

v3: added new line in info
    moved skip after test_init
    updated test_init logic based on physical flag

Cc: Aurabindo Pillai <a class="moz-txt-link-rfc2396E" href="mailto:aurabindo.pillai@amd.com">&lt;aurabindo.pillai@amd.com&gt;</a>
Signed-off-by: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a>
Reviewed-by: Aurabindo Pillai <a class="moz-txt-link-rfc2396E" href="mailto:aurabindo.pillai@amd.com">&lt;aurabindo.pillai@amd.com&gt;</a>
</pre>
    </blockquote>
    <p>Hello <span style="white-space: pre-wrap">Aurabindo</span>,</p>
    <p>Since the changes are minor i am keeping your rb, planning to
      merge this by EOD.<br>
      Please let me know if you see any concerns.</p>
    <p><br>
    </p>
    <p>Thanks and Regards<br>
      Kunal Joshi<br>
    </p>
  </body>
</html>

--------------yi5lf8y6fIcZ8o0ARJ0LboVq--
