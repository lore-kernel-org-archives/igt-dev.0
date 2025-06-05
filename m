Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC5FC5AE59
	for <igt-dev@archiver.kernel.org>; Thu,  5 Jun 2025 16:57:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC3210E9D1;
	Thu,  5 Jun 2025 16:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oDXzbG5O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD7E10E9F1
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jun 2025 16:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749142671; x=1780678671;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IU2riVMxSBe9EgIHh9PGXHtwccu9H489TEn5LMUHvec=;
 b=oDXzbG5OZ97AeckbF2cD4kdfdqxMf5FrjMGDYAtzaMV7u9FIAah3NNHY
 3QsGAI6/0CgxoSE3I5vl0bSwn4Of4JvoEH5GpLVEJjns7YVL4mDKe0x23
 Vm0xdnCHAnpPfpNt60/XHwJl5l9BjKtApBj7d/38KSbsEfZSdebZReOGm
 C7RJsgF+kyF7QNhYFI2u/ydm0nVha33s80ncOb7l8p5Cf0j6uq1TpUTP2
 FT2WfGzMU+UDMJaHjL0BX7SKlpHu58366ImAyWWgEIZ3uXji/e7YDLRFc
 Y+S0w1ST2Wxm+8UWfpPDWDHqSiWhsLkCKO/0H4J5pih9MTnmokCaijK5z Q==;
X-CSE-ConnectionGUID: Ttwq5wEnQG2wIsHGEofevw==
X-CSE-MsgGUID: NV5ewzCYRmyBCPyGXy9Xqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="53903765"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="53903765"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 09:57:50 -0700
X-CSE-ConnectionGUID: 69KAijMxTvaTYj58ENLoXg==
X-CSE-MsgGUID: 1qb3zkcETE2bv877a+zGXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="146546550"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 09:57:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 09:57:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 09:57:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.58) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 09:57:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JUg5WFyNYuQU1/ZDEeKaPg37Q5L9t6ZuATzqyrd+3tiGxH3iK3kazENUKeWnAN9Kokgmgtgq5D4WAL026hINLbm3ExHhbi7PMw5NHnFw1XFLe6Afw6AnB/FEqI074erXo95w///z7P898LyOKRln7eYaVH84NkJxSsnhdq2XBzGCifm1lg4ysbOrgYe3BotX8f/6MPOjDxVKGLeaTaBwrkC4KdbYdFyHAt8rjP/F9M5ohl+TDQvXlLouQzqOay7meLM3CLYjrj0IURDuVQ1xieg90FzhzHpkUpYIZ0a9wbzISzVBnYAM8JO8TkhXEolS/5pDoShhMCpneRqBi8B7zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIbqBAIlI+1X3lIHdR1noXstegm5g2VDXOlCRVGW6Uc=;
 b=MT+BA2A4ifKbwdkYKIJ4hPLajQ3PH5JakASODB5abgCCNhHCsi+3vguOtNavLOpgCZz0/h9IL+ud/Jt8v0gSZtfw4gJoqWaz7SGLkS4uoxDk7oBThLeoRqjHxhnvBX3WqhZ8w07nr/yoxFHOaxiU90sMJheCc57QutRjwnNAq/bkPrtNx10PRYbPMEYPK0N6Y56rbATjcDLRkN1nRVTLMLJLnRj+WphfScVBAWNAy0WrF9pV0AW85O24Qth1OrSId99ojbe5G78g2D+LlI9ixcBJvHx9xrngzkADfm9iWeuq+G/wsjJhjXgLBs4ZfUqBfghTSMRPlzgf+c4lGRU7Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB7269.namprd11.prod.outlook.com (2603:10b6:208:42b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Thu, 5 Jun
 2025 16:57:33 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 16:57:33 +0000
Message-ID: <4c11b2be-ccc9-4cff-a389-8c908f6ee64f@intel.com>
Date: Thu, 5 Jun 2025 22:27:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v11 5/5] tools/gputop/gputop: Enable support for
 multiple GPUs and instances
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <vinay.belgaumkar@intel.com>, <kamil.konieczny@intel.com>,
 <krzysztof.karas@intel.com>, <zbigniew.kempczynski@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <ashutosh.dixit@intel.com>
References: <20250522154447.496407-1-soham.purkait@intel.com>
 <20250522154447.496407-6-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250522154447.496407-6-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:820::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d20545f-bbc5-4dbb-266c-08dda452109c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0tlc3A2bEdINU45Z3RpL1hXT0QzQUl5UU0zZk9sU0tsazk3bUVwNXltRlYw?=
 =?utf-8?B?SjNuYW1YY3dKbmc3RzlLRjNZcDBRMm4wbTArd3JYeXFhRVMyNFlRQkMyY2lL?=
 =?utf-8?B?RTNFZGVIOC9OeUxnSUJYTlR2VjZqZU1uaXY5dldqemY0cm5pME5EeHNqeURQ?=
 =?utf-8?B?MXlINjFaOTl2dHR5SVc3cXdpQUV4RVYxbnc5ZTNvc3ZlL1ltZzh4VFJWOHh5?=
 =?utf-8?B?T0h6dDVWYXFFSXVCaEpqdVpTZ2hWMnQ5UG9nL2I2akNPZEVFbEYwdm9KMkRB?=
 =?utf-8?B?d0EvNVYzbnQ2cW1LVGFmbm8vRWxoT3VMaEJIT0NWelNCWkNhc0tIVkdiaEtJ?=
 =?utf-8?B?UTBFZHkvcnRNaHUxSFlLTUR4MmpYZWJwR2pJY0s2T3VlN3Y0a0t6OCtzSi9r?=
 =?utf-8?B?QS9sdHBaYXJwTmxDaG1HV0ZQNUdoVWo4bm0zTUxRR3p0b1VDNG03TlB0MUNK?=
 =?utf-8?B?Rlo0eHg5ODI4NnZ0aC9GYk1kdGRtd3VUbTR5SFYyOFlBTTNFTmNDVlBELzdU?=
 =?utf-8?B?YlorQXB0N0NFUHplOHNIckR5a2h4emtmMHppcmxlZTNONkN6R202WWFzY2lB?=
 =?utf-8?B?SUhjWU9TL0ZRN25BRDZHWWFrZllqSmNoVVNzdnk5eXI2YnNtL2F3R2QrYWdi?=
 =?utf-8?B?OWxGSlNmYk0rN3lHQVpBQ1oxVjlQQ3FQWnJpckhTT2UwcThsMnVsV0p1aTlM?=
 =?utf-8?B?RUw1ZHFHUGZvMGk1ZmRLb1lIV002TFB6a2FMaG94Z3dzbHFNb1UxOXU1cGlX?=
 =?utf-8?B?QVFKd0RCWkdIa0VBcStQWDBNczBjM054WWZRREtsRGN2amRWUnY5dDNVV2Rr?=
 =?utf-8?B?Z1I4TmQ1enlrNk1IN2tLeWFMMHdkenRvdDJ3VDM2dWs3c1VBeDJDcXBrQXdJ?=
 =?utf-8?B?YVFPMm03elAvRGFaVjBjempPYTVxTXF3TDRpWEUzWG5OR3NlczY2T2FqR1lm?=
 =?utf-8?B?VUsyMURLa3A5U0NCc0xKbCswRHZDSlQ1U0VQaHRVVTMzQ0FkcVBURlh3cG1H?=
 =?utf-8?B?ek9vUWxDOEhYWUcvRXd6Y3c1KzZ6bDYzeWxlWkY4OEZRcW96RmFwa0wxQVEr?=
 =?utf-8?B?UW42cHdGUmExR2Z4U0FFbzVNR0hidlJBOWdKaE9la3lvS3dSVUFrVDdobmJw?=
 =?utf-8?B?MWxNKzVCdWFXQy85T2czQllSbkRFanlwZ3JKMlBsOW1mTm9kTDQyYXk4YkpO?=
 =?utf-8?B?dkZ4NFVoS05FUng3LzRmR0ZYWXhXaHZ1cmdqV1gxb3d3OGo1N1RGSnBnNk5q?=
 =?utf-8?B?VEpqTlJCb1lsQlpmV0NKM0lpRmRVV094VkVMK2ZGaVhvTURhamRpR2QrU0hT?=
 =?utf-8?B?YmZ6VmNMTlo2cnRoSnk0VG9BUlc4WXNEelJxdFdzbXV5ZXoyTEpsSWh3dThY?=
 =?utf-8?B?enVaUWxJN2hkWW54VUtvc3JkMXR5TTFaaXBkNEVBckJlR0FKZVlvY240YlYv?=
 =?utf-8?B?MXMwL3NkSFB6ZzdDVmU0S0pVOGdlREw5RW1SZFdmV3hteVVybFJIMEJrTEZk?=
 =?utf-8?B?ZC8xM3hjKzFkWE8zbkN6N3ZNVEJDaVBtMEpSeGM1Zm81aEVPa3dQNzFLZWNE?=
 =?utf-8?B?akdibHFUdm11SFozMVVFWVdQM1hzbHludUY1UlZySXdaemJ2dm1xYytMc2ti?=
 =?utf-8?B?K0dEenZVVEdMaDJyaGxXVXFmc0JlUWVOY3dBSnhkN3dBUUZWYjJyMDdhTE9p?=
 =?utf-8?B?emVwN0RQWWlSUHFzejc4ZHVpN3ROVjZiOE1DQWZVVHpBZDhaMUlsM0dxbWpX?=
 =?utf-8?B?TjRrSWlSTGtlQ2VCK0RQallJcWp0MkhtYjZKeVM3b0Q2dGVDZDVPZkZSd2dD?=
 =?utf-8?B?clNKS2JHT0ZPTC9RamhESzQ0ZERXZ1BVU1g4M1orcGlYa04wdEVvcW9BZDlI?=
 =?utf-8?B?YW83MVZDVmduYWxBT1JkenljY0RVVkdneHFiUVU4aUpJYkhZTDVwSlVkb0RP?=
 =?utf-8?Q?53ZUmEkPwE0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUZPUlJ3SktOb09RT0daNG5PSFU1ekU1OFZiK0kxMllXemxzVTFYTEV1d29Y?=
 =?utf-8?B?VXN0Y0hsdkxscCsvbkdlZ29YQWJDbjBPSGRiaVVyNnc5MnZuRTRyVldSM2sw?=
 =?utf-8?B?R3dPREhJVFBwN0JlWUc1NTJkSFBjWCttQm50aW90d3pKNGtsSkdGT3JMejY1?=
 =?utf-8?B?Vm5HT0lzUlY2UGZWbFpSd0RKNWgvVHRPRnJ0VEhwcElqYUxraDU1WFF0MkF2?=
 =?utf-8?B?dFRGWFlDVmMyUHlzZk5WQWNaR2NVT0gzekZ1L2kxeGdxYU84K0t4TEJJZWFF?=
 =?utf-8?B?dFRVWFBuZVc2WE51aDR5SEQ1dUVWTXpsYmJtWE43ZElVc2VzK0hJUm9LVVFK?=
 =?utf-8?B?TlpxKzcvZ0NCWk1xTXJxV2phWGx3NWFsRnlNZTRhdE1oVUhJbDM1VklkTDhq?=
 =?utf-8?B?NWlrQk1zVHBFUEt1SnI1WlVaUlFTWmlNZ3FSZUcybG82NTNSZ3N1RG9YTGdQ?=
 =?utf-8?B?a1hkQXdwVUFQM3BTVnpkeEoxZ0tYZGdOSW9kR3hmakJ2TlpKVUZwV2FIdjVS?=
 =?utf-8?B?dkhrZ1h4akhzTHRZclNCMTZmVTZHczZ2NXdTT29ZeVhES1plRmpZNFhObmxn?=
 =?utf-8?B?bEQyYTJsaitmemxYMUpEbXVNZ04raXhiTDRiUnpNb3poS0haWGFFRWZQTG1B?=
 =?utf-8?B?N0o1STBLVkJpREg5bUtZZDZTRzJsc3NYZjZ0RFZ4VlFCbEQ5VzJSaWtiMGQr?=
 =?utf-8?B?LzVsWWJVOGdTekVvU24xSUcyN0pSVmRyVGllclNZVkl6SzBubXIrMzBCOFJr?=
 =?utf-8?B?S0hNQVpFNThPVCszc1ZjbGR4MXVGVzVhYkZmUTNKbStSYjdnVzVNRnN3dllh?=
 =?utf-8?B?eEsvUXFNeUY1endRZk01OExGdW9Dd1pJQlFFY2ppK1VhNHBpbUlNZWJrbnVU?=
 =?utf-8?B?UkpWR0x6ZEt5UHJEalJKb0Y0ME9TVjlxeS9KUExHNm1BcFRjeG8wa2E4d29M?=
 =?utf-8?B?aVJmUXlZeDFLSlBBdTkzRHNNQUpFM0Y0Nk5wMUpnMTRIdWI3SE8zT2hRaWM3?=
 =?utf-8?B?aHh4S0dEY1k4VWN5VGFYTkdLYnpCSE1JSnBteFFwZjA5TklmeGJzTExTZ2Nh?=
 =?utf-8?B?QURjeHRDUStGU0RYYllydVJzVXBuNVNvbUw1NWVvOW8veGQxN2Z3M2RySDg1?=
 =?utf-8?B?Y3hTY0E5eU9HbFZGQ0RicUEwdUVpSC9lc21rOTdWamFXU0d0cjNsWjg5dHo1?=
 =?utf-8?B?UDZrTXduMVk0K3V2Z2k3bnkweTY0M0NHS2pTQ3ZOamVMbnppRVNmelkwU1BJ?=
 =?utf-8?B?YzFCUnFOMzBqdzNtZ3hHNGF2bzJQYUdpbmhsUzdPT3l0YUVCSU5CbE1mZGdm?=
 =?utf-8?B?TkRxS1I4ZXI3QkQ3TXliTmJ5Q2kraW5iQTU1KzNJMDFWazh3OVpuRWgvcXRq?=
 =?utf-8?B?S2ZoUFBpWnZxVkI5UE9iR284bERKWDVoTlNXb1o5TStmM0RVV2RFa3Ntdm1W?=
 =?utf-8?B?bnlZblVTdTJBbHZiR1lCVzJKSk9mR2M1N25lNWZnZVFYWkZWaFRSQVhlcDhN?=
 =?utf-8?B?SHVpMTh1UGEwRTM4V1h5RW54QU1kcnQwK2JIS0VKUEZ2blRtcWhGQnRlQ2hw?=
 =?utf-8?B?SE9JU0tTWWdDb0VFZTVhRmRhdjJsTkFneW5HblM4bDJrTkFsdHlkYkkwVXRr?=
 =?utf-8?B?WG1WcEJPYS9sRGlzQnZybjd1WlBxSUoyeGtoVEVJckxGbUR4dmFNcUxoSzRx?=
 =?utf-8?B?S3dCZHVwTXkzakZTcUlLeHZKbjBXaUpESGh5NCtFZHN1K2ljb1VCSmxJVHFE?=
 =?utf-8?B?K3F4c0dpTUY5RWUzSndlT05LaXlicWRweW16S2VxL0RCd3hxdVJIN3V3QjJh?=
 =?utf-8?B?S2NuaSt1c3ZjVUVrMlE4Tko1TnNEMzRKWkdDRy9lSzNCM3Mwc3ZEZ1FvUSto?=
 =?utf-8?B?T085OTZ6TkNqS0lWRFVZYkNETXVRYU9BNkFCOEVON05xcFdTZzlOVm5CV0hC?=
 =?utf-8?B?ZGNGZHlPYWQ4V2MvMklWSExCL0lZUldVSkx1RDcyZjVXdk5mTW9KdlUycjRp?=
 =?utf-8?B?VUVVYjljZ09FRWUyNGNDMUhVYnVIVCtUSzIwcnlid1FTVEc5RWRtemZxSk10?=
 =?utf-8?B?VU12b0JweUxHU2hzUDE4M21HOE9pY0NYU1J5bWh2L1FaYWR1ZEp2a0liZDY4?=
 =?utf-8?Q?th5l4H6YOA5E7b80VVIV7Du6o?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d20545f-bbc5-4dbb-266c-08dda452109c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 16:57:33.1341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YYwYIu5txsjIA0Wm1b6sjkL8tm3chz4ZT3B0NvaBPKIVY22HdtA/06RgCTql5nM85foGViVjBc3lRTRCDXaS3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7269
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

Hi Soham

Code looks good. Have one question and few minor comments below

On 5/22/2025 9:14 PM, Soham Purkait wrote:
> Introduce vendor-agnostic support for
> handling multiple GPUs and instances
> in gputop. Improve the tool's adaptability
> to various GPU configurations.
> 
> v2 : Fix for refactoring GPUTOP into a
>       vendor-agnostic tool. (Lucas)
> 
> v3 : New year included in copyright. (Kamil, Riana)
>       Removed caps in function name. (Riana)
>       Struct for driver specific operations. (Riana)
>       Headers in alphabetical order. (Kamil, Riana)
> 
> v4 : Commit description and signed-off included.
> 
> v5 : Fix for proper resource cleanup. (Riana)
>       Use "dev_type" enum for card_type. (Krzysztof)
>       Add new filter to return collection
>       of matching devices.               (Zbigniew)
> 
> v6 : Use device filter to populate the array of
>       cards for all supported drivers.   (Zbigniew)
> 
> v7 : Use filter to find all the cards.  (Zbigniew)
> 
> v8 : Removed 'drivers' array parameter from
>       card match function.               (Zbigniew)
> 
> v10 : Resolved 'populate_devices' call with
>        pci subsystem filtering.          (Zbigniew)
> 
> v11 : Add space after /* and before */ for better
>        readability.                      (Zbigniew)
>        Comments wrapped at 75/100.       (Riana)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> 
> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   tools/{ => gputop}/gputop.c | 223 +++++++++++++++++++++++++++++-------
>   tools/gputop/meson.build    |   6 +
>   tools/meson.build           |   6 +-
>   3 files changed, 191 insertions(+), 44 deletions(-)
>   rename tools/{ => gputop}/gputop.c (66%)
>   create mode 100644 tools/gputop/meson.build
> 
> diff --git a/tools/gputop.c b/tools/gputop/gputop.c
> similarity index 66%
> rename from tools/gputop.c
> rename to tools/gputop/gputop.c
> index 43b01f566..fc3ccb83b 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop/gputop.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: MIT
>   /*
> - * Copyright © 2023 Intel Corporation
> + * Copyright © 2023-2025 Intel Corporation
>    */
>   
>   #include <assert.h>
> @@ -14,66 +14,145 @@
>   #include <math.h>
>   #include <poll.h>
>   #include <signal.h>
> +#include <stdbool.h>
>   #include <stdint.h>
>   #include <stdio.h>
>   #include <stdlib.h>
>   #include <string.h>
> +#include <sys/sysmacros.h>

alphabetical

>   #include <sys/ioctl.h>
>   #include <sys/stat.h>
>   #include <sys/types.h>
> -#include <unistd.h>
>   #include <termios.h>
> -#include <sys/sysmacros.h>
> -#include <stdbool.h>
> +#include <unistd.h>
>   
> +#include "drmtest.h"
>   #include "igt_core.h"
>   #include "igt_drm_clients.h"
>   #include "igt_drm_fdinfo.h"
> +#include "igt_perf.h"
>   #include "igt_profiling.h"
> -#include "drmtest.h"
> +#include "xe_gputop.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * Supported Drivers
> + *
> + * Adhere to the following requirements when implementing support for the
> + * new driver:
> + * @drivers: Update drivers[] with driver string.
> + * @total_count: Update NUM_DRIVER with the total number of supported drivers.
> + * @operations: Update the respective operations of the new driver:
> + * gputop_init,
> + * discover_engines,
> + * pmu_init,
> + * pmu_sample,
> + * print_engines,
> + * clean_up
> + * @devices: Update devices[] array of type "struct gputop_device" with the
> + * initial values.
> + */
> +static const char * const drivers[] = {
> +	"xe",
> +    /* Keep the last one as NULL */
> +	NULL
> +};
> +
> +/**
> + * Number of supported drivers needs to be adjusted as per the length of
> + * the drivers[] array.
> + */
> +#define NUM_DRIVER 1
> +
> +/**
> + * Supported operations on driver instances. Update the oprs[] array for
> + * each individual driver specific function. Maintain the sequence as per
> + * drivers[] array.
> + */
> +struct device_operations oprs[NUM_DRIVER] = {

Replace oprs with ops.. generally use ops for operations
> +	{
> +		xe_gputop_init,
> +		xe_populate_engines,
> +		xe_pmu_init,
> +		xe_pmu_sample,
> +		xe_print_engines,
> +		xe_clean_up
> +	}
> +};
> +
> +/*
> + * devices[] array of type struct gputop_device
> + */
> +struct gputop_device devices[] = {

I must have commented here before. As i see this is one entry per driver 
right? why is it named device?

> +	{false, 0, NULL}
> +};
>   
>   enum utilization_type {
>   	UTILIZATION_TYPE_ENGINE_TIME,
>   	UTILIZATION_TYPE_TOTAL_CYCLES,
>   };
>   
> -static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
> -
> -#define ANSI_HEADER "\033[7m"
> -#define ANSI_RESET "\033[0m"
> -
> -static void n_spaces(const unsigned int n)
> +static void gputop_clean_up(void)
>   {
> -	unsigned int i;
> -
> -	for (i = 0; i < n; i++)
> -		putchar(' ');
> +	for (int i = 0; drivers[i]; i++) {
> +		oprs[i].clean_up(devices[i].instances, devices[i].len);
> +		free(devices[i].instances);
> +		devices[i].driver_present = false;
> +		devices[i].len = 0;
> +	}
>   }
>   
> -static void print_percentage_bar(double percent, int max_len)
> +static int find_driver(struct igt_device_card *card)
>   {
> -	int bar_len, i, len = max_len - 1;
> -	const int w = 8;
> -
> -	len -= printf("|%5.1f%% ", percent);
> -
> -	/* no space left for bars, do what we can */
> -	if (len < 0)
> -		len = 0;
> -
> -	bar_len = ceil(w * percent * len / 100.0);
> -	if (bar_len > w * len)
> -		bar_len = w * len;
> +	for (int i = 0; drivers[i]; i++) {
> +		if (strcmp(drivers[i], card->driver) == 0)
> +			return i;
> +	}
> +	return -1;
> +}
>   
> -	for (i = bar_len; i >= w; i -= w)
> -		printf("%s", bars[w]);
> -	if (i)
> -		printf("%s", bars[i]);
> +/*
> + * If filter is not NULL i will be ignored.
> + */
> +static int populate_device_instances(const char *filter)
> +{
> +	struct igt_device_card *cards = NULL;
> +	struct igt_device_card *card_inplace = NULL;
> +	struct gputop_device *dev =  NULL;
> +	int driver_no;
> +	int count, final_count = 0;

%s/final_count/card_count

> +
> +	count = igt_device_card_match_all(filter, &cards);
> +	for (int j = 0; j < count; j++) {
> +		if (strcmp((cards + j)->subsystem, "pci") != 0)
> +			continue;
>   
> -	len -= (bar_len + (w - 1)) / w;
> -	n_spaces(len);
> +		driver_no = find_driver(cards + j);
> +		if (driver_no < 0)
> +			continue;
>   
> -	putchar('|');
> +		dev = devices + driver_no;
> +		if (!dev->driver_present)
> +			dev->driver_present = true;
> +		dev->len++;
> +		dev->instances = realloc(dev->instances,
> +					 dev->len * sizeof(struct xe_gputop));
> +		if (!dev->instances) {
> +			fprintf(stderr,
> +				"Device instance realloc failed (%s)\n",
> +				strerror(errno));
> +			exit(EXIT_FAILURE);
> +		}
> +		card_inplace = (struct igt_device_card *)
> +				calloc(1, sizeof(struct igt_device_card));
> +		memcpy(card_inplace, cards + j, sizeof(struct igt_device_card));
> +		oprs[driver_no].gputop_init((struct xe_gputop *)(dev->instances + dev->len - 1),
> +			card_inplace);
> +		final_count++;
> +	}
> +	if (count)
> +		free(cards);
> +	return final_count;
>   }
>   
>   static int
> @@ -333,6 +412,7 @@ static void clrscr(void)
>   struct gputop_args {
>   	long n_iter;
>   	unsigned long delay_usec;
> +	char *device;
>   };
>   
>   static void help(void)
> @@ -343,16 +423,18 @@ static void help(void)
>   	       "\t-h, --help                show this help\n"
>   	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
>   	       "\t-n, --iterations =NUMBER  number of executions\n"
> +	       "\t-D, --device              Device filter\n"
>   	       , program_invocation_short_name);
>   }
>   
>   static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>   {
> -	static const char cmdopts_s[] = "hn:d:";
> +	static const char cmdopts_s[] = "hn:d:D:";
>   	static const struct option cmdopts[] = {
>   	       {"help", no_argument, 0, 'h'},
>   	       {"delay", required_argument, 0, 'd'},
>   	       {"iterations", required_argument, 0, 'n'},
> +	       {"device", required_argument, 0, 'D'},
>   	       { }
>   	};
>   
> @@ -360,6 +442,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>   	memset(args, 0, sizeof(*args));
>   	args->n_iter = -1;
>   	args->delay_usec = 2 * USEC_PER_SEC;
> +	args->device = NULL;
>   
>   	for (;;) {
>   		int c, idx = 0;
> @@ -383,6 +466,9 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>   				return -1;
>   			}
>   			break;
> +		case 'D':
> +			args->device = optarg;
> +			break;
>   		case 'h':
>   			help();
>   			return 0;
> @@ -422,6 +508,52 @@ int main(int argc, char **argv)
>   	n = args.n_iter;
>   	period_us = args.delay_usec;
>   
> +	if (!populate_device_instances(args.device ? args.device
> +				       : "device:subsystem=pci,card=all")) {
> +		printf("No device found.\n");
> +		gputop_clean_up();
> +		exit(1);
> +	}
> +
> +	for (int i = 0; drivers[i]; i++) {
> +		if (devices[i].driver_present) {

if not present continue

Thanks
Riana

> +			for (int j = 0; j < devices[i].len; j++) {
> +				if (!oprs[i].init_engines(devices[i].instances + j)) {
> +					fprintf(stderr,
> +						"Failed to initialize engines! (%s)\n",
> +						strerror(errno));
> +						gputop_clean_up();
> +					return EXIT_FAILURE;
> +				}
> +				ret = oprs[i].pmu_init(devices[i].instances + j);
> +
> +				if (ret) {
> +					fprintf(stderr,
> +						"Failed to initialize PMU! (%s)\n",
> +						strerror(errno));
> +					if (errno == EACCES && geteuid())
> +						fprintf(stderr,
> +							"\n"
> +							"When running as a normal user CAP_PERFMON is required to access performance\n"
> +							"monitoring. See \"man 7 capabilities\", \"man 8 setcap\", or contact your\n"
> +							"distribution vendor for assistance.\n"
> +							"\n"
> +							"More information can be found at 'Perf events and tool security' document:\n"
> +							"https://www.kernel.org/doc/html/latest/admin-guide/perf-security.html\n");
> +
> +					igt_devices_free();
> +					gputop_clean_up();
> +					return EXIT_FAILURE;
> +				}
> +			}
> +		}
> +	}
> +
> +	for (int i = 0; drivers[i]; i++) {
> +		for (int j = 0; devices[i].driver_present && j < devices[i].len; j++)
> +			oprs[i].pmu_sample(devices[i].instances + j);
> +	}
> +
>   	clients = igt_drm_clients_init(NULL);
>   	if (!clients)
>   		exit(1);
> @@ -442,14 +574,27 @@ int main(int argc, char **argv)
>   
>   	while ((n != 0) && !stop_top) {
>   		struct igt_drm_client *c, *prevc = NULL;
> -		int i, engine_w = 0, lines = 0;
> +		int k, engine_w = 0, lines = 0;
>   
>   		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
> +
> +		for (int i = 0; drivers[i]; i++) {
> +			for (int j = 0; devices[i].driver_present && j < devices[i].len; j++)
> +				oprs[i].pmu_sample(devices[i].instances + j);
> +		}
> +
>   		igt_drm_clients_sort(clients, client_cmp);
>   
>   		update_console_size(&con_w, &con_h);
>   		clrscr();
>   
> +		for (int i = 0; drivers[i]; i++) {
> +			for (int j = 0; devices[i].driver_present && j < devices[i].len; j++) {
> +				lines = oprs[i].print_engines(devices[i].instances + j,
> +							 lines, con_w, con_h);
> +			}
> +		}
> +
>   		if (!clients->num_clients) {
>   			const char *msg = " (No GPU clients yet. Start workload to see stats)";
>   
> @@ -457,7 +602,7 @@ int main(int argc, char **argv)
>   			       (int)(con_w - strlen(msg) - 1), msg);
>   		}
>   
> -		igt_for_each_drm_client(clients, c, i) {
> +		igt_for_each_drm_client(clients, c, k) {
>   			assert(c->status != IGT_DRM_CLIENT_PROBE);
>   			if (c->status != IGT_DRM_CLIENT_ALIVE)
>   				break; /* Active clients are first in the array. */
> @@ -481,11 +626,11 @@ int main(int argc, char **argv)
>   	}
>   
>   	igt_drm_clients_free(clients);
> +	gputop_clean_up();
>   
>   	if (profiled_devices != NULL) {
>   		igt_devices_configure_profiling(profiled_devices, false);
>   		igt_devices_free_profiling(profiled_devices);
>   	}
> -
>   	return 0;
>   }
> diff --git a/tools/gputop/meson.build b/tools/gputop/meson.build
> new file mode 100644
> index 000000000..4766d8496
> --- /dev/null
> +++ b/tools/gputop/meson.build
> @@ -0,0 +1,6 @@
> +gputop_src = [ 'gputop.c', 'utils.c', 'xe_gputop.c']
> +executable('gputop', sources : gputop_src,
> +           install : true,
> +           install_rpath : bindir_rpathdir,
> +           dependencies : [igt_deps,lib_igt_perf,lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],
> +	   install: true)
> diff --git a/tools/meson.build b/tools/meson.build
> index de866c392..8002f707d 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -69,11 +69,6 @@ if libudev.found()
>   		   install : true)
>   endif
>   
> -executable('gputop', 'gputop.c',
> -           install : true,
> -           install_rpath : bindir_rpathdir,
> -           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
> -
>   intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
>   executable('intel_l3_parity', sources : intel_l3_parity_src,
>   	   dependencies : tool_deps,
> @@ -122,3 +117,4 @@ endif
>   subdir('i915-perf')
>   subdir('xe-perf')
>   subdir('null_state_gen')
> +subdir('gputop')

