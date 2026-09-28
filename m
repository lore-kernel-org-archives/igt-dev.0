Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085B2C9833F
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 12:15:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACAE10E496;
	Mon, 28 Sep 2026 12:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lUHcLDS+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6566B10E496
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2026 12:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790597663; x=1822133663;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nUuWkWliVUKL+AAJwOgj52g0RLCjof2qK0Iy+rtg3pM=;
 b=lUHcLDS+cscQTVR8vk3SsD9maHsHgQvfsKWNKHpENflIkFdiugCPHt+e
 zGOdtBLUoR8qtupQTZkj2AZSUaUB6z7HuflVlDnRtU7e5WCyRb28nPvo1
 6DymJb9T6V3CRH3AQ/O2mFA3MnlAEX9UApsmDLSldrs12L93GNo+vgRwY
 ntiUPumwV05kyJO+MP8QAMmR8T10AOabUrQFLUj+4WI7Ps4BH97EtC4pw
 WSNeeGoURNZXBVGxOEi1wHyZLlaFoOs8BSloVNGnCPBAWV5aQgZfqBaj5
 JuJ1mTds0qFtTxb5a8JnAF18vg6LDBxLoGDEMeRZ84eCy0wtZ8lP4ySG0 g==;
X-CSE-ConnectionGUID: stHIUp9cT0OcMIVQmmbGqQ==
X-CSE-MsgGUID: uSpHj9FXQgylZtL/nhHzwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="94009138"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="94009138"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 05:14:22 -0700
X-CSE-ConnectionGUID: z+ypR1a3QZyr05NZxyOTaw==
X-CSE-MsgGUID: vILP6iQ4S4qzX/PrwE1U9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="273177156"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 05:14:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 05:14:21 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 05:14:21 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.19)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 05:14:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vuuoezq6pTpFoJQKnB0hXmovoSrWF5gIvTWmMlYXOxzQdehxx+VhvcMKmdvqEDgFMoG+ufBhIZiYre+7a9RvdrJrQJHExNn8yQA+q98IlfFkYBGfH866tsTqzLblS/JIq+mXAvZEwNfa7UZg3my62Vu42134NQBcSMikgmaz5HivpjxsDS9l6v2VSVselqGgp29jAVQDCjsITxVvpb85fM/LIe3K81KRjXVtfcsUWboO2XMMmmF3Wy7Jp6rcW1ywLdI3HF1hn0j1k4gITQ4zyx0QuzyZZj+rU/NtUTJKSKZjvyO8qNHCT6oD+mToAMYt9IKtpafILNUlh1jPpBw4yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eg7GV5xri3e48sHernzvLASLbBEH3qu/DETSmzMx6a8=;
 b=JmpCS/p6Wqz5mUnW1ASQ00Ai3F+ocNH5Rpy5UMmj0Hf0/o74394iU8JI54YOj0iUK5OGA7srjPiFw/Ks55bNrn3qM6kp+Jlpy3NTWhtzO7xMJubxWuW3k/bOYCUzuVXNx8YJus6FX5og/LD+oq3dwcqY2aNKcg5WbhuhrymEvm4R0hcqa0gu3wncJc48tcDMNPmBjL4fdFhX1YxAyAS4uPpqoc0kGGMNZI5sTkvJAbJd9ncbrqkh4/znLdrzmHn3taJaP9l49565BEqgQHjdsrazPp5GjLDg8LqFQu7B440F75uJalJFxMb3yD4/Bd0t+QA8c4scbmP083JZ/nQEeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by IA3PR11MB721313.namprd11.prod.outlook.com (2603:10b6:208:626::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 12:14:19 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 12:14:18 +0000
Message-ID: <b8b2c128-9593-423b-8e65-77483aa1ed0a@intel.com>
Date: Mon, 28 Sep 2026 17:44:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] Update NEWS, bump version to 2.6
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Petri Latvala <adrinael@adrinael.net>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Juha-Pekka Heikkila
 <juha-pekka.heikkila@intel.com>
References: <20260928112227.60071-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260928112227.60071-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|IA3PR11MB721313:EE_
X-MS-Office365-Filtering-Correlation-Id: ef69b5c4-6d26-430a-b668-08df1d5a0573
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|3023799007|6133799003|10067099003|5023799004|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: zzPJQocTUlSbRItNMeNSvkp2O5u5Qws43hVrCSxD44FzsvOi+owwEvRTW09sK6UyGa3SFOGPaDn8BZ0trws0CutmagCUm8Ty9swOrZZ3knx7kRUvH+WpjQzApEcuadt6XYZCZf/A1gfrDZs3ronYM6TEJ66QAJPyutouiyUevEQq3GA2Eslt06K0oUy4bkv5WodN6KjiBO3IQ5LhCLulf7VUUOo/3Kmlg6AjjidJzRRkUH2pGupbP10PFLQf/z/AsUUF0iw2e6+RbZIY1ax92fjTcGYvjA7VtPUTbqIA5nMRN2Gu0rs0T/KLtq5xuBfAVoHRRYsDy3GnYGsfBuiJpgUBJdbcnDbMhj6STW0Ewj67hQQb74j4Nam2hLqMxLkaBWY/vVlDmkcGNdcNC832uBZ2z4eO/2H0KREsknNpCEYN6d6zb8z3wdraf0JBOKfJmNlRbEo0NX+9hSGz73FcBInZQ6FWk9ELdhgKNsm96Qqh8inhHZDb5++GZhZz0LhpysPqF5J/gcSTfGfhb8xF+GLKIPqb9C8oSlk/V1+kb/gm6zAjgHEJnJ01AM/0iDbm08wlhAQS42JzUV3pq+ejdEWOSRrGcZSqppiBEoRWbMbj6EfqTyzIkPT1HAulZcbTMZP8v/R1Z+mvXbR6X/F563wd0m9b2kWJn1K75e/LE5s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(3023799007)(6133799003)(10067099003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXBuTkJmVGlUaFhGVzZpeUNFT2lMc0xndzhNMXNRWWFCNVZKZDBNM2NrYnJO?=
 =?utf-8?B?Q1lGUVhYck15V1ZHcTlUZE9IaVNMbEozK0NXQUlZbCtLRll6L0J3bWRFSHVn?=
 =?utf-8?B?ODA5R0JGOHlQTkR5TjFZK1R3cDRueTVRRnZQSERUbXNFTVdlUzlCNVhCT1d4?=
 =?utf-8?B?Qlc1T0xZK2RiaWozWm1qOTFEbDZLcmNmM3pCdExkNVkyTzNCdXNxMnI1RXhI?=
 =?utf-8?B?QW9qcFJRWE1wSjV3NFlYbDMrMThGbHo1QTBZSVNqRkdrdTVpUVlpeEFLTU1u?=
 =?utf-8?B?UXRwSEpHS1VWcUxDNU9veDhxbEhrQW5ZSTY1cWg1U3l2cnZKRTViRkQzTFpq?=
 =?utf-8?B?ZklEeWNvUStyQ0I5SnpMNEdTQnZwNnlNOURWbkltdlRsa04vRXVVMUY1N2J6?=
 =?utf-8?B?K1d4UmlkRENYUVlCSEc2S0RmblhxVGJ6Y2daYkdhRG1nZUQvVFVxNGRXYVBB?=
 =?utf-8?B?LzdLU3VKZGJ2WmdQZjJRVUt2aUo5dHdBbXBPUFVtQVp3Y1dKclZQUDVjNjVQ?=
 =?utf-8?B?a3d2aTZ3bjZVcjJsYVJLS0xCQWpMb2NBTWQ4R3I5UnB3c1BIZDZsSE96OTVu?=
 =?utf-8?B?OXZHajgyR1d0U2o3aEF0dlRxSGI5YkppWlVWK1JVb1cxOE1sUkxFc1pVTUpi?=
 =?utf-8?B?L2lCYlBIQzR5cEIrZ3dPT0M1QWhNSVRMYXBvaGQvNXZGTEVHVkdnQkdiM2ZR?=
 =?utf-8?B?RHVrWG1RTVFrMG4xUnJBYW1VUUZzK3I0VHlobElYOStYaW0vYTB2S2pGYlZI?=
 =?utf-8?B?Rm5IMVlYOXdkNlZTNytNMlhrdFhFSE96NDl0WDNUWGNKaUhMd2hIUkVyaWlG?=
 =?utf-8?B?V2EwZGRxOGk1ZUJDYTNmb2dOdHVaeHV1YUtDRG5wcytiUVJkWWd1cndYSDNX?=
 =?utf-8?B?N0RyODhRbkZSOHFqc1ovbWtkU2NIclFWeEs2bXptK1RVcENtcGROR1dRdktH?=
 =?utf-8?B?bUcvNVdBYkZ4S3FyQUhCUGIvQUdyYkV3ODVtVCtZYnBFbEdvd0ZRRDI4LzRy?=
 =?utf-8?B?bUYrQktRRHZ5WUM3aXAzUnpvRzlqUU9xbzBpV2VrdlBVMjVZWHptWEFoSE9l?=
 =?utf-8?B?MURublVPZWd6d285K0ZoTEFlNlJzYWwyRDdtc3RaZFBWYVN5QUhwUm9tUHN0?=
 =?utf-8?B?NzF0enNmSG15aHRuSE1PbDdCM2JKMFkzS0FlWE1lRVpReXI1Y3JQazVLRGZq?=
 =?utf-8?B?UFVsRXZUVUJZV0RPY1VhM29TSFhOMW1OaFFibityMFNJV1A5eGxvR2p1WUM4?=
 =?utf-8?B?TDFQQjZ6aUhpdUl1YWdBcGpMR1lCKzFqZXFRdW1QbEo5VVZJZFN1ZHNJUmFp?=
 =?utf-8?B?VHdrTVlWQkNSRmdrMm56a3JjN3JkNlFUdE1zdGNGY2VCbFhKOFhSTUxBS1M0?=
 =?utf-8?B?TFZPM0VkbVZLS2ZNdFlUNnhSS2Mwek11NksyZ0oxVy9QN1BZN2FTS21DS1Bl?=
 =?utf-8?B?QlEyMnZkRE83cjJqVjdqUXloVk5jeXZmWVczSjhrMm45RXFCM3pkWVltalI4?=
 =?utf-8?B?SkZrSERma3hkeWFtMVE1K3VORlY2eGdyT01pL0RTUy9hZnVsL2hoYiswVDdl?=
 =?utf-8?B?dHN2eUlENm5KMjRka3hhODl6RUptL1l4eXBBall4TUZIWEM4T01YUm1RZ1FW?=
 =?utf-8?B?K1ZJVnh4RHpjWGlYWTNURE9xOXpyOGVsd2s0Qmp6QWpSQnNvSHVaMUNhUUpK?=
 =?utf-8?B?bVh1UFNtd3U2SUdpSkE3RnhldjlzaHdlUW9PNjRFR2dYWDdmanJqNlExOU9P?=
 =?utf-8?B?MTczSlU2TUJFSnZWaEtRc0hVK1c0WlNBTHRtWS9SOXAxME9wZmwvL3VkVzBD?=
 =?utf-8?B?cVFnMW9xTjVGRjI3NFpHdmRVMnBkWnJ3azNpZWY2K1FMaFZ1dk92bUd3UFVr?=
 =?utf-8?B?ZXNOclBrOXBLOThzUzg2RnloYkFqd21NRE1kTlFKLzhEN3EyaTRKZ0poK1Ez?=
 =?utf-8?B?Qk1GV0lmdmRKNXY3N1d6MS9EcUtPMVRJelQ2TnRtMjA4VFdFcVFxcDY1Z1h3?=
 =?utf-8?B?UTNpTVlIYTRoa2FKTVplbWk1am5MeFl4MmpxN0gwTWwrWXBzWjhBZDg4Q1M2?=
 =?utf-8?B?ei8xZ3NvU1dsbzBOMHgySGR4Q2lEUk5vRjFQY0tJWm9QaUVJc2k0Tml6cUo4?=
 =?utf-8?B?SVVKenE2eEczaWpqbnRQN24vUDg0VzAwNzJNM1N5VStkUkJBbHRoSFFkay9D?=
 =?utf-8?B?NDkrbS9SdG85S2VuTnZmazhsOFIrR2dia0xmb1BMMjB2U1RkcTIyVWs4UFRO?=
 =?utf-8?B?cnVmeGhSUUhReS96MWliWUh6dy9HR2s5MW4wV1Rzc01nNnZjTTJqTUhDTDc0?=
 =?utf-8?B?Q0tTZ3l0MTQ2WXlqeVI5eXZxUUVPd2VBeE4rV2NHUkN3NDduVnBjUT09?=
X-Exchange-RoutingPolicyChecked: Wg5j60eRApjoT70kxaS7BoSezBSwvVzjJH5pALUMC7kPE8cMNEBqQS+rZcKodasmCzueXJzwg0Icg0nB5qsby2c5u0v87QSORV/Z9U/RygwmnR/GeH+nytYvkK6Yp300EErcvyEgmHvauwncL+mu1FlEm/6woDEUhz2rk3uPXvLTHD8C9Nl8/j7p3K8t3k0+SWWkL6SQipBYZv196bc8VFJLoyzZoQ+ek1+oo1mAeUPC2VlXfnNJ0+ezTPzhBVmanq/7r6eNHJCvaD27yb0Pekd0OvFFAcEHb3iOk+Pz33PK+lmjeYAQ9EVKnTvYbsZlzfurtsnhXMu5eSnZ7NckLA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ef69b5c4-6d26-430a-b668-08df1d5a0573
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 12:14:18.7104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/6wCBNh3VTSwmdsGlyG52eGXvEtbfKdEsxUvITWDg+pTfHdb0kKyhzhVyycOSAbB7Hn8thWqlrMfGWXoH2Mrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB721313
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

Hi Kamil,

Patch LGTM

Acked-by:  Swati Sharma <swati2.sharma@intel.com>

On 28-09-2026 04:52 pm, Kamil Konieczny wrote:
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   NEWS        | 93 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>   meson.build |  2 +-
>   2 files changed, 94 insertions(+), 1 deletion(-)
>
> diff --git a/NEWS b/NEWS
> index adb794151..f3d4ee2e5 100644
> --- a/NEWS
> +++ b/NEWS
> @@ -1,3 +1,96 @@
> +Release 2.6 (2026-09-28)
> +------------------------
> +
> +General changes:
> +
> +- Removed xe_eudebug from meson. (Dominik Karol Piątkowski)
> +
> +Devops changes:
> +
> +- Bumped Debian version to bookworm and Fedora to latest 44 (Kamil Konieczny)
> +
> +Runner changes:
> +
> +- New igt_runner option --save-results-after-each-test. (Kamil Konieczny)
> +
> +Library changes:
> +
> +- Continued refactor of display library code. (Jani Nikula)
> +
> +- New platform filtering helpers for skipping tests without modifying test
> +  source code. (Vitaly Prosyak)
> +
> +- Improved setting up the render and compute pipelines for Intel GPUs. (Jan
> +  Maslak)
> +
> +Test changes:
> +
> +- Improved display testing during suspend. (Michał Grzelak)
> +
> +- Added subtest for BACKGROUND_COLOR crtc property. (Maarten Lankhorst)
> +
> +- New test for HDMI TMDS audio bandwidth constraints on Intel GPUs. (Swati
> +  Sharma)
> +
> +- Added subtest for Content Match Refresh Rate (CMRR) across both fixed and
> +  video timing display modes. (Naladala Ramanaidu)
> +
> +- New Xe page offline tests on Intel CRI GPUs. (Tejas Upadhyay)
> +
> +- Added test coverage for FIXED_MATRIX colorops for CSC. (Harry Wentland)
> +
> +- Added GT reset submit stress subtest. (Nishit Sharma)
> +
> +- New tests for SRIOV GGTT accesses by PF and VFs on Xe. (Piotr Piórkowski,
> +  Marcin Bernatowicz and Lukasz Laguna).
> +
> +- Added FIXED_MATRIX colorop subtests. (Swati Sharma)
> +
> +- Added UHBR-to-HBR fallback subtest for UHBR-capable DP connectors.(Sowmiya S)
> +
> +- Improved KMS tests on MediaTek. (Jason-JH Lin)
> +
> +- Added user fence no signal subtest for Intel Xe driver. (Priyanka Dandamudi)
> +
> +- Improved userptr stress test for amdgpu. (Vitaly Prosyak)
> +
> +- Improved Xe OA testing. (Umesh Nerlige Ramappa)
> +
> +- Improved FBC handling in display tests. (Vinod Govindapillai)
> +
> +- Improved amdgpu reset tests. (Jesse Zhang)
> +
> +- Added subtest to validate YUV420 with DC3CO. (Jeevan B)
> +
> +- Ported dmabuf tests to KUnit. (Krzysztof Niemiec)
> +
> +- Added display feature discovery subtests for HDR, VRR and DSC. (Swati Sharma)
> +
> +- Added Panthor sparse VM_BIND tests. (Adrián Larumbe)
> +
> +- Extended BO tests to cover GEM_INFO and cache flags on MSM. (Jitta Vignan)
> +
> +- New tests for PERFCNTR_CONFIG ioctl on MSM GPUs. (Rob Clark)
> +
> +- New tests for PowerVR Imagination GPUs. (Donald Robson, Matt Coster,
> +  Robert Mazur, Frank Binns and Sarah Walker)
> +
> +Tools changes:
> +
> +- Fixed gputop on Panthor. (Deborah Brouwer)
> +
> +- Renamed AMD tool to igt_hdmi_compliance and improved it to work on Intel GPUs
> +  (Swati Sharma)
> +
> +- Improvements in amd_hdmi_compliance. (Fangzhi Zuo and Mark Broadworth)
> +
> +- Decreased number of dynamically linked libraries in many tools. (Sebastian
> +  Brzezinka)
> +
> +
> +And many other bug fixes, improvements, cleanups and new tests.
> +
> +
>   Release 2.5 (2026-06-30)
>   ------------------------
>   
> diff --git a/meson.build b/meson.build
> index 980fb6421..d7bbfd969 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1,5 +1,5 @@
>   project('igt-gpu-tools', 'c',
> -	version : '2.5',
> +	version : '2.6',
>           default_options: [
>             'warning_level=2',
>             'c_std=gnu11',
