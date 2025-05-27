Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2086C54F30
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 19:15:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3DD10E00C;
	Tue, 27 May 2025 19:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FX8D2taL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C445B10E00C
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 19:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748373339; x=1779909339;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PLFUQwGT63tBoTQAiXG6F/OMr/MM/GD8+pmByQNI1+U=;
 b=FX8D2taLGXs03pap8FABfMViSSiW2afq0QBruooQYDu/slU4nlWySRTg
 2dNnvG/twIvfda4W8qIV1UuTNs3Jos9Jt1Xg4XHmvd56zotubN3ik4nJZ
 Jx3Q+AZKLVhqaFfLCa5F+JOGMoRiCcM2jqxewC4Ls7UzuWuYr4Y5TrwDl
 8Pb3WIOPbnMhnRXFebMbQ6yVzHHV0BezypAYuhzTEBBJ7suDb8AhQEgjf
 jbSVsl83zpRpg8pycOPb1qG211jveW3lc0d9ckz94dqMq0nfarjr0kNPj
 Gkzwez7kfdwfK16qc8NT5+gwELJPluSd6agD41au0/qjQeFmSzextY0Vw g==;
X-CSE-ConnectionGUID: NJ2d2mS/SbWcRvOjkcvWhA==
X-CSE-MsgGUID: yHMwUQM9RjyGk3/AxA052A==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50540911"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="50540911"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 12:15:38 -0700
X-CSE-ConnectionGUID: Lhhl1V6JRtOGA3RxdTI03A==
X-CSE-MsgGUID: 5ILkjsOTSSm5KA6ximcKSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="147702791"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 12:15:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 12:15:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 12:15:38 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.61)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 12:15:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MWqFVlI2dhCvmMArTPocQdjgNfro3Ckeoh4aJZRop2/WVAv+i8t1Zhsbzb+ip6VifXgSh7pzuZ3C7GizUyUj+XwhkhjWPqWRZNQa+iHC9tQZE4gj7dTzk1nyqn8p4PCzbmBm0zGVOIghBb9+Otl7i+oE5ivEnEIDshLRNzUSk6+HnellvjdH4Xe4VeXdwdi1qIhT0BND0AgcpuOlMYActlAAJa/bb+XHMgLf1jbim81daDC9kt42fYRwvGojP968YHReLbOUf03BFVLv4lq3E9y92jgqm+AxBA7Y7BJWZ4iH67Vxf4msPsl548mG/t6sQ4a2DxT2LmQUPtEpBa6w+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2Z8CcFhOhZTxma1aGXKdcBAvTStu/H5yEoYJC1QYqM=;
 b=M72IorO/FQ8U6hb1V1NlQTSVBs3qCJagXcjK6Vn3UnufKe6cYJ886AOahucCGQOXNMNIkBoaXl8vkqIJiJb3vVogvfYlLDL8vVaEHIfKB2F84ymbNxeqE5fLzMu/xGa68y3QZX7gwF7Q98uyP2gaEJej/RMgNWsC0IW3c6/AwGBC+F670J03cz+WmLihAwDbJzObK5OLwQwOiQHqWvPkUlCmauJw7CcgFy2CgxKIH6Dix7fjKLvd3VqoLB0R8JSniYkMS3rO6dEaguo+CVZerX5Nna9s78M2YjO0W0QdRdtSv02i0pEs+648sqNaoAZxqIB1hfGSbWTkzY+v0bEbRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH0PR11MB7494.namprd11.prod.outlook.com (2603:10b6:510:283::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 19:15:21 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 19:15:21 +0000
Date: Tue, 27 May 2025 21:15:14 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 06/11] tests/xe_copy_basic: replace size to rect
 which keeps objects geometry
Message-ID: <aDYPMzy72-iLS9a6@fdugast-desk>
References: <20250523080126.75295-1-zbigniew.kempczynski@intel.com>
 <20250523080126.75295-7-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523080126.75295-7-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU7P191CA0028.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::19) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH0PR11MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: b45d3e60-5ab6-48b6-962f-08dd9d52d2de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHRINS9yRlhQUUM1WVEvdXMzSnBPQ0k2ZEh3cy9QL3BrQlQzeTg0ZTVoNGFm?=
 =?utf-8?B?UFp4NW1tdVVvYk9YczZMaDRhY0lxTnpMZUMwQURpU0s1TUVkd25ybklBdWEy?=
 =?utf-8?B?ZGN0OHhMQkYzTTlKMWIrQm5MbTNLejhjQ0VNcTJiUzdmVHh3dlVmR1BZMWNK?=
 =?utf-8?B?c2xobjhZd3pNOE1XRzNiQUhCSzlWUmQ0LytzNkJscHgzbDZvUVVBYWRkdU1h?=
 =?utf-8?B?VU9hR3VrU2dJeG1wQWhvVTJPZkpmNUhiQkdFcDg0SFFyV0NYNC90OGlLWEZa?=
 =?utf-8?B?N25zN3VLZkIzN1NtOTRRclVhbTRock1USkJCQ2FLZWd1UldiakhDR2x2THd0?=
 =?utf-8?B?c2J0TzVoeGh4QmFXK09kOEdoalRKOVFIcTJ4OUhJVjdNMlpqZXdqR2RqakI2?=
 =?utf-8?B?N1BDTnBqUk1tb0YvL0kvWWRJa2NDc1E5VVUrWGxTdzVsOTlPS09SbDZTbW1X?=
 =?utf-8?B?NVF5cTU5VStyRCsxdGZGT3FiNDdvVy9OMSszNTBTVlFuR0VWdGNaVUZRenh6?=
 =?utf-8?B?MWR1WUMrOVNuWmJXRng1ZHg4MkRuOG1KNzRXMGNjWUIwbEQ2UEdDbHBVazZ2?=
 =?utf-8?B?NVFDUEs2NEc5SlhlNXpJN0x2RENqd3o3akdXZjFIOWF4c0pUS1NQdzB1SkdV?=
 =?utf-8?B?eCtrdVZ0bDRIZEh1ZlhWSHVOV2hiSTVuanhaUFp5eXcycDUwNDZGU2pVcUVO?=
 =?utf-8?B?ZFluRUV1dFVCWnRFL3dRd0syTlBXQ2Y2SURFRWpraldlUjNJRk1FTGh5SWZK?=
 =?utf-8?B?blJXT2gxMERPaXd3dnlJZXZxbjFBZjJPWE1HSDgyVUdQNThSaXc4aEt0VHh3?=
 =?utf-8?B?bm5jUmZqblRtd1I1TnRjamtnSE1seWk2OW42dU9BNUt1Tlg2ODNyaWNxaGR3?=
 =?utf-8?B?Yks0RmJLaWFCSHBjai9xS21SWWZHZXhiNklheDRxMG9qUnJ5WENWSEFDYkpv?=
 =?utf-8?B?aExCUzk0R2UwQyswNVFiS1lBTkMvNHZNZnVTblVKVFROaUNNUFlUMDhiaWRI?=
 =?utf-8?B?T1gzcWFUYllITCtnTnVyenpkUWtaY3B0dGpzb20wZUhWeTk4Y1Vwc0p6NmNU?=
 =?utf-8?B?WnM1bGxneVhoZDNGS3lGbVBnSzlIT2ljTTR4UktVdk90WlhVeUxzcUNkRzIw?=
 =?utf-8?B?K0hIdExWZDVabU1sVlg0SzZwZ3czSWdjUlg1WW5SZmJUd1JhVloxZEJkamRz?=
 =?utf-8?B?bVRzTloyTytmNHZkOHJGalJ5Q1RiWlNRUEFFUzRkVnJvVjVrT1FOL3M3U3Ri?=
 =?utf-8?B?M21zRXpFbkxsQUZNbWhxTkhrSVBHR0lHL2NOaWNJeVJUaFUzejRnSWFlL0cx?=
 =?utf-8?B?QTQrV1A4Zm5rTVRZemQ0anBWNmlQMkkzWjNiU1VJNnB6SG5hSFkwMlVJbEY2?=
 =?utf-8?B?c1ZQM2F3WnpQVjlKWXV4TUJaTVZKWEd1STFzcnByTkhNWGd1Zmwyd2JXeG9p?=
 =?utf-8?B?MWEzaUpYZnlyTWVDMHZrdXgxbG9ub3B3M0Q5QlQxNldnTEZncEhobTMxUVVP?=
 =?utf-8?B?bFN0eWhzMHE4bXI4UFNmeFZneWNNbEZldG05YktjVGVxVVNORWNYdEhzRk0v?=
 =?utf-8?B?OVpFcDJ3UDNFd3JJd0hNaktzekpUaTRBZHJwNE9GeHJrUVJNR0lnbE80WG8v?=
 =?utf-8?B?L1VxK1JkaGFGUnE1b1FheEpuODN1L1dSL2l2UzE2R00zaEJmUGpTZDNnMEpC?=
 =?utf-8?B?Q1EzYTJkeWIyeDhVTFhVbWhXUGJuejBicGFjVHIvemxsVVpYOFExdGh5YXpE?=
 =?utf-8?B?K2E4a3Zzd3ZxQk1ia0hkQytMaG1Sb25pbzVydVU5RXNhY0VaWlRwQ29VcHJy?=
 =?utf-8?B?T2ZsQ1lBbTZyOXFhNlhhbWpnaFo0MGF3Z2JJUUhEM203YXlSUU9VTTRUbXR5?=
 =?utf-8?B?ZDA0cmQ1Mm8ybC9qQm9UQlc5YldlK2tGOVJHTzc1VWwzOGZXVVVNQ01HZTcx?=
 =?utf-8?Q?KmHmhACOCyo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGJRYjkwR01EdGlkN3NGRFljeko5Yjh0OTFwa1Q5dWRWRDFKQnBJS0FUcko1?=
 =?utf-8?B?Q0Z4QmFIdDNESU50RTBOWndVWlpNUTRtNm81WnNsWE91UzhLKzlpWHpsZHFu?=
 =?utf-8?B?ZExwSWxxL2dFRk9tNWN2MXhXeEFTTVN2K2xiVExTRStUWFpUdEtVVUhVR1M2?=
 =?utf-8?B?VDlzTE0zQW9obmxzWDN1WHg3UFZ3SDlGUVZYUjgzTzNiQ2NvK1VwSS83TGJm?=
 =?utf-8?B?aFR5a2tOdUtxN3AvVkU1ZzNCcFR6b0NzWXBOZHFTZUR1YnF6WjFoU0FLb0tK?=
 =?utf-8?B?SFdmZVpRVDQrU2EvQmprUExvTUhWM2o3NW9WSHFmeUhKYnJ3Y05IV0p5S3Zm?=
 =?utf-8?B?aHBmMlVubiswNXZzZ29IVGVqdDRRTUY5UTZvQ3RSUDRmNDcxWmttWU1JaEhT?=
 =?utf-8?B?cjJTYjJuUGRZc0dabHpuVG01TUNBTThwVWY5ZjBicW9hTnBpemh3eUV1dEd4?=
 =?utf-8?B?WWFVblZpc0ZpWXd5ZUhnWmMra3pXZU1Ca1VpbzNPcTVaMXlnRTduSy8zU3Z0?=
 =?utf-8?B?Q1V1UVN6OFJKR1NEYjdzWU5FQURDVndZTjZFbE9lUzQreFdPUGx5M0t0dFht?=
 =?utf-8?B?L0hEWk9pWnFHNlQ1dFY0cWd5VjBJR0trQlFtL3l5WTlWTHFLSU1sdzV3SVNh?=
 =?utf-8?B?VTNmbmNYbWIwWVM4U0pvclVlTXorSmQwT3Q5NUhheHFHcXlFUUQvMUl2dDVJ?=
 =?utf-8?B?cE9Mb21SNVl1ZzR6czJJMDIzMVE5UkgrNEJBVm0zeWtyTEpKazRVMEJyVFM0?=
 =?utf-8?B?ajVoWjIxSkNWNlRuY2k1S01TdGRUZC9GQ0RDMjl4TElBdlBxdU8yb1dETVdQ?=
 =?utf-8?B?VDdEZTZ4WndhUmtiMlUzUU9LQk81L3c0Y3VDQjZXWDRhckFCZTIxNEMvNzNR?=
 =?utf-8?B?MGlIY3VnUEpwSFhJZTNEUy90TkdkK0YrdGRRUVozL3IzaFF5aXM2VWZQL0M3?=
 =?utf-8?B?c2dMYXZXM29qNGF4ZmF3d2FaOUo5UHB0TWNlNjBCY010d0o0dDJyVEM3UHJa?=
 =?utf-8?B?Yit2QWlBcld0Q2pEUXZMTG45UHJxM0J1VFpXb0RodzNObG5CcXlFdlpWbEFa?=
 =?utf-8?B?K1FKWHZTOCtlelNMdU11dGRjZnFJWG9FTmh6bHpXY0NpUUNJNmhId1YvR0x6?=
 =?utf-8?B?M1p1eHhpUElLcStVRGtiT2QvQjEwVGR5aUkvN0l3TVdDanhVWlpZTjdLaW1a?=
 =?utf-8?B?ZkRrbEQyblRqQWI1clpiVnJsNDB3Z2lPaW9NcHlBNUxzMGNxc290NFpiODhU?=
 =?utf-8?B?dFA3cjVmdXBUL2VpamF5QVNscFMzR3lHZ0JPc05SSDhjTU1jTlFVYmJ0NGhR?=
 =?utf-8?B?VXJaaGNvTU9oQUVkU2wycGpkSSs5R2JPQ05UbVlTZlVGOGxDaFZUK01WR0FT?=
 =?utf-8?B?MThiVHZqRklMeC9PTFY2ekdXTGp0aUdNVkthK2dMUzEzYjk3NEpyc2VIZFFw?=
 =?utf-8?B?Q0ZGdkE3a0JTdjRVMnh6M3ZaM0xpcCt6UXBxUGJyUWRQUHJRYWJQQmx3RGlC?=
 =?utf-8?B?akI0L2E1aDRNR2gvVGw1Lzd6V0pHTHFqQVJOOTcrMkVjLzduUGpSNnBHZFRn?=
 =?utf-8?B?RS9GTWw1QXV4NTc4MjB6aERxdjJWeTkxb3BwckpDYTlwNDhPYzBWV1JIb2Fh?=
 =?utf-8?B?ZFFRbU1kNUdsTkh4MXZqaW96Z2ZIcThoQ0hhU241SE5KQy8xeUxJdEJIOVg4?=
 =?utf-8?B?VmJURDFmRUJuUHlkZ1E2UGlIb0I1ZGlqZzlhUjVFTkFNa2s4ektVb0ZjNm9h?=
 =?utf-8?B?ZENmTjhBdnBNeHFhajFpdzNPNDFjUG96MHZxcTV6NEV1REJaTXZQeE80amtk?=
 =?utf-8?B?N3dySmZhek93Y28wUUFZbFgrKzRoekl5VCtnWG1mTmVnNHhUZVBvOE8zSmtl?=
 =?utf-8?B?YmRWc2RnL0dnTldJZmhIQVZPemMvWkRTZmtUR1hqR01Gdy8rNHlwUG1lbHRD?=
 =?utf-8?B?bWJpT1A5MHJNRVJmQzBCaC9aRVlOeUlTcmozQnRlSmk1a0VjZlRXYWtpaExj?=
 =?utf-8?B?aWtmUS9GU3g0ZEpoY0ZlR1NjYU8rNyttakhBUWc1YUU5enJXK1R6bVFCbnNX?=
 =?utf-8?B?Si9LUDFTVnJySFAwZDBWbzg2QWYwTG5MM3Zvd21zTlRCTGROK0UrczZtenlt?=
 =?utf-8?B?WmhZbkszcXJjRzZjbWlxcHVKMEZIUkx0K1VKSU1nRGlZNk1XSnNINHlENnVi?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b45d3e60-5ab6-48b6-962f-08dd9d52d2de
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 19:15:20.9257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IPYkSqc/ED3FDzSXosKRWw+oLA5KN/Q+RdyrIdL+ifNpQk5Le6wN/9j4CyeZ7yq/7uSrjXRKlQZQv4Xh4550/Deh4T/mtvNuJ81AgAZfphE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7494
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

On Fri, May 23, 2025 at 10:01:21AM +0200, Zbigniew Kempczyński wrote:
> Testing byte/page + linear/matrix mem-copy requires passing different
> pitch/width/height so replace simple size to geometry.
> 
> Change mem-copy and mem-set to use rect instead of size for
> copying bytes.
> 
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/intel/xe_copy_basic.c | 44 +++++++++++++++++++++++--------------
>  1 file changed, 28 insertions(+), 16 deletions(-)
> 
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> index f252d29fd4..569f250cc4 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -19,6 +19,13 @@
>  
>  #define MEM_FILL 0x8b
>  
> +struct rect {
> +	uint32_t pitch;
> +	uint32_t width;
> +	uint32_t height;
> +	enum blt_memop_mode mode;
> +};
> +
>  /**
>   * TEST: Test to validate copy commands on xe
>   * Category: Core
> @@ -42,7 +49,9 @@
>   */
>  static void
>  mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
> -	 uint32_t size, uint32_t width, uint32_t height, uint32_t region)
> +	 enum blt_memop_type type, enum blt_memop_mode mode,
> +	 uint32_t size, uint32_t pitch,
> +	 uint32_t width, uint32_t height, uint32_t region)

What is the point of adding those arguments here if they are not used
in mem_copy()? Should this be part of patch #8?

>  {
>  	struct blt_mem_copy_data mem = {};
>  	uint64_t bb_size = xe_bb_size(fd, SZ_4K);
> @@ -125,13 +134,15 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
>  	munmap(mem.dst.ptr, size);
>  }
>  
> -static void copy_test(int fd, uint32_t size, enum blt_cmd_type cmd, uint32_t region)
> +static void copy_test(int fd, struct rect *rect, enum blt_cmd_type cmd, uint32_t region)
>  {
>  	struct drm_xe_engine_class_instance inst = {
>  		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
>  	};
> -	uint32_t src_handle, dst_handle, vm, exec_queue, src_size, dst_size;
> -	uint32_t bo_size = ALIGN(size, xe_get_default_alignment(fd));
> +	uint32_t src_handle, dst_handle, vm, exec_queue;
> +	uint32_t pitch = rect->pitch ?: rect->width;
> +	uint32_t blocksize = rect->mode == MODE_PAGE ? pitch << 8 : pitch;
> +	uint32_t bo_size = ALIGN(blocksize * rect->height, xe_get_default_alignment(fd));
>  	intel_ctx_t *ctx;
>  
>  	src_handle = xe_bo_create(fd, 0, bo_size, region, 0);
> @@ -140,13 +151,11 @@ static void copy_test(int fd, uint32_t size, enum blt_cmd_type cmd, uint32_t reg
>  	exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
>  	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
>  
> -	src_size = bo_size;
> -	dst_size = bo_size;
> -
>  	if (cmd == MEM_COPY)
> -		mem_copy(fd, src_handle, dst_handle, ctx, src_size, size, 1, region);
> +		mem_copy(fd, src_handle, dst_handle, ctx, TYPE_LINEAR, rect->mode,
> +			 bo_size, pitch, rect->width, rect->height, region);
>  	else if (cmd == MEM_SET)
> -		mem_set(fd, dst_handle, ctx, dst_size, size, 1, MEM_FILL, region);
> +		mem_set(fd, dst_handle, ctx, bo_size, rect->width, 1, MEM_FILL, region);
>  
>  	gem_close(fd, src_handle);
>  	gem_close(fd, dst_handle);
> @@ -160,7 +169,10 @@ igt_main
>  	int fd;
>  	struct igt_collection *set, *regions;
>  	uint32_t region;
> -	uint64_t size[] = {0xFD, 0x369, 0x3FFF, 0xFFFE};
> +	struct rect linear[] = { { 0, 0xfd, 1 },
> +				 { 0, 0x369, 1 },
> +				 { 0, 0x3fff, 1 },
> +				 { 0, 0xfffe, 1 } };
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
> @@ -170,22 +182,22 @@ igt_main
>  					       DRM_XE_MEM_REGION_CLASS_VRAM);
>  	}
>  
> -	for (int i = 0; i < ARRAY_SIZE(size); i++) {
> -		igt_subtest_f("mem-copy-linear-0x%"PRIx64"", size[i]) {
> +	for (int i = 0; i < ARRAY_SIZE(linear); i++) {
> +		igt_subtest_f("mem-copy-linear-0x%x", linear[i].width) {
>  			igt_require(blt_has_mem_copy(fd));
>  			for_each_variation_r(regions, 1, set) {
>  				region = igt_collection_get_value(regions, 0);
> -				copy_test(fd, size[i], MEM_COPY, region);
> +				copy_test(fd, &linear[i], MEM_COPY, region);
>  			}
>  		}
>  	}
>  
> -	for (int i = 0; i < ARRAY_SIZE(size); i++) {
> -		igt_subtest_f("mem-set-linear-0x%"PRIx64"", size[i]) {
> +	for (int i = 0; i < ARRAY_SIZE(linear); i++) {
> +		igt_subtest_f("mem-set-linear-0x%x", linear[i].width) {
>  			igt_require(blt_has_mem_set(fd));
>  			for_each_variation_r(regions, 1, set) {
>  				region = igt_collection_get_value(regions, 0);
> -				copy_test(fd, size[i], MEM_SET, region);
> +				copy_test(fd, &linear[i], MEM_SET, region);
>  			}
>  		}
>  	}
> -- 
> 2.43.0
> 
