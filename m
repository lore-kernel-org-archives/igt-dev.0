Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCDEC79FA1
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 05:45:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBBA10E361;
	Fri, 11 Sep 2026 05:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qbx05WsN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6C310E361
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 05:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789105508; x=1820641508;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mGa5PSh7iZYFb7A98AFtEC1wr0mBFEDAFagtznv5qiY=;
 b=Qbx05WsNz/UFkNfAFBsQIjEGFVd8sSiKHr2D3QYZyp0/tS40DfXgoL/a
 lsDUt0mUP8rDQIa7a98qaCaQF7GxyyOGX1pvy/chTPm6mcY398TxFsbbe
 qn5gBEpZj0YszUPA7xY/qtzKBjU2LjEtpR3mTdZRunAXkTxJuykQcdtiW
 hJURfWOjNQ9Ppx+/zV00I4nea3LH4DuBFKosh3uENcksFm4uVs/VWOeRY
 plzAAAV+Q8H0B+wmud00avq07aFQIXGIILc5lwtO0Pg5NXd2eVWneAJKW
 JYzBHescrSabzLFuLJbICPADV06Gz2+Un9djm+65FGYEqAwVDwdgUYQ5X Q==;
X-CSE-ConnectionGUID: 8c0RpuvAR0e513t72rSEyw==
X-CSE-MsgGUID: eKl0/2D/RyO4LhXFlbZHZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="101086852"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="101086852"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 22:45:08 -0700
X-CSE-ConnectionGUID: l5KsBKcMRlSXDlHlxfNC7Q==
X-CSE-MsgGUID: xd3HjkWbQIq/DIXMcI5RiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="268538499"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 22:45:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 22:45:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 22:45:06 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 22:45:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhNrRKj5Io8K+tdvFwsWw5Cw0ndwkSXJsIyBJX/Tl5xETmJ3e7fKgxxO7AE3EDvH0mtC1Ky/vbCyE7bHRxKXR3mEFx01n+Kb5mrVmMn1jOls2esGbxkN9V6IU75bZlOdFlGnY99HZBjzWesAzC1fiMX5Sbyu3dhZSFPv55KdVq7zxZDfHP/0sNN7kYeD8L9527MNfgFlaulK8EJrzj+5aZNnLxy0ciIm1TCuhnJLHe3F8LNTG9tqUuMRb9KXogDOKln67VFlwysFq85wZxDNgqjYtzwsc8Dx8lS8SLJthACxare9WFkNhryEXju+gP5huk4+4HIyxeqPALJuNCQ1yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLsZ0GN9enoZy7MVQ5I/FlyEeUCD3euSTh6oHdVUFIo=;
 b=UVu2Kvliv9TphXQ4TAtu2dxbIQ6j3K7IDmMPj9VaSqsVhBL63dLY97eBE4Y5BRGGMoxlUC/JHAg3bCvfEdK6l4wk+DPsniIzm1G4ZJGVFx1Mmxsb1VUVEsIL1w5MxV23fZ9WkRLIqrMuYX/ccxTFTEMZLNQIlXemDs46iPEP/ASBbOxP+vtt3QS603U/Ue0mUtaPpH0zX3bhlNn0Mw5TkgHRykAMj2UswRPfKIo/bGx3HowATXT3kCeYE3jzF13Y2Ncwk2Q/JNdOK+iUgjWYCt40ZA2tbxbMBywMYi+MyB2cN1je3IJUx1iwrYaJUxfKa8uvG5XbSRlYj7D977s5Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ2PR11MB7599.namprd11.prod.outlook.com (2603:10b6:a03:4c6::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.9; Fri, 11 Sep 2026 05:45:04 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0382.014; Fri, 11 Sep 2026
 05:45:04 +0000
Message-ID: <3e0d9849-56d0-45ad-98b3-0e22b9602453@intel.com>
Date: Fri, 11 Sep 2026 11:14:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] tests/intel/xe_survivability: update ignored dmesg
 regex
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <kamil.konieczny@intel.com>
References: <20260908185406.1023993-4-sk.anirban@intel.com>
 <20260908185406.1023993-5-sk.anirban@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260908185406.1023993-5-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0282.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:221::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ2PR11MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: 706fe3e6-6933-47f8-0ebe-08df0fc7d3d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|4143699003|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: foJ+BdW2g4KXLzd3J1aozACc9mVYH64QEvoTxt0OSiKwdZetVWl57vlAAEx8FvZa7uDTPRVWUMtMXj166D45xDaBgXsYjVlaNwB8B87mqpI/bExGVx/tqAn6eU1CVy6KaDNv8TA4zP2I9RQbU95sT+pP/T5TNEwFqvqTLpTIC/+KYm6wQL5k47aLIFFXpVnRpL92mGsYlsTp2FlnN8Q6t5pkz05mOnlsle+8d8WCnAQQaGiFqd3Pv4WdVlDmIvcmPWFeUGGx1gZW3+/Qwwg1vCgzqMeisD6LBRtDJfKjgcKfC+2McIp/hTL7RhoUETgRb4uRQbMADnJlMPW0ZhqtIuVQQ/YqWQj3Vwd1sEzPxqXM/+jBLh5g5ak0ixYWy4hb8Bryc78EMHuJl5UPb4E9AOG37ORwFCVLPNFi5FQmSpdTjnFY08BRyxdr7Hcu3PY2WzyRhX9kM/KHDVGM9LQEvEgV1d7i0qvnRq9+xaGsIVBNJTGGWEbCdRCw8SJapaKP4kuRg9EErNjAXnNSPCgGntJVMLMfw7XhBSsrLAH4t4eCwhs6t8LtxMMjhrHumAjDZTFpJ/LQvO33iW4rLcoGlIKlQGpP3xjNe4r+nMT58Gk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(4143699003)(11063799006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emtNMXQxVC9xWHZuUFQvWUphdGR2R1NYVXRza3VKa3FtaVFzZ0FwKzk0WXY1?=
 =?utf-8?B?QmgwTTJ6RnZvTTRYM2pnRmlFWjNSSFpQbHpmSk9oenZHM3QvWllWdGI1K3Rx?=
 =?utf-8?B?eXYreXNkTnExUVk1ZEoxd2FOM1o5VEtCQURBdGlNQmhGZ0wyaUU0SWFPZGNa?=
 =?utf-8?B?aTdOejkyclhncXNrb2FxV1Avc2RreGtOeXdSMzlVcXpzeks5eDJIdHRKTTBT?=
 =?utf-8?B?SXJxanhFdUc5NnY3cHZYbmdDeGhmNm9wWEQzVTVydHQweS9zVVBiYnc2U2lV?=
 =?utf-8?B?VHd2TCtqNk95MlhNbHVKWGdZV2c5TEdWaTdDMGE5UXczLzNjMGVkSFlaWEFp?=
 =?utf-8?B?bDRCOU1JSERncnFjaFRwTWtpN2YyMytpd3ExNU9wdFI1RGRPS1o4OHpLZTFo?=
 =?utf-8?B?N0F5K2oyaE9aQUhGdS9oYVlYN2w1L3hMaTFkY1hKYVJGYmszNklwZ0dBaEQy?=
 =?utf-8?B?UEZHQ2llL2RUS1VpZ3VMVUpEd0cxRFBSSllOVHl6OEdYNGRlb1lpWUt3Mk9r?=
 =?utf-8?B?Ylc3SFBrSHBoMW93TTVsaHBaWVhBQmp0QzZwSlBpS2RTdkdVZU92UWVVamJI?=
 =?utf-8?B?bVpPNWVCN2dFWm5iSVdjZSsvK3owRnJ0dXQ0YVlCOUxvS1BkVDJ6RktlNERI?=
 =?utf-8?B?enBkYk5PdTB5b2d0Zno4MlZwQi92aWo2OTBNQm9VZ1VwQUJKSWcxdWhzaUFC?=
 =?utf-8?B?dzhQMU8yZm1DK2d4b2lkY2x4aGcySnpuY1RRREM2L2RYZm9IOS9ZMWdRNnk3?=
 =?utf-8?B?RmcrOElxU3VjRFpkcGxMZ2tlc1NIYXJvalN0M1VaU055d0l0RGxLcWRSREJw?=
 =?utf-8?B?WFdvc2ZFNHFqdjVNanBoaUE1MFNtWHQ0a2hSYm5hV0djbXNsUXVhZEZqczYr?=
 =?utf-8?B?bXc4YmJyajF2VlBGUUJJVVkrN2VGVkNraTZ3L2hudTlMblpRR05BT2ZOWGdE?=
 =?utf-8?B?NkViSVZ1R3JzdnR5TlhPeUJPTjZFRG9lcFBON0JqdWxkazN0cER1S05wRG5z?=
 =?utf-8?B?c3R4dkcwS3dkQlo1aERIYjVUcDQvRmNhYUd6aGZMZmtaUnNRWklrRHUvQUxW?=
 =?utf-8?B?MFMydmRtMWZUNWpWL0xJL3lTbzNNdEhxcEVXZkdzcUUwYUFRT28waXdlZVFE?=
 =?utf-8?B?NmVFUVMycy93aU5Kck9iRWNUdE1RdExwUkdFUGx3c3l3SXdOZEFpQkJSa1ZM?=
 =?utf-8?B?akFlZU1hZVNHL0RoaXVVS1c1Mk5CSnZHZ1plaTlSdE92TGhjZlV1VW9JTWtP?=
 =?utf-8?B?ZERJdEwyaWV6a2FjZ04xVitJZHV3MDBJQUVNVEMzd3MzakRIcXJsbkdFMVkx?=
 =?utf-8?B?NFRBWjU1eEFXQUt6WkNwck8rWGhQaGh2UHhITnViR2pKS0FiNWFvdzFhaVVk?=
 =?utf-8?B?bHVsaWNJQ1h3RGRWQ0p4QVJPbStZZHhxdDdiNnRjakZLR09sL05vU2xGalp5?=
 =?utf-8?B?WWQ2YThGTE80RzUrQStGaGM4aFRDMkhvWHBHRVBsUmtRZjlSNHBWRDJNdGJn?=
 =?utf-8?B?VThpQ0pwVDVZYW5XS2JwMnZHWGZHSmRhNHpaOWNrN2lFMmdyWUVJMnd5Sk5w?=
 =?utf-8?B?Y28vRE5ET3Z1Z1EwRzR5RTE3UEhNNkRuZ0NycEpLZTYyVHJ5L2dteFlMNWl3?=
 =?utf-8?B?SVNXRnRMUmNKOTJSL0o3YUczVUZra1o3MGxoajNuVzdDeUxFbWhVMGNlYUxR?=
 =?utf-8?B?MlpnOXhyRFgxLzljakM3WlhCZ3JHTVFwbEpzRXF3a1N3Qk1MMHRBRTBtcGlO?=
 =?utf-8?B?RDJPdXgzY1oxbG8zSnYzbDVvcW0ydzVFajN1amRtWkNkemticWpkODB3TGp5?=
 =?utf-8?B?Z3RuRHhLVG9DOW1FZG4wWnM5UHFpTVNob0RDanFzTnFTZTc5SDhKTXBzbXJO?=
 =?utf-8?B?Ujd0Z2czUmtjV0ZHRUdZaVcwbm5vbWw0ZmNZSmdWNG1reTlXelBwNUhnV3FR?=
 =?utf-8?B?OU8valhleENkZ3ducDJnMzl2RXkvT3NZRk5GaHZUeXBTVjkwcXM3czkvSnB0?=
 =?utf-8?B?a1hRZWJETk9EQzdQOGg4OENnUlVycTJnYWx3VndTRVExYittdGZzN25EMHhw?=
 =?utf-8?B?MGJTV3VrV2k3bXRCWjkwSnRsTkhVTmI0Skw4NzlhVTF5dVJNT3BiS0tvRHNX?=
 =?utf-8?B?eGRvdDJ3KzZTUDVxM0x0a1NpRE9iYkk5blNrb0dHVml1TlVYSXJ2bkNEUVdq?=
 =?utf-8?B?WExoOUtVZlppN0xkcXZ3dFMyVUVKU1B0a1k2YlhZY3hySmsvaXpPaVM1dE9O?=
 =?utf-8?B?VjhmdXNsb05ScVQ5WmtsamlCSnJoMitremxnanovZTZuTXYyRDd4YUllQ202?=
 =?utf-8?B?amppbGhZNlo1SjhidnJGTnZLNnZ2WVNndXNZZ2k1NnBLdjI4T0RqZz09?=
X-Exchange-RoutingPolicyChecked: qkRKvr+ZLdEbGY4jHLO35Nk1ro5e5Qw0JCcnNOS4HYicZFSIeJKDgldSBL5HRVKUhqBMxwSYwIjjN8l6b6N8tHurEwn24RUs76dmOzO2dn4HKnlE2x2JIKUrKlfBaFgtPfVzUnQaglZtc9EQU0Os/83vOxR+Dibq9yoA3SDs/gQWtzlKc94JGTTQf29xNJOqhOJZmpBSUHfWm9/trSSQbuBy/RQ02tz75+zFQ7/iUMOrbm9CUqd8QalT8gO0yBUJ9NGKClQd7ark0wCa1QXfi0d+70CWd9y8CoE/UIbzkymh3AbCAYRm0pppFySD+A/T34Hg9Qd7RalVkiqaeXMMjw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 706fe3e6-6933-47f8-0ebe-08df0fc7d3d1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 05:45:04.1262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GlmG1GAbxt0/qCVU90oTEgaHSuwIJKQOG0vSTFdSoXSvhZqOMjH+62v9/6GYBpgdRx/u+LYtyqSDOmDt6OVffw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7599
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


On 09-09-2026 00:24, Sk Anirban wrote:
> The kernel now reports -ENOTRECOVERABLE when the device is wedged.
> As runtime-survivability deliberately wedges the device, update
> dmesg regex so igt_runner does not treat the expected error logs
> as failures.
>
> v2: Keep older error codes (Kamil)
>      Modify regex (Kamil)
> v3: Modify regex (Riana)
> v4: Support sigid based logging (Riana)
>
> kernel implementation:
> https://patchwork.freedesktop.org/series/168780/
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_survivability.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> index 74488bbea..7471d4986 100644
> --- a/tests/intel/xe_survivability.c
> +++ b/tests/intel/xe_survivability.c
> @@ -43,12 +43,20 @@ static char bus_addr[NAME_MAX];
>   static void ignore_wedged_in_dmesg(void)
>   {
>   	/* this is needed for igt_runner so it will ignore it */
> -	igt_emit_ignore_dmesg_regex("GT[0-9A-Fa-f]*: failed to enable GuC scheduling policies: -ECANCELED"
> +	igt_emit_ignore_dmesg_regex("GT[0-9A-Fa-f]*: failed to enable GuC scheduling policies: "
> +				    "(-ECANCELED|-ENOTRECOVERABLE)"
> +				    "|GT[0-9A-Fa-f]*: reset failed .(-ECANCELED|-ENOTRECOVERABLE)"
>   				    "|CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged"
> -				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
> +				    "|xe [0-9A-Fa-f:.]*:.*-ENOTRECOVERABLE"
>   				    "|GT[0-9A-Fa-f]*: Failed to submit"
>   				    "|Modules linked in:"
> -				    "|__pfx___drm_");
> +				    "|__pfx___drm_"
> +				    /* SIGID-based logging (newer kernels) */
> +				    "|SIGID=[0-9]+ .*WEDGED: Device declared wedged"
> +				    "|SIGID=[0-9]+ .*SURVIVABILITY: Runtime Mode enabled"
> +				    "|SIGID=[0-9]+ .*SURVIVABILITY: Firmware flash required"

SIGID's are constant per failure site.
Since we always know survivability and wedged strings are expected for 
this test.
You can mention the sigid number and regex for all instead of explicitly 
mentioning strings.

XE_SIGID_WEDGED            = INTEL_SIGID_GPU_XE_SOFTWARE_START + 2, //102
XE_SIGID_SURVIVABILITY        = INTEL_SIGID_GPU_XE_SOFTWARE_START + 3, //103

[v5,02/33] drm/xe/log: Add structured SIGID error logging infrastructure 
- Patchwork
<https://patchwork.freedesktop.org/patch/746473/?series=171022&rev=5>

Thanks
Riana

> +				    "|SIGID=[0-9]+ .*GT: reset failed"
> +				    "|IOCTLs and executions are now blocked");
>   }
>   
>   static bool check_survivability_mode_sysfs(void)
