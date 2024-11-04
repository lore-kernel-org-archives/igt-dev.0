Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80620D1BDE5
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 19:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A7E10E4B9;
	Mon,  4 Nov 2024 19:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="geBCBdoj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77A910E4B9
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2024 19:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730748312; x=1762284312;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RdE9Sd9Ktk+pIWM7vluvdDzNXEiy2mI8EYaa4J5ieZ0=;
 b=geBCBdojwgeLnfDshcnSSNyG3xHCmYEd7NOqX9ifW1A2R92byIIjEgp+
 R0rBKdL5esf04aPylvc/bMIY0wM5nXTq9GtwguRTbMfXYiD1O/PuRo4ZK
 fXP1knxLhWLh74rLbxPZp9NNfbHQzJxlXEu1EoEmSbSvrVliZdAGCAZuh
 QJEZdmi57xKo3qhI+W9wPaeGGjYLfStoFMz61jGbvSO5hEzWJrJ+Vt3RC
 EyDvUExK5LvUXIQYc9eWZ8iZ/yahWeuqFbolPrFlsvsdk4BMsSSSB0IaL
 6QU3keVCJq/URROcJIqeMkdbsQD5DG/gtrD69GflTdQSVPtFf+bgVI7I4 A==;
X-CSE-ConnectionGUID: STc5+dsORJGLGFarqLeJGA==
X-CSE-MsgGUID: Fi8Lr/kSR8KDqVCQxTV/JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53031844"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53031844"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 11:25:11 -0800
X-CSE-ConnectionGUID: KbHM2SSkRO2W3a2xbeIOQQ==
X-CSE-MsgGUID: 5wg9CDYkQJWzeUQlbrY9XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="114534782"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 11:25:12 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 11:25:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 11:25:11 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 11:25:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8mHU36ljR/gcODajGB3hPvgtqLegTq/s+5QI3rOvIvi6iVilP+u1tJ4a/TALA92DzWldSzDlQ0aAUIJzD9nHSP2Z72ceyGQyfGBgb0SysjuTt+/pcoRBeo6Xj5knjkEpajW3te8VrlwoWjB7yktWJB9re7VjLDsLPidm4yndNh29GxRhSgnBWJtDuEtponNpQTmu2Rs10bih0YhYl+jyuco12E2fT8E8EIb2HR1y2LIQKbh0A07ZBkDZzEXOzF18hU4nxyV2kILAzT9kmcUMFSkV5Gzvmyll3gROZlHpUbvfNb9vNH0hpPAq/by1NWnvQFqiLDrG1uLa+KFiIRUng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eglypVeWj/STX40e9XgLNeskRNpKZedRVTsbxhAASAg=;
 b=QjAiqErG/Ray53royU+2FkRL0kDZu4MtsNMKMN4EP7c/MjuUk9uMsNfy7cL4YYbR6it9pMAvg0GC5GcA5p2k5+wZqDF6tkzL1gveZxoHuwt+rQ5R9PllcK2a92i0MfCYqHdj4SxMMEpc9Bj/5LRajr27r2dCqHyBh4/8Jgc+CCZMKq4UJxbl4ErjaOgMJDsfo4lCzaOOYM4fwWAbpbaXT7FPQgWBSt3VB2YmlksOdoB3cuTMVCUckPLaMtmtCVPXovLzUGuaUGD3nqbJ5/mD7dn6czUXGHdvNhijvlnCf3tV0Sdmr0m65aKS3nUmV+6vQRz1AwYpLJq9tj76sPVKIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MN2PR11MB4631.namprd11.prod.outlook.com (2603:10b6:208:262::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 19:25:08 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 19:25:08 +0000
Date: Mon, 4 Nov 2024 11:25:06 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/perf_pmu: Migrate to unbind + unload
Message-ID: <ZykfkqmVRApXn/w2@orsosgc001>
References: <20241023050502.3049664-1-lucas.demarchi@intel.com>
 <20241023050502.3049664-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241023050502.3049664-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0108.namprd03.prod.outlook.com
 (2603:10b6:303:b7::23) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MN2PR11MB4631:EE_
X-MS-Office365-Filtering-Correlation-Id: b2c8f006-bf0f-4838-22fe-08dcfd0664fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NERnQWI5cG1ENWladjNFaytWeXU0M2hqdisvdTVuUlB1SVR0SnBGdGtYdjRZ?=
 =?utf-8?B?c01sQ0NvTDNRTm4zaWZ1SWFzR0ZPRmJ1ZVVnN2tiMFNSZlNBQUZOOVN0LzBS?=
 =?utf-8?B?K3h2UkVLSUZuSGNMVkt5dERIU0liSjdkUjRVWDFwenFOTmJ5aHYyN1d1eUhE?=
 =?utf-8?B?TUpJQkF0Qnk3MDVjcURjTGlMbmFVWTJTbDhzb3pDMUNaRGJMemd5VUZnbDJr?=
 =?utf-8?B?ak5oU3A3QTY3WVA5NjNmb3hNODRSYjFZZ0lIaDhZUTIvV1NqVkNRYWdjcEEx?=
 =?utf-8?B?dmQ1bHRhYUI4UkNKLzZMZlJaa0NUclUxMkF4ZzNSRGE1V0Q4c2s0WVZqNW5F?=
 =?utf-8?B?Y3JzYTNkRDRPSCtiTzlQcFZ1WkVwQURvb1M2cVA5aFFhbzN4eGNtT1ZZbS8x?=
 =?utf-8?B?Vk1rc2xGVklzRklNcjJyNDhLYmlvZ2w5M09EdWNzejhQMXlqRGE5d2REWDAy?=
 =?utf-8?B?VTJxdVhrTDgzMGxWYlkrSVlsRVQ5YWVkUXYxQVNhZUt1d250a0hSRlBldGJQ?=
 =?utf-8?B?QTNtbGNOamdpWk05TW91blQ2aWtPeC9CUVhWR0JkS3M4ZnEyRHhIeStyZ3pt?=
 =?utf-8?B?SW5TTk5vVnEzWWk2cDh2YTdHU2FTby9rQ0V0VlNDOFZsbkw4YTlVd3JYaEFz?=
 =?utf-8?B?Sm03aG5nTWJMK2FXek9CMVNPWVc3cGcySVVlLzJ1VDh5SnNuQlFRQWtCbE9K?=
 =?utf-8?B?K3R2aVNnUjMvOHh5Q0xYSW4yZGczYnZ2YWFCWi84NXU3RGZJQkhLSFgxV0cz?=
 =?utf-8?B?VDkwOEtyRnF2WDMwYXYrVFcvd2xZWVB4cGZQQy9IUm9TR3U2T05FUEVGenph?=
 =?utf-8?B?eWt3MmY1am1yV1VxL3pUNkQxTmlMZzMvUFRieUZQTGJWeTYzNFhGdktOQml6?=
 =?utf-8?B?ZFVRMnV1ZmtTVjduNDFqZXZXVTVzVTdVdXZCNWl3YVNrOXRWSWtyTElSVUM2?=
 =?utf-8?B?UGtBL0s2bUZKT3ZTd1N3MzFOeFlFaHF1SmR5Mm50dk42NFprZllJbUxwa1Qv?=
 =?utf-8?B?YzNERDZ0MEFJSlUyZlVmdHNoZkgvN2UxLzZNRjBPZEJPQ3I1ZTJlRGRUaEVh?=
 =?utf-8?B?N1R0Z2xoL3lSakxYQ1BZQ2FZODhqMndCaFFxdXVIVC9UWEhZZXExcUNBaUxP?=
 =?utf-8?B?VW8rNldWYVVFQjRiMWU5OHRXa0E0ZjVCcDVDODNNSWlKRjF1aEdORnpzRzRu?=
 =?utf-8?B?T1NyYnBVdDUxaERFYmp6R2NZTXdPVDR3OUhlVEtjRUxOUWdyK0NFVjAyY0py?=
 =?utf-8?B?YnR4Qm9vL3hyWTFpMFJUU1JReVd3TnFyam1vUEEwNmVSd1JabXVzZkF6T2No?=
 =?utf-8?B?RGFsb25oTUo4UnNtYVYvMGN2Z2dSc1U4bFQ4aG9kNndkb2Qwc1V2UkN0Q0JW?=
 =?utf-8?B?MlFsSjN0a2ZYakg1Nnc3WXdBbGhzcEZmWTlvTmZKc2tidmJiYUNBMTZ0a28z?=
 =?utf-8?B?MTZKT1RiWU8yRkczaDBScXNWUDJoWG1yMkVJai9LUUZMQUxkaktvaEZLcmtv?=
 =?utf-8?B?dG5HUW1TQ2w3WkFVVWUwYXhJaEVHamlMUmNGTC9DVzZBK2cyOHY5am1KSytG?=
 =?utf-8?B?bGhjU0dvTmREYS8wT0ozUjZLMXhaNzdTOXpNbFRtMjFmRGpVcmpBOTdwNGxi?=
 =?utf-8?B?ZXV6SzltcEp2eTFJL3orUkR4YTlyZGFHZ2pHZXgrUVVqWHZDU2NOdW1VMTVG?=
 =?utf-8?B?Vlh2R2ZFTVV6WnZQVm1nLzNBaDl6Szg3c1RtT2VhTGQyZ0pvNVdzL2gxMzFF?=
 =?utf-8?Q?lwb50XrMaidh0Rqbxrf5wWWfofj0DGTyb/ISYJZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z253Ym1GYjI1V2hwRlIxL3BMOThLNmI2cnh3Z2dsdXhKSWdrSXFCM0NVNXY2?=
 =?utf-8?B?MUIyMklOdk9mbytkOUlZVWtHUkEvS1ZBbGJsTUZld1NNVkN1bW1ZYnA2Vk14?=
 =?utf-8?B?emFPOUJpU0tQblBsK1c4WEEvb3A5V2ZYWHVIYnJ4U1BpeC9tWGFlNmFjOFZX?=
 =?utf-8?B?M1JxNDJYckUvUFpGR1dWTHpONXczekpndDhGZEROSlR1M2wwMHVGMjZVSEdM?=
 =?utf-8?B?eitTcW03MjJQN1A3ZmhMUm1iUGJveHo2cFBCM3BmRklXNkdiSnlJa0pyNlZS?=
 =?utf-8?B?MDQwZm93QzRKVjM5WXdJOHBiUnpYNCt1dW9kaWEzang1ZHpFa2xzamZVK1l3?=
 =?utf-8?B?V2xOUWpTeFN5ck5zTmJUVDBPblU1Q0NHRTVVa2lMNWs5dmFrNVUzWEhtbkdr?=
 =?utf-8?B?dWZTT0pKWFNPL1p2eklyOWQyRjU4N21FUTZ1RllHTTdVbjVDNDBBMUxFL2Vh?=
 =?utf-8?B?Mmo5WUJOaEFkdHgzbWNsY2pWYzdkRXZzWjRWb2VQZ1k3U21vc2ZqUW8zZFBo?=
 =?utf-8?B?T0dvRy9scXJZdTI1Z1NkVkNXeE9ueURZdVpRamZQZ3pVdW45cmFoZGZ5NWpm?=
 =?utf-8?B?RU9UL3M0cHNqcndBNndZbWxsN0JUYXFZQTlvVGJFMG9tQXVPdXdaRVNxU2RF?=
 =?utf-8?B?TDBCSThhNmRXVVJOaElxdHBnUjluVzgwSmRFZWxtTjJNSVVXMmpMWGRFN0Rx?=
 =?utf-8?B?Z093QkIydmNwQTl0UW1BZGxiZnZyUjMwbTZwTTF1VjFFZG0vR25td3RtRlMv?=
 =?utf-8?B?K2ROaHlzVGRQVlcxWnFxUEEwcWw2T3RsbFk0N1R3d3ZzNnlwN1UrbDJXbE83?=
 =?utf-8?B?WWxTR1JOZXEzNnpIcHpidlQwN284dm1wOVBJWXJQMy90QmQ1dFhOUkJ0OE14?=
 =?utf-8?B?ZEZkb3dwSFY3WUNWOTRpb1pZQlg5WGVQSVVJakJSR0IrZmVIM21xVlFCUno3?=
 =?utf-8?B?cG80d1VUN3JBSkdQVDBOdzRTS1dRZTFOU2R5WWZScUtYcU8xRUJBWE1pbFFD?=
 =?utf-8?B?K28zeXFDbDBVbE0vUm0zQUhzOCt0TGRRQzd1bGxlQkhPek9CbXdMNWdacnhR?=
 =?utf-8?B?VW52dDlueGVKa1gzNjVjOXcxWWpEb0pjNDAzTzQyclk3SWQrVDZvNTgrSE1i?=
 =?utf-8?B?ZEFVSDRYaVE3VEpZNXJ2WGhYR1g5WFhDRUhtNndqaU4xQXZoZUJyMEJ6Mzlj?=
 =?utf-8?B?NW8vWWlXQ3dObVBzd1lXOE5vZ1lwZU9NMkdIbGdFR2FqRGJ1SlpMNDBZMUg3?=
 =?utf-8?B?eGxITzRRYXJHeGoxKzVoUW9CV3FqRzJTN29FTWovRFljblo3NlNoRUF3YUUz?=
 =?utf-8?B?U1pHVHU1NXRmY3EzVGJuUVdKelNIVllMTk1oUFlxb09yRWpkVU5FV3lSM0ph?=
 =?utf-8?B?OXlReE5nVXVEM1JQVER4eUh6MkxnbVZWR0dxa1lLeStyVEIvUE1ac0FKeElp?=
 =?utf-8?B?MDVVYUNWZEhMS2xiQm1kdXNmZ1JreEdpMk50cmZnR3ZRQXVEMk1KUExqVEFh?=
 =?utf-8?B?cGhYUjRLR2NqcnB1YXVtSk1IMGFpMy9QQnphamZOaGhWSjZFWlB6ZlJYQlV3?=
 =?utf-8?B?V2RVZng0WWpHYnJjSk9vT0t3S1QwVmlBT09Sd0pmME5wRnNPUnRSRHp6T1pR?=
 =?utf-8?B?NlJ2b2pUc1A2b0EvTVlYNnVScFo3OHNmNTRmSklYZnlhbWtTMTA3VGwzeUFW?=
 =?utf-8?B?dElMR2JITERRYXJEOXkyMjZ2SE5PZTZmSWVvakI1RGdXUXYwR2VyR29PZVlh?=
 =?utf-8?B?cmlJNEFDQ1hIQjhzMU42bFRBeHVGYXZGZEwzMWx4MFpaK1NGZFBlY2pZY3k3?=
 =?utf-8?B?UGh6VGg3c3Zob2dCSjFmR3N2SUYzTXB4TlFHRWtEQkJWM3kxU0t2SzBOODBq?=
 =?utf-8?B?KzA0REdLWkZ1RkJkb2hBUXZZZG5WblNQTDlXVVFVYUY5NWRTY0NaWTVidWlE?=
 =?utf-8?B?TW1RT2NUL1dTVTVsa3JVdElHMzUyM3ZGTUJhbHBiV08vemJReDFsaTF2YkZm?=
 =?utf-8?B?YmxxcWxsTGdiVWgvK1c4WDdtM1c3Q1VDMXo3TGZJd3BpRjJpWTRsVlVRR093?=
 =?utf-8?B?amVVRFgwNlRnQWcveEZicWpJd04rRXAyUnUwNWx3VmxGN0d3N0p0N1Fhd0pC?=
 =?utf-8?B?M1B4MGVkRURYTTRxRU5RSXMyd3dqa3BGOEZuckd1OTRPZWRJMVZ2S3JqYXV4?=
 =?utf-8?Q?cqSjLdDHLnNq/3TImbwe6T4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c8f006-bf0f-4838-22fe-08dcfd0664fb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 19:25:08.6853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIERuJ/uto3ZFPlxxKT2mwXk+EGjUg2JdPp5Xn5f10+rd0b026O4aPs63Rz+Bw5IRGVLNoREgSxRMBlCLfYkWwbQW4C0qzYpzw5y3nDgUr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4631
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

On Tue, Oct 22, 2024 at 10:05:02PM -0700, Lucas De Marchi wrote:
>There isn't much point in testing we can't remove the module directly
>after removing *some* known dependencies. The point in this test is to
>make sure that if the HW vanishes, driver still behaves. That is
>currently not true, as it will cause perf to explode.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> tests/intel/perf_pmu.c | 22 ++++++++++++----------
> 1 file changed, 12 insertions(+), 10 deletions(-)
>
>diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
>index bfa2d501a..6eb4f09d1 100644
>--- a/tests/intel/perf_pmu.c
>+++ b/tests/intel/perf_pmu.c
>@@ -2282,7 +2282,6 @@ static void test_unload(unsigned int num_engines)
> 		int fd[4 + num_engines * 3], i;
> 		uint64_t *buf;
> 		int count = 0, ret;
>-		char *who = NULL;
> 		int i915;
>
> 		i915 = __drm_open_driver(DRIVER_INTEL);
>@@ -2337,23 +2336,26 @@ static void test_unload(unsigned int num_engines)
>
> 		igt_debug("Read %d events from perf and trial unload\n", count);
> 		pmu_read_multi(fd[0], count, buf);
>-		ret = __igt_i915_driver_unload(&who);
>-		igt_debug("__igt_i915_driver_unload: ret %d who %s\n", ret, who);
>-		igt_assert(ret != 0 && !strcmp(who, "i915"));
>-		free(who);
>-		pmu_read_multi(fd[0], count, buf);
>
>-		igt_debug("Close perf\n");
>+		/*
>+		 * We can't unload the module with perf event registered, but
>+		 * we can make the HW go away by unbinding it from the driver.
>+		 */
>+		ret = igt_kmod_unbind("i915");
>+		igt_assert_eq(ret, 0);
>
>+		igt_debug("Close perf\n");
> 		for (i = 0; i < count; i++)
> 			close(fd[i]);
>
>+		igt_debug("Final unload\n");
>+		/* After perf is closed, we should be able to remove the module */
>+		ret = igt_i915_driver_unload();
>+		igt_assert_eq(ret, 0);
>+
> 		free(buf);
> 	}
> 	igt_waitchildren();
>-
>-	igt_debug("Final unload\n");
>-	igt_assert_eq(__igt_i915_driver_unload(NULL), 0);
> }
>
> static void pmu_read(int i915)
>-- 
>2.47.0
>
