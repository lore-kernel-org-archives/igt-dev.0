Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE9CE77197
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 10:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FEA10E36A;
	Thu,  9 Jan 2025 10:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N30GpaQn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B00910E36A
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 10:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736418285; x=1767954285;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=E/CJYpvSX7LOWvNHrTHnFHYsOwp2H1Pp4vRL41kXhbk=;
 b=N30GpaQnFCmrbQJRXdc0c4VONZNKpmSILw785Vyuw0DP9uf1f/blICsT
 ZNmMSFF6WU1NxLufVBY9nILpMJaxR0jrp+hPnp2DHWN/yJ881ZPOjD+xA
 sHz+kn+Vyzg32o75tw7Jpj6Zy7JfGpTnaAjYQZBgFoaIVt0z6JhmuFKMT
 iMdRcz1tAhPOdR4V0AEgV8JDLroq2nDNFAHFteaPdN/SjsBIbMYKXtMZl
 h4dUbEv6VUwNS7EWumGzQ6RTLxFiNE8U3kWdxgqTELH1DCPIXPAsvzU8W
 9XJgECIYXl1H8mK4Pto9d3I5n1VzG5aZdenrJZUxg4jemLSVThH3AXude g==;
X-CSE-ConnectionGUID: 8oQSEDUJSPePxpU3ykyztA==
X-CSE-MsgGUID: pOxew5hoS+WdTT7CMDcY2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="59141604"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208,217";a="59141604"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 02:24:45 -0800
X-CSE-ConnectionGUID: 1fm+i2FoSYehU8mP5EnbPw==
X-CSE-MsgGUID: rIehbEBASTyvvogf6Md+/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
 d="scan'208,217";a="108473396"
Received: from vbandla-mobl1.gar.corp.intel.com (HELO [10.247.252.91])
 ([10.247.252.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 02:24:44 -0800
Content-Type: multipart/alternative;
 boundary="------------wYcTcplQ1GS3bwAIws5EYf0x"
Message-ID: <2d74a3a9-c0de-4db5-b63d-62b8e55fbbdc@intel.com>
Date: Thu, 9 Jan 2025 15:54:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v2,1/3] tests/chamelium/kms_chamelium_edid: Remove
 unnecessary hotplug detection in EDID test
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250107205434.969797-2-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250107205434.969797-2-ramanaidu.naladala@intel.com>
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
--------------wYcTcplQ1GS3bwAIws5EYf0x
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 08-01-2025 02:24, Naladala Ramanaidu wrote:
> Remove redundant hotplug detection assertion from
> test_suspend_resume_edid_change. Hotplug detection is unnecessary
> after modeset disable.
>
> Signed-off-by: Naladala Ramanaidu<ramanaidu.naladala@intel.com>
LGTM
Please add both change in single patch
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
--------------wYcTcplQ1GS3bwAIws5EYf0x
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
    <div class="moz-cite-prefix">On 08-01-2025 02:24, Naladala Ramanaidu
      wrote:<br>
    </div>
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">Remove redundant hotplug detection assertion from
test_suspend_resume_edid_change. Hotplug detection is unnecessary
after modeset disable.

Signed-off-by: Naladala Ramanaidu <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a>
</pre>
    </blockquote>
    LGTM<br>
    Please add both change in single patch<br>
    Reviewed-by: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a><span
    style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------wYcTcplQ1GS3bwAIws5EYf0x--
