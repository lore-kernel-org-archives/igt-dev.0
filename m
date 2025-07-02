Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10AEC83013
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 07:11:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BB410E279;
	Wed,  2 Jul 2025 07:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQ0ejtr3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0374410E279
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 07:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751440285; x=1782976285;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=qynk4/6DHSUBwyGV7JcBvI1PKRNVeEfY7wTpifLRh4M=;
 b=DQ0ejtr3XrwMX5Cx6J8FQr0z04N5+7glIBRdpdkWLsvG4Gb7tUIGl8Dr
 MXTCjw9RKy0ZEsvoJyiejJDURjqiiScwg5B/Kh7822wj/V58NTMsYvD9d
 qCzQMyY9fO1qSiJahJKMemAwoH0Kpkp3EDehxhh132eZBQ2ZKPJc8Ewh+
 ouLCUefpz9R9U/kzRxdrd380/W0iNOH1PkK3BpEAgFkDmt6q3+eZ5P6z0
 N3bszlrRPzVpxKbwQJ0zI2dSKiRLE/jIBS4F5ZCdvjvB6ZihPD/K8at1D
 n0Sq8GIuxkPAByA1ekyG7TO4ZF3yoQs+Am6RhLp7glGqZccoZ5UuwVJh/ g==;
X-CSE-ConnectionGUID: bZWPC5FoT0yGb8QRPO9pXg==
X-CSE-MsgGUID: qLGSuRVVRt+sHcDDM41rTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57399709"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208,217";a="57399709"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 00:11:16 -0700
X-CSE-ConnectionGUID: VJxk/uO8Sda1ZwkhLHLrLQ==
X-CSE-MsgGUID: XJHM0dlZSCeGw+FRRjsQxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
 d="scan'208,217";a="154152985"
Received: from supriya2-mobl6.gar.corp.intel.com (HELO [10.247.250.202])
 ([10.247.250.202])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 00:11:13 -0700
Content-Type: multipart/alternative;
 boundary="------------eeTHy9uLihwL8Py0qWNtbjVy"
Message-ID: <88c0d83e-a0fd-4d2a-a1f1-5fb241ff8f11@intel.com>
Date: Wed, 2 Jul 2025 12:41:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3,7/7] tests/intel/kms_psr2_sf: Enable the tests support
 variations based on the WAs
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250630134145.836-8-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250630134145.836-8-mohammed.thasleem@intel.com>
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
--------------eeTHy9uLihwL8Py0qWNtbjVy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 30-06-2025 19:11, Mohammed Thasleem wrote:
> This update stops skipping fbc-* tests support variations based on the WAs.
>
> v2: Updated function name with intel_is_fbc_disabled_by_wa. (Kamil)
> v3: Updated logic at igt_skip_on_f. (Kamil)
>
> Signed-off-by: Mohammed Thasleem<mohammed.thasleem@intel.com>
LGTM
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
--------------eeTHy9uLihwL8Py0qWNtbjVy
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
    <span class="reviewed-by" style="box-sizing: border-box;">LGTM<br>
      Reviewed-by: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a></span>
  </body>
</html>

--------------eeTHy9uLihwL8Py0qWNtbjVy--
