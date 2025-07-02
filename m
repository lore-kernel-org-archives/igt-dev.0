Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F99C83013
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 06:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B5510E279;
	Wed,  2 Jul 2025 06:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CnvPoSQy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B654110E00B
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 06:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751438459; x=1782974459;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=kqDu1bH0sAJRMkdWxo4nI9CMdWQGTn3CLdJgV0A5R3Q=;
 b=CnvPoSQyulbLDT483PyyROxFhxRNFh4I1AydXo/g9V+MIDJ1J2fzIX+f
 /ukh5L17aLgTTIt7+ABAVIZVqiXvG1WS5iEURH1gHRyi9EjoZOQpVCp8E
 oo56gBY4M4j+BCpGdEW11E8XsLvdjLlDY0faEP35M0xjBseB+2ciBVKC0
 ozrsCNWo7scFVbIA61kU2QrMTjIkPnweqHjW3H5RNZE//N2C6zS9bfC/b
 REZLi06DhU3qcIE/DKoyZ/cPrwyRIxKIZTh1xCzz49kRGaNFjnaeTooYi
 HteaR+M6e9iNm34YUCUK3NLnbHYfoC1dNVk8pZvr2JfyTFRaV1tdrMK+Z w==;
X-CSE-ConnectionGUID: gCuzsFTMRTePunWQxo2qQQ==
X-CSE-MsgGUID: zE65fm9HSLy2DK/C5MQW9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="52839226"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208,217";a="52839226"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 23:40:59 -0700
X-CSE-ConnectionGUID: TtMuIezjQ9uRHFQKxJsogQ==
X-CSE-MsgGUID: nSgzsIqFSPOIuPqkle7wPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
 d="scan'208,217";a="184938692"
Received: from supriya2-mobl6.gar.corp.intel.com (HELO [10.247.250.202])
 ([10.247.250.202])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 23:40:57 -0700
Content-Type: multipart/alternative;
 boundary="------------XlzLvMnPxd9S80vnaiQKmGZW"
Message-ID: <70b35726-c4d3-48a2-b083-663a3d62a03e@intel.com>
Date: Wed, 2 Jul 2025 12:10:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4,4/7] tests/intel/kms_dirtyfb: Enable the tests support
 variations based on the WAs
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250630134145.836-5-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250630134145.836-5-mohammed.thasleem@intel.com>
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
--------------XlzLvMnPxd9S80vnaiQKmGZW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 30-06-2025 19:11, Mohammed Thasleem wrote:
> This update stops skipping fbc-* tests support variations based on the WAs.
>
> v2: Updated function name with intel_is_fbc_disabled_by_wa. (Kamil)
> v3: Updated logic at igt_skip_on_f. (Kamil)
>
> Signed-off-by: Mohammed Thasleem<mohammed.thasleem@intel.com>
LGTM, Consider RB for patch 4-7 of this series Reviewed-by: Kunal Joshi 
<kunal1.joshi@intel.com>

--------------XlzLvMnPxd9S80vnaiQKmGZW
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
    <span style="white-space: pre-wrap"></span><span
    style="white-space: pre-wrap">LGTM, Consider RB for patch 4-7 of this series
</span><span style="white-space: pre-wrap">Reviewed-by: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a></span>
    <p><span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------XlzLvMnPxd9S80vnaiQKmGZW--
