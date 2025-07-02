Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BCCC7EE30
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 07:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98CC10E2A4;
	Wed,  2 Jul 2025 07:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TNATjuXI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9AE10E2A4
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 07:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751440222; x=1782976222;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=YdLsk4pvcgBEi+58GPOLf6MEKmTlzFUyvGSA8/pzDR8=;
 b=TNATjuXImOZOVQppX2EBdRHuflliZpaAQ1ViZTMg2lSNMwzT31E132/P
 r3PcgzEJcNugu+l5YIiq3h9mqUI9zOygiBWgtOp/+eC1wHCy9vTeTxv9e
 2+wxY0gJD5vN95NHbol2XuuPX08ejVb4fieaw5n2cR7j6KALE2H1e50F7
 OI4s+jENqePmdu5F8u41/nfelkWQKE3+Tg5Emo9RiPdTMtH7BSzDlfeXm
 WvATnrY5s2WMVC2QhsEtqeTC6ZYD/pIIcf/0Qv9MbYaVLeDn4d4ESjA2S
 S2gFbofVeXjVI+8ow6Y4RRnk/USL7alwzcac9lBAg6Lui4XoFhw28eLT6 Q==;
X-CSE-ConnectionGUID: cwD0i5ngRmaR3irBFKwz8w==
X-CSE-MsgGUID: gK5dR+WLS3SNCa2C0HbnFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57399594"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208,217";a="57399594"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 00:10:21 -0700
X-CSE-ConnectionGUID: SBP8+um9T0u/o7dCV5Br8Q==
X-CSE-MsgGUID: 6ya7atAVRCi7Cd2e99Vv9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
 d="scan'208,217";a="154152901"
Received: from supriya2-mobl6.gar.corp.intel.com (HELO [10.247.250.202])
 ([10.247.250.202])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 00:10:20 -0700
Content-Type: multipart/alternative;
 boundary="------------JNFcVrK95x0mWqKiUNkUmorV"
Message-ID: <c9ac4f2a-1f98-42ab-9d17-78ab89aa5dbf@intel.com>
Date: Wed, 2 Jul 2025 12:40:13 +0530
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
--------------JNFcVrK95x0mWqKiUNkUmorV
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
--------------JNFcVrK95x0mWqKiUNkUmorV
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

--------------JNFcVrK95x0mWqKiUNkUmorV--
