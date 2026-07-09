Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1184C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 20:37:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90BEE10F691;
	Thu,  9 Jul 2026 20:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OySKKV0U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D2E10F691
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 20:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783629438; x=1815165438;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OeoCt7ujmBTkU+PU6XSDnnN1o7hA3C/JMWemjW+6lxc=;
 b=OySKKV0URbb1tu/VVfXL18hDUOTHi7HhiMDgHNTdDgf88qB4/fdVsOQa
 8p6yHanHPw+hD/wzKjoySbY8t5gnhoBkyzSUd4oDW8J952yuvrpGSmnAP
 mWqkL7BiYwNAjLte/zMFUhSB40UOS48Syze+cqNnBED3vy29iCw0oQjk4
 wVr3C8yDR6er2fJp6++ah6Xih2Q/b6rvOqwlVwV61qUwtY3h6RB7U4gJW
 /M7T3L3i2CXXjwq1vdQWaC6+P36H3pLh59yhnOdsTwYTLEt7Y66ppQBSt
 JdGNqfRoqet3AMyQxKWn8ATtSZ8lELfgshIGuSPEnPPhH7Nt6OiYOt6LQ Q==;
X-CSE-ConnectionGUID: 4BxuVIVoRjemIA/1TqJavg==
X-CSE-MsgGUID: yKDiNnfcSyS9B+8xXAe3ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84429140"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84429140"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 13:37:18 -0700
X-CSE-ConnectionGUID: ewqb8qamREqRcHtVgfqgrQ==
X-CSE-MsgGUID: sLMXGOGZSOqXgG1tbhpztw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="250274159"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 13:37:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 13:37:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 13:37:17 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.20) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 13:37:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERAsvhLSDJcNQ+MbvY5bvTKnZ6bWeh5BwQqeVKyPrqRojoaeW1dlk7Acm/b1MGHsXeOCMQDkmy9vJErnjqPO1SU/APf9fubyCjTJ2zfjLqdbADbP0LSzfpBS3UYcMODlHaaESK12LsMHuHMQsK+Tp3CysMAz1TRuUuvFDchF3e8QSJ+egU2B2sIeVs7vL8IwBWl6+aiwDjWzM6uoBVc0hrmCSjKW4EsM+7WWep6oWT9UQMD61U2N6qKGjhrVI3v9FHlRiOa1Hu8cYBF8x8SjjXOgOnqJ6j4UibYrdRoa8eSqsEUm8kOI9NiJvZL7rYAGqDHeEy+4HF+oIpIPrq8LnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N360hMV2gWkCmQAaOQES4yOXQJObQFOBZtpXISdT9uM=;
 b=XwyRmXrWHCtdZPctULqc6Ku5pzd0WgWDZtk6C1k9OqRcyigf78RORjRcGMA9QGVstmDyUQvxpFBKlWaaFjVuDMXbyjonzgJyeIo88qz0S2jxi6S9ZypUhnN4HXh9auMRzVhyswM0md9E8Fb8vkhPBxh4+G/cvWg9weAu4SrH6XCRKBzXtqw47ebHBa13xzfW5tHAk36oZKn3gxX49QETcfitkZfgqjmClFvNjEeNaS9JXW43udTkSrQta5+T+g8+YJHjW9HMqJPmB7z6Er2SMHyU9EVBaKbk+9+12mR2Htf3h2QWByZDuES6LR6oJb39/eNjJ3FiU1RcVSQpVkblzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by DS4PPF691668CDD.namprd11.prod.outlook.com (2603:10b6:f:fc02::2a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 20:37:14 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0181.008; Thu, 9 Jul 2026
 20:37:14 +0000
Message-ID: <667d2cc5-a7ab-4c2c-9218-e50e01001b9c@intel.com>
Date: Fri, 10 Jul 2026 02:07:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_hdr: Skip unsupported formats in
 bpc-switch test
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "suresh.kumar.kurmi@intel.com" <suresh.kumar.kurmi@intel.com>,
 "navaremanasi@google.com" <navaremanasi@google.com>
CC: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>, "gildekel@google.com"
 <gildekel@google.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>,
 =?UTF-8?B?TGFuY2Vsb3QgV3UgKOWQs+eRi+aZnyk=?= <Lancelot.Wu@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>
References: <20260621081043.598388-1-jason-jh.lin@mediatek.com>
 <520d7fe2b1ef01d81cbb9cba7ca79e5cbd15922c.camel@mediatek.com>
 <CAMNLLoTHYoE3AiFeTaCj14ktcvuMjR0LoewUnmR+AXpoEoxpZw@mail.gmail.com>
 <bd0165e7-d245-4780-ae78-691589bc808a@intel.com>
 <e6b4e5b8b39eae29a2749d15e1d13a34b7d24b04.camel@mediatek.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <e6b4e5b8b39eae29a2749d15e1d13a34b7d24b04.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::16) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|DS4PPF691668CDD:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f3f06de-a417-49e8-4f1b-08deddf9dc00
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|23010399003|376014|18002099003|22082099003|6133799003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: nnsZZ9Kk06koDiZr57Cc0zTLWwzK861wWBdLYnyoUFOk2KNteBXkKjxAhN36jX/FYveGwQrcekr4LYTNgmVCSuhLByldA+IcKCuk7+7gRhhOBWYawDLt5s/3AySUFdUeE2jIgC6VuTyDcty0H61igHeemOjdFRUOnhU4x0MRvkU96tArHKVbAwMOuXuvoVodjx2N7LAASrITdPFL3nuwZfUnfIayuVlyLiIvPaC/r1BT5XyZDmlZVDHNWMY8xVDrnpmN83NLCQ8nxXiNKWfjx9CYU1zq6dCgxdoXt4ye9uUY2iMriu40Ss4QezPbUyv2bBOcY/qCjEx4i2+PXReFJA2KQ9RrdmLqvjnDWZuYnFIApMw2eQ2RI9pnJVfT4K0glqNCQRJqy/lqM47ohhKa0E/eSP4LB9gS4HT+rETw2cJLECX0xBiSCRdMe5tfEVfNrj0FGlIWma1XnRPRPDoLGQcRGOUUXmRgnK0mxHBzbCfHhigN2j6K4hTYy2NO+37HgUk9b0ljZVpYGmG1nywnkJQU2GUwY5+I20ZXsRSwnHceCnx6hk1Bzju4VcF7t63aIedTVP85X8/ck7oifuI6tkrvqk9L98E43XAyhULe3XHUxgusbij3TJJ6FaGfI7rX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(23010399003)(376014)(18002099003)(22082099003)(6133799003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUw0Wkg3N0VNdlhQY2szV25lazRad2pDbVBVanRsR2R2TW14UW50bkh0NzdQ?=
 =?utf-8?B?NkZxYkd2VTlqMHpQWUlsczZBbGFSVjY0NlBmWk1VVzZYTStNZG9zbGhuRC9C?=
 =?utf-8?B?azZwOUh2ckUwS2tUdzR5WGVMU3ROSFRuKzkwOUJyblJPK1NvTDBEK3EydFU0?=
 =?utf-8?B?VnFBUXJlcFBhVXVaOEs3U0J0RXZUVlZoU3JTd1IxazhJYjkwVVMrbUY1RFEy?=
 =?utf-8?B?clhGcGphRUQvVVJYbmMxblJzUmpVUkN6OGprQ25xSFhRV0I1ZUhCOHAvdWth?=
 =?utf-8?B?cW52TVJ1M1JyUnlDK1R3Zk9ja1VmamNQUUZFb0VwUGNqSVlIeTQydDYxZjhB?=
 =?utf-8?B?U3pRZDE0d2JlcmttLzVMVU9NaFRwQURMdGxxSlhZcEMrUDFRWklla3lmYU9u?=
 =?utf-8?B?T2pYckcrNkhmTkN6bmJyVDlkeEphdjBJTGZ6UnZ5V2QvUmpNdElwRENIM1pO?=
 =?utf-8?B?bExtN2Uva2xYZDFnTTZFWWdXTmxiMWxGUHYybFJuaEdPV1VtSVUweTBUQi9v?=
 =?utf-8?B?b0kyOHBGT1ZITjJXNHZFQWtYTmw4MVcyTUdrMVJocUt2N0tIdG9Ea2MzV01z?=
 =?utf-8?B?Q2hLZ2k0ZktUT1JuSTIxQzRrZzFZcUFNZlA4ek5pajBpU2Y1ZXIxOGNOa1Nu?=
 =?utf-8?B?OXZnaDJrc1U5d2lVcXhDZ0daTTlKSFBiNisxb3p5b0JmRnRuWDlzdm0yRjIr?=
 =?utf-8?B?ZGRKemp3c3lGblY5WHF0eVQ5ZDJNTU1DRmlocm4wdUU4L2I4NzF1ZkZkZ3Yv?=
 =?utf-8?B?QVo3S2xOdnMvclN0MW9SalQvb1lUMll3d29aMU9kZWdTRndKcmlXK2FVclRo?=
 =?utf-8?B?dHQ3SUdENGtLSmVvdk9zam8xaC9sOFdidll0NkFFU3pvbkNxWEtvR3dnUHpC?=
 =?utf-8?B?eTY0RFJRZk1ZMmJQN0VxL1ZUd3BCL1dMWjl5cklOM0hENTdzNmJYWnlsVEtG?=
 =?utf-8?B?NWxMNzZWNGlPcTh2VmM1QXh3M3diYkVKTjIxQnpqeE1JdW5lZkU4UWJmVnJo?=
 =?utf-8?B?Um1Cc1Vqc2owa202UW5UMk1kVkUwMmxFV3RoNkhXeFNmZEFpOEVyb3JhYWxv?=
 =?utf-8?B?aDFvcStOSC9wekNBZkF1bS84eU5abncreDRCQzh2OVFGYzdKL1NidnY3VVRJ?=
 =?utf-8?B?SkhyTWgzblRrajJPSUl3am9lVFlETU5sWmwzankwYjg5ZlJnS1BuTmoyQ0Ny?=
 =?utf-8?B?MndkWUJ0QjNEUVVFWHY3Y05OVDlOeXBQUFVSRkZFUnF1RlNMQkdpN0UycURE?=
 =?utf-8?B?Wlk3Ris1K2pYUUlEbEZVaSt5eWdlWFYyQ1pveC9DM28ycEFaNVRmdHRybXRm?=
 =?utf-8?B?MGxORnNjOVNwckNvMG1XbEFsWE1zdW1CQm5pREUvMWsxQ0R0TndmY0t3M05Z?=
 =?utf-8?B?U3piUUhFSW4xS3pjQXN3Ylk2b25MU2ZudXRBcmJvYTZWUUJyemZLMGZuVklX?=
 =?utf-8?B?aUpOSE1zVnZUbko5ekt1bmRwRFdPNGI1aCt4eFZFUmVKTk9TZVg1c3AwVVhC?=
 =?utf-8?B?c01zMHBNSEduZ1BmM2Nqb1pxMHNhUnJKTVlLN3V6UmVwTjIxRmIxaWErdk9j?=
 =?utf-8?B?ZThBSDVteEhHcndqcVZXUjFLSTNBZ0twb3hJRW9pVlc5TmJkM0Y3L0dubzJV?=
 =?utf-8?B?Qk8reStUQ0doRXJEOWtxS0Z0WU1PU1NPV0lxUEt1QzlWc0YrTXZmS3hvekhT?=
 =?utf-8?B?SXgrelpIblowTU0wWGJvTHNWVzV0SlU1TWJjUGZGM3Z3RVlrQ21CQ2NzLzNY?=
 =?utf-8?B?bDJBWnE2aFNET0xPa0lickI2S3lUQ3ZSZTRmSlF5TURubXNkZ0c0Sjk1Uy8r?=
 =?utf-8?B?cUZ3bjBqWDdjUUw4eXpOTjFFVDVYcE1wOTY4R3ppY05aM052emZsQ1pyMER2?=
 =?utf-8?B?L2hnVmRpUEhTWFloSmNEbC9LMlRFTkMrZVA5Q1hxK1RsUUwzQ1VLc1F1T1k1?=
 =?utf-8?B?UTM0YnkxRzgzTXJmdEI0cld1WkJHTjVvNXhrc3ZML3J6YytYMDFvTU9sYWpN?=
 =?utf-8?B?WlppS2JUS0orUTA2TzFmYVNjdnVXMzJlR1UwclpuUjkycGhQTzRyUEtnNHdN?=
 =?utf-8?B?SHZTWG0xaHBJbmhMM1ZhU25qWTVSU1ZWQjlVTHBoOVl1eXBsVk41aHRVSDM2?=
 =?utf-8?B?aE95OFNYUloyQUdjMVNUZjg5TFlac0M5UmRTUXh6dFZPNUpFVCt5TXlaUnZn?=
 =?utf-8?B?ejZIdmQyYmZpQlg3bUtueUx3Tnl5aVBsWThkL3M1STZySy9XWXVoVkR4eWRE?=
 =?utf-8?B?QXdYTDVJdEk4Wk9xTDRTdnIwTnV3Z2FCUDQ0a2VraitEQTl3dFFDRHd0R1RG?=
 =?utf-8?B?M3Rtd2o0MmtHSW0vaE9WRHRXWjZ3ZThIYkx6T3F3UWo1YVVmdGZoalNOY2No?=
 =?utf-8?Q?/pA2dDaCKMaNTQKg=3D?=
X-Exchange-RoutingPolicyChecked: ITJbKeG5WElloXXGnZvXNHdutbLh7zSx/N6j6mA9CXect3mLSLRlKFIYxyOdR2aCqY4LkeaONMFDQRXBbZ3Co5GfhLmGqtmhfyvyfo73eRb7PZ6zhEetgMj+uY2Mob0hFOHdWWuutkSeyh9z2xGsrCW/ioa8wRaWDdyMYwh1sRy1Bmad14oT0iXpLx2zPRGtnJ8MFoZ7Vgt8kLfGoeRi+B6JzoYyTTWjNmJUPAiebyFVknH2GCDlXVk0SXeK5wm1ZtDvziYtigFBMra1mxrhzB5IS+Yx3Ey9UEBFvCqZKefcIVdNQ6ws5WR7pt7fRh0uaHOrxdk2kKlvUIB+5/yhvQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f3f06de-a417-49e8-4f1b-08deddf9dc00
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 20:37:14.2856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yM5wTS/6dIAsl/RKQzxY/I5myCcGV/GWuJrfkgKK6Y+lkWPp3xAWdbe0Ax01sH8y+sildFJFHy4ycuSLxLBGig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF691668CDD
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


On 09-07-2026 01:12 pm, Jason-JH Lin (林睿祥) wrote:
> On Thu, 2026-07-09 at 12:00 +0530, Sharma, Swati2 wrote:
>>   
>> Hi Jason,
>>   
>> Rev2 https://patchwork.freedesktop.org/series/166923/#rev2 i see IGT
>> build failure,
>>   
>> can you please check?
>>   
> Hi Swati,
>
> Because the series https://patchwork.freedesktop.org/series/168759
> haven't landed at that time.
> I have confirmed this patch has no conflicts in the latest codebase.
>
> I resend it again, but it seems [i-g-t v2 RESEND] will not trigger a
> new build. So I sent a [i-g-t v3], please help check it.
> https://patchwork.freedesktop.org/series/166923/#rev3
>
> Thanks!
>
> Regards,
> Jasdon-JH Lin

Hi Jason,

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

Please wait for CI results before merge.

