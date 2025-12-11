Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AE7D3E78C
	for <igt-dev@archiver.kernel.org>; Thu, 11 Dec 2025 04:00:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049E110E06F;
	Thu, 11 Dec 2025 04:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WmDD/p3M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE7310E06F
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Dec 2025 04:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765425601; x=1796961601;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HMoMJ7Z9Me3Jq4xkIs3kH1+j4/7qkVTkvim5OxRadw8=;
 b=WmDD/p3MLGd1cBHtiEfIuhbAXfVMxWHs5JOF+doZIO66W9VYbZB0/EMO
 Zi9HIwIr7J2VB8dnLQd2z9p2G45n4bUT4KAtdPIAxO8kmY9SM6v98tCQM
 BV6E8RkKjpjsmlByk5rxgrQ439arL3LcofM7yRJOs5GV9SCTSZtYI5vVT
 tMKcWAqwdCFBTWnxzSJrLyUE9+Q7+bFDvotzOq5VUNuVPOo5EMpLGUYv1
 U51a4NQEQAvRSLv4/Mn5tlfS2qh4paRQL3W5ODavdhM9G4loo5O2t9XQv
 4oVleKnCaL8mwXE2p4Mo4I2caC4imYevjmQC9+28NazagXVbvZPU4VeyR g==;
X-CSE-ConnectionGUID: 3SWdFfIqQ1WS2I3m9OuBCw==
X-CSE-MsgGUID: N/FC21ZYSnuLF3JyVL5ELg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="69989618"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="69989618"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 20:00:00 -0800
X-CSE-ConnectionGUID: LNAggyevQXGiFaw7lu6yLw==
X-CSE-MsgGUID: QCzK4mt0RyqZH8dAl5YjHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="197500670"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 20:00:00 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 19:59:59 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 19:59:59 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.8) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 19:59:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ME1JFR2j4fDewsURFP7skd7PE4087Eg1RGLRdYIDmhUu9BMP3JitMtlnwGtBe65SKWVkeOcTTnY1GeaqrB/wosS9Xnf1QI7JJkvPs1rqgAh13ID3YgHuO5uf+DQYnTRmoJB8YyZrLhfdv5L3HjeWU+pGNEPURzd9oUukDEXWc9k3LGecm/jdxFWTLmGO5ZWNcNLBNHq2jVdYSUSYfvXaXY/+Aq+rifEWC9CcDb2S05N1fOZMQXLK0fCfWeF7pG38ERcImUBzYaVqNn2MJmXJovsq1v21I4n7xIlHlokosX6b/9s/GbBBETK2OWoG238pvjn4RQlU8FsFH6Yt+Rs6+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOgi+J8nH8JuFj86t4mZ5q2Cp5ks3cCIAcqEGQ6foSI=;
 b=f7IZpsmUD7stk4ExlPmxgjL03YiDz0mlb2hJYcw/sSekjgXrVA6EE9TR8G2YE2uijiiO4sM4hFbDIZmeYyTOp5ICmiR5wa/x7rMNh5MyHRDcQrY1Ks1HrI3q0Jk+M6na6BdvKjcF2cyAa8uCaM68H6GEqgvBXM27epJenAeV79JqUJRwukY0emw5zf7obd0f+yUNMVvKhgsThGxwQT8R19mM3TcOv8rU02x+zTmKtTkwMp6wz1JB4GeOX14ZiFF6J7CV0udrqSg6Lfkg379ZwY9Oz4jn9mk0V8wWGIhePh1rjD8NhV0sHN6cN4iOiv2iz47cULmPyWSxzWMMMlzWjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by MW5PR11MB5762.namprd11.prod.outlook.com (2603:10b6:303:196::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Thu, 11 Dec
 2025 03:59:52 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%5]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 03:59:51 +0000
Message-ID: <9baa09c9-928d-4b95-914a-d9c988b8cb18@intel.com>
Date: Thu, 11 Dec 2025 09:29:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_exec_system_allocator: Cleanup
 compute test
To: Francois Dugast <francois.dugast@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
References: <20251204113726.567142-1-francois.dugast@intel.com>
 <20251204113726.567142-2-francois.dugast@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20251204113726.567142-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0204.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::16) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|MW5PR11MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: debe1c8d-f32f-4728-238f-08de3869bc51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWFJZW1LZXlhMFNMZzUvR1FqSEw5T2dRZzAyM3YwT3ZtdXNjVHFvT2lGa21F?=
 =?utf-8?B?T1BPMlE4MHJPZHpXVWZoWWRpYVF1UHVVTU0rL1BPT09teDIxdFVzL2o1WDMw?=
 =?utf-8?B?WmtPQ3I4Myt5SnN2NGZiQ0xMWVZtQVNLK3prU3pwbWFoSjNBWDVLdzBmRkZs?=
 =?utf-8?B?SWhudk5ScHVXTWo1Y0dQUjk5NzFsdDk0ZU5CYjJ0blpvV0JSSDBNeGN5MnVJ?=
 =?utf-8?B?RUhTWXlkSWdEeThxTHYxZmNpVXVMb0Y5ZVhyWnhrTUxLdG1LVEFaVHRRTjQ0?=
 =?utf-8?B?MVhTVlBXNmZSNm5JbEVsL0hZOGkyWGw1dlFTSU9yR3NLS3hFRVlrQmlqZ1Y5?=
 =?utf-8?B?TTFWeDV2TmtZOWxLdW9FeUJzclpxeFJDTDNkZHBRSU9Mczlxb3dJem9pZ1dM?=
 =?utf-8?B?NmlTMG9jTS9JbnUrLzRhQ2xNSUNDZDlaanBuZmEyZENSN2JYYm5mbW9BUmU5?=
 =?utf-8?B?QlU2SFBKOFZDOTBMb0NtOU83VzdkNzhzeG5ra29Td2xnNG0zUVh0VHk4c3Bl?=
 =?utf-8?B?UzIzWUc2eDdxMmJVUWRCaFdYOU5tUGFFVXZaL1VXM0lCblNWUXF0VmRKcnpx?=
 =?utf-8?B?S1RkNm1RZXFWUEN4RzdDaVpXZmtZR2xFZFlaLy9MSktBcEFLSE9RZHhjenRH?=
 =?utf-8?B?WlBlMnpQanFQYlFYWWR5N3dzOGtHTjMvdTdjb0FHQzUvczJUbjhnbVQ3bFNo?=
 =?utf-8?B?UmIyUlJjcythMnFiY0RkVkRXM1BYWkl2RVNTTE1xRk1hWnNxbHNEaTZzenp4?=
 =?utf-8?B?aitqOTIwTkxpUkJmbUx3bWJLcUtjTDEwTXliTStoSVlaa3k3YWZBWHFJdElW?=
 =?utf-8?B?d2IvZ3dJL2NreUtaemlHSHZhVm5CRXRUN0k0U1hWK3dHREdPUmQ3MWZqb3Jh?=
 =?utf-8?B?R2tmYncxY2FkdGx4Um9UaHVFQmtNRjYzdHBNL3QxbDJXbmRvMEdJcTcrMTUw?=
 =?utf-8?B?UTFvQUtFaXMrQzFGMFlHdlIvUHM1cjhMTmhubE5xYlRQR2thNWt3eDNOU280?=
 =?utf-8?B?cVVhRVhXZVkxWnY2Tm5tTGlhN2FNT29UcVR4MTA1S1YxSFhLVmJCZ1g1SjZ4?=
 =?utf-8?B?OUZJMjJYUHVLdUVoUGI1VHBYNCtEbjVEUlVrQ3UxTi9vc1B0M25lQkp0R25P?=
 =?utf-8?B?aVRIR2JhZE9COWtmTUttL01Vc2tYVVJoZWQ4WUsrK216S1N4N0pNRlNZV0Jo?=
 =?utf-8?B?UEorU3BiWWhVemJDc211QUs2YUhlZlpnVzJzWDdJSXpkdFNrVmtnQUx5Y1pZ?=
 =?utf-8?B?V3cvbG9tNkNuNWFobzlIb3VzNmc3SVVoYlYxUVFMcmxkQVVIQlpkRUVVdlUr?=
 =?utf-8?B?MWpNNHMrRVBnbzB5WXBvMThpWUR5M1RhWGRzY242QTQxMnJPb1J0ZXhubUtF?=
 =?utf-8?B?citEbEprT3RISzJFeFFtSjVpZTg0S2c2QVNYZ3RQc0JQbWtGSndsUzFJWm00?=
 =?utf-8?B?NGZpMlg2aGVqTkRZazlHNGZLTXdPZ1FQWktSN1B6NnJUbTd2RGRqRzZQcTdQ?=
 =?utf-8?B?cVNxL29IMXZYem82dHBkakRoZU1CR0NYb0lYTjM4V2s4UE9ZcXpUQnpsOGZZ?=
 =?utf-8?B?UzVtUFc1NnJXNjdoNU45UlVLQ3AwUVh1NkhodFdIZjJVS0NOVTVSRE5qdzhz?=
 =?utf-8?B?d1VLbXBraVZvU1BZZlNMZ2hXck1jblRwNGlCUW5PbC8wV3k0ek4rdWdMTGtm?=
 =?utf-8?B?cWovajBOZDBkbGVrdG54NlU0U0R4TXNLQ1BLbTVyV0oyNnBiZ2lrc3pLVzAx?=
 =?utf-8?B?dFFLUWhISlY5THFYK3FDTXNvZWg1aVpFUm9IM09UUEswTG5lL1FBQWFhcnpL?=
 =?utf-8?B?WmpFdUdyNVY3cUhiemFydkRMd0paTnJHd3lDU1ZhOE9LeTAzbjlac0RpMWRu?=
 =?utf-8?B?SEVCekJrTnJkUC9wcUVBTDJQWnUwVXowb3Q3MGhiQ3M2ZWtKbmFDWEpCbWw3?=
 =?utf-8?Q?SFv7RSv1d0uI2FnrVKSZpA/6eozjc9+B?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2Z0bVlHQ0Zrc292NEw5V204NWJvZzhLVXRFNjFkK3RLN0xNMVNxWHhzNk82?=
 =?utf-8?B?K3IxS2t3a3BOa0JMNGFsaThhZGFJQWxYQm84KzhDVEMyTlBEMmQzMVR1a2lN?=
 =?utf-8?B?WDNhMzlEa1pBc3ZZNU15b21QZnplOEZmOExNRDhlK2lUU0dhbGVJOFM4RG1u?=
 =?utf-8?B?ZUZZeG9xenR1T3Fxa2JXVllJdm5jSm1vNmlxazJPSlF5ZTgxZVBodzhnL2Jx?=
 =?utf-8?B?QmJGOXZyN3NVZFZ2RE5ib3dPQlp6VnlvdHIzZ3o1dkM4dFV4L2R5WHQyem9M?=
 =?utf-8?B?MElwL2FRN1lHZkZ6a2xodVBTb3FDZVFPSzhIWURBT3FPOUg5aW5FWjExd2RN?=
 =?utf-8?B?TG1CeTM3b0VzcWs2U0dVTklmRnVKSGQvK3pEQXdwU1ZBVmxFa0srNWJzUG44?=
 =?utf-8?B?b21ucXBEQW5YRW1jTVZRc0VaRU82SEVpN1Z3Ymc3cGR5UGljTUhQQm9NVlE0?=
 =?utf-8?B?aGJ3TzUyOWZselB6OWJxRXBlZW82UnFDQzcrYjYyMFk2OG5zdGttTU9ySC9a?=
 =?utf-8?B?dkVodzA3TzgrS1MwdzZlMzJMWGJlTGlGRUQ2Mmt3WjJFaEUwcnFTb2I0NWwy?=
 =?utf-8?B?T3MzU2duZVR3dytmdVVRd0theEEyaVdxT2RvV2tCUE9nNWFVMm1qeCtEckJT?=
 =?utf-8?B?REEvaHRsQy9NbEdVVlk1ZTIxSkpNdGl6c3J3NmpNVWxkNE9CZTlvNWJVVXhX?=
 =?utf-8?B?L05MWmtnekdzekwvRGg0QXJmYTJWcWx0ZmNRMmdZTWtMb2FJbTJzQW8rUTJD?=
 =?utf-8?B?UzVROW02U0Z6bXRhbUl2RFlUNVVkWjMyNUsvcjVvR2Qrai9HTjBldkFWNk5i?=
 =?utf-8?B?cEQ2RU1ZWjFGb2FGSlNuRUVmdXloWXRZeVpiMm9hOFk4aGpTUGdUb09hWUlw?=
 =?utf-8?B?ZXl6cEZMbVdqK1kzZlNQc2NGTmxLRlNzVlBVRFdVNi80T01OZFJHMzVTTFRo?=
 =?utf-8?B?ZGVsRGhPQmpPZUp0eFA5a1NLbmFiYjdMS05MZlRHeDBqUktWVzFxeDl2cU5o?=
 =?utf-8?B?UEwxUkJkeGlmc21yRnFhekhmRmEzWGtUTmF2SmNmazA4OWNadnZZRk52ZVla?=
 =?utf-8?B?M0krVEcwRHJGcmhGaUp4YlVnSm5CY2tVSE9FRmh4NFpxdFZFWlpmaDFuTEth?=
 =?utf-8?B?aWlNcDNibDJTRFUrM2s3S0h2WlpqZHN5NWtPeFRlZXBxSzIxS2dFQTA3SHVO?=
 =?utf-8?B?YUxwNGhOM0tBR0FGUkNSUXhzWXBzai9RY0pFaGpVSkxia3J3WmFQYjJUc0Zw?=
 =?utf-8?B?TXMzZ3hqTzM5WTdHS1hFa3VQMDlvNGFZSWV3MUJ2dkF6aUlSZWdxcGsyS0M3?=
 =?utf-8?B?ZW1hUjllY3dtbG9ENFNDd2pZK3BxdFMxNTRlblBVSEU0Q3VoaEsvdVoxVEtO?=
 =?utf-8?B?NEFFZklVK1k4Rjc2by83T0xDUU5Hb0tiZHhzM2tYWFpvdTNkdkZaMHFVbDBL?=
 =?utf-8?B?WDlMWE51T3oxSnpzNWF3aGpQNExRUFcvV1hlWlRVUHV0UFF6VllYdEhOajJy?=
 =?utf-8?B?WllRb2ZPMnd5MDRja2VmSnVmTURmOGMwVk9ISVNycmNyS0EyMklJZ3BzNTdz?=
 =?utf-8?B?ei8yVk0wVjRaSXZ4V3R4YVRid01UZW5QL09pcmFIZkpCQkpMZDIxYlNLMFFK?=
 =?utf-8?B?eWNBRGJPaEV6UXhqWTJBZnFweDMxTCt5UkJsM2ROK0VXS2RJdUc3ZTdWK0lT?=
 =?utf-8?B?RUxVR2hOTFpwMitTcjZ0b1l5blJ1UWdtWkhzcXMvT3R3QWNMQ3dudnNZVFJV?=
 =?utf-8?B?ejUyYm9uUDFzYytQd1lvMkV0VVlqYWlHRGhiODdYTGJYWklmV1Q5end2S1NC?=
 =?utf-8?B?NVFiQ0NmbHdvUTRyVlE2WnZMdW9rblViZHd4eUxrRDdEYXdoVHVobnlLb2t2?=
 =?utf-8?B?c2VkRzNsOEZ6MGNVSG1xTnRxRHAwZmR0c0dPeEkzZ2JoWlh4dkx0SEIvYngz?=
 =?utf-8?B?c1gzZEVEdXUxdGpnNndDb2RIMUw0U2twL2NLVEZ6WFdTWmpPZXdSeGRQWllp?=
 =?utf-8?B?NW1VU0ttK3ZhQVQvMk5zb0dzREsramJvOElkTXJvV2IrUUdlR1RJWDEvMTc4?=
 =?utf-8?B?VlJkOUZLcWtxRkxLNUk0SHg1WHlkTlNLN0tGVFlWVDJTSmlUSW50RTQwUTVs?=
 =?utf-8?B?c2RwWkdhWndMV2gwR1kwb2RDNXYyOGN3SzJnWDdUUWhwVGlsN3lFT29VbStj?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: debe1c8d-f32f-4728-238f-08de3869bc51
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 03:59:51.8767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYpDkqwwjRoBwBfmstXifngdKa6CfHzaQu7LAX8brnQh1ZAGlwqllbXBKI/+8SZ+tkm77D4vWTZYHcNOAEJyQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5762
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


On 12/4/2025 5:05 PM, Francois Dugast wrote:
> Cleanup the test that uses lib/intel_compute and SVM to execute a compute
> kernel on arrays allocated on host, in preparation to add more tests.
> Remove the result check as this is already done in lib/intel_compute and
> remove output to simplify the test as it did not add value.
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>   tests/intel/xe_exec_system_allocator.c | 14 ++++----------
>   1 file changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index c54a52690..43be307fb 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2189,10 +2189,11 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
>   		uint64_t sync;
>   	} *bo_sync;
>   	uint32_t vm;
> +	size_t aligned_size = size ?: xe_get_default_alignment(fd);
>   	struct user_execenv env = {
> -		.array_size = size / sizeof(float),
> +		.array_size = aligned_size / sizeof(float),
>   	};
> -	float *compute_input, *compute_output;
> +	float *compute_input;
>   	int i;
>   
>   	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> @@ -2201,23 +2202,16 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
>   	bind_system_allocator(&sync, 1);
>   	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
>   
> -	compute_input = aligned_alloc(SZ_2M, size);
> +	compute_input = aligned_alloc(aligned_size, size);
>   	igt_assert(compute_input);
> -	compute_output = aligned_alloc(SZ_2M, size);
> -	igt_assert(compute_output);
>   
>   	for (i = 0; i < env.array_size; i++)
>   		compute_input[i] = rand() / (float)RAND_MAX;
>   
>   	env.input_addr = to_user_pointer(compute_input);
> -	env.output_addr = to_user_pointer(compute_output);
>   	env.vm = vm;
>   	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
>   
> -	for (i = 0; i < env.array_size; i++)
> -		igt_assert_eq_double(compute_input[i] * compute_input[i], compute_output[i]);
> -
> -	free(compute_output);
>   	free(compute_input);
>   	unbind_system_allocator();
>   	xe_vm_destroy(fd, vm);

LGTM. Let Mattb provide some inputs on this.

Acked-by: Nishit Sharma <nishit.sharma@intel.com>


