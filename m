Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5451FC83013
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 07:08:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0865310E279;
	Wed,  2 Jul 2025 07:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b4r4Zp19";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD7010E279
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 07:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751440096; x=1782976096;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=9TTXFi0jz7NmGF+UMNFXV9vAQldG8HeSk9yMDdnJpZQ=;
 b=b4r4Zp19tjSyLMmYiMFpR8g8sOFYOnx1tT7os9y+k+pI5PZdQSCPMTn0
 Byxl1lykNsYngX/iREXO7q6+nugD8mCBnbB4Rt3xDn8g5Ep91nhj6jqo1
 OdUrTyMfQlEVb2/zf1qIji8qTdRpUwshwph627f4rEsjTxOEmZ5QySysF
 zl92uM2FQmgMOjjwcrAOcu70ZoBEmNxlm3LlOVTE3n0JR+2cOwXFjfbAB
 r+j2S75Iot2nBg6NoZ5vKYLokVFa2CRvxyxzHC5dMIB8U0tu1HyWOOb/C
 7LSw5/oMcKv6zyAF7Ogd0c8afmjh2ptHBhRvQhrjTjeoNCZp3k9x+7D6t g==;
X-CSE-ConnectionGUID: +BAKezTpQseOtkpBdJEIHQ==
X-CSE-MsgGUID: p+Dbb5nhRNCA/qY6qdmSlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53834826"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208,217";a="53834826"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 00:08:15 -0700
X-CSE-ConnectionGUID: zX0bsXhCRfe3makuPD9X6w==
X-CSE-MsgGUID: nIiTSSZnQQSkywRiOhHGFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
 d="scan'208,217";a="154319520"
Received: from supriya2-mobl6.gar.corp.intel.com (HELO [10.247.250.202])
 ([10.247.250.202])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 00:08:14 -0700
Content-Type: multipart/alternative;
 boundary="------------uFdFwCgdiX1RwiGXaISRX8Zn"
Message-ID: <1d52bbd3-9b08-4bf4-b081-815712d4f00b@intel.com>
Date: Wed, 2 Jul 2025 12:38:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3, 6/7] tests/intel/kms_psr: Enable the tests support variations
 based on the WAs
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250630134145.836-7-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250630134145.836-7-mohammed.thasleem@intel.com>
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
--------------uFdFwCgdiX1RwiGXaISRX8Zn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

LGTM Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>

--------------uFdFwCgdiX1RwiGXaISRX8Zn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre class="content"
style="box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; display: block; padding: 9.5px; margin: 0px 0px 10px; line-height: 14.3px; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: white; border: 0px; border-radius: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><span
    class="reviewed-by" style="box-sizing: border-box;">LGTM
Reviewed-by: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a></span></pre>
  </body>
</html>

--------------uFdFwCgdiX1RwiGXaISRX8Zn--
