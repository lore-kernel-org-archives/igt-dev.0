Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE1DC04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 09:39:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224B510E5C6;
	Tue, 14 May 2024 09:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSpzVnxt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A6010EA5D
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 09:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715679572; x=1747215572;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=/sfxpfhApBmQL0Y+riC4AIC5YfjcsL1JdQxQvH3XuMs=;
 b=mSpzVnxtP7Bu7/kKatisneJv0fhIYHP/9gDQThwD/xdI3SxAM1GIpPBm
 mps5KXt7H9V9/QqrhH3BB0cKlvHnb3YMxt+BjIkszIifvii/CvRG/zL5W
 YkPycsL4Z/jW0K6V7Y25Yz8FJI35FPubA0DU+D9jT8wUq6fLbXR4pN2us
 9jMykD8LdJ40E4WUsQeA27v1ebZxXUCtGapUEOm+9ovFX4tSRxgQklGPF
 7x2akDuYqNSTYTBtD92+9BzldD6I+wwkPmeIEqPEm2mmZDLelRG+FFhon
 yI1N6gqG3MBVBU25ylgutKMmgeyK5JqSip9RGkppm5AVyxj5bB0poo8pB Q==;
X-CSE-ConnectionGUID: uTVFLU0XQFWqe3MTz6Cf6w==
X-CSE-MsgGUID: uihqjtrKRr2BYId2HfD4nQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11484371"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208,217";a="11484371"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 02:39:32 -0700
X-CSE-ConnectionGUID: XKbBBakfRbuQoi+yqrGchg==
X-CSE-MsgGUID: avMtppqCSsK+jhPhCQ99dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208,217";a="30578392"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.30.61])
 ([10.246.30.61])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 02:39:30 -0700
Content-Type: multipart/alternative;
 boundary="------------RCXzXJWSzPHCXfamKoVbpCXE"
Message-ID: <0f31f8bc-1ae3-4f71-b375-ce775ad4d23a@intel.com>
Date: Tue, 14 May 2024 11:39:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] lib/gpgpu_shader: add inline support for iga64
 assembly
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
References: <20240429-iga64_inline_ups-v1-0-2e9ac46cf6ba@intel.com>
 <20240429-iga64_inline_ups-v1-3-2e9ac46cf6ba@intel.com>
 <20240510104246.cpw4jvt3sj7ajw6u@zkempczy-mobl2>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240510104246.cpw4jvt3sj7ajw6u@zkempczy-mobl2>
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
--------------RCXzXJWSzPHCXfamKoVbpCXE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks for looking at the patches.

On 10.05.2024 12:42, Zbigniew Kempczyński wrote:
> On Mon, Apr 29, 2024 at 02:08:19PM +0200, Andrzej Hajda wrote:
> <cut>
>
>> +# check if we need to recompile - checksum difference and compiler present
>> +MD5_ASMS="$(for a in "${ASMS[@]}"; do echo "${a#*:}"; done | md5sum|cut -b1-32)"
> Why not use:
> MD5_ASMS=$(echo "${ASMS[@]}" | md5sum | cut -b1-32)
>
> I'm not sure but your check doesn't support function (asm) rename.

My version deliberately skips asm names because they are not passed to 
the compiler, so the output
of iga64 does not depend on it. But you are right, after name change 
output file should be regenerated.
Will be fixed.

Regards
Andrzej
> --
> Zbigniew

--------------RCXzXJWSzPHCXfamKoVbpCXE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Thanks for looking at the patches.<br>
    <br>
    <div class="moz-cite-prefix">On 10.05.2024 12:42, Zbigniew
      Kempczyński wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240510104246.cpw4jvt3sj7ajw6u@zkempczy-mobl2">
      <pre class="moz-quote-pre" wrap="">On Mon, Apr 29, 2024 at 02:08:19PM +0200, Andrzej Hajda wrote:
&lt;cut&gt;

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+# check if we need to recompile - checksum difference and compiler present
+MD5_ASMS="$(for a in "${ASMS[@]}"; do echo "${a#*:}"; done | md5sum|cut -b1-32)"
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Why not use:
MD5_ASMS=$(echo "${ASMS[@]}" | md5sum | cut -b1-32)

I'm not sure but your check doesn't support function (asm) rename.</pre>
    </blockquote>
    <br>
    My version deliberately skips asm names because they are not passed
    to the compiler, so the output<br>
    of iga64 does not depend on it. But you are right, after name change
    output file should be regenerated.<br>
    Will be fixed.<br>
    <br>
    Regards<br>
    Andrzej<br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
      cite="mid:20240510104246.cpw4jvt3sj7ajw6u@zkempczy-mobl2">
      <pre class="moz-quote-pre" wrap="">--
Zbigniew
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------RCXzXJWSzPHCXfamKoVbpCXE--
