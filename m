Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DB310706DE
	for <igt-dev@archiver.kernel.org>; Sat, 14 Mar 2026 14:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB19610E0FA;
	Sat, 14 Mar 2026 14:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O/vAsxUs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C2410E0FA
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Mar 2026 14:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773499909; x=1805035909;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=olk4jfkQL1tFCvThipalqW7XTPlJk7bQ0D36Q2p3cF4=;
 b=O/vAsxUsD85fXRpN8fnZ3fmuTKAyAGgDcfHwCejS9Wi1y7F4d8Nx5yJe
 0STmsjYC7fBIpLvoL9EEZwDtsI7T7stYT+gHeDzcUi2wPUH59Emob0mLj
 KIV5YjqSNz8h1ellO42QMqBglmFLYwm6klDct4faAoafJ5z68RWIIIwTD
 GaNYN7dr5YoIVwk43aBajK0OihFndlNvomTwnguMWFzb07W5Ce1i9y9ZS
 +whd/CXRjxvJXvDdnZ8HarI+aLA4WVyZXrC5/Z1+3wx+dBIJe8bQ2NTkQ
 hkDCr+dHP8kDLBgO6MYfdfCXnQRuZoX9t0BQATZ6yae9W56BYILPB9XRB A==;
X-CSE-ConnectionGUID: z3KhEI4zRcSe1RfrE1C+vQ==
X-CSE-MsgGUID: FOMrkdBgRfuRSimM/Fu22A==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="74616086"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; d="scan'208";a="74616086"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2026 07:51:48 -0700
X-CSE-ConnectionGUID: ZF7Bh6A7RaCm+MbxDZhvAQ==
X-CSE-MsgGUID: rJZHKyw7R3+UlKmEV3AX3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; d="scan'208";a="217798543"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2026 07:51:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 14 Mar 2026 07:51:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 14 Mar 2026 07:51:47 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 14 Mar 2026 07:51:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPRQ7BevZc75+RT5uFfwWFCVfNVTgZdbNrWxxTvfLngEXypcgRWOA/023BxSOySQD/8LkosPx/fFReJzvrkDkI9xpGnj8UvnxCR9A5tnfLEHYGmqwktKeKBATK2eBSlmREf27BF4dmPYYIZRVg8/9LCzzvUlipkmaIVDduz3v1S8nL3mJqu7MHaeUBp8pOM8BGBufsArBuzWckpEl1CpP80xjx3m/gQYrBwbjLYVERCn/YqGYEq64kzFfeOdqBxf0x2LUu7ETVpDzSAbLBB4NyvK+26NSOWx3qMiej9Jk9Fir916ZRpAeo5SI8KzM7GEh2YFOnZcGONapnhnLzqlmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFeoenSVQq+qus1DaLLiSXLHn5dlp9grfF4a45DFGiM=;
 b=ItCcU68fiskJ2JAHBoVcbchMXIrRoUvP7DHp+ik453sZTqaglQz18AX/EvQrdYDFHcYhngAakZsMtQc1qbPkWQFMUmxHHQhMvFJPnS+x5mb7/5gUZfKMkT9CFPS1UkC/A4KKXyNHq5pTIYa8TSmeLHgQyZoHknuR+LQ+7sQcD4JojDm5w/RcL/KhINHt6pnHv2dEryHTEcpApDI4kAaYv1XSBs/FZ9R2ceS6gwStGmfRToGCOTT+VDJHkJkDApl/Zx063hdd8lkzGRvNUlqhITmPdyE4zV82Z0kjAUMy28Daj5EE1N/+luk94lyFC0ZplAyUodnoAi+uNQAb8BmuEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by PH8PR11MB9534.namprd11.prod.outlook.com (2603:10b6:510:39f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Sat, 14 Mar
 2026 14:51:38 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.20.9723.006; Sat, 14 Mar 2026
 14:51:38 +0000
Message-ID: <d28a60bd-29ad-4513-84c4-bbcc2c58898a@intel.com>
Date: Sat, 14 Mar 2026 20:21:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v8 3/6] tests/kms_flip: limit output pairs when
 testing suspend
Content-Language: en-GB
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260309092528.3336467-1-michal.grzelak@intel.com>
 <20260309092528.3336467-4-michal.grzelak@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260309092528.3336467-4-michal.grzelak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0215.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::8) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|PH8PR11MB9534:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e36db8-5f63-4741-ff39-08de81d931e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: +MrA/SjxiJRiXIL4f1em8ySAQEkqaVW+CPYhmdexfVG3bCTuRaJS+t3t4i40CxQjrxi/9XyetpCTdhsL0ZdgBzSBco+C9L9XnjNFEry6mUsnD259prOQdLO1NrDodaKWqyu+lkWI0R70II4u3vU4//q+AFJ8/lBnfyzLQR81U4DFwgqdRNPxWlNzx5DVttBBNP1AgCgV6bh1SROGa7n33AVi5+TO5ENVPWyOZo3DVbsGnKNm/KH0YDCEdyStprpsond2UdhkzEiFzl9kBZMqrPXyn5oi07Y91CXpqJ6KmD/lsHSlZWdNLeZF1a5oiDyU3PHvynhpn3QKhp+G43yfiIpfZDHgJ0r4ZLHwEBCjntRnuutV3gQOJisAnXVecfeX8Ja0ltAvcfutV/jb3hvHJJZZUbePAWxZnUM8Uuh1WR9cBApPja0RtMSgK4ZZtwrebeXuhQ5P/Bbu7FlfUJ3wvZcVmUWrDh8GNmMClaXieeOjRlUlbuDebPijT9iLYMr91GYsEUNyBCOQ2RT6Z8iVIOHJ5B3Mgx9dNvZZRbqSZUrVshnnc9N1xHcIGUfZomcgITIy4ujDHoRTUrur9o+JY2xAKZWF0OZWWWuJHlI2qEoTDpUeI+SL6C0F9m3srx+fzHqhgecgN0SFNBi+k6EApigV0VUrlAwvqIvflRNAMe0Ctt45Vb7rfR0mLyiMzZvd40/wCkGE9KU0DMWqlEVgsFPN0/apHxzqh4DTq3kcO2s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTVFUmIvbnRpQjFtTTJoOWR4UDJ2UUYweUthYU1LaGZXYUtWU0crTzlVZFpK?=
 =?utf-8?B?WnVmNFJiOUFvcG9TN1krdXByRXZTR2NXeVBKZTluU0daSDFpT1VmSmEvb2E0?=
 =?utf-8?B?T3lQcnBMYVVNWkZFNktWd1BNSUxFWVgxOFo3NHQveHpBQS9aWHprd004SVc5?=
 =?utf-8?B?QndDM3BSMHVCL0o2cHlRTzVlYUxSZ1lhdjIwTkl2Nkhpai95b1kxSTFrMU5M?=
 =?utf-8?B?S0d3bTlVZ1UvUFFSbXFza3RibzN4cHQ1ajI1bnZXSHkxSUEwRURiVk9jdXZJ?=
 =?utf-8?B?T1RBNmM3Rnk2M0RRdHpFUXljS3p1MVZhendnS1lhaHNhWWltTFBkbzhlSFd0?=
 =?utf-8?B?djBJNG1QVHlnc0lTanJrZ04weDA5ekpTUTJocWFLYmduWitMeUp3VmJxaHE4?=
 =?utf-8?B?WDVBLzJhL053MXFjcVFIQnZXbGg5ckhPaWFSeHl0bGZxVnk5T3drKzBGcXpI?=
 =?utf-8?B?cXl0ZUZsOTFaL1N2aW54M0hEbElZNXp4MUNXcGdFL1hJYXl3THU2T3djT1Nu?=
 =?utf-8?B?RmZpUG4wSW1lcTErbENPV2xPaVRDd0tBYUk0Z1UwcEh1R1NZM2VwR21PSDc5?=
 =?utf-8?B?ckFYelVWK3Vyb0RPMlBIZGoxbWtEZUtZQXBQSVNLQ2RVU0E1SDlCSXhUZzkr?=
 =?utf-8?B?QkpjT1pIV1NRNlljTkJkVFU3Umx0VVRWOHZnTmVsdkdBODd6TldmMExOamdY?=
 =?utf-8?B?NU1tdmpoa1NDR2JlRjV6OTVlMEEwVjJGZUQrU0U1b1JuTDVscHNVaFZ1Mngw?=
 =?utf-8?B?cVRqcFpGQi9KOCtTakR1TTVYc0g1SnUwVExaRnM0RFljR0xrVUoyZXVkSmFm?=
 =?utf-8?B?TEg5ZTdDcWRQNkk3QlFUZnhzRHdtQUNVb3N0NjlkSC9oNHh6Vlp1TXZzRmI2?=
 =?utf-8?B?V0hSNEdqMUwxZERZZUtqempFVmhTUVVLVGNBZGgvNEkvb0dTMlBvd2MzRDJz?=
 =?utf-8?B?dVZHUTJmNlU1NVh1N3VGT1UxQVg4aCtidS9EYzlPVXVPelF1cVBhVSttQ2t2?=
 =?utf-8?B?SmtEcFpJTWZrMkpQNytXZ01FRkNlSGNsaXdMYi92ZDBjK1NHaDVWMFBreFZv?=
 =?utf-8?B?eTJzZWs5VVYvUVMwa3UzUnhkMk85WjA0c2F1aFZYZE51MzFqQWRjMFZDcEhj?=
 =?utf-8?B?VktBY3JJNjRqQlpsU0sxNmNRMSt1ZGhyWGhmNTYvQ0pqQ1Z0VVczMkJxRXIy?=
 =?utf-8?B?bDNWR2IyaGh2b0tNcWxsZTlTb2dPdC9jQTFRenpiMEJ0MGNIRFFQTmFRV2gy?=
 =?utf-8?B?RXV5K28rTWVwdWk2OUduaUlvb2lSYkk3bEY2OVNodVBvSlJnUTBRUFFUK1px?=
 =?utf-8?B?ZVJHS0FpUFdYanhYaVFDdkpwYkh1VUE3c1JTRUJzZ05TSEhoYm93TGVmTm9D?=
 =?utf-8?B?U0NWbFJNRjJhZUFIc3BMS2toVFBtY2tzM2ZtOFpJUTBERjVUTXdKdVlLMmpN?=
 =?utf-8?B?VmUvVFBGMzNYQWFhMjF3akduc0hQbjA0bW11eGZ3aEJnempFaWh3VUh3RDFo?=
 =?utf-8?B?bXNOUjY1ZGtybzdKV0pnSFl6d050K3gzaXhSYlRnbTFWQmkyQ3Z2UE1lZDBx?=
 =?utf-8?B?cGNFTkI2b0c0K2s1Y0hqUno2QTNlNkE4aUU2aWxQc21ST2dqbGY0QUkvRndm?=
 =?utf-8?B?TXREUlMvZ0t4bnEyRGNkVE1tbjZkbWpvT1ZvaHBNQTlmWS9QUm10L3M5ZDVw?=
 =?utf-8?B?OTdXR0pCOVNFcGNydFN1VzY0VHJKVjMzTzFTQnY2K1ZRZnR5b3FBeEdRYmpn?=
 =?utf-8?B?WHM0ZFlOUXpxV3lSeHl5MXI2dGw2QmFVSXR5Y2V4YzFyRW8xSjhoOTNWMGFJ?=
 =?utf-8?B?QXFEZVpDZnRVekpWa2UyUzNXWGo0OG9jbVRqMkRoN2w4RmVaOVppRk5nbHBN?=
 =?utf-8?B?blpXVWlTL29hMVRUK3RvZCtaU2xFeUI1dEQwYnRrYW9kM3FxZStLOHFyZWxq?=
 =?utf-8?B?R29zUVZFdkpzbUwzVStyU1ROMEcvL0JKQk5rSmN4b05CYXQ4RGlnaUpUejJ0?=
 =?utf-8?B?STFOcnV2b3Y2Y3U0bnVKM2VVQ3NVOTBHa2N0eUk3QVY3TUNETDNFUWZKMnNR?=
 =?utf-8?B?NEtWYzBNN0drYnNMS3hRREY4eWc1bS96SHNuWThjaENsNW84T1JhZmVnRGQ4?=
 =?utf-8?B?aElTekttWVUwVUJZRWdWVGg3b21OM0ZxNDV1UlEydjlRNEdnQnpyYlBORFFa?=
 =?utf-8?B?RDBKNXYwNDdCeVNDQnlxdWcwRUlSSTNETVl0eTFJSDcrNzVyTFdtUHJrNjFs?=
 =?utf-8?B?bklNV0VWQXA4dVk5alpIaFR3NTlPM2tSQnlFL3RHT29iaEJiMm1ueC9Ib2pK?=
 =?utf-8?B?encrVCtGMXZXUVNWNnBYWEVxWXVFL3N2bFFlb3lSRlRGUnEwdjRnUENHY1I0?=
 =?utf-8?Q?ZRtvlN2EbcpU26EI=3D?=
X-Exchange-RoutingPolicyChecked: dDcFc2ncwYT2j2dZqtpCJlw7mGmJd1UYMrcernqwXEORRGaOWlhlZrQwMq9BUmTQ3CXQb8Ihb8dA7nVDLvpP1Dgoispfl1QsIpmo3v1su/uVCsTqSL+vfDld0aQcFgGbz66pILffw+D1SnFvlEh1TZktQSmZgzjw1y6CTTDjaw24AvyhBPTfDzOkcEJRbO1myyrni8Q3vO/Dk8PHXCgga7tItIDvVzAqavBmA+guLVnT8kmywSgZDB58jJXM/D24QOMPtzUA7PD6R894KKZWQ3q+P65347jLJcRPySVxqOzI2u2pzCgsPKD+8nTvtxnP/ZU4RfUUDVCJaJQHxF4UUw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e36db8-5f63-4741-ff39-08de81d931e8
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 14:51:38.4546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tbyJD7yWRHeddDZ5spaCgGX0W6gr0MgwPy9R5jHa0vtI8C8vZjTAmhKjXhPIcNle68UjErdzePe7HgKdVhkCyoz+uhDNUFRoPqde0Wuqdgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9534
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


On 09-03-2026 02:55 pm, Michał Grzelak wrote:
> Currently 2x- subtests can still exceed timeout, even with limited
> number of pipes used. It can be seen when number of outputs is greater
> than 3.
>
> Default to testing at max 3 pairs of outputs. Add a commandline
> parameter enabling suspend testing on all possible output pairs. Add a
> LIMIT_PAIR macro which controls maximum number of output pairs to test.
>
> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
  LGTM:
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/kms_flip.c | 32 ++++++++++++++++++++++++++------
>   1 file changed, 26 insertions(+), 6 deletions(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index d09813f02..917c5ed6f 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -263,11 +263,14 @@
>   #define RUN_TEST		1
>   #define RUN_PAIR		2
>   
> +#define PAIR_LIMIT 		3
> +
>   #ifndef DRM_CAP_TIMESTAMP_MONOTONIC
>   #define DRM_CAP_TIMESTAMP_MONOTONIC 6
>   #endif
>   
>   static bool all_crtcs = false;
> +static bool all_pairs = false;
>   
>   drmModeRes *resources;
>   int drm_fd;
> @@ -1904,6 +1907,7 @@ static void run_pair(int duration, int flags)
>   {
>   	struct test_output o;
>   	int i, j, m, n, modes = 0;
> +	int pair_count = 0;
>   
>   	/* No tiling support in XE. */
>   	if (is_xe_device(drm_fd) && flags & TEST_FENCE_STRESS)
> @@ -1966,6 +1970,16 @@ static void run_pair(int duration, int flags)
>   				for (m = n + 1; m < resources->count_crtcs; m++) {
>   					int crtc_idxs[2];
>   
> +					/* Limit the execution to 2 CRTCs (first & last) for hang and suspend tests */
> +					if (((flags & TEST_HANG) || (flags & TEST_SUSPEND)) && !all_crtcs &&
> +					    ((n != 0 && n != resources->count_crtcs) ||
> +					    m != resources->count_crtcs - 1))
> +						continue;
> +
> +					/* Limit number of suspend tests */
> +					if ((flags & TEST_SUSPEND) && !all_pairs && pair_count >= PAIR_LIMIT)
> +						continue;
> +
>   					memset(&o, 0, sizeof(o));
>   					o.count = 2;
>   					o._connector[0] = resources->connectors[i];
> @@ -1977,16 +1991,18 @@ static void run_pair(int duration, int flags)
>   					crtc_idxs[0] = n;
>   					crtc_idxs[1] = m;
>   
> -					/* Limit the execution to 2 CRTCs (first & last) for hang and suspend tests */
> -					if (((flags & TEST_HANG) || (flags & TEST_SUSPEND)) && !all_crtcs &&
> -					    ((n != 0 && n != resources->count_crtcs) ||
> -					    m != resources->count_crtcs - 1))
> +					connector_find_compatible_mode(n, m, &o);
> +
> +					if (!o.mode_valid) {
> +						free_test_output(&o);
>   						continue;
> +					}
>   
>   					run_test_on_crtc_set(&o, crtc_idxs,
>   							     RUN_PAIR,
>   							     resources->count_crtcs,
>   							     duration);
> +					pair_count++;
>   				}
>   			}
>   		}
> @@ -2044,6 +2060,9 @@ static int opt_handler(int opt, int opt_index, void *data)
>   		case 'e':
>   			all_crtcs = true;
>   			break;
> +		case 'p':
> +			all_pairs = true;
> +			break;
>   		default:
>   			return IGT_OPT_HANDLER_ERROR;
>   	}
> @@ -2052,9 +2071,10 @@ static int opt_handler(int opt, int opt_index, void *data)
>   }
>   
>   const char *help_str =
> -	"  -e \tRun on all CRTCs. (By default subtests will run on two CRTCs)\n";
> +	"  -e \tRun on all CRTCs. (By default subtests will run on two CRTCs)\n"
> +	"  -p \tRun on all output pairs. (By default 2x-* suspend subtests will run on 3 pairs)\n";
>   
> -int igt_main_args("e", NULL, help_str, opt_handler, NULL)
> +int igt_main_args("ep", NULL, help_str, opt_handler, NULL)
>   {
>   	struct {
>   		int duration;
