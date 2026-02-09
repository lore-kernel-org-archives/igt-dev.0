Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E54E81BA8
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 12:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3003710E3CC;
	Mon,  9 Feb 2026 12:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YLxbOqCP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3A810E3CC
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 12:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770638707; x=1802174707;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=HiUaBkfqHkvVLXUVYF/f9WnFAu9cPGEwGiBOLh/D5R4=;
 b=YLxbOqCPlmdBkMYn+52BSSRkAeLIrI83kMmI5g+oo1imZO2rLfyVncxb
 NbeMazcPds6f/YMaLaJa61ZY42rIeRad/LPJVhjOy3n2fpEYbt1/vdqCj
 dSk61hYtB6/dtiCmfAO2G8IkoM6EnrVbxdd+TvI0rQQuAf0YtFfBX0Hnu
 +l2Z03JvS36LsXKR1cfK9YN2fcksDKroefsZTz4Z6aJ6PkIp7ToRePX2x
 OOlKTHhCAG4cZWM7R5qzuHVLF0ucGeDz/vnGBdDYPLImw51NG34Aw/Beb
 riCPxGMJAW0w4rYbmDt5Gsf/8w/2m9wlIxzbsB2REYAw0sIOxFNFuCzrd g==;
X-CSE-ConnectionGUID: 0TO7hFmTQXSfWZpiTXs9Hg==
X-CSE-MsgGUID: YyEdGC0/Q9SMh7ZqScB86g==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="83118543"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208,217";a="83118543"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 04:05:06 -0800
X-CSE-ConnectionGUID: evBOW26qS8SgpmfkGv1ZUg==
X-CSE-MsgGUID: y+DXn70EQwudFkS01u7iRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
 d="scan'208,217";a="210874734"
Received: from jthakur-mobl.gar.corp.intel.com (HELO [10.247.183.166])
 ([10.247.183.166])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 04:05:05 -0800
Content-Type: multipart/alternative;
 boundary="------------nPFJqbLTzHfF1oJPMZ6IgXSo"
Message-ID: <54960699-b2d8-4fbf-ae4b-b1872b694baf@intel.com>
Date: Mon, 9 Feb 2026 17:35:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v7,
 2/3] tests/chamelium/kms_chamelium: use helper function
 for connector lookup in DP/HDMI/VGA tests
To: Mohammed Bilal <mohammed.bilal@intel.com>, igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, sameer.lattannavar@intel.com
References: <20260203034546.1516152-3-mohammed.bilal@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20260203034546.1516152-3-mohammed.bilal@intel.com>
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
--------------nPFJqbLTzHfF1oJPMZ6IgXSo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 03-02-2026 09:15, Mohammed Bilal wrote:
> Use the connector_test() helper macro for chamelium hpd, audio, edid, and
> frames tests to iterate over and test all matching connected ports. This
> ensures clean skipping and consistent connector handling across DP/HDMI/VGA
> tests, and avoids unintended execution of unrelated fixtures.
>
> Signed-off-by: Mohammed Bilal<mohammed.bilal@intel.com>

Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>

--------------nPFJqbLTzHfF1oJPMZ6IgXSo
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
    <div class="moz-cite-prefix">On 03-02-2026 09:15, Mohammed Bilal
      wrote:<br>
    </div>
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">Use the connector_test() helper macro for chamelium hpd, audio, edid, and
frames tests to iterate over and test all matching connected ports. This
ensures clean skipping and consistent connector handling across DP/HDMI/VGA
tests, and avoids unintended execution of unrelated fixtures.

Signed-off-by: Mohammed Bilal <a class="moz-txt-link-rfc2396E" href="mailto:mohammed.bilal@intel.com">&lt;mohammed.bilal@intel.com&gt;</a>
</pre>
    </blockquote>
    <p>Reviewed-by: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a><span
      style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------nPFJqbLTzHfF1oJPMZ6IgXSo--
