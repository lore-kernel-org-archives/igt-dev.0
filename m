Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8561CC021A1
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 10:47:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1223C10E846;
	Wed, 12 Feb 2025 10:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="if0rjbop";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DBB10E846
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 10:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739357221; x=1770893221;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HbvjdjEL8jIle8dSrWGHq2wf0YGqtKAb/0vV5NvYcok=;
 b=if0rjbopBsjb/+c+4NuQqWxqyChDdMQyeNk2f8FDWB9f0uKoJf243F/F
 33FjVlJjsTWL0ZCA8VofTzye/n6SlidjcnnEO6Wn3/dsNKuA3huqMqXrr
 D6xQzb9HG7TVLAWq/kk+v7XfmP5EnYpmH6BsmEVxakl5evdjfJrUT7O4l
 VMQKVHu99Myh6qhZhYPpclvSYlv1/Niy0BERAQ6anPZPUdI3m1kqEqMS3
 cMyEa0mf0zi1UP6f+VV/Fss8XZTAaO8OckTE8dBpS7HB4oSK7XasJxSeD
 9ouha6oIvT3PSkWyV85RhVa5QKB/ftgHBhs/VHll2lmolkN3j4zapfTGe w==;
X-CSE-ConnectionGUID: SlqTC7xnTQmE3jGvA27wRA==
X-CSE-MsgGUID: BTp7VoM5TRG//9y6L9Y98A==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39869004"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="39869004"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 02:47:01 -0800
X-CSE-ConnectionGUID: 5e7HUATDTMaNemFGh/TtSA==
X-CSE-MsgGUID: Ur6gNbidSu2aMVOGPAFwjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="143638714"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 02:47:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Feb 2025 02:47:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 02:47:00 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 02:46:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1ZF+uzDLu8WciHB8lf94XLGpKBTNGt1zy47qga72EsEr0Yi0vEFQwW8K2cbwX/LyxfzZ48ziLWyiRgDOglGPxzqBDghleOnVbSzdfUHebxh9iyCzEo7k6zi6xNgrFqS2BUnn/NCeiVxPkCtH5TMGiaMUupzmOeOZc5T7jVdzaCsEkbDqZn1xZyhIu/FF9eai+9wMfgGPttm2LrSknYPWErIg0GmLWQg7HFQlpyMuYDBaehYvatgoNo2nd6fIMtGqeBrH3zznFv5EE2F2HKfItVuuROP6JsRDOm12DO6s76t72jzlxTUDNUNnGX3ge8c9hsYJQKCHEZlWkCvWREpPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCWNTn1wlAGJ7lCraA5nda/zHznoCp2vGh9tKRtPNkU=;
 b=JKXAN69hNyvVQoJBBeYtBcUYUcgC/z7DLsgoqocijtZ+6i+RjbvAQ7e6XRnqRlnIJ9bqwGhUQQpOhvEXG9nKlnLLe5Uq32qClJSr8nGmbjwgrUiNeAh4R3cBFfhH7U+vB6FbfomT/rlugB1K2AbB/ZgeEGmh0sxrJakSP1Un7Jqt6/gEYZ143QtzKsVXkBScSsrtMa/0X73Ghw4TzmiRV1mFn/vz+VdZ4PsGOXb78Na2p+csXuuBG7rNaAZm7zgsgH+RWEJgryqGJr+BthCelXNfNh8CMy/CSlpYr+srstBV4l4vXImSqR0JjINS/8vYW6dnIXiYOxoyNV90aAhfHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA2PR11MB4809.namprd11.prod.outlook.com (2603:10b6:806:112::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 10:46:47 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 10:46:47 +0000
Message-ID: <ecf830a1-3cbf-480d-8ed7-1e2030f1bf35@intel.com>
Date: Wed, 12 Feb 2025 16:16:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] lib/igt_kms: Add support to check joiner mode
 limit
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250212073604.1580120-1-jeevan.b@intel.com>
 <20250212073604.1580120-3-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250212073604.1580120-3-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA2PR11MB4809:EE_
X-MS-Office365-Filtering-Correlation-Id: 63d54420-aae3-496e-bb85-08dd4b528c5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dm9VRmZmOTQzWVUvTVZYMnJzU3VZM0p1QzI2d2hBMVlRMkN5UDVyREd1eDdB?=
 =?utf-8?B?bW81ODhBNEJaMEx1REZSNU56VmpKYnRUSFZGRC9uRDRaVXNYQ0NnZWlSNjlh?=
 =?utf-8?B?em53OW1NV2wyZmRrT3MyY2w2RmtUQllBMHhjaTBQcVdLdFUxd2tEYXNUbmJ2?=
 =?utf-8?B?N1Y3UmpNWjdWS2s5dEI3WGd4d0JudThUVTFyeGhqLzJGNURXaTgyRlZQSGtW?=
 =?utf-8?B?RnJIUmdiN1FRUStmTlBTeWxDcXRCczhzTnRCVU1FZW1Dd01JanAyM2JBNWov?=
 =?utf-8?B?azFNTDhEaWIwS0t6TDAwdEJuQVg0QjJCMkdReFFDVUdwdStXbjEzdkFub0w3?=
 =?utf-8?B?anZwYkVlUm1mR1RkYWc3MFdFU3BianlyMStnUEI0Qm5QQjNmTWl0em53anY2?=
 =?utf-8?B?c1JnRm1Td1hNekFSc0d4L1V2U2lzS2M5dFdhOUdZVlVKWjNoemdrK3dCMjlD?=
 =?utf-8?B?NFhGdU9DUE51bXlVUWtsaHFwdTdyZXordnZxdzg5ejM5Z2x3YUJUV0szazlh?=
 =?utf-8?B?M3pLSE1MeXoxOHBlS0dUM1NlNUpFcDdwdHdvL2pqNGhXbzVXMm5CQ2pZOS8w?=
 =?utf-8?B?VkVUeDljeDgxcStNRlloTmZrQ3FxRGJ5blp1WFdwcUVrYXFJVndmakEycVZk?=
 =?utf-8?B?UzdmMm4xcVN5REVTaTJmUjFrejRnejBOQzJLOHVIaXlBbUFkbFNGanlFeENt?=
 =?utf-8?B?cDhVaSswNjltbWpQeFUxUFBQU1plLzVsZ2RPQjYrTElGRGRyeVEweWFPR2F1?=
 =?utf-8?B?NWJvdmJibXZ6MUdJTXV5Y3JRRWREbTJ5WnVOM01PN0ZIVUNCNGphZ1JIQkF5?=
 =?utf-8?B?N3VSc0o3L0s0TkJYUzB0aml2eUlOc1BIWUxDOWd0RWVnQ1JXbWxINFlpTWxo?=
 =?utf-8?B?ekVjWDFlRjUxTzZZdVlGYkdwTzE1TGVvNWE2ell5UG1WK0dFaklmRHFmN1l0?=
 =?utf-8?B?K3U3ZGwzeE1IVTY4RGVKU2U2S3pVUU1tbGI1UVY1QUVVeTBTUGxxb3BHQXNq?=
 =?utf-8?B?T0RPNFMvb1dxZ3RBalNCWEovYWFCMEpIUWNaclRiSmtib0hyWmlqSkxuMUxG?=
 =?utf-8?B?R1hSbEdyWHhFb0RlbGJ1UzhSeW1ldU1TaE80TkFOeTd5dkZROTMraHdqWkZi?=
 =?utf-8?B?ZElUbG9YWVd1VUtOODltRjR6SlNhUys2MXRIamVqYVFua0dnSThORWVNQnVq?=
 =?utf-8?B?eW5DYVFRd2JsbWN5T1QzVGJtT1ZxZ2dNUFJFSkVhTGdVQXcyYk5wVWJyR1BX?=
 =?utf-8?B?QzA3SytRUjFwcURiRzlybGVUd1Z3aEhUM0FMOFFxRlRoaGlDekltaWQ4eTE0?=
 =?utf-8?B?R0tYT2dQWGM0ZWpNME81dTdQbmVXVC9MQ3lscUN4VjNSUEZwK0ZRRUZxWmVm?=
 =?utf-8?B?aUY1b1VpazhKa044VXp0cUZGMWg4N1VBQSt5MytCNDdONi9IVXE3QURzVjhZ?=
 =?utf-8?B?VitDSnN2WHk0UUxMdDB1Tit0Q2RXNFFNQ1B0K0VRVzNDYjRyMnhKaGY4dWYx?=
 =?utf-8?B?Y1ZSdnpYZ0RjNjVWZmZqbFE1YUpDcnpXdmtpZWhvc1hyZ1czWUI2bXR5WWln?=
 =?utf-8?B?Y0JjSSswNFVNSkp1eTRjRXZnUVY1RTNkdUI4Zkw5K2UrblhPZytDdHdTQW4y?=
 =?utf-8?B?QmpLZGRsK1JRbkUyd212WkpKZCtLY1l1T2ZhMVREaWxjVXpKaktlUytLVG5y?=
 =?utf-8?B?TUJ6RXhqL0w2K0xPNkl5Q0IrOWdOTVgvS1VRR24yVnlBV1QrWFVxNXFWbFNl?=
 =?utf-8?B?OXBzekdvQStqczloUDF0NHBBbE5mRnNzN2wxaThrcU1xaUM4ZkluQnFqUmdI?=
 =?utf-8?B?T3d0dmtrQTdFK2VtNXJrUjhwa21HS3dXTlVZeDFUenJGMnJRZXo4MTJ0Wjh1?=
 =?utf-8?Q?njXN18O15hgfo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUQzT21NSzhodHV6TjFndlZxTWFHb3ZaN1FYNHlpb1RTRlZ5RitvZmg3VDhQ?=
 =?utf-8?B?WHJ3NUphaW9aVnZzUFdzUTdPNG5mZ2tvVnNEQkM4YkNYa3d1dmRZbTRWS04x?=
 =?utf-8?B?dVhwRWlBKzVLRnR1M3Z0UjdDV1dMUmVkcSt0TVdpR2JtamlXY1BmTE9wZVhT?=
 =?utf-8?B?aEdIUk5uOHQzSVlLb00yQnZ6U1VvM0xLODFRcHBoN0Q1bFltbCtvU2lXZjNH?=
 =?utf-8?B?T1VkZEx5ZGFiSGVLcmZUMVU4WHZOdVRrUWtocmtJMnpoVjZadk85aHd4cnRM?=
 =?utf-8?B?SS83NFhoNnp6VjhTSjJUMUNJclprSHlkWmF4UXp0dFBLdjBFbEpJU3cyNmFV?=
 =?utf-8?B?c0UvTDF4SnNSZkhlYWEwVU90L3RNZTI1M3Ruakw2c0JSbDBQWUpBa3A0MHla?=
 =?utf-8?B?WXpLWjg2U0NSUnpFS2gvSGRTQXRRT0NFazJkMWluaC9JQnhLWGlGY1g3ZnhY?=
 =?utf-8?B?OWFKelp6ZVhRU3I4TEJSYnNRNnNBbjZiaUpOa1NCT1dKOGZHL1RSTkhlTEpt?=
 =?utf-8?B?L2ovM004MHpXYnIrRUo2MEhhME9GM055bktOUXEySzNPWEY0Qm1zdTQ3M2o5?=
 =?utf-8?B?eHlJMFo4dzFFUzVnUXRhNmxkQ2xKVUhPMERWdyt0a0NFVHo0QlFWbU5DUUlv?=
 =?utf-8?B?WGdncDNoZHZQVVAyeFpEdDNWZ0FuczFsc2YvNmU2TUhvMnZVUFRsdVVWM0d3?=
 =?utf-8?B?Zm1PQ0FMUktBbE1PUjIwdzJ5dmRyT3plaFZEK1lrQ0MzTmZUZWV6S2ovU29B?=
 =?utf-8?B?endNb0FUVUUvZlpCbnVmaXpkNUViNzd5VEVTdmxIYnA0bnpsbk5qeDliSE5Z?=
 =?utf-8?B?MkwrVVdsUVBGN3YrNFZmRStxWHUyM2QrSEo2dFpnUVN5cHpUdzNoN2pJR3RM?=
 =?utf-8?B?aS9RU1FUZEhXaEtVaGJWNGdraVpESTVrR203eEpaM3FaUFNnZTlsL25hQmVh?=
 =?utf-8?B?WFdFSEJOK09JNG9WbGVuaXFaZG5jd0dtMG4yTDV5Rm8zRGhaSXVBdHZzNllX?=
 =?utf-8?B?cWJCbk9XSjlrUHV6cHBhdkJ2enZ1WUhhT0Rjdis1b3NHWjhzOXRuRENJUEM3?=
 =?utf-8?B?T2xkUlJmZldpMm4zemlZMGsydFowWUxnRlpleWxBa0M5NFlkUlhtaGhKekVk?=
 =?utf-8?B?alJGRk85MzBuNHYwbnlyTlJxSFZEN2VZdW8wZ3oyNEpZUm5Xd256OVZ4U3VX?=
 =?utf-8?B?Wjk2UHBRVXRHMVk3cU1Td1lkMjFyRUNyV1dIZzB6cC81a0VXOXRCLzN2Z2tr?=
 =?utf-8?B?MUdqbjVxaGNXSk5JTkVOKzFpWlQvNjMwdWM0OFFsYjFMaXRxZVZBeTcwUTUz?=
 =?utf-8?B?Kzg1QUpMdkhrZnl2dU54aE1zV3I4QW9Sd2pQRTA1RHhDSGtQeG96STRBdFdi?=
 =?utf-8?B?aGVMRkhrcTB4TDUwUHgvTk14M2tqbi9MTU1Ed1RFaXVoRjMyMnZRTEJ3SmYz?=
 =?utf-8?B?RHovSmFwekFCSG1iMzZ1ek4xUUkrRWxpcjJiUkhBR1ZNcG05eUo1aFM5MzRw?=
 =?utf-8?B?dVA4bHBwbk1EcHl0NWtITGY3c3dYclJueU9GTkE2TUhXNi85WUlpeGIzOXFj?=
 =?utf-8?B?SlBETENsaytlMmtHVjVmaXViVUtSWTFpWjJ2d0xEZzJ6Q1YzMjNvdWRpWmNK?=
 =?utf-8?B?L3ZUZVdRRlZENzgxWitySEpMYUpIbVJVT2Z5YjA4b3huUW1LSzdMMGdWbHlC?=
 =?utf-8?B?OVkxS2REYTJ3dklacExrWXhnZlFZK0Q4VXAydzdoMVlTbjNvQW84TDc5dU05?=
 =?utf-8?B?TkZDTGoxbGFvT0FlSjg3SDR5RnRNc0tNTWRPREZsR2ZYQ3RleElsbmdaaVRX?=
 =?utf-8?B?OE81SUl5ZjNuU2dNZE5mU2RCUFZlMlUvOGpXTDdYSjFsVkZkMkNjYzRZaUdx?=
 =?utf-8?B?TzFDTnc0bi9wSmhVV0laRE9ZenNiMGNuM2srWjFWRHhyTmF6M1M4c1lOS0Rw?=
 =?utf-8?B?YTNPS21WM1dmUll3Tnpsd2VhR3VwS3J2YXZhU2g2SHp3ZEsvcVgvTzlYY05J?=
 =?utf-8?B?cEJIWTFOaWRRb2JtR0xTY1FjNzR5Z2FQaG1DQ3MyL2FGUnc2ejlQa25RbUJX?=
 =?utf-8?B?aG9MWWI1YkNWV2JzQXJhaG81L3J4ZC8vbjNaUm1mVDJ1YTQ5OUw4TVZUUU9W?=
 =?utf-8?Q?nCUfGxxxB/NWN2ygLdkkpdlj9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d54420-aae3-496e-bb85-08dd4b528c5a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 10:46:47.4884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PAIAxVmvBhFhnGyjztPZ8zo4yo75Qh1Eebsw9ajexYSNikquakv7ASI9senShCIvB0COLTzOU77XA1lb4gC5Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4809
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

Hi,

On 2/12/2025 1:06 PM, Jeevan B wrote:
> Added library changes to find the highest non-joiner mode.
> This helps to get the mode that does not require a big joiner.
The second sentence seems redundant and could be removed. Also please 
fix the commit subject.
>
> v2: Update commit message, create a new library function
>      to get max hdisplay and fix condtion for selecting mode.
> v3: Update function name.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   lib/igt_kms.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  2 ++
>   2 files changed, 47 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 3caba7d77..e1a74a3ee 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6406,6 +6406,51 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   	return found;
>   }
>   
> +/**
> + * get_max_hdisplay:
> + * @drm_fd: drm file descriptor
> + *
> + * Returns: The maximum hdisplay supported per pipe.
> + */
> +static int get_max_hdisplay(int drm_fd)

'get_max_hdisplay' -> 'get_max_pipe_hdisplay'

With these minor fixes,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> +{
> +	int dev_id = intel_get_drm_devid(drm_fd);
> +
> +	return (intel_display_ver(dev_id) >= 30) ? HDISPLAY_6K_PER_PIPE :
> +						   HDISPLAY_5K_PER_PIPE;
> +}
> +
> +/**
> + * max_non_joiner_mode_found:
> + * @drm_fd: drm file descriptor
> + * @connector: libdrm connector
> + * @max_dot_clock: max dot clock frequency
> + * @mode: libdrm mode to be filled
> + *
> + * Finds the highest possible display mode that does
> + * not require a big joiner.
> + *
> + * Returns: True if a valid non-joiner mode is found,
> + * false otherwise.
> + */
> +bool max_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
> +			   int max_dotclock, drmModeModeInfo *mode)
> +{
> +	int max_hdisplay = get_max_hdisplay(drm_fd);
> +
> +	for (int i = 0; i < connector->count_modes; i++) {
> +		drmModeModeInfo *current_mode = &connector->modes[i];
> +
> +		if (current_mode->hdisplay == max_hdisplay &&
> +		    current_mode->clock < max_dotclock) {
> +			*mode = *current_mode;
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
>   /**
>    * igt_is_joiner_enabled_for_pipe:
>    * @drmfd: A drm file descriptor
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 1cfacf87d..7227f0b0e 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1245,6 +1245,8 @@ int igt_get_max_dotclock(int fd);
>   bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock);
>   bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   			  int max_dotclock, drmModeModeInfo *mode);
> +bool max_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
> +			       int max_dotclock, drmModeModeInfo *mode);
>   bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe);
>   bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
>   bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
