Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F02D3B986
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 11:53:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051B510E0FB;
	Tue, 26 Nov 2024 11:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TOpJTLVJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C848B10E0FB
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 11:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732622000; x=1764158000;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RLN+UVMPVxQiuDbM/Ve+10mRSCW3kQmOKNXXlFEN7xE=;
 b=TOpJTLVJq4m4aO6ESTCBR9JCMg4BSb0xeJSKZQKhSzabQOGkNWiTa1IN
 RLUd57bnJaNs9i6esA9s13mpuyqjbWtF852Az9kc3Z7TQsBkDIJrjFsGu
 CcdP8L9161TlQQQAZ2A+JuNyYHdTn4JyAUuLclQVTJUKeprp2HXaJU1AS
 hqOwYH51z5V4Dqnz5apPC6xtvZ8BIgzzv3StJDuKUIHlZ1y7Sa97W+jT2
 hDCfcGOSh+zUosqE80SFjzUUVw5clZAJUTEVsIgvnv2g7u6Qk2ULqBsgE
 YgS8eJxmPbeegiZUtE9Bdo5iLbUdCJLPf+5Byqqp65J8Q9SZinpmpylRx A==;
X-CSE-ConnectionGUID: D6qt3rf9RW21/MGhqGtIhA==
X-CSE-MsgGUID: 6D+dTigaQNu8ngJRxjXnWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32837046"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; d="scan'208";a="32837046"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 03:53:20 -0800
X-CSE-ConnectionGUID: 8MUvtPl/Q+O8ZM5sGu8J3A==
X-CSE-MsgGUID: yPhSe7eBQx6xNYOdz/7+Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; d="scan'208";a="91530797"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2024 03:53:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 26 Nov 2024 03:53:19 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 26 Nov 2024 03:53:19 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 03:53:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fnM07IBPsCW4SYXu3DtJPDFF5o9LDzalIbUKXjQ2l+GumllK49UC2+LWbr4wEAL8obL432HKCucTUpeZVJlwIhFUqkB7D8s7QQfDT1643ox7zHGG1ZoBSQ9+mrTwpzWukrOiPAfqIczXsIT3xamhBauzKMSFEJCgGKCMUEzm2K7TpRvbV27Yz61hkh8EmyANzoc82rqf26h2loEUCOYLMM6hm6JkKEH/7rh7w7/0m9HoIaMaJUraPqo1IB3kwzRMmS4WH7UD3ui3q6dlIDy4UBR76sKCvw6ssyS5x9HAwpAG6iBjs7h3cfjunscZ5DMmNx4Jrt8wpdpWKb9UtVzJng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppYCKcuxr+SGMMa+y+ulFpzjxXUzoMYIwyX158Ya88o=;
 b=CVMyPlj82xxdoyo0b6slI5hD7568T1AxeXpdC1D+nqAz/uP/vN/97HSz7t9mIFdJzHqgSNKxBGyihZk4kfcJTxl0CZvQ9BznYTglUTHVWSQmY8D64vfntJ8kg9i+y2sgnYpGIIe/3NE/nrvcrSAD/xIez//AqDGU/hYa++VYDU7AeMLJo0rQlRrMiSD6VFM15hHYYSuJuDOZ1XmdynNWhP6USdiL935jYVcxTuA4kmFcmNSTr0Sv8AAtlS/fhofIvt+5kZl3JgkXGKvDcZvOVYVE0Ufn7xvw2bs+w1i9HQpPEaIn82E2EqIcYOWS+YGcEuFPVF1DRzotSJnxgtRmpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by PH7PR11MB6608.namprd11.prod.outlook.com (2603:10b6:510:1b3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 11:53:16 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%7]) with mapi id 15.20.8182.018; Tue, 26 Nov 2024
 11:53:16 +0000
Message-ID: <af1d4f6b-1152-418b-b8bf-504fcb45ee2c@intel.com>
Date: Tue, 26 Nov 2024 17:23:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/kms_dsc: Add meaningfull skip message
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <jeevan.b@intel.com>,
 <sameer.lattannavar@intel.com>
References: <20241126054658.1951121-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241126054658.1951121-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::14) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|PH7PR11MB6608:EE_
X-MS-Office365-Filtering-Correlation-Id: f4a0345c-738f-4cc5-37e1-08dd0e10e9cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlY0TkxkVFAxdFV6c3R3WHVrSVVGLy85VXF4UXhFOEpxcUtMRXRJTHJmRUtS?=
 =?utf-8?B?V0ZkeEdaODFhbGJ5ZmRwTVFaWlVoY3BKaXpYRHZrUi8ranJLcllycjQ2U0NG?=
 =?utf-8?B?YVcvWEpvODZzNnkwT3pDRUNJZExmWFp2SXZXY0N1eXJHb0JlbG1waEE3L2lo?=
 =?utf-8?B?blZueFVtNDc2Ykw0czhHQ1VJK0dzQ280Ti93OTFzU25ycVZJUEgzbGJ2dlN1?=
 =?utf-8?B?L1JsNnBEbmx5MS9LSDlnR2V4TURDcldqZC8vSGFSL0tCdWxySFUrY1RMYWll?=
 =?utf-8?B?aUc2M1NDZ0w5Mmg0dE9nbW92QVVDaW9adEQvc3hRNDlLVWIwSDhIQnAxR3pR?=
 =?utf-8?B?UTUzb2dCQ2tFMmhkZHVrYkF1VGQrRmJrT2ZnQ3U4ZVFKc0szRTlKM0oyNkFs?=
 =?utf-8?B?UXFpb2JQZjVPMHgvMmFJaFEyNTZyUC9IY2NrakxrNjFpamdMdGg1ODE0NFh3?=
 =?utf-8?B?Q0hjYUgvaVZBTVdTeFBaTll5UmJlVnk5dElYdWVwR0N5UVMrNVg0angzZktP?=
 =?utf-8?B?clBuY3M5czV5UFRxL3lCT1ZqdCs4ejdXcGt1emRXTDk5V1lWWG01WEdadkdD?=
 =?utf-8?B?S3VMT0pmY1lWYjl1N0FYVXhSWFNvYkxOdXJUQStXNGY4TzEvU09ZSGIxY2ZE?=
 =?utf-8?B?MkFxaDhnUHRPaVpZOEQxUHBzSXdZZHBQNjZXeXhvMDQyc0czaHh2S0JlN2tF?=
 =?utf-8?B?NVRRbER2NzUwMGFOZGt1b2U1dWMybDBsNzZ4MCtQOStEcFdXY3NUMDQ1Z2NH?=
 =?utf-8?B?blpoQXpIRVVqWFFoTTdzMFgxR1htVDRMYWF2cFF2SlBwYzY1WVF1cnVCdFEy?=
 =?utf-8?B?Wkl3Znl0cGVEZHA2bksrSE5EMXhEeUlINkxnNnBhbC9OL3o4Q1Rnd05mK0VI?=
 =?utf-8?B?NlVYUUZBeE1zZlhsVE5ENmFMdXJXSERaTkVpQnV2MlFjL0VBVzBrUFFnN25M?=
 =?utf-8?B?NFV5R08vYW5rQzNFaHFMVmJ6bWZrcmtpQi80aUFhQTRqb05qQVRnMHAxOWJp?=
 =?utf-8?B?RTVUZWh6dEhzZWNYMzBaRUc5STZ3Nk5GdEZHTS9DQUdrOHRxcTJEL0NiOWp4?=
 =?utf-8?B?eUhJc09yMC9IUG9xc1NGYkk3ZHRPYmp5ZnhMVkZuV1hwdVBPOEZxd1BRQVJh?=
 =?utf-8?B?VytKZUIzamk1aUFzQXNZN0xZOXBnZFVlZFN6NTh3SnF0RmN5eVhKZTJvRGs4?=
 =?utf-8?B?UmJjUGl0S0cxRWJGbVFJOVg4eUU4cHpMRkRpWTk1YWtCTFFlbUJHR00zWlcz?=
 =?utf-8?B?TExheWpjcDMwSFJ5VFAxRlJKZ2E2STV0YlUwK2ZFbFBsTDZBM3BjclI4UUM1?=
 =?utf-8?B?Z3luMjl6d0g4VjVaNlQydi9xUjFDYWN2Tjc3ZC9xVXc4UWNyaXAwOHNMUXdr?=
 =?utf-8?B?NERPZGtQM1lYcWRJMEgvSnY5cjZTaEtXeURUVnRqa3RhK0d4NFRPdTJkdGdr?=
 =?utf-8?B?MzFiR2hneU95R21qOFYvMXhHQ2hHZmp1VWRYNjNZUWZJZzk2YWtNZG9XTEkw?=
 =?utf-8?B?Zmp4eDQ1cU9oRzRBdDFYSWZoTmhhMHdFdHFmNTlQSTFFQXZPZWpRV2hmck85?=
 =?utf-8?B?YXhmamJPVDJJYndNcHQwYjhMOGpRdTViSUwyTkNKTVBoUHJMMm9HdWF6K2Ja?=
 =?utf-8?B?VEIxUHIxNUNKNWhIOHJ6K2xZNDFZSUt0YVBjblVoT3hKTjI4RmNsSDdhZ0E1?=
 =?utf-8?B?STdjTGtRSGJublh6Z2tEODV6MEN2azRxZnJoUEhoUWxib3pwdTJJaDVsQzdh?=
 =?utf-8?B?dnJ3MFdKdEllQ0x6b1Q5bHdnZUFxL0cvUVNxWHE5SVUrS2h4ekpvamlDZFZZ?=
 =?utf-8?B?YkIvMWdVRXdwcTBwYXowQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzJZY01kQTVtVzhKZjN4bXdBdi9CTk9zTjRDQUZtaGN5QVducWZVOEUzcFVu?=
 =?utf-8?B?V1ZieWNBaFNxemZMUmhHaWtBMUMzMTJyZUM2MTdUTTVFT2ZtOThwNE5uVFBz?=
 =?utf-8?B?TEdTbWNBUHdROTVPWGQ1S2dZNkVMMUR0VlcvR2k5VjJnbzVrOGlBNjNpdDFi?=
 =?utf-8?B?WWJPK3lzTmJxaWIxQW16OUR3MjRvRVU0d1VuTDVNWmZNOWlyNHNSb1JXWUJF?=
 =?utf-8?B?T1NkZEdkeWh3aHZRNzhLWjN0K3VUZjY0NW9rdVg4bnNDcnNNUEI0TkFJNkpu?=
 =?utf-8?B?dWk3dENUS3Q3V2E0eG00UHFiVk1laG03R1MwMS82aHBmRTY0bnJkRUNYSWlw?=
 =?utf-8?B?dVE0c1pvK3QzRVpxTkNnZTB5VEZtclJlV3M3ZWtESXlWREdTaHQ3N2JNUkNi?=
 =?utf-8?B?akppQXcrTWRFL3pldVZ0M25WakY2SGh1TENSWDRUMEFUbHl6MHRNZE5HMzRi?=
 =?utf-8?B?RFlYQmdFak1oNjduTlExWWNZS0VoeGlUK0RuaHFHcTVidHhrS250NStnUWho?=
 =?utf-8?B?RWtqSkNwV2doWjBqODA5SDI4ZDd5Yk1WbjMzZHpCVysxYjVSL2tpb1FsaUFC?=
 =?utf-8?B?RWhOLzNHRG5Xc0FYSnRocis1eFpKODVLQWY0cjFvNmZxcUtmZmFkVnlpQ2J2?=
 =?utf-8?B?dUdrUytUOVY4eVY0QW5OSzV2SlM0OTJ5Qk9wek5PWmF1WGo4aVdRSkYyWDVa?=
 =?utf-8?B?djlYUUJ2R3J6eldyanF3cmVmVE1BelpRUWpZZjZiUytSOHFMOUNaazRFSFJt?=
 =?utf-8?B?cTUyNWUrVzJCWm5RTGtuN1lsRzVaWklUMzRCM3greWRVL1FyQ2w4b3JQdzgv?=
 =?utf-8?B?VUJGclhpWXY2K2lobnQ2SVZ2WXcweFNBcnpWZ3lNUmpQK0pLMEdkSTI0L0s5?=
 =?utf-8?B?bVZoSGVPWnpBY0J5SEVCM2pPVCtRd01RVVpMQ3JFNXlOK1E4ckNGSFdMNjZk?=
 =?utf-8?B?YzlxVyt3SGhJN2YxVUN5eTJqREIvdGlONjVCSVdsdGR6SysrTU9CMmFNYSts?=
 =?utf-8?B?ZHJaSHM2S2RSSWoxdmxZWE1DWmxHaXZaQ1p1OVUyWHBaaEdpVnhGR1FUVytX?=
 =?utf-8?B?NitOZ2NJTnJvcTVkOWZ5eUtSTEd5V1J1TUl0UC9FZEduWEFNYjY0ZDZtN0xZ?=
 =?utf-8?B?ajhwT2FIcWZsek1GbmtiZmNESXl5M1oremxhdWpLRjYvcXljeVlzalR1Uzhj?=
 =?utf-8?B?SEp0Q0ZTN0taL3N2WTBHTHFHc0ZETjI5dmVzWkhEOHlFd0tqVU5ycXJ1ckxB?=
 =?utf-8?B?bzZydzhUQjkyVjA4bk5ySkVzRWh3NlpEMi8ycWpnb2IrWllucCt6OStJL0Vh?=
 =?utf-8?B?N3Y4MllNWlVCZVU4SEVWYmtlZU1mSzk2V2s4RittbmI3c055dmwzRWRUZGJN?=
 =?utf-8?B?NllLSzE0SmgxV3FEMTdtZzFFZWV5VDVyU1owVVRlNXNERkNMbWRWdVhxVHdJ?=
 =?utf-8?B?SFlEa2hMN2o3MnMxUkV2TytEZE1tWnlRWTl5RnlBT3FuZ0pDK3ZBbUdUY1Fz?=
 =?utf-8?B?dWxFTGxpNkpqNXErTEFEL2JNNStjSFRDY0doSWlZV1FOcittWWpteHF6Nk0v?=
 =?utf-8?B?eGhxT2RuTTBqMUZCOTkzVE5BVXl6Sk1Cbkd3SlZTYjFSSUdleCt3SnFOd1hM?=
 =?utf-8?B?NVQvK1NqOEdrLzBuWW9jaHVMOVF0d3M3bFlnZENxVFNtdFFCenRiNHNEbjQ1?=
 =?utf-8?B?WDhzMTNaYlR0akNSd0ZxKzZoMWFkK2pDUnV1NVVZaXg2K0p2ODN0SlJ5VGZy?=
 =?utf-8?B?bi9QV3cwSWRqRTIwekZRVnpPK29GeG9LQytxNjErMlpEWlh5b0J4WTZYMEJl?=
 =?utf-8?B?dGJhenh6WG1tcUxQdVNCa1R6bTBKRmpEeXJDSFRGZGtwZ3lZYzgvNjh0TWor?=
 =?utf-8?B?bFhiUTRhbHZXVisvZms4c0RhanlWMTRrUmYzenBxTXNUWDhta25ldjliKyth?=
 =?utf-8?B?N3pTRTVqMDFwZGNyYzJvcmtyTW8ycXJyQkErU3JkVGpEN1pFYVdPWkRIVEYz?=
 =?utf-8?B?Q1ZWQTFLTkJ1ck5Cc0lpYk9lNmVuNS84Qnd6RC9oNkdKSmJWQ016OUtmdnhQ?=
 =?utf-8?B?R0IxZzZSWlJWeXRLYW1Qbi9lVkpITVNqVW90MFJTN0R0dFRNYWgvZ2hvSDlq?=
 =?utf-8?B?SWJOeDU3Zm81UmRyUXZ2aGlZSFNEVUJJcXh5TGl3NTVJNzV6ZGNuU3B1SURo?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a0345c-738f-4cc5-37e1-08dd0e10e9cf
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 11:53:16.4900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2ZR4q/7vkdtWU9ZPYnlVHuoSayK9OyWtdYs/AymYOxtt8/Rp15G2X44ho6YYHcXHOr0RSn2l0zOh4in4LRmiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6608
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

Patch is not doing what is in the subject. I already have idea how to 
improve this.

Is it possible to put this patch on hold?

On 26-11-2024 11:16 am, Pranay Samala wrote:

> This patch adds a proper skip message which will be
> easy to debug.
>
> v2: Small clean up in if statement
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> Reviewed-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_dsc.c | 34 ++++++++++++++++++----------------
>   1 file changed, 18 insertions(+), 16 deletions(-)
>
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 9b48caf76..5ebb12e9d 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -280,21 +280,6 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   		data->output = output;
>   		data->pipe = pipe;
>   
> -		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
> -		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe) ||
> -		     igt_get_output_max_bpc(data->drm_fd, output->name) < MIN_DSC_BPC)
> -			continue;
> -
> -		if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
> -		    (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
> -						     data->output, data->output_format)))
> -			continue;
> -
> -		if ((test_type & TEST_DSC_FRACTIONAL_BPP) &&
> -		    (!is_dsc_fractional_bpp_supported(data->disp_ver,
> -						      data->drm_fd, data->output)))
> -			continue;
> -
>   		if (test_type & TEST_DSC_OUTPUT_FORMAT)
>   			snprintf(&name[0][0], LEN, "-%s", kmstest_dsc_output_format_str(data->output_format));
>   		if (test_type & TEST_DSC_FORMAT)
> @@ -303,8 +288,25 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   			snprintf(&name[2][0], LEN, "-%dbpc", data->input_bpc);
>   
>   		igt_dynamic_f("pipe-%s-%s%s%s%s",  kmstest_pipe_name(data->pipe), data->output->name,
> -			      &name[0][0], &name[1][0], &name[2][0])
> +			      &name[0][0], &name[1][0], &name[2][0]) {
> +			if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
> +			    !check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe) ||
> +			    igt_get_output_max_bpc(data->drm_fd, output->name) < MIN_DSC_BPC)
> +				continue;
> +
> +			if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
> +			    (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
> +							     data->output, data->output_format)))
> +				igt_skip("DSC %s output format not supported on pipe-%s\n",
> +					 kmstest_dsc_output_format_str(data->output_format),
> +					 kmstest_pipe_name(data->pipe));
> +
> +			if ((test_type & TEST_DSC_FRACTIONAL_BPP) &&
> +			    (!is_dsc_fractional_bpp_supported(data->disp_ver,
> +							      data->drm_fd, data->output)))
> +				continue;
>   			update_display(data, test_type);
> +		}
>   
>   		if (data->limited)
>   			break;
