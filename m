Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D3BD46606
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 18:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCE810E05B;
	Thu, 15 Jan 2026 18:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WqRFk94T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6B210E05B
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 18:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768502667; x=1800038667;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0IEO6bv77jqWd9+euSztC0t0nXdNqcT4vo+q/EQg/co=;
 b=WqRFk94TvGYWE8mDER/KTfJ2Y0GVZ/TRwIrlned2lu2G0KrhIUgwfe3m
 LZ+JmibWZSpCSrzFgjHSI97mPrHDXZ8d/mFIxRwPNGYw6CCMxPPtpwdip
 LQwj51t3FfV2wPJPlmMi+Jh9o6GKmYhE+ThlMbQxa+ZsR3ukYDWiy0aBe
 +iqZUhtAfF/DxTfmnKfp2TWRXf8GSro6vl3sI9LGFiP1NCT55e1r8zP/z
 hXZ/EX1uWuk+dz2Bqa28vCMhF22hsu8UtHB+Xog9R10Od+A0eo2onP9Sy
 bO36WebTAbi3ypQncpmkCQDOYPg/HCVKOhHZK25tMq2Bh9I2vZiuyuL// Q==;
X-CSE-ConnectionGUID: JxgqBw4pSpugM7k8FrLORA==
X-CSE-MsgGUID: P3jNsmNDRQ2c7hduW7RVcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80459575"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="80459575"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 10:44:27 -0800
X-CSE-ConnectionGUID: 0suvxZzoSV+lWG2DQCngUg==
X-CSE-MsgGUID: 1pbe/nG9SwOWpP5X14u4dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="205301868"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 10:44:27 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 10:44:26 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 10:44:26 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.42) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 10:44:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vX1Wlef053b8Ssu45sGQ2gVHcyvrSVCAnnVHcpWLUu55K6fUH/sqYWQiZNQ7csGoH+RvtrCFtDPi4ysOSYt8U47ZulhTi6czVpDUfqub/9Aa4175tQu/oO8ykVUDdwyyqI2W6VBG8WlpSr5LeOD2aaJYMk/cik8U6cXc1IzH8OSrWp7e78aZ512QFmXHYClZgsvozHe8mYBvNwVp/BxGH+RKXeCcG3V2Pb5vmuALzqhJmxVgokpeEy8GT4taruOwXM928YAyTjRZLTJwrY6f0wNB1Vb/uWVTmZgO1a0kcA50VrP+Jgg+DckKEd0N9Eg8K2U6OF8zzMiTO6QIQb6WdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M266BKyOg6KoqnRyV1upkJwJbLCN4ijka11xiioXW/A=;
 b=OQ24q+YXgvutYQqygy6qFXjFgsF/norRAaPyLPagezypYz/Dqqr6E/mIWNTGrttuWkJVRtqMwTuvt1h8ZqZwT31wlBNWtpHiCqiGEEA5d0UYCIHZo4OiKob86byYbuIh4bQO81kKP0GlHb/wsc9FY4EIQcWC2U7BtgJroxEUk50Et85sNqstNDxrlWtE3IUqwyNASCmJ+YS3ETOM7a56vVB5B89vr2CHnPZKQOmOVYirCf/R5qWVL3Rd6B5b5BZDxU915IJPEfEYaJ9MRbUuC/wRhh+mkUHVQIvYT1AM60Qb5xuWJbeDqwY2Txyt/IzJ0FMMpKM8IQRZMeyIb0LKMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Thu, 15 Jan
 2026 18:44:23 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%5]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 18:44:23 +0000
Message-ID: <3b7e38bc-5edd-45a9-b1f0-e2710c5d7ebf@intel.com>
Date: Thu, 15 Jan 2026 10:44:21 -0800
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/int?=
 =?UTF-8?Q?el/xe=5Fexec=5Fmulti=5Fqueue=3A_enable_preempt_flag_for_Q0_=28rev?=
 =?UTF-8?Q?3=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20260114065048.833061-1-x.wang@intel.com>
 <176844031978.156385.2657345459204334040@a3b018990fe9>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <176844031978.156385.2657345459204334040@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0209.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::34) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|SJ0PR11MB5920:EE_
X-MS-Office365-Filtering-Correlation-Id: bb43ed89-d460-40fa-391d-08de546619ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|376014|366016|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVpYRlNJcGRHd004S2VCYVQ5eTV3QzNwUFUva2pYeS9mOXJPZTB6V205OXlm?=
 =?utf-8?B?aHpyVHFLMEdpaEdCRnBrL0VWUVBBbmxEUFdPZTAzeTQ5UStjazRvQVlRL0Rx?=
 =?utf-8?B?ODNlQ010Tzd1elBvazlXbktYMlp0Qm5mcFR0YTZpeFdidE1oWi9lMldmYjc3?=
 =?utf-8?B?aGxLOXRiMEF2ZXNTTjJEWmIrZWNJRm9pLy9XOWozVGdpZWM2YmZWTk1ya2Uz?=
 =?utf-8?B?N0w1SGl0QlNJUTM5TFkzLyt2ZFJmam5VV21EbXdYT1lqS0FjSmVQeVZYREdo?=
 =?utf-8?B?UGxPYUUxeXF0aGhmZHZWUkNWekN3clBpKzZJQ2pzY3d2ZytGMTdkTHVVSnFG?=
 =?utf-8?B?aXZ2aWxRMnZVeHpGV3ljakVNU0JFNFBYUWN1STRuajFyamJPSzkyUmltS09t?=
 =?utf-8?B?R2xaMW1QR3ZDNTFIV0kxQ1dOcm5XbjJ1SnB0dDJGeVdPaWNNbGpyOGxiV2Ir?=
 =?utf-8?B?SGZ1aVBDUzNSaVhvSWpPRStmZUgyYnZwQXRkUHZ5MEFQRm1ZS3dkQ1U1TVdG?=
 =?utf-8?B?RzViTDV5TG9RWGVqL1gvZGpFY1d4WXMzZFpzeWZpQzdNckZnb2d3SzdHdEFF?=
 =?utf-8?B?YWdkTjl5Y2J0U1prOXk0UWhvV2xEd25QcG44c2tiSWtUbldTZTkzMDFjK2dB?=
 =?utf-8?B?ZVN0YkY4K0JReDFTOGhXeXFhWm40VDdQTnZuY3J4cHp2M1RzeEo0ZlVwcHg5?=
 =?utf-8?B?blJqY1BRNVA4Tk93SHlycjU1ajJDRjlyK2lOek9JeVVmbmY1VzhuKzZPV1Za?=
 =?utf-8?B?eTg1Tll1RXNiNjhvTnNkRW9NVWtta2JNdVpnZWRGNGFSbVpFVTErT3R2MDBF?=
 =?utf-8?B?aERGQVUyWWwxQzd4bjk4NXpJT2hBZUV1c3hjODdsSURMZEk4YWpETS9CY215?=
 =?utf-8?B?QzZsUFd4NkNPK243UlVnRlFHS3BoVGQydWRoa1dkVEQ3Qlgya3JyRm81WjFU?=
 =?utf-8?B?SGh0U1Y4NGxTazBuTFNrU1FEV2NvbmxybndyaTluRnlhY3VtZ0lBSzA5STB6?=
 =?utf-8?B?OStjeksyY3pRaGdsUlJKTUFoWXdYdHVWaTNYTURseTRZbWJDZTRqWTlZc2Vo?=
 =?utf-8?B?NnlVK1FNZ2VnVFZhUjVsY0ZlNFp0RXRPbE5JdHVibjR5bXJYVDhwZ3doZEZD?=
 =?utf-8?B?TmhnbmJ1SkhqSEdTYitOQVNjenFVU00xNWxEcVlqV1hsZGxpaGt3LzFwSEsz?=
 =?utf-8?B?cE1hQVcrSWo1NmRGSU9OTUNLUlZiZ0Zla3ZOamMvMzRPZzQvdkVBc0F3d0M1?=
 =?utf-8?B?a0Z1OVJrS3VMcHVIV0FZMmxXUG1sMFZ5VGl2YnpMY0JDOENEN3Q1eDlDYVYy?=
 =?utf-8?B?Q2N5RnhIMFZUc09oRzVKYVNNa0J1NmZVRERRL3c3b0k0bGc3elhnVE9iVFJN?=
 =?utf-8?B?NmRmeHBtd2w3dHczMTQ4M1E4Q2xaNk1mU2RXT1FyTzZKUHJNZWVWL09LeGti?=
 =?utf-8?B?MFpaRTgwRVBxTUJsbXZFa3Y1c2NrREI4MEF4Qk8wRFRFYTFwcWVsa3ZZRWx3?=
 =?utf-8?B?Q2xHTGFHaGFBVVJKMVhSYmhQOXNHOXg3Z1RKam5IY2lKSUhJb3FTczVYRVJy?=
 =?utf-8?B?dzBSTlk2RURPWWtneUVSakJ2WGJvUmlRZWtMN1lZV3IwTTZGQnRXYk9GdGFz?=
 =?utf-8?B?MFF2eDRvRElsR1I3WnhNTnpVb3VOQzlWamsrcWlybmRlWXp1K09qUS9JbTR5?=
 =?utf-8?B?Q0VsbGkrTldTQVhScHRxTjZHMXI2MXdZMUtPVHhCODFKNm5jaVB1NVZ5WS9I?=
 =?utf-8?B?czdZcHlkbUpoVnRMRW4rekhrK0VtNWYwZVVMcVdDNVlpS3VVaHg4OWc3TDZa?=
 =?utf-8?B?cDRhUkFVQ1pvQlBDbGpJMVNxUVc3Y1JOL0lEbjVrV0lDMGVGYXhCbzJTMURI?=
 =?utf-8?B?WXdBc05yTSthOFJrMlZhNzhoazJSNVdJeDhzWnZzV3BMemFaQXVQTFRTR1Vj?=
 =?utf-8?B?OENmUUwwUHdJN3lpMGp2SktHVGNobzY2aGRRbEVPVGNlYUZhZ1d1cXdZb3ps?=
 =?utf-8?B?Ry9UbTNKaEJHRmM3QW1Id0tRdGRzUHI1dm54UTJpbVVwNUpLUmhmYXpnNllU?=
 =?utf-8?Q?tFzv+A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(376014)(366016)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzBtbFpRMGZtV3cwNk9uV2FqUDlCVExaN2ZlMDY5NzFBRzhMYUF2Z1Nhd0pk?=
 =?utf-8?B?T25MdTBLcmp3YmVkNWNOUUVkdHc4N1ZleU5xNjYvMjBXU3BHWm56eFVnTXJD?=
 =?utf-8?B?U0s2YmpzMUtQVlYzUmxBMmVEWE95YWVlenlNbHZHenBhb091cVMrZWJ6blhU?=
 =?utf-8?B?Nk1pSHU2T0hDQ2ZwYTQrbk11QzJoZ1U1WGRuSmZUSUp6N21WMEo5N2NRMmts?=
 =?utf-8?B?VXV6KzdQMHVxelA2T2RjTXM0dkV0WmgrM0xwTW5mYWY3UU11aVVKSHY0bS9X?=
 =?utf-8?B?dWRxKzE0dWdGd0N3enI0Z25nSXE1cEVBMnRiTDZOM1Z6ak5sM3h5MHR5SDg2?=
 =?utf-8?B?TjZoSHNFbVJIa2c0YnoxRTFXT1p0VytmNkVRR0NOanl2RHNEM01NT0E3dCtY?=
 =?utf-8?B?c0lpUjhiRGlDdng0MkI0V1FOSzN1Uy82UjhxQ0N0Vzc3OXlYSWdNNTJaT2ZS?=
 =?utf-8?B?ckFsdElDRU5PdlZBUXovTzVoMTYxMmVGOXFSYm43Zkt0WmsreEEvL21ieEVu?=
 =?utf-8?B?QlpnZ1FQbkpPQy9adnFiNWxQNVBMUDFHdUlhS2hqNVJFTHZWcUl1WFVmZXd0?=
 =?utf-8?B?d0pwZ1JNZDR5OU1hbFVESzRQNkFNRVBqaExPME50Y3kyWitqaGdZcWhZUkZT?=
 =?utf-8?B?NWtPNzRSUnZKNGJnMXQ1akFGTDg5Y2dTUytJdEN4Z3h6Sy9GcHFWMVpYdnpW?=
 =?utf-8?B?dXFPTUttcjZJWDF5NHVpaEdrN1FZTnA5aVR5QXpjeFNIQkJnMFpMV1N6L2tx?=
 =?utf-8?B?WVVjZjAyVDJVK0paeUdxVHB2QTFzZlRBQTBXOWs5eGovWWl1U0hHRTZkTXo3?=
 =?utf-8?B?bFdUeEFzaEJka0RYUVdHWktnd2cxNUc3V0NzWXcwKzIyd1l1TkNDcHBQTlJL?=
 =?utf-8?B?RTlQazZybWkvTXZCRmVJZzYxZWRGYzZqZ3RhZGtBOVNMWmorRHdMaGNsMksw?=
 =?utf-8?B?OHdpS2IyUUlzZGdkZXpOd2txSC9oWTdSQ3JFcTZrVGJCR1l5K1h6TElrRnc4?=
 =?utf-8?B?Wm16YjdOaXFFRFdUbnRISng2bzUya3lQUzRkVi9xdHY1a2Q2ZVBUb050V3dG?=
 =?utf-8?B?YzZ2ZXIwME4yU2ZrVktnWVR1OGU1QzUvelJsTmJra1UvcG95VkRRaFBibHVX?=
 =?utf-8?B?U2NRemljQUVhai9VUE9jK2IrU1cwaThJMTZkREt1TXgyY05vVU1KQzZIc05K?=
 =?utf-8?B?S1VmTENxbVNyTVRBUHp3NUZjSFF2VHh2OTVzczg2ZnZqaHBhczlneWVReFhk?=
 =?utf-8?B?MmJZTEthVWdQeHp4aUpaMldtUmU3OXVOZXRhNnJ5YkNucE9BR0REQVJtanhz?=
 =?utf-8?B?TUM3Y2c3M2c1N1VPMUgwVlVuRndSSUg0WkdaZWlMWjlPbDY4QURaZmR6Y21M?=
 =?utf-8?B?OWd6TW1zOWFpMG52OG9HT3R0NEdCbHFDYVhHQjY3cGhzVkJtNUNJVWx1SkhZ?=
 =?utf-8?B?d0Juem4vUHYyWHRYV0FsWVZVbEdHZHJLR3dJRzBJUkF5Mlg4cFlZUVVLUnRi?=
 =?utf-8?B?LzlNclphaUxCZEF0YWlGQ0xGdmhwU3pQR3hlRzlmMTUzZzRaR0RNVzlnM1RG?=
 =?utf-8?B?ODRtLzUyRUVHZnNUR2dKVXFBNEZueTFKSlNNRThXbnQyemtWWk12VXU2TkRa?=
 =?utf-8?B?NWpNWGRtWjdlYXg0NFZ6dTVOUHZ3M2dBSnJXcVl1TWhrRHFtTGExeHpaSXFZ?=
 =?utf-8?B?SHp2Skh6TU1zbUpDN0NkYWZ4NTZQYmcrc3MzQ2hhTmdxMGZFNjg3L2VKdzFv?=
 =?utf-8?B?TUNmWWplSUJtTmlRaWVlV3dSMUVSZkNPZ3I2Sm9UMnRpYk1SSDYwaEpDcHBj?=
 =?utf-8?B?elpDY3hlRk82ZnZvbEdjSy84UGdaOFlvbTRXcU10dkpYemg2OVVPbEl5Ny9B?=
 =?utf-8?B?bHlyTkp3RFVUL05oS0JieW9wOFo4dTA2bTk4TVVraTcyeEpMYVMwdER6b29t?=
 =?utf-8?B?RFJ2bGNleEkydWFpd3lrSEhTZGd5R2txR3dlbWh2enZUbUZkQ01ITmRqaVdG?=
 =?utf-8?B?Mm5mNmQ1WXB2NWpMM015YkN1K1dQTjRUYWpBSTQ5YUpHNmxWcWkxTml3Uk5G?=
 =?utf-8?B?MzNNeHJ0R0o5dEJtb3k0dlgxUEZGQk5tM2RMeGk3MjNmZEJXeGg1bE5xTFg1?=
 =?utf-8?B?Tk5OWFN3ZXN0T1l3OWxmdDJOSDZubThMYzBvd1NuVGJWaTJjKzZicTRBanRn?=
 =?utf-8?B?TDZqbVBla0xVWjdrRW4vWGtTTkdIb0tOZVA4bXBDR2IxQmxMVVRpRVJWYXNW?=
 =?utf-8?B?TzZCcGFldktSZkhYMU1tcUFRS3VaVDVLdVFhQUEzMGhaSldwZ29TektiQU1t?=
 =?utf-8?B?SndDV1E0ZjJkNkc1dzQyRVFuU2xJVG8vcmNKU3RLSXJzdVJGMTdHdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb43ed89-d460-40fa-391d-08de546619ca
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 18:44:23.1274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kLq7uvqTqTjV5nqmWvdiQbiDKWlsUv+oNdfJUOMQqiVmB7n9047Qqr+D93JdjFlDwrmKYC5VWjyjTYjMJPyCXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5920
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


Hi igt-dev,
On 1/14/2026 17:25, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/xe_exec_multi_queue: enable preempt flag for Q0 
> (rev3)
> *URL:* 	https://patchwork.freedesktop.org/series/160070/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14345/index.html
>
>
>   CI Bug Log - changes from CI_DRM_17821_full -> IGTPW_14345_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_14345_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_14345_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14345/index.html
>
>
>     Participating hosts (9 -> 9)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_14345_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-256:
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14345/shard-rkl-4/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-256.html>
>         +3 other tests fail
>
Unrelated.


Regards,

Xin

>
>     Known issues
>
> Here are the changes found in IGTPW_14345_full that come from known 
> issues:
>
> ...cut...

