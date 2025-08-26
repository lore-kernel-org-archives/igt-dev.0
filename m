Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CBBCA0EFA
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 03:16:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69FF10E0ED;
	Tue, 26 Aug 2025 03:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ex0/46P8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3F010E0ED
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 03:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756178209; x=1787714209;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ai0UAQZS/OAo8CBjb32DI6xLRVAG/q5zNE6ZHS5FQ/A=;
 b=ex0/46P8h7OZXR2bIeIlST5cvwDWRfQOg36a5/4w2uTGfE46eG6cPEw/
 d14jKgSLcgn5L6jM6QdRmIpshX0YmFdUzBntBYQPOzflOGNjHKrDa5NaN
 i3dQyS9dCGwxR2HbS/oQ6FJqglcgo3CeQTV1E+hOD6yznoxAyojdOq5Sg
 mLxuYEhGUEl9/GgK4F9X6Vll2XLH8O/BBponpJD/qnnMAZqf4hAifEDab
 HKEkyh/ZTLImXQpVsQp4xHpuBeuaYLvdv+3jqKMv9Af8NOdZRc0Kw+B3F
 64eHPjJcYtRK8zfVP20UuGgklI6CHiaGeJWSbA1mqzDl9CmxkmhueMTAJ Q==;
X-CSE-ConnectionGUID: QsYy75trQCmJv/GNjP/lpw==
X-CSE-MsgGUID: KXqT2wUJRWm7+wNhFdRMqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58322903"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58322903"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 20:16:48 -0700
X-CSE-ConnectionGUID: IdjuhjptT/ip6/wGT7lDcg==
X-CSE-MsgGUID: dg5EP5rGQ2yAzigJWu1QYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169361065"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 20:16:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 20:16:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 20:16:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.71)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 20:16:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m99hMb2uwEdRaDVuDNmahtGG2ZnMAH8jDwhtkoAloRwLXywE090LPYvWWhOy2ZtG2VXp8tQUtwggOhbKkA92PLz6Vrku1G5NY7Hqla1moXt13H+CHt7aAV3Xk3zFb5SELQIP1IpHORhkU0IVhGqT9JTEWhsilFYzfGFIMGAakWTU+eeqyr09A0xDIkD+2kn9re2j/LryMxQTpK9Src3D1Q+cqeqqojKoYsOvrczQKpy52g2WIRnDT8hO4Wg6aRcAhoEOgB7QI6aadORP7lrxBy8SElXbBqEFhH76ZK2bBsS//vjrtqwcEZ6zeAl8849ZfPVI+VL8Mqp8yferhay6lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3PWN9W4paFqNRhRzR+FdfFIUOydfWMPSMnh7umpq6ig=;
 b=BWzHDJELxGPXxRu7152emluDCMydzMOuUCZ4SUU177I9yrtK+ExEq2udwa1bKdZV3Zz0TeYIOOZndn8TYSpmeB2+zBoSIWadiZg9iNWexQEYkTkygFiN3AbQN18K2UA1fzM8oWJCpA44UxqFWlSeug1xmFSzvAvht0pOCSxM4RpN93Da/7v5/bbKirWfgGoKinaiBk1wNRkItNYyWpB6aCqQMbnGyIAvDHoIjo1w7EAHNyC3ztm8LAT6BLT+ZCz118OkgJLH/NWk+NubeQDFz7vzUYAzuV+gMe9qvMZ63sBcarApAZ6fssBfImb+yls9qLYhVbY/znQTLXY96aEq+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DM3PPF076C797B1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f07) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Tue, 26 Aug
 2025 03:16:46 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 03:16:46 +0000
Message-ID: <034cfcf2-11c8-4fbf-8e3d-74bc6dfd1079@intel.com>
Date: Tue, 26 Aug 2025 08:46:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] chamelium-only.testlist: Reorder audio tests to fix init
 issue
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>
References: <20250825052941.1135136-1-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250825052941.1135136-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::13) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DM3PPF076C797B1:EE_
X-MS-Office365-Filtering-Correlation-Id: 602cae4b-f373-47ee-d1ec-08dde44efd0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|42112799006|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2djTjhBbHBTeG5sby9lZGo3OHE0RzVSMzBXcWtia0tYV0hRTEFDdFgzRThC?=
 =?utf-8?B?Z3g2cGR2YStvamdrbHN2S09MczJHcGtBa2xYTWlDMnlGenBET3BaUThZSjhG?=
 =?utf-8?B?QWJEZW8xa0MwQUlOVkZkdGxtM2gvYnBiNktONm1xZVlXNWRNTXRjWU80VUo4?=
 =?utf-8?B?b1JIaWFCYmhtZittNW8xUzd3NDArSnl3NUo4R2tiTUVRUkZtV1lTMmRjWHJG?=
 =?utf-8?B?Wkt0T0FGSkNac0x1Z1NPd3FtWko2QnZBbWQ3N3RnTXhGQ2ZzajJRdWFtZE9k?=
 =?utf-8?B?dE4rYlJjVnpvaC9IZ0pFdytGMUUrY3ZwcVFxZFRlUE1lUHV6UnZOVWNXZnBr?=
 =?utf-8?B?QmJGMHB1QzRDSzZ6aVZHb3hCNmp0bkxqdGllM0dGVktPUUhLcXlxUzBoTmdp?=
 =?utf-8?B?SGx2clA2dHB4bUlhY1dURHJHa1NOOEJHWC9Yd1pHZEpHdE1pbXd6eUNmVVM1?=
 =?utf-8?B?NnVvbU5TWTdOUERDQzZwbXNSdWFRODhuaGZWM0N3amJjVFVpbFcyQWs2M3ov?=
 =?utf-8?B?QnF0WU1EMUZKaDBVMytHOTVONUNxVHZOTEEzRG5hSVlOd2pZYXl4QUg3ekFP?=
 =?utf-8?B?SGY3MnpZQTdqMDNBcTBvdTY0cnVYRHhqd3MwT2V3UHBtcUNUeXRnVnJwQnRh?=
 =?utf-8?B?L3B1RDVkTklpN3BlY0g3MkhkZm5JQm8vT3JXM3kvQkFvZ0dLR2Fwdm96RkRm?=
 =?utf-8?B?VmtCbUMvbm9BdGdYdksxREl5bXFaM283OXdiYS9vb2c1d2Q1eUU0TUZLSTJV?=
 =?utf-8?B?UW5Xdms5WjMyaHhRTXNWNkV1UmxOdnN6bzFkNnA5VXBONGk2YVFEbFBpYnYy?=
 =?utf-8?B?Nk1URGVnNHd4WjRjekFSU3A2eUdtV1JhSkJzL05XakVMR01HYUcyNzlSRzQr?=
 =?utf-8?B?ak1meGxlbUdZTnh1Vjd4V1RrM0k4dDBrV0Y2ZjNLSzdjOVFBUDE0WGZQbTZB?=
 =?utf-8?B?N1FPRlMwOUJqK3MzTk93UWV5TWpvcjhzdmdyaWcrVFZRd3pKMFlCT05tRDVw?=
 =?utf-8?B?RW9rTVZsS0FVUzh5dzgrZWlJUmhyRHc0Um9yeDlFbUgxYzFQR29PSjJaS2xj?=
 =?utf-8?B?M1lVNzc4T2xSWjV5VzZOOGFBaDYxeE92V0RIU2F6U2k2WjhZSGs4dnNxMktu?=
 =?utf-8?B?SjlkT0dFd21MVmVFRS9uWXlwYnhPVzFmTSt1SXdSNmFLUHREK003OS9aejJ2?=
 =?utf-8?B?TkZ6OHU0eVpkRDB3K09qRU1PSnhENEF5eGFzZXVUbjFFajFFUVVRcEk2Z2VH?=
 =?utf-8?B?aUtlL0txVEpGVEJXNXl4MTVHWUpJNXgxdkJBcmhBMVVPdUhjRjlkYVNySDNC?=
 =?utf-8?B?SzZyZjdpL2tYOUNZaVl4akJHcEtNTFhwRGpOY2ZxL2MzT2lqT0VEZVNkYjJY?=
 =?utf-8?B?UHVQalVLNzNvejNnYUFNRzh2bmZHSlYxaTdSYS9jdjkzNEpvcTY3UXdRcFBr?=
 =?utf-8?B?SEZoWVRnNVpCclpxcllPMEl6Uzh1S0tsbm1pMEJvU25LdGdsTUFrdkZUL2JN?=
 =?utf-8?B?eEhyZ1A5dy9Rd25zTTloM1U1TkM2ZkN6ZkRrYnVtaFU2ajR1cERuMkVvYlho?=
 =?utf-8?B?WTZCMDhEc0dhQWJPL0d6bzBBdzhqYTNpUWQ0TEtaMmF3RXp1N2VUd2dmNElS?=
 =?utf-8?B?ODRtV2FEamNmNExmd09YR1d1N24rdUU5VjFwdVl6VW5mUDRHbnNnWkFKeUJy?=
 =?utf-8?B?YzFHOEpQQmJUVlNyWk93Z0pISFdWRlQ1VVFiSzdOUWg2K3RXL09FbHZKR0NU?=
 =?utf-8?B?RjlXUVJ3cUlUTk1HQmVXRFMySHNYNllRRFJGbWpiTVBWejQ3cE1xdVByMStw?=
 =?utf-8?B?b3FjRDIrZ2Z5Tmlzd1RjR2xudDRGNy9kclRGQVpWUnpTU3VoUjdoSnR6Y2py?=
 =?utf-8?B?MkJMdEV5a0sydjB0dE4zbmpwUXZMWlpTOUtZQ2pSRkhGbW5lQWdrUjZrbW45?=
 =?utf-8?Q?xLf9Kdf119Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WENxL0pCNGJMbE40anpnaXhWaVVRZ0V1ZmdEdW5MT1RuWUFQMTBvQ3U4YmJO?=
 =?utf-8?B?TnorZ2l2WDdOSldZRDBRQytuZ1VrckROUUtuSENObHdVT3NzOXkraCs5TzNa?=
 =?utf-8?B?UWtxSGV2MFNEZExkOHNxa2xaWnBuTkhZeTJWekFsbkkzZGNUalZwOEV5UmRx?=
 =?utf-8?B?N2lrWWlkT09VNzN2eG5uaUFWWUlzNTdrZFRCK2hETk0yL2VhN2NaYkZ4S1V5?=
 =?utf-8?B?bkZCS3NUWldjZU02RU5nd05YeGJoY3U2S0lmRkJJSlZYTXJMMlR6MWl1OFJG?=
 =?utf-8?B?RzdHdjNPczRwUmxVcjVaSk1kc0JrV09RTHowTGgvNHVnRGVXNmVXUkE1VDM3?=
 =?utf-8?B?eUJlWHlXd2hROUpRVUtsZUlzNG14czVRRzhPSnBFOGtUVXd6SVliYnFjaUFW?=
 =?utf-8?B?cTJNa2Z0eDlmdkh1MnR0UWFhdFF4Q3VmZ3JuVlc2R2xUNHZnSEEwR2hhR3Bt?=
 =?utf-8?B?YkNHZ1hqWGkwR3d6ZFZkZ3JRbDhpNzcyNUVwWnlTSmdvOEVmQUxUQ0pFV0M2?=
 =?utf-8?B?YmYzNFNXWDlpNXhqL1IxOXQ3MGNmdDFiOHM3SzNoZm9yRStJZ2VuRlo3Vyt1?=
 =?utf-8?B?ZDd5TWpRSFlCN2dTcTJ1VWwvd3BwT3ZiUzNkZ2F0MW9KWEFpUmtmOW1tT1cw?=
 =?utf-8?B?RjE1TG13UjBidlRqMFRuMUI5YjZBKy9rdlEyZit0WGtHQ2dzQ3pZVXpEVytl?=
 =?utf-8?B?eTAxU0ZGeWFPb1FsUlMreGxza1pFaCtJc2N2QnV4WDBCbm04MWFlK3RiRTRN?=
 =?utf-8?B?VjFZMlJ2NjdzaWR3RUE1eEdhdTRjVWFZUWluYnAwS3lXVGh6V3lFbU1hcCt0?=
 =?utf-8?B?R0pPMDE5UTdNMEZTTUVBdUkwekU0MmliTzJzZnl0d1o2UHpHY0R3b20zWkk2?=
 =?utf-8?B?aWsyZkpGWVd3aFhMTDd3WWpaNWVDWkRobVVMOEpQZ2FLUWkrQmJmRFdaWFo3?=
 =?utf-8?B?VDBaS0M0YXV6V1J1MjV4Sm81OEhXOFVyNEhPbkg3Qm4remhUdm9KNDZrd2dL?=
 =?utf-8?B?WnA0cU91ajlsUmJhcWM1a21aNDM4K2IwbEdkcE1WKzd3anNxRWlneWhxY1lj?=
 =?utf-8?B?eVVlZnd5eE91QzM4MzBPcVN3dzRLUytSY2JEdWozRzI5VW9BVXNzQjZ6dG94?=
 =?utf-8?B?U2dYaVNaelNUYVBONWM2aXhXQk1YTVVJekoxYXZMWFg2dU85ODVyNThmSE15?=
 =?utf-8?B?YTlQYzllU0laQVZxVXROSzF5YXFlZ1pEY1c3VnFTbEhDUW1hMW1EQTB3MU5I?=
 =?utf-8?B?elNlWjRwVi9GNXUzMUF2V21UdmhuRWZqQXZYNVE4SDJHNGRLR1FRRnBwNjE2?=
 =?utf-8?B?cHZkWEFsSTFCcTZJYWdseUsreEV4S0MrcFYxS3NhbmI1ajI4Ykp2TE9vNHBx?=
 =?utf-8?B?TEJXclYvUjJram44K2tocHY0L004RjFGVnE5dVlKRmMzRUJMeWdkRHpkSFpQ?=
 =?utf-8?B?Z0Jqek5hS1FFNTJYbFJJQ0N5bmdnSzAvMnd2c3VlTTdFVVd0c3lyWmFVeG1u?=
 =?utf-8?B?YmdmcTVpNmZIdFlFdncrT3RlbVpVZk03VWxLRkd1U285WGlZSlY4d29tU3FJ?=
 =?utf-8?B?TmlqRWhxQXFhOG5SaHRyTDcrRU4xV2ZHeFI4ODlRa1BtSVR0ZThua3c4ajl2?=
 =?utf-8?B?VGI2THdJays0RVdnd0RsUnRUaTJwY1c2R09UcTVFSlhuTjdHL2dFRlVCMTBX?=
 =?utf-8?B?ZUJLWkNISC82MHM4VGZqVlVpUGRwelYzdmFOY3RPYVgrM05vYUtLeFlyQncr?=
 =?utf-8?B?MC9IVEVGRS8yMFpYcUlmeWtqdnhLZ2k4NFFsUXA3Z3p6QTUyVVlsYndIdlhq?=
 =?utf-8?B?YlBjK0tEbHZNcm94VkhsOEZHN1BFWWJXQTRTekcwcFVLTllhTE1QSk9xNTE1?=
 =?utf-8?B?UWlsZkJBYzRFcjRMN0VTRUpsMllsV203YmhsQkNwTEhVbjlZT3MyNmtpZjRt?=
 =?utf-8?B?b3oyQ3BGeTY4enluTzM0b1VLbGVsMHBsSHZjbkR6VmFZbHN4WHpBd1QwcFhL?=
 =?utf-8?B?NmNNcFRzKzBlczlTU0JhZE1jcUNxVU1CSlRhUmVkN3pubkgvK0paUFVPbEt4?=
 =?utf-8?B?cGZtcjZQM21ncVNuR01UYnZNMGVBa1pWa2s5S1VpRUJaSFdQK05oeTBMN3BQ?=
 =?utf-8?Q?oSoa7kqy4kT0M3xA1JApVNd58?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 602cae4b-f373-47ee-d1ec-08dde44efd0a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 03:16:46.3890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRKjNOk/U4qZcPd0JOvmQ3URH1NS1jQsVokZUr0kn6SobvJxnwtZoCl/l0/m3j3C93TJy5RqzAEm6MJAb21tXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF076C797B1
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

Hi  Jeevan,

Please update subject line.

"intel-ci: Reorder chamelium audio tests to fix init issue"

On 8/25/2025 10:59 AM, Jeevan B wrote:
> Fix audio failures caused when HDMI audio test ran after DP audio.
Nit: "test runs after"
> Reordering ensures HDMI audio gets enough time to initialize before
> running the tests.

Please add fixes tag pointing the gitlab issue.

With these updates, LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel-ci/i915.chamelium-only.testlist | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
> index fa4e4e588..22e12108d 100644
> --- a/tests/intel-ci/i915.chamelium-only.testlist
> +++ b/tests/intel-ci/i915.chamelium-only.testlist
> @@ -1,8 +1,6 @@
>   igt@kms_feature_discovery@chamelium
>   igt@kms_chamelium_audio@dp-audio
>   igt@kms_chamelium_audio@dp-audio-edid
> -igt@kms_chamelium_audio@hdmi-audio
> -igt@kms_chamelium_audio@hdmi-audio-edid
>   igt@kms_chamelium_color@ctm-0-25
>   igt@kms_chamelium_color@ctm-0-50
>   igt@kms_chamelium_color@ctm-0-75
> @@ -58,6 +56,8 @@ igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
>   igt@kms_chamelium_hpd@hdmi-hpd-storm
>   igt@kms_chamelium_hpd@hdmi-hpd-storm-disable
>   igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
> +igt@kms_chamelium_audio@hdmi-audio
> +igt@kms_chamelium_audio@hdmi-audio-edid
>   igt@kms_chamelium_hpd@vga-hpd
>   igt@kms_chamelium_hpd@vga-hpd-after-suspend
>   igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
