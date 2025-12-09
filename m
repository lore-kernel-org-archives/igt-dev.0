Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FA1D1CDC6
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 13:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4269310E5CC;
	Tue,  9 Dec 2025 13:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cI6SdQRD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B3A10E5CC
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 13:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765288487; x=1796824487;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uzplX95/hlWXNsqf+R+JNXkMe5u3d9a42ygaXJMWYCk=;
 b=cI6SdQRDDG+gzIMUMYWyu5dxQBLNWIHnRltqDTCdqWVaHFJhEMj/7XSu
 NdHl3wS+5ORD9vM7BX170IURoUitbXKP284zPXqxAfpaIu6OT8g3Vja+d
 OcMTLdU7Hr5HB67CjUBau/ZcsKvkkJSK8kp94VWmkZ22uMwDpbT7WsRsJ
 JU7+i/fw4uWOdBaL7tiURWE4w5xLXTzDRIcLv8qyPfeAl38IIbrrLBnrt
 ja7ocV6xSfxb5sblw4EeKmN1uqdU06V/pRcC29D9dUbVB3XT57B7gdPat
 Lw3sWaSNaykwLPj4BJh5CEOK6B7UEsTfmgxHMoCYLyeU1j3idONjM5LaQ Q==;
X-CSE-ConnectionGUID: NRCMEhNKTX68xOm6hrZZ5A==
X-CSE-MsgGUID: 3oIuLcBPShKXSKPD82fyyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="66424379"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="66424379"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 05:54:47 -0800
X-CSE-ConnectionGUID: hf7dSn8iTqW2K0ibhA9fqw==
X-CSE-MsgGUID: LpSDRBU8QHSbAQkRfrZ5qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="200712946"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 05:54:47 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 05:54:46 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 05:54:46 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 05:54:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EpUCaDBXuaJ7grB+6KQKsmc40+ogw+3/ci1r0DT0OHMGgrH0Phs+p/Rw49rpRb+9i8BUOfA6p2lTpm6kxUICwbT3CXvn8nR5ubUUiXDXDu1x/ntjh5E/c1c8+EUqSjdkw16vhvIg7RkA/Hej4Xd2v8B/sU/JT/Yl7NkW+bpm8j2vkOvjboZZkCaVv2xcrsDfHwY0R4GQxzJSFPGdbkMZZxlqCRnjuzq13q6OHKfl5VfDv1aDxre781JyecLM+ySTHlss7FEajOCixsay4FIEilFIM/duOJomOggldNSb0iIRTk0Yp2S/4wbX6AK6L7nE/EHDayko68J1iaTgQCR+/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXtCqMYees6LTh7RIJ/4tQOHuUEirQXrNYKUFmnU7kA=;
 b=r/l2vdY6yrFs85BrfVtH/UeB/Hm/BH1scvyjfxF1ZO0YkKoBrO9cdbaZqAjdGWcTS13/Xuih9fmQNlnMyj20fTvrEBfNIUaQDxcvYHGyQ6AjbfzV3+vtFFaIDs7aPKmEB4kxHtHr9xwWmhsoPbnjv4/+UdGp/343E3TRh72sXpXf1csga/GYuEFXunY9W4p4cjJ+//gPQScQIYcmNZ3JEBuCX2WVNq+F8aDkX/R8x24ocb2ieaO251tc2VDUbgec5IHczQ0N7LYMP8QUQ/fnNCt5UOEdva4tUWu6hh0xJwNo6wWjfeVPrOrzyzkusjI0XHEbYNC25AMfbigRQSOJBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by SJ0PR11MB6768.namprd11.prod.outlook.com
 (2603:10b6:a03:47f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 13:54:43 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::e17c:d0f4:db8b:d7e6]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::e17c:d0f4:db8b:d7e6%3]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 13:54:43 +0000
Message-ID: <95d23c1f-4b95-497a-8157-01b9bd06dce7@intel.com>
Date: Tue, 9 Dec 2025 14:54:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] scripts: remove symlink
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Rob Clark <rob.clark@oss.qualcomm.com>, Ryszard Knop
 <ryszard.knop@intel.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20251209125130.22657-1-kamil.konieczny@linux.intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20251209125130.22657-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0095.eurprd09.prod.outlook.com
 (2603:10a6:803:78::18) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|SJ0PR11MB6768:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a437b6f-53f1-4610-4b9b-08de372a8144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mmt2aDFiRmpqWFVISnFYcG12ZUNPVVY1UXIvaDkwaFg3K1R4QlA4Z0ZXUGdi?=
 =?utf-8?B?cE4xa0VrQWtmaHQ3TXBCWVNaSkZIZmV2N0FMVEVCM2I3NkRaTytkcitOVkw3?=
 =?utf-8?B?Mmozb0ZEOUwzN24vNzZLMXBIME9CTlVXK0Y5blo3QzZuQlJ4ZDY0YzZBclhy?=
 =?utf-8?B?RXk2Nmo3eTNEMHlacDlhZXZ6VDZrUmhjTDlEUTJ6MU1jc0NXNXJNYWsrYy9O?=
 =?utf-8?B?dXZSR25ZQjREOUswMmg3NDJteE5UZXJVS3dzcFkzckcrTG1nSk9FYjBrckZ1?=
 =?utf-8?B?WWJoUjZHbS9YTFFKQ2s2NEpHeWJjNVFMUGhJNWtzU09wUThLVzNXRjBKMlU1?=
 =?utf-8?B?L2lZWE1sRlVkU0l2TWVEQ3JtWDRHYms5RHppQVIxbEJYaFIrN3lXZlZGdU8y?=
 =?utf-8?B?QTNUU3laOE5TNW9xMHNDeTVSN2F1QWZ4NjZOSHZKZURBU2R3cGhLYnBoK0Vl?=
 =?utf-8?B?VFNBVDZtS3ljNFphcHROdjJsOWo5clUwTUE3b0lUc25XMlo3dW92YmNXblBy?=
 =?utf-8?B?cm9maEJQZis0NnhwMXAwWXh0WHFpNEtwdTdjVzgycHh4ZmZjWVZUSDRBSjQz?=
 =?utf-8?B?SjJDQXRkbUxKNDFFUzNRL012ek1Db1JJejNia0QybUhlTm85NUFiNDlZSGNZ?=
 =?utf-8?B?eEhBNjRwcW9ab3c3TGp3cHFyWktHWWVLQU9YaFFJMk1OVDAvaEVVR0I1MktL?=
 =?utf-8?B?WUdKb3JzaGluM1o1Z1lETkg0ellFY3VuRzZlZEJLMDI1T3FGSXJRSG1wRllu?=
 =?utf-8?B?a2w1c0pFU1FuUWtHMVEvLzFSemxGZGlzalRRS21vc0c3QllCQnVvM080TG9V?=
 =?utf-8?B?a1czZEFsQ2kwMGJTVWV0dkFYS2xOZTVUcUtvS05ENGkvMEIrRFZkSmVMV3BY?=
 =?utf-8?B?UjMyRlB2SitYUUR4TU5ISGdZaldkRjg0bkZnS1RkalNyYjRFTHZzWDAyZnNY?=
 =?utf-8?B?Wi9zMkZqaklYUlFtRkhFVXcra2pwc2g0WUlaMzVrVVZZK21TZVFtY0FuS0JJ?=
 =?utf-8?B?dGphZU5MQWJhamxzS3RCc3Z2QzU0T3RZWEYrSTBVK1NXUnBUK0gwY0tMWVV1?=
 =?utf-8?B?bVpFQUhuZm1ubk9LaTJpY21BVXc3SEVGQzVLZ0hYMWQxNjhTMVNKdFYzY1c2?=
 =?utf-8?B?UGhTM2tHYTVYa3V4SGZUaEh1K09zM1JaWEFiek8vc29kQlZYeVk1ZlhER1Ew?=
 =?utf-8?B?cFhwUXQrbm5NdEdxRkhFdG5sNTc5bHhGTmtMUHJ6LzVRZ0lmQ01tVG04d3d2?=
 =?utf-8?B?ODVFdFErWE1EVzZTU3M4UnBsWEV4NTNpTnRFbytjRW1rTHRsYkoxMWZQanI1?=
 =?utf-8?B?S2RCRHhKSm1xdnU3UkZHSHNVZlMvNW9FUUFBdk5qNzJxZUhnL2hnV3RCNWx6?=
 =?utf-8?B?Y1ozZXdTc2FScnZCSXZ6WW90bnltd0RWR2ltcU5rS2dtU0h0MVJPOUJTdFdK?=
 =?utf-8?B?bkgzNEF2dkVDQ2szc3N2MklvRUlndXRDUlU2RWZBemJFR1BMb1pEMkUzSVUx?=
 =?utf-8?B?bWduM254Q3BFNkR6RUxqb2d4L2RiV0QvaTE1U3MzMHN6S1ZkME10M2g4Y1l4?=
 =?utf-8?B?N1gzR0V2RFBudGlHd0RtZjVLUDFQajRmWEJISElUd2IyU1hrenVOQUdBZzVQ?=
 =?utf-8?B?S0k5Z21Wb2M0cDZJVDhNdEovelB5cmRoY0pZaThQMW5pWjU4dVQySlNsWnVW?=
 =?utf-8?B?aE05VkU4dVVNMFN1eXV0ZDV0Y20rREI2d09tRmwvbktmVU95MXFuKzZtM25u?=
 =?utf-8?B?ZVRLei91Wm9DeElsUU55MWh3VVYwYS85V0FIcVFKcFlLM1prcHBYa3hobGlS?=
 =?utf-8?B?RlFaaGJDY2FaYzllSGlIbE5uanAyR2svNDliendQSDZ1NGxXSXd6MFVRQ2x1?=
 =?utf-8?B?OEVpUXVZWWM5ZHRxbk92ai9SR1RHNGJMSk95cXhiZ3Q0WC81ZldCMm9haHM2?=
 =?utf-8?Q?ZF1q4HvZP5mQAXYOE9f++fZipNyws96Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm5SOFhmb3duY2NaRlAyeVVhNjdCUGZhUjFpc21jZTlNNnB5clJxQXgxVzRU?=
 =?utf-8?B?b2ZVT0g1MzNmWGNGalpRVFJodUJPTTA4WTZpQlhMNkVicXhIWTh5V2ViUXJU?=
 =?utf-8?B?aEg2NkhDZ3ZvRkpmV01ZSjFHZlVsS0F0aHNHUkg3VzdXVkc2anZoaDYvT2Nr?=
 =?utf-8?B?V0N1YVlVVmpxSzVNZ29mQ1AyYjNWWmp2SERPOHIvQWdQTSt0dzVPMUtIdGkv?=
 =?utf-8?B?Q2dVSTl4dG54NllDUkcycFlTbDU1NXVuL085c3BZMUlxbXMrcW80Ym9jNkgx?=
 =?utf-8?B?cEUyS2E1Q2d2ZVN4Mk42UWNWd3o2TitCdktneFhabVZaeWo2cGNUTDdkUEQ1?=
 =?utf-8?B?TEIvZjNhd1pQaFhWMm5Qc0RNNlVsT3FVSGYrbHRIVjQ3S1RzLzB5bm9pUXVv?=
 =?utf-8?B?WW5kNzNXbXU5YmU2dWQvUUZCM1FKcEMrZXFINk5ock42YmgvM1owMUtYb3pQ?=
 =?utf-8?B?NkpMMnNLTWU1QTlwMTlnTDNNeC9tSzBBem4wKzQzYkVEN29vcEQ1aXBPZ2cy?=
 =?utf-8?B?dTUvbml3alhXSU9sN2VrTEFNTWNhd1hhemhPaTlQOHpXa1FPVXYyTldWZmh6?=
 =?utf-8?B?SEY0dDYwRWUyZzJ6SWJvNHdZZnU5ekRzWEQvS053RndvaUsyMVI5YWRnbUJj?=
 =?utf-8?B?S0xTaGQ0dS96OHNPMDdoVm15QzZCZ2tnNlAraDVOcDUyQkpTNGNQV0hYalFG?=
 =?utf-8?B?bHV0elQwZ3FDT2swcFBYY1RTS0JhZFpwS1Aybjh4R1gxdTlkSkxjSkxPcEVo?=
 =?utf-8?B?endFZGFCaXhBZUN2bUdVaUd1Z2dHNUMrNXp5UU1oOEpkOVkxM0dQV0pGaVds?=
 =?utf-8?B?aERHZEdiVlB5eHFhcFNNRWRkbmc4eWV5RXIvK1Faa25RMkU5eDFFaEdCaHpl?=
 =?utf-8?B?UW9QQzdsSWdDalZ5L1BxM09CNmM0R09DSlh4UHdqWndneHpWMUs3VVNxTWFq?=
 =?utf-8?B?aUpZL1kyT0ZieFRNdDZBOHoxSjg0RCtNTFRlMlNhR2wwdi9EUnc2bG90T29R?=
 =?utf-8?B?eGxoZEZJbU5Jeitvd3RabVBvbGFUZFNyOWhDNVpPWkdIVzg1RmlxbE5qUjZG?=
 =?utf-8?B?QjFoaWliYnBzTGxtL0J4d0hSWlhYcnZaK1VZaml2emtZZnJQNU9yN0dNNkR1?=
 =?utf-8?B?c3o5ODFCQkJLRGRYS3MwczVCb1pSb1daajYzVmU5Y1g1Y0dVd3JBVzROY2dt?=
 =?utf-8?B?QkgySTNpZE5KYzBKNmN4WkhZK0RrZDZXSHhxd2dtRFdSY2xGakNCRDcvbC9k?=
 =?utf-8?B?emhTUEx2ckxZWko0YThpR2ppSWNOMUVxcFRKeEIvbjBiTFczdldFejU3MU8w?=
 =?utf-8?B?d2xnNDhZWUVHWE1MMW5tWkw5d3lCSTFjRVZJczA5N1owQ1ZGRnM3aEVwT2Jr?=
 =?utf-8?B?TWlua0UxQzZuOVZkMU1kaEwzVGVRMTJHcDdzbGtpWFYyV3BLaXlzOGx3RU9C?=
 =?utf-8?B?d3lQTlE1T1creStFbWZzdlE1VjRFRHhpWjRtRUo5UVJlTFNLdy8zREZRWGZk?=
 =?utf-8?B?UnN6TzdLLzFiRnlpMnB0aElZNGpnTXMrUTFQRTV6ZERWNWNuMFVxVEJyUktB?=
 =?utf-8?B?aDJ2Q1ZyY0dCbFRTcWFNbTB4NUg1MXBsZEh2dWZpMFlKeTNBU04vbWhLMzFk?=
 =?utf-8?B?UW1GcG52cEljeWN3dmx2QldQVXkya1czNG5WQjBZUm4yTXlEWEg1Zi9Vcnlw?=
 =?utf-8?B?by84QkQ4aDA0c0kyam5FREZESXZKR0lnZklxZ01zbzE0OU9Gak5ETmV1RFZX?=
 =?utf-8?B?UXFEaDd2dFBEUnBQZlFESjE2Wmpad1d2M2prK0VCVDFzaHdhYUJsSHY3dHk0?=
 =?utf-8?B?emFtdU5jeVgxNXIrb3VwSGZUYlpTanRwcjc2QUZCd3VkYkJicjZrbTV0ZVVM?=
 =?utf-8?B?aWlVd0tlMjArOFVrOEJwbTc4eExMQkNmd3VIcEhoL3VQMk1BcHBLTHVvajJi?=
 =?utf-8?B?RURDNjkxMFdyT040V1pXRTJaeiswNVdrZkkvMHhDTFFUU0EzaVdZRFhYQTQz?=
 =?utf-8?B?L2RTTnFuSmtzYklpWnpEelBKVk1UOWhWaEVmT0pjdmNscC9zeU5mUnNIaU9p?=
 =?utf-8?B?ZUEvazdTN05PT0pNK0hNTVlnZ2dXZ2prclFqNld2Z2VBeHNMem15OVpBODFO?=
 =?utf-8?Q?57jnXqIUGH2h5Y3sTGwEvBgHC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a437b6f-53f1-4610-4b9b-08de372a8144
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 13:54:43.2853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6+I4gmWlEn6PL1gsvFgUKOJZgnH5lCbQe2gpFQbZ5hQ36P5O2uU9/BHFuapiBgXVGTRGAq7mt2HgNR3iRtErg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6768
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

W dniu 09.12.2025 o 13:51, Kamil Konieczny pisze:
> GitLab pipeline now run without this symlink so remove it.
> 
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Rob Clark <rob.clark@oss.qualcomm.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   scripts/verify-blacklist.sh | 1 -
>   1 file changed, 1 deletion(-)
>   delete mode 120000 scripts/verify-blacklist.sh
> 
> diff --git a/scripts/verify-blacklist.sh b/scripts/verify-blacklist.sh
> deleted file mode 120000
> index 7f706d61b..000000000
> --- a/scripts/verify-blacklist.sh
> +++ /dev/null
> @@ -1 +0,0 @@
> -verify-blocklist.sh
> \ No newline at end of file

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
