Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CA8C7115D
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 04:34:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9669C10E139;
	Mon, 23 Jun 2025 04:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOeE/My7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA76B10E139
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 04:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750653263; x=1782189263;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=1PrEiUlKpth88B18GFwKwZGCcEkTBx//wrnYjeXTFcU=;
 b=EOeE/My7elBnrVGNMuO+6XY77uhVM0Fddcb4MdM6fYOCz4h6WPvoI6Cg
 OylRAsac5rs7ommBb6LyBO8wzWkI/XJ6YdbNLPteYXsg/eQ9MDdZ+Wd2O
 3C3oXv1PJmDAjk9dARgzUkwyaAeqycwTuIeBOh/iorRk/1W4lRzvQXYGH
 LsHa4KubCB/XBjoVqauTXdwn0Ruzo3ak2R8xPdmmGaoZtoKe2otRuDcrQ
 C2GSBSViT85X2DNWCk1mPR831lHmuBTJPhj5jKowENQPlliFyKcoqqHzl
 vDswkLPLL6lL+A9kYAY5ilpg74JkaWlg5x1MAB2Tj4EAjwZ75Fw8IPkkL Q==;
X-CSE-ConnectionGUID: YxzCdUROQpe76bUFfV3lqg==
X-CSE-MsgGUID: UcJlj/IxTiqLAWQTLAYM/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52978962"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208,217";a="52978962"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 21:34:20 -0700
X-CSE-ConnectionGUID: 8sAVrG2eQN+RvvWDd7VQxQ==
X-CSE-MsgGUID: OXw/bfw8Sead0DAQ/irXww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
 d="scan'208,217";a="182520676"
Received: from dmanur-mobl2.gar.corp.intel.com (HELO [10.247.196.126])
 ([10.247.196.126])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 21:34:17 -0700
Content-Type: multipart/alternative;
 boundary="------------sap2jSq40FAVnFK2oczjNVoL"
Message-ID: <6aea4e2a-1794-4d6d-84ac-2a3a733f552c@intel.com>
Date: Mon, 23 Jun 2025 10:04:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/pciids: Add PCI IDs for xe2_hpg
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>,
 "Nikula, Jani" <jani.nikula@intel.com>,
 "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>
References: <20250620053818.3633618-1-kunal1.joshi@intel.com>
 <SJ1PR11MB6204E9C31BC2175CEBE0D5BF817CA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <SJ1PR11MB6204E9C31BC2175CEBE0D5BF817CA@SJ1PR11MB6204.namprd11.prod.outlook.com>
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
--------------sap2jSq40FAVnFK2oczjNVoL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Tejas,

On 20-06-2025 12:05, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Joshi, Kunal1<kunal1.joshi@intel.com>
>> Sent: 20 June 2025 11:08
>> To:igt-dev@lists.freedesktop.org
>> Cc: Chauhan, Shekhar<shekhar.chauhan@intel.com>; Nikula, Jani
>> <jani.nikula@intel.com>; Upadhyay, Tejas<tejas.upadhyay@intel.com>;
>> Bhadane, Dnyaneshwar<dnyaneshwar.bhadane@intel.com>; Roper,
>> Matthew D<matthew.d.roper@intel.com>
>> Subject: [PATCH i-g-t] lib/pciids: Add PCI IDs for xe2_hpg
>>
>> From: Shekhar Chauhan<shekhar.chauhan@intel.com>
>>
>> As per updated Bspec, Sync PCI IDs for BMG.
>>
>> Aligns with kernel commit 9b779ff ("drm/xe/xe2_hpg: Add PCI IDs for
>> xe2_hpg")
>>
> Change looks correct, but we do sync whole pciids.h with kernel pciiids.h, so we have only BMG change or whole file is synced?
>
> Tejas
Thanks for the correction, have sent new patch which sync's exact pccid 
file at the commit 9b779ff. Regards Kunal Joshi
>> Bspec: 68090
>> Cc: Jani Nikula<jani.nikula@intel.com>
>> Cc: Tejas Upadhyay<tejas.upadhyay@intel.com>
>> Signed-off-by: Shekhar Chauhan<shekhar.chauhan@intel.com>
>> Signed-off-by: Dnyaneshwar Bhadane<dnyaneshwar.bhadane@intel.com>
>> Signed-off-by: Matt Roper<matthew.d.roper@intel.com>
>> Link:https://lore.kernel.org/r/20250605190804.1287289-2-
>> dnyaneshwar.bhadane@intel.com
>> ---
>>   lib/pciids.h | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/pciids.h b/lib/pciids.h index d212848d0..86cd54764 100644
>> --- a/lib/pciids.h
>> +++ b/lib/pciids.h
>> @@ -853,7 +853,11 @@
>>   	MACRO__(0xE211, ## __VA_ARGS__), \
>>   	MACRO__(0xE212, ## __VA_ARGS__), \
>>   	MACRO__(0xE215, ## __VA_ARGS__), \
>> -	MACRO__(0xE216, ## __VA_ARGS__)
>> +	MACRO__(0xE216, ## __VA_ARGS__), \
>> +	MACRO__(0xE220, ## __VA_ARGS__), \
>> +	MACRO__(0xE221, ## __VA_ARGS__), \
>> +	MACRO__(0xE222, ## __VA_ARGS__), \
>> +	MACRO__(0xE223, ## __VA_ARGS__)
>>
>>   /* PTL */
>>   #define INTEL_PTL_IDS(MACRO__, ...) \
>> --
>> 2.25.1
--------------sap2jSq40FAVnFK2oczjNVoL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello Tejas,</p>
    <div class="moz-cite-prefix">On 20-06-2025 12:05, Upadhyay, Tejas
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:SJ1PR11MB6204E9C31BC2175CEBE0D5BF817CA@SJ1PR11MB6204.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: Joshi, Kunal1 <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a>
Sent: 20 June 2025 11:08
To: <a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>
Cc: Chauhan, Shekhar <a class="moz-txt-link-rfc2396E" href="mailto:shekhar.chauhan@intel.com">&lt;shekhar.chauhan@intel.com&gt;</a>; Nikula, Jani
<a class="moz-txt-link-rfc2396E" href="mailto:jani.nikula@intel.com">&lt;jani.nikula@intel.com&gt;</a>; Upadhyay, Tejas <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>;
Bhadane, Dnyaneshwar <a class="moz-txt-link-rfc2396E" href="mailto:dnyaneshwar.bhadane@intel.com">&lt;dnyaneshwar.bhadane@intel.com&gt;</a>; Roper,
Matthew D <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>
Subject: [PATCH i-g-t] lib/pciids: Add PCI IDs for xe2_hpg

From: Shekhar Chauhan <a class="moz-txt-link-rfc2396E" href="mailto:shekhar.chauhan@intel.com">&lt;shekhar.chauhan@intel.com&gt;</a>

As per updated Bspec, Sync PCI IDs for BMG.

Aligns with kernel commit 9b779ff ("drm/xe/xe2_hpg: Add PCI IDs for
xe2_hpg")

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Change looks correct, but we do sync whole pciids.h with kernel pciiids.h, so we have only BMG change or whole file is synced?

Tejas</pre>
    </blockquote>
    Thanks for the correction, have sent new patch which sync's exact
    pccid file at the commit <span style="white-space: pre-wrap">9b779ff.

Regards
Kunal Joshi</span>
    <blockquote type="cite"
cite="mid:SJ1PR11MB6204E9C31BC2175CEBE0D5BF817CA@SJ1PR11MB6204.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Bspec: 68090
Cc: Jani Nikula <a class="moz-txt-link-rfc2396E" href="mailto:jani.nikula@intel.com">&lt;jani.nikula@intel.com&gt;</a>
Cc: Tejas Upadhyay <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>
Signed-off-by: Shekhar Chauhan <a class="moz-txt-link-rfc2396E" href="mailto:shekhar.chauhan@intel.com">&lt;shekhar.chauhan@intel.com&gt;</a>
Signed-off-by: Dnyaneshwar Bhadane <a class="moz-txt-link-rfc2396E" href="mailto:dnyaneshwar.bhadane@intel.com">&lt;dnyaneshwar.bhadane@intel.com&gt;</a>
Signed-off-by: Matt Roper <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>
Link: <a class="moz-txt-link-freetext" href="https://lore.kernel.org/r/20250605190804.1287289-2">https://lore.kernel.org/r/20250605190804.1287289-2</a>-
<a class="moz-txt-link-abbreviated" href="mailto:dnyaneshwar.bhadane@intel.com">dnyaneshwar.bhadane@intel.com</a>
---
 lib/pciids.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/pciids.h b/lib/pciids.h index d212848d0..86cd54764 100644
--- a/lib/pciids.h
+++ b/lib/pciids.h
@@ -853,7 +853,11 @@
 	MACRO__(0xE211, ## __VA_ARGS__), \
 	MACRO__(0xE212, ## __VA_ARGS__), \
 	MACRO__(0xE215, ## __VA_ARGS__), \
-	MACRO__(0xE216, ## __VA_ARGS__)
+	MACRO__(0xE216, ## __VA_ARGS__), \
+	MACRO__(0xE220, ## __VA_ARGS__), \
+	MACRO__(0xE221, ## __VA_ARGS__), \
+	MACRO__(0xE222, ## __VA_ARGS__), \
+	MACRO__(0xE223, ## __VA_ARGS__)

 /* PTL */
 #define INTEL_PTL_IDS(MACRO__, ...) \
--
2.25.1
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------sap2jSq40FAVnFK2oczjNVoL--
