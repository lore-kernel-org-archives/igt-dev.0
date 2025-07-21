Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280DBC83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 17:58:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F6B10E58C;
	Mon, 21 Jul 2025 17:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d6oC43UO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B4E10E596
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jul 2025 17:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753120728; x=1784656728;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LS7bqyxdmCOSzoS+bO2KBaIU8etAd7Tttc+TLQJt61Q=;
 b=d6oC43UOe+nz7khs+CdNOYI7Q3KfR2qWv1irt/Gs9KiUM9zQnW69z/hr
 8208y+/IPushFHwszTwMA/tbpSbdSN4UMND0cSCRY3Q9BXmcCtH65BAx6
 4FV2m3qnucbop49/CCbSKjq19OnJUao2lPp5KH7HxaSB8/g8xPUOQDEpw
 MHzk3FkOT80tlCqMKheL8Y77CxOhEowfKvO4FyLj3Ia2pkgclRjH2XVh1
 IlEj0xQI0mynZ7PY9hukzFQx0yY65XU37JGBGkzaEYapk/XSyNODYcLZV
 lNSeGq3wK7fDnkHSpDwV+rXiDAYCjEfn9jBZiLft0g7sDzkc2ezhZX7Ze w==;
X-CSE-ConnectionGUID: VKeVUZbJR0OYcZ8UwZU/yg==
X-CSE-MsgGUID: dmsxZGcmSFaJlrXHeKZksA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="59003428"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="59003428"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 10:58:48 -0700
X-CSE-ConnectionGUID: nIdssvKiQ/qQQ3O6JF2z+A==
X-CSE-MsgGUID: pLTHacJQSrK3s1aRQkCIiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="158239307"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 10:58:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 10:58:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 21 Jul 2025 10:58:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.68)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 21 Jul 2025 10:58:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqoddX1S5EKj1wmdg9QbqX7H6Opr6VAc/XAGTrl4Bhx/S9BXC4FusBRBtYeycklRRCJVEZCFm5LyFengsEJsjcnn4LhzjjWPvZR/0uLZ323gDIs7E2fIvTDB+RnxrQDCim/bwXKQt5BAUtxo/XsU6zmtEhx7kYTPPdlkrX0XDFAaGihJJ6csavJn5AnboltwNu9E9B8Go2lGHKgxzpUWC7Cx89nkb+DFTYnJfmQDLuVqzTvLjcuLJ9P5+kclB5LH8nGOpEsmRujmcseiNeS3US3nfulHIlIOt7BuAmGIVQr5VB37Zku+12ldR23z8AUdZ9GnhQ9X3AIHRvItlwkxkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCYGrDHM+8GxzBIosgTq19fah0wbQq/7H74PtFI2OdQ=;
 b=wfvCyewIxNAaN7DzLTpImrOXufjrQoYO+12NJb8mYBouoXAOw5mJjwzjnwWAvjBq+QDJ3kQ14XmHrRvsvkoWtCiqgAhZKYHoTyp3Rh1YM2C+rPw/0PxAK2AkjEoOs7K1XgNaGUM1p9zSk6SuTTnByTMgbw77fXqLMVOzEZK1/4RE4x0ViEYIHp4XhV/eNla0/bkb24cqHOyyWaMMxSHh1IsNpb8baaDIpMm9k8QARAyzgOtPOZBHeHdRZTRGmMUgdesOMkldVZvPji5wHdEUSAyqG8klk1FfQg92jWxAM0S05pyVWX2fWT4iS1s5wOXoWthJZetSAbV4ViSHv9p/NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by PH8PR11MB6975.namprd11.prod.outlook.com (2603:10b6:510:224::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Mon, 21 Jul
 2025 17:58:44 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 17:58:44 +0000
Message-ID: <2a37ba89-6306-437a-8a43-82f6ec16db02@intel.com>
Date: Mon, 21 Jul 2025 23:28:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_pipe_stress: Skip invalid
 pipe-output combinations
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250711092040.193732-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250711092040.193732-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::8) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|PH8PR11MB6975:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eea10a3-1c11-44db-005b-08ddc8803bc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1FKZGpabnpZTkJsNE8xTGpUUkpnYjVZUytoR1NVSW9GV0c1Yk1YY3FERmoz?=
 =?utf-8?B?ZTJaWlJ5ZE1PcGlCNUtiUXV4R1J6UExEK2NydkR2NW9abC9DWGJmalRYTzBM?=
 =?utf-8?B?S2REbzk1SmdRMjR2WVVLQkY4RE8wdlFJOWFKWGp1RjllZkptZytpZEdvNkh0?=
 =?utf-8?B?b0FNM2psWWhJK1djN1A2T3BQU21tTHpEQVRoREVPTFh5WHhzeUc1YyswTUQw?=
 =?utf-8?B?R0Z4VFlJVi9kN2lNbWdPWUdNeUljcUcwblhOQWRPYS9FS0hqNGJHUU5rVHlY?=
 =?utf-8?B?U05pWjNHZU9NQUpicWxWVzRUVnhmK2xTYWhJeEpVWWxpRUhXSm92OHI3c0Y0?=
 =?utf-8?B?ZXRHOUFWd3orU0t6RnRuL1hIdFhJc1FjTXU1bzFGbW83ODZyRkJSdjhWSFF4?=
 =?utf-8?B?SFExRnBoR1AxYzBlV3ErRVlvVFB0c3lPSGRsMWIzdmkyamVNa0l2Njl5OWNz?=
 =?utf-8?B?U2MwSG84dkgzTHVHT0JFeTVpd1hGNFdQNXNtSVc5c1MydVQ4VWJZWVhXanFW?=
 =?utf-8?B?eFV1dUZsa0NoaHZtOEVlWm5WeUpQbkNDK2dmOGoya0NYcjRzSUQrb28zbFZr?=
 =?utf-8?B?U3RqQzdxOUd0UG9hNWFxZ21Nc3k1UE1zRjFmR0VUQWFMTE5CUU9EOVdmMGEw?=
 =?utf-8?B?Vkg0UDY1aFMxNXBIVEdLWDlsb0VocjZ3N0RjUEdjUFl0Z0NsU00rM3Q5TmJh?=
 =?utf-8?B?enZBbkpZRkkyelgrdFdsZGFmTGhOY0pybHh5SHBWajJiM2JMdjk1QS9KYnRq?=
 =?utf-8?B?SXVFd2QvalNJSVh1U0dMUEtpem5rVHNzY3E3cWtRTEtCLytpRU1ZblV2ZzdT?=
 =?utf-8?B?ZENoZVJYbkRKMkFsaGZobTJoMy9uQ25nRVJoUlY1UklYWlVZaWJ0VmxSeFZF?=
 =?utf-8?B?N0tSQ2NMNkxpVDZQc0c0aGlUU1E0aWcvMC83N1JFM0RQRWN2YkxPb1pJd1ph?=
 =?utf-8?B?WWRkbXpvbjcyeHFOUGppcnZmN2lZOXNEaW4xWEZLTVRheVhkNHdRck5BRkhZ?=
 =?utf-8?B?dWUxYVNKN042TUN0M0Z1TW1FQ1RDWHlIajJXbGJEZTRQRnhWTUVtU3FnZ09o?=
 =?utf-8?B?U0taQm5hL1ExM2F0bWZWZklGcTNac0dvQkU0SGZwSVFIZGJHa1dVNnJQZFRZ?=
 =?utf-8?B?OHp5RGtmamNsUGVRdG9yS3NyU01QbXExdU5VWEZqK0V4QUJZR044dTU0T3k2?=
 =?utf-8?B?a3A0N3poYWJsT0NINDB5WnpmVUI1QUJDZmpMVWk3cWR1cEVBNkVuLy9WVWdx?=
 =?utf-8?B?VGpLdzh6bUMwcUhsQ0tvYlNYdnZxeWlUUG9HQ1JFOVZoem9wYWNhMkF3MnRQ?=
 =?utf-8?B?N3Juc244R05TNmcwT1owOThEQS9IbWljYjlHKy9mdnMyNWRTZU9yNUNWbmtq?=
 =?utf-8?B?M0lLZnUraXFJM2dCSkExZDBjRjRUay9oVnVpM3ZiS2phWkFVc0VQL1o1V0tz?=
 =?utf-8?B?YmxMdk81eHpLZDFIWnpSNDhTemNuUkNma2JrWUxYa29DSmJ1WStiNzJWYU9l?=
 =?utf-8?B?dmlRNlVtU0NwUHlzOWx1L1YvTXhtd0FOUm1LemNTdENxTGRnTUp0czJhSnYw?=
 =?utf-8?B?NlhNNERGMmlTSzllS01ac0ZSOFN3REU2Nms4M0kzN0hwR1A1NkJ2N0hrc3dF?=
 =?utf-8?B?L09ndTc2MEI4aE1Rcit1NElUS0kyNEh5ZFpOWWM4dERjM2xzVTIwUVQrRnNt?=
 =?utf-8?B?MjhZV1dZUWJQWTVSYUZObzhPeXpMSldsQVg4Tjd1T1QzYzdvTGZEbjNsN0xk?=
 =?utf-8?B?V2NKZWlReWsvSHR5bWpKeXlPZ0hHaXVvSGlKa1NNOGdQY1piWHpYNTdyaDhk?=
 =?utf-8?B?bG5IVm9HTHpEdXNXTHlMc3p4K2h5VkU5RzN6LzZMQjUySWFURFJIckV3Unp5?=
 =?utf-8?B?WGNWWlZ5VUJ4OWV4R1RMWkFKUzA5QTUyNGtlWDRIL2Q4MmFkSXVGNEpZVCsr?=
 =?utf-8?Q?x8SaozA/W/M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVlYQWlyMml4MTF0MzZkYjU4R05CV0ZFS013UVc5SEVLdlJvQW9nS3JZUUZx?=
 =?utf-8?B?RnNmeTNwcnhWYkFQWjE1clpGTGR2NEhmbDUvamdMZ0FpL1N5RWVtM25EbEVQ?=
 =?utf-8?B?azZKM0ZlSWhyc3UvUFJ6TGdBNm9CSkFVSXhhQk03SkhCUkJ6SmJONjlldlJX?=
 =?utf-8?B?NjA3Tzc5TmpOWkN1VzNyb2VVU1ZuY0Z0ZXRrYnE4SlhoT1pqUGxuWnV4Y1BY?=
 =?utf-8?B?bHpSRzVXZzdCSGk1cEZSUkM4VGNDVVpMRkVDTFhiMHhIOHJkTWU5TVh1cEk0?=
 =?utf-8?B?Q2RvQ0ZSZ2JLYnlOYThrLy9rOWl5OE9rU3ZoNzVaTDY5SjVoUXdvNkRKZXdx?=
 =?utf-8?B?TENndmRYMGRzTVpzaTUzTWc3SFFZWjM5OWZnSStiZHJOUkJudFNOTytCZWFP?=
 =?utf-8?B?UTBuaUZReC9tWHFteDdKZGIyVGo4anVobXhJNHdmazAwbXIrc3l3TjdIOUVy?=
 =?utf-8?B?Z2NOMGpSWVJNbGEzRkVGVS9VUnB6L241eW1jR0p5c2w4cGlveEE4NGRJUDBz?=
 =?utf-8?B?emc4UmVrdUNXMDF0VlM0RWhYdFNSbmF3OVpFdzI5MTNOTmtKcndvUm9GaXNz?=
 =?utf-8?B?d2JJbXVJMjRLUlIvTWIxWnpqeC9udkQvR1dBRzBnbEwyREVhc2JOYUw2VlRr?=
 =?utf-8?B?ek1XUmUycTJvOHBUaFpLK2I5U0JoSDlqdFZmUjJYSnBPbVlXb1RIVkNOOWF3?=
 =?utf-8?B?aVFTUXlQV0VNVVE4MTVIYTFkY24xZmIzQlg0SXppSWpqbUxucml1cW92S2ZS?=
 =?utf-8?B?TG1Zd0JXVnJIemxqS2xiYVFsdktwNVE0V1FPT1BtbmVwd2lHR3NUdjBhRTM0?=
 =?utf-8?B?Ykd6elpNdm1BUFN4TktSZldzQ0FJUXgyRHowWkFDWGJDTTFrUVI5bnhrcW9F?=
 =?utf-8?B?ck9HYjUyL0VkMEtnaWpiZUR6RUFVbWJSdS9QeE5lcUd4bkNyREdkcjYvQ1lp?=
 =?utf-8?B?N1djdFNMc2RwNjMya2p2aHdQc3AzZUlQc0dIeGhIL3Nta05HeEhHQTZHMXBI?=
 =?utf-8?B?L291U2FmbE9ydGJIcTFrNHlkY2hJM1RVNE9CeUh3VzVhMU1yb0xEV0JDd2cr?=
 =?utf-8?B?NWtzbEFZSUU4alNSTnMrQlUzazVkK2JQeGVhWDVEampMUkxxSWVkSEZKYnJx?=
 =?utf-8?B?UkJMNGsxbG5pbHo3NnZGWjlJbTZsVGVaYWZma1g1dnVSMkR1WVh6ZlVKRldC?=
 =?utf-8?B?SlJ1NG1HVExidHlOSktucXc1WkkybHFCYzlSTTg2b0w4Unk1bHVENjJWc1VY?=
 =?utf-8?B?bnBrSkhFY2lOdGtTc1daY05GSVBOOU9NMEhiRmhQdEZCTWFBY2Q2WHVkU0dF?=
 =?utf-8?B?QjZEaEdZZUlsRVRlcnh1VUZwalY0MWJKREdGb1lidktNWTJEdXg3ckhVS0Rw?=
 =?utf-8?B?THV2eHFPTXVQcDFoaTZNSXRmWk5sWE9HY01jMVM3T253VGNaN1NKb29GS1Q0?=
 =?utf-8?B?YWg1cEQ1VVNzamxBd2dxakY0c3hHcXcrSGdXeUVpVHVJZGNzbTB1NlpDc2tU?=
 =?utf-8?B?dTZQUlZRcmpKd09YS2tuOTIwWkJtaXIvT0s2S003anluWU9KcnRnS291Q2Ur?=
 =?utf-8?B?c2Q3M2IzZzZ5eXNRZEsxSS9wVS90dVlqeEpDN1JGcWN3VVVOVUhzN2NGeHFy?=
 =?utf-8?B?SDRKZFBGTGd2aW9jdWFpdkY3aEpoUERzbTFTZWdDWDJya2p0VzVOKzcwTUVG?=
 =?utf-8?B?K3AzK0FBSzA5K3pqY2x5VWFLOEZNTTBhNGwvazN3bE1rYkdveHRnWitzRTlv?=
 =?utf-8?B?elBmcXEvMlVpbWdaK1N3NWlISldub1RyZkEybklmbUJjSkdjK1hRS2RIRzlI?=
 =?utf-8?B?b0xTc3d3cG1MeHhwdnpJTTZ3TEh4a3hsVVJoRVR0Y3J0RFZaUStrUXY3Smdj?=
 =?utf-8?B?U3lXWTJmK0ROU1lsdTZaRHhTNVFDTVErQzBwTmpzWldIbGJYTG8yb1pMRVZC?=
 =?utf-8?B?RTI5a0tkc01QQjBhVmJyUm9IKzY2eWNpS3NDV0xGcjJoYlBJamFUUXNDeTdk?=
 =?utf-8?B?MmQyZm02eUM3d2JCVnZyTzlDVVgza1BaeG9qOTJxVVVHeHZUdEN0UkVHeW8r?=
 =?utf-8?B?NldKTTlRdEVTL244NmZ4SDEwNjdXMEh0QUlFQkZsZW9OaGp0RG45a1N6OCtv?=
 =?utf-8?B?a0wxdWdneXdudlZKWVZEaDZSUmErSzVDWG9TWXMyd3BJOS9mN1BmT1RkeFJR?=
 =?utf-8?B?VEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eea10a3-1c11-44db-005b-08ddc8803bc9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 17:58:44.4778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G4SAPEw6BWdeKDohoPsPTveelqbJX7OSWeik94gXgQSNTRIiNC0YX+uAF1dsxczzJtf+zn5bih0vxRVfEzoZ7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6975
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

Hi Jeevan,

On 11-07-2025 02:50 pm, Jeevan B wrote:
> Add intel_pipe_output_combo_valid check to skip invalid pipe-output
> combinations which are not valid.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_pipe_stress.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
> index 296c93b58..a896c830b 100644
> --- a/tests/intel/kms_pipe_stress.c
> +++ b/tests/intel/kms_pipe_stress.c
> @@ -578,6 +578,11 @@ static void stress_pipes(struct data *data, struct timespec *start,
>   		if (!data->highest_mode[pipe])
>   			continue;
>   
> +		if (!intel_pipe_output_combo_valid(&data->display)) {
> +			igt_output_set_pipe(output, PIPE_NONE);
> +			continue;
> +		}
We are setting pipe in pipe_stress(); how are we checking valid_combo() 
before?
First, we need to set pipe then only we can check valid_combo.

Also, please add which bug is getting closed with this fix.
> +
>   		igt_assert_f(data->display.pipes[pipe].n_planes < MAX_PLANES,
>   			    "Currently we don't support more than %d planes!",
>   			     MAX_PLANES);

