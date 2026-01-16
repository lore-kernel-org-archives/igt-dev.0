Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4890BC982DB
	for <igt-dev@archiver.kernel.org>; Fri, 16 Jan 2026 16:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE4610E1B6;
	Fri, 16 Jan 2026 16:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X1b0Uzt8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18CD10E1B6
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jan 2026 16:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768581373; x=1800117373;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NAxAosQYdyp+la2g7JD5+eiWGlWpCQ1LHcH8zMDOyCg=;
 b=X1b0Uzt86IcXH88PKySGIBglXxIImkNKOXL7wFnI8TFECoS1/cEm8Iyk
 D05ORr5Y/+dMvxC1QDwtlvpDNIrDWbsSFaNUdbcWr1GagWjoaXXdmpkY1
 Nx3ZYywBEOquBxzMn6aqjBfH0o9GJLxvKk5vh0Atvs8UgbhLgItO1kWze
 QfdC0WW8Qc8P9zVGmaNfcoRVooKdK6ZG9vuU8V8v+4Z00RCPS/3gJnLZj
 8xEIdAuR+/L2txPM6/vclTaiAJgThJLvIqYBN2xttEOWVWSVRZh68pKmH
 N1ALZig4kLggV6mfJKxMKK1/ocbFa1qCqt0WKBwlgFDZb79ObKU1FbLWK g==;
X-CSE-ConnectionGUID: 20B6gOTyQ+mpZNDJl6h9UA==
X-CSE-MsgGUID: 3YEN/uLiR6uIzdJUQ+XY0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="87472460"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="87472460"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 08:36:12 -0800
X-CSE-ConnectionGUID: ZOyPXxtVS7ifiCgB9XpN4A==
X-CSE-MsgGUID: AE6yRb+JSJ6bPhpUmn/5Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="205180822"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 08:36:12 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 08:36:11 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 08:36:11 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 08:36:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jswnc5Ob0DCr4BCfzQB79Kn+PVtpywT3OvvjQeRbeeBy2lYcddV48ATdAk3V0srfcONTzR18ihjHi+h0AoFvUS7IQESh3AL/a45RRUPFea1quWLDxVVJagGD+uDX9An0gM5LxiaCuVIDImyEXwy/DHDYvGcTVLn1cvZptLZ1GgrTRvRV3GGU3cHEDAHzo988kZJYcxuhic4evRKm7q/MbF5r8AsYXZeetkF9SkqNHAfhkuXYQq+ygBAJr5eU9I05rA42bNntLaDNZJLBI+GEiRFcOMHWKHIQMg6mZdQQoPwSOXm565yVym4Hdo7rN2fXgg3dSSusEHUhXeSjrFbeDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XBYDWD9fay6eSivea8RJLnIsulJ4/xPlLXxYhcGIeg=;
 b=bBrPcDE1iZaTH7o/JnW33jgrOcyBuMszaDWzg/Wu8ATTfcQjpSAqZq+uRQLsYSMBCgtk5NUvJOjS/Aw2ko31U8rZk8vWdaYFRw1wGMRb3yNqrZtS9ynD11WIrcgu/nXmtxgpMOifKsM8JusETh3nnkRa2DjHaIC45U6mbo980Sf5qCK8BCXs0CBVIR57LzaiwL6O/bVUD+sztwkI99M0nXUh2NjlRwiB+qIwtQp2eFQfDq/PR5LB+BaGSc044IjpwhDv2cKs6KQyUkw/t8PfUfMf+VxfI56o78bR10Zmlhw7qYxjPz/xUtAMDdIXKuK9dR/PaaFtLY6iWWWGHEdt3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.7; Fri, 16 Jan 2026 16:36:07 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 16:36:06 +0000
Date: Fri, 16 Jan 2026 17:35:58 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v4 1/5] lib/intel_compute: Add compute-square for
 xe3p
Message-ID: <aWpo7t9PguNS8c2J@fdugast-desk>
References: <20260116154636.204553-7-zbigniew.kempczynski@intel.com>
 <20260116154636.204553-8-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260116154636.204553-8-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0075.eurprd04.prod.outlook.com
 (2603:10a6:10:232::20) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS7PR11MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fe0f6d8-1472-45d6-8dd7-08de551d58d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGNDUUxHT21WYklOcXNWbllrN3RnNTN4NW4rcnRCM2ViRUk3c1UydGUvdzZ3?=
 =?utf-8?B?L2grRkJzd1pvOWFZNTM3NlpVTVhsR1dSb2M4Y0d0RTlySVFTbi8wYUdQdFVE?=
 =?utf-8?B?SXFXTGpPUThOTmxleklNY21idFJoWHZCNDVUZ1NCc092N0E3SnRPMkRMWHB4?=
 =?utf-8?B?STRkYjNoRGpjQXN1ci9lZGZTZWdSOHBkT0tUQVJhV01kRXU1dVBvbzg2SWpT?=
 =?utf-8?B?Ymp0NktXUk9xNWVtYmNESEdIOENhOXdXWTcxYmtEUGpaNThUUEJrWUZKWXBo?=
 =?utf-8?B?L0VxNUVMR2lWOHA2alkzS1dxbHJ5YkpPcDZWSDJFSGVUZzdJNHpoa2cvS1kx?=
 =?utf-8?B?T1Z4TURXamlWUHlNQzlidU5XSmI0eEppdnVvTUpXLzVwSm5oQTNOSXNtRU9D?=
 =?utf-8?B?d0FnbE4yQmFseDh4ckJoaC9XSUhoZEI4MzRoKzdKRWtJQ01GTWVtS0JJenRW?=
 =?utf-8?B?eGViU1pxWUtKVGtiTmpEV0lOLzZoczIvVDRPUjRBaWk2bFlXOXl3cjlWbmtr?=
 =?utf-8?B?VTFsektvSGF6eCtRZCtabGRrUG0zL1lub2ovL2R2a2xpTVFoL044L01tTi9o?=
 =?utf-8?B?VkllK3phajhFYUxSL2VlOXpsQTczOXZqc0VNVGJsUmwxektSV1g5aVpWeWhM?=
 =?utf-8?B?R281VUU5emwrRUc4WXIwUGwyMmVXd0dXSkQ5SVNhcFAyUVNTRDludEhob3Fa?=
 =?utf-8?B?TkdBTXMwWUJ0aEpLMlB4ZmJqSDhmRXZVVlNCY04vWVNScitzRVdEeE5Yd2VU?=
 =?utf-8?B?eTl5RFNlRDFmdDJPVzJMUXd5cHp0dE1ma3BjU1o3VWNJSER5T3RrSUtlRE9Y?=
 =?utf-8?B?L2ZmS1oyL1EwcUdDVm5UandxdlZWL0pudGxPTWxCMC83cG5QVjE0aEFaWWRo?=
 =?utf-8?B?SjFDcFZWVU9UL2VmS1M4Y3liWEk1TCtrUGJZNklTNmlqMGlqSTkwZ3UvdUdp?=
 =?utf-8?B?YTd4OU03cm03MFc1Sk1DWXpoNnU1TUJhWjUzTUtQU0ZUMUcxYlRVZnVkSm9Y?=
 =?utf-8?B?NEdqVWNSVG1EQmExQVA5QkNtQ2JJQURnaElBQVR6UHVNQmNVblh6NGxIUTZv?=
 =?utf-8?B?Y0dXMkRGMyt2M0w1Zk8zK2RlaFZuQkM4WjJhelRXTm9uOHM4Ty9HVFFCSXdQ?=
 =?utf-8?B?emZDYVBaQkY0M3FaTExBOFU4SXVpNFJMMndOTXFqN2NiNGhTWnNjTU13cFdm?=
 =?utf-8?B?a1FaRUduN0tpcW53c3NRVjhNQlg4QWpadTRrb3djdkw0a0I4MlFHRUUrWVU2?=
 =?utf-8?B?OVZTN2FBTnMzMFhRdWZRL0UxMG5yMFBQU2dFeE8wbEcwOFhPWVFuVXI3Zi9N?=
 =?utf-8?B?VENqMWlXbXdPdmdFblZuNlZHRHlmYUJGN2FLa09pSDUzU1VJcnFjL0psWEpp?=
 =?utf-8?B?RVJmejZ4dHZOSFZNa2pjZ2dJSWJXWjlXZUVjS25pSEFEVkJKNVdhVXlSam9U?=
 =?utf-8?B?Y0xmNXdCSnVGRXljTDA1bk1LbFhjV25Rd3k3bm53UXY5VHduMVJiLyt6dS83?=
 =?utf-8?B?S2VWaUE1bkJHL0J5NUdKZFdEc0QwNGxBZFBOQllnUU1lSHFWRDVncGxCc1B6?=
 =?utf-8?B?QWF0MmxZcGVmNFVzU0NnaFE5QWxJclhFMENOQlpqdUpqWmtBU244UVY5VkUv?=
 =?utf-8?B?TWtBdGpFaHV1RUtrbkR1UWpaWG5YdldGQmdQMUJlQ29mVjFmZ2pDcGU5T2c4?=
 =?utf-8?B?Rm5RZWV2T1BYOEZ6QUNYdXgveUNjMVdDZGlqcVpVb1k4dFZOeTBhVGpQeXJo?=
 =?utf-8?B?eG1nNUQraWNqV3F5ajZMWlgraWdNU1VGcFlZT29IMU1vOVRveWVVTEdzRjNL?=
 =?utf-8?B?bFFDSm16dlF3eDdVM2xDMmNROVRrRERzN2kxLzJvMnBEY1I3T2FpK3RFU01t?=
 =?utf-8?B?eUNoNzFENnVjVHNISjM4RmdGcVBaUWZqNVFmVThrdGhIZ3BkKzkrYlVtTGxG?=
 =?utf-8?B?dGVlT1AyU0RoK253QmpOOEg3Q2d2b2ZUYjNubWNTZmxoMTF3UElqNk4xRzBP?=
 =?utf-8?B?d1RHUGdqNmhyWHhFaCtyQUpCYmlzRWRncFAvQXoyR0RwWm5JQlZwNWNhNGxC?=
 =?utf-8?B?d1pBZkZXTGRVd25xM0VySTZZMHN3MmVSdkFyc2VTZ281SEhxNzJCTXVzZVZG?=
 =?utf-8?Q?zjZM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmRka1Bkc2J3VTJQS1JITFRSYkVzdkp0RUdxMGQwV1gzc3B3MjNpcFUvZ25W?=
 =?utf-8?B?THFMSXNMOXphVWltTGRERXZOWEdKaHRtU3hPeDl3TEVUcGJpT1BXTGltM0xj?=
 =?utf-8?B?N2NBc1JSQWZpZ1kweHRpOHVwTjFHNmZUdkdTSTlhYkxPWkN0enRZdVp6dXdI?=
 =?utf-8?B?a2tWbUk4dStPUWdkcm1MWFN3N0F5MEVxRGJxeGgxdnFoMi8remlZMlh4aSsw?=
 =?utf-8?B?TW9LMklJOFQ4Y2c0dDdhZGN3VGgvMm55OFNqMHkxVU5BK0RZbnJZNWk4Vmgx?=
 =?utf-8?B?OHdrbms0Q2NmYmNZamU4NVVyOSs1QjlIeloyU1FWYmQ0MHkrTWFqL1pYaHIx?=
 =?utf-8?B?bXZIMnJpcVFsUzNOYXNoRVFxVHdMb1RONEg3QnFhRWhta0dqWXVOSDVIQjE4?=
 =?utf-8?B?V09Iby91S243ZlhvVjlWc2lZejAvYklhYWo3WXUzSFRjM2xPOHZ3UjgwK3JL?=
 =?utf-8?B?TWFSQ3lBZDZZbEUxYUcwUzZUQ2dKUGc5MnBMVkpQMHpMQ2RIK1pEZ1lwWCty?=
 =?utf-8?B?ZXpQSllCSnJoVTJtWHp0cko3MzZKdGg3VUtkaTZvcEsyYVdoeVI5Q0loazA0?=
 =?utf-8?B?Si9ETUFsRHBpVEdZb3FHV01JTXlXRWtKcmVuaW9tK0NsYmpvU05PcDNmT09v?=
 =?utf-8?B?SlNoVDJjSzVFZUNUQXVUMXRxUjN1Y0E4eEZ2ZllJcDJTVXg2K1BaR1IzYmIx?=
 =?utf-8?B?QXM2NXlocUZiQnAzcEVMTllwckI2N3c0Um9pbVd2NkhhbzFsaFFqV2RZdVc2?=
 =?utf-8?B?b0xoY0Z5R2RIV1NubHNCbmpNaDlPbTZQS3cyMlJHUDh2WWtRQU5qazhBVGFC?=
 =?utf-8?B?ZldDcUZjLzdrdnVwUkVHZHcyTzAvaXVnOUdKRWJNM0tVRXMzQnN2NlJkemdu?=
 =?utf-8?B?Vkp5Q0tueFpDdU5vV20wWjAySmhvSFhkYWFEWC8rVHlQNlZ4cVNUdmZNSjlk?=
 =?utf-8?B?Q0paa082MXFlMEx0SDFudWVPaDIzSGFMN2FVQURyUXgzam94WWs0cnNqTlZa?=
 =?utf-8?B?K2JXaEJ4TittdkZzMEY3ZTNrRkpWVkVYN2VmVEhybUx3b25ITXRkc0pWelZU?=
 =?utf-8?B?WXVTS2dBUTZTbC9lNmx0Wlh5cCtIWDFNMEFFWTlvSzFubCt3UTFLQTNIL2M1?=
 =?utf-8?B?SWxEQUxTb2JtNS9lV21lQ3kzalpUQ0VMRUxyU3NpSlpmQnpVYlQySGc4MUx1?=
 =?utf-8?B?SVdBb3BLTzNQVGdKQmZ1WXVCdlM2a2FteFZYcmZiQ1VZWStReTh6cFJPVjRi?=
 =?utf-8?B?VGp2QXdRNksvUFUwNGJseHowQlJsWFB3YnJRckFJSDJKOEhlM1ZwQWk0aFNF?=
 =?utf-8?B?WXg0aVA1ZlFGS2RUS21HUmlONHp5SkJpM0l1MUs4QzQvUDJKcFBIeXhJbU43?=
 =?utf-8?B?cGNNNVJYTmpyN1ZjK0dZUHROZ2pVSGdnNkhic0NOc3pSQWxZNzZiUkxsNHJs?=
 =?utf-8?B?ZTJ0UkxOSHRib05kay9Vd0NqekEyNkFDRHFZRHFVeXVGWjJLOWNzSDJuRTVs?=
 =?utf-8?B?VFVaQkV1bDF5OCtpb1BEeGhlQTBWYUtZZUdmbzdXTHBZYnY1clRSWmZFZVoz?=
 =?utf-8?B?cUNKdmNLaEdPcjNsVVdQeXp2dkw0N2puZ2k0L04xLzJ3NUlzc0l6aVhVV1F4?=
 =?utf-8?B?RDNKYXZEMEZ2dHo1dk5YRGdDWkRlM2k4aXN4MUdDeDlaSWdRSzdKa0RCem1P?=
 =?utf-8?B?Q0M5V2l1K0lLcHlSamowbk1FOWc5d2N5MGRHTE9QVzYzMXN3SkI2OWJYQXZC?=
 =?utf-8?B?U1pXMENmU3FUZGdMK0NNNWNDVmYvMTZHdDl6TjdYd050MVljd21ERnZHdXlo?=
 =?utf-8?B?TUVUQmdjYVBzdmZNR0VqdmI5Nyt2d2RteWcwTERMZFhQK3BvSitjbW9VNHJN?=
 =?utf-8?B?ck9xOS9QSHI3M0VlaEJhdXYwWjFTOTN3WWYva29LZ0JUQ24ra3A1aUhuNG1x?=
 =?utf-8?B?bVNnVGZiNnorNTd1QkRrMzlKNWF0aUsrWUR5UzhZaHdyVURYUzFXOE9yWEVs?=
 =?utf-8?B?TFhoZzdRWW9kTWg0OG8zckYrMC9zVEZjQUVicVlJS0tvdjUvZ1M3L05JaVdk?=
 =?utf-8?B?bkJQdWJOVGU5Y2daMjVpRHBITXBJbGtqOGVpd1hFczhQVi94UUFtRU5aYkNB?=
 =?utf-8?B?UTdDUCtMMWJXa3VCQWhxY09Pd1hZN3JSbkRTMzRvU21hTkI5MlBiUU9Eak9T?=
 =?utf-8?B?Z0o2bmMrTWVkSlRXK2dDemdlT1puQlcrYjVjVmkwREcvNTJOSnRGZEVCNkt1?=
 =?utf-8?B?T25qUU42ZmJBSnhCZ0YwbzN1Q084c3d0cm9SV0F5NXY1QTZ3aFZYbThpb0p5?=
 =?utf-8?B?QWw0cWVLT0NrcUwybitXSlhkWk9sUVM3THM5bnBnb3pEYnFvNmE5UCthZmdp?=
 =?utf-8?Q?/kzvEgm5Izbkm3Bg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe0f6d8-1472-45d6-8dd7-08de551d58d6
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 16:36:06.8969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: emPyAegbYNOZCvRzbjoRiH2xIeO9C+pqzl22v+EpMloSHxqUg9T5yB5/LbZqmYB2H47ejcnrVaYk1TC7n9o0vnAWJALI7JWqOJNaVV0hnyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5990
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

On Fri, Jan 16, 2026 at 04:46:38PM +0100, Zbigniew Kempczyński wrote:
> Extend support of compute-square calculation in IGT to xe3p platforms
> like CrescentIsland.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
> v3 - remove unnecessary kernel_addr variable and reuse
>      XE2_ADDR_STATE_CONTEXT_DATA_BASE definition (Francois)
> v4 - use work_size (Francois)
> ---
>  lib/intel_compute.c                | 232 ++++++++++++++++++++++++++++-
>  lib/intel_compute_krn_square.h     |  41 +++++
>  lib/intel_compute_square_kernels.c |   5 +
>  lib/xehp_media.h                   |   1 +
>  4 files changed, 278 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index a555f908b1..05ea92c7db 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -50,6 +50,8 @@
>  #define OFFSET_BINDING_TABLE		0x10000
>  
>  #define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x9000000ULL
> +#define XE2_STATE_CONTEXT_DATA_BASE_ADDRESS ((3 << 29) | (0 << 27) | (1 << 24) | (11 << 16) | (1 << 0))
> +
>  #define OFFSET_STATE_SIP			0xFFFF0000
>  
>  #define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
> @@ -66,6 +68,7 @@
>  #define DP_PIPELINE_FLUSH		(1 << 2)
>  #define WRITE_IMM_DATA			(1 << 0)
>  #define WRITE_TIMESTAMP		(3 << 0)
> +#define XE3P_WRITE_IMM_DATA		(1 << 16)
>  
>  /*
>   * TGP  - ThreadGroup Preemption
> @@ -109,6 +112,17 @@ struct bo_execenv {
>  	struct user_execenv *user;
>  };
>  
> +struct inline_data {
> +	union {
> +		uint32_t dw[16];
> +
> +		struct {
> +			uint32_t indirect_addr_lo;
> +			uint32_t indirect_addr_hi;
> +		} xe3p;
> +	};
> +};
> +
>  static void bo_randomize(float *ptr, int size)
>  {
>  	srand(time(NULL));
> @@ -1578,7 +1592,6 @@ static void xe2lpg_compute_exec_compute(int fd,
>  	addr_bo_buffer_batch[b++] = 0xE0004000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  
> -#define XE2_STATE_CONTEXT_DATA_BASE_ADDRESS ((3 << 29) | (0 << 27) | (1 << 24) | (11 << 16) | (1 << 0))
>  	addr_bo_buffer_batch[b++] = XE2_STATE_CONTEXT_DATA_BASE_ADDRESS;
>  	// Split into low and high 32 bits
>  	addr_bo_buffer_batch[b++] = addr_state_contect_data_base & 0xFFFFFFFF; // Mask the low 32 bits ;
> @@ -1902,6 +1915,218 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_destroy(&execenv);
>  }
>  
> +static void xe3p_compute_exec_compute(int fd,
> +				      const struct inline_data *idata,
> +				      uint32_t *addr_bo_buffer_batch,
> +				      uint64_t kernel_start_pointer,
> +				      uint64_t context_data_base_addr,
> +				      bool threadgroup_preemption,
> +				      uint32_t work_size)
> +{
> +	int b = 0;
> +	uint8_t uc_mocs = intel_get_uc_mocs_index(fd);
> +
> +	igt_assert(idata);
> +	igt_debug("kernel addr         : %"PRIx64"\n", kernel_start_pointer);
> +
> +	addr_bo_buffer_batch[b++] = STATE_BASE_ADDRESS  | 0x14; /* dw0 */
> +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw1 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw2 */
> +	addr_bo_buffer_batch[b++] = 0x40048000; /* dw3 */
> +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw4 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw5 */
> +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw6 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw7 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw8 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw9 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw10 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw11 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw12 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw13 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw14 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw15 */
> +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw16 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw17 */
> +	addr_bo_buffer_batch[b++] = 0xFFFFFFFE; /* dw18 */
> +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw19 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw20 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw21 */
> +
> +	addr_bo_buffer_batch[b++] = XEHP_STATE_COMPUTE_MODE | 1;
> +	addr_bo_buffer_batch[b++] = 0x14001400;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +
> +	addr_bo_buffer_batch[b++] = XE2_STATE_CONTEXT_DATA_BASE_ADDRESS;
> +	addr_bo_buffer_batch[b++] = context_data_base_addr;
> +	addr_bo_buffer_batch[b++] = context_data_base_addr >> 32;
> +
> +	addr_bo_buffer_batch[b++] = XE3P_COMPUTE_WALKER2 | 0x3e; /* dw0 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw1 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw2 */
> +	addr_bo_buffer_batch[b++] = 0x008004A0; /* dw3 */
> +	addr_bo_buffer_batch[b++] = 0xBE040000; /* dw4 */
> +	addr_bo_buffer_batch[b++] = 0xFFFFFFFF; /* dw5 */
> +	addr_bo_buffer_batch[b++] = 0x000001FF; /* dw6 */
> +
> +	if (threadgroup_preemption)
> +		addr_bo_buffer_batch[b++] = XE2_THREADGROUP_PREEMPT_XDIM; // Thread Group ID X Dimension
> +	else
> +		addr_bo_buffer_batch[b++] = size_thread_group_x(work_size);
> +
> +	addr_bo_buffer_batch[b++] = THREAD_GROUP_Y; /* dw8 */
> +	addr_bo_buffer_batch[b++] = THREAD_GROUP_Z; /* dw9 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw10 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw11 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw12 */
> +	addr_bo_buffer_batch[b++] = 0x00010000; /* dw13 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw14 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw15 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw16 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw17 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw18 */
> +	addr_bo_buffer_batch[b++] = kernel_start_pointer; /* dw19 */
> +	addr_bo_buffer_batch[b++] = kernel_start_pointer >> 32; /* dw20 */
> +	if (threadgroup_preemption)
> +		addr_bo_buffer_batch[b++] = 0x00000002;
> +	else
> +		addr_bo_buffer_batch[b++] = 0x00100002; // Enable Mid Thread Preemption BitField:20
> +
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw22 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw23 */
> +	addr_bo_buffer_batch[b++] = 0x0C000010; /* dw24 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw25 */
> +	addr_bo_buffer_batch[b++] = 0x00000400; /* dw26 */
> +
> +	addr_bo_buffer_batch[b++] = DP_SS_CACHE_FLUSH | uc_mocs << 4 |
> +				    DP_PIPELINE_FLUSH | XE3P_WRITE_IMM_DATA; /* dw27 */
> +	addr_bo_buffer_batch[b++] = ADDR_BATCH;		/* dw28 (postsync addr) */
> +	addr_bo_buffer_batch[b++] = ADDR_BATCH >> 32;	/* dw29 */
> +	addr_bo_buffer_batch[b++] = (uint32_t) POST_SYNC_VALUE;		/* dw30 */
> +	addr_bo_buffer_batch[b++] = (uint32_t) (POST_SYNC_VALUE >> 32);	/* dw31 */
> +
> +	/* inline data 32 - 47 */
> +	memcpy(&addr_bo_buffer_batch[b], idata, sizeof(*idata));
> +	b += 16;
> +
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw48 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw49 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw50 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw51 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw52 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw53 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw54 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw55 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw56 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw57 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw58 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw59 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw60 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw61 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw62 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw63 */
> +
> +	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
> +}
> +
> +static void xe3p_create_indirect_data(uint32_t *addr_bo_buffer_batch,
> +				      uint64_t addr_input,
> +				      uint64_t addr_output,
> +				      uint32_t loop_count)
> +{
> +	int b = 0;
> +
> +	addr_bo_buffer_batch[b++] = addr_input & 0xffffffff;
> +	addr_bo_buffer_batch[b++] = addr_input >> 32;
> +	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
> +	addr_bo_buffer_batch[b++] = addr_output >> 32;
> +	addr_bo_buffer_batch[b++] = loop_count;
> +	addr_bo_buffer_batch[b++] = 0x00000200;
> +	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +}
> +
> +/**
> + * xe3p_compute_exec - run a pipeline compatible with XE3P
> + *
> + * @fd: file descriptor of the opened DRM device
> + * @kernel: GPU Kernel binary to be executed
> + * @size: size of @kernel
> + * @eci: engine instance class
> + * @user: user defined exec environment
> + * @alloc_prefs: memory allocation preference
> + */
> +static void xe3p_compute_exec(int fd, const unsigned char *kernel,
> +			      unsigned int size,
> +			      struct drm_xe_engine_class_instance *eci,
> +			      struct user_execenv *user,
> +			      enum execenv_alloc_prefs alloc_prefs)
> +{
> +	struct bo_dict_entry bo_dict[] = {
> +		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
> +		  .name = "instr state base"},
> +		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
> +		  .size =  0x1000,
> +		  .name = "indirect object base"},
> +		{ .addr = ADDR_INPUT,
> +		  .name = "addr input"},
> +		{ .addr = ADDR_OUTPUT,
> +		  .name = "addr output" },
> +		{ .addr = ADDR_BATCH,
> +		  .size = SIZE_BATCH,
> +		  .name = "batch" },
> +		{ .addr = XE2_ADDR_STATE_CONTEXT_DATA_BASE,
> +		  .size = 0x10000,
> +		  .name = "state context data base"},
> +	};
> +	struct inline_data idata = {};
> +	struct bo_execenv execenv;
> +	float *input_data, *output_data;
> +	uint64_t indirect_addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START;
> +	int entries = ARRAY_SIZE(bo_dict);
> +
> +	bo_execenv_create(fd, &execenv, eci, user);
> +
> +	/* Sets Kernel size */
> +	bo_dict[0].size = ALIGN(size, 0x1000);
> +	bo_dict[2].size = size_input(execenv.array_size);
> +	bo_dict[3].size = size_output(execenv.array_size);
> +
> +	bo_execenv_bind(&execenv, alloc_prefs, bo_dict, entries);
> +
> +	memcpy(bo_dict[0].data, kernel, size);
> +	memset(bo_dict[1].data, 0, 4096);
> +
> +	xe3p_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT,
> +				  execenv.loop_count);
> +	idata.xe3p.indirect_addr_lo = indirect_addr;
> +	idata.xe3p.indirect_addr_hi = indirect_addr >> 32;
> +
> +	input_data = get_input_data(&execenv, user, bo_dict[2].data);
> +	output_data = get_output_data(&execenv, user, bo_dict[3].data);
> +
> +	xe3p_compute_exec_compute(fd, &idata,
> +				  bo_dict[4].data,
> +				  ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
> +				  XE2_ADDR_STATE_CONTEXT_DATA_BASE, false,
> +				  execenv.array_size);
> +
> +	bo_execenv_exec(&execenv, ADDR_BATCH);
> +
> +	if (!user || (user && !user->skip_results_check))
> +		bo_check_square(input_data, output_data, execenv.array_size);
> +
> +	bo_execenv_unbind(&execenv, bo_dict, entries);
> +	bo_execenv_destroy(&execenv);
> +}
> +
>  /*
>   * Compatibility flags.
>   *
> @@ -1968,6 +2193,11 @@ static const struct {
>  		.compute_exec = xe2lpg_compute_exec,
>  		.compat = COMPAT_DRIVER_XE,
>  	},
> +	{
> +		.ip_ver = IP_VER(35, 11),
> +		.compute_exec = xe3p_compute_exec,
> +		.compat = COMPAT_DRIVER_XE,
> +	},
>  };
>  
>  static const struct intel_compute_kernels
> diff --git a/lib/intel_compute_krn_square.h b/lib/intel_compute_krn_square.h
> index 2b616f136b..0490a692ef 100644
> --- a/lib/intel_compute_krn_square.h
> +++ b/lib/intel_compute_krn_square.h
> @@ -288,4 +288,45 @@ static const unsigned char xe3lpg_kernel_square_bin[] = {
>  	0x04, 0x00, 0x00, 0x00, 0x0c, 0x14, 0x20, 0x30, 0x00, 0x00, 0x00, 0x00
>  };
>  
> +static const unsigned char xe3p_kernel_square_bin[] = {
> +	0x61, 0x00, 0x00, 0x80, 0x30, 0x43, 0x61, 0x60, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x33, 0x22, 0x01, 0x80, 0x06, 0x18, 0x00, 0x05,
> +	0x0c, 0x04, 0x28, 0xf0, 0x00, 0x00, 0x00, 0x96, 0x61, 0x80, 0x10, 0x80,
> +	0x20, 0x02, 0x05, 0x02, 0x04, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x66, 0x09, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80, 0x00, 0x80, 0x00, 0x02,
> +	0xc0, 0x04, 0x00, 0x40, 0x01, 0x09, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x82, 0x00, 0x00,
> +	0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x41, 0x21, 0x03, 0x80, 0x60, 0x06, 0x05, 0x03, 0x54, 0x05, 0x00, 0x06,
> +	0x14, 0x02, 0x10, 0x00, 0x61, 0x00, 0x14, 0x00, 0x10, 0x01, 0x06, 0x0d,
> +	0x04, 0x01, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x52, 0x19, 0x14, 0x00,
> +	0x60, 0x06, 0x04, 0x06, 0x04, 0x03, 0x06, 0x01, 0x04, 0x0d, 0x84, 0x04,
> +	0x70, 0x19, 0x14, 0x00, 0x20, 0x02, 0x01, 0x00, 0x04, 0x06, 0x10, 0x52,
> +	0x44, 0x05, 0x10, 0x00, 0x2e, 0x00, 0x14, 0x14, 0x00, 0xc0, 0x00, 0x00,
> +	0x60, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x61, 0x00, 0x00, 0x80,
> +	0x70, 0x07, 0x41, 0x60, 0x04, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x61, 0x00, 0x00, 0x80, 0x70, 0x07, 0x61, 0x60, 0x24, 0x05, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x33, 0x43, 0x17, 0x00, 0x06, 0x11, 0x00, 0x08,
> +	0x14, 0x06, 0x00, 0xf0, 0x00, 0x00, 0x00, 0x50, 0x41, 0x83, 0x14, 0x00,
> +	0xa0, 0x02, 0x05, 0x0a, 0x04, 0x08, 0x10, 0x0a, 0x04, 0x08, 0x00, 0x00,
> +	0x33, 0x24, 0x15, 0x00, 0x04, 0x19, 0x00, 0x00, 0x14, 0x06, 0x00, 0xf0,
> +	0x14, 0x0a, 0x04, 0x50, 0x2f, 0x00, 0x14, 0x00, 0x00, 0x40, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x80,
> +	0x01, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00
> +};
> +
>  #endif /* __INTEL_COMPUTE_KRN_SQUARE_H__ */
> diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
> index 3c888ebd85..4d69f270e9 100644
> --- a/lib/intel_compute_square_kernels.c
> +++ b/lib/intel_compute_square_kernels.c
> @@ -86,5 +86,10 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
>  		.loop_kernel = xe3lpg_kernel_loop_bin,
>  		.loop_kernel_size = sizeof(xe3lpg_kernel_loop_bin),
>  	},
> +	{
> +		.ip_ver = IP_VER(35, 11),
> +		.size = sizeof(xe3p_kernel_square_bin),
> +		.kernel = xe3p_kernel_square_bin,
> +	},
>  	{}
>  };
> diff --git a/lib/xehp_media.h b/lib/xehp_media.h
> index fb65b8f207..20227bd3a6 100644
> --- a/lib/xehp_media.h
> +++ b/lib/xehp_media.h
> @@ -18,6 +18,7 @@
>  #define XEHP_STATE_COMPUTE_MODE		GFXPIPE(0, 1, 5)
>  #define XEHP_CFE_STATE			GFXPIPE_XEHP(2, 2, 0)
>  #define XEHP_COMPUTE_WALKER		GFXPIPE_XEHP(2, 2, 2)
> +#define XE3P_COMPUTE_WALKER2		GFXPIPE_XEHP(2, 2, 8)
>  
>  #define BITRANGE(start, end) (end - start + 1)
>  
> -- 
> 2.43.0
> 
