Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283C2C83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 17:21:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D186C10E29C;
	Mon, 21 Jul 2025 17:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T9YtqDK6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F46D10E29C
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jul 2025 17:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753118463; x=1784654463;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ENhxtg0soHrwKpHYUwnsv9tA6tpB2JJwuaYXPBtoIs0=;
 b=T9YtqDK6fEa61yOccOdcVAFzwzh4WxNPWJNLda80XzO4z5VBuClBvhZ2
 H7lOddw/ank5sZbsYNDRJqSnSdma5H0DllIK8zaBL1s9I5bZekRiUsUcd
 HXaV+zmSR0zqPdROSACOGBbJG/OWGiPzYnGpPiXxn+GzTIvDsXFrxe5TV
 QOkCXOEG/ajanw5TrVm/7jQVkbQmjhVLsFKpSN818PiFQVj2DJOzSYsSd
 mnAdSFl7u3KwTbavGysLKL7OaXl14l60bt7fMp1xdZfBeDvjVQxT3xK4N
 KvPgY982eqKpahOAYHl0xpfhVnoMEFro9dHw9u8TmAMSqQdMkFlEzFtJF w==;
X-CSE-ConnectionGUID: n4+j3rhNRPqHU87P5BApYQ==
X-CSE-MsgGUID: HYkoeQU2S5+2GamBXmi7Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55299454"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="55299454"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 10:21:02 -0700
X-CSE-ConnectionGUID: j+ANgnjnQUKTWVb2N3Kbpw==
X-CSE-MsgGUID: eGGIvcU+QQS6DRspsngAmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="159312887"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 10:21:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 10:21:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 21 Jul 2025 10:21:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.65)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 10:20:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPvoyUrtICPMPsjrGFjXDAK1lrRUaWegMiRlxMW4ti8V1rcSMAtPtOASaxl1f9dS6s0QaF5cdFnVXzffb4otYexlxK6lypLvkrQo2rHy5n9nMKDECDZhyD5crssOCwOskJlCQml/Y3vwATGyjKq0B655EuL2mLN5vpYDvtUbBDsSlKcGiw7xh4pA2Cp8e74lKmNqX3yZBfp8K81zoIcU3Zra3vfAWGfuXbKYpBOxQaq0u8MAZBpfDM6SBWmSDjbbNMORhydybEYtXeQI7yqfkc6wpTVBye/lOPD1MgX5heAvpdHfUMBswvTynaZ7PKOEIXXqYlPkNyz80MfP30Nc/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJrw/50jjxLLT/4Fi0/vNaF+182MdCpCjMtzR7t/eT8=;
 b=QtkxuWTaqPkZg8rrsu8T5xzt4NP5Zz39iI3DIsu1MpaxYJbOlG2OOHj9AxMZRBug7KGt9/20YE6qyls8QlZ/bv2VON9egkylLOVtbgoFjp/dfGNtoC7k1QlYLrb+DUPDSK7QMOtRHbgx8CWWN1ml/v7DkMF94H/EeWEjcfwxFsyGg7K3xpcVs04+4lsCyQIij0uFZUWIrjI45TJaelfCBp2FnB1nCxSfKEp9b8T9PYPq3tnVgC3JV5k27T5Lv4/JJWrXmcGJjVZvsLaZGhdIKXyX9WmVquSpEns/TiqjkEMoDgXv1fL46L6n4AybyjObdNqdhjH1NqZzGnQquqabmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SJ0PR11MB4974.namprd11.prod.outlook.com (2603:10b6:a03:2d6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 17:20:43 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 17:20:43 +0000
Message-ID: <d9a94bb7-767b-403a-b89f-e3c4c2ce7e02@intel.com>
Date: Mon, 21 Jul 2025 22:50:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_plane_alpha_blend: Reduce test complexity
 for simulation
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <sameer.lattannavar@intel.com>
References: <20250719170838.1340070-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250719170838.1340070-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::14) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SJ0PR11MB4974:EE_
X-MS-Office365-Filtering-Correlation-Id: bd7082bd-cbb7-4275-4d88-08ddc87aec50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1JycldibjFhUXkvL09Yb0JCcUtQWHVQcVc5U3lDQWJjWGV6eURCTW5YWmpy?=
 =?utf-8?B?ZlpKdFdBOWNBbTE0eEh0aGRLWHN4SkFSTVpiVE5aekJ4amFxMUtsdjhJQi9r?=
 =?utf-8?B?aDV6QmRCYXFwZU50UDdRNlFUSTAvbmdnRzFzNkI1K2V5b29FSG5TRVhWRFV2?=
 =?utf-8?B?VlJWM21TU2REQ2JPL3UvUmFiSysyNzVRR3pFZ0huR2drYVVxd010S0FMTUE4?=
 =?utf-8?B?a01rWFFYM2ZvUWc5QkZrR0hUMktsakZkeVY4WUhDRUlmWjFBMVhMa2JmV0JX?=
 =?utf-8?B?WkxJVHNQaTVLVEdKYzJtSnFtVUo2L0lLcWJIN25FcC95WmFLTWo1ai8zRDB2?=
 =?utf-8?B?REc0V2VYak9JWWVUN09PMXhZS1AySC9rN0cyemVvd2w0V0NUM29sV0pnWlNa?=
 =?utf-8?B?T3I5YTVLeThtMnk3K2xmTTJBS0RyL0lORjFVYWN4MEZZMjBBeGNPRHhJNVJv?=
 =?utf-8?B?TVhHTnk1bUJJd1BKUkhMY0p6andBeGNQNitSaVJyNjNCcmlIbGVjRkZtcHly?=
 =?utf-8?B?UE0vdnNDSG9ZNlBpRU1kekJIY2lxcnViOVJIZEtabGY3U2RTQWRPdDJVMXVM?=
 =?utf-8?B?YThUdXJBTXZvS2M3dURTdTY4WHg0dG15NW9jZVQrcUQyNjdQbWxPbExDRy9Q?=
 =?utf-8?B?TXBUeGxOYnd3Ym13cXhyOHJwNm5MS1NQUS9lbkt3YzJlZkFvbmN0d2pWYWhW?=
 =?utf-8?B?ajdZOHlNam56UlNHK1B2Zk5wbmFKYk9wV2pBUVQ1bjNzc1JtUk5GUVkrcEMz?=
 =?utf-8?B?MEFhVkN1cnJRRHNaUlBGaEpGNVY4UHJFY0JwUXpFQzZQTGFVRmJ1OVNzSkZH?=
 =?utf-8?B?bzIya1BNd3FhVVFUNXhCVmFVc3R4L0t4bytlVnBmSGJmTTJFWjdGQTRhVklF?=
 =?utf-8?B?bU0yM1BabVI1MGRnQ1pybzkxV0pyT2pZMkdDWCtGSlM4VXF6MHZvSXdDaDJH?=
 =?utf-8?B?cnhzMk5uS2VsTUQya0NRK0xUaXl0N1NRdnpWQ0xEUXkxNURXeUtvKzE5VFFI?=
 =?utf-8?B?YzhDOWpEUk45a3c3c2g2T2VMbGJSVmNRYmV1aENPQ1NaZFozMGxzNDgvWHQw?=
 =?utf-8?B?bXVIcnhVbU1xSUlzZm9PbkluY0p1R1dtNUJyeTBzaHNmS3p0WldCMFhVdWtk?=
 =?utf-8?B?RVJPRENtT2tMUDdFcktKUlZRMU8xMXQ0Zk1JUmxlZktQOWY3NVpMcjlQOWt2?=
 =?utf-8?B?b09NVEJXSnlueWdGTDlTNEY5VUxDMkRZb01rQ3FSUFhCNFY1cFJvVERMNWh1?=
 =?utf-8?B?QlhWOHNoU3VMZ2RUR0JLZXhRNnNVeEVEa3AyTmxCWUJlNWtTL2kySHNzMm53?=
 =?utf-8?B?YzBEUi9QTDlQbUxNYjVENm1CSUUxUU5EMDhYSzM0TXFaUkdDd0c1SWpJZmtu?=
 =?utf-8?B?YWtkek9TalB0NU1ERVBJSlFVMThhVnE3MmY5VWFCd0JQZkdOek1WWjROS29T?=
 =?utf-8?B?U0o2Z01MOXo3a1RLdnpFOGE0eHVoVk1BRnpwcUR2bXNLZnBRYlVyS2F4Zld6?=
 =?utf-8?B?Z1A5M1ZRUnhvQjlDRE81N2daSUlnTlpnOGQwbldjVk0wYXQwakUzT05Ga3Vj?=
 =?utf-8?B?QndpUUtXNWt2T1VOVzRJYmRqNHVlcDlLYkZnU2ovblFua2FnU2dBNE1hMnNT?=
 =?utf-8?B?eDhrT1psTXVUbUZpbEQwVzg3SjFtQmJFVXdIbTR6Nm9FeWZFK0IwbHB3anVG?=
 =?utf-8?B?WnJ2eHJ5bVFoZlhWalRMbjlXRmU3N1A2aEg5UHloWUp5T2hGNDh5bmQ2b0Js?=
 =?utf-8?B?MlRnMk5JM0NMbkNPVDhMNUFYY0VlT0E1bHI3dUMvSEtUVHlWVG9BR0wxL3ZR?=
 =?utf-8?B?bytpbzRwV1ZYY2xuTmNuZnR6a0hjZ3RrcXNHL21wVzlTQU9kZE51a0RWNGpm?=
 =?utf-8?B?UllOZ29qVlQvUFBPaG9VQmRxWFpOeDluN0RPczB5WnBXOXV0dGl0NkovdzVa?=
 =?utf-8?Q?QALQqUSWNqg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME96WFdzbzZqZ0hpc3pmcVVhMFArSzAyazVYQzAyZy9hcUljY3k5UmVQeVhV?=
 =?utf-8?B?WFV5TXVnTWJXSmVlaitLdzFxSXNxWjVOSzFKRWdSTVlpMmdRZFNKcit3eXY2?=
 =?utf-8?B?bzdxUnpiVFhXdXIvU2dMeDBsSVdvNXRtV2tzcHpDeWZweVZJcXJaTjlCdmtu?=
 =?utf-8?B?endkVkRrMFd1R3VCbTZNbWZjWVY4TytacWxTTkJSc1ExenpsUFBlaEpSeldK?=
 =?utf-8?B?eWUwTUtTeVlTNVZPdW1JT3YxcXdKWU5QcitGOWZHZWJ2ckNiU0g1eHZ4WW14?=
 =?utf-8?B?SEZLVENyWlFobkRsOWd6T0xFWDJ6d25Eb3VWdElOTm4xaldoS1BPQTYxSDIr?=
 =?utf-8?B?ajZmTW8zYXhHaFl2cENQMnUwZzJHRHNsUXU2YXdCdllBaXdzL1VtbWVhUlpV?=
 =?utf-8?B?Njl0KzRxOHZIbndkODVncDNCNGF5Ujk1RllnYy9rRGkwM2dROS9NdW9oc1o4?=
 =?utf-8?B?dHBvSW1jYlA3S05rcURIUXVXaFZvK3Z1dXpUZVlBekUreWFJYVBpZFVSYnA2?=
 =?utf-8?B?d2ViZFlXV1BwbC9aTjI2WTluazVPOVZVbWhJSG4zSG9ZOW9LbFhXOTk1TzM0?=
 =?utf-8?B?eFlxUXorS2xVK3RjY1Z3cHZMdm9GTUU2SW9nSVRWTUZzWnp6M2wvZVdYam1y?=
 =?utf-8?B?ckRLZ1owWVRIYmZWUGxablhoNTZnbWIvUVNxQmlHV1Y3c3NwbjRGa205VHJ2?=
 =?utf-8?B?ZzVvV21PeVFLNVZQcVRMKzRGcEFhK1lwWTRCT0tSU2pZeWZ2NG5jWmVHNlVz?=
 =?utf-8?B?VjlKcFRGcjdYSjNQVTF5OW5BSHBUWTBLNk9mSUJsZk04dUY4aTlEa09SVmds?=
 =?utf-8?B?aGlNUVFZd21QN1dLUTV1d0VsOGdOSUt1SElpa2lwQ0swZjZIMExBc3RDRlUz?=
 =?utf-8?B?b0dTemZHMXFZdkxDdkZQaDROQVlkV0t3R3p2eGZXZ09lcjBsQkVJWFRTZ0xZ?=
 =?utf-8?B?RVlMY0dsZVJBZDlEWXNUbmJXYThJbG5iRUVjRW0zcFkxTW1XamNTbjhxOXVG?=
 =?utf-8?B?UmhNK29WRmg2d1YvY2JUQXhwenIvdjRiMHJHUnFkZzkvVkZWWnQzcHowRUR6?=
 =?utf-8?B?WnJFekY4NE95aE53ZDlJQ2NXdXZGNm9wR3F4QlAvM1dwS2htOUNQalUwQWxI?=
 =?utf-8?B?dHRwUVViMHBGMWswQ3B0WGRFcHJUVmptMzJhU1lEVldsNjYveFI0bFVlVEFQ?=
 =?utf-8?B?SGlDYXlWWXpOcTA1Mk9rcjhHNGhDZDlOaFFuZW1qZ2JoMFVtYXh4ZWhlN2Rh?=
 =?utf-8?B?QWRUdUppWThUYzJVR0ZaaTUzT0hSakFTV3N6NTBxdzFQTk91cWdYSHpIRmFq?=
 =?utf-8?B?ZTM3aE51OENyQllFWFlqSlp1Zjg2Z1dpeDd3a1JFV21UYzBWWW8zcVNaSXVN?=
 =?utf-8?B?R3MzbVc3aUZ5VnhTNlM3TUdONUJsaWRWajlla3lUSzVSVWJTK0xUSzNiNi9s?=
 =?utf-8?B?UGhPQmZGOHZQSEFJc0tiK2I2WXlLMHdkVnM0RC9hNGNhRHdrdGE4Tk0xajVx?=
 =?utf-8?B?V3RrUmlnR203c3l1bVUzT1MvbC9pdm1Wa2o1ditNT1NwbTJGU0g0S0U1dnBm?=
 =?utf-8?B?cGxZVkdQZ2VkcWxhTzJzSTltNHRwcHIyUlFBcXM3eHlSVXRQbHFKWklBT2xr?=
 =?utf-8?B?bFlmZmY0OW1ERnZkWWdtOGFXZWRsN2tvd3E2eXFmTEF4UExsbjdrc0tVMG5I?=
 =?utf-8?B?RVdFb1FFYk9VUCtrMklBc01FTzBCZ0VUZzVjNDBHT053QXhJbVNmekZlNFJC?=
 =?utf-8?B?VW5RQ3FSYkx0M3dRMmRKMG45RmhDVlhuZHNzOTlOcXZ0ei9XZWdnRFVTZUo4?=
 =?utf-8?B?SkI0RDFkL284R29wOTA2MjNWMTE3TVlnY2JNSHgwQTNTaFVaeHQyVmZmMERp?=
 =?utf-8?B?a2FuQklYMHFKM3E2MnBFSUlzaERlaVpKcXp0Q3YwOEJFUzZiRFNqb25UVDdi?=
 =?utf-8?B?RzdRc2R5NVFDazVCSnZhVzJQUTBXR0x4Qk1rRHRNcGEvWkZpWndWYWJQRE5E?=
 =?utf-8?B?RUdrcHlhdnJOVkFYUkVnTWE0Q2ExRnIrRG56N0x5VDYrRklySVR5c1ZVLzVG?=
 =?utf-8?B?cTdmV1Y1SS9DZXRZN0pnbThqTEViaVhFTFQrODIvempTbXJTa3lpa2NkTm9t?=
 =?utf-8?B?d2hnRnVDVzBmaHJxeUJTanp3WEhqZ1VSUlZBRDZIZ2N3UXlEZzNxZ0hLUjFs?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd7082bd-cbb7-4275-4d88-08ddc87aec50
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 17:20:43.6137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k52D09Qe8i18lH7lUa80KJ6xZr2uVczNMV9G6Cbv0Xnqy4C9B3iuj+xPfTCbqT1FElo+uYTRR9xefQzm/o3HhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4974
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

Hi Pranay,

On 19-07-2025 10:38 pm, Pranay Samala wrote:
> Reduce the number of plane alpha value iterations, and limit execution
> to a single plane for each pipe to enable this test on simulation.
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_plane_alpha_blend.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index 047cc57b4..696bb1e5e 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -79,6 +79,8 @@ typedef struct {
>   	igt_pipe_crc_t *pipe_crc;
>   } data_t;
>   
> +static bool in_simulation;
> +
>   static void __draw_gradient(struct igt_fb *fb, int w, int h, double a, cairo_t *cr)
>   {
>   	cairo_pattern_t *pat;
> @@ -289,7 +291,7 @@ static void basic_alpha(data_t *data, enum pipe pipe, igt_plane_t *plane)
>   {
>   	igt_display_t *display = &data->display;
>   	igt_crc_t ref_crc, crc;
> -	int i;
> +	int i, max_alpha_value;
>   
>   	/* Testcase 1: alpha = 0.0, plane should be transparent. */
>   	igt_display_commit2(display, COMMIT_ATOMIC);
> @@ -298,8 +300,10 @@ static void basic_alpha(data_t *data, enum pipe pipe, igt_plane_t *plane)
>   
>   	igt_plane_set_fb(plane, &data->argb_fb_0);
>   
> +	max_alpha_value = in_simulation ? 160 : 256;
> +
>   	/* transparent fb should be transparent, no matter what.. */
> -	for (i = 7; i < 256; i += 8) {
> +	for (i = 7; i < max_alpha_value; i += 8) {
>   		igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, i | (i << 8));
>   		igt_display_commit2(display, COMMIT_ATOMIC);
>   
> @@ -564,6 +568,9 @@ static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, igt_output_t *
>   		igt_info("Testing plane %u\n", plane->index);
>   		test(data, pipe, plane);
>   		igt_plane_set_fb(plane, NULL);
> +
> +		if (in_simulation)
> +			break;
If we are breaking after first plane, how do we know if that plane 
supports alpha?
We need to have something like valid_plane which supports alpha and 
other constraints and then break.
That will imply, we have tested with atleast 1 plane supporting alpha 
and other constraints.
>   	}
>   
>   	igt_output_set_pipe(output, PIPE_NONE);
> @@ -743,6 +750,8 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   		for_each_pipe(&data.display, pipe)
>   			active_pipes[last_pipe++] = pipe;
>   		last_pipe--;
> +
> +		in_simulation = igt_run_in_simulation();
>   	}
>   
>   	run_subtests(&data);

