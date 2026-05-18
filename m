Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A70ECD4F52
	for <igt-dev@archiver.kernel.org>; Mon, 18 May 2026 10:59:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0444910E4B9;
	Mon, 18 May 2026 10:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IBjmx7I3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE1A10E4B9
 for <igt-dev@lists.freedesktop.org>; Mon, 18 May 2026 10:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779101926; x=1810637926;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=55OgjSkE1XP5tsXalUq5rSfmwwsbE95vhVTPxwYIZcM=;
 b=IBjmx7I3Sag6OWOkU9sPugHwMX2De67+68GqTesuqI0/EhhDTzxqwXBr
 1UPwmEA/x+pUAO+kn0MxZ/lMFv17rLn4gqJHUxHE3dI4qJbnnAzVLKJM9
 VfzLro+TYgrcRLbEsHTop2PHf3b1rKHgcVJQ6dolgPtKAd0MmPSlx2bXJ
 MsXhxu25y7WEydl4QeBE94A2FXzWoNQsLeQW4OnBc8HDcI2nOCx0H+J+H
 qByhMb0DS3ZIS+iz9CwcKiGOeBa6YmgjYHjzt6uE8ybNIBOb8DjQzk5aS
 w3n/z5u23UzaYXT4kr5j8vWvkGr5PTfVUZZikAUJD4LLQVojT6wOS+5ve A==;
X-CSE-ConnectionGUID: +UbIgz3aQemW68goCJ+4Sw==
X-CSE-MsgGUID: npummP2zSvWDSQH2xidhRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="80000435"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="80000435"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 03:58:45 -0700
X-CSE-ConnectionGUID: UWOFQraUQ8mihVuwA/RHhA==
X-CSE-MsgGUID: USxth2XkTseBCboW0nQ1yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="262913065"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 03:58:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 03:58:44 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 03:58:44 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 03:58:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdyxIUaFPYzd4rdmRvCjIQeOP2zdWNAI0FuDAc8Ny1i+WQ2hYO5KLLDJY1Uihlv7/5yOK8tvFTRVajoaNK+UsuzFqgmDA6lh1rMx2pP+90PCLaIdqNKEo/Dqz/vRN+Gx8QRztqTETkXkCZ8i+iFqMCO27C2iQeXCBJZahB+1nadDhJnUH2/4um6+b4SrjZGEVK8NkPcCX7HSPTd2rzMBPydx8ELepIoFavkr4rZ6Xirf0bMLlhBCcb5VLTXzRJndhjKltfxGVmcarCTtBtHrOqTZCVIyCACpUgMDwY9HTDn8DRDbWlpugB1K4C16Q+ar0+siN5sTMGWn0rAksRnviA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEzZa/+c/y7WH8639Qnqp4DXcg3xosDrJYb+4d0hVR0=;
 b=cXxJHfEHcpO8fH2+Cu3l0cnsaflXVYsvD5ejrm+8KEkxNNOb4ZkBxGogz1aad4om6UAngs8PWyXc4MTzKW2QauZu4NKbLyB4iwf57YPz/lc+f8LagyiLHHWPuVbzsHwvrW1bDOMejozRnSYcPw352RkaHoLePTcKDFDO7h6iwdmza+eLa/KQosHNh1C0msEsAmQ5aQk2jsVcYyHOfS5NxxAgbRKLaG6NL8juaVoU/hkPondzIm9O5C+XuvoQH5GeuMW8ClDCwm/ktVJsCM0X388VhlX2c9k4h3touucizfqBHotZ5X+4Dy4Rw6MHFbCl+dQz30NgET5KEiEe9+FlXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by MN0PR11MB6256.namprd11.prod.outlook.com (2603:10b6:208:3c3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 10:58:37 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 10:58:37 +0000
Message-ID: <5391d09f-b607-458a-8255-7be941224191@intel.com>
Date: Mon, 18 May 2026 16:28:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/kms_cursor_crc: Add extra vblank to
 support MediaTek platform
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Jason-JH Lin
 <jason-jh.lin@mediatek.com>, <igt-dev@lists.freedesktop.org>, Karthik B S
 <karthik.b.s@intel.com>, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>, Fei Shao
 <fshao@chromium.org>, Jani <jani.nikula@intel.com>, Paul-PL Chen
 <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Manasi Navare <navaremanasi@google.com>, "Gil
 Dekel" <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20260515072934.495031-1-jason-jh.lin@mediatek.com>
 <20260515072934.495031-2-jason-jh.lin@mediatek.com>
 <20260515104854.4cmbvbj5myt6syci@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260515104854.4cmbvbj5myt6syci@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::10) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|MN0PR11MB6256:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f85bec9-73ce-422a-53ad-08deb4cc6985
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|22082099003|18002099003|56012099003|921020|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info: OCza0c8CWJ8VqIBPKKdQuSkd40n2IL3wspN79/VjTYPpby2mQlk6EvNjJQRhEaA9ofM/IdbZiH7zJXjTL32vN5UWUKRTKfE+tlTJ3AC7iDSao7z3UvwfXz4d1UTafHNc3qRrhIcrvSCXTLoh0hWPnPEb6YThwZRd/CMidpfYpQ8K4bBTl62/sKyjKHpZe/gF5wmX41544yclECg8bVOV5l/sP+qJlImvO1erVJ+mA2mj4n3Cs/UYnntPtjpBMGADUupYi2YrB7SSykOHyErEeW73Yfz9a8IGJR04KkTxoYrKDtbvYquq5ZzOxg09KJ/IWY30e/NdkeqjoUCXio+CIcoyon5cmTTCJ7nPzgpR7hqITe2XsKiL9U3X84VwGU+EFYx0v/uY+qwbRYinB/zQ2namAci69sh6enWKNcFyL8A6bG3yjZr3KpC4Clh/cnawRfg9J0O3N5s9c4pQwJPHXbMfYhtThuZyYFtd0nG239DZXRDAKJS+KXctw0TcTKcq0QCSGehKh4NIT5Dc9lNmLRVVcPrykjx+uZ6JtoUSWvOXF/k0Yd4hhWVV50yJR7SoiFbXpS+2dsHl/YZx+uJzPcUreuncvxRU/L3iVJ5lU4Z+PKLw1SOgyxYF50yn8/7f30s/kKJztx/Ws5gJ57PrjT8/kNmSt95GIaEjxKGD9QsO5jF9AVMJ1SwI3J4VhJVmZBmoY+mGYk4q1u0xkkP4QSREMfIRLZmiv8lLEbyxkME=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(921020)(11063799003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkZkTitFOUFFQjhEOHBFb3UwaHRZMjdLdEV5c3BUVjZ0VU1McXZZNHRid0Yr?=
 =?utf-8?B?OEQxS2lqZW5mQ0d3REFLYTlBcGZBRjlweTZzSWViSHRNSlJsNytqWnZvbllQ?=
 =?utf-8?B?YlpHMU04UGpqMzBZV0tuMXl5eUN0MGJMdFZ6Q2c3WkhxL0xiUHV0ejVJOE96?=
 =?utf-8?B?K24yZ1ZEWG8ram15RUJwbkk1TmhNNUNWN29kVFdsbDhVQWhSdWdmM21aOXYz?=
 =?utf-8?B?aVdqeXgrSTkyUmVmOVhLanJXVUREaC8zSXdPYTNPdTdwWGVoV3IxaTM4Yi84?=
 =?utf-8?B?OU9qYVNXOVZodDhITnpOekFyclh2NHg1Sk5MRWVnNkZQUTlUbS9qMDhuUzFB?=
 =?utf-8?B?T2UrODJ1a09idmNaUFFVWkJjbmJRWmlSRFhKekZCRlJmcHdsMytqeUZqRC9r?=
 =?utf-8?B?SUkvVG1USlVmMlpFeUJBb2ppWFFta09jMDB6OGRjbnJ5cCtqWUh6Y2dkbWkx?=
 =?utf-8?B?S2lacGR3dEFQczNxSHJvenZnTlErUU1WV3hERDFOYW0yTzY1V08yZk5iT05n?=
 =?utf-8?B?ekw0YlNSYytHbG8zSHczNkJiTm9wcTJTYnQyMTE5SXFVRDBCcnNRMVZKOWJa?=
 =?utf-8?B?M3NOOTU2Y3ZlWmI2K0FFZ2E5TjRqbzNYaWdRUGMraUhhQmYrL0Y5SXNlTjVk?=
 =?utf-8?B?VE5DeGlJVjNGRlptYUVuRmJWa04yM01KRlNnR2lHNXNuUnpYRFozRGYyaDZX?=
 =?utf-8?B?UWdOVTJaVmpYZWE4dGZuNmowTlUxMCtQOHYxUXFpTit0MituVTN2MDR4M0Fr?=
 =?utf-8?B?Ymw4WDQ0S1dBN3dwUm1ZZWtVajcrVE4yT0pjR3d6bSttdDJwalppRVN2d2c1?=
 =?utf-8?B?c3JudTdGWHhocVZuRDNkeWJ2R051K2NROXBZOWFUNzVScEJUejlDNmVFV0JV?=
 =?utf-8?B?U1VXQ1cxVGpsOGhKaTlkU1laRWIvYitkZlo2UVEzYUtpYk9rV2wxM0lLQlJy?=
 =?utf-8?B?QlNIQ05za1hUOHZNMW5TNiszMlBGazVRMTFPNVNudFpDUnI0L2NrRkNvVGZo?=
 =?utf-8?B?L3dCWjJVdjdXTE1BMTBDdGQrN1FWRFJNbmxHV3Z5VU0xTDdVdG8vaCtFR09C?=
 =?utf-8?B?R3duSGNxblp5TndiTk1UTGxaRDdQak9hUEFjQ1VLTXdoVng5MGYxUUpQUTh5?=
 =?utf-8?B?MENOaXhxdFUvN0RpYW13aFNhc2tVYjNwNlVqNG92YUZ6V1diTlpxbU5SLzlY?=
 =?utf-8?B?dDFQM3VQaTF6RkJ3cGdCQTA1NDcrK2JwMVE4ZVRBc3RpWk1mVFIremorblR4?=
 =?utf-8?B?dlMwRXhnZEVSdGZiY3VCM0U5UkFzenhxMC8rekxTcGZOc0E4MjQ4YldzZ0RX?=
 =?utf-8?B?T1NENTRXQ0pyWlBvMjFsNlN2UHppMlJkcXJXU0NoWWpUV0M3NjNrMUtZVVV2?=
 =?utf-8?B?NlIyZ25FNUFwKzNId3NEeXlGQlFZcURSOTRJNzZoQWdOQnFUZ2R5eU12aVN0?=
 =?utf-8?B?c2dPSG1ic0NzTVB2R0dkdjduTGRDWElSOHRJNVdHRjdGMW11YW9PZEFCcXpZ?=
 =?utf-8?B?UTJYQk9zYVNsaFd2ZUxhUGVvdGV5MGFRbEhUbjUrdUI4bERzdkhwTy80MFVT?=
 =?utf-8?B?MGlaS0dXd01oVTFoUGpzVGkxVnRXa0R0NW5MYUF2ODgvK2djWUJQVmp3bjBz?=
 =?utf-8?B?b1hUQmlKdHFCVXVobjQ3OXZIbVB4YU9Ud2xlcXJ5V0FVWGpNOWM3RE8wYjBP?=
 =?utf-8?B?b3JGLzVjT3RySVliRjdiV0kzTEh4cmN5ekwzdVZJU25CTS9sWkt1d1hRMktT?=
 =?utf-8?B?L1JrTFUxa3lGc3drVE1yNGF2NmRRVXlIcGhva0tUSUdjMTlYWlYwcE1oWHox?=
 =?utf-8?B?R3Z6a2EyZzB3dE5ZRVBva295bk9HalBtd3RNU25aQ2VQNkxJWXpnaUZ1djla?=
 =?utf-8?B?US9IU25yWjNzeUVNTXdMbTR0dnBRWGRsZndaNjF6aURxa3IydE8vdXVkZ05W?=
 =?utf-8?B?N0taYURZQU5LejIxeFJsa2ltNGQ2cGdHbDBvV2xQR0Z5ZmVOT0pWWmROKzhy?=
 =?utf-8?B?OHNQQ3g3UkpBMWc4dC9sd2tNL3RqZ0lKS1FKVDRiMS8vaEZQRVl4Q1gwMC80?=
 =?utf-8?B?QkpVdytTZmx1NXNZNWFuNm5WWm9GSjNRSE04RkYrRnNkR0JSRm1zbjZYR1M5?=
 =?utf-8?B?Wk8yNi96bW9jenFSdlhNSXJjb3VDTW16VlRKbTdPbTRHTWNTa0I1SnZTL3BB?=
 =?utf-8?B?QWlpbkVTdDczWDJOUXRWamIrV3ZWdzBDTDNpWXEyTHllYi95K1ZWUGk3VUpR?=
 =?utf-8?B?VnZ4RmVrNGw3T29nQmIyYVNXVFN1Sm0rMmVBbGxaTy9OOUxUcEN0SW9zYzkw?=
 =?utf-8?B?UTd5T3B1NkRVbkh3ZlV2MEp0UGwrZmJLWmZaK3pyaVBGcjBvYlFHdz09?=
X-Exchange-RoutingPolicyChecked: lPX1hXc7dfkyLqSrMS6e7GR6m9z7dkDcTBq7pSaI1lboa1V1iQZWAhXsJZ+wkLLKixoUeQl1LUI69qPkFOlVpVP9H1EfmAzs+nX/Caq+qkNKstzXYAfBI5pobg3135hBADDCqGsrsikPrV38HKSfdJR1wdyx6hT5xZvEp0/qOLWVM8jZyuvuJvJefVLE7YHR8mULFMLRV6pJkPR1JWbI5QooO1AuJ1liSqIPvsVz7pE/kyPnnIJ08jDRtbAQeJS2vXiM7QG0Wj3L3B0/gustZHhXao6utaAcspUrCeJQPOPOGAtw+T2vZId7w3xYvDeSwkl/ZaPJKhHuX7CviFWOBg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f85bec9-73ce-422a-53ad-08deb4cc6985
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 10:58:37.3484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UpbE2+OP5tL+Kh9IxFKiGIktve315UF7Uuq95o+NYbP8Q6+EFDDUF6Lfg/D/gWUV2gFwrmgXTheS9zWwVFbIxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6256
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

Hi Jason

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 15-05-2026 04:18 pm, Kamil Konieczny wrote:
> Hi Jason-JH,
> On 2026-05-15 at 15:28:39 +0800, Jason-JH Lin wrote:
>> Add MediaTek to vblank_wait_count=2 devices (like AMD/MSM) to ensure
>> cursor updates are fully synchronized before CRC capture.
>>
>> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> LGTM
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Regards,
> Kamil
>
>> ---
>>   tests/kms_cursor_crc.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
>> index 1e062c38b668..1249171dec56 100644
>> --- a/tests/kms_cursor_crc.c
>> +++ b/tests/kms_cursor_crc.c
>> @@ -345,9 +345,9 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
>>   		igt_display_commit(display);
>>   
>>   		/* Wait for two more vblanks since cursor updates may not
>> -		 * synchronized to the same frame on AMD HW
>> +		 * be synchronized to the same frame on AMD and MediaTek HW
>>   		 */
>> -		if (is_amdgpu_device(data->drm_fd))
>> +		if (is_amdgpu_device(data->drm_fd) || is_mtk_device(data->drm_fd))
>>   			igt_wait_for_vblank_count(data->crtc,
>>   						  data->vblank_wait_count);
>>   
>> @@ -1300,10 +1300,12 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>>   		igt_require_pipe_crc(data.drm_fd);
>>   
>>   		/* Wait for two more vblanks since cursor updates may not
>> -		 * synchronized to the same frame on AMD HW
>> +		 * be synchronized to the same frame on AMD and MediaTek HW
>>   		 */
>>   		data.vblank_wait_count =
>> -			(is_msm_device(data.drm_fd) || is_amdgpu_device(data.drm_fd)) ? 2 : 1;
>> +			(is_msm_device(data.drm_fd) ||
>> +			 is_amdgpu_device(data.drm_fd) ||
>> +			 is_mtk_device(data.drm_fd)) ? 2 : 1;
>>   	}
>>   
>>   	data.cursor_max_w = cursor_width;
>> -- 
>> 2.43.0
>>
