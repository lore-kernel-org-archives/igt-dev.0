Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4059FC7EE30
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 07:06:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40DC10E00B;
	Wed,  2 Jul 2025 07:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qs8fErjn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B4410E00B
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 07:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751440013; x=1782976013;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=elLS/GFkAnGRgBtiBnbrj+QRRWTBYZQoUw7tTfGgNZQ=;
 b=Qs8fErjn5L9cXTa0lVa6++mAuIPWp/YpxeZw5Dqd+B2AtmecHLW8wsAx
 lBA7hUbrG4EWxcXCUsbOb9vt1WXHsLjYSGUHWXdzVhDOk80c99zS4YYuS
 CxOSUri7ch0ILPjXlh6g4Y0HiUT/smJ/OfsgRa4FnEJwzGPlgxk635bbU
 jbhjYMLa7NLTE0kKxDoBvL8jOH/rmDThE5BWRpwFADjbKmFTZv06JJDJl
 3dBNwhKu9CaLDrGSkUohGU64uXYNvVxuFLHK4oywaLYesrEmXB0Y163An
 KyNLLqL/jATiDWBJHGgb1b5lA3UJc90qgoAhE/RFJjNCcNSDculAGR6PK w==;
X-CSE-ConnectionGUID: tb5OhLjmTAqEGdUrYaoGUQ==
X-CSE-MsgGUID: wDdA+bN6T/S8OtDGOKzYjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64770764"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208,217";a="64770764"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 00:06:53 -0700
X-CSE-ConnectionGUID: JZpzr63lRuaZnRb0N8jW2Q==
X-CSE-MsgGUID: dgQZOsukS128+PZMQqogcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
 d="scan'208,217";a="154077486"
Received: from supriya2-mobl6.gar.corp.intel.com (HELO [10.247.250.202])
 ([10.247.250.202])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 00:06:51 -0700
Content-Type: multipart/alternative;
 boundary="------------OE9X5hph2fn1VZMHNMNOMADZ"
Message-ID: <79629dc3-ed74-43b3-8598-83c1c1d88e35@intel.com>
Date: Wed, 2 Jul 2025 12:36:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3,5/7] tests/intel/kms_fbcon_fbt: Enable the tests support
 variations based on the WAs
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250630134145.836-6-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250630134145.836-6-mohammed.thasleem@intel.com>
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
--------------OE9X5hph2fn1VZMHNMNOMADZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 30-06-2025 19:11, Mohammed Thasleem wrote:
> This update stops skipping fbc-* tests support variations based on the WAs.
>
> v2: Updated function name with intel_is_fbc_disabled_by_wa. (Kamil)
> v3: Updated logic at igt_skip_on_f. (Kamil)
>
> Signed-off-by: Mohammed Thasleem<mohammed.thasleem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
--------------OE9X5hph2fn1VZMHNMNOMADZ
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
    <div class="moz-cite-prefix">On 30-06-2025 19:11, Mohammed Thasleem
      wrote:<br>
    </div>
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">This update stops skipping fbc-* tests support variations based on the WAs.

v2: Updated function name with intel_is_fbc_disabled_by_wa. (Kamil)
v3: Updated logic at igt_skip_on_f. (Kamil)

Signed-off-by: Mohammed Thasleem <a class="moz-txt-link-rfc2396E" href="mailto:mohammed.thasleem@intel.com">&lt;mohammed.thasleem@intel.com&gt;</a>
</pre>
    </blockquote>
    <span class="reviewed-by" style="box-sizing: border-box;">Reviewed-by:
      Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a></span>
  </body>
</html>

--------------OE9X5hph2fn1VZMHNMNOMADZ--
