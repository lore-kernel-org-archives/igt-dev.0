Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13984C77B7F
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 09:33:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0E510E567;
	Tue, 24 Jun 2025 09:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eUwx58nQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F8F10E567
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 09:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750757629; x=1782293629;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V4Y6oviFRkUL9/MfzrGR0Q7K7tjstswmWWJSV0/LAyc=;
 b=eUwx58nQnbr2Sls5h0gDr/SbEFnAWllVTfo71+JeC4qzYjUlzJrmBRrZ
 gvu/6savN6zQ/Nc8YWnCL8zTvvosiGBwpcapeqsWcQuFDPakSY55boC4m
 RzvZogPCso3Wn1jUvBjW0Wo7bqCjxHs5jpi4axCXMJoEHTHxsDIZRA1L8
 2BIfMQGrJh0n4f5xsAggCd8Xf7NZ15HsTAgCFqujqeZxFRF8ZWrAj1h7j
 MErUdaZGvTljsOvWGpLpS5vtUfo/Dg54Bt9oT6tGgfbf6qtnIN5Ef/0OG
 GZ9guFKDw8xatAAcnuAThXl5GFzAfahxHLni6oK2w9YkGMhCV8FXaf92c w==;
X-CSE-ConnectionGUID: heif9IbqSXCfHBRePxNx1w==
X-CSE-MsgGUID: bSmWaudURnGzUpltVKPJMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52219043"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="52219043"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:33:49 -0700
X-CSE-ConnectionGUID: Mx3BNrwCSq6IvBPauRr91w==
X-CSE-MsgGUID: YI0OI5nGTHi+0yALgqYZWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="189060913"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:33:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 02:33:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 02:33:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.60)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 02:33:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMrFIeD04kkyESSbVsg5ajtszh4mD1BlhwyTnAQ8s1fToueaEtDvbEjLa/RpXzg83JWYFTgy0NUbs11L6Zkuet7faV+uWdW5MoqXtLVLqejdG4xRWL2NKkW8gTrP2wvBikgCA5mA87OlCrYsZEplujE/Nd/G+PnFbJfSIvsxmNfhmoXFS82DfUG/VSyTvrahi5wwbLgRai1mAXfKAQ51IfNphPTnMal8u8O4FAuDJsqcgU55EDxC37mw6qkoalf/hpReGf6MEYPay4Y/QntUfznQlWL9wfrkt36Prgq2qw9lhMMaWmagiVyZtGG1NyH7QMN/ZH0TgjsMtgNx6PR3kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgZQ3xuqnOVpLCfBnFHQ7b7M6WckN08AdHji0gbahTA=;
 b=T2KPTddSb91YAk+k1ElMzIG7DY7+A/RaOnC5iDEKUoAXwqUJbmpp03mAKYUD3dkv5+Z4Y/dV3O7pNeBpUfHuXjKzQcILt3D1AFDcW3WOjQestDBhmvQnRq3oWpnmyobwGASj4RZSjVTeGb8+2iwtCV5wDloDftZDb1yRXLa2UUBKclpzNqJAa0AVzSs1SAirCAsers9ixJ6OzDYp7uG4sxYxr2pyMPWj/+nIigCGYNtk+jt83pEJyTjXhszo6Vp2Zl+rGJOqhnUDGX2iUsGUgBOtG4ZiO6W/uCTTotL59plXbtHrMne/JVnHK48c807wO3/6Vhkwa4s/Q1cL64Lg4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 PH3PPF5F1DBD8A7.namprd11.prod.outlook.com (2603:10b6:518:1::d26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Tue, 24 Jun
 2025 09:33:32 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 09:33:32 +0000
Message-ID: <6698e7d0-b05a-4f28-be46-9f1a136c0e0d@intel.com>
Date: Tue, 24 Jun 2025 15:03:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/4] tests/kms_async_flips: Modify subtest
 runtime for suspend resume subtest
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <arun.r.murthy@intel.com>, <jeevan.b@intel.com>
References: <20250624092421.785063-1-karthik.b.s@intel.com>
 <20250624092421.785063-2-karthik.b.s@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250624092421.785063-2-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::20) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|PH3PPF5F1DBD8A7:EE_
X-MS-Office365-Filtering-Correlation-Id: cf79ac4c-8751-4a7d-ba7a-08ddb3022f0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REZPNjFKRFpvUkxOM3A4dzl1cm92WTRUM2V1V2NZODVBenRCYXc0S1g4S0ha?=
 =?utf-8?B?T2JKdGZGQXQ3VWMyTmVGMUE5OU5FZkd4SHYwbWRhOEh6dERETzQ5Mm1lNjFs?=
 =?utf-8?B?T2J1TUg0VDdKcS9ZbWNHRTlQMW0vdXVDei9GbDh0V1U2VUJrWGtubEUvL2Z1?=
 =?utf-8?B?Wk0vMUkrQXNZYmF4TFloU28zUVBnRXdJY1lpZ2RqRTFHTmozTUNsMWtFb3Mv?=
 =?utf-8?B?Z2JtaWQ4UWszTHVKUEZXT3BLWFdydDd0RjQwYXYxYTVFK3ljOWg3bUZGbVBa?=
 =?utf-8?B?akhkMG4va01PaFZGcURaZ3E0YjU4ckRNSFdlYnEwZG5WSXd2ZktzVmtBMlNR?=
 =?utf-8?B?N0hQeHRzenUwZi9FM0FkOUdaYWtHM054Y3dZM3c0YmFyczNiaWtUY3pQU3NW?=
 =?utf-8?B?eExLVGdWWTN3QVNWVlczUDlWZGlVbHRiWjlnbEJ0Ry9rcEtaeUcvTDVqZmNK?=
 =?utf-8?B?aE5Ha1hiU0FjZGJYVDNxbFdkeUlYbWk2QkEvSy9sMjBZZWVhRkRUUGtlKy94?=
 =?utf-8?B?bWFWNlZMaDhtOTlRTnhRSmJia3lzSXJpSHJaTllVOUNMZzFSeFNoUDFONWVv?=
 =?utf-8?B?dzVWanE2N1UvQWJtakpJVGxYQ1hnOE5TOUE0MDQ1MDVhUVNmUHBMOG02Qnoz?=
 =?utf-8?B?QTB1UHZGU0hDajJ6QWo0dkVDcExuSzcwL3ZoeVgzaExYSUNqRWZqbGFINllF?=
 =?utf-8?B?QjMzWnVRa210RHZ5ZEZva1lIK0xKbERXeWJnK21Vbk81b2MyanZMZ0Q2Y1dv?=
 =?utf-8?B?amcrMVNXRkNINFdLY3h2OWZicFc0amRMZVR1eUpFR2p4dlEvS0U0bDhMTDBW?=
 =?utf-8?B?RWlhTDcyNmZxUEhxZVhPc09Qb1BObU5ibEt2Tng0bGh6bnJiMEQvYWhlaXU0?=
 =?utf-8?B?T1o3V0MwNmZKNXdkYTI0V2VsUHpDNTRuNXRhbzFPZEtCa0JTdDYvbmFVeExW?=
 =?utf-8?B?c1ZBdEhmcDNtUXZXMXFvSFZwY3IyNWcxaUd3Uit6TENNSzROZHVVR3o2dC9D?=
 =?utf-8?B?WnFtbjhXVCs0Y05td3NXUmE5R2F0dTI4S3dWMFp2VFMzTHlxT2ZVZUdMRExI?=
 =?utf-8?B?RnRZQ0tzNDBmWCsvM01vZ0F6MnFqOEpleFN1RStZMC8yWmR3MmRDaExJN0lI?=
 =?utf-8?B?dWpWb2dxcTNOdk5VcVdJZUpOb3JWMUpaNG90eVA0R0cxaUU3WTM5SzdZNlp5?=
 =?utf-8?B?ZnczK2R1L2JFM2RsYmlkOVdMa2R4U1NxdXFGMmJvaGlvRC8rY0hZbzI5MU5L?=
 =?utf-8?B?dnNjSmlGTmx5TTFyQ09zM2N3dkpuVlBBVUlZQnpTK0xmWDV3Tm4yUDZZVUIx?=
 =?utf-8?B?R1dRVDArdFBwYkEwWmFHNHQyWW5yK2EvY2c5QmZSRUxGdmYwUksxa0t5RUkw?=
 =?utf-8?B?SitGUlNpQ3FaMTFwR3crdm1BWC9zTDY1azV6Zm05Ty84RVVmZUdMa3h3OXlZ?=
 =?utf-8?B?c2J1cUxMYjQvczNXZXFXMHZNbk11V0VhdnV2NXZjR29wZXYwNXFGeGdXWFBi?=
 =?utf-8?B?NG84azEzUU9iTjR3dVVUak05RHRoZGJabS9RcWhTOXp5eWRtSjg4SWtUYmlE?=
 =?utf-8?B?b1h4VUZuTnhxcEQ4M203TkhndjVFME5lcmVDWTE1d2ZXQXZKZDd0d1lzYmhr?=
 =?utf-8?B?bWlpdU11enoxVmlpOEJ3Mm93enNKYmV1UGR3MDdNaXEvR1daQXAzLzdMRUtI?=
 =?utf-8?B?VlRqQ1VXUHRTejhXRllmR0QyejhKS2R4c0doREx6NTNSYUFIM1UwWFIrQ2NH?=
 =?utf-8?B?bEFqRmU1ZW93aUFSQjZRckpiVW90bWhqSDV4T2prRVFHK2tNNUNsZ0dlUjJB?=
 =?utf-8?B?YVdCeW5hdFlJNEcrNzJpS3BiT1lSOVdNWWlvcDZIdEdmMjNCWkdRaXdSVE4v?=
 =?utf-8?B?S0UyV1JranByN1pyNmI3cDJCSnF5djFjeGkwWlpzc3VoYlBtdlFkYmhFaDNP?=
 =?utf-8?Q?HjlpbS5Acu8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmcxU0ZiT0lkQ2pEQmxtV2RFdTNaUHZ2QzgxbGNsc0hCL3lrd3lYbEdxa1g2?=
 =?utf-8?B?dHdIaWYrSy9VczVIZzluQ0l6MUdVZzR6c2VtS0pMdnk5VHNGNzZqY1cyMlNR?=
 =?utf-8?B?OU9mZ2F0UDhLMGhFVkxBYnhsY3RRdERNTXlkYkF5MW02TXArK3FvTTB3Zk5D?=
 =?utf-8?B?K1lCYkR2OTZ2V0hDQ0xQL2VVa2k0dWthQjhkN1JGdE1yT1VwK2wvNWh3RU1m?=
 =?utf-8?B?aWhncE9nRUtqQTlWNXI2WE9PR0Y3Sm5jZW1kVUhURWRKcWJ1OVZmWEJwQkww?=
 =?utf-8?B?UXprSW43eVJhMDduL0Y0dnRBbE9Nd3FQZDZoV05XN0FYV2xmbWdjaGsxeVV2?=
 =?utf-8?B?OUorZEhpa1VMTEtJVitVR3FtcXhtaWtEbW1yMDRTbEZERmZTVmNuVzkvbERm?=
 =?utf-8?B?UndWSFdZQWg0Yks2NHRoM0lnRHliZkRscjVySVZ1cFdjcVp4NDlGQi8xcjBk?=
 =?utf-8?B?RUcxaHhRdE4rS2NySkNQS2JENjYrR1I3QXd1V0xBcHJMSEQ0WXdsdGw1dVBQ?=
 =?utf-8?B?bGZ3S2RoNXArODIxVkpTVGdRZ3QvL3NFNk8zRTgxSUV4L0VvK2ROYWRkUWZy?=
 =?utf-8?B?d1VzaDRrR0FvNmVRcWliUDQ5TURMd3lOUUNEUFhnWVk0ajFBNlBPM1FnRXVJ?=
 =?utf-8?B?UldtbXkxK1RzWUd5L2pqdHZ2MHFMckNhaE4rc3Q0N2c5ZW45MTFQYzQ5RzUx?=
 =?utf-8?B?Z0hLbnRvSGtwbEU5Uy9iTWtkK0lIR3R3b3o2aDNPSmVqaTljOExxeEY0RTJB?=
 =?utf-8?B?ZnZ4aUNvbGRwRStFVUNtb2xUZUZLMTRwR1RVQ3Nvbmk5VUpVYUZBRzVMWmxO?=
 =?utf-8?B?ZHlrc3hScXdZdzllZm55c3hnc3FyVVB2R3UveTIzeitKVDhuc1ZTNm5WcWdj?=
 =?utf-8?B?QkltWlRYclJXTVI5YTI3dkk2M25Nd2RxU3VBT3czVnhyZ2Z4OEFkdUUzbmJw?=
 =?utf-8?B?ZGdhRk0wd1R6dlNxdnAwc3dFVFhHNlI3dkRYVW9kVWUrL0NVRzUxVmtKckdu?=
 =?utf-8?B?Q2FkK1JNekxUSGxDOXczKzY5K29xQWRpZFI2OW9YOW4rZTlSRmV5d2NFdTJZ?=
 =?utf-8?B?SndVcHNDQU9tdTFHMjIzOE1vdllyQUxFNzI4SHdpREl5RjdkK1pONVIwYzhz?=
 =?utf-8?B?SVAwRlgrNUx6N2JTTVdqRysxdFVwTGk3OE1UbWNWSFhYNXYrUGdGTitDTkFF?=
 =?utf-8?B?d1MvbWUySWhYb3lCTTkyVVp6ZDR1RzBaUi9KLzdmVVJ5REZwRnNOWFIyb1pH?=
 =?utf-8?B?MjBvMGVsSS9hQ2tVc0pPME5hRTFDZnBvRDdJQjBIODVhUEZmU2pRWm5VdGNH?=
 =?utf-8?B?bUJuSnlBM0ZYRkVBSlZCditycmJkb0plTG51ZUJENEp3RXd3dHVjc2pVRmVt?=
 =?utf-8?B?VDh5dXgvL2VuemZtYm9vNFJYRDEvYVhpTFhVaGhtSW40SmdRVTNieDlvejJP?=
 =?utf-8?B?R2FBME5KL0FldjBVUXNKaDFaRCtpSGhZbnRzczVBbE5DM1UrQVJ4L1pCUHBO?=
 =?utf-8?B?aGViRzdRSmJ0RVcvUzFGV1FXeFh2YXNiZUcvckV4MGhRMUhBd2RacGU4NUkz?=
 =?utf-8?B?WUtPWktuZEU1RGxCNURSRDQzcVhxZGlJRitSWHZVVXBTSUw4ZWM2Q1RZZjRz?=
 =?utf-8?B?UG1VeElFd1QvREFnTE9VUTN2U2dMVmJpajlRdHpsNmZQTTI1UTJPd0FFRlJP?=
 =?utf-8?B?ZlRJMW1RREJ5cmlRODYybFJ4UzMrZm1QSjZuVWhBcCtYRXpuaXFFMUltUTR1?=
 =?utf-8?B?bFRzcUZBUXdhME9TZmJSams3Q1pyQjRrS1RZbmRIWGw5NHJqTDliVTNGcjJi?=
 =?utf-8?B?bzRQdjNzQUw4YlZmUm1UMXZSdXI1RkJ4QnE0S2lYQkcyR01oRHJvWGJQOWY5?=
 =?utf-8?B?OFJiUUw0aUpzMGNHN3Y4Q1Q2WmZWWnROaCtoUzFkeGpJQlM2VHlKMzBaYWRI?=
 =?utf-8?B?ZzBMMWRNb0JaU2tpRjl4aW9YZS96UUx4Tmdqb3ZkMmQrcDh4dmxHdXEweGMx?=
 =?utf-8?B?TXo2aDcwQk1RN0phbWxBcmovdVFsV1Y1Z3A3M0pHVkRxNDBsVGRHUGluNHFP?=
 =?utf-8?B?NEljdnpXL0VnWVNxY21FajlzNDJnc0VvVGpwQXQzbHg2eTRyTk1IdUJ5UXFk?=
 =?utf-8?B?VFJoNm9DSjc4dG9GUElUT3NwSFFxYnlQM25NWXF5ZDZoU3UrMjNjK205aGRM?=
 =?utf-8?Q?Q6Q2t7q3Wo2rjQXxoVVice0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf79ac4c-8751-4a7d-ba7a-08ddb3022f0e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 09:33:32.0585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Gw04ZNt3IhydBeUmlQUDg7CJuERqAyEL//CKivAS96l51YfPRXyNKRHKkasNcYbLZ2x6CGSKRTxQMxLZbzRQk06XFNDXZmGqmJSRC1n7TRGKi+puaKl4mI4tEipNP9G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5F1DBD8A7
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

Hi Karthik,

On 24-06-2025 14:54, Karthik B S wrote:
> After a suspend cycle, the next flip will be treated as a sync flip and
> will consume the full vblank time. To account for this remove this from
> the runtime in FPS calculations.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>

LGTM,

Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_async_flips.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 0f2d932e4..677da5aba 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -377,6 +377,7 @@ static void test_async_flip(data_t *data)
>   	long long int fps;
>   	struct timeval start, end, diff;
>   	int suspend_time = RUN_TIME / 2;
> +	float run_time;
>   	bool temp = data->suspend_resume;
>   
>   	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> @@ -440,8 +441,13 @@ static void test_async_flip(data_t *data)
>   		frame++;
>   	} while (diff.tv_sec < RUN_TIME);
>   
> +	if (data->suspend_resume)
> +		run_time = RUN_TIME - (1.0 / data->refresh_rate);
> +	else
> +		run_time = RUN_TIME;
> +
>   	if (!data->alternate_sync_async) {
> -		fps = frame * 1000 / RUN_TIME;
> +		fps = frame * 1000 / run_time;
>   		igt_assert_f((fps / 1000) > (data->refresh_rate * MIN_FLIPS_PER_FRAME),
>   			     "FPS should be significantly higher than the refresh rate\n");
>   	}

