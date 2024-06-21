Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EFAC27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 09:18:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2680610F11E;
	Fri, 21 Jun 2024 09:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lvnZ3rHk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACC910F11E
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 09:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718961529; x=1750497529;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=FMjnOf+PnOTBEQJGPRpO1Ljb3oP3jqpvciWTy1sE8+8=;
 b=lvnZ3rHk9eVKKo29JsT8LBC/bEF1z+JIhB2ED8kFltDemyOX0kSmjrQS
 e0yf3jnamULdgXeql1UPphk/H+/NNzEiIhZeDIJxZsFq0jYZkrNhOFP4r
 GXJzdzSRS3p3pag+PsHW3wCbYU7/Hgx0JocirFeazuZalEzpnkF+PkRl/
 xpe97T/l6TWgxfrjESXCnFpWlYC8sdgCQM9zEIk59rbIuePDcJNKjx5fx
 OT7dFws6k8Av5mRS5q3KoCcQRyEDe4/bk5n674VsmoDYRZh0XE1S5PjUp
 acFVHvd5L1Vp9vNiLVc8ONNtCOeM2tB8gOtP1PY1nHDRZgNnqqXcAycrq Q==;
X-CSE-ConnectionGUID: YKYwJueyQ+erpv2V96c5nQ==
X-CSE-MsgGUID: 5gIuigf2QGenU5E7ntR97Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="16112476"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208,217";a="16112476"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 02:18:49 -0700
X-CSE-ConnectionGUID: GVRU3yIYSWaIieNB381Fjw==
X-CSE-MsgGUID: UBrSMbreS4mycPKfNI+8PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208,217";a="47723278"
Received: from unknown (HELO [10.66.103.214]) ([10.66.103.214])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 02:18:48 -0700
Content-Type: multipart/alternative;
 boundary="------------dbTX9HfpSlHH6ETKimtSlMZn"
Message-ID: <69ada70c-026c-47f3-90fb-c691e4bbbbb0@intel.com>
Date: Fri, 21 Jun 2024 14:48:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v3,6/7] lib/igt_psr: Fix PR_MODE sink support check
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com
References: <20240614053839.1822879-7-jouni.hogander@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20240614053839.1822879-7-jouni.hogander@intel.com>
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
--------------dbTX9HfpSlHH6ETKimtSlMZn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/14/2024 11:08 AM, Jouni Högander wrote:
> Panel Replay supporting PR_MODE_SEL_FETCH always support PR_MODE as
> well. Change sink support check accordingly.
>
> Signed-off-by: Jouni Högander<jouni.hogander@intel.com>

Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>

--------------dbTX9HfpSlHH6ETKimtSlMZn
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
    <div class="moz-cite-prefix">On 6/14/2024 11:08 AM, Jouni Högander
      wrote:<br>
    </div>
    <blockquote type="cite">
      <pre class="moz-quote-pre" wrap="">Panel Replay supporting PR_MODE_SEL_FETCH always support PR_MODE as
well. Change sink support check accordingly.

Signed-off-by: Jouni Högander <a class="moz-txt-link-rfc2396E" href="mailto:jouni.hogander@intel.com">&lt;jouni.hogander@intel.com&gt;</a>
</pre>
    </blockquote>
    <br>
    <p>Reviewed-by: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a><span
      style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------dbTX9HfpSlHH6ETKimtSlMZn--
