Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F239BC369D5
	for <igt-dev@archiver.kernel.org>; Mon, 28 Apr 2025 21:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B54810E26D;
	Mon, 28 Apr 2025 21:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WHKiGsS8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AB010E26D
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Apr 2025 21:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745876437; x=1777412437;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DkQ0ZAg1srBpFnaM7837J3j7QGeOd0MWOQrP5x1v7J4=;
 b=WHKiGsS8FqkAWah0WzZfI5ZOvH8AbhQGB5m47MIb3eTpjyjPO+sQogh8
 m143a4Sm4+718m3gsUkO18PWdOkz3kTfmFkl+rz6vZL9ME2gZsFQ/HxQM
 Yirq9ass6XZ3ORuh2ywjM7kUcv4oN1RU/DRR0FDXq1S+oeOql6OtJz2NQ
 l1juVXA3rSFrnr7K8RgygLayV6HmjJrUmCPsQ9g19r1SlPbs5IRckQwiN
 5ZtyFRUeP1yMlRdUUt9DIpCPJZh9UhhKaM8xq2HEgneWp+b/nS7JJHtcM
 failVLAk2ugrqbXpB2tQARYsfrLyw6Hx1L9kel/+uCEsMpmY17d5egLkB A==;
X-CSE-ConnectionGUID: 2t6e0hOSTgyYetuK9qJy9Q==
X-CSE-MsgGUID: pd9jKOKNRbK2Un4JpPq4UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="69989683"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="69989683"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 14:40:36 -0700
X-CSE-ConnectionGUID: WRBeU9f1SCCzxWQf+lU+QA==
X-CSE-MsgGUID: J9kZnEpVQ7ergsvplK0XpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="164731407"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 14:40:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 14:40:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 14:40:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 14:40:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edNctA1oHE+YO1qXjo14FVmIQtyYO6U+onqjh2uDW9rJEIybQc5EpssvC5PLXvkf+1ExR6D2HRUeX4QWpvcxjwgFXxXLNIPusUOP+/kl3eDSCP+6qmjqAJ6gONyFQARMc9HdGpZ5A6MrEyJ7CGPZmJjHDJkAx6IfAqjpaCaxSnw+PuvMjLsjTurtzwqYECuBCa2qQj3MSGYt0Q65VI/xpiCeVgD+xpwq/OuhPtqw4WnzwZ/GY3WwbaF5DhrXFJ5nWxXUwmmVsCxhaKKCXPkKImxtVCydA2Q4CZjlqjr7prIfTk92NcmAP3MNup2vrKY+6/vNQLZxiBj44G6ugI5u4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g3VnXdwILfAP41qyj0XllfFDHlQPKls28cSRbqy+V/k=;
 b=sZ8NsTdCkX8V9OZSVssqqn2oPS7ctX8UNEEwAodJsT1IPFjV5MJ2Y8shQNA/jhRp30i6lKKXi0PF/mlbREok7Rml/rwLL0pbIxteBZgcsuHkzYawpIGS8khO1X6YpMc8Mr0pHNC474AKJpk/ERllcFVEcEbkWJgfh/2FbBwcfx/g//9DyeVat9v5K5BzUBX+LI6N6UYJ6hF3mcU1ch/R9ZBmcasQ3aFeVxlyIS+zj6KrDWAO36KhAcxheP2vdkH6/rAcYyekJoCVqSpAK/cskLe1mQ6FBPQm29rZWsIKIl2JmD841Ma99ZOsG6l5BBSGKKoyYX/42PqTv2LruaJW8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 21:40:15 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 21:40:14 +0000
Message-ID: <0437652e-15ce-4987-8fe7-13459056e56d@intel.com>
Date: Mon, 28 Apr 2025 17:40:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/xe/xe_legacy: Move test_legacy_mode to lib/
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250417193032.329-1-peter.senna@linux.intel.com>
 <20250424173610.179158-1-peter.senna@linux.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20250424173610.179158-1-peter.senna@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR06CA0002.namprd06.prod.outlook.com
 (2603:10b6:303:2a::7) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ0PR11MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c47fe4d-bd7b-411c-a92e-08dd869d42b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zm9oSVBJUEVuUHRGRi9NMkQwZ2liOHJFTCtYbmNFSllMTWlpUk4yUVoxb1NE?=
 =?utf-8?B?aXhRMU80RlRTU2tjcGRUR2MzaGdhK3YxOWRMS25DaXFJcXNxSWthOXlTQktn?=
 =?utf-8?B?U2VleXRYbmVjL1ZxZHVKWDNDczBMMUFIQlNSZ3k5NHowTVV2VGJBeWM3bzFY?=
 =?utf-8?B?Ry9ad0xxeHVoWVNYN2x6STlhaEc5bWxOdm5kV2xHRlFmQ0l5RzVmT29ESnc0?=
 =?utf-8?B?THQ2bitrK0N1WUdDWDhOWlo5blNrYytHNUtlOUQzdnh4RGNDSmd3ZEh6YTBi?=
 =?utf-8?B?N3k4cUkvSG5keTJjb2dYRXNtNDFpVE1oc0RlRzVkTW9NU0tqZktLUWVzWXhW?=
 =?utf-8?B?bWQrK3MwQ2RwWEt5Sm82cXd3SW9TelExdDR4MGJjbHBSVGhjMm41ZW5lU21C?=
 =?utf-8?B?OXkzK2FoeE5NZlJjcC9qUlVDYjlGTDMrN2tHb1lpSVFyclZER3ZEWC9mTlJj?=
 =?utf-8?B?Z25QYTlDQnBqV0dKYXhicERwNjdwZjI2QW5BSTNSWFhjc2pBNXVobSsvcGFv?=
 =?utf-8?B?UzRRMzBuSTRxVkpwRWtab0VJOXA0VHdabnNvMzBaOHdlQzBYNCs4cWI1eW1m?=
 =?utf-8?B?MS9ZeFlTMTNSbWlKVlVXOEI0NUtVcEFPMkdnNnpTR01ucU0yYk51VlpNMzJU?=
 =?utf-8?B?a0Rxek9uYTluOEV5QWtYa1ByTjdvWXpMVjE1aHN1WGN5czY4U1htYndZVkZS?=
 =?utf-8?B?cWx2NFJyOTFyQTQyWE5qMzRkSnc4Rlo3ZUpRNm45bXpCdFdmTWs3MFU5RGR5?=
 =?utf-8?B?WmJnTk9BbEJLalp3eFJOdW41dHlCTUc4WmN4NW4yQTF6dFBQRHZPMGdWRGM4?=
 =?utf-8?B?WWFLVjhNSXpicW0wU3pxdFRBcWJnNEtFTWEwSXY2M1pzZ2VDdGhnREtWK0dO?=
 =?utf-8?B?dmhGVHdoL3QwTDFaZVY1T3diMitDb2RoVGhZZjFySGJtUllkdjczeENrOXBP?=
 =?utf-8?B?Z0pPQnRkUktJTkw0SUh2Qk5RZU9XUWFJVXVRRHhIQmVKbzBCeWZ4TjMzQWo3?=
 =?utf-8?B?VzRsWllNUkVCQVdtTEhHME5HK1dVdmM4S0Iyc2tWZGVLVHJGRE01ZGFFYzR1?=
 =?utf-8?B?MjJhZWo3RHdvc2FOZWJDK2JWcDh2ejNLRDF2U2hRSGJDYXE1U0tsZ2toYmlw?=
 =?utf-8?B?OTRmYUR5cHhMeWMrVjRPcStlYnBKVUh5WGk0ZTE4c0kxV1VCUkJxQlJlcVp4?=
 =?utf-8?B?SFZQSVdqK1FNMXA1VGNGdllteThRTjNLOXRwTjZseTJyQytxMjV3d0tUWXFB?=
 =?utf-8?B?eDFLWWRteTNUamdRcm9LS2JoNmhUVlI0aXZJbTFCenFNNktXREMxU05SQlF1?=
 =?utf-8?B?WnRwd2NDU1JMWmdKOGJUOHBLbG5VSTJUZzF1RCtMUW1SeU55RjZHTnFwL3Jx?=
 =?utf-8?B?NHFtRlVpTVRORVRsNnRJTUNnbVNYM1lxMFErWVQ2ZFU1SkUraHBnV0srZjB2?=
 =?utf-8?B?TGRlMWxXejZTS1dDWit3Mmw4UERwelhzT0R2M0I4bk8wMG5Kc3ZmWUhaTTdm?=
 =?utf-8?B?bXBQM01qSkdwSVRBQVRHb2NsaWd0ZzRuVlFwUVlXMHkxTUtxdHNBOXl1UWdF?=
 =?utf-8?B?WHUwc0lQanRWalB4NTZzeTcwVlVJaUJML0xCRXpnbE5sTjd4NkM1c1pyZnhM?=
 =?utf-8?B?d0lhTWgyM3pEVjZhbXFFemV2aDFicUxGQkVzZGJkQWVNVEg5YmMvamI5QUNs?=
 =?utf-8?B?U0RMNDAzSnhDMjByYkM5aEVrZGVjbC9UaUVFT1FDQTUraFZMT01ZSFQ2T0gr?=
 =?utf-8?B?T2h5dmhocTRlQXJtMjJhRFBvSVB1UEpRbWsvTW55Yld6VDdyNG50aXpueE00?=
 =?utf-8?B?QUJRQ2g2aFliVGFxcDRobXRVZVZHTERRdEdSelpodDYrNlpLTWFqRGtBNmFB?=
 =?utf-8?B?NWxjSmZqTWdubzNJdnVwSjk5SU85emljZ1pWLzBOSU8raWZiK0x0WHBMSTF4?=
 =?utf-8?Q?C/wsLD85phw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YW9WYmc0Um9FQkt1YThtRklVeDNHQ1VoWGJBV05WSlZzbzRIenVmSnhHdjd2?=
 =?utf-8?B?d3VoekRPU3JaK055eXQyeFRrK3MyUXVqVm8xZ3dqbFk4MTAvV0I1K2gwd0tQ?=
 =?utf-8?B?bmU4YjJaeTYzdjUzUzlYVnYwaU1TcmVKdVpCS1lMemNhVXNld002cFQ2SXVM?=
 =?utf-8?B?YWFxZ2FGQ1BNdDFZbjZienpnQ29razA4OU1WeUNlTXkxSUlNNUZOckVGVkQv?=
 =?utf-8?B?VXNidzBrRHBNcHhyOVJqVVNIRFhXVWFnbkhEdUlpbC9kZmZBUkErMjJGVkww?=
 =?utf-8?B?aVpxcXBNajhQMnZYNWNjZ3c5c2xFVXBpREpoU1hCSXorSGtBTWVwSG4zNmM3?=
 =?utf-8?B?U210ek9aTm1Sak9ieEhNNlhjVnRMa0xFQUJOcmovbC9TSHNXaW1CaXdNZU1j?=
 =?utf-8?B?MzlOU28wQ2xoc3ZCMU95eG56Q1RmZ2hLNFY0Q3JMeUVaSnFTQXNXTWpVQk1h?=
 =?utf-8?B?YlpTR2JMS1pZcTA5dDY3L2t4UFd4a1VjR0FJK0ZkT3I3YWJhcmg1V1hXeS95?=
 =?utf-8?B?elNFcGF5bmV6cHd2U3UvZ2IwMW55eVdBMmRFV2o0TW1MSzRTL1ZCQVlpbFp5?=
 =?utf-8?B?ZnhuYm42SzYrNkJudTZKT0tpRFVhR2ZjOUM2SmFTZWZtNkczQ1hDTWJmSU03?=
 =?utf-8?B?cnRlNHlwMlVtaXVIaExNSFZxSUtxRUFjN3hjRU1vcEFyNng1TXg0M0I0TGNK?=
 =?utf-8?B?aGpEZUJCWkMzWW1GN3dsSDErdGFmN3VLbXB2MUtYeGRIS3NpclZYSWtNSTk3?=
 =?utf-8?B?K1FtOGNwa0dwQWRQaWMvTngvVWYyOHRabE5sY2xFRTc0MGwvUHkzV00xNkpy?=
 =?utf-8?B?bk96TEIxTGtRWlNkbm1mNHNNK01ZQk5UakhGNXptTUp3MTlGVEFGTXN1STZE?=
 =?utf-8?B?YWQvMFdlcnFyeW5UbEYyaWtyRVl2ekZUMkJERWJ2ZFFPemphYnJKVDc3Vm9V?=
 =?utf-8?B?NHc2dUszcE9mRWcrMzN6UjFxNkQxeUo0WC9peTI1MUpiT1JUV2p0dEE5T0xO?=
 =?utf-8?B?MkVSQVpwRFF6cmJHK0RadHlRalR2cWI4eWVmbTFYcTY5bnNnWXFqL1VsUzl2?=
 =?utf-8?B?eVNQNkx2ZHVMUTNObXRGMmQyNWFyYWF4Tmc0bm5ZZ1BuRm9UOXFINmtydjV4?=
 =?utf-8?B?YkdOZGN3VzZNUk8za0N1Z3haaHpJTE9lQ2ZsMkZkQjBnR1ZzSFI3VEN0bitp?=
 =?utf-8?B?Sk92M2ZmRVoxeDBpdXJ0OFNKOEllOWpwaXNId1FjZnByWTcxK3ZoNjAxM1o4?=
 =?utf-8?B?bEFYU0thMGl6Y3d5UnBaY1lpTGd0cHJNbjkwbkFrSlZ0N1hoMlJYNVd5dkJY?=
 =?utf-8?B?UFRSenRhWjV5bTdZRHZ1a0RURitJcFRzN0plYVJ5Y2c5Vm9mS05wbDRPU2FB?=
 =?utf-8?B?QVBHRXJmenM4Wk1mb3NYZVVlUUVMbFRLaEtQd1E0MFcwK2Q1a3Q1RkZmZVB1?=
 =?utf-8?B?MVFHR2ZLcmJzbnRYWGtlMU9pcGhrSUJhUzdrM1NveU0zc1h4WW9WdjJuK3RJ?=
 =?utf-8?B?QUlBblhtK0Fmb0Z3RW1VRE5FNThxZFY5VXpTUVZzOGw3RkRBeFFmblZFbWlT?=
 =?utf-8?B?YVZUVGV6bituOXVrNDQzOGFDaVlSR1NqbFo0Tmt6TUdramdkL25CMkNyeXk5?=
 =?utf-8?B?bkxWNGhnZGRudHRhVmRYU2s0dGJQcEFtK3VnN1BjUlpTTzVHazg5cmZVNUQz?=
 =?utf-8?B?dnlvTldZa0R4aU03Zkl4Q0VpZC9NeWFiL3A1bFV1Z0JvSkVqUzdic1ZRdkMy?=
 =?utf-8?B?Y1RwV0NtcW53TktVSHlvSHRQTGJMNXJzQ0xxa1NQM2EyMFBlRVFZakQ1QTV1?=
 =?utf-8?B?dndsVnEvbmZVeDFnUCttLzJLekNYOUR4NEE2QVFIUEhYUHVYZlBoS1d5b3Bw?=
 =?utf-8?B?M3ZIWWw4ci9Lc3E3b0VZbUl5T0RsQVlYdjY3TlcvVFBnSjU0bVJXaWhLVk9i?=
 =?utf-8?B?U3ZmaTNoZnozRUo2VzRmWGNiRmJHNnNYbCtSNTk5MGd2MGxFK09hOVFFV1JJ?=
 =?utf-8?B?Tmx2OTFvazFBcWRGa1BjQkZ1T2doUURaajBnM0sycVlnSXphbDZVcGNNemda?=
 =?utf-8?B?cjFiam9GSi9yN2JEb053MUpXcG1ubzUwQVFVQ2ZTWmN3M0VBanhKSXVQbnNt?=
 =?utf-8?B?REtjR1VrcVA2Yy9tSUZEdkp3UnE0eUFWQ2pEVmk2bWlVT29WeTIyRHJaZzJy?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c47fe4d-bd7b-411c-a92e-08dd869d42b6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 21:40:14.5676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1FZCipiXojLmGcNaSi3TZJR5TIcacEn0alYA94EwmVZidaWf3bTijzWAwxe6WQs8f/ysAXpDKLB74gWmW2Q2lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
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

Please see my comments inline below.

Regards,
Zhanjun Dong

On 2025-04-24 1:36 p.m., Peter Senna Tschudin wrote:
> There were two similar implementations of test_legacy_mode(), located in
> tests/intel/xe_exec_capture and tests/intel/xe_exec_reset.  This patch
> consolidates them by moving the more complete version from xe_exec_reset
> to lib/xe/xe_legacy, and updates call sites on both tests to use the
> shared function.
> 
> The version from xe_exec_reset.c was chosen because it is more
> feature-complete and flexible, offering the following advantages:
>   - Supports CLOSE_FD
>   - Supports GT reset
>   - Waits for spinner start
>   - Checks batch buffer result
>   - Conditional bind call using xe_vm_bind_async() instead of
>     __xe_vm_bind_assert()
>   - Allows early return
> 
> To cover for a difference between the two function definitions, the
> shared function was extended with the use_capture_mode parameter to
> control whether to use __xe_vm_bind_assert (capture mode) or
> xe_vm_bind_async (legacy mode).
> 
> Cc: zhanjun.dong@intel.com
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>   lib/meson.build               |   1 +
>   lib/xe/xe_legacy.c            | 167 ++++++++++++++++++++++++++++++++++
>   lib/xe/xe_legacy.h            |  15 +++
>   tests/intel/xe_exec_capture.c | 109 +---------------------
>   tests/intel/xe_exec_reset.c   | 153 +++----------------------------
>   5 files changed, 201 insertions(+), 244 deletions(-)
>   create mode 100644 lib/xe/xe_legacy.c
>   create mode 100644 lib/xe/xe_legacy.h
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index 8517cd540..454dcd244 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -114,6 +114,7 @@ lib_sources = [
>   	'igt_hook.c',
>   	'xe/xe_gt.c',
>   	'xe/xe_ioctl.c',
> +	'xe/xe_legacy.c',
>   	'xe/xe_mmio.c',
>   	'xe/xe_query.c',
>   	'xe/xe_spin.c',
> diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
> new file mode 100644
> index 000000000..81a9f3bd6
> --- /dev/null
> +++ b/lib/xe/xe_legacy.c
> @@ -0,0 +1,167 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "lib/igt_syncobj.h"
> +#include "linux_scaffold.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_legacy.h"
> +#include "xe/xe_spin.h"
> +
> +/* Batch buffer element count, in number of dwords(u32) */
> +#define BATCH_DW_COUNT			16
> +#define CAT_ERROR			(0x1 << 5)
> +#define CLOSE_EXEC_QUEUES		(0x1 << 2)
> +#define CLOSE_FD			(0x1 << 1)
> +/* Batch buffer element count, in number of dwords(u32) */
> +#define GT_RESET			(0x1 << 0)
> +#define MAX_N_EXECQUEUES		16
> +
> +/**
> + * xe_legacy_test_mode:
> + * @fd: file descriptor
> + * @eci: engine class instance
> + * @n_exec_queues: number of exec queues
> + * @n_execs: number of execs
> + * @flags: flags for the test
> + * @addr: address for the test
> + * @use_capture_mode: use capture mode or not
> + *
> + * Returns: void
> + */
> +void
> +xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> +		    int n_exec_queues, int n_execs, unsigned int flags,
> +		    u64 addr, bool use_capture_mode)
> +{
> +	u32 vm;
> +	struct drm_xe_sync sync[2] = {
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 2,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	u32 exec_queues[MAX_N_EXECQUEUES];
> +	u32 syncobjs[MAX_N_EXECQUEUES];
> +	size_t bo_size;
> +	u32 bo = 0;
> +	struct {
> +		struct xe_spin spin;
> +		u32 batch[BATCH_DW_COUNT];
> +		u64 pad;
> +		u32 data;
> +	} *data;
> +	struct xe_spin_opts spin_opts = { .preempt = false };
> +	int i, b;
> +
> +	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
> +
> +	if (flags & CLOSE_FD)
> +		fd = drm_open_driver(DRIVER_XE);
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	bo_size = sizeof(*data) * n_execs;
> +	bo_size = xe_bb_size(fd, bo_size);
> +
> +	bo = xe_bo_create(fd, vm, bo_size,
> +			  vram_if_possible(fd, eci->gt_id),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	data = xe_bo_map(fd, bo, bo_size);
> +
> +	for (i = 0; i < n_exec_queues; i++) {
> +		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> +		syncobjs[i] = syncobj_create(fd, 0);
> +	}
> +
> +	sync[0].handle = syncobj_create(fd, 0);
> +
> +	/* Binding mechanism based on use_capture_mode */
> +	if (use_capture_mode) {
> +		__xe_vm_bind_assert(fd, vm, 0, bo, 0, addr, bo_size,
> +				    DRM_XE_VM_BIND_OP_MAP, flags, sync, 1, 0, 0);
> +	} else {
> +		xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> +	}


> +
> +	for (i = 0; i < n_execs; i++) {
> +		u64 base_addr = (use_capture_mode || !(flags & CAT_ERROR)) ? addr
> +					: addr + bo_size * 128;

Reference form xe_exec_capture.c:
for (i = 0; i < n_execs; i++) {
		u64 base_addr = addr;
		u64 batch_offset = (char *)&data[i].batch - (char *)data;

Reference form xe_exec_reset.c:
	for (i = 0; i < n_execs; i++) {
		uint64_t base_addr = flags & CAT_ERROR && !i ?
			addr + bo_size * 128 : addr;
		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;

Is "&& !i" check lost here?


> +		u64 batch_offset = (char *)&data[i].batch - (char *)data;
> +		u64 batch_addr = base_addr + batch_offset;
> +		u64 spin_offset = (char *)&data[i].spin - (char *)data;
> +		u64 sdi_offset = (char *)&data[i].data - (char *)data;
> +		u64 sdi_addr = base_addr + sdi_offset;
> +		u64 exec_addr;
> +		int e = i % n_exec_queues;

...
