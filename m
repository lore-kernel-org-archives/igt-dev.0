Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A276C61DB9
	for <igt-dev@archiver.kernel.org>; Sun, 30 Aug 2026 18:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D3810E13C;
	Sun, 30 Aug 2026 18:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E3ccZrVx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD39510E13C
 for <igt-dev@lists.freedesktop.org>; Sun, 30 Aug 2026 18:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788114355; x=1819650355;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=nUf9FSV1VZsu4lPnNj5HnI2hNYMwlbb1RFOn9m/T8aE=;
 b=E3ccZrVx84R9F47ZPPxvlBcv5VWmV0yuTcO+j0Hi2TTDp55bmYwLgDzn
 74lBg2KR7lMqK7e7sVt6wzvuqWBCKfjetqXo2SmwYa/6PzzLvpahTRAV8
 PffwORUQLsbJWOwnUEVEsdGFMFHSOSLqiFp0bDhOsPosAhyhYqgCbes1G
 LIRsqkBjHSjTSJa5Ouv/ZprOa/CUoDgb2gzFOpyjHA4aV3F6KZa4FxkRx
 wYV1M50sBCYfwICbx3KnLuCArM91QjVEjJy5pBdiPPvfCY7iZ2TeRNCRF
 fGaRorjdkWmABKnZJfCnXAyx2VoGhDvlXAfK4U1dS8w3aKyytG3xHd/pK w==;
X-CSE-ConnectionGUID: nzIX6oq+Qhq1D9id38xhZA==
X-CSE-MsgGUID: TGF5pcKFTc6YKDk1sXtekQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88657318"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208,217";a="88657318"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 11:25:54 -0700
X-CSE-ConnectionGUID: 7COfkdClTsyf9LSdpLYCTw==
X-CSE-MsgGUID: 1WTftMPhThO5Ej8aoCt4Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
 d="scan'208,217";a="293422151"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 11:25:54 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 11:25:53 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 30 Aug 2026 11:25:53 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 11:25:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJ7+DFwEwow0LkUYgJFjXZJBO+PWS1PsdZWcqMs/kSkL/QJU98H67XEl+3mUqcYopzDLvST8DaTuYGZ0wIwNDQyMWE0+5lW9+o3cdwIQLDe7BGqzlggH0klA+MSp816Dv4eeRre0ejQpYxwLPQydjjO9aXMJ4kb7yaCwkAolLRHmR9FSRLrJ9E3c4+njVXjM5dCwDbcfyDu3OXxS4BdxhPe4VcsmTx6j86FqDS6vJ/ijQL8cC4IsqLpTQREvUttGtDQwHQAMTRPHJsANylSbse/qi4CeCXngWET7D1lyQr6ivLQNPY7uvCnfkg+5Kwk8X554nBeoxqvdIzAk3BTRqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4EkvHkwmuCduyyoe914yUgncwea5in94REC4NgKpYi0=;
 b=BpmpAaKKPaovkgN8e/NDqQCWm+1jhoCwve5vd68ZnJNyUyMPBGnC5tSNXJOPO6M8yRqfmQDY4EqEo9nPFewmk3r1mhrC/3Vwx3X84oG/9FJG5pOEytjvHMGg6652CI6VvM8L6FGm9RH7pKnUN2IxEJIpfBAWKxoI2R0NNyYefXldqWWP+HZnvtGnNVKZcCjPCWHQRRfAoOAjN77zQWLYmasbTUa5RkPEF01L05rM6xvSBe/2Lf3LbaMTrnjPGZyWymD5shgc1NE2K9StLXQqcOa4fjoJc6XWqcNQYQqen+PtpRkZgB0YRN3sV8Kf1knAm+UiTI484/ecBYMkBePt3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 by PH7PR11MB7449.namprd11.prod.outlook.com (2603:10b6:510:27a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sun, 30 Aug
 2026 18:25:51 +0000
Received: from CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03]) by CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03%5]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 18:25:51 +0000
Content-Type: multipart/alternative;
 boundary="------------jkG4xwSSUBgllTJo7bMaZCTR"
Message-ID: <8b3ee84f-cf48-4673-9d5a-8bcd54a45cb0@intel.com>
Date: Sun, 30 Aug 2026 23:55:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 17/17] tests/kms_hdr: run on 3 outputs when
 testing suspend
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <nemesa.garg@intel.com>, <karthik.b.s@intel.com>
References: <20260821124834.1974029-1-michal.grzelak@intel.com>
 <20260821124834.1974029-18-michal.grzelak@intel.com>
Content-Language: en-GB
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260821124834.1974029-18-michal.grzelak@intel.com>
X-ClientProxiedBy: MA0P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::13) To CO1PR11MB4913.namprd11.prod.outlook.com
 (2603:10b6:303:9f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4913:EE_|PH7PR11MB7449:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5007fe-8bc6-48e8-dea7-08df06c41ec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|56012099006|3023799007|8096899003|6133799003|10067099003|5023799004|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: PrTzHFt3SWplDZNXRP/1TCwsuZmMGYRMlZvZdQF8RZUqxjVRCCd+Se2BbDaLOwkB+8ZxtRl+4bPx4f+txbZ4QO9LlVO4OgpufCL+ejHi2mtKkmmA3c69dsIXvS8u5hpc+7+rpNRR4r7OxEocX6oS8MLpWnjebZJYJFDUhkeCFryMfVq2tnzFOjZPh9JEMP9rXypAX2HI7bS4FuJbWlvQ3rKpG4OXzfD1S/kIwpOZg9aPyGWMyHUUSlY9ffMM6rKRYmj3jCeI1rsRyRmi75DazCMbyADOdZLVnQ5iUQ2g3+vK5b0LfIV6iL+koBoMZ9rBKibe+fUTjMXXkyV8OsbkOb5IGdZb/HjTCeaNA+eQV+i4W2hNOFMBBlXCL84ukN5pOspdPENK9bBNKDi+caOhOrQ9a8RM0yqUIzrzPvWdy04Davmves/Obkwb48+C54ZGh0YUGFt8Ya/O8nPCAM5XzEinzQmz6Z4hbg1D10aCXPFKWgquAQYkIb3ijBvBsr9Bell0hrgotL57trgwknzdhLgBxN/YSMZRc8/ooCdP9FrKbZkabsbqnjoHTOFbV5OIDI3JjPOHA6cQ0Bqz+nUiDTdL9if76dC+l/6eGdySLs9FmrAzPY+pv5IcpG24mgBzCqfyPncfOJnCDXLTwY1jIWO5+FSf18wn6ggIoqa2vQo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4913.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(3023799007)(8096899003)(6133799003)(10067099003)(5023799004)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akJMd2plWmdjTnVZQ0pMWmJQMm4rZUF6SjJ1NnBod09ib3lmQkZ4enI4M1JZ?=
 =?utf-8?B?dXFXa01raUNPeEg5Y2hsOFZOQ0Fxa3B1UUYyZVBkc0dSdCtuN1g5R05IaS9Z?=
 =?utf-8?B?YWkyNFN2VmlSRkdtK3RJeUEyWjlUamMzYlFvL1VmdUFGYW1zd3BaeVlvYkN6?=
 =?utf-8?B?aVZPV2I2M2wxYVIvM0VCT0owemV6ckVQNW1hZVFqd1E0WXlBQXJCbVRZbFFC?=
 =?utf-8?B?SEJrYzN6bkxuVXplRytGaGNNWUxReWUyRDdNMGZQMElySUlIUWhDenJEVkx6?=
 =?utf-8?B?TStjWFlzNEZ2SnpCY05wQllTOEpGakpZVk1NZUdscE9sTE1hRXhLa0M4WkVD?=
 =?utf-8?B?QkwrSHE0bTVCZ2NNS1VSWGYzSDA3cXN0MGxzYU1NLzhYSEk0U2VHL3kzbXJY?=
 =?utf-8?B?cDNGVTgvNm5CeURhbWlCRGJEWFJFWldaeGdhVzZhb1EvOHgycXdjeitvOHZy?=
 =?utf-8?B?OVZNek1TQnRxRWZLWXpsYWxFL2VsMlBrQVJDVmhtSllqK2U2ZEZPcllhcjlT?=
 =?utf-8?B?VTJYNG9FUzUvYndrTWdyeU9EYjNlMWlqYVo1aFBVOXlnVlI3QUJjNWVSRnFQ?=
 =?utf-8?B?b09xelFFMDdYWllDT0oyVDExOFUxTXNUNUdPdlU3MkZEVGYrd01FZ3J1dmFo?=
 =?utf-8?B?VnZOSmMzQ25qWVRyblBMU2J3eHBRQ1piYVVIaEI1UklkM1lNMVgyN3VZQ0JN?=
 =?utf-8?B?V3Qxb3M5UmxFQ3dWQnRPLzZsd0dJeTg4NGp0Ym5vcVpIS2VNYThIMkJOVUNG?=
 =?utf-8?B?VmxWd2dyY3FMNDRsZ1VsT0VjTVpiR2JaTHJKUmRJVzFTZjRvTldnb1czNldu?=
 =?utf-8?B?MVViN2J3WFZIMGt3T1BWYTVENVJxS3U0ZmZzRFhvYk15U1drejRlN1FXMW5h?=
 =?utf-8?B?dTRGeEI5RE9MUHNBUVBEOTNjOFZGMFRqM3pTUVJRa0JLblpZSHNqcWxTS2JV?=
 =?utf-8?B?NW9XTVJ1NDByZnpLQUpuWFBHYW8zVkxaU0dJSlZrd0NQcTNrMk1hRTF2VFpR?=
 =?utf-8?B?WHZ3bVpuNldIT2VvWUgxVlp2UWtvaHFIeHY4UHNCTUFvSDVYOGFtSFlRWi9D?=
 =?utf-8?B?ODg2anVRMG9BcXYyVjVjWVFnRytseFMvR0xQa010K0pyMXNGM1hnV3ZCdkk4?=
 =?utf-8?B?MFNUVFlOcW5iQmRWZyt2NHdrNmFFL0pzN21EdEE1QVpxUWZkeW9IdlBiOTRq?=
 =?utf-8?B?VFVIb0pqK05qbXU4UXhkMDNFZkl6a1BJYUNabEJlSmRNeWpqSEZiaHY2ajlQ?=
 =?utf-8?B?VVVJaGRZb2ZqSmlodEowVGRBQTBMdmhvQmNRbjIvNnUrelZ0bjY1UE1vNWo5?=
 =?utf-8?B?VTdIaG5GdTUwSTkzMWY4V1NPcGttcDQyTld0ZDZGL0lqdDZxbUhwTmR2elZ5?=
 =?utf-8?B?Q3NHaU5WY3lwdFQxNmh6S0RPZGlaVGRPMlVnTzl3ZVR2aStSNmF3cENhU21l?=
 =?utf-8?B?MjgrT2V3T1ptN09xdzRJRGxiYllZNkpLOTIwSzJ2OGN4MVpWNUs5SWl2TWtW?=
 =?utf-8?B?Y2pxa0ZXeExWZkE3TXZ3T25HTmhFbkE5c3VKcW9JQTA5QlN0Zitaak00RXh5?=
 =?utf-8?B?eGtRSWdpYTVPdnlIQkNEZ3VaYXhqK0pVUkpBZGNQdlNqeXE2RUZ1MDI2Ylpj?=
 =?utf-8?B?dGNYMTAyZGgySDZ1aitYWmZ1a2ZQVjVJcDJJeWlZUzZpazRZK3BvR3dTVW5S?=
 =?utf-8?B?ZXZ1OUR1UzRjMUFOMWExRk9YSmNFblBLSFp3S3o5aWkvMEowYmRoRHdmaHZ4?=
 =?utf-8?B?UDhFbFIrNkNpMXp2aFE3b0VkeHlyR0hVSFdPVmx5cTdVQUVTZXJKZmZubmY5?=
 =?utf-8?B?QUlTTFpkaHhGSHlHTlhHTS9QYkJ1ZXNldnNJWWs2R0R5TXIzeHBpbFIwamdL?=
 =?utf-8?B?RWN2NzdVaVBnQzNLajBGQ2dCTDE5VXlIeWdJRzF2YTBWZ2ovOEtGQXdvTE5P?=
 =?utf-8?B?QlQxMlpyWlk1UjMxV0NseHE1MXZnNlZvSkV4S0xGV0dBTmFOQ2E5ZmMyeXhQ?=
 =?utf-8?B?VnhmbjIvZFJZbkFRajBsMklaU2lmNzJOdVRiK1V4UDVVNTg2L1RHdi9Hb0xw?=
 =?utf-8?B?ZGRqbnhUT3hoaHZrWVJZQXl3RDRVNXcxd0dFdmFHMGpSZlB3TDBLbXNtL2p5?=
 =?utf-8?B?aVVrU2lYN0cvYzU3M3duWTRoenFBdURIYUNnb3Z3VnEvS3E1cXU4bk1PODEv?=
 =?utf-8?B?RHk0d3pQZ01yc3ZzdGVFMGRaamtWODl0Q1J4cXRzR2RVbmc3NHBUSUFQS0Vz?=
 =?utf-8?B?em5JQTZyVWVwNzlmRWdlS1JNWTlEM2FRWWN3WWRyM2RWOVVxbEcwdndRUm9V?=
 =?utf-8?B?YUs0eDBDQllRVUVwNTVaKzJ4dzUvOTQyeVY2YmNIRE9DRFAya1hVSkx0U2Vo?=
 =?utf-8?Q?wD8ziazdTnFTOL70=3D?=
X-Exchange-RoutingPolicyChecked: ZsZQ5WHvATa8/3a1pjvOH9Z8ymNb0tz8DwOVh+F2r2gEw3dzLIa/xpnuLWSY0rn+GSoLiVONB6GxIgRoVnM3knVYbRTtFDgO+oS/D6Pik7TxhUgs/VT6xgcAwnkMx4reRAbYLCbaKZZCUg09XztEVOr8lOlVQy+590xOjBLxr6OtNIA5JB4Rr9RQhf/hA4VeVZ+d9IgInvw8ORw4AmcXQq5YyY+SM0VFBdr9mvH5pyJgOhVTSv6oTKzTkh/TFPH2I0k1ugflATYZu2JL353/ybCOKYq262k+fXDBX3etMF1E3TWCqk7fiEsFvgO9W7Cq3RGiJ57O1sGd6mgEV1LIrA==
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5007fe-8bc6-48e8-dea7-08df06c41ec8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 18:25:51.0878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H4Qc77CbDUVzAL6xlPRCbNIxMe45btdQllYs5VONft58Ks8Tgy1gqlN1GkehL20lTfVSxh/hHVeiJLb+PAwWTDUIKKb46J/aLrLlhdcR/GA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7449
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

--------------jkG4xwSSUBgllTJo7bMaZCTR
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 21-08-2026 06:18 pm, Michał Grzelak wrote:
> Each suspend test is executed per output. Limit number of outputs tested
> to 3 by default. Add command-line option enabling execution on every
> output.
-->Any specific reason to cover this for 3 outputs?
> v2->v3
> - add patch
>
> Signed-off-by: Michał Grzelak<michal.grzelak@intel.com>
> ---
>   tests/kms_hdr.c | 30 ++++++++++++++++++++++++++++--
>   1 file changed, 28 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index e23d5e4691..95a7344ceb 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -74,6 +74,8 @@ IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
>   
>   #define BACKLIGHT_PATH "/sys/class/backlight"
>   
> +#define OUTPUT_LIMIT 2
-->if intention to run on 3 pipes as per subject make it as 3
> +
>   /* HDR test formats: 10bpc + FP16 */
>   static const uint32_t hdr_test_formats[] = {
>   	DRM_FORMAT_XRGB2101010,
> @@ -110,6 +112,7 @@ typedef struct data {
>   	int w;
>   	int h;
>   	igt_fb_t afb;
> +	bool all_outputs;
>   } data_t;
>   
>   /* Common test cleanup. */
> @@ -250,6 +253,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   {
>   	igt_display_t *display = &data->display;
>   	igt_output_t *output;
> +	int output_count = 0;
>   
>   	igt_display_reset(display);
>   
> @@ -273,6 +277,11 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   			continue;
>   		}
>   
> +		if (!data->all_outputs && flags & TEST_SUSPEND && output_count > OUTPUT_LIMIT)
-->add parens around flags & TEST_SUSPEND

--> should be :output_count >= OUTPUT_LIMIT

-->One more subtest: test_hdr also covering SUSPEND don’t we need this 
check for it?
> +			continue;
> +
> +		output_count++;
> +
>   		for_each_crtc(display, crtc) {
>   			igt_output_set_crtc(output,
>   					    crtc);
> @@ -674,10 +683,27 @@ static void test_hdr(data_t *data, uint32_t flags)
>   	}
>   }
>   
> -int igt_main()
> +static int opt_handler(int opt, int opt_index, void *opt_data)
>   {
> -	data_t data = {};
> +	data_t *data = opt_data;
> +
> +	switch (opt) {
> +		case 'o':
> +			data->all_outputs = true;
> +			break;
> +		default:
> +			return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
>   
> +static const char help_str[] = "  -o \tRun on all outputs instead of 3 when testing suspend.\n";
> +
> +data_t data = {};
-->make it as static
> +
> +int igt_main_args("o", NULL, help_str, opt_handler, &data)
> +{
>   	igt_fixture() {
>   		data.fd = drm_open_driver_master(DRIVER_ANY);
>   
--------------jkG4xwSSUBgllTJo7bMaZCTR
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 21-08-2026 06:18 pm, Michał Grzelak
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260821124834.1974029-18-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">Each suspend test is executed per output. Limit number of outputs tested
to 3 by default. Add command-line option enabling execution on every
output.
</pre>
    </blockquote>
    --&gt;Any specific reason to cover this for 3 outputs?
    <blockquote type="cite" cite="mid:20260821124834.1974029-18-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
v2-&gt;v3
- add patch

Signed-off-by: Michał Grzelak <a class="moz-txt-link-rfc2396E" href="mailto:michal.grzelak@intel.com">&lt;michal.grzelak@intel.com&gt;</a>
---
 tests/kms_hdr.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index e23d5e4691..95a7344ceb 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -74,6 +74,8 @@ IGT_TEST_DESCRIPTION(&quot;Test HDR metadata interfaces and bpc switch&quot;);
 
 #define BACKLIGHT_PATH &quot;/sys/class/backlight&quot;
 
+#define OUTPUT_LIMIT 2</pre>
    </blockquote>
    --&gt;if intention to run on 3 pipes as per subject make it as 3
    <blockquote type="cite" cite="mid:20260821124834.1974029-18-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
 /* HDR test formats: 10bpc + FP16 */
 static const uint32_t hdr_test_formats[] = {
 	DRM_FORMAT_XRGB2101010,
@@ -110,6 +112,7 @@ typedef struct data {
 	int w;
 	int h;
 	igt_fb_t afb;
+	bool all_outputs;
 } data_t;
 
 /* Common test cleanup. */
@@ -250,6 +253,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 {
 	igt_display_t *display = &amp;data-&gt;display;
 	igt_output_t *output;
+	int output_count = 0;
 
 	igt_display_reset(display);
 
@@ -273,6 +277,11 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 			continue;
 		}
 
+		if (!data-&gt;all_outputs &amp;&amp; flags &amp; TEST_SUSPEND &amp;&amp; output_count &gt; OUTPUT_LIMIT)</pre>
    </blockquote>
    --&gt;add parens around&nbsp;&nbsp;<span style="white-space: pre-wrap">flags &amp; TEST_SUSPEND</span>
    <p>--&gt; should be :<span style="white-space: pre-wrap">output_count &gt;= OUTPUT_LIMIT</span></p>
    --&gt;One more subtest: test_hdr also covering SUSPEND don’t we need
    this check for it?
    <blockquote type="cite" cite="mid:20260821124834.1974029-18-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			continue;
+
+		output_count++;
+
 		for_each_crtc(display, crtc) {
 			igt_output_set_crtc(output,
 					    crtc);
@@ -674,10 +683,27 @@ static void test_hdr(data_t *data, uint32_t flags)
 	}
 }
 
-int igt_main()
+static int opt_handler(int opt, int opt_index, void *opt_data)
 {
-	data_t data = {};
+	data_t *data = opt_data;
+
+	switch (opt) {
+		case 'o':
+			data-&gt;all_outputs = true;
+			break;
+		default:
+			return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
 
+static const char help_str[] = &quot;  -o \tRun on all outputs instead of 3 when testing suspend.\n&quot;;
+
+data_t data = {};</pre>
    </blockquote>
    --&gt;make it as static
    <blockquote type="cite" cite="mid:20260821124834.1974029-18-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+int igt_main_args(&quot;o&quot;, NULL, help_str, opt_handler, &amp;data)
+{
 	igt_fixture() {
 		data.fd = drm_open_driver_master(DRIVER_ANY);
 
</pre>
    </blockquote>
  </body>
</html>

--------------jkG4xwSSUBgllTJo7bMaZCTR--
