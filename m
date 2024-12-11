Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA948E77180
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 04:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BCA10E107;
	Wed, 11 Dec 2024 04:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FIjrOX/o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E811810E107
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 04:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733891129; x=1765427129;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BZIemGKb+Z8HQhf/rQirz1v+6Zy2q6X401wCLKRARI8=;
 b=FIjrOX/oG4aFziWOt3jSM/5Z2bDS0ynS0PzYmjXVP1BcM4JlJz/3VDsI
 QRX38kW5210F4DVTQ+EsuNz75NbrmuYD5a2hZe+PV6iHh71H7+umOmDm4
 dwh6JTihibNzpFFPbRb7nWc42XBicjXeJsHztHrJclKkFl3XLvsET1zKr
 XvKQQrSrvC+oFngzw52gxV705fI+s/8Cu+LLoE8c4qakMIEQQgYP4DL/i
 yazFQ+cDM9RK+JLThxRDVpLMUDQ2iqXdZ/T1p4GOpLAdLipneCMFSWyxY
 mf2tp3xFBwWSNxGbYO8jsUlW84YSHo99KoMBKfLuWPqYXV+qOuKLq/zKN A==;
X-CSE-ConnectionGUID: 1hdg5li5RNK6UL4pMQMzZw==
X-CSE-MsgGUID: i3XpyTp4QZKQ6av0s6iBbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34384505"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="34384505"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 20:25:25 -0800
X-CSE-ConnectionGUID: B/N8aqaoQ1inuThmnSuj3A==
X-CSE-MsgGUID: M9phPeRzQ+aWDwHwDyqxpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="100698840"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Dec 2024 20:25:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 20:25:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 20:25:24 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 20:25:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9cW3x48tv9OqX5jv/lcmJL4kjncT4g1dtytbUcCBKbz41bj4X55tLqcj/TBlS6M26tMo3du2puiUhJ57inCOJ1sxlmeAJIfAR5mVwdjCJBwG9ZgDG0W5w1jhTF241pxHrB8oDPAUAybCHyzSeyhBEsOEBj4QYG7EgELH8iJra09g62jynOntTHLNVIqIoKe8HBFhmTUujOnLniSSroVOIDZA+BvZWH5Esqm5tiuP13bpz1r8nJz+8GJSDNi2Ri5Gt4qjGmiff7WpIfkGa13ITYjSB8Lvuios7r4hDHbMEk8KtbedIy26B4QWvNa3ZUIxmc+segZqLC4iT2tt/HREA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rxZDAz87fKUX94YeIrhoXW3e25Q2VDoc0ZBhm5LjaA=;
 b=cuZGXOqkcjo9HRAut6Hly0fr/Nl4btQyxxnsaSLET2Yo+Oxh3Ntmo8/Fagveu2QzBb4H++3S4tPl/urFemueQaW8cxuZvOLwRFOl96eWhNRZo4kd5gMd3giDJKsYnd3C1RmymVggNXiSyppo0leL4vGDNgfU1YiRnGmB1uq5BD6v89kZeLzCaEk+89vOhLQ1sFemnnXZF984eIN+TEVI6sNK1GV9fexi727PFa99B2bXfsGoIShhK2ZhHSrFkfV4KI1Q6yfX8SdbjCZpiVIM13wgk2JEf8P7+NiAzyLqx0XgbFYgxrAfQ4wBcpIyMfAUPYmaelrnRhuiYhwzm0ql5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA1PR11MB8523.namprd11.prod.outlook.com (2603:10b6:806:3b5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 04:25:17 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 04:25:17 +0000
Message-ID: <b0075518-1780-45cf-9fbf-3edade73e944@intel.com>
Date: Wed, 11 Dec 2024 09:55:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v9 3/9] tests/kms_sharpness_filter: Add adaptive
 sharpness basic filter tests
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241209114623.1843033-1-swati2.sharma@intel.com>
 <20241209114623.1843033-4-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241209114623.1843033-4-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::23) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA1PR11MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: 10d3d96a-2065-4268-9811-08dd199bd097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2tTUjQzZmZsMVlaZUhwU25sR0pNMndGV0todytlN2hvZ0ZTSjVEYjZpbS9z?=
 =?utf-8?B?RVp1MHFqYUM1TVM2MEpjS1RkZGJjejBkM2lXQy92THQ4TXFMcVc0N255RGZY?=
 =?utf-8?B?MXh6UXhqdEpYWm1hSG1jaGFxM2hFNy9yeEEwb0tpR1BUbDlSbG5sdzFna3ZX?=
 =?utf-8?B?ZXpVY1VNNlJjL0UwcXVmRVlKTm16eVl2L0hUd21tcUlzN2QveVBZNjlMVHpq?=
 =?utf-8?B?SlN1bHJWb0ZISEJJaGVCVllEZ0U4NnZSbEIwN2tsYzJEdXZkMFhVU0lqbmpl?=
 =?utf-8?B?MkNoQVdqQkU1NTI4U1R4YnA1enRjOVZLMU0vbDd3SFUzRE9Jdlkwd3h5aGp2?=
 =?utf-8?B?TGJUYW1nNk51eUkwbzlLWWdLcW1pMXdzcTdWSmYwY1JQNW9URSs0cHBmcjlZ?=
 =?utf-8?B?QXN2WGFsTGlDVGJUdjZhdFRkMXJxTHRrZjNkY29DU2Z5ZEtDU0FGaTVmcU9a?=
 =?utf-8?B?RWJiV2dMOVVOUnduVjQ4dmc4d2lZRGhFT0FYTVY4NHJaclNnWmlrTHpPMnpn?=
 =?utf-8?B?R1FwcXd3YVZkSEQzRW5IbVpiSHZTQ0tVUzVQNjBQaGxlMEJSZmFTbWlrZE5O?=
 =?utf-8?B?UjI4b2FwMTJrMVhRSDVOY0gxRWJJZmZnSUM5UEVTRmhMdVc4YkNSNE1sVDA1?=
 =?utf-8?B?UDlXRE1qaEkzZ0tHQ3IxZ0E0ejR3NFhpY0pUT1paUjlYTWNCMDVwMHlqMVVX?=
 =?utf-8?B?bmU3eEVscm5IKyt5eG9yd0x5UzhsMEo3WFJKajFtZHJoMi9LaXZoWXRlSEZs?=
 =?utf-8?B?bEpsdlVoK1VMbUNFZTZBNFdZd1VadDViNGY3cVhrTTAwZTZwRXZjOEpNQlVJ?=
 =?utf-8?B?NnpQMWxXMXh0cHJDeUdheFFRNS9mMDRsS21EY1A3WEJTMG9TcEFySkRmc0lL?=
 =?utf-8?B?VzFZekxqRHkxbExkbExNaTVOMTBiSEFkQzNKNEl4b0NtVmVOYWdYN3hlWW9m?=
 =?utf-8?B?c2NjVVQwSVZVQnpmbFNpdi93bVdWMlJYTXBYYjJEeDgrdGJHWUdhT25qMHhp?=
 =?utf-8?B?S1pjRGNaTlNSdE9xNjlTN2dlaW82a1VsSXFTSkxidFNDREJ3VEpTRVhxSlNF?=
 =?utf-8?B?bDVDVklIbTB2b3BHTXB4Y29KLy80Z3o5Y1Axck01K2VFSWora2VKWGI4MHJP?=
 =?utf-8?B?OEEvb3VHSnVFSmRwd3VKTlBKejE5bDd2UldZZzZxdk9RczgrQ1RTY3YyaWk0?=
 =?utf-8?B?b2tvOUQrWG1Tb0lXL3d5L0xlQkdYSXRiNzRRemF5dGJ1bWNqc0dqSytkcDA4?=
 =?utf-8?B?UzVqamZhL1VFS1c3emZJd2sxVUtXc0VldjJ1MUQ3aVJBYW9lam5YaUQxVjJh?=
 =?utf-8?B?emdZc2t0N0NVZ0o4MVZnYjBxZENCa09YQkFKMkk1TTdjMlk0UUJXN0RrcEsy?=
 =?utf-8?B?V2VPNjByREpDMUxxME00cUhQdXM3aFVDWGt0N2crZkNvaUxjOTRLdjdUYjY5?=
 =?utf-8?B?SkNrZGxIN2lrWDhrOHFSZSt0WG80dzFPRVVLeDhyTnZyR0NrWEVvMGVydEVn?=
 =?utf-8?B?SVdZbXJKNFE1cEZTVStmWHdoRytyMWU4VmR2WVVFWWpqNEVxL0wwMWE0cmJr?=
 =?utf-8?B?ZTNXUXlzN0ltWUxOTDdYZEsxc1VVNU8xQmlkNXd5a0hYQ2FNaGtSVFJKd3l4?=
 =?utf-8?B?TTQrTUhvZDk2QzlEQnNIcFlTK1pHcW1Bc2JvSU5OdFU4SjZQQXZZbnMwNTJR?=
 =?utf-8?B?WERFWjVLb2h2aVFPSGFCYWQxN1hmOHdvM3l5RmMwdWNrL1VnVlpNbjJLUm1m?=
 =?utf-8?B?UFpMdVd2UWJJQUlyU1NXYkxZdzlIUFBja2NVc3FCSWN3a2VVcDVZaGdmdHZT?=
 =?utf-8?B?MG9VeVBVdm5aNStybDMrdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0VLNllXNkdBN3gxWUdCbzA4RDc0WVAweHVHaHFGOHZoOHdhc0tFdmd4eEox?=
 =?utf-8?B?Q0R5QmlCVHFJWk8vLzFVK0RRWlBla0tTT1RTTkIyNk5NRVN6YUtLTmltR2VO?=
 =?utf-8?B?ZXJJOElTVUhEU3lwVlUyYWQ4N0F5b1BkUDZuSitIcjRGMXQzbzhoM3ppRi9Z?=
 =?utf-8?B?ekhMTW53M2x0aXZSQ3JhUHh6bExOSmdLVDNqRkN5NXV6Y1pqa3lMczlCL01M?=
 =?utf-8?B?QnpmYzVYdDRyMDV6M0QyTzA5TExHSlNqQ2JZS0xJa2pPUmt6MGlnZHVKT1gw?=
 =?utf-8?B?NjUyRzdWdGtDM2FjOU40QVBuemJyTjF6WTBMZURYd3ZlS2RvMmNxVEg2U3J1?=
 =?utf-8?B?Q1BBR0RuSFJqYUN2a090bTlGWXI4a3p0Z3NMVDQzTXlsM3BQRWJXSWZOZ0hZ?=
 =?utf-8?B?clZTZDB3V0RLUE8rcXlEejViZTNncXpkTUcyK05DaE9qOWhlR0VzZ0tldVpO?=
 =?utf-8?B?a0d1TjkwMmh3LzBVNEthSC9ZOFlnVlpFNHI2enRhT3dsdFkwSEdDRVcvQ2Fm?=
 =?utf-8?B?WHAwaTJzdXlVdzVJVXYxczhod2RMM1hydXRNK1g4alBqb1dWZ2Y0MVlRN05l?=
 =?utf-8?B?aHFSTFhjNUxvV1dWY3pXaDlZNVNER0JTd3BWeHZPcGxYbExZWVdxZVRsa3k2?=
 =?utf-8?B?a3RLRFFwbDI4Q2VWMVpFeVI1cGQ3bXFWYjZzSEhRc0FLSnh3QWxKeTc1Mm9E?=
 =?utf-8?B?OWRBSC9HZFR5UlYvNmxtYWp2dnIxdnhCTzRPK2pVb1A5bndMWTdpZFpxZFNt?=
 =?utf-8?B?OE0rSTdaaEk0QmxPZ0VxUW9GRXhhczdmeSttTUg1bGt1SmszYU1Qak9yWlRj?=
 =?utf-8?B?NkRnOEM5NFd6L2hjY1VBNkU4RXR3cjJ3Q0dhUlNRQUZpdEZjVTExREdXZElL?=
 =?utf-8?B?OE9lMFRCMkw4ckpwNGM4aDk0aDJDNjFsYkh2dDB4QmpiRkVablo2c0xoT1E3?=
 =?utf-8?B?SEZFMllLYUI3Rit4OUM3bWdRdE54MjhuQkVPQitLQm5EL2h0bDZDanhHMTUz?=
 =?utf-8?B?UzlrVEFSS29ad0lkK3JCeFhNM3gzT2VnSFZsMDdZa1U1TG4yeXJYTnBlR0VT?=
 =?utf-8?B?M2FUa3BFN3JBbitDUTJkbFRmUGNheG4vVmFPNUlQNkFvL1BRd1ZYWDI4cnVY?=
 =?utf-8?B?d1ZqdUl3cXdUOGFHakVmLzNacmRIcEpzdUsrMEZtK2YrMmdyTFZyRWNnQk9o?=
 =?utf-8?B?U1Q2OS9qODl2ZnN6WGszdHMvMjJlWlpiMWk2OGtWazhuR1pkbDd1SGphVm5t?=
 =?utf-8?B?NkxtUVJ1ODJsYVVBRWJLcUYyOU9KUHhGdTZROGhIZTRUVWV1Q0lGc3BhaG5h?=
 =?utf-8?B?UTlhTFRSbmdLTzExaitYQkMvNUt2UmFNSVh6Qm94RW9Fc2dpaFlJRmF6ajQy?=
 =?utf-8?B?VnVHM3BKelRybmlaZGRUL1MvSUxJaUdIZDAvZWxvYld6NGY4Z2l4elNHRTlS?=
 =?utf-8?B?SnJ0MTRrNzFMSktpaHVleExGU0JrMXFqM2hpNEJrOWE5eGVHdWRrM25pM1Ry?=
 =?utf-8?B?NWVJQ3lHNWFRanpmMElrbEduckdqb0xEb0g2WU5aOFhvUTg5Zkx4NCtqZDBU?=
 =?utf-8?B?LzdKeUZ3STEvd2M3M2YrMW1Zb0F6OFRGUzdjckFQN3l1bkZDRmlYWWVzVEtW?=
 =?utf-8?B?bHZiemFhVFdlNHZJMU4wSFcreE54WldQbDRETVVta3cxWG9rOWhiKzVoZENz?=
 =?utf-8?B?NTFidEFEN2RWeFZoZVcxVjhRdTFKL0JVV0lkMm5kK2FYZkk5M1lLOS9YTWVZ?=
 =?utf-8?B?djNSdFRhYmhHTUxMb3ZpdFVBbXNKSE51NnBhNms5RTB1bEtYczQ3K0xGMzA4?=
 =?utf-8?B?UjZ1dEFDZ0xVOUltbG0wQlZSTUJMSlhMKzR0RWlGRUFKRXBSMTlEbWtWRXE5?=
 =?utf-8?B?OTRxRVhvVG1RZ0JBY2tsUXpRODZuWmxGcFBNNDVnbjFKN1cvT3ZDa1hYMCtJ?=
 =?utf-8?B?Q2ZKTEU0QS9BdlF4M1lSUGh3WVNNbHVtVG9GMkRzNm1ySTU4VVNQZTBwM2FJ?=
 =?utf-8?B?eDgvRHR4VXBxMStxOVVkUTRRaWYyVHc5RFBHL3hHbE8wYmtETlFvbzVQcngx?=
 =?utf-8?B?QSttQ3FGMGIwaDljdm4zZ1llZ1lpcTAyNklwNW9zNkJFd0NNOFBydnNEVVpD?=
 =?utf-8?B?MFRORDBJeGpYZlIwbmhjamttN0VlTmRBdzJyNDdyNm1BRmVRckNqSW8xY21j?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d3d96a-2065-4268-9811-08dd199bd097
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 04:25:17.0215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I1ZQK8pKyJ6k06udvVc+y0bLpAez/dR2O4S5IoRA6BVAZ9MV6Ut4bDgEM6/OrIqjUU1Iy3PJspjTj02+9P59rVKzLv9xSgA9gk7iiMXFx18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8523
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


On 12/9/2024 5:16 PM, Swati Sharma wrote:
> New test is added to validate adaptive sharpness filter on
> LNL platform. Various testcases are added to validate this
> feature. These are non CRC based tests and manual verification
> is required.
>
> Pipe scaler is repurposed to perform a portion of this work.
> This means pipe scaling will be unavailable while the sharpening
> function is being used. The other scaler can be used for plane
> scaler.
>
> 5 subtests are added:
> 	-basic: verify basic functionality
> 	-modifiers: verify casf with different modifiers
> 	-rotation: verify casf with different rotation
> 	-formats: verify casf with different formats
> 	-strength: vary strength and check difference in sharpness

Use imperative mood in commit message.


>
> TODO: -Enable casf with varying output formats (YCBCR/RGB)
>
> v2: -Updated modifier type to uint64_t.
>      -Replaced IGT_CRTC_SHARPENESS_STRENGTH with IGT_CRTC_SHARPNESS_STRENGTH.
> v3: -Updated setup_fb with height and width.
> v4: -Renamed tests/intel/kms_sharpness_filter.c -> tests/kms_sharpness_filter.c (Ankit)
>      -Added subtest invalid filter with connector. (Ankit)
>      -Updated documentation. (Bhanu)
>      -Used driver_close_driver instead close. (Bhanu)
>      -Added check to avoid debug print for invalid tests and filter strength = 0. (Ankit)
> v5: -Instead of using default strength as MAX, use MID value strength.
>      -Add relevant debug print for test skip.
>      -Fix indentation.
>      -Renamed invalid-filter-with-connector -> invalid-filter-with-scaling-mode
>      -Reworked on invalid-filter-with-scaling-mode(), added provision to
>       validate other scaling modes.
> v6: -Skip test if ret=-EINVAL for downscaling test.
>      -Change if() for tap subtest.
> v8: -Optimize tap-filter subtest (Ankit)
> v9: -Logically split tests (Ankit)
>      -Fix alignment (Ankit)
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_sharpness_filter.c | 346 +++++++++++++++++++++++++++++++++++
>   tests/meson.build            |   1 +
>   2 files changed, 347 insertions(+)
>   create mode 100644 tests/kms_sharpness_filter.c
>
> diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
> new file mode 100644
> index 000000000..bf660cb02
> --- /dev/null
> +++ b/tests/kms_sharpness_filter.c
> @@ -0,0 +1,346 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms sharpness filter
> + * Category: Display
> + * Description: Test to validate content adaptive sharpness filter
> + * Driver requirement: xe
> + * Functionality: casf
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
> +
> +#include "igt.h"
> +#include "igt_kms.h"
> +
> +/**
> + * SUBTEST: filter-basic
> + * Description: Verify basic content adaptive sharpness filter.
> + *
> + * SUBTEST: filter-strength
> + * Description: Verify that varying strength (0-255), affects the degree of sharpeness applied.
> + *
> + * SUBTEST: filter-modifiers
> + * Description: Verify content adaptive sharpness filter with varying modifiers.
> + * Functionality: casf, tiling
> + *
> + * SUBTEST: filter-rotations
> + * Description: Verify content adaptive sharpness filter with varying rotations.
> + * Functionality: casf, rotation
> + *
> + * SUBTEST: filter-formats
> + * Description: Verify content adaptive sharpness filter with varying formats.
> + * Functionality: casf, pixel-format
> +*/
> +
> +IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
> +
> +/*
> + * Until the CRC support is added test needs to be invoked with
> + * --interactive|--i to manually verify if "sharpened" image
> + * is seen without corruption for each subtest.
> + */
> +
> +#define MIN_FILTER_STRENGTH		1
> +#define MID_FILTER_STRENGTH		128
> +#define MAX_FILTER_STRENGTH		255
> +
> +enum test_type {
> +	TEST_FILTER_BASIC,
> +	TEST_FILTER_MODIFIERS,
> +	TEST_FILTER_ROTATION,
> +	TEST_FILTER_FORMATS,
> +	TEST_FILTER_STRENGTH,
> +};
> +
> +const int filter_strength_list[] = {
> +	MIN_FILTER_STRENGTH,
> +	(MIN_FILTER_STRENGTH + MID_FILTER_STRENGTH) / 2,
> +	MID_FILTER_STRENGTH,
> +	(MID_FILTER_STRENGTH + MAX_FILTER_STRENGTH) / 2,
> +	MAX_FILTER_STRENGTH,
> +};
> +static const struct {
> +	uint64_t modifier;
> +	const char *name;
> +} modifiers[] = {
> +	{ DRM_FORMAT_MOD_LINEAR, "linear", },
> +	{ I915_FORMAT_MOD_X_TILED, "x-tiled", },
> +	{ I915_FORMAT_MOD_4_TILED, "4-tiled", },
> +};
> +static const int formats[] = {
> +	DRM_FORMAT_NV12,
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_XBGR16161616F,
> +};
> +static const igt_rotation_t rotations[] = {
> +	IGT_ROTATION_0,
> +	IGT_ROTATION_180,
> +};
> +
> +typedef struct {
> +	int drm_fd;
> +	bool limited;
> +	enum pipe pipe_id;
> +	struct igt_fb fb[4];
> +	igt_pipe_t *pipe;
> +	igt_display_t display;
> +	igt_output_t *output;
> +	igt_plane_t *plane[4];
> +	drmModeModeInfo *mode;
> +	int filter_strength;
> +	uint64_t modifier;
> +	const char *modifier_name;
> +	uint32_t format;
> +	igt_rotation_t rotation;
> +} data_t;
> +
> +static void set_filter_strength_on_pipe(data_t *data)
> +{
> +	igt_pipe_set_prop_value(&data->display, data->pipe_id,
> +				IGT_CRTC_SHARPNESS_STRENGTH,
> +				data->filter_strength);
> +}
> +
> +static void paint_image(igt_fb_t *fb)
> +{
> +	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
> +	int img_x, img_y, img_w, img_h;
> +	const char *file = "1080p-left.png";
> +
> +	img_x = img_y = 0;
> +	img_w = fb->width;
> +	img_h = fb->height;
> +
> +	igt_paint_image(cr, file, img_x, img_y, img_w, img_h);
> +
> +	igt_put_cairo_ctx(cr);
> +}
> +
> +static void setup_fb(int fd, int width, int height, uint32_t format,
> +		     uint64_t modifier, struct igt_fb *fb)
> +{
> +	int fb_id;
> +
> +	fb_id = igt_create_fb(fd, width, height, format, modifier, fb);
> +	igt_assert(fb_id);
> +
> +	paint_image(fb);
> +}
> +
> +static void cleanup_fbs(data_t *data)
> +{
> +	for (int i = 0; i < ARRAY_SIZE(data->fb); i++)
> +		igt_remove_fb(data->drm_fd, &data->fb[i]);
> +}
> +
> +static void cleanup(data_t *data)
> +{
> +	igt_display_reset(&data->display);
> +
> +	cleanup_fbs(data);
> +}
> +
> +static void test_sharpness_filter(data_t *data,  enum test_type type)
> +{
> +	drmModeModeInfo *mode = data->mode;
> +	int height = mode->hdisplay;
> +	int width =  mode->vdisplay;
> +	int ret;
> +
> +	data->plane[0] = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
> +	igt_skip_on_f(!igt_plane_has_format_mod(data->plane[0], data->format, data->modifier),
> +		      "No requested format/modifier on pipe %s\n", kmstest_pipe_name(data->pipe_id));
> +
> +	setup_fb(data->drm_fd, height, width, data->format, data->modifier, &data->fb[0]);
> +	igt_plane_set_fb(data->plane[0], &data->fb[0]);
> +
> +	if (igt_plane_has_rotation(data->plane[0], data->rotation))
> +		igt_plane_set_rotation(data->plane[0], data->rotation);
> +	else
> +		igt_skip("No requested rotation on pipe %s\n", kmstest_pipe_name(data->pipe_id));

Perhaps this should be checked only for rotation test.

Apart from minor things above, the patch looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Regards,

Ankit

> +
> +	set_filter_strength_on_pipe(data);
> +
> +	if (data->filter_strength != 0)
> +		igt_debug("Sharpened image should be observed for filter strength > 0\n");
> +
> +	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	igt_assert_eq(ret, 0);
> +
> +	cleanup(data);
> +}
> +
> +static bool has_sharpness_filter(igt_pipe_t *pipe)
> +{
> +	return igt_pipe_obj_has_prop(pipe, IGT_CRTC_SHARPNESS_STRENGTH);
> +}
> +
> +static void
> +run_sharpness_filter_test(data_t *data, enum test_type type)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_output_t *output;
> +	enum pipe pipe;
> +	char name[40];
> +
> +	for_each_connected_output(display, output) {
> +		for_each_pipe(display, pipe) {
> +			igt_display_reset(display);
> +
> +			data->output = output;
> +			data->pipe_id = pipe;
> +			data->pipe = &display->pipes[data->pipe_id];
> +			data->mode = igt_output_get_mode(data->output);
> +
> +			if (!has_sharpness_filter(data->pipe)) {
> +				igt_info("%s: Doesn't support IGT_CRTC_SHARPNESS_STRENGTH.\n",
> +				kmstest_pipe_name(data->pipe_id));
> +				continue;
> +			}
> +
> +			igt_output_set_pipe(data->output, data->pipe_id);
> +
> +			if (!intel_pipe_output_combo_valid(display)) {
> +				igt_output_set_pipe(data->output, PIPE_NONE);
> +				continue;
> +			}
> +
> +			switch (type) {
> +			case TEST_FILTER_BASIC:
> +				snprintf(name, sizeof(name), "-basic");
> +				break;
> +			case TEST_FILTER_MODIFIERS:
> +				snprintf(name, sizeof(name), "-%s", data->modifier_name);
> +				break;
> +			case TEST_FILTER_ROTATION:
> +				snprintf(name, sizeof(name), "-%srot", igt_plane_rotation_name(data->rotation));
> +				break;
> +			case TEST_FILTER_FORMATS:
> +				snprintf(name, sizeof(name), "-%s", igt_format_str(data->format));
> +				break;
> +			case TEST_FILTER_STRENGTH:
> +				snprintf(name, sizeof(name), "-strength-%d", data->filter_strength);
> +				break;
> +			default:
> +				igt_assert(0);
> +			}
> +
> +			igt_dynamic_f("pipe-%s-%s%s",  kmstest_pipe_name(data->pipe_id), data->output->name, name)
> +				test_sharpness_filter(data, type);
> +
> +			if (data->limited)
> +				break;
> +		}
> +	}
> +}
> +
> +static int opt_handler(int opt, int opt_index, void *_data)
> +{
> +	data_t *data = _data;
> +
> +	switch (opt) {
> +	case 'l':
> +		data->limited = true;
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +static const char help_str[] =
> +	"  --limited|-l\t\tLimit execution to 1 valid pipe-output combo\n";
> +
> +data_t data = {};
> +
> +igt_main_args("l", NULL, help_str, opt_handler, &data)
> +{
> +	igt_fixture {
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_require(data.display.is_atomic);
> +		igt_display_require_output(&data.display);
> +	}
> +
> +	igt_describe("Verify basic content adaptive sharpness filter.");
> +	igt_subtest_with_dynamic("filter-basic") {
> +		data.modifier = DRM_FORMAT_MOD_LINEAR;
> +		data.rotation = IGT_ROTATION_0;
> +		data.format = DRM_FORMAT_XRGB8888;
> +		data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		run_sharpness_filter_test(&data, TEST_FILTER_BASIC);
> +	}
> +
> +	igt_describe("Verify that varying strength(0-255), affects "
> +		     "the degree of sharpeness applied.");
> +	igt_subtest_with_dynamic("filter-strength") {
> +		data.modifier = DRM_FORMAT_MOD_LINEAR;
> +		data.rotation = IGT_ROTATION_0;
> +		data.format = DRM_FORMAT_XRGB8888;
> +
> +		for (int k = 0; k < ARRAY_SIZE(filter_strength_list); k++) {
> +			data.filter_strength = filter_strength_list[k];
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_STRENGTH);
> +		}
> +	}
> +
> +	igt_describe("Verify content adaptive sharpness filter with "
> +		     "varying modifiers.");
> +	igt_subtest_with_dynamic("filter-modifiers") {
> +		data.rotation = IGT_ROTATION_0;
> +		data.format = DRM_FORMAT_XRGB8888;
> +		data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		for (int k = 0; k < ARRAY_SIZE(modifiers); k++) {
> +			data.modifier = modifiers[k].modifier;
> +			data.modifier_name = modifiers[k].name;
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_MODIFIERS);
> +		}
> +	}
> +
> +	igt_describe("Verify content adaptive sharpness filter with "
> +		     "varying rotations.");
> +	igt_subtest_with_dynamic("filter-rotations") {
> +		data.modifier = DRM_FORMAT_MOD_LINEAR;
> +		data.format = DRM_FORMAT_XRGB8888;
> +		data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		for (int k = 0; k < ARRAY_SIZE(rotations); k++) {
> +			data.rotation = rotations[k];
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_ROTATION);
> +		}
> +	}
> +
> +	igt_describe("Verify content adaptive sharpness filter with "
> +		     "varying formats.");
> +	igt_subtest_with_dynamic("filter-formats") {
> +		data.modifier = DRM_FORMAT_MOD_LINEAR;
> +		data.rotation = IGT_ROTATION_0;
> +		data.filter_strength = MID_FILTER_STRENGTH;
> +
> +		for (int k = 0; k < ARRAY_SIZE(formats); k++) {
> +			data.format = formats[k];
> +
> +			run_sharpness_filter_test(&data, TEST_FILTER_FORMATS);
> +		}
> +	}
> +
> +	igt_fixture {
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 2724c7a9a..84d8bed4b 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -58,6 +58,7 @@ test_progs = [
>   	'kms_sequence',
>   	'kms_setmode',
>   	'kms_sysfs_edid_timing',
> +	'kms_sharpness_filter',
>   	'kms_tiled_display',
>   	'kms_tv_load_detect',
>   	'kms_universal_plane',
