Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDA0C25B74
	for <igt-dev@archiver.kernel.org>; Thu, 30 May 2024 05:36:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED1D10E448;
	Thu, 30 May 2024 05:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h/uKj1w6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B626310E448
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 05:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717047417; x=1748583417;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=T+bvo06aBXD6rXTNMUidS9yv834J96VoDlEKQ0r4p8Y=;
 b=h/uKj1w6CKjRXjlmRNDT+lomHuRg5K83Zx+ZJRvqOpVA5RKtTD80h8GS
 CPmwly05RY6T4Id3ml3MvGD9YH/A5H93H06KyDvTQuVqAdvikeZAwAbj0
 c3xRqabF/k/5tz4bnFeUumjbv6pr5pJJWTjc1tPtMKMAV/o3Q/lp3JZrN
 E8hmSfTRq50hlPQ2yunpLmL3C073XISSVpO9OHMSohPdl14LrOPpvf8gB
 zNOQfV4txii3BWbLHjP6u9as4nckFugQX9P4OV/Hzd5jvB52MKNZr2hGo
 ijiapYb6jW3ds7hKhEQkHo5t/BGwySevNGZ6TfXZ445TgiNxZsz02ba1N g==;
X-CSE-ConnectionGUID: jnTxQMMKQHGGKNRifE08Dw==
X-CSE-MsgGUID: 201GNMgHSX+2FYST/q8nSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="17292600"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208,217";a="17292600"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 22:36:57 -0700
X-CSE-ConnectionGUID: U0hYYvaMTPmTpArzvNSK+A==
X-CSE-MsgGUID: dD7wLJLoRsKRM2ABZCM6hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208,217";a="35634318"
Received: from joshikun-mobl.gar.corp.intel.com (HELO [10.247.237.53])
 ([10.247.237.53])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 22:36:55 -0700
Content-Type: multipart/alternative;
 boundary="------------GIsvk4OBocoLs3NDpvx266cc"
Message-ID: <9b6ba7f4-16bd-48fd-912f-079f05719c09@intel.com>
Date: Thu, 30 May 2024 11:06:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,4/4] tests/intel/kms_psr_stress_test: Provide output to
 psr_wait_entry
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240521090233.1998323-5-jouni.hogander@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20240521090233.1998323-5-jouni.hogander@intel.com>
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
--------------GIsvk4OBocoLs3NDpvx266cc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/21/2024 2:32 PM, Jouni Högander wrote:
> Psr_wait_entry requires providing output if Panel Replay PSR modes are
> used.
>
> Signed-off-by: Jouni Högander<jouni.hogander@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
--------------GIsvk4OBocoLs3NDpvx266cc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/21/2024 2:32 PM, Jouni Högander
      wrote:<br>
    </div>
    <blockquote type="cite">
      <pre class="moz-quote-pre" wrap="">Psr_wait_entry requires providing output if Panel Replay PSR modes are
used.

Signed-off-by: Jouni Högander <a class="moz-txt-link-rfc2396E" href="mailto:jouni.hogander@intel.com">&lt;jouni.hogander@intel.com&gt;</a>
</pre>
    </blockquote>
    <span class="reviewed-by" style="box-sizing: border-box;">Reviewed-by:
      Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a></span>
  </body>
</html>

--------------GIsvk4OBocoLs3NDpvx266cc--
