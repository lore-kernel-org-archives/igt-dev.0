Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9929DC678DC
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 15:00:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D6E10E6A3;
	Wed, 11 Jun 2025 15:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J5LrO529";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515EF10E6A5
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 15:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749654048; x=1781190048;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kIr4hzsj+iJ0NJt85id/NOJfWdmlNb7k1tdY+DGZj1E=;
 b=J5LrO5295uxLQc+974+tI6tZxLoPny/G7rnwnR/bkkoHaQpY8rtiu4Bo
 +B5vq5j9Bd1cuGSx406UvsNvDOanosWak68fkucNycChsAHLCvcLOaiCJ
 zdmw0Pdns6zFXc6bdZ8wQMbSR5G9hjceiqeUhbSmnijmSde3wd6TwesXW
 FsIiNmitWFDMygUoAZY6t1q/alMDjwyYVdStQpbocfLz11urvgGbHWbQI
 eIkJPcJ+Wg2qdbxWZ3Uja5h6lBtVNonvW/3RD11su5vTk7F1SILiyCfcX
 d0K7leRsU+p7ESZMp9jDc77T39H47FQCL4HapEKZpBYx1G1POb8lyF8SW w==;
X-CSE-ConnectionGUID: IWBuh3/XS6ucuF28nSfawA==
X-CSE-MsgGUID: hfxx5aHdSSC3poMnOhZlzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55606377"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="55606377"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 08:00:44 -0700
X-CSE-ConnectionGUID: LDzpa1a7RNyAin2YpcOfdw==
X-CSE-MsgGUID: WpHaxgX1TRyB46uLmvgc6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="152494650"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 08:00:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 08:00:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 08:00:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.49)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 08:00:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYc707Z63nsUiWdUqYwN+dgqnMu3K7qsyBhFXjMOHMNe0rJLpIpKfgL62+P3D07zGRq5q4/qwoUfMnciQIXpe1SxQKpPmSXeLitzANwOFGjmsl2SjIP63A5Ekh1b6NHeLsi/oKS/vdoHecb8A82Alp3HPedNc5F4C0CtGSRDUQ4DFIxeMn8peSShdbtp1UnfbhjU8qUdT+q/6QsstAJXnpAQZIIgh68f3pFWbIyg6xkXrgnf+rZgxdcJmZHl1aGmi+prYSsrrR52R8h9TUFkau6Jogn9AFG1K0nW/OGCjHFQzu/eutUi6//2O7Y2U2U+XsmR+YkX6Ox0Az5jA6v6Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKta9kVSENv+6O3KnPHFTaHSlax7Bh2SaDOelCwOtVQ=;
 b=lPxV2ljC6lIzLlXA5OV6Kjtm85q2xsMo/IULAHlW2f5vUluYmdflgWUiPSg6OvQacXCqi6+WV8LVpH7R2dR+zIOT8wKMTCVZcyZnLe8+QIuzsvLxrd/U+IgjtbL6LmlvrzbPXm8ZDJX2MtLvinIa5sBGpRSU7r4nXbMKJqIyt3K+cExE6SIho0wvlAgV5RhfDCF5HTF77L8qb+M91kgq3auyN6j8lne/G8Gb/yUFXsPJqdU4T1BUl0UiFDdGNDRAs1cr6XgcWv7Sqh8RRDlt6nxdmfQ5Y/2dk07kPOZ90YbDBZmjTGqh4mGYOvYSqFzJYfCVTFdUiMFlBJBV/5ztoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by CYXPR11MB8731.namprd11.prod.outlook.com
 (2603:10b6:930:db::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.28; Wed, 11 Jun
 2025 15:00:14 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc%8]) with mapi id 15.20.8813.022; Wed, 11 Jun 2025
 15:00:14 +0000
Message-ID: <1633795e-7008-402b-8809-6b49ca7aab6d@intel.com>
Date: Wed, 11 Jun 2025 17:00:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/2] gitlab-ci: Enable gitlab-ci-local runs from
 the primary CI definition file
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Ryszard Knop <dragoon@dragonic.eu>
References: <20250430163354.178254-1-kamil.konieczny@linux.intel.com>
 <20250430163354.178254-2-kamil.konieczny@linux.intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250430163354.178254-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::28) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|CYXPR11MB8731:EE_
X-MS-Office365-Filtering-Correlation-Id: c76b6db2-7668-4e8b-dca1-08dda8f8ab82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|13003099007|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2ZqMDRZQjhOcnVoZGQ1eEFSVjhNck9aR2QwOHJOM3l1UVlqMW9JODk0ZHFn?=
 =?utf-8?B?SUpnRzdRdjU5TzRXdnBrQzM1Ynk5RGVtMVh6cHZ5bnlwNjhSWjdDT3BxaUwv?=
 =?utf-8?B?RTJxUHF4THJNNHV5bEdyMzNyWXBMNldXS2Nxb3V3YzFCWGREbWN3TDN4WXNu?=
 =?utf-8?B?RTlBbFNaTnlBbDlCRjlmTnRGN1U4cWJWajE5MCtpR1hsVVVZSGJsVllqSVAx?=
 =?utf-8?B?Mk1lMFhJREswNTBSOGxqa2RuN0N2VSthMDNwSlNobm9UODRyZ1pELzNRUW1i?=
 =?utf-8?B?cGUrMHJIeUhwREdSOHU4K0lrWUxIVEVOUUFKM2dzaFl5Y2NPbGR6NStMZEdq?=
 =?utf-8?B?Umd6cXI3bDNXWGtOQU1vdlBtSGhlV1dhaWw3di9UdGpTbmlkWnNCdFdTOWF0?=
 =?utf-8?B?SE5La1RUQVlKTGJLVU9odlNHZzA5Z0tmZmgrczBiUGN1ZEthMFFxTzZaclhi?=
 =?utf-8?B?YzdERTVNMDd1ZVdJbnd3cndjNlFuM2VOSG1JNTI4MzJ6d2wzRXgzeUoxZkpI?=
 =?utf-8?B?Umxad3RPcHA3MGtQRXV6Y3laV0ExUlAyTnNsWC9ZWTdkL2dJSTVuM0FkQTJU?=
 =?utf-8?B?S3VydFBaTnpvZDM2UThKN0w0dndZbXBTVVpKcFlnNTE1cnM3V0t5MlQvOGtw?=
 =?utf-8?B?WFlSNUozTllvWUJsS0R3UnVkTk51QjNuQTZ5alVDODFkbk1Tdk1wQU8yNFkx?=
 =?utf-8?B?YmcvdUwwT0FUdjBxRER4dCtTcituOHFwVlJjUUNXR3Y3akQzN0tyQkdhUEhq?=
 =?utf-8?B?ZFRtc3VRQkVEbnVZTDNVZnJnOHBLeFdVOHJiK1Fob202TWpxWFhPdFR0Rld3?=
 =?utf-8?B?clkrbXVyKzhXT2c4VXJXNEZ3L2pxSWhUZndyRnd0WkpnaEhURDlmRFQrL2lY?=
 =?utf-8?B?S1p6ZHl6Qy9JWVNjR3dORjZRWjNFeFVtTzVCek1ZcU5yRk45OXQ4WmM5Wk1y?=
 =?utf-8?B?elBXdkpIcWxXRFRZOWk2d1ZqN01nNmRHdWVUVUdHSHNRdTZnaDh4aUszaXhX?=
 =?utf-8?B?VCtRY2pJWWxCT0FxamxQMmozMXowQzhKSmVmV0c3blhZTHRtbGJSSmxwUURZ?=
 =?utf-8?B?R1ovMnpQK1c3cCt4RWliNTVsOTV6ZTVEaThKL3o0d1A1aWdjUmQvdjhKZFNm?=
 =?utf-8?B?MXpGMDhKQkVXblFyLzI1ajRRMHhWTCtMSythRk96YVE0a2RjeVAwZWM1N1Bx?=
 =?utf-8?B?eThyVjAza0xBV1FvcEFFdjcwSlcwYnZrZERBWWFuMVZiRWN6WTFXNEJaejFx?=
 =?utf-8?B?QmN3enRuT3NLN0hiWlNuaWo4NnZURGNraDdtK0czdlZJdlpsajN1QzNVdHps?=
 =?utf-8?B?ZnBmTXdxOElBRHF3UE5zalNMbXFFNVFTZVBkVnIydXk2QXBGVWpIN1BJLzVi?=
 =?utf-8?B?ODc3Ti92WTh6Y0N4TFY3N0J2QXQ0a0RiT1ZqM2RGbEdhcGVGbnVWUzI1Sm9j?=
 =?utf-8?B?eXllN1U4ZXZCQUZVaGhPeFBROHRKREJiY0txekxPR0MzQkpwUGZvcDJpRUJo?=
 =?utf-8?B?WWYvRDdjTnZ6eHdrV21sdmVJMTJSU3A2c0VQelc3RS9kaDhpRExPMXBNTGlw?=
 =?utf-8?B?Y3d1SW80ZmJPMlhsWm1OMTRGTXlpSW1tK1FqOXRxejBJWExZRld5SE9RVUVV?=
 =?utf-8?B?NFhTMFNDdzdzTXdsdzZJaFI3R2tRdGlpYU9qSEdEUm42a3Y4cFVRb2IzN3l3?=
 =?utf-8?B?NisvVkRDU3VtRzFaajdyMUIxOVcvNEN0TnVBSTZqdjk0QXdXZDZDMjJZQ3Bn?=
 =?utf-8?B?NHdBL2VhRGFueFlmSlU4a2RwTXRTSmFyK1YzdDNYNmdUdjBFMU1BVlZEbXVw?=
 =?utf-8?Q?URpySuQhe+DjG9F4t9ONEnhNTcxHMJB9Izaq0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFlEM1dXZGxYUm5YWUtpVnFwMmg4UE51UHNSQUxKQWg4Sm8zQkphaWgxUnJQ?=
 =?utf-8?B?SXZjS2Z0UnhJclp1UUdYVzVhZG4zNkMramdzdzZpZHBMc28yUmxiZmdhVDlW?=
 =?utf-8?B?citLT1pvalY0cElsUDIxa2Ztc3l5MG91cG5XZ1RIdDFDTVRNcURMcGFGSCsy?=
 =?utf-8?B?a3dTdTRIWEt5MXYzak0wTFZKMUJtWW5HK1ZCTm5JeGRpZEdqaWxyWXhRYUJv?=
 =?utf-8?B?N2k2M3RNVUtZUjl2RFRIV2F6bUtUamVYQ1NURE8yN1d4VCtVOHlpazNqUzhm?=
 =?utf-8?B?QXpoSkI4MkR2MU81NnNRUkF4bzFJVjk4Q3MrY0lVQkxpOVdjeWs2L1VSNDRu?=
 =?utf-8?B?Mld6OGZyR1kxS3RBSzNJUEY0Uk5lS3MvYjN1cEdONmE1eno0ekN3SWl3YzVW?=
 =?utf-8?B?Zzg5MzFjbk4ra0VvVVcyU1FjL05jejREckNubmU3NzRzVndsUzZtRUVnOWNu?=
 =?utf-8?B?aTRqY2ZzZ25IRVI5SVBuQWVJYWlabHc5V0RVZ0M4dVBIS0gxcUh2K3ZWTVJi?=
 =?utf-8?B?blpCc1VuejhsL2xjUGN4cGU2Wjh5UHBjeTd5Y1NMMDRDeXZyQnZnekhMN0dl?=
 =?utf-8?B?U1g4am9tQjNUcWNPQitDV0U3bWZic3NvQ2FWWjIzbDJCZldoU252elVua21l?=
 =?utf-8?B?R0szLzNCNXI1WjBSbktJOHBsd1p4R24zb2M0WXZMQTJSaTBtbWlQeUhLNXdn?=
 =?utf-8?B?dVZRZlFsbEV2MGhxV3ZPbFZlcklWaExjU1hSOTR3WFArUm5xaU9QVHlKaTlT?=
 =?utf-8?B?RFBmNVlpMUpZRW1IWFlsbSswVFpvNXhDa1hnVVREaVV2a3pzTHRQRmJIKzZG?=
 =?utf-8?B?OVlxdWRZWWtuRjNzSjdVNTBjRmpVcTh3dVpCMEtmdUQzMDJDa2FwMWNnR3FZ?=
 =?utf-8?B?SmRLemZXb0hWejM1OEVCeGxTUGhjNnBuZkZna2hVQ2djN3RmWGcvRjF4NDlj?=
 =?utf-8?B?NWNWcmJkaXQxT2lybVJVbTY1elFjZDM5V1NaUkRpdWpzWWFqM3RYUFVnRFFl?=
 =?utf-8?B?cU4rSHlhUlI4RG1qZGQydWxwdjFHT0phd0ZZN0dnK2pJZ0JDdVdlQnM5elJh?=
 =?utf-8?B?QllpcEpSTC9PeXdHb2JVUTVIcFVxWmxHc09iUXZHL1l4eHR0OFRmN3cvSXQ3?=
 =?utf-8?B?ZGRpTDh3UVRMMVJQQjlrL2JFTlplVW9XOGlFY3lNclI1OWg4VWRSRURrSVFv?=
 =?utf-8?B?L3FFdmJRRlp0eVFRRHloRE02bWZIaHFDd3VkOXRuNHcyZ3M2RGU0VVZEUmpT?=
 =?utf-8?B?RTFUOUxkWXhMRkhJQmVmMlVwczkxTE5Cb3lyUGZKclZ6Q2wyeDY3eHRDNkQz?=
 =?utf-8?B?K1dQK1E5bjJ2d1c3eU1HVHptWGJPNjI0V3JUOG9icnh5T3RzTjVzQ05kRnow?=
 =?utf-8?B?WjY1OCtYK1RCTGhVb0pEK2hRTzFvOFVWQW8wVkVtb0lQOWNGMkVmTVRoM09P?=
 =?utf-8?B?UDBWVGtMOTBJQ0FlWXp4K2xzaXFYb0x1aW5nbXQyNzlhZXR6bHlqUzFxV29k?=
 =?utf-8?B?M1o5N1U4OVEyajQ3Yy9qeldwUUdzUkpJeUNHRkMrSVhwWDFpbm5IdGQ4WHRq?=
 =?utf-8?B?QUtDTkZMb1YzSkh3aDJzTzNUOHhaMklZak9TOUpPMkY5ampkNmpxUGNnS0U5?=
 =?utf-8?B?SG5NWmVCbGRyQUMvSzZoMzlvdmY3Ri9RNTQ5WUhiWWM0SHZKalRSVnREeWk4?=
 =?utf-8?B?bnZKSjVhVkd4elhnVEtNTEtPVllrdFZ5MUtCUkhXNUJqbzdpd0ZBaGE1SzMz?=
 =?utf-8?B?RWlKTE9JaFpQVmdKbEQvTTVZL2l1YnREVEZpSU00ODFZUkt2WHlyUE1jZENP?=
 =?utf-8?B?ZGc0dm5xcFZSVnc4TEozZWZsZW0raXNpa2JyVEFEUFI1T2crQW95QVlhb0M3?=
 =?utf-8?B?QkI2MnFSb3IrQU5TcDg0eXI2YzhoclNNbEJBZTZWVGxodnoxV3RuQ2MzUFhB?=
 =?utf-8?B?MG1KWi9Jb0VTeEhldmZJa3pyUXZBM0owOFNnYlgwY1Q1N2dVMDAxSmY0VHZN?=
 =?utf-8?B?Y1lRdGJJRzBWazNLdy9ZZTMwdHZLV2hlN0hyOEN4TFFqRG1YNmU3UStOQ3hO?=
 =?utf-8?B?ZzVWNEs5bkg1S3ZjeW1OcXBTaFdDNVVPWUg1aFRmZTVWajU2S3UvU2RwZnU3?=
 =?utf-8?Q?l3B7psNd5A7Zuqa/aR6A2Lhq6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c76b6db2-7668-4e8b-dca1-08dda8f8ab82
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 15:00:14.2477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTlaUgXgI5ZyAhPDsXA8vLgLTz2LUGaNxWis0jMENozmnDs+h/9xA4zvOev22OaK99qY5xGj0R7ZyZm9MH9pYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8731
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


W dniu 30.04.2025 o 18:33, Kamil Konieczny pisze:
> From: Ryszard Knop <dragoon@dragonic.eu>
>
> The gitlab-ci-local tool sets GITLAB_CI to "false", so we can pick which
> jobs are to be executed locally without defining them again. We just
> have to override the image to make it all work.
>
> Signed-off-by: Ryszard Knop <dragoon@dragonic.eu>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   .gitlab-ci-local.yml |  2 ++
>   .gitlab-ci.yml       | 30 ++++++++++++++++++++++++++++++
>   2 files changed, 32 insertions(+)
>   create mode 100644 .gitlab-ci-local.yml
>
> diff --git a/.gitlab-ci-local.yml b/.gitlab-ci-local.yml
> new file mode 100644
> index 000000000..65ccc1eec
> --- /dev/null
> +++ b/.gitlab-ci-local.yml
> @@ -0,0 +1,2 @@
> +include: .gitlab-ci.yml
> +image: build-igt-fedora
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index a6c076dba..ec7ce7bae 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -25,6 +25,8 @@ stages:
>   build-containers:build-debian:
>     stage: build-containers
>     image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
> +  rules:
> +    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs


This can be achieved by either:

1 . gitlab-ci-local options to avoid build-containers stage

2. adding proper vars to .gitlab-ci-local-variables.yml, example for my 
igt fork:

CI_REGISTRY: "registry.freedesktop.org"
CI_PROJECT_PATH: "andrzej.hajda/igt-gpu-tools"
CI_COMMIT_SHA: local
CI_REGISTRY_USER: andrzej.hajda
CI_REGISTRY_PASSWORD: auth_token

With this everything passes (ok, almost):

  PASS  build-base:build-buildah
  PASS  build-containers:build-debian
  PASS  build-containers:build-debian-armhf
  PASS  build-containers:build-debian-arm64
  PASS  build-containers:build-fedora
  PASS  build:tests-fedora
  PASS  build:tests-fedora-no-libunwind
  PASS  build:tests-fedora-oldest-meson
  PASS  build:tests-fedora-no-libdrm-nouveau
  PASS  build:tests-fedora-clang
  PASS  build:tests-debian-meson
  PASS  build:tests-debian-minimal
  PASS  build:tests-debian-meson-armhf
  PASS  build:tests-debian-meson-arm64
  PASS  test:ninja-test-clang
  PASS  test:ninja-test-minimal
  PASS  test:list-undocumented-tests
  PASS  test:verify-blacklists
  FAIL  test:ninja-test
   > Skipped:            0
   > Timeout:            0
   > Full log written to 
/builds/intel-innersource/drivers.gpu.i915.igt-gpu-tools/build/meson-logs/testlog.txt
pipeline finished in 14 min


So I am not sure if we really need this.


Regards

Andrzej


>     script:
>       - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
>       - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-minimal build-debian-minimal
> @@ -33,6 +35,8 @@ build-containers:build-debian:
>   build-containers:build-debian-armhf:
>     stage: build-containers
>     image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
> +  rules:
> +    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
>     script:
>       - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
>       - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-armhf build-debian-armhf
> @@ -40,6 +44,8 @@ build-containers:build-debian-armhf:
>   build-containers:build-debian-arm64:
>     stage: build-containers
>     image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
> +  rules:
> +    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
>     script:
>       - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
>       - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-arm64 build-debian-arm64
> @@ -47,6 +53,8 @@ build-containers:build-debian-arm64:
>   build-containers:build-debian-mips:
>     stage: build-containers
>     image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
> +  rules:
> +    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
>     script:
>       - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
>       - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-mips build-debian-mips
> @@ -54,6 +62,8 @@ build-containers:build-debian-mips:
>   build-containers:build-fedora:
>     stage: build-containers
>     image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
> +  rules:
> +    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
>     script:
>       - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
>       - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-fedora build-fedora
> @@ -74,6 +84,8 @@ build:tests-fedora:
>   
>   build:tests-fedora-no-libunwind:
>     stage: build
> +  rules:
> +    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
>     script:
>       - dnf remove -y libunwind-devel
>       - meson -Dlibunwind=disabled build
> @@ -82,6 +94,8 @@ build:tests-fedora-no-libunwind:
>   # documentation building is different with meson<0.47
>   build:tests-fedora-oldest-meson:
>     stage: build
> +  rules:
> +    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
>     script:
>       - dnf remove -y meson
>       - pip install /usr/src/meson-*.tar.gz
> @@ -92,6 +106,8 @@ build:tests-fedora-oldest-meson:
>   # ensure igt_nouveau stubs build when nouveau support for libdrm is disabled
>   build:tests-fedora-no-libdrm-nouveau:
>     stage: build
> +  rules:
> +    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
>     script:
>       - meson -Dlibdrm_drivers= build
>       - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
> @@ -110,6 +126,8 @@ build:tests-fedora-clang:
>   build:tests-debian-meson:
>     image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian:commit-$CI_COMMIT_SHA
>     stage: build
> +  rules:
> +    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
>     script:
>       - meson $MESON_OPTIONS build
>       - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
> @@ -121,6 +139,8 @@ build:tests-debian-meson:
>   build:tests-debian-minimal:
>     image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-minimal:commit-$CI_COMMIT_SHA
>     stage: build
> +  rules:
> +    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
>     script:
>       - meson -Dtests=disabled -Dlibdrm_drivers="" build
>       - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
> @@ -131,6 +151,8 @@ build:tests-debian-minimal:
>   build:tests-debian-meson-armhf:
>     image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-armhf:commit-$CI_COMMIT_SHA
>     stage: build
> +  rules:
> +    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
>     script:
>       - export PKG_CONFIG_PATH=/usr/lib/arm-linux-gnueabihf/pkgconfig/
>       - meson --cross-file meson-cross-armhf.txt build
> @@ -142,6 +164,8 @@ build:tests-debian-meson-armhf:
>   build:tests-debian-meson-arm64:
>     image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-arm64:commit-$CI_COMMIT_SHA
>     stage: build
> +  rules:
> +    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
>     script:
>       - export PKG_CONFIG_PATH=/usr/lib/aarch64-linux-gnu/pkgconfig/
>       - meson --cross-file meson-cross-arm64.txt build
> @@ -153,6 +177,8 @@ build:tests-debian-meson-arm64:
>   build:tests-debian-meson-mips:
>     image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-mips:commit-$CI_COMMIT_SHA
>     stage: build
> +  rules:
> +    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
>     script:
>       - export PKG_CONFIG_PATH=/usr/lib/mips-linux-gnu/pkgconfig/
>       - meson --cross-file meson-cross-mips.txt build
> @@ -180,6 +206,8 @@ test:ninja-test-clang:
>     script: meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
>   
>   test:ninja-test-minimal:
> +  rules:
> +    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
>     retry: 2
>     image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-minimal:commit-$CI_COMMIT_SHA
>     dependencies:
> @@ -268,6 +296,8 @@ pages:
>   ############## CONTAINERS ####################
>   
>   containers:igt:
> +  rules:
> +    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
>     stage: containers
>     image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
>     dependencies:
