Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDBFC87FCF
	for <igt-dev@archiver.kernel.org>; Mon,  4 Aug 2025 10:40:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD8110E153;
	Mon,  4 Aug 2025 10:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kIG1UOaS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805BF10E153
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Aug 2025 10:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754304002; x=1785840002;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FzazRxi/fBN7Pmrwj9zC2jC4OakKzbzJwDXzhpzyBdw=;
 b=kIG1UOaS6tv5G7bWUOkpOB6PfRvluQQeV8RpqwuoektSZU7xjBLxnMmr
 kBiTsnU3zX7ECBGwGndjp5xa7jeBMn4VTsS/twxS8gHV1zjwbSWt+3qdu
 JPdUk5VlcAtYh7tgLnjNHLqtQcZr8VrRBDwrHFer74GqW0zGqiupUOixn
 bsQPV0lvUCY6gdrzFg2sEu5fw56dFBK28Fp/Nrc2mpaCnARFHvB0ybG/i
 AlpEoiZVEMBFtURHXtzVheBlcwZbpf1W8aMamSK+8nrdtqf3OkgfWBY/O
 /mUmoggYL0oF4Dko9Ktj5Gd77BCfVUwCNTkbWUfSyaYqr1ijO063Z+ZFN g==;
X-CSE-ConnectionGUID: +hNijHwrSuGT8TnQWgSOdg==
X-CSE-MsgGUID: JqkoS6P3SvO5wXOp0VqoXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="74148987"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="74148987"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 03:40:01 -0700
X-CSE-ConnectionGUID: fANT5dafTKyChfyB99jfyw==
X-CSE-MsgGUID: ro/FoEbiRR6hbS2X89Alsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="164918636"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 03:40:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 03:40:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 03:40:00 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 03:40:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkIHqO6+Q66DR3GkGkbAQX6XUKtshdzSUJeVgokNDXKmuKtl/euVYXfNx6qc0uBGiudsLCBJPOemEzrA0PaDI51oziM499GyshoPJ+4TiA23/PLWVPqrjg4SR6G0rFh74JnQ5CUwi4GxT9kthiDhQtzsDYfPsHJf7x9iJMLf6xMwBFtUpk8OhhjMbDjMsKs2sHz30BMT1HUdR98Bef3/UXnJoo88S0wFG+AUN6d2X7jDtgLVCOQVCJ2r6Dyy958aLZpQI0lA51UqaETZqfsPZkAI7G4FpbuGNJmQRdvD8eFvWuP9VzNMCka/8FaMyPF7Q4QLOYWlxXblhiajNkgzRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWu1KoG5HdRhAuKCmYqM6U9vnnf4VNlrdmFoBHVbjkY=;
 b=ai0KHFC6ETs+RMvRuiekmHB1lso/QfB84EfH6Mex4dwoMm3iAvRFDkZZ9KgIqQLi7wm3gK0asEsEPPtC9hZmPW36PdFQGxK1hKDUTg6cmqZZElsO21WzMuMoLxoqfj/1IAvVQMXs5qqgAxvS4RoC4zBlF/boc1HtjtlalqvF9VFn1K9RdA+D+ZDkVMaImlEAQf1/vV6u9Ll3MJ0F12v4jRulOrtDN1doidvVTe6/XiVQUxWLTUDoJnuzMAXQ8NL7JFppr4hYs3zdY0y2giLcKJb9wwDXhWkax7JE8NgWhytY7by/R3HDBK2UHfzYoPMp3UA2RUaEnIjnSiaXr5O5qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA4PR11MB9107.namprd11.prod.outlook.com (2603:10b6:208:562::22)
 by CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 10:39:58 +0000
Received: from IA4PR11MB9107.namprd11.prod.outlook.com
 ([fe80::6b7e:af5:887a:e384]) by IA4PR11MB9107.namprd11.prod.outlook.com
 ([fe80::6b7e:af5:887a:e384%4]) with mapi id 15.20.8989.017; Mon, 4 Aug 2025
 10:39:58 +0000
Message-ID: <60e689ed-4e7d-4501-9ed8-e4eeade6edf9@intel.com>
Date: Mon, 4 Aug 2025 12:39:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/4] scripts/run-tests: Update help
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250728173152.220113-1-kamil.konieczny@linux.intel.com>
 <20250728173152.220113-2-kamil.konieczny@linux.intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250728173152.220113-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0101.eurprd04.prod.outlook.com
 (2603:10a6:803:64::36) To IA4PR11MB9107.namprd11.prod.outlook.com
 (2603:10b6:208:562::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR11MB9107:EE_|CH0PR11MB8189:EE_
X-MS-Office365-Filtering-Correlation-Id: 910bf96b-d712-4020-844f-08ddd343422b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2lESFk1QmU0Y3JoUjIvYTdaRmFzR21adkROd3B3MVdVUFRvaGdKQ2Joa3Y0?=
 =?utf-8?B?UDByRVlmNjQ2dSt3c0xYS2draDZia0FkWUJnWTA3K3RZUjFnaGFZdkFYaldx?=
 =?utf-8?B?RWh2ODF0b01YajN5QVZHdFV1angyWU5ONG0wRTNnZ09jNEw4MTdWYnR2Q1dP?=
 =?utf-8?B?empJenMyQ2w4VHBjeE14TEc1L3Y0NTU0MWdZTkxRWVBTVjNZQXFkVHE5RWxa?=
 =?utf-8?B?aDArVm8wc1VVQnhVL09XS29FQ3lCaGJML3U2cXR2cGttUHEzaXNDOUZ0TFdK?=
 =?utf-8?B?TDZuUVNWQVZUS0c0VnF3YjU0NTAzNFpiSU1ucklMVkJyeldmLzM2RlNJbmxZ?=
 =?utf-8?B?VDlxb3hBQ2d1RC9FanRqRGcwYklISVB4MG45N21RYnpnTWRXS2VjSDQxWDcr?=
 =?utf-8?B?Mm9veXlsaGZOMEUyL3pWWTVHSHQzSzA3K0lxRGIwcStoM2FubnBnRFZra1I3?=
 =?utf-8?B?aWdVNytJU3d6dC82YWxDZURaMjRQNHBlQXJwblprdEZPTlJxeWFOTEVsZW1N?=
 =?utf-8?B?enVrNkl5NWt5WTA5TEgrMUUrdVE2bHpvQ1gwcUpYUjhsaXpwS2ZPNVEzWGpQ?=
 =?utf-8?B?SzVUejU5ZkdWd0hYcnVraVgyYzZmd3AxNkVZV2JPNXV0bnBDV3p4dEFLcncx?=
 =?utf-8?B?UjQxRXRoeUppZWJiRVRueGxpMFZOTjVLU2R1dTVTc3YzK0R1NmNESWwyZmc2?=
 =?utf-8?B?cGhFMCtBRlh2WWJ6Q1BibzNaUWZpblhEbmlaRmI1K1UvNEdRWGdOck5VMjls?=
 =?utf-8?B?Ym9RR2o0aEZUK0RXZ3NZNkJRZlU1L3pDaWFqY2xwYjNUY25RaVFpSnEyYXdQ?=
 =?utf-8?B?QmQ2aHBLMlRuTklaY3ZwcHMwckROa0JDMzdNUXpVc2hGWDZxMVk5UWRENTBP?=
 =?utf-8?B?WHFNVnUrZTFIbHJzM0doT09KbHBqaTM1QVVqUFR0NkRQNHdSWm9oS2FvVWo4?=
 =?utf-8?B?ajFjU1ZTajZqR0t4R29UM3Z4SFROMEduQ005bThqV1Y1NUJGTHFIWkt1SzIx?=
 =?utf-8?B?ekk4R2VIdXR3d2ZUTDh6bTNxYkJsYlV0bm9pbHNBM2tUMFl3NjU1dkV6Q25j?=
 =?utf-8?B?ZmxEOC83VHErMmErb2VKSmZVQ24zc1VCL1dESldmNVR0UkJXLytoSUdIbkhT?=
 =?utf-8?B?L0xwTHRCeEt2Wm9DNGdqWFZocG8wbks5UDRFbnBvSElDN0pFekRVVytpVjlJ?=
 =?utf-8?B?cUxuTlNqWkE4TzFud3B5ZVVSSWcvc3BJdFF0K2FvSVVTR0VJVGJ3TkRqcUNy?=
 =?utf-8?B?L0NCaS9VeFljMDEwWG9MMHN2bXQ3UG9BRkVselI3bWhmOVF1Tytpb29zY0po?=
 =?utf-8?B?NlVWNndPaVZEbkxKZVdObG5KdjhPZVNDeCtSM3hiellTY1NpU0c1VHB0ZS9C?=
 =?utf-8?B?dnprbXdiNy9acFQ5bGpQWWc1K1ZicGJKdUVPMk1RaHVUeUVmYnN5dzVialI0?=
 =?utf-8?B?Qjhab3FxUHAzZjRPSXNiWGpDSDVlRnV4VHkycXpXVExFUldrSGNoSStTWm5T?=
 =?utf-8?B?VFVUOVpIVWlTcXVLdm1NWGVFVFA2TnBjM0xJL2RZL1d6Y2ZCUkQvaHlzblc1?=
 =?utf-8?B?eG12dEVldzEvd203UGtVa0dpRjdyUGM1UzhaVHR5aittWVdNbHYwbk5UTDBi?=
 =?utf-8?B?MTh2cVZpUzBZTGlCeU9XcWo5QTBOempoODhRSVAzbkt3VU1SeWFsU0NtMkRK?=
 =?utf-8?B?ZERwc21hNWRjVXZlL05Fa1FZYkpHdzhERHF6dmFLYWhUcjZkR0hSYWNiOGdl?=
 =?utf-8?B?ZExRVk8rYXlkWCsvTXNwRFl0ODVYYUJkK29qVnlaRDQ0Y3R6V0h4MjB6aWhq?=
 =?utf-8?B?emdRcGpwVVQ1WFZBOGRpaXJLOUFIYmtFS0hncnRicTdyME5Lam1aeTd3dWlH?=
 =?utf-8?B?cU9DT2djVFRMZTNPdHZhcGlteXlRTGJHZ3N2SDMyaDZFRzhGMm5uT3Y5TE5o?=
 =?utf-8?Q?q9e1Zai4OJM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9107.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yy9WSHJIMnJ1UG1OOThMUTFuZG1qZFJZTUZoTThKcnFESG1lODRzSlhYbkVZ?=
 =?utf-8?B?TXRwUU94b29DYWljaDg3NzJPeEJpQXJoT2Z3YkNTcTFubkdMM09RWjM3dWdx?=
 =?utf-8?B?T2g0THhKRDAyRHhSbnloR0I3Rk5yOEsxWHZWWjBFdFU4dFp1bnpBdWlrRVpW?=
 =?utf-8?B?YkVvL09pdjJKbVZKOEdhcGJGTlQyZC9LS2tDWDNibUN5WkdoK3pGeVhOeE5o?=
 =?utf-8?B?alV2enR1SzVWUDZLaG9iWDJCa1BoZ1Uvb1hVazRmM0Fic2FPUVN5UWN0VXIz?=
 =?utf-8?B?azN0WDc2a1VXdVlDekpuMFZrV1IyVGN2dzh0YWtuU2g2ZGFwa01uZmtSU0Zm?=
 =?utf-8?B?aTR5ZmNNdG1tREF5N0szZVV6R0NidWdKVlY5VEw4eHhMdUpHdHRINXp4QzNV?=
 =?utf-8?B?QXpzOGI0OHh0bWUwQnlyZ0hnc0ZWbTk1bFNoY0RzUFNaRk82M1FkNnN6TVZ3?=
 =?utf-8?B?czdDV25FZXZuOEY2QzF1dUI1c2NQUC9PS3FEeEdNN00wUEpFcHEvM1F6YndE?=
 =?utf-8?B?elNsTU0zUXdEKzdML2tlbEJ3T2h3dDhBWDJHRE9rRmFheUo5Vzd2Y3RNVjE5?=
 =?utf-8?B?ODc2WklFUTcvWExSMFN4L1k1OTVRUFd1Rm1pazdKYnBEdkR0WDdLbmJqRkhJ?=
 =?utf-8?B?RGlUckpxb0FCQURMV1RSU05DOFNlelppSkVXQWYybGQ3djUrT0tvWjFoS0J3?=
 =?utf-8?B?b2xVOURLTHh2RzA4bkVtcUppblEzNm41OWZFQ3l5aTE4TS8rTy80NmF2azZG?=
 =?utf-8?B?NTkydjFYWEVqcGdCUVJlSThCbHRsNmJTditzZXlEemlJRXp6czZVTGRuYmFH?=
 =?utf-8?B?aVVtN3oyZTJoZVNhSlU5TCtFMWltTDdDL0xVVzJTZHpJK1BmSnd0ZU5uaVll?=
 =?utf-8?B?d1Q1WUZnc0hMYTF6Smh0OXFFQmpXd1o3bm01MjVlbloyK1p4c0pJV0lDYmcv?=
 =?utf-8?B?NXVSdHJtNXpoamUrcnZyMmlVSmJRQ2s0MmpvQkxPdys0VDk1S2VCSFRBTk9t?=
 =?utf-8?B?bTJGQVB1S1ZvZDcram5ReSsxQkxwVktZcTlzeWdEaGgzTGpoVkNvbUpLRFZx?=
 =?utf-8?B?eDN4WHIxU001MVZ2dE5SYXUwT2hTM0FLMFpiS21Pb2p0OFBKc2N5aHM2NDZL?=
 =?utf-8?B?NWpxMnJDVEVVVVdiZG12RkJBM01QM3VOT29adE1CdTB0eGpSQ1ZLUGRrZndP?=
 =?utf-8?B?dENiMFRDL0JvRk0xUHlGSmNDMGd2d2wxU3NzenZ2dEdiK0FkMUFXb1ZUM3o4?=
 =?utf-8?B?aUxtZTh6WVNwd0dWSkhBZzRpNGVYemEzRExYbzRMOE9Jd2hGeW5mcDhJczh1?=
 =?utf-8?B?bytjTkZvWTYxdStmU2tnYzY1c1lSZ1VKellEaDAwYzN1aWYrSXdtMjlpY1lx?=
 =?utf-8?B?aFJER0JRb1E3REs0ejJYanFvQi83V2lvenVSVWNsS3I2MDJlaTNjTkh6c2RP?=
 =?utf-8?B?MEJQSEYzSU5WVDh1RzdmcnhaNFZ4SkI0NUFvbVc1UHdXYkNLM3ZCeUd6WFVr?=
 =?utf-8?B?WTRqMDNjZmpxMjgxTXh3T05LQ09pTHlqTVFGZEpUbkgxWjRBc2dMQlFsVTdT?=
 =?utf-8?B?YVJOWmU4ZUFUTlptMWRWUHhRNmdRd3hvSzYzZmFwRmQvdkVKM1ZEQ2pXakFk?=
 =?utf-8?B?NTVrRkFPOGJtSHlub0t4Y0QyYXVpV0VsNmFleVQ4NXJLWTNCck5ielU1QVlw?=
 =?utf-8?B?MnlLSkVCdDhmSTYxYWsvWlBqNzNxbDdGUVBFV2ppWXpNZFZDWnhXa3dHci94?=
 =?utf-8?B?UUZ1OWo2ZmtQbURlbnR2eHBIWTIzUFFQb2pIdW5KTG5XQStOcE43ZVZvZzRJ?=
 =?utf-8?B?Tmc4YmNjUlRwSU5RRE1QMjRrS0JHcTU4UktyWllOcXhXeTFtZVd5Y3hFZlFL?=
 =?utf-8?B?ckd2cTVOdFNWbEZGK0k3TzRQRVpkQzFBeGJjV0kzUHhUNmhwOGJibTBmWUJZ?=
 =?utf-8?B?SWFOTFY1OFlTaFB4V0VmQUxFekp0M2pKSi93VllraFp2RDM4RllOMFRHbkY3?=
 =?utf-8?B?a1dkUGJLajdBVEd6NHpQMzZzblJybjB1YVNzNVFzeGRDeVJkMFpDUzRteXNR?=
 =?utf-8?B?NERmOXZ6SEF6TUJvRFNpOFR4eDB5RVY3clNZbktkdk8yNnkrL21LcEZSUE5H?=
 =?utf-8?Q?c8clsSFVIsS70cSmRuVWYRrrA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 910bf96b-d712-4020-844f-08ddd343422b
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 10:39:58.5062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4FI+NHSlpUDAs4kdM7Yr0QOYTwudVe7JrUPpJu4NhQcYIu9Xe7rNwyKYYCWV3zret2rNxzeNg/uf6qqwv1Irlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8189
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


W dniu 28.07.2025 o 19:31, Kamil Konieczny pisze:
> Update help  with description of '-b' blocking tests option.
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   scripts/run-tests.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/run-tests.sh b/scripts/run-tests.sh
> index 1fb9be478..12c68ef5d 100755
> --- a/scripts/run-tests.sh
> +++ b/scripts/run-tests.sh
> @@ -150,7 +150,7 @@ print_help() {
>   	echo "  -v              enable verbose mode"
>   	echo "  -x <regex>      exclude tests that match the regular expression"
>   	echo "                  (can be used more than once)"
> -	echo "  -b              blacklist file to use for filtering"
> +	echo "  -b              blocklist file to use for filtering"
>   	echo "                  (can be used more than once)"
>   	echo "                  (not supported by Piglit)"
>   	echo "  -R              resume interrupted test where the partial results"
