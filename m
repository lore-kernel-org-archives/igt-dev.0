Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A65606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 09:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nO7NEfH6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC7210ED54;
	Mon, 26 Oct 2026 09:51:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BAAB10ED54
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 09:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793008236; x=1824544236;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Cv3KnHvP7JPUcrnp3/QEuhMDdg3oXEHQXOMFB4u/kiw=;
 b=nO7NEfH6XM+iqPJCvzehblUcOdMwW8SzPGlUFYowh8IwWgBKmAi5Zhae
 czqAReEvjMWRpvnxDi/PApneOX3geq8lU5igreejngXfDMeeMqK79c2IT
 McIeLRlHmaT0sZAUtRKB1dEmZ4LRuWWUCUvPNAW5HwVr9W3lYBTIBRGpR
 VdvSHZk3qXeLssc4z12VlfWYVRNv9v07tga5kqBOJFPKINM4MUBiB438c
 vONjq3re05CcAfj5blutgEkBWaw/LPw5FPxa3BxGDQPAmpxciXieLcfFc
 PhlkJ9NXBLD4sFDR8hBISkFVpxZ20rDHT/k7KrRele9fToQW7/JsUPJ05 Q==;
X-CSE-ConnectionGUID: 7RKsyvIYR5mb4YsRcwgBAQ==
X-CSE-MsgGUID: 20vC8WIHQf2xKjn3SAMtYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1679851"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1679851"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 02:50:36 -0700
X-CSE-ConnectionGUID: 8QUi8mR9RQGvKhelD6poow==
X-CSE-MsgGUID: VJ2SEmIbQC+1aZupZylJNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4323970"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 02:50:35 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 02:50:35 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 02:50:35 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.11) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 02:50:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEDPNjc44VtEUNCft6ANFfZ13O+wQ4FYMTE83NH1UZ5Wc5TiG/EXhC6fAXi5Cai2RnPuLayvH/fz+KrLso+YyGAjIEruuQMvM7rFwns64SgeDDpPLHt+L+TFtp1sAX6B0JUy+A2UVkVOVlv0ELQJBo3gE/hebct5gKDABWMerpl2HS61rra+ExFZJiJuvOCB85Kh4cpVfnzhBNh/Vd2pg7htITNuqz67tk3coNqmPfN9ZYPFsyTXwWAcxocedcfGpOMoshWSvGbt5+5VeLYn0rHTGWtQLO9lBJl7qcbkG7EN4Hmb3RYS0vjgRl7kVT7GRF2LiC2aoAqX9tVVzgOaRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzwiftydgUuvsJKpBPp3cT0LoWHwMNfbRsU9m62TS+8=;
 b=EyXpO9hYQaz+Zos684iDiO4fTSFX4BkiDQgybxpxEZd64SI8U8KFrcsoxBbPPHP5HC87GIegnGS/xZ5ag94F2LdqHJSDDF8aoTvjcYj3TtjLRFtWpIk9wdEbQ6EBvzVuy5eQi6x5Zkhw8nvmdGvE7jDvwJu4HNjJFHlezPoB/tZbnobl6hXtVaimuuxaa+s9FvxI7EBQlVpN3ljYmndwpok4Y8PvbOcrNTpJz8N1JJ2l1hi2h2Ril30AAZDYhCxOzZNgWulkV05Cv3XLGYWxEAqSKQy3iGzXelcWgmGQe1ID1yigvdt1tsvOkk+LEr7BrLK12T76EbDEgqykiU78dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW6PR11MB8390.namprd11.prod.outlook.com (2603:10b6:303:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 09:50:32 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 09:50:32 +0000
Message-ID: <dc6915e9-fccd-4473-9c33-35010d65d427@intel.com>
Date: Mon, 26 Oct 2026 15:20:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/10] tests/intel/xe_err_injection: Add tests for L2
 bank Corr err threshold scenarios
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Soham Purkait <soham.purkait@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Raag Jadav <raag.jadav@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
 <20261013190651.897241-10-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261013190651.897241-10-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW6PR11MB8390:EE_
X-MS-Office365-Filtering-Correlation-Id: 66381d25-254b-415d-c863-08df33469362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|4143699003|11063799006|56012099006|261009221227099003|261009223027099003|261022105027099003|261022075727099003|261021135927099003|261022113327099003|261021121427099003|10067099003|18002099003|6133799003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 3wDmO2ZuxUDf5MKl7UIIQKvq91o5fx9UGzL8FYLema2AkaZ/dgV3a1SfwwZn5QR3vZauKdDRq3LPaIqW9j13qnCphxIDty5J7a9MBB16p7FHfBLQwTI8tX+pCyi7cluH3knSSQXgSztDou3Nbx+sW+gf2lRQYiqladldeE4ezoNrxJoqkk/6RNY1MYGU5tzdG3rnka5pUtBvAz8pznHiyIS4+nnLXJ+S/a9tOAFZxyQhXA0pNatMXdyTEdqxW01zqXWTGDPT9y/bTyBbjiTylyuK06vuYo1kKaXh238yXdBT9yppLw6pXErAlVo3EO39l3Lm+BJ10Sa5FWp0UBf+UHkLarMmLImD+OEWu9EK0TyZV3rJHfdjbyAMipJEVCYDD3iJe4LMosmFzhf5ON22e2Ncpw9twIjSBqXkGl3RGchwROg9GmI37p+Te8BzAuyZv4IqLMJOGHGiaDmQV4W9p8HVBkk4lnPi71kzGOcxi7n7uZel7bsn8ucfq9/XAIEDBZhr5Rj5vl63mC3mMmNXBY8u+wfSweyTMwUVLxnw+tKcllZqXdtbIPSfj7wc+UgKAphXRIdMrfY4JJoKTN7UXixhzfDw0M5bNDGPjH9OA1RMvTOFAXX5OF0kVfAiF5BElutL2JwQjv+EyXVYnloAbAsQruYfeHmk8mJAeWPHTKk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(4143699003)(11063799006)(56012099006)(261009221227099003)(261009223027099003)(261022105027099003)(261022075727099003)(261021135927099003)(261022113327099003)(261021121427099003)(10067099003)(18002099003)(6133799003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmxENFl3TFVEZjliWEpHellZTGVWUnRMMmNkM1pYbEZ1VnNDeXRjempsejFR?=
 =?utf-8?B?T2FtaEJTazNzdDVISlp0MXFvTE5LdFJ5TWJyNjJ3TDBQNmhUdTNBVmxrRnVk?=
 =?utf-8?B?WlV5bllUWVJLSjd2V0J5R09TOU9uMjVLdXhsVmlwbE1URStRSjdmTHNtN2lL?=
 =?utf-8?B?K0puZHZTbVA0QzY2ME50VXlqelUxQVRpbDFnZStLZDZZRXJ5QXFmd2RGUWw5?=
 =?utf-8?B?aXl1cXlRVDRoRjRNNjgxQWZ2ZUQ2ckk4K0h6ZktQanlWVTIwR0UveCtZRjND?=
 =?utf-8?B?WHQ4b1NBdGdKZDhCZ24rUjlsVENWQUZEbFhNSnEza0wrWHFOVWFuN2JWbUl6?=
 =?utf-8?B?TXpGT1duM3pxQVBEc0R2TnVTc21XaW15enA1ZXI0L1NZMko1V0tKbnpvRDRY?=
 =?utf-8?B?Q2FPelQwSXhKTVh3L1VjbkhXY3RUYWpCcmt4R0o3elZ4RGkrN1hwY0JUeFBY?=
 =?utf-8?B?S21kRzJKcTdhMkpIenYwK2ZHR2FvOGdoYTdQME1TQ2lrcStoQXljOUxmbUk1?=
 =?utf-8?B?NXN4b3c0M0NlY3V6empkSy85TitsUWNKbTBYamNGN1AvZXdjWUdBT0RtT3pG?=
 =?utf-8?B?cUcvdjFSUDRycXB2RlRwMHY0NGhSR000WjhhNGd2dmQvZlVmcGxtdjBCZC9x?=
 =?utf-8?B?cnNVSzk3ZlA2UDF2YVdZY0h1UG0zWU5zcEJrRk1jU3dQS1RHVDlQQXlFZTYw?=
 =?utf-8?B?emcxLytGeVNsNkdWNFRJdWRpVzBoRXUzS28yZkN6R3UrRzdGUkE1RlEyWWJm?=
 =?utf-8?B?YUtQbCtXY25yaEk4MGFaYWNNODFYK1k4WXQwMWxVTHFXbHdWemxCbTlUMStH?=
 =?utf-8?B?Q2NvcjBQaFFnOTFZa0wwTytYa1hZVGZWTEVtc0lENWI4bnAyWGZxR2JsdUtY?=
 =?utf-8?B?UENIU1IzNTZFMWhWeklrTFoxMUxVdmNQSlJXcFovUUVkNWZqZWVweEo1NDRO?=
 =?utf-8?B?SkhNNzl6TmtEWENvSXFkMkVSNk9ldktYWHNyMTRNdEdMMFRUckhSSzVEY3pX?=
 =?utf-8?B?T2taWjhOL0VJU0kyKzFLQ2RrVzZBZFNnOStpVWwzaXNLd0tUVHBLaGJVTkhX?=
 =?utf-8?B?UFBUWDlpOHJiQlo1UldEa1RkK3RVajFGMlhQQzJpdTR2RHlhSmVoSzBMUkt3?=
 =?utf-8?B?VTJPcXgzMGppcTcxQnMvcXBlOGFzT0toc2gzNmc1N0dSSS9ZdmluOU1OcVU2?=
 =?utf-8?B?N2JmOWszcVNpRlFmSHNJMHBEV0JSVkh4b1gxZTMrdm5mdXhPYW9oNyt6RDZB?=
 =?utf-8?B?ZmdEc05sN01iV1p3ZE5rVTZaMUZBdXlWZWZaNG1NdVpCbE00WnVBY3Q3SUIw?=
 =?utf-8?B?MEVxR3lmbjVJVUtjdVBHR0V4UjZxdUdIeUJKMDdkZHdxTlMyOUNzQ21PQUdI?=
 =?utf-8?B?R1NWVWExbTNjRTlBSTY2WXkxQXQwTGN4NmlIaThTdS82YVRMT1BndHRyNmxp?=
 =?utf-8?B?V3RjYjhKTmNDWmp1UEJKWndwbHRNZFVzZUtKSTVjYVR2cFIrdjFkSW9semV5?=
 =?utf-8?B?VlE1bTI2YXJyT2xUbEcrSGk1d3k4R0o0dU83YVgrYjgxUTBaeHl6TjNBNW1m?=
 =?utf-8?B?Ti9Id3BhODNpMW9vVUZBMHl6WkdXOE5uNG5aUHkvQkRNUmpuV3JwMzNsUlpW?=
 =?utf-8?B?UHl4ZVlXTytNWFYvaUFKUkJuaXhSWlJQZjJXQ3UwM29nOGMzMzR4emV4UGxR?=
 =?utf-8?B?YmdGTGlWU3MrQXFDVEh5dmY3d0d2WGtZVmg0djRjWlZsaUE3cmowOXZSUTZY?=
 =?utf-8?B?anhZVkVXSlh6eUE0ZjA2RHFYb0x6d0RkZHZLZzRsYy9JV2xMWW9OaWRBN0Rt?=
 =?utf-8?B?aXdHNDF3elpuajI5eW82RDBXd3NXNWJjZmtqMXFrYS90em9rRkdiVDdFNmpB?=
 =?utf-8?B?bmE5NndhUlB3SXZDS1V4UDY5V01LRi9uc0hZcjRpUGhQRkE2WitKSW5PaUgv?=
 =?utf-8?B?d0VrYVdFODhMT0svLzZIY2w3bHZjNzJoSnE4ejVFZWZLVE5aQlhkcWprN2ow?=
 =?utf-8?B?aHI4dGwrYWE5a2lZVEEwUU4zNVpMQXJRKzhZcHJ3Y3hpVXBUUEI3Uy9Oc0hw?=
 =?utf-8?B?N0x6SlBGV3BvWGh3c3pqNVZhMC9XRTFENWpkSjlZS2ZBc3hnOXpEd1BxTDMv?=
 =?utf-8?B?MzhTNjcrYXg0TVpyVWw1WjdGaWZ5bFNpSjRITWM5YWdEL2VMV3BXYkhjUU9i?=
 =?utf-8?B?ZzFUeG43NDRIM01TMkxOMEVmSmVXNnhvR3I3T0xRYWtja21saWFIVFBIY0t0?=
 =?utf-8?B?RDFwREtMRDJQOXFySmdwZGd0VGNMSVFRWEh5UzE0VXNFQXQ4aEtrWUhoZ2NR?=
 =?utf-8?B?U2V5YnhWOHNjY01FU2dnQk42ZVYyS2JTZ2dxd016MDdsUmxlOEhzZz09?=
X-Exchange-RoutingPolicyChecked: FP32JFkqXx95KFdRkcaRm96rd3+k24NxyyOp2WMx5CN+v+AJOEEY6B2GMcYFxTuQuUhh/Vu2GoZOgUn7gPqRcOorSFUXR5oEMDwYj0SfaIKbnMuSx585+WHAhMf2N9cxtMkVLOoCkMA53ms4va38fcWfp8AYrNJ6o7NxbBcmN1BzVzccb7NR5m/xYAscS9ezuszKIn6eRtLMCLYQUQBOI0giGRc9DcsLjoMWS9zrO97LBKwwdyJAm56PZxjMO9e4FwJ3nNeDlfCY97z5LrO1yJWWeSPL6lnHf1vs6u9uCk2KNP7IXNC5mDykIb8HIKxpd4qbrfRv0X5ARPyUg/AF+A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 66381d25-254b-415d-c863-08df33469362
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 09:50:32.6872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BoqxxFg/V3l8ZLBltPQ2DKKbCQZe7CraXWLeGHbwU7vfY1P1b2jg5wixqwlFbcdJ6MB9NH9h6c6lIcS1gZJQ4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8390
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 14-10-2026 00:36, Ravi Kishore Koppuravuri wrote:
> Introduced L2 bank correctable error threshold subtests:
>     - single correctable error
>     - Correctable error with threshold set to 1
>     - 16 Correctable error injections with threshold set to 0xF
>
> Add DRM RAS netlink error-notify event subscription to verify
> correctable error detection across all the above subtests.
>
> Cc: Soham Purkait <soham.purkait@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Harish Chegondi <harish.chegondi@intel.com>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
> v5:Removed xe_err_injection.h and moved its contents into the .c file (Riana)
>     Prefixed all register address and bit value names with "XE_" (Riana)
>     Added error handling logic for function calls
>     Changed test name comparisons from strings to enums (Riana)
> v4:Add support for steer semaphore while disabling and enabling
>     multicast (Soham)
>     Used updated library names with igt_drm_netlink_* prefix (Nikula
>     Jani & Kamil)
>     Updated error event name from error-notify to error-report to align
>     with the latest changes in drm-uapi/drm_ras.h
> v2:Disabled multicast before arming the injection to perform an unicast
>     injection.
>     Updated the condition to verify response from wait_for_error_notify_event
>     condition from an event error value of exactly 1 to the configured error
>     threshold.
> ---
>   tests/intel/xe_err_injection.c | 312 +++++++++++++++++++++++++++++++++
>   1 file changed, 312 insertions(+)
>
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> index 332b2cae0..796b4d696 100644
> --- a/tests/intel/xe_err_injection.c
> +++ b/tests/intel/xe_err_injection.c
> @@ -44,17 +44,36 @@
>   #define XE_STEER_SEMAPHORE_MGSR_3D_VALUE 0x1
>   
>   /* Node types for error counters*/
> +#define NODE_ID_CORRECTABLE_ERROR 0
>   #define NODE_ID_UNCORRECTABLE_ERROR 1
>   
>   /* Error types for error counter */
>   #define ERROR_ID_CORE_COMPUTE 1
>   
> +/* L2 Bank (LBCFLOCKMSGREG) error injection */
> +#define XE_L2_BANK_ERR_INJ 0xB1B4
> +#define DATA_1BIT_ERR_INJ_REQ (1 << 3)
> +#define FUSA_TEST_MODE_ERR_INJ_REQ (1 << 2)
> +#define MASK_BIT_FOR_DATA_1BIT_ERR_INJ_REQ (1 << 19)
> +#define MASK_BIT_FOR_FUSA_TEST_MODE_ERR_INJ_REQ (1 << 18)
> +#define XE_L2_BANK_DATA_1BIT_ERR_INJ_CONFIG \
> +	(DATA_1BIT_ERR_INJ_REQ | FUSA_TEST_MODE_ERR_INJ_REQ | \
> +	 MASK_BIT_FOR_DATA_1BIT_ERR_INJ_REQ | MASK_BIT_FOR_FUSA_TEST_MODE_ERR_INJ_REQ)
> +
>   enum {
>   	RECOVERY_SUCCESS = 1,
>   	RECOVERY_FAILED,
>   	RECOVERY_TIMEOUT,
>   };
>   
> +time_t event_timeout = 10 * 1000; /* 10 seconds */
> +
> +/* Cleanup helper for injection test functions */
> +#define CLEANUP_ON_ERROR(ctx, fw_handle) do { \
> +	igt_drm_ras_nl_cleanup(&ctx); \
> +	release_forcewake(fw_handle); \
> +} while (0)
> +
>   static bool run_xe_compute_on_all_engines(int fd, bool state)
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -312,15 +331,287 @@ static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
>   	gt_uc_wkr_parity_recovered = true;
>   }
>   
> +/* Inject a GT correctable error */
> +static void l2_bank_corr_err_injection(struct xe_mmio *mmio, int fd)
> +{
> +	/* Disable Multicast for unicast error injection */
> +	acquire_steering_semaphore(mmio);
> +	xe_mmio_write32(mmio, XE_MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
> +
> +	/* Arm the Injection */
> +	xe_mmio_write32(mmio, XE_L2_BANK_ERR_INJ, XE_L2_BANK_DATA_1BIT_ERR_INJ_CONFIG);
> +	igt_info("Armed L2 Bank Correctable Error Injection\n");
> +
> +	/* Rollback to Multicast */
> +	modify_reg_bit(mmio,
> +		       XE_MC_PKT_CTRL_MGSR_3D_ADDRESS,
> +		       XE_MC_PKT_CTRL_MGSR_3D_VALUE,
> +		       true);
> +	release_steering_semaphore(mmio);
> +}
> +
> +/**
> + * SUBTEST: test_l2-bank-corr-err-threshold-1
> + * Description: Inject single bit error injection in SSA data array when this bit is written
> + * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
> + * Functionality: error injection
> + */
> +static void test_l2_bank_corr_err_injection_with_threshold_1(struct xe_mmio *mmio, int fd)
Shorten name:

inject_core_compute_error


> +{
> +	int fw_handle;
> +	int ret;
> +	uint32_t current_threshold = UINT32_MAX;
> +	struct igt_drm_ras_nl_context ctx;

inverted xmas tree

> +
> +	fw_handle = acquire_forcewake(fd);
> +
> +	ret = igt_drm_ras_nl_init(&ctx);
> +	if (ret < 0) {
> +		release_forcewake(fw_handle);
> +		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
> +	}
> +
> +	/* Subscribe to error-report event */
> +	ret = igt_drm_ras_nl_subscribe_error_report(&ctx, DRM_RAS_MCGRP_ERROR_REPORT);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false, "Failed to subscribe to error-report event (ret=%d)\n", ret);
> +	}
> +
> +	/* get current GT Correctable error threshold */
use core-compute instead of GT
> +	/** TODO
> +	 *  Fetching node_id and error_id dynamically is pending to implement.
> +	 *  For now, using
> +	 *  node_id=0 (correctable_errors) and
> +	 *  error_id=1 (core_compute)
> +	 */
> +	ctx.node_id = NODE_ID_CORRECTABLE_ERROR;
> +	ctx.error_id = ERROR_ID_CORE_COMPUTE;
> +	ret = igt_drm_ras_nl_get_error_threshold(&ctx);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false, "Failed to query GT correctable error threshold before injection\n");
> +	}
> +	current_threshold = ctx.error_threshold;
> +	igt_info("Current GT Correctable error threshold: %u\n", current_threshold);
> +
> +	/* Set GT Correctable error threshold to 1 */
> +	ctx.error_threshold = 1;
> +	ret = igt_drm_ras_nl_set_error_threshold(&ctx);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false, "Failed to set GT correctable error threshold before injection\n");
> +	}
> +
> +	/* Inject a GT correctable error */
> +	l2_bank_corr_err_injection(mmio, fd);
> +
> +	/* wait for 10 secs */
> +	ret = igt_drm_ras_nl_wait_for_error_report_event(&ctx, event_timeout);
> +	if (ret == 0 && ctx.event_error_value >= ctx.error_threshold) {
> +		igt_info("Injection: %s %s\n", "L2 Bank Correctable Error with threshold 1", "Success");
> +		igt_info("Received error-report event Notification from %s:node_id=%u error_id=%u "
> +			 "value=%u match=%d\n",
> +			 DRM_RAS_MCGRP_ERROR_REPORT, ctx.event_node_id, ctx.event_error_id,
> +			 ctx.event_error_value, ctx.event_received);
> +	} else {
> +		igt_info("Injection: %s %s\n", "L2 Bank Correctable Error with threshold 1", "Failed");
> +		/* restore threshold before failing */
> +		ctx.error_threshold = current_threshold;
> +		igt_drm_ras_nl_set_error_threshold(&ctx);
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false, "Did not receive expected RAS event or error_value after injection\n");
> +	}
> +
> +	/* restore GT Correctable error threshold to original value */
> +	ctx.error_threshold = current_threshold;
> +	ret = igt_drm_ras_nl_set_error_threshold(&ctx);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false, "Failed to restore GT correctable error threshold after injection\n");
> +	}
> +
> +	CLEANUP_ON_ERROR(ctx, fw_handle);
> +}
> +
> +/**
> + * SUBTEST: test_l2-bank-corr-err-16-times
> + * Description: Inject single bit error injection in SSA data array when this bit is written
Inject core compute error should be sufficient for description
> + * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
> + * Functionality: error injection
> + */
> +static void test_l2_bank_corr_err_injection_16_times(struct xe_mmio *mmio, int fd)
> +{
> +	int fw_handle;
> +	uint32_t current_threshold = UINT32_MAX;
> +	uint32_t gt_corr_counter_before = 0, gt_corr_counter_current = 0;
> +	int ret;
> +	struct igt_drm_ras_nl_context ctx;
ditto
> +
> +	fw_handle = acquire_forcewake(fd);
> +
> +	ret = igt_drm_ras_nl_init(&ctx);
> +	if (ret < 0) {
> +		release_forcewake(fw_handle);
> +		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
> +	}
> +
> +	ret = igt_drm_ras_nl_subscribe_error_report(&ctx, DRM_RAS_MCGRP_ERROR_REPORT);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false, "Failed to subscribe to error-report event (ret=%d)\n", ret);

Suppose we assert here and fail. What would happen to the already held 
forcewake?
Don't we need exit handler here?

> +	}
> +
> +	/* Query error counter before injection */
> +	/** TODO
> +	 *  Fetching node_id and error_id dynamically is pending to implement.
> +	 *  For now, using
> +	 *  node_id=0 (correctable_errors) and
> +	 *  error_id=1 (core_compute)
> +	 */
> +	ctx.node_id = NODE_ID_CORRECTABLE_ERROR;
> +	ctx.error_id = ERROR_ID_CORE_COMPUTE;
> +	ret = igt_drm_ras_nl_get_error_counter(&ctx);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false,
> +			     "Failed to query GT correctable error counter before injection\n");
> +	}
> +	gt_corr_counter_before = ctx.error_value;
> +
> +	/* get current GT Correctable error threshold */
> +	ret = igt_drm_ras_nl_get_error_threshold(&ctx);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false,
> +			     "Failed to query GT correctable error threshold before injection\n");
> +	}
> +	current_threshold = ctx.error_threshold;
> +	igt_info("Current GT Correctable error threshold: %u\n", current_threshold);
> +

Can't we have a single function for both threshold 1 and 16 by passing 
threshold as parameter?

> +	for (int i = 0; i < 16; i++) {
> +		igt_info("****** Injection iteration: %d ***********\n", i + 1);
> +		/* Inject a GT correctable error */
> +		l2_bank_corr_err_injection(mmio, fd);
> +
> +		/* Query error counter after injection */
> +		ret = igt_drm_ras_nl_get_error_counter(&ctx);
> +		if (ret < 0) {
> +			CLEANUP_ON_ERROR(ctx, fw_handle);
> +			igt_assert_f(false,
> +				     "Failed to query GT correctable error counter:iteration %d\n",
> +				     i + 1);
> +		}
> +		gt_corr_counter_current = ctx.error_value;
> +		igt_info("GT Correctable error counter incremented by : %u "
> +			 "since before initial injection\n",
> +			 gt_corr_counter_current - gt_corr_counter_before);
> +	}
> +
> +	/* Confirm whether error counter incremented by 16 after 16 injections */
> +	if ((gt_corr_counter_current - gt_corr_counter_before) == 16) {
> +		igt_info("Injection: %s %s\n", "L2 Bank Correctable Error Injection 16 times", "Success");
> +	} else {
> +		igt_info("Injection: %s %s\n", "L2 Bank Correctable Error Injection 16 times", "Failed");
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false,
> +			     "GT Correctable error counter didn't increment "
> +			     "by 16 after 16 injections\n");
> +	}
> +
> +	ret = igt_drm_ras_nl_wait_for_error_report_event(&ctx, event_timeout);
> +	if (ret == 0 && ctx.event_error_value == 1) {
> +		igt_info("Injection: %s %s\n", "L2 Bank Correctable Error Injection 16 times", "Success");
> +	} else {
> +		igt_info("Injection: %s %s\n", "L2 Bank Correctable Error Injection 16 times", "Failed");
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false, "Did not receive expected error-report event or "
> +			     "error_value after injection\n");
> +	}
> +
> +	CLEANUP_ON_ERROR(ctx, fw_handle);
> +}
> +
> +/**
> + * SUBTEST: test_l2-bank-single-corr-err
> + * Description: Inject single bit error injection in SSA data array when this bit is written
> + * (this bit is a self clearing bit, event will be generated once written) - Correctable Error
> + * Functionality: error injection
> + */
> +static void test_l2_bank_single_corr_err_injection(struct xe_mmio *mmio, int fd)
> +{
> +	int fw_handle;
> +	int ret;
> +	uint32_t gt_corr_counter_before = 0, gt_corr_counter_after = 0;
> +	struct igt_drm_ras_nl_context ctx;
> +
> +	fw_handle = acquire_forcewake(fd);
> +
> +	ret = igt_drm_ras_nl_init(&ctx);
> +	if (ret < 0) {
> +		release_forcewake(fw_handle);
> +		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
> +	}
> +
> +	/* Query error counter before injection */
> +	/** TODO
> +	 *  Fetching node_id and error_id dynamically is pending to implement.
> +	 *  For now, using
> +	 *  node_id=0 (correctable_errors) and
> +	 *  error_id=1 (core_compute)
> +	 */
> +	ctx.node_id = NODE_ID_CORRECTABLE_ERROR;
> +	ctx.error_id = ERROR_ID_CORE_COMPUTE;
> +	ret = igt_drm_ras_nl_get_error_counter(&ctx);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false,
> +			     "Failed to query GT correctable error counter before injection\n");
> +	}
> +	gt_corr_counter_before = ctx.error_value;
> +	igt_info("GT Correctable error counter before injection: %u\n", gt_corr_counter_before);
> +
> +	/* Inject a GT correctable error */
> +	l2_bank_corr_err_injection(mmio, fd);
> +
> +	/* Query error counter after injection */
> +	ret = igt_drm_ras_nl_get_error_counter(&ctx);
> +	if (ret < 0) {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false,
> +			     "Failed to query GT correctable error counter after injection\n");
> +	}
> +	gt_corr_counter_after = ctx.error_value;
> +	igt_info("GT Correctable error counter after injection: %u\n", gt_corr_counter_after);
> +
> +	if (gt_corr_counter_after > gt_corr_counter_before) {
> +		igt_info("GT Correctable error counter incremented by %u after injection\n",
> +			 gt_corr_counter_after - gt_corr_counter_before);
> +		igt_info("Injection: %s %s\n", "L2 Bank Correctable Error", "Success");
> +	} else {
> +		CLEANUP_ON_ERROR(ctx, fw_handle);
> +		igt_assert_f(false,
> +			     "L2 Bank (GT) Correctable Error Injection count not incremented\n");
> +	}
> +
> +	CLEANUP_ON_ERROR(ctx, fw_handle);

We should be able to combine all three functions into 1 with parameters 
for times of injection, and check event.

Thanks
Riana

> +}
> +
>   enum xe_err_injection_type {
>   	XE_ERR_INJ_GT_UC_WKR_CMD_PARITY,
>   	XE_ERR_INJ_GT_UC_WKR_CMD_PARITY_POST_RECOVERY_WL,
> +	XE_ERR_INJ_L2_BANK_CORR_ERR_THRESHOLD_1,
> +	XE_ERR_INJ_L2_BANK_CORR_ERR_16_TIMES,
> +	XE_ERR_INJ_L2_BANK_SINGLE_CORR_ERR,
Use consistent naming (thresh/times any one)


XE_ERR_INJ_CORE_COMPUTE_CORR_THRESH

XE_ERR_INJ_CORE_COMPUTE_CORR_THRESH_1

XE_ERR_INJ_CORE_COMPUTE_CORR_THRESH_16


>   };
>   
>   static const char * const xe_err_injection_names[] = {
>   	[XE_ERR_INJ_GT_UC_WKR_CMD_PARITY] = "test_GT-UC-unicast-wkr-cmd-parity-err",
>   	[XE_ERR_INJ_GT_UC_WKR_CMD_PARITY_POST_RECOVERY_WL] =
>   		"test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl",
> +	[XE_ERR_INJ_L2_BANK_CORR_ERR_THRESHOLD_1] = "test_l2-bank-corr-err-threshold-1",
> +	[XE_ERR_INJ_L2_BANK_CORR_ERR_16_TIMES] = "test_l2-bank-corr-err-16-times",
> +	[XE_ERR_INJ_L2_BANK_SINGLE_CORR_ERR] = "test_l2-bank-single-corr-err",
>   };
>   
>   static void inject_error(enum xe_err_injection_type injection, struct xe_mmio *mmio, int fd)
> @@ -333,6 +624,15 @@ static void inject_error(enum xe_err_injection_type injection, struct xe_mmio *m
>   	case XE_ERR_INJ_GT_UC_WKR_CMD_PARITY_POST_RECOVERY_WL:
>   		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
>   		break;
> +	case XE_ERR_INJ_L2_BANK_CORR_ERR_THRESHOLD_1:
> +		test_l2_bank_corr_err_injection_with_threshold_1(mmio, fd);
> +		break;
> +	case XE_ERR_INJ_L2_BANK_CORR_ERR_16_TIMES:
> +		test_l2_bank_corr_err_injection_16_times(mmio, fd);
> +		break;
> +	case XE_ERR_INJ_L2_BANK_SINGLE_CORR_ERR:
> +		test_l2_bank_single_corr_err_injection(mmio, fd);
> +		break;
>   	default:
>   		igt_info("Invalid Error Injection specified\n");
>   	}
> @@ -365,6 +665,18 @@ int igt_main()
>   		}
>   	}
>   
> +	igt_describe("Inject GT correctable error and validate error-report event with threshold set to 1.");
> +	igt_subtest("test_l2-bank-corr-err-threshold-1")
> +		inject_error(XE_ERR_INJ_L2_BANK_CORR_ERR_THRESHOLD_1, &mmio, fd);
> +
> +	igt_describe("Inject GT correctable error 16 times and validate counter/event behavior.");
> +	igt_subtest("test_l2-bank-corr-err-16-times")
> +		inject_error(XE_ERR_INJ_L2_BANK_CORR_ERR_16_TIMES, &mmio, fd);
> +
> +	igt_describe("Inject a single GT correctable error and validate counter increment.");
> +	igt_subtest("test_l2-bank-single-corr-err")
> +		inject_error(XE_ERR_INJ_L2_BANK_SINGLE_CORR_ERR, &mmio, fd);
> +
>   	igt_fixture() {
>   		xe_mmio_access_fini(&mmio);
>   		drm_close_driver(fd);
