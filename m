Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA11C4345F
	for <igt-dev@archiver.kernel.org>; Sun, 14 Apr 2024 05:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E6B10FE28;
	Sun, 14 Apr 2024 05:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RXA7jtUj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48B410FE28
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Apr 2024 05:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713074166; x=1744610166;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=qjLeTMc2+MLmifbTiGTP/uJNlI2/oahi1AK8SMmP0Mg=;
 b=RXA7jtUj0FzurdU6al8Cdz7aeY74NmvjuO4mHZ5J/HvHgY5tmvbZ7ezL
 5YCejZQ0j+TJzcIPq+X3N+PgV/6jNvXIvO16j55xrqJLZo/JkaA2gPhqu
 jvWzXE/Aaq6/Js0OO9+PzfArJ8uXm8F8hlKG7yvN8ZAd0KEme9VSFMH9k
 MehUoZxEcsT7hR2CLg1pJvRMPvku7EAbRH0VdxwlF4aKhhwD8em2Q8XTi
 N9ZYEjPNnZL+zXxu0La+DJbkfFQlqzJOlzHxBViruxCaQLOWCmsh1hcHQ
 lEAwPCTEhd6kmBd+CfPnmyuln5omNbFgMcthn7ksvYhun1owlW3muF1tO Q==;
X-CSE-ConnectionGUID: oGo8WeU4S52077B/fjzcTQ==
X-CSE-MsgGUID: G5KDKipSRi2SOXDAtAUezQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="19628876"
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; d="scan'208,217";a="19628876"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2024 22:56:05 -0700
X-CSE-ConnectionGUID: fviGie9gQOeDAcRxAi0Mxw==
X-CSE-MsgGUID: 7eZS6ueJTrqey3hDnHy7XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; d="scan'208,217";a="59020426"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Apr 2024 22:56:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 13 Apr 2024 22:56:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 13 Apr 2024 22:56:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 13 Apr 2024 22:56:03 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 13 Apr 2024 22:56:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElCZ9DElJUMVC3jJ66y7iAmJy7jqZCLsVObjPzG7ZV3fhTYBwq3igi0moscWmH/vvR2RbSjQst4P+9GZ2sYh38GGyOVDb3GDc7FfWMHG3gkrKvSbrWaKsfnDVJipIm6xS2Ocw4+6+yEZb3XFduA2PgT/ceOddtbiOH9OR5s6xGubkAr5xZsjzIGTvfY0KGRP/1us9J4H9XNBoZz0DAZtZneEmMRyQr6xYXIs6QG2XqRyCw8Gh1A0RJxSOJM5iydqgGGVxWFRDlLkvXx37dw66WI9NgFJgHP2fUiC2/JH3P7BFNciKwN/GfGTAejp9CZbIaed3r5XJ9H6KfpIfLXnXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxALcG+gNVR1VOX1BHzDOIlQQ59Kx4/+DZ8j7dOxcuA=;
 b=UOUhWMoxkVaQWp43nyEObCjFt9xpgS1gwQsL9Kfm95hpvzDhaRP62UvocxsA/U7md2MiZFXxv0x3nPZWwdIUD541pAm0so3zlAkxkM8fRiVCMlUEH+IjNUDp12orLy/mD1jBKL5kAkAx7YRgFv7L+8b76e+XvR7rM1G7zOAT7NnAFZo5uO6kzWGj32B0V+JPEmQ1zvxA8ESgNVxbubSlIB2BaR1fK0AeisNFdDjZAMPeGPjK2kQJEaVKWkNNzDhpd5zjKxjnT6437kTCdwVQ+9Y7NQ3UAlYT4GME57G4zbwGxN+oOjDtEycoUOlue1eGjjp+7Uf+pa8ltysKt9hohw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by CH3PR11MB8381.namprd11.prod.outlook.com (2603:10b6:610:17b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.29; Sun, 14 Apr
 2024 05:55:46 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6%4]) with mapi id 15.20.7472.027; Sun, 14 Apr 2024
 05:55:46 +0000
Content-Type: multipart/alternative;
 boundary="------------PEH2VsU0emi7JudqlQQ2dwB0"
Message-ID: <1aa480ba-d430-448f-91fa-71c9217627b3@intel.com>
Date: Sun, 14 Apr 2024 11:25:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/4] lib/kms: Introduce struct
 igt_forced_connector
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240411183450.6417-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20240411183450.6417-1-ville.syrjala@linux.intel.com>
X-ClientProxiedBy: PN3PEPF0000017C.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::47) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|CH3PR11MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: bc564250-1134-4f3d-9dc5-08dc5c4786e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LSCyIw4gyIhBUDd6Ty4kfPZikstz4uaGcDf4ThZSkP5vne/dd8FVxsEVn+6K42J/VvWz5LVgB+g5KrvjbtAuG++MwSbqhw1nh59UGekk3WGBwV1HDHq7JSUaNqEvcsX16lvJtnggu9nNKrH3OdOk089lV3/oTJxI88+fRaBsgSkZPvfc82mQ3d7TBf7C5hBcd0hAkLZuBgjefsf8ASSWRQJ3Ps2oLD2X5NmD175UXtheubE1PEKRU6uWdGpjWQKlpGiQXd+FaIpdJwmOSMVFXljnpYBkS13EJachDtBrlKEGabK6LedRMO6XN6ovzNHQ257LpUSLaSUQQNNnfZwaHqy9Pjr0tJvxVkcKSRQc9c9DBQCSfniyPnJS1NQ9cgf64kf8up7NqRtOjhgj7nQwNIJ9wrWggNzANViajkyc4rrrDMUwB1whJLM+loIwEB9LtOGsBwKMVA+jasvK3SfspUHNlCwieZKERgLGwFOp5WA9vVCk6142v+BDaXemWTVsEoM82RFcVvmMwN/493ZAoeIOpGTaYn1glnmTUaPvUgW6Me3EZ+BSIGvMt1xaflqSucQJ12wX4Sz7dfBpsfsMAUfrDu3FibLHOfuumw8ZpzDtUhW1xxTrdZ7fH8ChVvoSumcvcHcSoj9O4DpV/ZdziGO+K7Pakf0PJHFz5Pa4HtU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NE55ZVM3RUdFMFdsbS9uYUdlVXhqaVdqVEtCZHR3dXQwaHlMWjhMSjhRTUlB?=
 =?utf-8?B?dndVdHlNNVQxRVJSUFA3QlozcVdCNjZacG1ONHJjUVZRb1ZTMi9MZm85cDI4?=
 =?utf-8?B?MUdCakg2VlBMbzJWWlB0T2pDbTdZSXJRb1A4d2c4ait6emdpYSt6ZXc0ZHhQ?=
 =?utf-8?B?akM0VmRvSm1rK1ovMlU0blpNa3dXdFAxR0ZhQzZWd3gxVDFwMWNpRDE3dU51?=
 =?utf-8?B?SmMxeGFINjg3R0tadjZ6VmYrOSsxdjhxTFNVRXNqV1Y5UjQ3d3FFU1Z5NVcv?=
 =?utf-8?B?NlVLQ0ZHVXEzbG14anlXYmpna1A5ekttaVJTSUdkSmRFcVlhRGYybDJnT3Yy?=
 =?utf-8?B?em9GcDhwOXpYbmdwTUQ1OWlWa080SlY4eGdjU2Z2YXJmWnM3NytuRWI3SzlK?=
 =?utf-8?B?V2pRWC91OVlDSjZhWkRtei9NU2huN2xtQ3JhbWpWZ0hGUGV0SHlRRjlDY2U3?=
 =?utf-8?B?VmZBNEN4K0s0WGlxbEo1ck1zTEQ3Q3BnWWFzRUR4VkJmUmdtelVGUTVzR2Fp?=
 =?utf-8?B?MkNRNy9UTkpKdmJlY0Q2QTVqcmdOZmsyRlBoeS9ZTUk5dll3bzlyV0dSazVT?=
 =?utf-8?B?OTFudmJGWnMwT0FQUnFFSVZpMGtVcGduNXhBYmRMaWZoK3B6NGFhaXYzcUlq?=
 =?utf-8?B?U1JjK05vWlk3Z2hwUDFOZUlxWDBleU9ReHlyb3RiT1Zab054VmdxM080ai9i?=
 =?utf-8?B?Yi9reVpKTVJzaWp5ZVlLZTlrYVVRbFhVa3I1RUdHOVFVTE1oNmtidEx2SmlH?=
 =?utf-8?B?ZUpIendLSlk1aXU5dWc2L0ZTYVczYWYwZ1BIa2tEeFB1a0NXRGRCelhwQ2Fk?=
 =?utf-8?B?RDZCWmNBQnB0d2hHaDNkbEZDSWlZYzYwV2NBMXZySEo0enlnVGwrUW02czl2?=
 =?utf-8?B?Y0I3YW9hNWF4MXI2RzV2V09KQWlUd2M3YTBRSXpndHlBSU9CdEU3UDZHR1Ji?=
 =?utf-8?B?elFieDQrMTc3K2Ryay9abmdJUkpXY0ZZckpmWUdiWlBDT2xFVWkxY1Y5ZzlK?=
 =?utf-8?B?N1dVeUVLeDgyRVVQdmhuaXplczB5UnhhUGR4cVFQUnlWM1JCejNoYVpQS3U5?=
 =?utf-8?B?UUNCeWhRaWYzOWgzSjhZWjN2R25GREVTWThxRE0wMXdRM0oxOHV6a1lsWGFY?=
 =?utf-8?B?WUtzbHV3UDdPdk4rYVlnR1FMTDdzTVZmOWxVeXpiMXR5M241UXYvU0g2eVRJ?=
 =?utf-8?B?Nlo0a0l1TndMSStiVjNjQjd1THNCdnVnbGZ5Y2prdS9jN1NjclF6QnVudkRZ?=
 =?utf-8?B?QTJpR1NTMVJjVTl1cXNtdTBWMkg0dE0wdHFqZG9rYVBXUzhuYUtUb2ZWZUhP?=
 =?utf-8?B?aklOZEdnRis4ZjVzSlAyaXZKWFdlcXlhMGIyaHdscTNoWVR1bHprOUtEMHNM?=
 =?utf-8?B?SXREMWV4cGJmZmNJbjJTNkdWc3B1UnNDQ1pYQWxsNjhUOGVveS85V0RBQmlo?=
 =?utf-8?B?K25RVTdiYlNYaFpDQlF5SXB0Zm1CS0tHczU3SkJUUXYrSEZMOUR5UUJpL3Qr?=
 =?utf-8?B?SWhhdUZTSmZrcGxnYjRvbzNkcW5LUmphRnlaZVd2SGlRYWNIdk5JQ3JVVmtX?=
 =?utf-8?B?a0w0T3Zvc0JVNy9WYndzdHJWNVQ1aldNaEFmcUozNWhKTHNrMjhiQUhuVStk?=
 =?utf-8?B?RXlzWWZndVF3RzRxZktJSmtaL2FrMDJ3YTg3YnU2MVNjT1FGMGY3V2Q0dS8w?=
 =?utf-8?B?d29FeGxuTUJvMWV1UXBiT3BJR2FEcUFVUzU5disxRDdYS3VnNjlCTUpiS1Fj?=
 =?utf-8?B?MlpTN3QwclpNQ0h4WS8yMm9KSDc5ODJpTlFMWG5UaVllcWRpaFVEL1lraVVZ?=
 =?utf-8?B?ZDZwdk41M0ZRZ1BtT0dZOTcyU1N2cTlUNm9UM1FOK3N4S1hrN3loNE4wN00r?=
 =?utf-8?B?YW04RVpEKytkUnc0QktCYzdwL3ppemlzUGZxMFM0TE9jZkM1cDBtN1B4WUZJ?=
 =?utf-8?B?dC9HS2lEajIxN0pBT0NxcUdLNy9QeHZsNFF5dHQ2d0t1RDJVOHlXZUlIWFgz?=
 =?utf-8?B?ZWU1RC9WTC9UYjdITVA2RTMvTUJCZENGZEFUcXFjdWM4d3FpM0RjOWtyTWsr?=
 =?utf-8?B?SUo4U2w1UjFsUUNVd3RBYU03M2x4NHdWNi83VE5XUWdRMDZQZmlaVXUvZUFh?=
 =?utf-8?Q?vcphKCGoq1ehvSSlJ7E/6LxmL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc564250-1134-4f3d-9dc5-08dc5c4786e9
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2024 05:55:46.0186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1Oyt4yV73FUM85hv8xEUGKfo5PSItmktVAcMqCbOODWlOMhGmFAX1IqeCqzKfo+ogmxmYzu7gpRpsZtWAVQCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8381
X-OriginatorOrg: intel.com
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

--------------PEH2VsU0emi7JudqlQQ2dwB0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 4/12/2024 12:04 AM, Ville Syrjala wrote:
> From: Ville Syrjälä<ville.syrjala@linux.intel.com>
>
> Give the forced_connector[] struct a proper type name,
> and utilize it in various places to make the code
> less messy.
>
> Cc: Kunal Joshi<kunal1.joshi@intel.com>
> Signed-off-by: Ville Syrjälä<ville.syrjala@linux.intel.com>
LGTM
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
--------------PEH2VsU0emi7JudqlQQ2dwB0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/12/2024 12:04 AM, Ville Syrjala
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240411183450.6417-1-ville.syrjala@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">From: Ville Syrjälä <a class="moz-txt-link-rfc2396E" href="mailto:ville.syrjala@linux.intel.com">&lt;ville.syrjala@linux.intel.com&gt;</a>

Give the forced_connector[] struct a proper type name,
and utilize it in various places to make the code
less messy.

Cc: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a>
Signed-off-by: Ville Syrjälä <a class="moz-txt-link-rfc2396E" href="mailto:ville.syrjala@linux.intel.com">&lt;ville.syrjala@linux.intel.com&gt;</a>
</pre>
    </blockquote>
    LGTM<br>
    Reviewed-by: <span style="white-space: pre-wrap">Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a></span>
    <blockquote type="cite" cite="mid:20240411183450.6417-1-ville.syrjala@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------PEH2VsU0emi7JudqlQQ2dwB0--
