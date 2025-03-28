Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F19BC36010
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 08:10:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F3310E99E;
	Fri, 28 Mar 2025 08:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="arIfOJFW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC3510E9A0
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 08:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743149446; x=1774685446;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZkdHsqIH6ffcc1x4sZFjeCHbugEIjl/Y1Vs2jjMtfGU=;
 b=arIfOJFWbRzuq/U8Jwd0VAWMwMawyaWbgtGIZHVAKudAeAgn5zzGB74B
 fM8DgbJGZX+I7IIlbpIZ0CqXKlB/57XZ7BX+VxUAQvOLuQCbQDLiBaylK
 deyELHFd6OI59TYPGEIzIT3S/MpMwMnZPEuLxPdwKenC8l4MEUTq8RAxe
 /4qwPC7NnEdvUdhAon72xoFZ/mIFK3mMYmGTKRgQxHCNogoUyIXbbKvl1
 rzxmAqqWNs1xFTUlnbV7yA8VKheNg4NzKVnN7nizkbckZVlMyEjVQUPvx
 ZD8hyUAZwaFoKXS0d6RjEaW7c/syb0TQicKjA+I9NGsovAUrk9bbtnWEG Q==;
X-CSE-ConnectionGUID: lDFOEhWTSLCKug2J99iQ0A==
X-CSE-MsgGUID: CIEitlXfSweYYkbXEMSNiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="69868719"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="69868719"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 01:10:45 -0700
X-CSE-ConnectionGUID: KwJv4GKFRMukt8tYb3s7YA==
X-CSE-MsgGUID: bUfha7chT9uG1cCo9tu03w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="156316425"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 01:10:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Mar 2025 01:10:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 01:10:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 01:10:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWcLfo5QfPNCKu7HX+bo6sgE35R7wRG9MN00/37XxchZZyTYOAXsfXXgFjQoDyLiJE37PeNLgZhfCuL5KizR2JTX9C/WB5l281p+J5JqIeOi6ol3AvIIpsniad/kX7eeQ+kMhbikAXB4spno5oPtUqpCXRayYNZuoZy5dHfonp2uEbjRqVLkEy+XhYc8wxNlbqdf2enoh0CQmGpElDLvsT3adLA3DFahEZ8DZzJY2OET3AzwLgoVn+eN8QZCVgiZMdloL7qYunpLCBmw9l3hYzZAgbBD42ID1Fj6UBU/BFixNC9Ma7w0AAznfA7IhVb8vL3tugeLF+eHFSPHfaZIqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfRPh7eUAXheaE4PIvXU4jcaoAtlBEcJhjgGn5ZUc0U=;
 b=ldwYnRHsK5ngHLonkmDKQrj3TxNLlXQnldMDbJKEsKqphpYIgQgEGk/WfiILhZ0d6hzFmvmcVx2rZdweqMYMDp5wZdchcXW2hiOSww2ZXWSUYYS4B6YnaC18FVrAQWUiqrLAPStSYt2/vJfktfu02UxmI79fCfXak1UAIhu2rFbEtgOUI0cRadlvn7wZxumzBJN+EAlHGiAmOZAyvlOnGRAwgVuZwDOtRzLUfHv/MYMX900Up9UvLhmm23+usU9Vy+b+wh8rfHOeOSTqe3L5RBeT8rg57eVQhUipicwdm4mEAJkmXzaajOM+6OOZAtMJMHxcOhb46Sj0XLYuQy+M5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by MN2PR11MB4679.namprd11.prod.outlook.com (2603:10b6:208:26b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.45; Fri, 28 Mar
 2025 08:10:37 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 08:10:37 +0000
Message-ID: <fd8ecf80-b08d-4232-bc30-86ab42748601@intel.com>
Date: Fri, 28 Mar 2025 13:40:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_display_modes: Move
 intel_pipe_output_combo_valid before igt_output_set_pipe
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250328062958.1500649-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250328062958.1500649-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::18) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|MN2PR11MB4679:EE_
X-MS-Office365-Filtering-Correlation-Id: 5faec1f6-1a06-4744-beca-08dd6dd0058a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEFKV2NCeWxBZlhzYXhWOXhjbEpXK1liQjZnTjBPSUNrcnZ3WU5RZ0hwUDVq?=
 =?utf-8?B?Yzh3YlI0T0l5dmZkZ3JOV1FWVE9EajNHL3JmQk9JWmZiMHJFWDFON3dUTGlQ?=
 =?utf-8?B?Y2NUd01OV2lXa0lONEpSbE1RREkybEpXQUF4SVVjclQrN1VGUUJ1WEZGbjhQ?=
 =?utf-8?B?T1Vlc1RUU3ppOERXcGxjbXhEWklGcjBraFRwNWg1NzRvRnBUR2w2eDZ4Z1Vx?=
 =?utf-8?B?V1g0MkwvanVUTmV4Rnc1K2lJZ3B3SFVXN1pUWGRrOE9CeC9sV3JlZFpNTm5t?=
 =?utf-8?B?Yng4ZjBMUVpaRlJWSWt2WEFnWUlnQnFCZzUxOVIvWENDUVpaaWh4aDZaaWNQ?=
 =?utf-8?B?UzhGbGRnK3p6ZlJFZlBCTEZLNktXakZGYVRwL0lFOFJSWjVrblJjZ1VvT1dt?=
 =?utf-8?B?UXhjOXVJOUpxcXl5cWVnTk15aWliVGJoeTllVmtyQTRPK1VHeEdPK21HQW9F?=
 =?utf-8?B?R0h0MzBZRFAwYnorSXlpY3N1YUdBVlFWM0pFMk1JT1BqOVNzdmFQRHVtdUND?=
 =?utf-8?B?Q0w5bTl1Mkl6b0NIazlJd2VXUEtSdC8wZ2swazB4a3prcm9remFmR1dkODlI?=
 =?utf-8?B?emtYaHZMT1JEN0c1UzBQMjRKT2hhM3hWNHpDb1oxdmR3UDBuQk5mZU8vUkxw?=
 =?utf-8?B?cVJ2TUV2NTZLK05uUW9ub0RycE1SNWhOZTZMa1hjWVh2VlpMRmpYcjhVaWtI?=
 =?utf-8?B?SGhaZnBkb05rbmFVK1FMRTluNTR2Yno0VHNHYXRxZGsrdFovLyt1Yng4YnZS?=
 =?utf-8?B?b3JuU3VSb0UwWGEvREJhOHo5THBYaVFjNWlubE1KellKV2lIaWNmQlVMbXZC?=
 =?utf-8?B?OXZPZmdKOUYzcDhRdG1XcEp5LzZQdExQcXpnalJ3enEwUG5DbVQxRGtRSDJT?=
 =?utf-8?B?ZElQWGtKcVdydDByTDNiRWNDWTRHZ3lVeDJpa3dsQ25TNUZNVmJtNWF5U01H?=
 =?utf-8?B?MkE4cDI3dzUrcDJ5U3o1NGMxNnJjeEpxY2lUYkhXZzlwdDhiQUxaVXhIRDBT?=
 =?utf-8?B?YXdkKzk4WnpvWlAwUXBkNWk5c3BjV1pKMDZVNW9wbXZSL3VLNGJyZVA4MGVr?=
 =?utf-8?B?MTJzVlpoTnVyUlIvdWsyRFlxTlhoNktFNkhzbFdqYUtWUmExUm9OTzlLTjBw?=
 =?utf-8?B?NUtaZzJzVTZRMElyR3lhTUNJOENFRDlFNVQ2L21jMHJTc2tvQWdzcUVUaXhL?=
 =?utf-8?B?alp6U09WeVVZYVRRZStBYk5iYXN2L3J3YU93VXZsbkdraDhKYzdWdWtJVk5p?=
 =?utf-8?B?cHU2KzdHSHJQM0FEY3VPd2dBcDZJVVFWbUZJL21xcWM5SnNHVUxHaDdGNXJK?=
 =?utf-8?B?K01GL29qMEYzTkJkUlNGWHJHelBwV3Q5VEtLaE02cHJ0MEx3cmhmalh6S0J2?=
 =?utf-8?B?RVNRTWt6ZFRLRFlta0Z5eDNocFNMOSs4Z3h1ejh3akVhajFkUUQxd01wVyt5?=
 =?utf-8?B?RzB6ZW1jL1hpZ1dEMFNpZ0thT0U0L3cvVFZxQnE3R3plUnlHVkpLV0ZFdW5t?=
 =?utf-8?B?by9hVWJ2RXdoN0VQWHZiOWo4TWdkZFhKeW1vZ2VMOXByWVQyRElhSGxkUysy?=
 =?utf-8?B?VEdCWlVKL0ZEUEY4OGhmK0FudW4zaWRoOWRZNHNKTEttNEplNWtOa2phY05D?=
 =?utf-8?B?Vi9SOG4yV2owNHF1UksvUlAxaHBodFp4UStJWE9pSnByZWdaQ05WbmRUczFH?=
 =?utf-8?B?UE1rQ1dkTWE0VHRQdEttOEl6emxSUlJMQjlNVkMxVElFZVVJYVo4enphT2pV?=
 =?utf-8?B?MFRtaFRmcDM4OXhPZkdKTGU0dWlrd1MwRVRjNXozZWo0bkRYaGdtVFBLby9C?=
 =?utf-8?B?UFRFc1AvelFEN3Z4eDFYZytDbzdGbjVyUEtMSnBUMGZqNGpRU3c1Y2MyZGtv?=
 =?utf-8?Q?ls2MeLOWIrfmZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czlCT2JEMjNSb2ZHb0I4YWo2RXZYTkgzQnJDOWVHZDJ5WURUeXdrTitYUzcy?=
 =?utf-8?B?L1hXL2pFclRYR1VkZndQRjQ0OWQ0WHNRb0FkM1R1T0hRSTFFN2YwZ0F0OWJp?=
 =?utf-8?B?S21uV3M5dU8xaXh4OVNjb2trNjltSVJ5MjY5a3BzZmx5SzA2a2pWRDYwd3VO?=
 =?utf-8?B?aUxQRGZWeFphTkJ6ZzdrU1RXcUNDR1ZyTzlsS2tham5ubm8zWVQ0SkNoYzUw?=
 =?utf-8?B?UUlidWljQTFpcmxsUFFvOTJOSXcyditBck5DTVRsS3JXNjYvb01vZVlnNktn?=
 =?utf-8?B?SnYwazZuWmNrUDlYQjRXa0J3bXJWWmp2SUdzODJFL0NDQlF0djBVSjhXQTVx?=
 =?utf-8?B?TTBPTXF3Yjd5aDFGVVZSKzJmQnJHb3MzM1kwQWJxMXNtVmlnSjRsYTFSTHFP?=
 =?utf-8?B?Uyt3UGtkMWlIYXVPNFFuSmR4K1NNS3FpUWZEWVFvK1QzWVNhYVR1S20yQkho?=
 =?utf-8?B?VVdlejQ4bTRVQWdUWFBTd3VWUzRTY2NPVXdhR1JuamNUNFkzR0JzMlZJS0sw?=
 =?utf-8?B?MmhSdjQyYkhJbDQrVUtZS2o2UHkyWlJpZzJIQitRVllpTC9zQ3B6M0pUZ2Ra?=
 =?utf-8?B?OStSelhTWS9GZHMrRjMwQkVPcnJ0NzJUcDFVRlVCYXp3eE1NM3dHdWlIbU9W?=
 =?utf-8?B?TVU3UkJONnJ0c2JCUmczYmR4aCtxWi92UzRWajZXNGFFNUtOcjlvRG9xT2pt?=
 =?utf-8?B?d2doaEkxUnRqK1ltaUg5U2kyaERtbFZod2IzVTlpWEJMYXlDUHRpY2dUakFP?=
 =?utf-8?B?VnNCQUE0d3M4OWFTTDN3MndpeW9HcTVoTTBBQ3RhZ2pPUndUeWRqYlJSNldx?=
 =?utf-8?B?Tm5Xby9hQUh6VkRydmZXYVR1ZGlCcnN3QkFhcHlMZ1NpWG1EWFVEcEh2VVZO?=
 =?utf-8?B?QlV5VlZwUXZ4TVhYY2lUdlBDSDlFU084NWZSQmMrYWZlRDBhQTVOVWwzMFNv?=
 =?utf-8?B?ZTNiMGVLQmc2VWIybkhkOUpuS29tc2w4cURTbzh3bis2VjRlUTNzWVdTRnRG?=
 =?utf-8?B?TmtjcGdvZDFrbWxZVnZ2VG1KTitUeU91L1hVSTJ0M09sS3R6YmhaR0xxOWF4?=
 =?utf-8?B?YTZmVXpRMG42dVBka1dHL2IvUE04MStkUHJxK2pSR1VRNGk4cGlzdjh0cUN3?=
 =?utf-8?B?V0gxZEQ1YUU4M1lKMUxxTXhzYzlKQ09TMkJydUx3ZEpQeHRBMWZkY05MblZZ?=
 =?utf-8?B?ajAza2pHNUlQTXk1NTE3ZkZvMTE2OWk3ekRIa0UvVkF1bUZyRGZodVdtS0tR?=
 =?utf-8?B?OSttWDBHeUFtbzBOSnd4Y1RXbExiN293eFZaaUE1WEFMb1JQUXlmQnlqZXdo?=
 =?utf-8?B?aTVQMGdVejZmVW5HQWN6TkpvSXQ3N0NCanFHWnFXRXpqWFRMYlVjbi9lTmZL?=
 =?utf-8?B?a1paL3BDSXM1a01id0FZdnRNNi9jYzI3ck1UcE1IbnN5VVpvQUk0enB4Ym9a?=
 =?utf-8?B?Snd1WmNtdElTZkt0YTM3UUF6UTVqbkFOaUQ3NE11TDdNam9OUCtndjcrZG1J?=
 =?utf-8?B?Uk5Wa2IrSG5TcG1wdENlUzNxS3VGTEhmUi9QZnViSnYxYnFjNzlXQkpPanFN?=
 =?utf-8?B?eGlGSStXejE1Zkg3UzlmanJxY3VoTkV1MEYrd2x1K2NseThMQnJoRFN1Um8z?=
 =?utf-8?B?NitjSS80dFJaQ2w2b0V0a014aHdlVDYwWU5hSVlrd2VJTFhNZ21wYnJUQTZX?=
 =?utf-8?B?ZnNPU09JVkdObHdYczlSa0JMQ1ZFQUJQYVlDZWZaeGJJaHp6MU1sVG12bXdI?=
 =?utf-8?B?Z0tUSllSKzFZeDlpL01OZ3UzZmhTM1BTNjlvcWlhMTZMVGIvOGpuRDNVWkFq?=
 =?utf-8?B?MHEvL1FtcVo4eUt6VzVSNEkzTk9raUVScU9tay9rMTB6d3JMTVVSVlFTWkxw?=
 =?utf-8?B?ZDdicWxyN3JjdVB4MnJ6QlRaQmZwMlhnSTBtQU0weE1JODJRcFgzS1JTbXBS?=
 =?utf-8?B?MlZYK3FEdnpCWEplbGFUcHhaeDBYWHRiWXI0bFVKbDd3QnUzNURyTUxJOHpZ?=
 =?utf-8?B?TnRoc2lST2FaRWVha1hqazFNSkpFNzA0dXhnaFNmRGpFVTlmQzZOSmlJME10?=
 =?utf-8?B?bWJlR0tyM2tibUlrc2UreGFCQjhkSDBva2dyS2VINHg3VFlxN0F2eEQyNFFU?=
 =?utf-8?B?dlViN3dLdE1XaDRqVXVHbmF0aEE0Z2tiTmRlRmw4ZmZlYjJlUHhjMWVxVC8w?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5faec1f6-1a06-4744-beca-08dd6dd0058a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 08:10:37.3365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MDmki5OX83vCWxQ4hpLuRWS8Selg+LtbyE4C7Xb7N9UQL7bdQrwFnHWHRPme77fCMt8HiW2jG4Ejuh+c00hLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4679
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

Hi Jeevan,

On 28-03-2025 11:59 am, Jeevan B wrote:
> Having this check after igt_output_set_pipe causes a commit failure,
> so we need to check intel_pipe_output_combo_valid before setting pipe.
We need to set_pipe() first and then check intel_pipe_output_combo_valid().
W/o setting pipe, we won't know if pipe/output combo is valid or not.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_display_modes.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index 588820170..3e388bb33 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -199,12 +199,12 @@ static void run_extendedmode_test(data_t *data) {
>   
>   					igt_display_reset(display);
>   
> -					igt_output_set_pipe(output1, pipe1);
> -					igt_output_set_pipe(output2, pipe2);
> -
>   					if (!intel_pipe_output_combo_valid(display))
>   						continue;
>   
> +					igt_output_set_pipe(output1, pipe1);
> +					igt_output_set_pipe(output2, pipe2);
> +
>   					igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
>   						      kmstest_pipe_name(pipe1),
>   						      igt_output_name(output1),

