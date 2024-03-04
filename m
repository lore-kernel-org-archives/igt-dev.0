Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A4BC48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 12:19:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742811120AA;
	Mon,  4 Mar 2024 12:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZWUpuBo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E09A1120A9
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 12:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709554759; x=1741090759;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=WHayFJdcNuWHCBZtFNCY2gv41WeyCgiJBPZ9Fq3YYEw=;
 b=YZWUpuBo8dUJXdiTS+wPt+Dng87uxFJWthzAzWUJH2xhNXhyH93Wpu/c
 jMZUXS6xVydz2/HbyWB36KhWL0gMu5coxXg+dxbi7pF9xryA5/v29ARc0
 XZaZM3qDjD/U6TdzoORnA6DChthFkJPRo10PtenTBA3kIr/zuILMRC1s4
 tpek0Ci0XaW5Rar96E6mSp2NxJxES8103PST5w53nh8AYq+G5ma6LEvN3
 lJtRAq85T3AtXT6ZjZOl28/FAVVg1wOCsC8Tuu1xWaJGSJYpDcysDEMp5
 0tZn/Qy1JERE0/cKT2RBtJbAqDFuh7YgutTSvRR3+qjmV3MhnjJZ5XO+f g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7852272"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208,217";a="7852272"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 04:19:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208,217";a="8932504"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.250.221])
 ([10.94.250.221])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 04:19:17 -0800
Content-Type: multipart/alternative;
 boundary="------------hJI352hetyiFo8GMnTVnxRmV"
Message-ID: <e7640307-8e00-46f5-9c08-47d5197e5683@linux.intel.com>
Date: Mon, 4 Mar 2024 13:19:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/5] lib/rendercopy_gen9: use MOCS index helper
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240301171618.395851-1-matthew.auld@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240301171618.395851-1-matthew.auld@intel.com>
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
--------------hJI352hetyiFo8GMnTVnxRmV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/1/2024 6:16 PM, Matthew Auld wrote:
> UC looks to be the sensible default here, since it will work with
> display engine if rendering onto scanout surface. Use the matching
> helper.
>
> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
> Cc: Zbigniew Kempczyński<zbigniew.kempczynski@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   lib/rendercopy_gen9.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index efd7cb37c..404406e5f 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -180,10 +180,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>   	ss->ss0.horizontal_alignment = 1; /* align 4 or HALIGN_32 on display ver >= 13*/
>   
>   	if (HAS_4TILE(ibb->devid)) {
> -		/*
> -		 * mocs table version 1 index 3 groub wb use l3
> -		 */
> -		ss->ss1.mocs_index = 3;
> +		ss->ss1.mocs_index = intel_get_uc_mocs_index(i915);
>   		ss->ss5.mip_tail_start_lod = 0;
>   	} else {
>   		ss->ss0.render_cache_read_write = 1;
--------------hJI352hetyiFo8GMnTVnxRmV
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
    <div class="moz-cite-prefix">On 3/1/2024 6:16 PM, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240301171618.395851-1-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">UC looks to be the sensible default here, since it will work with
display engine if rendering onto scanout surface. Use the matching
helper.

Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Zbigniew Kempczyński <a class="moz-txt-link-rfc2396E" href="mailto:zbigniew.kempczynski@intel.com">&lt;zbigniew.kempczynski@intel.com&gt;</a></pre>
    </blockquote>
    Reviewed-by: <span style="white-space: pre-wrap">Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></span>
    <blockquote type="cite"
      cite="mid:20240301171618.395851-1-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 lib/rendercopy_gen9.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index efd7cb37c..404406e5f 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -180,10 +180,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 	ss-&gt;ss0.horizontal_alignment = 1; /* align 4 or HALIGN_32 on display ver &gt;= 13*/
 
 	if (HAS_4TILE(ibb-&gt;devid)) {
-		/*
-		 * mocs table version 1 index 3 groub wb use l3
-		 */
-		ss-&gt;ss1.mocs_index = 3;
+		ss-&gt;ss1.mocs_index = intel_get_uc_mocs_index(i915);
 		ss-&gt;ss5.mip_tail_start_lod = 0;
 	} else {
 		ss-&gt;ss0.render_cache_read_write = 1;
</pre>
    </blockquote>
  </body>
</html>

--------------hJI352hetyiFo8GMnTVnxRmV--
