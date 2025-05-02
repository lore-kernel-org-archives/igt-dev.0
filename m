Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5DDC3ABAC
	for <igt-dev@archiver.kernel.org>; Fri,  2 May 2025 22:13:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079C410E09D;
	Fri,  2 May 2025 22:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h+l9qurM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0EB10E09D
 for <igt-dev@lists.freedesktop.org>; Fri,  2 May 2025 22:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746223999; x=1777759999;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5UtOSvcBdjZi2HWA2ojOGAlB2dEyRJx0qYgncNy4hzg=;
 b=h+l9qurMnKLoLHuH1X0vArJFKzaQmVtTmD31cubkVJCI3d9cROe5+sP8
 H4Rg+2P7++mGUqACMPvr0luoEesXs+P97Cs38fysX6xN3jOf4+S5qqWBs
 uw1yWQOn+SgIGCt601yI0GDLrvYtlEo85i3B+quxac94YIoQZ24BbnbfW
 WCyt2U+0XIU+5W4ujf3U2ETgX6GlZes9ZrRhaqW3e9RaEOXoY1Cg0dSpe
 IAqOq9LrAJQo3TFLotiy9pA5hXJRwkctK1He2cEbtr6SrIgNLkpLnqPWD
 2WXhLBViWlE9ix84wLbul0aVHFVwK0xIMLs1D/V8ftUsIeTy5BhGzMHAC A==;
X-CSE-ConnectionGUID: RhP6jkn3QdCMkZe5/B4NYw==
X-CSE-MsgGUID: f7lsH3QgTs2w8Q5rzUr8Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="47807380"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="47807380"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 15:08:10 -0700
X-CSE-ConnectionGUID: nHlELA6oTViVWzd5eycJNw==
X-CSE-MsgGUID: zHCXsNdCROyO32eDHkYgxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="134662389"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 15:08:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 2 May 2025 15:08:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 2 May 2025 15:08:09 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 2 May 2025 15:08:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1caoHE+MbrkDq/2X2G34ghrX4hcLs8o+6BpA8URxgcxlMqABKc1rMvaKcJ6gi+1Y7v3JBcMuJltZkBcHofRQ66QORxPFlc8UNyVgaWP3rGYVglgpvS7lQimZoPNnSa6UJrB0Z49NnL+sKg/wmCGygBsBfWuS3aB2nkoFJ/fn2Dkr4y7OaaFDYjJ5UiILI/X/I4RKA+aFPPmuRMUAzsuhSLwSQDJpiOaJDheqzN7dkKGQB0VHmTs92YFSyivv+mdxA8oe6YQcciWfjmzeBFDyjYpzvc/Do9REkLhP2hVMayWAekb9xmpLD1EIn+ZoA5NbcVekyyyKFnw0AmaaPrT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6e3XZtSOOU2HeS5AbmnEMHPyqGH3RVumd5pVgrclEc=;
 b=YTWSeR3Z61jXR31QB3JjCOjPhxkG4Uho9HEeJoqqAn1TbptMbywBCKOlzm/V/ARju9jKDcNQKh0dZa2Vy3iR4FDBqed8QH0RNneD+8BRj4GF6/Wr/U/WIAvUnkjxzq2JUshst9dvtAbEQ+3rS8qgJYcSVY/Ag/5gIcy7iLim/fmgvCyor7Fi1Lkg6de8iKrBAjyskHhKxOSS3MmvR995CZY9kKrk1SU9O+7/78aWKa48REum6Zekn2UK4yF7EbvP20827ootffeOPPD+2Q/O2v0MvRjV47BtVw/cCkcIhm0f8sYiHWiza0RmPhDSk+b2Unuoq5betsrSgrcvtCVPcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CO1PR11MB5139.namprd11.prod.outlook.com (2603:10b6:303:95::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Fri, 2 May
 2025 22:07:52 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 22:07:52 +0000
Date: Fri, 2 May 2025 15:07:50 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 5/6] tests/intel/xe_oa: Reduce test_non_zero_reason
 execution time
Message-ID: <aBVCNm_Pigb4YHsy@unerlige-desk.amr.corp.intel.com>
References: <20250422193458.1467567-1-ashutosh.dixit@intel.com>
 <20250422193458.1467567-6-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250422193458.1467567-6-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0140.namprd03.prod.outlook.com
 (2603:10b6:303:8c::25) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CO1PR11MB5139:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a7b787e-3218-4cf7-0886-08dd89c5c844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVl3M1JHOThraFFRTCtTTEhobVFBWkhqdVNhTUxMb1RYK0tIVUxVbENGcm1O?=
 =?utf-8?B?YklSUkt6dDc3ZEsxQjVZeG9QdzFiZGx3Y1ExbVJQMktsM1A5STFiLzJlMnBK?=
 =?utf-8?B?WVFZR2Yzd2kwY1FnMld3TlBKVWFCMURKQmplTUpqZXNKS25CSjhOdHg3Qisy?=
 =?utf-8?B?akRISzNER2dQYXQzbXdHcEFDK0d6dzRQUGo2Q09Qbjkxa2JqNytjYzN6MnRQ?=
 =?utf-8?B?QmRMQXhTQTlEajFid1NzVDNRc2FiOVZ2MGNKcjdtM1V5cjNubWJDdlZNdTJT?=
 =?utf-8?B?MCtUdWxUNXpFZVRHZjM4UnpUNjJwc1NMZTgveG9oaHBNeGVqVjBvNG44ckZh?=
 =?utf-8?B?RzFoeXljNW9adGdjaENvV1BzZmR0Nzl3MVM0akJnalVEWjljVVRFMEZIRERa?=
 =?utf-8?B?aFpqV2hib0ZkZlluanNqOXB4cFBUcERkMU44L1dTc2trbVZneEMzWHM1Smkz?=
 =?utf-8?B?NDB1SGw2RXdCNU9JWWRqS0RibmNQLy8rT01uWFY2b2RxT09qOUN0dTl5ZnZT?=
 =?utf-8?B?ejJDQjNmVTV2NjVraUZFOThYZTVydHF6dm91RVlBTytsVStQVExoMXNzc3NG?=
 =?utf-8?B?ZW9mdU8xWnF4ZVJYU0xsZmJxQk1kdlFpaml5UVRic081Sjk3RXpuajVOWVd3?=
 =?utf-8?B?bCs0eEttQ2I0N3J4S0x5TCtzK1Rrb1JlTG9xMXF2NHVSOFQvMFlUdEpvcksy?=
 =?utf-8?B?UVdJTDE2amVDT3UwUjloNnNmRWxwVlBhZnlXR2RzNkJnWldMTEJ4M1VRcitK?=
 =?utf-8?B?ODdQL0lPMXdkYllvWHVMV0psd3Zsb3V2eURNM3AvdHdHSFBPU0xaTGxuOEpk?=
 =?utf-8?B?Q2pab2VYRGk4UC9JZ3dKbjYxQUpqalpzUnBvMFk1dmdWUGZ3YVRGdzdUek5C?=
 =?utf-8?B?VEdjb1ltc3ZhRi9yTWFkblVvWVZ3dGw0ZFJRR2lHaDN6UFY3KzhMQ2xWRitx?=
 =?utf-8?B?WXRpL09IRXl4TlBOblc0endiM2tqKzRqSWVaNGpqcVBGV1NMdzVZQSsrTURr?=
 =?utf-8?B?WVlGNStUYnd3eWdYeDRMNmpuUVY3cEtGbXNNSmJOQytXSUFNZXBTdEl0YklJ?=
 =?utf-8?B?TE9YUm1MRzVJcHBYU2lheEJCV1VLbytRRloxRElFYmhaUTdvemRXcENvQnF6?=
 =?utf-8?B?bDNJc21MRzZvM3hjQVJkcVAremhvVUJhZ3VZdlI2aXBwVmtRTkUzbnFiZlVz?=
 =?utf-8?B?eThuTW8rN293STNtY3pqQ05vM2hlMFA5cTFVUnFlS1dkQ1JSeTNzQWp4Zlp6?=
 =?utf-8?B?T3pzR2ZqREs0akwxVVRKOXBta0UrZTJRNWs1OUJaOHE3MnJYeXVPcDhDRVVV?=
 =?utf-8?B?MUJ5bkVheXVMdFRqU0FJUlVaRDJNOXVtRThPWWFKSVBYNTM2S0VYRm93UVpR?=
 =?utf-8?B?dmgvT01DWVd4MDhZaCsyV042Y3AyRE1WQ1k1RlRaNXZHL3ZQVVRSTENxRjZx?=
 =?utf-8?B?YTEwdDIvTVUzaGVvUmtsNlZtMTJrQ0VHdS9ROENSNEUrNGFhbTNIYXdOaE80?=
 =?utf-8?B?ZUgwcUNXaXhxcjdUNGRYN1ZvdGZCeVBGY2Q4TnhZcldveVVPSWZmYTQrdGNv?=
 =?utf-8?B?SVN5N2ZaK2xHWEFjUUxkd0w5SURiQm4zNlV3aVRzNTFkUjZUUitoQklHeGQ5?=
 =?utf-8?B?amJERlkzdTUyakhER01TbzBCTjk5bkRmelZ0YTdYTzE2T0hMYWVaUUNxeXJz?=
 =?utf-8?B?QXBySXkwSzRGWitya1ppbGRZZktNVStNYitidkVXRVY4SjZ6eEhZanVMMW5y?=
 =?utf-8?B?NHA3ZmRSblJWMkFnS3QrOVRTUWM5bkZTYzd1L0lTWFZUalUrNEV6M3g1RGxD?=
 =?utf-8?B?dHRYZzIwNm5OYmxJTDVrMmJNbC95cGNMNjh5QWdSY3NrVkNFNVMvZW1SaUla?=
 =?utf-8?B?R2NabnNYc0JWVGw4elQ2R082Z2RMT0dpZ2UwdURHQUFka09MSHdRMU9vNmFo?=
 =?utf-8?Q?IOq6CiRrL5c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXpmZDJIOWNrZEN4RVpHeWxIUm93L3FYeWJ2NkEwRytDOTA2Vk8yN2pLVUVB?=
 =?utf-8?B?UWVhWCs3aWVTUDJTMDVEYUtPL045a1ZHclZCUkd2N1FZSG1WZnk0QUZWT2cw?=
 =?utf-8?B?L3U0eU9BVWo1RlBTb1VJdEY1TldOanU3MWxrL0kzOWJ4ZTdBcGNQeHZrdUtV?=
 =?utf-8?B?dkI1OTBlaFZJQUZsNWFqNndoNVJ2TkVtZS80SVd2RVBYQkE5VFBZUzcvYUJt?=
 =?utf-8?B?VkNVa2RJZjgzUUVEYWdjTVMzYWNnNGRFcXJCcEpDelF4Y2xxUXAwKzEzTUR6?=
 =?utf-8?B?Qmt5RXFrWGpmQkRFZFNwcW1nd282cDdPSHQ0V2s3aDVKSjRoZDlmb0xBaG4x?=
 =?utf-8?B?OHJrNlFoTkkvZVNSUmc0VCs3Yi9DZDhteFN2TldDY2dkZGNqRmVkUXF3TDU4?=
 =?utf-8?B?VGlGZ3ZzNzA0akF3M2lJSVNKMlJjeDQvekcrTFlLVU1TMnlGR3ZQUXVoQzVu?=
 =?utf-8?B?M2ptV2xVSWtTdWNZWnZoRVBNMytJL294bUVYejZ4WDk5a0E3S3VIUzA0a0d3?=
 =?utf-8?B?Q0lzeUc0THVneG00QnMvemdSY2o4SytjWGVrdkhqd3NlUGtGMnBVTlFlMWFl?=
 =?utf-8?B?endJS2RQbXFlcDE4TmhDSDUxa3dMQnNzdnhxYjMrbHZ6eVpjMGtQNDFGSnQ2?=
 =?utf-8?B?ZUxOTmxtQ1Irc0hsMGFaVDFWdzQyeERqais1ZG5FRmQ4ajNITmluK3E4YjRX?=
 =?utf-8?B?MTZPSTRRbW9EYjYrTkFIanlOblgzMXFuK2tRTmsrRS9KZmQ1M3ljYVFlZHZk?=
 =?utf-8?B?TDlhWnZUbjRxUkhYYVlSaDhhWkNERmJGUW9RY00xVWMvM1FoekVJN05IcTNK?=
 =?utf-8?B?ZjczcUUrQVlCbzhDYlVyakVyaEJtSXZaWVRLZWFTanhlMUVIeG1lS1pkRFFw?=
 =?utf-8?B?MndvTEcxeEwyci95MVBJckhEc0VZSUNDQUNiK3B6MXV6NlRrbHM1WVdNdHlY?=
 =?utf-8?B?Vlh0emxpT045ZVROdVVxem10T0p6amxQTys5ejZEdXUvemFVQm9ON2t3OXVa?=
 =?utf-8?B?RDF0QkJIWTRoaGhaTnQrMFhtaG1Gdkp5MVk4SjBOT05CS3V4LytjNFhwUC9L?=
 =?utf-8?B?cC9lbnMrWldVb0xLRTlNVEZrSWhtS3Raa3E3ZTg0L1ozZDAvVkNPdHM3Tlcz?=
 =?utf-8?B?QSs4RmE4SGJJTWVWSktXeHVLbnBtSmk4aFdNOFpPTE5RaE1ndytYQ2lzN1Qx?=
 =?utf-8?B?ZmwvOFJ1L0hiRld4VTRxYmN5MlhGVEs3aFo4b3I5WVJvZ1JMZ05SNHgyRkt6?=
 =?utf-8?B?SS9YWkQyM0FyS2ZDbm50YXNuYkI4Q2tBWWhSQlVGMjFVQVd1cWl6eC9UWEsr?=
 =?utf-8?B?cy81RmpVZTVManRNY1V2c0F0aDMvc0xqTWJPZWxYZHJwZ09pek9uK29LMStD?=
 =?utf-8?B?QndBVnZWckFLblUyejVsbHVhbkhZek55aGJIWm96bGQzeXk2ZFpMUGtXUG9M?=
 =?utf-8?B?dGVmeDFueHJRdDVuTUxWdFY5dEpHNFZPMG1ySlpDOFJPTkVlazh6VURHOXJP?=
 =?utf-8?B?LzR2ODk0YnpLOStVWG53ME1Cc0VTRWg5L3A2Z3E0VjYyeThRaCtieG5WL3pU?=
 =?utf-8?B?UVN2NndmZGlTOXRKNEhUUDkvdWR1S0ZEc29VSS9QLy9lWG9iOHYxdjJZNlc0?=
 =?utf-8?B?YWRYSlpCM0FiUkdwNFowZEtkQnRJNzRnQXhhZjhrOU44WVFweVd1RnkvaEth?=
 =?utf-8?B?MDZMVFBFNnNSclNYanNidjBoUXl5RVdPMEFTcWlUdkVmWjNubU5ORUJJTHJE?=
 =?utf-8?B?NFNhVEFXMTlOcXNTajN3bklXQXl3S1EvekJCTW5ueWtaQkk5M2RUb2xuMUhE?=
 =?utf-8?B?T1kxdUR6cndKZm1CbHdNSGlpRjdWODF4QVI3Mk9sNFg0aDdBTHdYOWtqdDg2?=
 =?utf-8?B?NU9KSDBjck1jY1dQUWxhRkw2VStHYlNKUnpVbkw5b2dVbkQ2c1Z4SmxoMkV4?=
 =?utf-8?B?TGk2Rm5LcXFCdGNpUVpyQXBPWlVvWXU0S296S2dod2k3TEliOWJmWEJMR3hu?=
 =?utf-8?B?RFcrZTdRMDVNelB6NmpkSXpYR3BIQVp6NTdRaUFkdHE4SFFEL3pVNXVhOXc2?=
 =?utf-8?B?QWRPVHB5bDRTMTF3WE1IVHo3TFlxRHlwMG1uWnA4c1UzaGk2ZG1YcTZLTmZ1?=
 =?utf-8?B?ZUkwMXEzbTFwR3Z4a0s3SGgyQitRS1VJdkdLVnFMQnU4dHNMdXRlNUkzR3pi?=
 =?utf-8?Q?gAjMt0ddi7Vh4F5f7EAnhU4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7b787e-3218-4cf7-0886-08dd89c5c844
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 22:07:52.0078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6DhiVgyxW+bhqnlZmY+CM0fVemscEtjb+5p1De8IFNaXzMCtb66/QGk+iDUqGL1SJOjLPyxayCOD6msCdQYJ7M6AP+OwTsFPNsPYvBeIvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5139
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

On Tue, Apr 22, 2025 at 12:34:57PM -0700, Ashutosh Dixit wrote:
>Only check a single report from a random location to reduce
>test_non_zero_reason execution time.
>
>Before:
>	Starting subtest: non-zero-reason
>	Starting dynamic subtest: rcs-0
>	Dynamic subtest rcs-0: SUCCESS (11.108s)
>	Subtest non-zero-reason: SUCCESS (11.108s)
>
>With this patch:
>	Starting subtest: non-zero-reason
>	Starting dynamic subtest: rcs-0
>	Dynamic subtest rcs-0: SUCCESS (1.200s)
>	Subtest non-zero-reason: SUCCESS (1.200s)
>
>v2: Check one report at a random location (Umesh)
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 10 +++++++---
> 1 file changed, 7 insertions(+), 3 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 83495bbacf..c01adbad34 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -2616,7 +2616,7 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
> 	uint8_t *buf = malloc(buf_size);
> 	uint32_t total_len = 0;
> 	const uint32_t *last_report;
>-	int len;
>+	int len, check_idx;
> 	u32 oa_status;
>
> 	igt_assert(buf);
>@@ -2651,6 +2651,9 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
>
> 	igt_debug("Got %u bytes\n", total_len);
>
>+	check_idx = random() % (total_len / report_size);
>+	check_idx = check_idx ?: 1;
>+
> 	last_report = NULL;
> 	for (uint32_t offset = 0; offset < total_len; offset += report_size) {
> 		const uint32_t *report = (void *) (buf + offset);
>@@ -2660,9 +2663,10 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
>
> 		/*
> 		 * Only check for default OA buffer size, since non-default
>-		 * sizes can drop reports due to buffer overrun.
>+		 * sizes can drop reports due to buffer overrun. Also, only
>+		 * check one random report to reduce test execution time.
> 		 */
>-		if (!oa_buffer_size && last_report) {
>+		if (!oa_buffer_size && last_report && (offset / report_size == check_idx)) {
> 			sanity_check_reports(last_report, report, fmt);
> 			pec_sanity_check_reports(last_report, report, metric_set(hwe));
> 		}
>-- 
>2.48.1
>
