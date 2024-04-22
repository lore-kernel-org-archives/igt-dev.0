Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B01EC4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 10:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B145B11299F;
	Mon, 22 Apr 2024 10:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kFijNOlM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8521129A2
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 10:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713782462; x=1745318462;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3zMEce4RQBvDl2ZhVaOppIOW1x23+IVUiZ5ljJTMX8Y=;
 b=kFijNOlMXDcMM8t0CHVQrE8y1FozheKEvAqHBJjkZyHY/dk03yxnc9Rn
 wIOpNWWFFp4uNIsX1bqo4eSQksTkC/rE6FBACsv9hGuM1jHoDWi5hIj5U
 6XuFtdvpIYcTdPART3CxBGK2e4hmTunab8tk+D6aZTldf/QmK7oeb+ZuD
 6AUQ/m9Qp5ozeVo7WP10SC23feeJYkR0ncCFvCy7+zVorrB/FpzcAbQyV
 lXxpiWL0m6xnPNDsMalhXUTR/4fMsOdJvc1qwHi8FqE7VzCRhMavhjxqE
 gwLyQEBLowNaGRxCKK74aWgDqBd/UK6aVu1uAP8eXCtbIltu8y4GCsG7w Q==;
X-CSE-ConnectionGUID: 70OeonElSYaAWGVALRX0gw==
X-CSE-MsgGUID: GicRf1qfQiCT/hfnG19K+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="19918476"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="19918476"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 03:41:01 -0700
X-CSE-ConnectionGUID: /9V9QW70TmCxQ0WOwjWSMQ==
X-CSE-MsgGUID: QqrpjQQhT7KoENKgdip5Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="24428480"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 03:41:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 03:41:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 03:41:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 03:41:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXXxCSZ1CZBAnjeby4lJ07OCDriB3ON+ST6W9B1gGXcOOEYiuws+u5VCZuHBXIAndNPpwb1Nh4cmhtkfik8Qpn36A1RDTmjAJltsadyq+3RKeS/2ORLLu2KZNwwmAKPjT5jBbFfw1XopsutK5yjZ4+bAKjaB1f+J47HWx7pRe7OEgbyxnOMN216A8eNhyD4ZOeI1JPEoISaXgjukJW9IpQrZBQN3kP1CCrEUoxwzYTchYnAD2oDuNeAjFNeQtYT10KroG7SnGjd4Rmhd2z2pOp0U/jYN4SHNZ5S6YwO+tsda0dHhFUpJA4XyNd0M5AmOQi23rP/673AD5PuEEK+5Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMx6NgMsPmvN70py2CgNMmkCogjKVf6vvWJxFY+D/X0=;
 b=Yn1ozpKIkU7U0cTia09byLMCVsmwHSqJ2K9X2Lnpqx9VGHOScB97qgp6WpjB95ahwEJbO1w3YCoNTvduf6QX9FM6AlVzJDDVobBXTkMhnf6ARF7oaZeY6c2AJYWBszNpOYll9tccCrYZGKaBDF4LJb4fDqeJvaq/Ikks6pqOqASU7vOXJpmLaL4yHx+wT3ExL63eeQzPnwa9OcCchJSnDYcS224EQUaWayl+LYZqTLQsDxao/tPhhJSo4FqJFGHkFNjf0C71v5XCRxAnpdxdOqAT7GMZS1n+b971ry8PMEXq0G1NXrYqKpeQxayYw2pNaRjUaZ840MAc1WDs+yoZqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 PH7PR11MB7594.namprd11.prod.outlook.com (2603:10b6:510:268::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Mon, 22 Apr
 2024 10:40:59 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592%4]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 10:40:59 +0000
Message-ID: <daf73d09-475b-4d87-8bb9-b78002122d7f@intel.com>
Date: Mon, 22 Apr 2024 16:10:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/7] lib/igt_kms: don't run on unsupported platform
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Ankit
 Nautiyal" <ankit.k.nautiyal@intel.com>
References: <20240422053454.2523989-1-kunal1.joshi@intel.com>
 <20240422053454.2523989-2-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240422053454.2523989-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::7) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|PH7PR11MB7594:EE_
X-MS-Office365-Filtering-Correlation-Id: de294be0-2b30-4cb5-8442-08dc62b8b2b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVNjRDd3bFpHOHVOSmlzRGp3K0FPMThzQXQvQ2hRVTRTMFpYRUhNM3hmaEZi?=
 =?utf-8?B?S0dJVlFITmRXVExjOGZlTjhiWTREZnlQU2RQblRPZXVXand2N2NQVkZXaXIz?=
 =?utf-8?B?WHFlcHdtUjNhcjljbktEbVpZalNlSENuMWhqWWsrQVRxVCs4bVVDTUNSUVBO?=
 =?utf-8?B?OGd1MTFBRlN0UTBrSEhXUUFZbWoxY0JCNGg1aDFzNWFxMjBYV2I3NllmUzFQ?=
 =?utf-8?B?QzBCVlJWQ1U0bXRqVy9lU3J3elVTbm9lYWhNZFJOZlNZZysvRWM5eCtvMmZH?=
 =?utf-8?B?blk2Q1pLNzFML3d4cE1vcXd0ZHBjUFRYa1d3NTNjb1RBbXlpaVhvZGFOTng2?=
 =?utf-8?B?NEpJZlhHVlE2T2N0aFJZY01UNUw5eW5VMXowUnhjb1ArVGlSSk8wc1ZpNlhW?=
 =?utf-8?B?ZlNyRXJXYXFnRFFtOG9hMGowdEYwNlIzaXpQZUhxVmVCdkhEdlJGSDBiQm9a?=
 =?utf-8?B?VkZxSFZHVFhFM0d5NTdId1VkUXlNZkJLS3RLSHA2aklSbXo5OHVPVi9jYUZ0?=
 =?utf-8?B?a1VteFd2RTVxMUlYd04rSFVrRlpuSVExU0hhWStIRi83QXBKcUNBeU5YVmdG?=
 =?utf-8?B?bVZ4RFdsR3JmY3hYbEhER3Vob09JdjFpYWFhYTZXa3Rqa09jTHNNdFdBMzRB?=
 =?utf-8?B?Q3NKRUxFSWp1YjNEdUlYYUdGRElvWWxrK3g3QlZFaVMzc0IwUWtYL0d1dFBs?=
 =?utf-8?B?YnNtT3ZYSEpOekswMVdDektRditueG5jRWk4elQ3d1FsNEJzSFFlaXhHSm9p?=
 =?utf-8?B?eTI5ODVjOU9DaHhtZHFCSjJ4VEpZdTRZdWRXak5sbVI5UlpVaW5pOTNpTXpW?=
 =?utf-8?B?VlFWTmtXY3ZBd0dMWkQxeGlVaE1QaXBRckYwV0s4dXZ5RmlVSlJIQjRydGtM?=
 =?utf-8?B?WVBHVUdBT0JqbUpwRXJZOUhVQ0ZVU0ZBbkZGMzE0eUZsR3NlRnlmbkg1TTFl?=
 =?utf-8?B?dzBZaDRZci9xeS9oOHJ6LzFRY0tPQkp4RXQ5ZXhxdHhMdGp5OWJLdFo2SmEw?=
 =?utf-8?B?a3gxRlBPU0tDQWVQeG1BVEg2bFpqNkpONFAxU2gzMTNSYWo0YXRwTGZKUm1v?=
 =?utf-8?B?WHJXKzZOcjFIMUx0R2ZSWklhZlB3dFdIUlFhS1dXZjQwSUlhUmlGOVhvcDFW?=
 =?utf-8?B?d1VQdzlHWmZ3MkpBZ2k1K28rSlAzSTNkL293SHQwenJuM2hKUnVsaDRadUVQ?=
 =?utf-8?B?RnUrRFVUa1NYVkp6YzdnakZrU2tPUzZzL0tqU0lMc2J6bFhidjE1bDkzcEdR?=
 =?utf-8?B?WjA0Y2pPSGJUWnJ4OU80TncrL3FCdzV4MUJkaERIaGRzV0VCUTNhWmI2WjY3?=
 =?utf-8?B?VVJBejlHQkJTZk0rZ3BFVmpHd0lFMnZpVHF4VVlaNVJMN0tPSndIcThlQkti?=
 =?utf-8?B?R1VmNDhYQUVMT3g5bDN2eE5tZGljeGxEOWxYY1B5UG15ZUt3Q1JFcFNhaEpx?=
 =?utf-8?B?bHR0akFZNTZlZEFlS0Jhcm1oaDNnYnN3a0dPdDFnNnFEbmFxdm9mYVR3ZkVX?=
 =?utf-8?B?cVBsSHAvQU40bm04dVV2OE9kbElHSzh2enhyb21XdmlHT1VWTUJUcmE4THZy?=
 =?utf-8?B?TnVuOEQ5bGVnMUdyd0FWUUxmY1RrbDZkQzFqSXBQS2ZITjllR3RXZWlLNGsr?=
 =?utf-8?B?alVvWmxPU2tGaHlSS0tQUzZQOWtzR2pvSzI4Z0ZQTkt3TWdVMVJQSHZubm5r?=
 =?utf-8?B?dWdvQm9YbUNaY2F2YWtUNTNQdkNQa2k1TmJWbjdraGZ1QXdWbHVuR0Z3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTVqakNhL3FrNnd5WitrelI2eVZLb0tqeXN1bHl1UVJrMWpLdytQbTRibDJR?=
 =?utf-8?B?eFBKd2dwUktHMzdzV3MrMFFoUEt3RDZMOElOb3dPNk9iVVhhOW0xRHkvUWhj?=
 =?utf-8?B?N2I3VVZYUy9JbWN6TXR1T1VkR1JZZU5QK0xRTGpmeTUrMHR5bW1TT3kvdWx2?=
 =?utf-8?B?OWZDbU1IZW54S0lyNU92Sm8rVVlSUlhPaGtJdThaaVgvYUhqWVhzQzQrM25k?=
 =?utf-8?B?SUdJdDR3MGxHR2xqUGc3anowMkk2WHo3bFljTU9Cc3ZzeUpRd0JtVVFDdzlI?=
 =?utf-8?B?YjJpTWNabExQbGpieEtCZ1JnQVFlYzhwc3VNUk5ackFFaFJHQ3JYRElIeEF5?=
 =?utf-8?B?VCs2TVRrQVQzMkJEK1F0SHJ3RzV0M09DRUlTT0MybXkyUGxmSHhCZkN2REsw?=
 =?utf-8?B?R0dnMlQvMzdIOWltbkI1cDlFdURwWmVndnZBVkEvNWlnOXhBTzBaUWdvby83?=
 =?utf-8?B?MHdqcVRCOEpuZFlENmdrcEgzWHhyeXJvbzViMEFMTEkrSkxLdHhDM29Eb0xK?=
 =?utf-8?B?VmRYVWl0ZU0vZWhsbGltdlhzQkxiMnE1b1haUUFXV2FoYmdOZHVZRkM4a29D?=
 =?utf-8?B?Zm96eEROcFBteXhuWTVKakx3bUw3SHVQQktvSjZGeVRrdzgrakJOempWNTFh?=
 =?utf-8?B?Vk8xYzg5WEJXVVU5c1BQWXN0TkNJMnBLYkZFb05BR2hUM0pDYlovUFZsc2pB?=
 =?utf-8?B?ZEFFbExTNWdrRGtBTE5rNjgxeEhGcHhSRWV5NjZxekU3dTh0ZkFsVVhEWkJr?=
 =?utf-8?B?REhmREhnb0hRdnA3UndXVHZiNmRJSkdHYkRNam8vaklKaThzYVE2YkZQeWlI?=
 =?utf-8?B?c3FzQUxMd2NRV3hyS2xhMmkyM0lwYTFuWmg2VlF3ekpxeG5BLzVNU0pXZ2VQ?=
 =?utf-8?B?WWdhckpZdUs0R0ZCNlNGVUd4OEYyZ3ArQ0pNYnNLaklzYTBGdk1iOUJJdFFR?=
 =?utf-8?B?K25kQ0dKcVc2cEIzWVhLRzlFa0Z2TnhTbHJlbDJaYm50Mk5EQ1g5anhLTEpy?=
 =?utf-8?B?OUZlNmpiY2tiZGh5TmtoQ0I5dmE2TVpqSFdwVklEQ3hVTWtDQTF1ZE1FVFI0?=
 =?utf-8?B?QWw4Y1JMTWw0L1VReXgzZlQ2M3NFemEyTmlncmdZbzhLeEMzNEtpcm5DeUN5?=
 =?utf-8?B?L0hyNGVNZlg5Y0dLNnc4di9ub2N1SE1rS2RiSzIxNEJlOUR3SGVPa2tIRFFB?=
 =?utf-8?B?ZVZTOXF3N0xEaTAzV0xVTTc5WEVjM2tSQzZNNWRYck9RYzdTRFRhSmxyU0pM?=
 =?utf-8?B?TFV1ZG1IdHY0b2dvUEJNZ1NFaEdLYmIvUDVud3hrd1ZNYjdzUDZQb3RObnpB?=
 =?utf-8?B?bGNKVUdtRTcxWnRncHBNNDRKWU1oQnJtRExzT3ZXQlUwV01tNExJc2xDVFN2?=
 =?utf-8?B?YURBWmpJbnJhdW4yMGtjd0VTeXVXS3RFZ05uMDNvVFJrZUxZUUZyUEczYmR0?=
 =?utf-8?B?OUNsSCtuTkJoUG5ldHN4MUE5TzRLY3R1WWxKUExDVFNDYnFLdjZVRm15R3Vu?=
 =?utf-8?B?Sk5WRSticStPcnkrWFZpbnRoVkh6TjZhckNZeGhzL2tvcWV0UzBUOUtHS0dv?=
 =?utf-8?B?Q0Jwa0RFR05ZQWFzSlZ1T2ZxcGtSbWJMblQ2a24ycGw4QWdsNGNhSFFDYUo2?=
 =?utf-8?B?NEpCTnlxZUMvNStaSVhBMnlteFQ5dXo4OEw2ZmlvTmVrMEdNQlFKUi8rZzkv?=
 =?utf-8?B?NWxOaVBMdkdja3d4WFVaZHc1S3Rab3k2M3RXRnhRWXF6VmNVZ2Vab2xrWGM3?=
 =?utf-8?B?WlMzSWE5L0c4aFB5clhpaE80bGZZcFd3N3VURGsxSms0NWJhT1I1VTQ4RnF0?=
 =?utf-8?B?cnc4d1ROUUZ4Wi9WQ0hsYnVSNEIxUElMa3lrMEw0UnNsaXNabVpGS3R0bkk5?=
 =?utf-8?B?VHUwamxnczJ6eER1eXYwOFZpekJxaTBLaGFCbXlXR0lLOGpDWFNyZXcxTHlz?=
 =?utf-8?B?NldMbVg3b0JRUEpvTTM3OVozM2RlVElFU0s3N3RJOXN3ZWMvd2RQZ0t1eWI0?=
 =?utf-8?B?dUpKSWZRZzhmaFl5bk5NRTFqVGU1dUJrVFVaaU9aQktsQWpIemRzMzNrOExC?=
 =?utf-8?B?VTVsN1JseTNvWDIzNFFMZU9vcmU4ajFzenZvUDl1KzkzUEpUdkUyTDZCTEdR?=
 =?utf-8?B?V0VCRWpjaklKL3Q5VzJVTE9ZaHc5b25jQ2FNdnF5cVlvdW1RcE5zOVQzZ0NX?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de294be0-2b30-4cb5-8442-08dc62b8b2b1
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 10:40:59.2688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/y64cMNt4u5rqZ4jrk6+rQaLHnT8OEphwyFUZSHgBqXMnvBp3SPYz9LouhlXXQZaMPDzjq4TwjiVZUkWP44HmmTGFczbmipxlYKkKpqo7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7594
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


On 22-04-2024 11:04 am, Kunal Joshi wrote:
> dipslay <=12 needs dsc enabled for pipe joiner,
> add a check in IGT for the same
> 
> v2: dsc is required for gen12, so test only
>      for devid 13 and 13+ (Ankit)
> v3: update comment (Bhanu)
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Suggested-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   lib/igt_kms.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 3216fe7e4..ee8848079 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6246,6 +6246,14 @@ bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output)
>   	char buf[512];
>   	int debugfs_fd, ret;
>   
> +	/*
> +	 * bigjoiner is supported on display<= 12 with DSC only
> +	 * and only on Pipe A for Display 11
> +	 * For simplicity avoid Display 11 and 12, check for >= 13
> +	 */
> +	if (intel_display_ver(intel_get_drm_devid(drmfd)) < 13)
> +		return false;
> +
>   	igt_assert_f(output->name, "Connector name cannot be NULL\n");
>   	debugfs_fd = igt_debugfs_connector_dir(drmfd, output->name, O_RDONLY);
>   	if (debugfs_fd < 0)
