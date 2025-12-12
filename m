Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28349D59D77
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 15:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D466210E8F6;
	Fri, 12 Dec 2025 15:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+TmDoBQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817BD10E8F6
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 15:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765555108; x=1797091108;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/wPMRAptmeZUoBlJMAmSKbf/gFGjivBiRFaYtAxv5Lg=;
 b=R+TmDoBQ8GqBiDgO8FDzbJwu/BcNDhGuPeOF90KOnV0mUveRKE1VB8bV
 cvIwLR8nLBZOq7A4b30LoFU6FjkVvWk/3sJ8RyMkBV76UzQmkBDYUhFX0
 zQN9I9axitp8+z2saIUKV33OvrdPm+s+QbTXxZmMv5080t+jkJdPhG58b
 lfBbGZfT3N4zpo4Ja7/JS7nkn+4BSRsw1DMG/LT8ut0oJTpl3gdZRqX3B
 0LQEh81SRvRJGBliKIyhCoDVSa5BovJMXoP4jXMcHe/JRH87lYzmuaStK
 bdhiiu7mipn7cTO4CLcyNP9p4tO0+2d3HSC9zQI4c6irtKpTrC3NGjG/G A==;
X-CSE-ConnectionGUID: WM2aaBiPQ1icuXMVUCNVZw==
X-CSE-MsgGUID: SF+yrGgNS5ecaNXTjztjeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78195961"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="78195961"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 07:58:28 -0800
X-CSE-ConnectionGUID: XosB1XGcSJm9gyENVpOBiw==
X-CSE-MsgGUID: J4pApMssRfK0JjPZrTmREw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="202041830"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 07:58:28 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 07:58:27 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 07:58:27 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 07:58:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVqlXSA+WeUMUYx0r6YherAeNFeg9wasd3NQPQymwXZXYpcozbAV+jzbX1KA/H8dfarX2iaavXB99sHZ/HgBJ2l5nKQR5XLDa7g397pb7Y4J1k1YIiv9l8jLqCgpAX5tBR7ABu4G2cWqsR7QBgmjhvdtvJzg7wHqg5JjBPXiXJ+GTscVhFCAkuC/oSeL+TOSla2N9rRnTwEdKoWi4TGDUbcec121P+77jvo8zsrrg9ZYwAudnLNO/t7wwTSRrw/yIQz1JYCH2B9sHNrgUJDY8MMpWWo2UwNzmJNLsmq8vgrQa/bXeCwupVFKL1AiCKUiSJGFROCzlnOo0bNHsgGxrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5kdc0Ch+W1xcxVm4OXROQt1BlKHaFhTUcmmaZ/kqAs=;
 b=t5CJ4aoUHsqfntoJhPsuI0SUYw68x4QB6i9Tre3YnE1mNrzyjh0HS7yZufWBWpb/R0nHcORgRGt2cql52GY0qIRX+C3ATAFmW5bMdRrxXNEVJ07bnV+DMa0fIYPzzy0bXnjtn23PsYc4dsNgkYcBBfZ/eFkGHFMwjuomd9mhQ0YXKmu15+71dQSgw7FgHed65u2g/FYAr7hinw3u81JQ85HXNvT5YDJ5yHVTrmxpOqV57sruG7CY0mDm3emlt6AZkna1C5FoqwzwK8q1YI3hMTO9qx87V5ywdiW6qCe8M1vNsUaGkyljEwH4qyEAvPjfpO6HajSMI8f58OqDTbxV2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.13; Fri, 12 Dec
 2025 15:58:25 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17%5]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 15:58:25 +0000
Message-ID: <728d6395-9d21-4781-83f0-51625d1481ee@intel.com>
Date: Fri, 12 Dec 2025 21:28:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] lib/intel_device_info: Query runtime xe device
 graphics versionsth
To: <igt-dev@lists.freedesktop.org>
References: <20251020231253.138842-1-x.wang@intel.com>
 <20251020231253.138842-3-x.wang@intel.com>
 <20251107194739.s2yrsh2xt7greq3q@kamilkon-DESK.igk.intel.com>
 <SA3PR11MB80466F35AA1F6AA60C0CCDBE86D6A@SA3PR11MB8046.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <SA3PR11MB80466F35AA1F6AA60C0CCDBE86D6A@SA3PR11MB8046.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::9) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|BL1PR11MB5978:EE_
X-MS-Office365-Filtering-Correlation-Id: 11fe3e14-f512-4397-e277-08de39974866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDJEWDBjNisvbTBDWk9hbGdsaTVVbHFlZGxNcXFPeXVIRkhLYVlycTJTS241?=
 =?utf-8?B?UkszaHBWNGR0TnZiOWFxZk1WcGttSEowMGMrNWg3bEpheUp5SVh4aDdVR2JF?=
 =?utf-8?B?a3plUjFZYXgyQ0ZuQ01uSmZqSEJsVVppZjYxYWgyUW5vV1AvQ2dsdUE2cEY3?=
 =?utf-8?B?K0NyZk1BSGdHVWYyc2c0akJOS3lISDNoV1o4QVphUFU2dk9KSUV5Rk02TUxY?=
 =?utf-8?B?T1B4TExTeWUrL3FOYlg3UDIrS0w3YXFVU0xsMWsxMGhkakRUKzE1U1RpNkN3?=
 =?utf-8?B?dFgwVVNjMEFrVjUwYkhuYVZNeENVMVJyWXdJUVNuV3FKUXFRYmY2SEtEU0V1?=
 =?utf-8?B?TFcxUzd4OTJ6cDl0RlRrSklQUE5JTDdycUlmdDErbkRhbnVyZWJjUCtzUmQ1?=
 =?utf-8?B?UlJVOHZ5dlNZNERiOWRhb1RhS0tZQjVyY2p5Y1IxOG5adlNPR3FqRXdDL0ly?=
 =?utf-8?B?UVhLaldFNTZaRy83T2UyWlYrTHlOUkFhMXFZRzlDanNVcTNmME9WTWNJWC9M?=
 =?utf-8?B?ZG5Gd2dQZWRwNXJjY2s3TFhpQ2dsT09DQnArUUdLZ04reERXUm5OanI0WU5F?=
 =?utf-8?B?cmJhNUkva2V6OGFNSFUwdWx2MktzS1lwc3dNS05laXgrdGg3NWRYVXNPWk9D?=
 =?utf-8?B?Q1JkYlpWazF0T3dpVVI2V2RQMXFldEV5ekUvaldaUHpHUnFWSTFCajIweit6?=
 =?utf-8?B?d3UrZ0dGanEzalhVVWJFVkpzeEN3U3FzdkdNYTlZOXhJdEpvKzhmbDAzMy9M?=
 =?utf-8?B?OEhqV3R6MHJETjRJZElsRzZMWVJKSXc3R01BMlhnWWdBQVBZV1I4Z3psWE8r?=
 =?utf-8?B?Zkcza0dNbW82RGhnQ01XRGhqYzRWWkp5MXlhMTRBOXFjTHlzd2dSNVhFNjZP?=
 =?utf-8?B?Q2VPczBUQXZqZitYT3dNNlVDUkVaVENvNnpTV3A1bnVyZytkaVRKRkJrcUlz?=
 =?utf-8?B?eWExVnl0TUNieUJSYkJwREpGMThOc1ZBdk02eWFQajVacUJuTHRhM1hISzJL?=
 =?utf-8?B?U2NMWkFkSXZmMlVjckFUUTBETmRzVnMrMTJLa3crMVB5S2FFYnd1QjZ2V0FB?=
 =?utf-8?B?RkVEQW5IRmNwcEJuc3ZKbHhqMDV0d3E3UFRLTW83T0hTeXdiRUtVamJXRGYz?=
 =?utf-8?B?dHp0MFA0WHl3NUd2ZGxZQXB2ZXI1YkRVQUprUlhqU1JNWkhxVDVGOGtpbUtw?=
 =?utf-8?B?VFU2V0hkM203QVhteisxL0g2dElIZC9JOG51RUE5Mk9YUnRRVEMwU2laNUVn?=
 =?utf-8?B?d0RKZWZCMUZrUCtxSVdsbmNMeUZJWHVaR3ZxeEwyWE9sYUZVV2xHRTZTZytL?=
 =?utf-8?B?bElUcmsvU3BFU3BTWHY3Sm0rbDBJYkE2eHhFdlpvajFZM0xFLzBDdVM3OVd5?=
 =?utf-8?B?OVlXdVVJWEpJZENPUitGblM2TEQ1QkJJQlVmVHZidW14d3dQVkhmSVc4bnNl?=
 =?utf-8?B?c293TjlPYTZCWExrQnBvb1g4QUFtU3NPUnVJRE5YR2hoemNYSXJGbXczejhG?=
 =?utf-8?B?czNOUzBaRGhac2oxUXRMS2tzZXgzWUpIa1IzM2NQa1V5empNRnE0ZmZGbDg0?=
 =?utf-8?B?Tk1CZFp3bml2ZTIwSVVMeUFicUN4QXg1STVUcUFxQVVleEl2TUlBT05RSTIw?=
 =?utf-8?B?NWxTOE9ra21UZGZ3RTRBd1ZhMlZicFVtS2lOWXV1M3NpTURITnFBUk9waVF1?=
 =?utf-8?B?SUFtQUlqM1hyckFURy9oOFAwVlh3cWVVLzhJNXRDZE1lM0pkVTFWZnBwNVFu?=
 =?utf-8?B?OUNnb0hFR3haS29VM05zUWlqYTYrSzJZM3RYRC9kVGhzOEZGd0tDbWRUTk8r?=
 =?utf-8?B?T3FTWFpHRzZiLy81LzNQYlRPZDV4YnhWQ0swUGZkNGE1MWtlRFRTYWFHaGh4?=
 =?utf-8?B?VTdwOC9CK3pGTDNSczAvc2hsUjY2UUpxOFByWi9Fdk1FUkhHZTl2RG91TWhx?=
 =?utf-8?Q?M9Emugv3zKLVpNA/O9IHWIRDdTCjyC2/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2J3N0N2Y0d6MkdCbGNsWHF2Q2JIQklXWlVGRHFGYndBZlA5dm0xcW82a3Zh?=
 =?utf-8?B?d01YN01SdW1kZ1pTbVYyZW5oNTlseUtrbDQ0SXk4Q3IxbmNBd2dZMkV3NWRK?=
 =?utf-8?B?S3hCUWd0YmIva1FwZXpPU2p0bG9jWnBmYkFvZ0RXbTZtRUFsYXhxNWZsbkhr?=
 =?utf-8?B?cHFVbHNPaWpUQWphYTRPaEtzMDVHa1BQbUs4OWQ0STd3UnpkeGFaUjZIaFFw?=
 =?utf-8?B?MUduTmgrS3A1a2VreWNUOUhoY0RRNlM0dW8yMWdIWXRpdjgrbUxDMktYUCsv?=
 =?utf-8?B?d2FXUDFxR05GYStlbC9LVFNPQ25GMHVzckRUVWVzaDhvcEZxbjhNdnhIRWJN?=
 =?utf-8?B?TzBxNUIvV2U1NW14UFBiSU0wL1FPcUR6akxkWHU1ejV3byt5bExiSHF4TXpM?=
 =?utf-8?B?YXRhd1loWEIrSkJNVDZvVmFRcWlmZVFmYVRobU9jc29jc2hhZFA1OEIwL0RR?=
 =?utf-8?B?alpJd0VQOGFwUG83VnY1L3d5R1BmM0FGbnNNSDY3RnZ6SFBNVjRuelhORGp0?=
 =?utf-8?B?eFZaM0RWNGZZU1dvb1RhbmttWVhDTisyMzBxcWNlRzJGWFRRWUNBVzAyei9l?=
 =?utf-8?B?ZXRVT294V2tOZWtrOFAvS01BYXpJOGZ0a3ZkWjRqbFFaNlJ3OWlHekFvSHdy?=
 =?utf-8?B?STR0blR0WjhwdWRXcUU4aDR3Y0QydlRiK21uY1dOUXRNQ0hyYTJFUkdEMnlo?=
 =?utf-8?B?bkc2czIycG5zaWFWRStaNHhCQm90SzZvOVhreWlHcDlwb0QyL3MxV1g1T2dJ?=
 =?utf-8?B?UW1YWDhCRzN1MnYvL2hvODF1bzdwYW9wdXFia1kxZWhVdnoyT0ltY2NaOFlo?=
 =?utf-8?B?L2dJQmhhUHAwZnlnVlg4SEZUNDBKQUlCa0dCY2ZMVFJDY0FoR3Jxdyswb05t?=
 =?utf-8?B?c0ovTksrZkU2L0FheXBMejk1cERqRTlmSlpQcU5xRVFHMW5oUlVwUWlteVBM?=
 =?utf-8?B?Ym80a01YdEp3WlB6Y3dWRWhiR1E4dEtwVnQ1NkpCdnQ0dEh3VWNBMzhkQmJX?=
 =?utf-8?B?aStXcFJYVXl4QWlaWDJRMjRsNy9oamRRMjhsZU96ZDFLZk5RQXczQnU3ZVV2?=
 =?utf-8?B?VmdoUWF1WmRNTDAvWFZ2a3JNdVNnbGlPVXlQZTdPRjlHdFBWSFFtQVRZOGRI?=
 =?utf-8?B?aHh3a2FsQU55eTBENVd4MXd1azVQbXk0ZkV0OTZEdFNrSkYydTEwdGpWakdW?=
 =?utf-8?B?RXZBaVdPK0FJUHYyc3JrNi85ajBCVzJJQ1FMbUdVMFc4YzNtWEpsMUJNalVK?=
 =?utf-8?B?cEttR290Y1EwRHVwMFZLRjc4YTcyUXlhMnlLZzFUMWJzMWpuRFRCRm1JOGZD?=
 =?utf-8?B?LzZPandPZ2ZlQTRpWmI5SFlJSElwa0tRRGM0NzRqbXRXY05RRVRNdXJYS3lH?=
 =?utf-8?B?dVdBNGd6cVloVG9xTm51Rk1OMlkrZmdPSlRFcjl6TTNPTlNpc3AxV0I2eFRT?=
 =?utf-8?B?MWFVK3dESXdBeXVHQjdwN0N2aDNBeWZGT2hJTWZiUlJmcXM5YzZGTTQxYUlm?=
 =?utf-8?B?eVZmK2RCWGFPNWFPL0FEMEt4ZFF0QlpKK2ZtZHZmL3Q2R0dvYXE5RXZhTWwy?=
 =?utf-8?B?WDhpRWlPc3lvRzk2Z2VWUE9GWGYyalJyQzlza2c0VFY5endabDMrWmJ1M3pT?=
 =?utf-8?B?MTNaN1FhcTdJWHQyYlorVzd0Vm1Jc3gyemNPeWZaWW5WaEFpYzQwVnVEcCts?=
 =?utf-8?B?bE40WjdBbHp1QTRDOVdzYU81cHVDc296V01QWi9xVHp5cmxhUDRCZlFoUzc1?=
 =?utf-8?B?QnNNUVMxbnU0cDRHSFVyam5DZUU1NVZMWGpKZWdBS25jNlNnZGxOQWxyR1hi?=
 =?utf-8?B?VVpkYnFBdmh4N044ejJQZnFZNVhYY2xybmVPbUp1Q05pVDlFNFZkWDAxUFU3?=
 =?utf-8?B?SUI1aEhKRllubmNtRjMyYjlkQXRCL0VZVzNUR2M0TkdJME9iUlpsR1cwYzE0?=
 =?utf-8?B?a1pLeFY2Ykw1ODBPL3NlWG9rc29GSkplcGFtMmExUFh6U25kL083UzdyeURD?=
 =?utf-8?B?SmZLeUNtRGlzZDd3bTZ4RUlCSUZ4c2s3bHZOQnBwSkxKRTM0ckxKS3F3dHVu?=
 =?utf-8?B?VWJ4UFpIc0hFTDkxa2tIemRjUUoxWThpWC9DSkxqcEtJOFQyR2M2SVlLeHMx?=
 =?utf-8?B?ZlJ6WHpKamVEcUhrSW5yNXRCTllmZUtJNVh2VGVZV3VXMFg2VG94bmtHditS?=
 =?utf-8?Q?DdLeMoFniC6mOobUcX4395I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11fe3e14-f512-4397-e277-08de39974866
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 15:58:25.3995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNnwW3pRz9LkqTeMSSgX9ZiQM3ItpGqDG9U6EuK1MS4kUkJeGKMxAnp7wWY7/IsI1FDWaO0G6CF8O8LSARM/btX4bvMKqp4gw4wrzrjcTQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5978
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



On 11/18/2025 11:41 AM, Wang, X wrote:
>
>> -----Original Message-----
>> From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Sent: Friday, November 7, 2025 11:48
>> To: Wang, X <x.wang@intel.com>
>> Cc: igt-dev@lists.freedesktop.org; Summers, Stuart
>> <stuart.summers@intel.com>
>> Subject: Re: [PATCH v8 2/2] lib/intel_device_info: Query runtime xe device
>> graphics versions
>>
>> Hi Xin,
>> On 2025-10-20 at 23:12:53 +0000, Xin Wang wrote:
>>> For platforms with graphics_ver >= 20, query the runtime xe device ver
>>> instead of relying solely on hardcoded values from the PCI device table.
>>> This enables accurate IP minor version (graphics_rel) detection for
>>> platforms like Xe2 where different steppings have different IP versions.
>>>
>>> Implementation details:
>>> - Use weak symbol linkage for xe_ipver_cache_lookup() to handle static
>>>    library compilation (libigt_chipset.a, libigt_device_scan.a) without
>>>    xe_query.c dependencies which are used for i915 tools (i915_perf and
>>>    intel_gpu_top)
>>> - Provide a weak stub that returns NULL when xe_query is not linked
>>> - For Gen20+ platforms, prefer runtime xe device versions over static
>>> data
>>> - Fall back to PCI table if xe device info is unavailable
>>> - Reset cache on query failure to allow retry
>>>
>>> Remove hardcoded graphics_rel from static table entries for xe devices
>>> as they will be populated at runtime from GMD_ID.
>>>
>>> This unifies device info handling between i915 and xe drivers, enabling:
>>> - Platform-specific workarounds based on accurate IP versions
>>> - Consistent device info API across both drivers
>> +Cc: "Stuart Summers" <stuart.summers@intel.com>
>>> Signed-off-by: Xin Wang <x.wang@intel.com>
>>> ---
>>>   lib/intel_device_info.c | 26 +++++++++++++++++++++++---
>>>   1 file changed, 23 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c index
>>> a853f9ab4..87b1069be 100644
>>> --- a/lib/intel_device_info.c
>>> +++ b/lib/intel_device_info.c
>>> @@ -3,6 +3,16 @@
>>>   #include "i915_pciids_local.h"
>>>
>>>   #include <strings.h> /* ffs() */
>>> +#include <stddef.h>
>>> +#include <string.h>
>>> +
>>> +/* Weak symbol stub - will be overridden if xe_query.c is linked */
>>> +struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid)
>>> +__attribute__((weak));
>>> +
>>> +struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid) {
>>> +	return NULL;
>>> +}
>>>
>> This seems wrong, you cannot cache by devid, either you already have it or
> Why can't cache the ipver with the devid ??  We are not expecting to read the register every time, so we must cache the value somewhere.
>> not. Also devid depends on register(s) reading and you can access that only
>> when you have fd already opened.
>>
>
>>>   static const struct intel_device_info intel_generic_info = {
>>>   	.graphics_ver = 0,
>>> @@ -505,7 +515,6 @@ static const struct intel_device_info
>>> intel_pontevecchio_info = {
>>>
>>>   static const struct intel_device_info intel_lunarlake_info = {
>>>   	.graphics_ver = 20,
>>> -	.graphics_rel = 4,
> In fact the purpose of the patch is to fix the .graphics_rel error on some devices. And we already have the correct value so we can safely remove it.
> I keep the  .graphics_ver here is for some of the tools may need to check the graphics ver without opening the xe devices. For this kind of use case
> the tool is not interested in the .graphics_rel.
>
>> This also seems wrong, please keep old values for compatibility, here and
>> below.
>>
>> Regards,
>> Kamil
>>
>>>   	.display_ver = 20,
>>>   	.has_4tile = true,
>>>   	.has_flatccs = true,
>>> @@ -517,7 +526,6 @@ static const struct intel_device_info
>>> intel_lunarlake_info = {
>>>
>>>   static const struct intel_device_info intel_battlemage_info = {
>>>   	.graphics_ver = 20,
>>> -	.graphics_rel = 1,
>>>   	.display_ver = 14,
>>>   	.has_4tile = true,
>>>   	.has_flatccs = true,
>>> @@ -529,7 +537,6 @@ static const struct intel_device_info
>>> intel_battlemage_info = {
>>>
>>>   static const struct intel_device_info intel_pantherlake_info = {
>>>   	.graphics_ver = 30,
>>> -	.graphics_rel = 0,
>>>   	.display_ver = 30,
>>>   	.has_4tile = true,
>>>   	.has_flatccs = true,
>>> @@ -675,6 +682,8 @@ const struct intel_device_info
>>> *intel_get_device_info(uint16_t devid)  {
>>>   	static __thread const struct intel_device_info *cache =
>> &intel_generic_info;
>>>   	static __thread uint16_t cached_devid;
>>> +	static __thread struct intel_device_info xe_dev_info;
>>> +	struct xe_device_ipver *ipver;
>>>   	int i;
>>>
>>>   	if (cached_devid == devid)
>>> @@ -689,6 +698,17 @@ const struct intel_device_info
>> *intel_get_device_info(uint16_t devid)
>>>   	cached_devid = devid;
>>>   	cache = (void *)intel_device_match[i].match_data;
>>>
>>> +	if (cache->graphics_ver >= 20) {
> xe_device_get(fd) (in xe_query.c) records the tuple (graphics_ver, graphics_rel, devid) into xe_ipver.map once it has fetched DRM_XE_QUERY_GT_LIST/CONFIG. The key is the PCI devid, the value is the IP version we just read from GMD_ID.
> Every Xe use‑case calls xe_device_get(fd) when opening the device: the common drm_open_driver{,_another}() path already does this automatically (see lib/drmtest.c
>
>
>>> +		ipver = xe_ipver_cache_lookup(devid);
> xe_ipver_cache_lookup() is only a map lookup. If a given build(i915 only tools and tests) doesn’t link in xe_query.c, the weak stub returns NULL and intel_get_device_info() will not go to the if (cache->graphics_ver >= 20) { ...} part in the intel_get_device_info() function so we still make the code compatible with i915 devices.
>
>>> +		if (ipver && ipver->devid == devid) {
>>> +			memcpy(&xe_dev_info, cache, sizeof(struct
>> intel_device_info));
>>> +			xe_dev_info.graphics_ver = ipver->graphics_ver;
>>> +			xe_dev_info.graphics_rel = ipver->graphics_rel;
>>> +			cache = &xe_dev_info;
cache variable is a constant type we cannot update it, did the code 
compiled without error.

Regards,
Ravi Kumar V

>>> +		} else {
>>> +			cached_devid = 0;
> This function will be called before the drm_open_driver() so we should remove the cache here.
> codename_intel()  is calling intel_get_device_info() at very early time in igt_device_scan.c
>>> +		}
>>> +	}
>>>   out:
>>>   	return cache;
>>>   }
>>> --
>>> 2.43.0
>>>

