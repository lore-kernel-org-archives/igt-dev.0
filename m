Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B44DC25B74
	for <igt-dev@archiver.kernel.org>; Thu, 30 May 2024 05:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6152810E448;
	Thu, 30 May 2024 05:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bu6uSlRj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943D910E448
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 05:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717047237; x=1748583237;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=XIwoF/qeA0vh4asG/bhm3lOmHdN9rJHecDUxekTZrr8=;
 b=bu6uSlRjkwMfiimKkgr77Tn2DVbm7qbyI0IwiFyPP0BD2pJfwoIwFsJf
 Ja1dzuLw9pTSruTRN9y0dCbAj9IofgvKPl9RmHywySjPXDVeumvrNY7CO
 SKLJa+eMP5c/rjoPFVkKZcKjr1XTqK87FNBBC4cS7Z+/NJz4ET6MrDb/g
 BiMURN3xfxNaerjGV2msb0fRQWNzJeQXKHdQOwkK3Pobvg7mTBt+XsmgH
 kD8sOb9W3Ti7cU7RoSTVWEI398cNuHg4weqLDmBYDu/ecmkZsKlsSWwdt
 km4GcxkjsBeYspOuAtkP9D5ET0ekAxo26ydg2GUBtHff6SYCYYUxdoZSc w==;
X-CSE-ConnectionGUID: 1SMLeNnMQfmsOFBllGesdg==
X-CSE-MsgGUID: GozYi4LCTmGbe6RtiJvNhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="17292238"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208,217";a="17292238"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 22:33:56 -0700
X-CSE-ConnectionGUID: VVJgrN8uRByEJGUli2omRw==
X-CSE-MsgGUID: TwzZTzF1RdGpLD88AiG81w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208,217";a="35633611"
Received: from joshikun-mobl.gar.corp.intel.com (HELO [10.247.237.53])
 ([10.247.237.53])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 22:33:54 -0700
Content-Type: multipart/alternative;
 boundary="------------7EqO1QNLitMhP9mEo29yatw0"
Message-ID: <ecaebadf-13fc-48ea-8128-229bc1f440a4@intel.com>
Date: Thu, 30 May 2024 11:03:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,2/4] lib/igt_psr: Psr status debugfs interface print
 "enabled" not "Enabled"
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240521090233.1998323-3-jouni.hogander@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20240521090233.1998323-3-jouni.hogander@intel.com>
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
--------------7EqO1QNLitMhP9mEo29yatw0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/21/2024 2:32 PM, Jouni Högander wrote:
> Psr status debugfs interface print "enabled" not "Enabled". Take this into
> account in psr_mode psr_get_mode.
>
> Signed-off-by: Jouni Högander<jouni.hogander@intel.com>

Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>

--------------7EqO1QNLitMhP9mEo29yatw0
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
      <pre class="moz-quote-pre" wrap="">Psr status debugfs interface print "enabled" not "Enabled". Take this into
account in psr_mode psr_get_mode.

Signed-off-by: Jouni Högander <a class="moz-txt-link-rfc2396E" href="mailto:jouni.hogander@intel.com">&lt;jouni.hogander@intel.com&gt;</a>
</pre>
    </blockquote>
    <br>
    <p>Reviewed-by: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a><span
      style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------7EqO1QNLitMhP9mEo29yatw0--
