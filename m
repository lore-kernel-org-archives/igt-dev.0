Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54178D2ECF7
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 11:17:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4CFA10E025;
	Tue, 20 Jan 2026 11:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IAOnfDlP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2785610E025
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 11:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768907839; x=1800443839;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yftCvlgEDS6DACKVYxpKE1kzmUn1NIjEeZq3eMRN7bE=;
 b=IAOnfDlP5WPCVtzg1vZr06yFIs1HTyrtYiqfb0flFIFQjfuxsaeir/IE
 /u0anYVsFByOJEI6u2nZI8XLB1YzIYudyMgW97+8D5DGo2mK3lKp1NWK4
 P/v34PsGlzp5f8hZkcaVLaTcPXg79XMWNhG4BOnZWOjev7gfkRuyChWjo
 XUSSwtdIZho7NIgxo9JVdrvsf1kkC3/xJ6brLwuh9BP7SMo+mmTcyMtEl
 lgC7x885Y5qfGrcb3RBRgjYUzm7t2kwK/BXy7AuY9cZ1IXkSPjqQ/qoYN
 EmfFP1Bl+NaRDOHk6de2N3BtmDPwoJj9hGkz4JwwwYyX7TXOvFm9y5LwS w==;
X-CSE-ConnectionGUID: wCN/EFGVRZS1ZiXQyekpug==
X-CSE-MsgGUID: x1LfW7IFR5Sy+Sun6B12ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69841884"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="69841884"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 03:17:18 -0800
X-CSE-ConnectionGUID: QD8Q9E7zSD6JzR5iPf0Ewg==
X-CSE-MsgGUID: MoPIl1GBTE6DvZ3EySBxeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="205345019"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 03:17:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 03:17:17 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 03:17:17 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 03:17:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9WAZk8Rg5niQNjFrXGSmknCkr1gYEvQo2Vcj5Zia+Vu/87TiJxJ2tHALp2qxLQEeIDWbxYiR8WbIlf9qDPhPoAyYjhEUKFHnhjRVe30tmiC0EvOTDHJ8d5aX0vDnggbpyhjeuiNGhHk23zlUDRu6uFZsMiWgN5X3pM1CR8MzOvGW7nH5GH7m7gKLoIARECCMPGloNJ1tPDI6LKJ/7OFpZm2HI5fAUdlyVbQ8JJxslPJIIVB55ZjdpnhvkSO1wdaVuuBxRzryzrm5Mp9s09SVuCGpmx4OBLCCesnE4+pyPUrKD4NpGTD4IlZwBgOIN4lfELien51FZbB6qPzCgVQLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxW/rLHxO/GwlPYLcobZzeUcAbk0vFVpWw1iMPBNRI8=;
 b=pekNRVCqlCvKIf3vgXuZoTax6Ps8LhmT3+fRDpZqv9HPn7W/obhC/qv3/JOdfG7wPZEtAswCEit1/vvyYjGoYuFpKUyCrjU0YIrEdAuJXiBMa4cL8/ZxFOWF+SY/KAMRjmvCBfofLP3cj+OcKltM5dG0GONne31dx5An0KztIO01urPlwFm4NwaTM4pnqRWka2oJRSrhLyZTfgUN+UkOrxQHXUZ85mYcFBpejMucTsQ7VQWGewc/iXHWI1IULIsgUYA1fU4N3Pgo1VOuhr9dK5ipBy/GbLzz2jjYXckrwCj2BWjQhdL91IU7nwOObumy36LwcmcAuvS9Ya+qnrPoJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by DM3PR11MB8672.namprd11.prod.outlook.com (2603:10b6:0:44::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 11:17:15 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 11:17:14 +0000
Date: Tue, 20 Jan 2026 11:17:04 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <carlos.santa@intel.com>,
 <jeevaka.badrappan@intel.com>, <kamil.konieczny@intel.com>,
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_explict_fence: Add Test for Explicit
 Fencing
Message-ID: <sy2d3ljcgissrqgexvvgkzmmtwcypbl3revdy3cor4q2izh55w@atgzhvyaezj7>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260114082323.2534785-1-s.sebinraj@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260114082323.2534785-1-s.sebinraj@intel.com>
X-ClientProxiedBy: LO2P265CA0119.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::35) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|DM3PR11MB8672:EE_
X-MS-Office365-Filtering-Correlation-Id: 16871e2a-ded1-4580-7b9e-08de58157703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVFES0l0ZUdaRzJuNEZoOXJ1MDYvSFNZeFZlOHNzWnN1OFIvamJ0NXA5L0dC?=
 =?utf-8?B?aWN3Yi83U1pnR0tQSTlhTUxHV080K0ZKZmlrL1JJT05UU2laV3I4QTJyQ1NO?=
 =?utf-8?B?dUpjcmhNN2NxajhHdDg0RXdFeTl2M293T0l2NEV3NGVVNWQ1WkswSldsZ2oz?=
 =?utf-8?B?M1FpTWl2ZFdhYlBMN2ozZm1IQWdQaCtFa0hobFVsRTdlRVArNldWUGpENGZJ?=
 =?utf-8?B?SW9zYlltcmhZTWEvZ1pnRGg2UWMzc09YbGZDZVkrWDZCYkx6Ti9PTHk2Q2xv?=
 =?utf-8?B?Tnc5d1hLSGVPMDZsU29MMWU2NjlDb2ZPMzUzaHBjdmFFaTIvU1RZTGZMNU1S?=
 =?utf-8?B?UytENnk2ZlQvdm81M3VVOHRobU5EOHBabXFhSEZJMEFzQ3VvT0VGdGNIOURH?=
 =?utf-8?B?UmZEQW52U0pmdEJmeHJwTFlJMVlUTGlvQUFsYThBUVRCT2hVREZMUDljc3M4?=
 =?utf-8?B?bmJJcXdoUm5KZnVzdk5NdVVGOXMyc3FRcnl2YjJzM0pwakl6WEU4Y01lQXNq?=
 =?utf-8?B?ZFpSVmp6MmtNaVZTa3Q5T1dUTE5ZOUdoWFdKRmkvNDFhaHU1YUhQd1RjT2NH?=
 =?utf-8?B?YVFWWGxUTHNDeXVtTUc4TzREaGFtSnVReEd1SnBxRHljOW9XM1VWM2NwbURB?=
 =?utf-8?B?di9oa3NDYXpzOVEvUFk0bG1aWkxyTVc0L0gwc010Rk9jaTFOV0xjUGI4T3Z0?=
 =?utf-8?B?SjlaRkxCMEw0KzR5MzVpQkJZNktqMUhNRzJSa1F4Z0ljT2NyUjhSNFJqZVNI?=
 =?utf-8?B?MEtkd0Q4VEpoZmhnT2RaT0NMZGxXeitqT0l3cjVvYUg0dVlqa082K0xQVjJL?=
 =?utf-8?B?WXBjOUFYMDdKUERlVlJvSVQwbGJIbGhPcit4Tk0vcUhnc3dDRmZQYWRBYmpC?=
 =?utf-8?B?ZVNCRnlHbEVqZjBuTnBsN2QrZ2VCWDdBNVNzK1lBc014Y1A3Z0s0ZURIdVVH?=
 =?utf-8?B?WUlLeEdjR1ovdTV0aDYvdlAvRnJSVzVPVGRBYjg1bEt2cG5DREhpbDR1L2pC?=
 =?utf-8?B?UWV2blBNMjhOWnBxVGtkSzJBbzNmQjY1ZHlSYnkxOVk2YW9hY3dVR2dmaysr?=
 =?utf-8?B?SmNjeWJMZ1NSZzQwTndhRlBMc0NyUCtJbzhveW1SNWpsbjFXRldaRzZ1YTRy?=
 =?utf-8?B?VCtuMGcvUDY0bmtVVzJLejI1Y05NaU42UVY2dWI2NHpqQUJ6cFVRVnZLMnQr?=
 =?utf-8?B?Tng4UjJOSmVneFNPeVFJRThuc3Q2MnFCRWw5b3pTSTlZRzhCT3k1dTlGWlpT?=
 =?utf-8?B?TVcxalMxS3kyNWtRZE8xcDBRTm9iTW5xTit4VkZzSzBZdVJzd0k1SU1DMTd3?=
 =?utf-8?B?S1I3bVc4dGdhZHZqWUxhdUl2cmV0bnZORmU2bmtiM3NYdUFBOGdPRXV1a3or?=
 =?utf-8?B?TG8vdW1yV2ErUFFmMFJPYXk3Nk9vMzA2SWNtVnZRUngvejdyZ2ZURjFIQmpE?=
 =?utf-8?B?OGNOQnVVOE1wQksrcFhyU0NvMmNGYzBXRzhIV3owMGppbXRYVmc4VTE4SXRD?=
 =?utf-8?B?VjhWaUZVY1hZMHdUcUJjY0VYUFI5cFJEcjY1TCtrNTBxeUtBdEU0SUIrbWkr?=
 =?utf-8?B?Q29NbkdVU3FqMk1vd3JUb2dvY3JyYUZ6WjJxY0x3d0h4dkVYc0ppbGNqeU1q?=
 =?utf-8?B?N3lFK1QzWjJMK2xUdnBsaEpRMWMrc3oxVDE0aWtwbk5mQTB0T1RFcHMydlA4?=
 =?utf-8?B?dWc1YjI5UUw3QTRXeWZ0cGMvVVJLZWUzZTBZOGFSUXRUYkFiSFptcGpMRjVK?=
 =?utf-8?B?dlFUT3hqRHVWTGpONFVnTkJOV05pY3RoN1hHTVhOTEQ1MnZLcGdkVEpTUGJ5?=
 =?utf-8?B?SWNBNXhFc3FmbTl2WUxndHBIYnV3OFZlWnl5cEttdVlmdCtoRFIzbHVDK3JK?=
 =?utf-8?B?d1lDWlhKQU9EdzBVVitnT3BZdHRGMzZ4M3piNFNOZ0puVlNibW91aGhCdWZP?=
 =?utf-8?B?YmNpSm93ZEJya0I2QWZ6S0RrcG9VVWt4ellTNVM2a1laZ0Z6dTlXTU1sYUll?=
 =?utf-8?B?U1A4KzUrSXpZd2JzYzA4OGVJbU5SQVM4cFkyVXBSeE1sSTVqUGNGSTE0QWQ0?=
 =?utf-8?B?Y0ZJV2pUNWt4b2Z0U0d2OUo3STRCc2o0TVpOcWhYbXVpUzlHVGxxOWhjcDN2?=
 =?utf-8?Q?80b4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXcwUGVETkc5N0R6ekxnczJoMXlLRFZKdzYyUjFJRExwM0VBVjhvZ1dxVDRy?=
 =?utf-8?B?ejd5ZkREa1ZMM3lGUzJrZVgrUExCMmFRc0x3c1N1QytMVWw4Q0Y1OUpINWxN?=
 =?utf-8?B?ZlBoeWRTMVNhZ1hacGNkQnV2VERvMnY5RmF5UVNMakt3T29ycXhQaG4vR0J6?=
 =?utf-8?B?MGFXeE1iT0RlcjBoM0c2b0FRUFNNcGdlVmp1TGtoV3VrQjIyK1d6cU1qZzRC?=
 =?utf-8?B?TC9DVzlsK3VsUTJ5OEIvWDNib2pWSUVXVVk2TjVLVzBtZ2ZET0lKVGpBY2E1?=
 =?utf-8?B?dUc1aGcyaElQbkNFSFFwNDA3aUh5d2Q0Z2d3ZGV6WURIRlhqc3VZSlpwZGNq?=
 =?utf-8?B?WkFlNk0vUlQxWTR1S3cyeWF0TFh3b2JFQS9QMUk0Z3BMc3ZpQnhmeGlYbWw2?=
 =?utf-8?B?Z2FCOFpTbE9Xdm14MTg1NTJvUVY3MmVVTmNqaEh2S2l2d0M4OThuSWQ2S3p6?=
 =?utf-8?B?NFNpWXgxZ2tIdHNLalRRN3dvV2d6L0RIRXNqZ1NEQm81VzlNUXI5WlVya3N1?=
 =?utf-8?B?Z0Z2TWExMXE2dHhmTzNDWnh4bFRYQk5tSzd0SkZJSncrekxkQVdiWTl0OUlS?=
 =?utf-8?B?bE4rajA4VUhBMTB6R0J4YmtlQURRMUlzN3dXdktuRWlGcUdxUUN2NTFoZUNW?=
 =?utf-8?B?QldCQ1Zsa0JIdmtWS0kvRk95ZjRKUEtPNWNobDYvWXl0c3YvOTE3a21DQTVr?=
 =?utf-8?B?SzcvdlU0TGllang3bENJcW81Y3RYanc0RnVkTlYrL25EU2xZRW5zRTNqbXdB?=
 =?utf-8?B?b1JPN3dpYVhLNEkzRmtZMFovYnhpcEtGdDN3eG9Ia0I0d2srNHFLbWpIRk4z?=
 =?utf-8?B?U21FR3ZEcFVqdERGL1pVMytrNVVHVlg2bEJwZHFibEcxYWFtTFRiNG9yZ1pY?=
 =?utf-8?B?MktRejFoMEpiRndPazZyZHZjdnQ5WTJrOFVMaGQ1eThpSDdLck8yaHZCU2M3?=
 =?utf-8?B?ay8vQkxCL2JIcGI0RWV5cmQwOUhNN2lKa05YOEYxNzBMczJkWStaRVdCdGRq?=
 =?utf-8?B?MW9icXRJVHQvM0tFWHZ1S2VJM29WTFVGV1Mzdm9GR2NHVHRqL2JZVnBqU3lM?=
 =?utf-8?B?cGJJMEJDVkdDeXlLaTFyRUFxRVV5QXl1UTJzd0s0RGFRNkNOMFFNdWdEK3ZL?=
 =?utf-8?B?VE5UdXdVTDZua3JGVFlqVmNubXhJbU9MRVoxZGtvSFlOK0dwanhMZUJvdGxL?=
 =?utf-8?B?S1g2a1hXYmZlR0JsUGJWYnM4ZkZBMUM2SDc5RTFadEI4NUpCNWNzRTdGNDZv?=
 =?utf-8?B?RW9ZQnk5VmZFc0lxek1VQ1dMaEkzdHpyNDNyZ0JkS2V0cE9RMnZNUW5sSHVJ?=
 =?utf-8?B?aXRuMkpHY2FNaU8zWG4wRjRESDYzOTJiMmtkZFJXQytDQXBWSDRvMnMxZjhv?=
 =?utf-8?B?TjdXdWdBM1hiZERja0VQVUtBRUU1dmJqUVdKWDBUOUtWK2czOXJPeUpVR3kw?=
 =?utf-8?B?UXFSN0tLMVpaZHc3KzVLYmJzazFnaXhEK2tIdnVXRnNLU1Btb2ZXR2ltNGJU?=
 =?utf-8?B?Wk0wWUtreEo2VzNYTEYrVlluUTJGYithd1ZCa1Z3U1I5eVYzRlVJZVZ0TjJq?=
 =?utf-8?B?ajZXa3FONHV2Qm1MekxROHZSTDk5V09UU2hIcFM5cjNielFLK3VMaTFBWS85?=
 =?utf-8?B?WDNEeWFKaUJoWkFTUXFZNVdDVEtZZ0pBeDczd0tvUEhHb0NDY1Fwa0VNWFJW?=
 =?utf-8?B?SVUvUi9DNUJmTEN2M0NINS82UmFVTUphZ25vbnY4Q1kxUEJxWGZ0emwxZ2tt?=
 =?utf-8?B?MGxEUVVRZVc5clNvSTBZQ3N5eUFJdHNBTTQ2aGhjdmg5cXZ5cGQxRFJVSEt1?=
 =?utf-8?B?bVdzVlNxSW5SditmUTIyVzYvSDJhejNsMGl1RHJ4NHBqQ1JEelI0djJWNGor?=
 =?utf-8?B?Y3NNTjRpTjR4VmhlVUFFc2R5OUVkZmdBaFZXRW9LeDhTbzVLR3JPQ3Nka29O?=
 =?utf-8?B?a21nSExXOFlIMGU3cVlRRGNCQ0lPQ3F4V3MwK3BXaGpoRVpYWHpTU1NCL2Rw?=
 =?utf-8?B?YUFCNVJQNXdkL2xTWXN3WENJL3p5eXhMVm11Tlhxc0NkSXBhdWpadWtsR2Np?=
 =?utf-8?B?R1hPQ2IxTEF4RGdBai96VllONTlGdi9xZzVOSWEvMlNtUFRESzJ2N3RWbFow?=
 =?utf-8?B?LzNWSGlaMENGOXp5UjJuTFZYcW9Pa1lVSUlCbkEwS1RKYnBPSC96UnZDajhL?=
 =?utf-8?B?YUh2WHVjbElISmVJVEV1TnRseDlsWkl4Q3pIVGZwUUpWRWlaaXFuWkd6cm5Z?=
 =?utf-8?B?YVlORmZBSk9zb09GYkNwYnBqNXdXWDB2eS9BOTNKSTZoUENLd1NQM2paTlJv?=
 =?utf-8?B?am14ZUI5L2hmelllN2ltUVRqM0VOU1pxdlNwSldtZ05IYkVWOFhoUmN6Skw1?=
 =?utf-8?Q?He2oPDngslrvY9b8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16871e2a-ded1-4580-7b9e-08de58157703
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 11:17:14.9131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7u6cxKk0n0S6QgqU05tGFiC6fpkeTwkndab4X54MBoPKQ13IyrbiKCIMzsHdmw1E7YvI9c5LIEbooyDLVFMBFyelT+TbHFhLNcCh2D0w/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8672
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

Hi S Sebinraj,

[...]

> +/* Test configuration macros */
> +#define NUM_PLANES 3
> +#define PLANE_PRIMARY_IDX 0
> +#define PLANE_OVERLAY1_IDX 1
> +#define PLANE_OVERLAY2_IDX 2
> +#define OVERLAY_COUNT 2
You could use NUM_PLANES - 1 whenever you need to get a number
of overlays.

[...]

> +static void setup_output(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_output_t *output;
> +	enum pipe pipe;
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {
> +		data->output = output;
> +		data->pipe = pipe;
> +		data->mode = igt_output_get_mode(output);
Are these values changing throughout the loop?
If not, then perhaps for_each_pipe_with_single_output() or
igt_get_single_output_for_pipe() could be better suited,
depending on which values remain constant in this loop.
Otherwise, writing the same values over and over again will
work, but only the last loop iteration dictates what remains in
this struct upon function return.

[...]

> +	/* swap overlay colors to see visible change from the previous scanout*/
> +	igt_plane_set_fb(data->overlay1, &data->overlay2_fb);
> +	igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS_Y);
> +	igt_plane_set_fb(data->overlay2, &data->overlay1_fb);
> +	igt_plane_set_position(data->overlay2, data->width - OVERLAY2_OFFSET -
> +				data->overlay1_fb.width, OVERLAY1_POS_Y);
As Karthik alrady mentioned in his review, this is most likely
not going to be utilized in CI, so could be removed or run with
special debug options.

> +
> +	/* Request OUT_FENCE to track when display update completes */
> +	igt_pipe_request_out_fence(igt_crtc_for_pipe(&data->display, data->pipe));
> +
> +	/*
> +	 * The atomic commit should succeed immediately (NONBLOCK mode),
> +	 * but the display should NOT update any plane until ALL fences
> +	 * (including the unsignaled overlay2 fence) are signaled.
> +	 *
> +	 * A buggy driver might:
> +	 * - Show primary and overlay1 immediately (wrong!)
> +	 * - Cause visual corruption
> +	 * - Fail the commit
> +	 */
> +	ret = igt_display_try_commit_atomic(&data->display,
> +					    DRM_MODE_ATOMIC_NONBLOCK,
> +					    NULL);
> +	igt_assert_eq(ret, 0);
> +	igt_debug("Atomic commit SUCCEEDED (non-blocking)\n");
> +
> +	/* Get the out fence to monitor completion */
> +	out_fence = igt_crtc_for_pipe(&data->display, data->pipe)->out_fence_fd;
> +	igt_assert(out_fence >= 0);
> +	igt_debug("Got OUT_FENCE_FD=%d to monitor display update\n", out_fence);
> +
> +	/* Verify overlay2 fence (last one) is still unsignaled */
> +	igt_assert_eq(sync_fence_status(fences[PLANE_OVERLAY2_IDX]), 0);
> +	igt_debug("Overlay2 fence still UNSIGNALED - display should be waiting\n");
> +
> +	/* Verify out fence is also unsignaled (display hasn't updated yet) */
> +	ret = sync_fence_status(out_fence);
> +	if (ret == 1) {
> +		igt_warn("OUT_FENCE already signaled - this may indicate the "
> +			 "driver is not waiting for all IN_FENCEs correctly!\n");
> +	} else {
> +		igt_debug("OUT_FENCE still unsignaled - display correctly "
> +			  "waiting for fences\n");
> +	}
Most of these igt_debug messages are excessive. igt_asserts
should be enough to signal what went wrong. Furthermore most of
the CI runs use debug flags, so this test would produce a large
number of messages that bloat our logs.
Please leave only the logs in failure paths.

[...]

> +	/* Cleanup: close test-specific resources (fences and timelines) */
Just "Cleanup" is enough, reader may infer what you are cleaning
up from the code.

> +	for (int i = 0; i < NUM_PLANES; i++) {
> +		close(fences[i]);
> +		close(timelines[i]);
> +		igt_plane_set_fence_fd(planes[i], -1);
> +	}
> +	close(out_fence);
> +	igt_crtc_for_pipe(&data->display, data->pipe)->out_fence_fd = -1;
> +}
> +
> +static void test_fini(data_t *data)
The name could be more descriptive. You could rename this to
"reset_display()" or "reset_display_state()" and skip the
comment two lines below.
> {
>	/* Reset display state */
>	igt_plane_set_fb(data->primary, NULL);

[...]

-- 
Best Regards,
Krzysztof
