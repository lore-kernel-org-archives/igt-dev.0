Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA841CAC599
	for <igt-dev@archiver.kernel.org>; Tue, 16 Sep 2025 15:10:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7B510E381;
	Tue, 16 Sep 2025 15:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fbTbPYVQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE61310E379
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Sep 2025 15:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758035454; x=1789571454;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vhKtcK8dUEQN24VPQTvM2Na8VbqBp/dTwO8NdoeFUzM=;
 b=fbTbPYVQ9DlU6JMrBtTApdcUA/6wTEbFdvuybK9zZLDpmfRjXsdu5VL1
 D61i2LLggIn4gfvSqlkY7JrBKJjQg50pKAPeVCWhtUyZ6s6IaMoCoCeUi
 u4TRhNP+Qmy6KhLSlh5x9yY8LBDvaV+2QVO6ZSD0RIY3HPVg8MGyC001H
 1CRiRFVE8ijSviAJo7aYCqadqrwjO8ce5eVsxKeTXo4dp2l62sd3yEFOL
 kQceuw8Pn0I024tLaFgOuJm5w/o+wCwG35i0V3XnfNAWvlJcFyw+zfHZf
 E+ZodKz52RIQWznHCEBvJ80Dfg3sf9NemLqsNQfU78uljCpDojYt9w3Th g==;
X-CSE-ConnectionGUID: kGTrTfH0TwS9Aax2QZ0cLQ==
X-CSE-MsgGUID: uZsmM2zYQwKJKvWVSm3NGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="82913920"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="82913920"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 08:10:54 -0700
X-CSE-ConnectionGUID: WhDbzgdJT+G65ZgS7sJ/Ig==
X-CSE-MsgGUID: c+RWB7TlT0Ww3ElcVhyvrw==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 08:10:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 08:10:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 08:10:52 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.7) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 08:10:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mxdAn0+UvqCnRO+jGFTidY+bT1rEdlYX3PBxKZYN5XNmlh4OvQUkKMm9uaVJapcyZ/7XhN8k3OphiOhhe47SiyA54nQ1UzNyhqLC9MMJXGdNfeVNPvaBTesSz2F5fNVQalstb44EVRCI+yIsibCR83hNFhyW74eKEJ59JzB45CNKwqv7J4oYx1ydu16NbjAH2C0sC5oDQnoo1tlxPrDUb02u1GyGj8PWRcPEUMSeK9+Z+Uw+B/R+1fdmn+hJxrwtkvsx3v7dO53JkI4f80u14QTXAr54qbTaOlHo8Un/CEm9aS4v9c7zl/LfYMRatlmthJIbYytZP7ykRwtEKtYesQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sy5DwSjDFE3a1LpEXO8xnT8sbBrNnYNIL4/kedizRpU=;
 b=NAvRKX/kCpuNEoixnkQAUiVkoxmrKnntZbiOPvAQjemoXJ4KEKqpjLiwoDBURXg1JVNDFHXzxmLTo6fA3bTe1sG7plDOvl0hQchHCMcs7G43xAJ7VG2Mrh9o1T+2s4r4dxgmhmlNIXfmpiv2ET4BH5RI5uftKX/AlSiqq8L0ta+f56MPr8pOh8/zZVZ6ZWe0PjFv/R1ONgtXiWRxohvUFtUzhnyP/+8JIg5GvBcor97AHY3oB0CRyen/HIj7X/BDc0UuHc+iZSlmC2yZva3hsHt6mabmw9ay2YI7Wv3ENRKlxGQmRgKE6YBpJ2LJn9UcKduSW8xN8EirfCuhi/HqjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by SA1PR11MB8521.namprd11.prod.outlook.com (2603:10b6:806:3ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 15:10:49 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%5]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 15:10:49 +0000
Message-ID: <4d5a1a1f-e89b-44e6-945e-894df112d40b@intel.com>
Date: Tue, 16 Sep 2025 20:40:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 0/1] Revert IGT_DATA_PATH env setting in runner
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Karthik B S <karthik.b.s@intel.com>
References: <20250916130904.166885-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250916130904.166885-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::18) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|SA1PR11MB8521:EE_
X-MS-Office365-Filtering-Correlation-Id: cc428de1-c407-43f3-af26-08ddf5333806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1NTdXRBVndFUjZYS0NFa0dqem1aVjJidXVwVldJcVcySTdjS3hVTWh5azFn?=
 =?utf-8?B?N1JHbmxIN3prcTdKQ1dPWFB3cUowUnVSUklFY05YeFBTNUF2bmZuRU91azB3?=
 =?utf-8?B?VWs3VVBxWGxpUW4za3A1TE1WNTFwODl3ckxXMzlySDFhNU1hTld5YTZtcVhP?=
 =?utf-8?B?dElxaStVTEdGNi9PMGtneTAveFdvYmw2azVrUVp4d0F2YjdlV01WZXB5ZGlO?=
 =?utf-8?B?SDcyUDluQ2V0Q0hYWHlGOWlidFd2TW5lSEpoTmF3UTNlSlNKMXdOdjI3T3NS?=
 =?utf-8?B?MnBlSTVkUkJFenFvamR4WG9aKzVEcE00Z1VPTGZyVW9ONDBoUXpHUHY0dUJx?=
 =?utf-8?B?cjVHR2lIMTMrOVhIMzFKODgzUlZHTFB6czMvQmhsSUpyVFFvOGRoS1pqSzhm?=
 =?utf-8?B?NWNqVldxYmhzcXEyMkZxbXdYMFp1d2hGZElFZXFsSkQzKzh0TVIwUGRvcDlU?=
 =?utf-8?B?TjJnbk56N3I5d2JhK0xkS0htUXpUMTAyREEvbno5N3NIbDYwUG5SdVB4S3Iy?=
 =?utf-8?B?RmFFbXR2T25JOFAxbXZqczdydVpUZXBoeXpNcWxZTXBWeUpyNGN5N3htL1RP?=
 =?utf-8?B?TUNFZWY3ekdoN0dIa0NNTVBrWk5tcXZVSzl2eXZZNjZiWlAxWko1REwxd3ZW?=
 =?utf-8?B?SFNaR084MVA2NFNmeDBYUXJIcEtNVHd2aEhFa0pKcEJhRW1WVUlEOG5yNmZ5?=
 =?utf-8?B?cFdmWHhjOUcrL2prc0ZhU00vSWdWTTdzdklOZ0ZYSDUrRkt5a2RVOFJ1eUwz?=
 =?utf-8?B?RmduR0tuSXMzN3M5ZFA0WGx0QUZMMXljZVBkUkd6TEF1cldjK1RGWUJBajNz?=
 =?utf-8?B?WkFzMTdyTG01VGNEaEw4MGdnaTFkOVhQMWRqZXRlYm5raFVtQmVLTzljK2dz?=
 =?utf-8?B?K1JEVE9HYmRnVWwwNXZZSjBRbGpZRDhPcVZzem9UY3dXcmxTRkhyMVk1WFV5?=
 =?utf-8?B?K0RZalpJWU5paVZ5N0lhZ1ZJV0JoeXR1TXFLKzYrR2sxY0NHMGJhYWRsNG5x?=
 =?utf-8?B?ZGtjSGwxSWVvbXh4Qm94NEtuRGZZdmcrcFR5bGQyblFId3NmRmN5d1lJTnlD?=
 =?utf-8?B?MXg0WmkxZm1xNklSWllPeVJTVkRKYXBKRG1pQ0srTW4zbjRmMzliTjB0MlBD?=
 =?utf-8?B?QjhlYTRTM3MzclpQQ3lLNjhpWmlhbUd4TVlZQ3J3RFBKcjZJZWxyWHN2NlV1?=
 =?utf-8?B?Z2dCcFgrcTF0NUxNeHVqTXJtUWlCZ3ZMWk95SlRHZjFscEtEQ1pLUE1xUThl?=
 =?utf-8?B?eXpQanVRZlJqeW5MbkxSYll5ZmMzRUFzNFY4eGpYQ2UxejJRSXY1eE5mUFUx?=
 =?utf-8?B?ZHRMbFphc0FNdyt5WkZoWVhwV25uN05nQ0J6Ui85cG5BWmpHalo3ckNKM3U2?=
 =?utf-8?B?eE5lb1B0U25jb3BoTnRBT3VxZUc4YURqenhwbThwYUlxRzhVVWVGR3VyeE9i?=
 =?utf-8?B?MGxpK1JCZmFPRHVDcnZnVk1hb3lOYmZMeTg1T041anl3WWxlMGJRRWFVZm5S?=
 =?utf-8?B?eUpaOEhBQlFkODJsemM1RjhSeXcxNk5EOVc4UGdqbEc3UUpva1hNRllDR0F1?=
 =?utf-8?B?RVpCZDI5d3luZU15WXBpQU9DS25Td01CNkJaY3VXNlpnRWZzWVR0MUdIMFJ4?=
 =?utf-8?B?UU8rMVU2b3pkNk4waFN0dVlYaU9rZ21POEUrazJIWEN0bWdWN0w4Wnd0V25a?=
 =?utf-8?B?K0dRcW90c1B0dlgySHV4cHRPalVuc3lMMEdqUVJ4NkJBZThuWUxVOThGZWNs?=
 =?utf-8?B?WDBpTnhLdnNnM2JnRXlMWTBkY3JDU0xYME45bzJjc2xLWUNqQ1ByamNTVEFZ?=
 =?utf-8?B?Q09qdG8wT09DVm9PME9Ja01IdTA1cmZ6b2t6aUJKcVJFRUVCZUhQYUNCaDZs?=
 =?utf-8?B?K2NTUXB1ZU8vWVNnT2o5MTAyV1lhVE04b3A5dTdqaGw5cklDdGVObGFHbUZu?=
 =?utf-8?Q?afvZCn467d4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUk1RmF3ei9MbVlQQ2s0b0hSaTBOdFlFMUpNcG91VnpteG80SStIVk1jU1JU?=
 =?utf-8?B?Y1U4dGxOMVl3M2tTRkovMXdCUi8wYmYxMDQyek1ELzJvdCtubFZFc3VzZ3Ni?=
 =?utf-8?B?c25jcHUzQ1JhWHpjeHlsOWh4dnQxRUY0QmUvMmROQWM5RmtYY1Y3YzJoTHZJ?=
 =?utf-8?B?MDkrdit2SGlvdEk5aTFEVWc1MGtON0VJZnhQaDFvKzFNYWFxZUEzdFJOTmpY?=
 =?utf-8?B?M0NuN0pabUxQZ1RKZms4c1luQ2hKNU13OUswbDNCNmsySjI1enRsZmgxdTdK?=
 =?utf-8?B?QXEvVHMzZG1XNE04MzlBOFpnSzEyYld4MDFobXJzWjQ0d1YrNWRRdjNsK2Va?=
 =?utf-8?B?STV1K0toZXVDcXFNcHlOS2U0OXFCSnlVUkRTUDk2Q05pRXVHMENiOGllSS80?=
 =?utf-8?B?cllST3JhNmtGR1U5TklTUDhnNWZWb3BmWCtmcVo1VXdzMGpKbTRhTDFXR2ZZ?=
 =?utf-8?B?cVJoUG5hYnQ2STRYTlJNY3pPSndzZ1lTQlFBckRxa3BsWmdhamhoNk1vL2lv?=
 =?utf-8?B?TDRBb0M0WVhvZStDL0FlYUYvSU5uT1BlejZPdytFMlM1N3UveEVMeUp2dWdY?=
 =?utf-8?B?Zno3b3VJalJFTUI2Rk5ibGVXSkFtMjNacVE4UHk1ME9oTEdDTUwwcEtHMVVj?=
 =?utf-8?B?MFMrQk00S0F3emxIWmRvTE9vUFlkcVJqdFNjQ1JOb3d6TytwRUNIQkRKRDUx?=
 =?utf-8?B?L1VkVGt2Z3dKbE5WdW1VZURld2Q1eUZPZjFib3BkMHU1WHhEVlo4eFBYSkNN?=
 =?utf-8?B?MzlwQ2J2QzZCL1FpZWJkSytBd3RvOGQyOUZlVUhmb0cvSW4rdDROWmdQemNt?=
 =?utf-8?B?TGhqWUxwNE9hMjA4dUFPbWJCK3hYWWYza0V1TlNRcDh4U2svUWdNeTFGU2p0?=
 =?utf-8?B?VHZocUN4N2cveGJwYU9POW1hYk8ydU1vS2pmU2pBUm5oc3NaNGE1SjFqWVhB?=
 =?utf-8?B?NElXSkxTd0xUakxraFk3SGZKKzkzc1BiOVNlS2FLbVFyOUhidmxVMkM2TTk1?=
 =?utf-8?B?UWFSbDlDbTYwanV4dlhtNC9kMGl1NkxsNlBTZGliQlpaMWxRNksyNzU3WEd1?=
 =?utf-8?B?bXF5dXUrb2lRYk52eGpUc0dVeVpHdDhXZTdQdnJVaTBQMFpJR1N6MWpOdy96?=
 =?utf-8?B?aWxxWTB6NHRRenZnc3dEWEVRSjhKRjU1TWpZUEtHK3cxZmZEcE10WUUzUXhD?=
 =?utf-8?B?UFJXZTh3b0g2Q2NWZ1BWRk4wRE5FZEU3aDEwRzAvVlc3NWZ3MzJVdzlLbnFM?=
 =?utf-8?B?ajlRMGRPaW1qTGNzL25tN0IxYTBOMjBZL21NRHR3ZDhTb3hUc3RXT1lHck9N?=
 =?utf-8?B?VVd6ZGx0YzFaTW51Zk9sd2NOdk5xTHBkY1FJVmd6OS9YUSt1RVFPK01OWm5S?=
 =?utf-8?B?NnUrR01seDNVYmttZitvTmxUcXNsVzdzK2VMdlBKazYvRDVCYldpb0hMOGQx?=
 =?utf-8?B?bkUzM3k1amRCS25ielRaQmRIWlJkc1lYODA2SGxPd0xDYUo5cUVWcDY3dHJq?=
 =?utf-8?B?WEQwSnY2YkZSb240RGNKZzNyT3d4Z2xaVzVndVRxTUtyT1RreWVVYktzdnlq?=
 =?utf-8?B?R2kwaUJHL1pwTXZoUmhhTVdOQlFXWVBscG5jcWxRa05ROTU2VFVJOVFZbjBq?=
 =?utf-8?B?eU5kSm1BYlVZQXJnVGZZR2k1L1E4K0V5azV4YXBGb1dvR2M2TEJwUC9Cc284?=
 =?utf-8?B?YnpUTHlsc2RRTXhjZjJqMnhEQ1Z5UWJURVViSnBYcTZJZVlUcTBhaE1LUVpl?=
 =?utf-8?B?ZVloVXUzZzlYWWpTckVNWFhlNU0rT3V0ZVV5NjQzUmxaNi9RdldlaTJCUHdE?=
 =?utf-8?B?ZXhLcXU2eFRWZVNIWkdEelJiNjFreTYzaHdPQTNORC8yWHBWVjBtQlhDODla?=
 =?utf-8?B?KzBPRGtUWFg2U0pCNjBDQWZRM0tpNmZrK0FPSU84dWhOWGVVTzdHdW5IN2ND?=
 =?utf-8?B?bWdJU3NaMmJ5dUM1eXBaSk5la0RuRWdNTlBuMDNtUC8zN1M4VlE0b3hyU1J4?=
 =?utf-8?B?dkZQL0Y3YnZsc0VIR3R4UU45VmpxMDR1eFMxNDJrck5rV3VCUUdRT0J3bm1x?=
 =?utf-8?B?dUY1NEhva1hTZFBML2pHUDlPRE5rUGF1Z1J5dERqU2xvN0R6T1RiV1Q4YlU5?=
 =?utf-8?B?RWRlMEpMcGtJUGJYajdFUnZRUFhmT0RINldDZDdWL2dzUUduM3JpaWRoUjhS?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc428de1-c407-43f3-af26-08ddf5333806
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 15:10:49.0387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1zVt11q1VFzRR6GINQ0VqySPBXCpmpKsNH5DbqT2pX8GBKbZ2EdzPZyuFXOEg0xASPNi343QiJKyoh6rtE6CxiRApBGNU5oNlKRkSr55CU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8521
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

On 9/16/2025 6:39 PM, Kamil Konieczny wrote:
> Setting path to data files like PNG images should be something
> for test or library, not a runner. Also this works well without
> runner setting it, which can be verified by running kms_3d test,
> both in build folder or after an installation of IGT binaries.
> This igt_runner enviroment setting seems redundant so lets revert
> it.
Agreed. During CI runs, as part of LGCI-2580, we set the environment 
variable from the command line.

LGTM,

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>
> Kamil Konieczny (1):
>    Revert "runner/settings: Add function to set IGT_DATA_PATH environment
>      variable"
>
>   runner/settings.c | 36 ------------------------------------
>   1 file changed, 36 deletions(-)
>
