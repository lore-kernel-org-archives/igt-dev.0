Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6809606A330
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 09:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SrNMlveD;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=nKKcGV2I
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F81310EAE0;
	Wed, 18 Nov 2026 09:39:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2532810E7A7
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 09:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794994682; x=1826530682;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6KUxnd11NMGSWvFVMx0SvJ+QFfZH/kqCw3BisF/vjpI=;
 b=SrNMlveDDhH6+8nNSjSlAD3V60eifdGR5x0FOpYdOsxjoqtBZPfwWXLo
 giUH/FiUrEeiHxWfLMHvVdwClfv2nCcULPBD5xly+qRO/CTorj+H7JqJn
 0RKE4lDGoIXYiwj8Awz5gfNfNSfNZyV+CNX23G1CshT67Cqfbdh8QXygB
 fyMfZmrkQhY3LGbQNBewf2IwPb0REEg62TnRXihEwqoQc1aReHA2I7Vul
 KEgdvy2VPZYr0ss5BXEpCVjJMBcaJI29IfM1vDIl5Cpyq/Veb0hQMIVTh
 droGGrZDAxeEsnWQZGNso6X++2pQrd55QAFIDE3AGGUjvtzhwKaw7Hb8K A==;
X-CSE-ConnectionGUID: 7XCGv+9UQLK82iCaD99R8g==
X-CSE-MsgGUID: CUgaBBufTIymUC4NcUrmsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3798003"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3798003"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 01:38:01 -0800
X-CSE-ConnectionGUID: bdp7ihLxSOuet5hDzyZWlQ==
X-CSE-MsgGUID: GKDlIFGEQ7yQdo+2RVmQFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10431002"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 01:38:01 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 01:37:59 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 01:37:59 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 01:37:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8BaxMrO+htkYheYIoJnrjZMK4kjIBGZMfa3bTLGmeh9+hfvv/qZ4QvRkntdHgIa2xJxtSx401ZLk14kALDfed24vymHULQ22PuPKdGUKUC228n2yyH0DwL3chvyORzx4Lz5MD+XxCOFquPIyoMlE7wCPBfxYFfgt0SCRMmrvS+olzFaY7scVq4qGKR3TcaLZaZiixPGyoDu3tlGr7rjOrI0VMH6OfkC9kxz4OqV+fCZHB8fIJxF0WzhKHagryLhCWILYg2OWKDW1qnVobTWN7F9i/sZ3u27oA7zBJ/mVfiRt0qHKMXX02lxwqFtpCCh23vkUP7BOFmcBWTSIbg3bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoObOlIw6q94493+g7FO7sVOyn8uskoCRPPss9vA0CU=;
 b=cBi13kZ4eC0NYJulrcO+gVIA3KCWO5GAU6LIn2eJEOrYw3omV00iYMqESeC0zz8T6jk5zs4ydHFthN/taynqOZgQ1lx6kdp05dDwUlz2TDqb9i1yoH4M6w8r2/zWOoBKS2K24HlqBLhxSyHhPw85f/gWRcWZf+Ly4P9oFywUwTlCm4x7bDQl+XJ5HVRY4RINrRLlbU6Lwk4199WixJewwWo+d12NP2KFkky0cGN6UiWkrNSXHIvjB0WzwDGVbBI8PdA7qfDMM1hhLRDZnFsJqtaERueH0qgAC1tDGAuwLL29vJ5pOQP+mXGq97Ulxu0lJblhveN85lbhYw/VGs9nmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoObOlIw6q94493+g7FO7sVOyn8uskoCRPPss9vA0CU=;
 b=nKKcGV2IR0LDnzYhxV0yMiVLUDFix9VAVKujmfQhEfWnGlhsbZ56C00jtJNIrYdWiXETKPHe/l8ZAg4ZB1yxf6QZ5+kg8ILubVpUsZg1vRv3F7SdmRc15NuGhNUVtpVepQM+P9WB/YAbF4+LgOHFxyCm+g7QEZ+EHQ4Ftjd6YoE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB335692.namprd11.prod.outlook.com (2603:10b6:8:4c5::21)
 by PH0PR11MB5877.namprd11.prod.outlook.com (2603:10b6:510:141::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 09:37:56 +0000
Received: from DS6PR11MB335692.namprd11.prod.outlook.com
 ([fe80::78a1:490b:60e4:6d57]) by DS6PR11MB335692.namprd11.prod.outlook.com
 ([fe80::78a1:490b:60e4:6d57%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 09:37:56 +0000
Message-ID: <3e37d5c2-8b77-4797-b39f-f1cb8f849d61@intel.com>
Date: Wed, 18 Nov 2026 15:07:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 5/5] tests/intel: Add oversubscribe concurrent
 bind stress subtest
To: "Sharma, Nishit" <nishit.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <priyanka.dandamudi@intel.com>, <matthew.brost@intel.com>,
 <kamil.konieczny@intel.com>
References: <20261021174032.18337-1-sobin.thomas@intel.com>
 <20261021174032.18337-6-sobin.thomas@intel.com>
 <91dbfca8-a07e-4567-9f40-174b42558700@intel.com>
Content-Language: en-US
From: "Thomas, Sobin" <sobin.thomas@intel.com>
In-Reply-To: <91dbfca8-a07e-4567-9f40-174b42558700@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0131.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::8) To DS6PR11MB335692.namprd11.prod.outlook.com
 (2603:10b6:8:4c5::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB335692:EE_|PH0PR11MB5877:EE_
X-MS-Office365-Filtering-Correlation-Id: ab2ca5d0-1ba8-4924-bcb3-08df4557a03a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|261009223027099003|3023799007|4143699003|56012099006|5023799004|260925022911599003|260925021911599003|260925021311599003|11063799006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261022075727099003|261021135927099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info: 4n5l93JN76zv2iK2WWmTCDyhppwrMx+IQUcg/RF0MFuFSLi99dwFQjBW4Lh1ejX1zzpN1SCkvGx4ZPcBr6GNqnJQpaFgH3KUWdOxUZGtsNP8BLAIT/AD0wTDe/gv+1ZnIZmZ8FOUN9X+2uCo3dUZi6nSHZA0pVlinGwj1DMXVrnzeb8VsEl4aqQAueh32PwL48Oz+uAUP9Kisp2YuwJ+URjJuG7hwOzVQSA7UC84fLWXTXGcKUYV/3taSbSIl9ZRcVOWQtHHla2pRNcw0yFonwzSv+j3mfrVMB5rCdRjMyx6T3d21BL1OWmjXaaxqbOjU0m5Bj1IKS4I981A47LV2ctIAX4AcOT5xb9ZgGLmGh8iORD/sYGwo6w1+f2sFI1p9UJLo1/0SFNE+PL9afAV8XDA8iGEYiah8nYbtUJojPLz2sC0deYWEc+sMPFKoraUEeSJCgFOTBpfIep4UtWa/SPVAXbV2gKYF0GObvWZvVrGoQVr/+4rxTSCvXuMLugJkw2I2fILg6mgbp1LMJxoPWqYgCBOEfDHvCvtQkSnC1Uq9Z4B/k6+YErSv4+Ms9SIBq9461SuqSMxHNyBgwrk7mluzRsDo07B/QeSp3GDltU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB335692.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(3023799007)(4143699003)(56012099006)(5023799004)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003)(261021135927099003)(261021123027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SE1FdHhLZnBKdjNxc1JOOUw5WnI4NzIyQ1lFdzZIKy9ZclAweVpyb0NFK1RW?=
 =?utf-8?B?Z1daSzM2ZTBoRXdrWjYxSFhnYzJTSWRCOXRyK3hIOGdjNkZzc3lLc2QwWXU1?=
 =?utf-8?B?aUorMG12ZVNvTmM0UnBTeEZqbDNwRnBpVmE2K2dBMzVYYmhvZ0NlbkZZV3RU?=
 =?utf-8?B?Q2xqZUwxYk43TDQ4MkZFdjdjaDVTSWhXMmJlMW13ODhYaE9aMzNYc1phQXV0?=
 =?utf-8?B?VWlTckQ0SWpoR00zWEtOZnpTZXMwMXM0SkFiU0ZDYldEL3lxNFhUSFJtTW8w?=
 =?utf-8?B?TVdDd2VnT2tlUlpxZ1F5SkdTQmNpWmd6M3dqTzZzY2xYS3VxbDNCcXRWK0Vk?=
 =?utf-8?B?Nk1MaVpSd2UvZmR4YWxPMGNvU2dOdWZiMk40eE11YWp3WnI0OTFJTlNScVJW?=
 =?utf-8?B?MGNza0lldmdhelQxNVhaMUYrZTdVR1kvY1A1SGhwbWE4K0pxYWJMeG9Takhm?=
 =?utf-8?B?QzdidDZ5RUxjNjVaclhPYWNHcml3MEplWThUeVNRS0xYcUFEWmdKV1NqQkdr?=
 =?utf-8?B?VFhYVzZubW15QUlsbmdCSGVQcXpqVGd1S1FrNzBxZWRxSWtsL0tqL0g4b3NV?=
 =?utf-8?B?amNPcms2dURJbGpRc1NpNHh1NjBqK1h6UzVVd284WUFIZ2hsRWxJVHBERjE1?=
 =?utf-8?B?VjdZZzFublpxaWxaZ1QrVVZtOTlFWDFQdUR1eS92dzMzQ2FaR282RSt6ZEhB?=
 =?utf-8?B?NVJEZXl1Um5MbTV4OTJ5UHVhN29BcnkzUEFXcHJBUmhVYjRZRk1vMytpZmVE?=
 =?utf-8?B?aElFcG1pdEdSRlRpV0lBeDNlUklOemZJbnAxRlZiVG9rbDc0UUxQN2NsQzdC?=
 =?utf-8?B?SndCZkxSOExOWFB0QTlqWFkreVZrMEtSZ1JHenhidm5nSzlTWVJXeS9qcjI5?=
 =?utf-8?B?NVhTTHY3Y0ZBVXgxYXNFSkszdDJVQ0FLclpYVWVZN3BHZmFPNGhNa1JUdFY1?=
 =?utf-8?B?WndBV0xxc3B2QXdGc201Rzd4SmhsMktOV2xjektVNm9EaDVpSlNCWFUrM3A0?=
 =?utf-8?B?bUxWQVorOWJuSTBxOWUzQzVGaTEzTVZnM0V0Z0JDUms5MGJzaEkrTWVDbVda?=
 =?utf-8?B?MTBUdDZuVjN2WEZRbG14NXZ0bUhOQ2NSUmcrRU9mOEdKQ256QjhFeEMwMGFC?=
 =?utf-8?B?bFBadnBqMDRVd3pYSXdnUlNzMWVleGI4OFhROHVZbVFzRFZZamRUMlRrNVNQ?=
 =?utf-8?B?RUt3blJwNFZjRnd2Y2swcU9hcVB5a24vcHJxcVB3SDBLT002YlFnZ2RqeFpZ?=
 =?utf-8?B?MXF3YnFpR3MvWUd5cjBXdmthUk1YL1Z3TjZrbFl6MmlWd1lqQW8xT2RXdFl2?=
 =?utf-8?B?dnl4VEpINEFXZkJYRk5nZWw1Um0vZFBKdjNkanAvSlFOT2pWTUF1eWE2bWht?=
 =?utf-8?B?bWxpeFJKaGorSk43WnVHOVFrZG1nTXRzejNRQ3VnRjRtR2hnNm1zdEhKK01n?=
 =?utf-8?B?TTliaWV2bVVKa2FqTCs5U1hZQ0FtMTlHR2VXMFE5U3VUREo4WGI0dlJiejNu?=
 =?utf-8?B?TVIvNWVFb25jVnNZaFZKMXgzYi8wd1g0MWRmcmhBazR0Y0JvdkFKM3JWUEtn?=
 =?utf-8?B?bWJLNEM3dzBBWXpvR3RydmZQeWhqTkEva042cytzSkF0Mjh1V25ZS2xhdWVV?=
 =?utf-8?B?bFpQU1hrenYxUkMrbVpkUFFQekRHMnk2OVgxZ0ZYQVRmMDcyZU5RMGdTQkV2?=
 =?utf-8?B?MS9EYWt5VGZzc21vUm5jd09TcHhBUFEzRHpLQ01vdXJjSVBSL3ZKS0lNQ3R1?=
 =?utf-8?B?SkllVzNoNXkvdlE4WUZWNjR4QWZPTWdqclJUMy9nVzhacmtEaUhOZHVaQjBI?=
 =?utf-8?B?cW11UTV4Q3hlaVZVVWZFOFpnQ21EY2dkY21kdkhmYk1RL3FNckxaekx5Zmw3?=
 =?utf-8?B?MjVCVjVQTmpwQjZyei83SHNndDVqc3l3Y0dwbi9qVFc4YzU5Z1ZzRzBxUVc4?=
 =?utf-8?B?eCtOT2QvRHdRWTFpby95VHNFNnkxV3dVTVFraHlsS3F0clhLbzJOMHdiNHVa?=
 =?utf-8?B?UjR4ejFlRndTREdxZXdZT29hZmV0a1FyelNtQXJiYmYrWXI2SkM2d0J4ZUJD?=
 =?utf-8?B?QlRDSGp3WlMyOG90TmRQZ3lUb21LL3U3dXVCM24vTTNwMmJ6WUI5d0p2VEJr?=
 =?utf-8?B?SStsaGVaZzU4cEdtRTFrL1QrcFE4WFZ2ZUlGZVhaOWFPWXB0alhBYWhmTXJ2?=
 =?utf-8?B?UHlGTVdIcEpUZXZEa1ZJSEZkdHRnWjRTSURPNVJQa0c0akhiNTJvV3RtTkV1?=
 =?utf-8?B?NlhQUGtGVW5NOEZ6T05uRGRTTFRHRHB6aEpTOWRwM1l1RG1BK3pRcDVTS0JX?=
 =?utf-8?B?UXJTbFlJdzJMNFpxOVlKN1pGVDVUL0pVZUhBNVZPNjdxZ282ZlJRQT09?=
X-Exchange-RoutingPolicyChecked: s9nUNGSlz1+0Co4N2uS0yOBr6jdt+mo5Ni5FpRqeeJq0BHEhLYD7JedjQK3HIHXRUpZJtKosgOVx7nA0RoP+W3oqT6mPikzoyvMxY1R+b25l0eQ3yeVRRB6iDdSr3Oh2OR1LpE3atIu7KbEHG0vFrZZEM5AHcWmGrGubmW8rVLAQI2NJU10MZWlvhu81rtEIkF26LxSlkfCn4FLFwaVXKvcYQWMnDHSQku0SqxbkyxZbg9oUrACV3rXOf7KwrnqnuUL4ie2Ol2td8zByqRAgZktxN9QxNOXRZASTH9OSK+5TtVcxhX0lyzLc3AbWs3cyPB33H0BgmbJUEj2EiibRlA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2ca5d0-1ba8-4924-bcb3-08df4557a03a
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB335692.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 09:37:56.5852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZLYu2wyR59fpRf/PUVCFadkKN62pzjm93DAnXuqxmoUw7attA6d1Rgb98XPbcwA4qH0JGKYVUu733Itpw1JLcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5877
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Nishit,


Thanks for review please find inline comments:-


On 11/12/2026 11:35 AM, Sharma, Nishit wrote:
>
> On 10/21/2026 11:10 PM, Sobin Thomas wrote:
>> Add test for oversubscribing VRAM in multi process environment that
>> creates VM, bind large BOs and submit workloads nearly simultaneously.
>>
>> Previous coverage lacked a scenario combining multi-process bind
>> with VRAM oversubscription. This generates memory pressure with
>> multi-process VM Bind activity and concurrent submission, exercising
>> the bind pipeline under eviction pressure.
>>
>> v3: Fixed minor nits
>> v4: Refactoring of the create_bo ( Nishit)
>>      Fix child process exit deadlock in release_ready_processes() 
>> (Nishit)
>> v6:
>> - Abort all child threads and fail with a reaon on timeout (Nishit)
>> - Track the setup fault , OOM Faults and completed child 
>> process.(Nishit)
>>
>> v7:
>> - Added  skipped and late_skipped variable to track process at bind and
>>    rendezvous path.
>> - Replaced gem_close with cleanup_bo_resources.
>>
>> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
>> ---
>>   tests/intel/xe_bo_alloc.c | 641 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 641 insertions(+)
>>
>> diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
>> index dbaa389df..121b48d8b 100644
>> --- a/tests/intel/xe_bo_alloc.c
>> +++ b/tests/intel/xe_bo_alloc.c
>> @@ -32,6 +32,18 @@
>>   #define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
>>   #define THREAD_VA_STRIDE GB(1)
>>   +#define INT_ADD_CNT 4
>> +#define TIMEOUT_NS (30ULL * 1000000000ULL)
>> +#define MAX_SRAM_TEST_SIZE GB(32)
>> +#define GPR_RX_ADDR(x)          (0x600 + (x) * 8)
>> +#define MAX_PROCS 20
>> +
>> +#define EXEC_DATA_ADDR         0x100000ULL
>> +#define EXEC_RESULT_ADDR       0x200000ULL
>> +#define EXEC_BATCH_ADDR        0x300000ULL
>> +#define EXEC_UFENCE_ADDR       0x400000ULL
>> +#define STRESS_BIND_ADDR       0x40000000ULL
>> +
>>   /**
>>    * SUBTEST: all-sizes-once
>>    * Description: Test all BO allocations sizes in test table
>> @@ -85,11 +97,57 @@
>>    * Description: Test 50 random BO allocation sizes in test table 
>> with a thread per engine,
>>    * leak the binding, with bind addresses unaligned to BO size
>>    * Test category: stress test
>> + *
>> + * SUBTEST: vm-oversubscribe-concurrent-bind
>> + * Description: Oversubscribe VRAM by concurrently binding arrays of 
>> deferred-backed
>> + * BOs from multiple processes, then validate successful binds with 
>> an exec
>> + * Test category: stress test
>>    */
>>   +#define MIN_BUFS_PER_PROC 2
>> +
>>   #define N_ALLOC_SIZES    256
>> +#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
>> +
>>   static uint64_t *alloc_sizes;
>>   +struct gem_bo {
>> +    uint32_t handle;
>> +    uint64_t size;
>> +    uint32_t *ptr;
>> +    uint64_t addr;
>> +};
>> +
>> +struct xe_oversubscribe_ctx {
>> +    uint32_t vm_id;
>> +    uint32_t exec_queue_id;
>> +};
>> +
>> +struct mem_bind_sync {
>> +    struct gem_bo *bufs;
>> +    int n_bufs;
>> +    uint64_t *binds_ufence;
>> +};
>> +
>> +struct process_data {
>> +    pthread_mutex_t mutex;
>> +    pthread_cond_t cond;
>> +    int ready;
>> +    int skipped;
>> +    int late_skipped;
>> +    int fault_count;
>> +    int child_completed;
>> +    int bind_oom;
>> +    bool go;
>> +    bool abort;
>> +};
>> +
>> +enum rendezvous_result {
>> +    RENDEZVOUS_READY,
>> +    RENDEZVOUS_LATE,
>> +    RENDEZVOUS_ABORTED,
>> +};
>> +
>>   /*
>>    * Data-driven subtest matrix.
>>    *
>> @@ -100,6 +158,7 @@ enum test_type {
>>       TYPE_RANDOM_SIZE,
>>       TYPE_ARRAY_BIND,
>>       TYPE_THREAD,
>> +    TYPE_OVERSUBSCRIBE,
>>   };
>>     struct test_case {
>> @@ -115,6 +174,14 @@ struct bo_group {
>>       int n_bos;
>>   };
>>   +struct oversubscribe_params {
>> +    int n_proc;
>> +    int n_vram_bufs;
>> +    int n_sram_bufs;
>> +    uint64_t vram_size;
>> +    uint64_t sram_size;
>> +    uint64_t total_vram_demand;
>> +};
>>   #define LEAK_BINDING        (0x1 << 0)
>>   #define LEAK_BO            (0x1 << 1)
>>   #define EVICT            (0x1 << 2)
>> @@ -240,6 +307,565 @@ static int __xe_vm_bind_array(int fd, uint32_t vm,
>>       return 0;
>>   }
>>   +static void init_pdata(struct process_data *pdata)
>> +{
>> +    pthread_mutexattr_t mattr;
>> +    pthread_condattr_t cattr;
>> +
>> +    pthread_mutexattr_init(&mattr);
>> +    igt_assert_eq(pthread_mutexattr_setpshared(&mattr, 
>> PTHREAD_PROCESS_SHARED), 0);
>> +    igt_assert_eq(pthread_mutexattr_setrobust(&mattr, 
>> PTHREAD_MUTEX_ROBUST), 0);
>> +    igt_assert_eq(pthread_mutex_init(&pdata->mutex, &mattr), 0);
>> +    pthread_mutexattr_destroy(&mattr);
>> +
>> +    pthread_condattr_init(&cattr);
>> +    igt_assert_eq(pthread_condattr_setpshared(&cattr, 
>> PTHREAD_PROCESS_SHARED), 0);
>> +    igt_assert_eq(pthread_condattr_setclock(&cattr, 
>> CLOCK_MONOTONIC), 0);
>> +    igt_assert_eq(pthread_cond_init(&pdata->cond, &cattr), 0);
>> +    pthread_condattr_destroy(&cattr);
>> +    pdata->ready = 0;
>> +    pdata->skipped = 0;
>> +    pdata->late_skipped = 0;
>> +    pdata->child_completed = 0;
>> +    pdata->fault_count = 0;
>> +    pdata->bind_oom = 0;
>> +    pdata->go = false;
>> +    pdata->abort = false;
>> +}
>> +
>> +/*
>> + * EOWNERDEAD means the previous owner died holding the robust mutex;
>> + * mark it consistent so this process can continue.
>> + */
>> +static void pdata_lock(struct process_data *pdata)
>> +{
>> +    int ret = pthread_mutex_lock(&pdata->mutex);
>> +
>> +    if (ret == EOWNERDEAD)
>> + igt_assert_eq(pthread_mutex_consistent(&pdata->mutex), 0);
>> +    else
>> +        igt_assert_eq(ret, 0);
>> +}
>> +
>> +static enum rendezvous_result process_ready_and_wait(struct 
>> process_data *pdata)
>> +{
>> +    struct timespec timeout;
>> +    enum rendezvous_result result;
>> +    int ret;
>> +
>> +    pdata_lock(pdata);
>> +    if (pdata->abort) {
>> +        pthread_mutex_unlock(&pdata->mutex);
>> +        return RENDEZVOUS_ABORTED;
>> +    }
>> +    /* Admission closes when the parent releases the ready group. */
>> +    if (pdata->go) {
>> +        pdata->late_skipped++;
>> +        pthread_mutex_unlock(&pdata->mutex);
>> +        return RENDEZVOUS_LATE;
>> +    }
>> +    pdata->ready++;
>> +    pthread_cond_broadcast(&pdata->cond);
>> +    clock_gettime(CLOCK_MONOTONIC, &timeout);
>> +    timeout.tv_sec += 2 * TIMEOUT_NS / NSEC_PER_SEC;
>> +    /* Give the parent time to time out and release the rendezvous 
>> first. */
>> +    while (!pdata->go && !pdata->abort) {
>> +        ret = pthread_cond_timedwait(&pdata->cond, &pdata->mutex, 
>> &timeout);
>> +        if (ret == EOWNERDEAD) {
>> + igt_assert_eq(pthread_mutex_consistent(&pdata->mutex), 0);
>> +            continue;
>> +        }
>> +        if (ret == ETIMEDOUT) {
>> +            pdata->abort = true;
>> +            pdata->skipped++;
>
> pdata->skipped incremented twice. One increment is happening here, 
> another increment during handling of RENDEZVOUS_ABORTED where
>
> process_setup_failed(pdata, true); is called which will make skipped - 
> fault_count wrong. increment skipped once only, it can be removed from 
> ret == ETIMEDOUT

Good finding. Taken care.

>
>> + pthread_cond_broadcast(&pdata->cond);
>> +            break;
>> +        }
>> +        igt_assert_eq(ret, 0);
>> +    }
>> +    result = pdata->abort ? RENDEZVOUS_ABORTED : RENDEZVOUS_READY;
>> +    pthread_mutex_unlock(&pdata->mutex);
>> +    return result;
>> +}
>> +
>> +static void process_setup_failed(struct process_data *pdata, bool 
>> fault)
>> +{
>> +    pdata_lock(pdata);
>> +    /* This will be incremented for all real error / OOM */
>> +    pdata->skipped++;
>> +    if (fault)
>> +        pdata->fault_count++; /* Will be incremented for fault case */
>> +    pthread_cond_broadcast(&pdata->cond);
>> +    pthread_mutex_unlock(&pdata->mutex);
>> +}
>> +
>> +static void release_ready_processes(struct process_data *pdata, int 
>> n_proc)
>> +{
>> +    struct timespec timeout;
>> +    int ret;
>> +
>> +    pdata_lock(pdata);
>> +
>> +    clock_gettime(CLOCK_MONOTONIC, &timeout);
>> +    timeout.tv_sec += TIMEOUT_NS / NSEC_PER_SEC;
>> +    /*
>> +     * Wait until all children have either reached VM Bind rendezvous
>> +     * Or, failed setup and exited the test path.
>> +     */
>> +    while (!pdata->abort && (pdata->ready + pdata->skipped < n_proc)) {
>> +        ret = pthread_cond_timedwait(&pdata->cond, &pdata->mutex, 
>> &timeout);
>> +        if (ret == EOWNERDEAD) {
>> + igt_assert_eq(pthread_mutex_consistent(&pdata->mutex), 0);
>> +            continue; /* re-check loop condition */
>> +        } else if (ret == ETIMEDOUT) {
>> +            igt_warn("Rendezvous timeout: Continuing with %d of %d 
>> children: (skipped=%d)\n",
>> +                 pdata->ready, n_proc, pdata->skipped);
>> +            break;
>> +        }
>> +        igt_assert_eq(ret, 0);
>> +    }
>> +
>> +    /* Release every successful child into VM_Bind at same time */
>> +    pdata->go = true;
>> +    pthread_cond_broadcast(&pdata->cond);
>> +    pthread_mutex_unlock(&pdata->mutex);
>> +}
>> +
>> +static int build_add_batch(struct gem_bo *batch_bo, struct gem_bo 
>> *integers_bo,
>> +               struct gem_bo *result_bo, int ints_to_add)
>> +{
>> +    int pos = 0;
>> +    int i;
>> +    uint64_t tmp_addr;
>> +
>> +    batch_bo->ptr[pos++] = MI_LOAD_REGISTER_MEM_CMD | 
>> MI_LRI_LRM_CS_MMIO | 2;
>> +    batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
>> +    tmp_addr = integers_bo->addr;
>> +    batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
>> +    batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
>> +    for (i = 1; i < ints_to_add; i++) {
>> +        /* r1 = integers_bo[i] */
>> +        batch_bo->ptr[pos++] = MI_LOAD_REGISTER_MEM_CMD | 
>> MI_LRI_LRM_CS_MMIO | 2;
>> +        batch_bo->ptr[pos++] = GPR_RX_ADDR(1);
>> +        tmp_addr = integers_bo->addr + i * sizeof(uint32_t);
>> +        batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
>> +        batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
>> +        /*
>> +         * r0 = r0 + r1. The loads write only the low dword of each 
>> GPR.
>> +         * Each int is rand() % 8 (at most 7), so the sum stays well
>> +         * below 2^32 and never carries into the upper dword.
>> +         */
>> +        batch_bo->ptr[pos++] = MI_MATH(4);
>> +        batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCA, 
>> MI_MATH_REG(0));
>> +        batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCB, 
>> MI_MATH_REG(1));
>> +        batch_bo->ptr[pos++] = MI_MATH_ADD;
>> +        batch_bo->ptr[pos++] = MI_MATH_STORE(MI_MATH_REG(0), 
>> MI_MATH_REG_ACCU);
>> +    }
>> +    /* result_bo[0] = r0 */
>> +    batch_bo->ptr[pos++] = MI_STORE_REGISTER_MEM_GEN8 | 
>> MI_LRI_LRM_CS_MMIO;
>> +    batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
>> +    tmp_addr = result_bo->addr;
>> +    batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
>> +    batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
>> +
>> +    batch_bo->ptr[pos++] = MI_BATCH_BUFFER_END;
>> +    while (pos % 4 != 0)
>> +        batch_bo->ptr[pos++] = MI_NOOP;
>> +    return pos;
>> +}
>> +
>> +static void create_exec_queue(int fd, struct xe_oversubscribe_ctx *ctx)
>> +{
>> +    ctx->exec_queue_id = xe_exec_queue_create(fd, ctx->vm_id,
>> +                          &xe_engine(fd, 0)->instance, 0);
>
> here xe_engine(fd, 0) can give any engine BCS, video b ut the MI_MATH 
> instructions load/store runs on
>
> COPY engine, so use other variant like engine_by_class and get 
> DRM_XE_ENGINE_CLASS_COPY or declare array with
>
> DRM_XE_ENGINE_CLASS_COPY as engine_class
>
Will be taken care.
>> +}
>> +
>> +static uint64_t *
>> +vm_bind_bo_batch(int fd, struct xe_oversubscribe_ctx *ctx, struct 
>> gem_bo *bos, int n_bufs,
>> +         int *out_err)
>> +{
>> +    uint64_t *ufence;
>> +    struct drm_xe_sync bind_sync;
>> +    struct drm_xe_vm_bind_op *binds;
>> +    int i;
>> +
>> +    binds = calloc(n_bufs, sizeof(*binds));
>> +    igt_assert(binds);
>> +
>> +    ufence = calloc(1, sizeof(*ufence));
>> +    igt_assert(ufence);
>> +    bind_sync = (struct drm_xe_sync) {
>> +        .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +        .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +        .addr = to_user_pointer(ufence),
>> +        .timeline_value = 1,
>> +    };
>> +
>> +    for (i = 0; i < n_bufs; i++) {
>> +        binds[i] = (struct drm_xe_vm_bind_op) {
>> +            .obj = bos[i].handle,
>> +            .range = bos[i].size,
>> +            .addr = bos[i].addr,
>> +            .op = DRM_XE_VM_BIND_OP_MAP,
>> +        };
>> +    }
>> +    *out_err = __xe_vm_bind_array(fd, ctx->vm_id, binds, n_bufs, 
>> &bind_sync, 1);
>> +    free(binds);
>> +    return ufence;
>> +}
>> +
>> +/* Returns true if the binds succeeded or there was nothing to bind, 
>> false on an allowed OOM. */
>> +static bool bind_bos(int fd, struct xe_oversubscribe_ctx *ctx, 
>> struct gem_bo *bufs,
>> +            struct mem_bind_sync *bind, int *bind_err, bool allow_oom)
>> +{
>> +    if (!bind->n_bufs)
>> +        return true;
>> +
>> +    bind->binds_ufence = vm_bind_bo_batch(fd, ctx, bufs, 
>> bind->n_bufs, bind_err);
>> +
>> +    if (*bind_err) {
>> +        if (allow_oom) {
>> +            igt_assert_f(*bind_err == -ENOMEM || *bind_err == -ENOSPC,
>> +                     "Unexpected bind error: %d (%s)\n",
>> +                     *bind_err, strerror(-*bind_err));
>> +            igt_debug("Bind failed with expected OOM (%s), skipping 
>> exec\n",
>> +                  strerror(-*bind_err));
>
> This overall can be simplified as there is no need of 
> igt_assert_f(false, ..) below
>
> int err;
>
> bind->binds_ufence = vm_bind_bo_batch(fd, ctx, bufs, bind->n_bufs, &err);
>
> if (err && allow_oom && (err == -ENOMEM || err == -ENOSPC)) {
>
> igt_info("Bind failed with expected OOM (%s), skipping exec\n",
>
> strerror(-err));
>
> return false;
>
> }
>
Good suggestion for optimization.
>> +            return false;
>> +        }
>> +
>> +        igt_assert_f(false, "Unexpected bind error: %d", *bind_err);
>> +    }
>> +
>> +    xe_wait_ufence(fd, bind->binds_ufence, 1, 0, TIMEOUT_NS);
>> +    return true;
>> +}
>> +
>> +static uint32_t fill_random_integers(struct gem_bo *int_bo, int 
>> ints_to_add)
>> +{
>> +    uint32_t expected_result = 0;
>> +    size_t expr_size = 4 * (size_t)ints_to_add + 1;
>> +    char *expr = malloc(expr_size);
>> +    int len = 0;
>> +
>> +    igt_assert(expr);
>> +    for (int i = 0; i < ints_to_add; i++) {
>> +        uint32_t random_int = rand() % 8;
>> +
>> +        int_bo->ptr[i] = random_int;
>> +        expected_result += random_int;
>> +
>> +        len += snprintf(expr + len, expr_size - len, "%s%u",
>> +                i ? " + " : "", random_int);
>> +    }
>> +    igt_debug("%s = %u\n", expr, expected_result);
>> +    free(expr);
>> +    return expected_result;
>> +}
>> +
>> +static void cleanup_bo_resources(int fd, struct gem_bo *bo)
>> +{
>> +    if (bo->ptr) {
>> +        igt_assert_eq(munmap(bo->ptr, bo->size), 0);
>> +        bo->ptr = NULL;
>> +    }
>> +    if (bo->handle)
>> +        gem_close(fd, bo->handle);
>> +}
>> +
>> +static int create_test_bos(int fd, struct xe_oversubscribe_ctx *ctx,
>> +               struct mem_bind_sync *bind, uint32_t placement,
>> +               uint64_t *addr)
>> +{
>> +    const char *mem_type = (placement & vram_memory(fd, 0)) ? "VRAM" 
>> : "SRAM";
>> +    uint32_t create_flags = (placement & vram_memory(fd, 0)) ?
>> +                DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING : 0;
>> +    int ret;
>> +
>> +    for (int i = 0; i < bind->n_bufs; i++) {
>> +        struct gem_bo *bo = &bind->bufs[i];
>> +
>> +        bo->size = GB(1);
>> +        ret = __xe_bo_create_caching(fd, ctx->vm_id, bo->size, 
>> placement, create_flags,
>> +                         DRM_XE_GEM_CPU_CACHING_WC, &bo->handle);
>> +        if (ret) {
>> +            int saved_errno = errno; /* capture before anything can 
>> clobber it */
>
> here reading errno instead of return value from create_caching() 
> function. __xe_bo_create_caching() return errno if fails
>
> and IGT helper may reset errno during other executions, So ret should 
> be checked instead saved_errno
>
> if (ret) {
>
> bind->n_bufs = i;
>
> if (ret == -ENOMEM || ret == -ENOSPC) { ...; break; }
>
> igt_warn("%s allocation failed at buffer %d: %s\n", mem_type, i, 
> strerror(-ret));
>
> return ret;
> }
>
=>  __xe_bo_create_caching returns the raw igt_ioctl result, which is 
drmioctl()'s -1 with errno set, not the errno value . So ret can only 
tell us that it failed.  Thats why errno is copied

into saved_errno right after the call, before any IGT helper can 
overwrite it . xe_vm.c handles overcommit ENOMEM/ENOSPC the same way. If 
you prefer the helper to

return -errno, that would be a seperate lib change touching every caller.

>> +
>> +            bind->n_bufs = i;
>> +            if (saved_errno == ENOMEM || saved_errno == ENOSPC) {
>> +                /* Continue on OOM, expected when oversubscribing 
>> the VM */
>> +                igt_debug("%s allocation failed at buffer %d 
>> (OOM)\n", mem_type, i);
> use igt_info(), if it fails user will know the reason
>> +                break;
>> +            }
>> +            /* We are returning as this is a fail scenario */
>> +            igt_warn("%s allocation failed at buffer %d: %s\n",
>> +                 mem_type, i, strerror(saved_errno));
>> +            return -saved_errno;
>> +        }
>> +        bo->ptr = NULL;
>> +        bo->addr = *addr;
>> +        *addr += bo->size;
>> +        igt_debug("%s buffer %d created at 0x%016lx\n", mem_type, i, 
>> bo->addr);
>> +    }
>> +    return 0;
>> +}
>> +
>> +static void cleanup_sram_vram_objs(int fd, struct mem_bind_sync 
>> *vram_bind,
>> +                   struct mem_bind_sync *sram_bind)
>> +{
>> +    for (int i = 0; i < vram_bind->n_bufs; i++)
>> +        cleanup_bo_resources(fd, &vram_bind->bufs[i]);
>> +    for (int i = 0; i < sram_bind->n_bufs; i++)
>> +        cleanup_bo_resources(fd, &sram_bind->bufs[i]);
>> +    free(vram_bind->bufs);
>> +    free(sram_bind->bufs);
>> +    if (vram_bind->binds_ufence)
>> +        free(vram_bind->binds_ufence);
>> +    if (sram_bind->binds_ufence)
>> +        free(sram_bind->binds_ufence);
>> +}
>> +
>> +static void create_bo(int fd, uint32_t vm, struct gem_bo *bo, 
>> uint64_t size,
>> +              uint64_t addr, bool map_now)
>> +{
>> +    bo->size = ALIGN(size, 4096);
>> +    bo->handle = xe_bo_create_caching(fd, vm, bo->size, 
>> system_memory(fd), 0,
>> +                      DRM_XE_GEM_CPU_CACHING_WC);
>> +    igt_assert(bo->handle);
>> +    bo->addr = addr;
>> +    if (map_now) {
>> +        bo->ptr = xe_bo_map(fd, bo->handle, bo->size);
>> +        igt_assert(bo->ptr != MAP_FAILED);
>> +    } else {
>> +        bo->ptr = NULL;
>> +    }
>> +}
>> +
>> +static bool calc_oversubscribe_params(int fd, struct 
>> oversubscribe_params *p)
>> +{
>> +    uint64_t target_vram, target_sram;
>> +    uint64_t total_vram_bufs, total_sram_bufs, max_by_mem;
>> +
>> +    p->vram_size =  xe_visible_available_vram_size(fd, 0);
>> +    p->sram_size = (uint64_t)igt_get_avail_ram_mb() << 20;
>> +    /*
>> +     * Dynamically cap VRAM oversubscription so the overflow into 
>> system
>> +     * RAM stays within 25% of available RAM. Combined with the system
>> +     * RAM allocation target of up to 50%, this budgets at most 75% of
>> +     * available RAM, leaving at least 25% headroom. On small-VRAM
>> +     * platforms the 2x target fits within the cap and behavior is
>> +     * unchanged; on large-VRAM platforms (e.g. PVC) this reduces 
>> OOM risk.
>> +     */
>> +
>> +    target_vram = min(p->vram_size * 2, p->vram_size + p->sram_size 
>> / 4);
>> +    target_sram = min_t(uint64_t, p->sram_size * 50 / 100,
>> +                MAX_SRAM_TEST_SIZE);
>> +    total_vram_bufs = target_vram / GB(1);
>> +    total_sram_bufs = target_sram / GB(1);
>> +    max_by_mem = min(total_vram_bufs / MIN_BUFS_PER_PROC,
>> +             total_sram_bufs / MIN_BUFS_PER_PROC);
>> +
>> +    p->n_proc = min_t(int, max_by_mem, MAX_PROCS);
>> +    /* Ensure we have minimum of 2 process */
>> +    if (p->n_proc < 2) {
>> +        igt_info("At least 2 processes are required for 
>> oversubscription.\n");
>> +        return false;
>> +    }
>> +    p->n_vram_bufs = max_t(int, 2, total_vram_bufs / p->n_proc);
>> +    p->n_sram_bufs = max_t(int, 2, total_sram_bufs / p->n_proc);
>> +    p->total_vram_demand = (uint64_t)p->n_proc * p->n_vram_bufs * 
>> GB(1);
>> +    return true;
>> +}
>> +
>> +static void test_vm_oversubscribe_concurrent_bind(int fd)
>> +{
>> +    struct oversubscribe_params p;
>> +    struct process_data *pdata;
>> +
>> +    igt_require_f(calc_oversubscribe_params(fd, &p),
>> +              "Not enough VRAM/RAM for oversubscription test\n");
>> +    igt_debug("VRAM size: %" PRIu64 "MB, System RAM available: %" 
>> PRIu64 "MB\n",
>> +          p.vram_size >> 20, p.sram_size >> 20);
>> +
>> +    igt_debug("n_proc = %d\n", p.n_proc);
>> +    igt_debug("VRAM: %" PRIu64 "GB\n", p.vram_size >> 30);
>> +    igt_debug("VRAM demand: %" PRIu64 "MB (%.2fx oversubscription)\n",
>> +          p.total_vram_demand >> 20, (double)p.total_vram_demand / 
>> p.vram_size);
>> +    igt_debug("Processes=%d VRAM_bufs=%d SRAM_bufs=%d\n", p.n_proc,
>> +          p.n_vram_bufs, p.n_sram_bufs);
>> +
>> +    pdata = mmap(NULL, sizeof(*pdata), PROT_READ | PROT_WRITE,
>> +             MAP_SHARED | MAP_ANONYMOUS, -1, 0);
>> +    igt_assert(pdata != MAP_FAILED);
>> +    init_pdata(pdata);
>> +
>> +    igt_fork(child, p.n_proc) {
>> +        struct xe_oversubscribe_ctx ctx = {0};
>> +        int rc, ret, fd_c;
>> +        uint64_t addr = STRESS_BIND_ADDR;
>> +        uint32_t expected_result = 0;
>> +        struct gem_bo integers_bo = {0}, result_bo = {0}, batch_bo = 
>> {0};
>> +        struct gem_bo *vram_bufs, *sram_bufs;
>> +        int pos = 0;
>> +        struct mem_bind_sync vram_bind = {0};
>> +        struct mem_bind_sync sram_bind = {0};
>> +        struct drm_xe_sync batch_syncs[1];
>> +        struct drm_xe_exec exec;
>> +        struct gem_bo ufence_bo = {0};
>> +        int vram_bind_err = 0, sram_bind_err = 0;
>> +
>> +        vram_bufs = calloc(p.n_vram_bufs, sizeof(*vram_bufs));
>> +        sram_bufs = calloc(p.n_sram_bufs, sizeof(*sram_bufs));
>> +        srand(child);
>> +
>> +        fd_c = drm_open_driver(DRIVER_XE);
>> +
>> +        igt_assert(vram_bufs && sram_bufs);
> use this before srand(child) to save instructions if vram_bufs and 
> sram_bufs is 0
Agreed.
>> +
>> +        ctx.vm_id = xe_vm_create(fd_c, 
>> DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>> +        create_exec_queue(fd_c, &ctx);
>> +        vram_bind.bufs = vram_bufs;
>> +        vram_bind.n_bufs = p.n_vram_bufs;
>> +        sram_bind.bufs = sram_bufs;
>> +        sram_bind.n_bufs = p.n_sram_bufs;
>> +
>> +        ret = create_test_bos(fd_c, &ctx, &vram_bind, 
>> vram_memory(fd_c, 0), &addr);
>
> use DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM in bo creation as 
> calc_oversubscribe_params() uses xe_visible_available_vram_size()
>
> and without NEEDS_VISIBLE_VRAM flag bo can land anywhere in VRAM
>
This was derived from the another test so it was using
>> +        if (ret) {
>> +            igt_debug("Child process failed while bo creation in 
>> VRAM");
> use ig_info()
>> +            process_setup_failed(pdata, true);
>> +            goto cleanup;
>> +        }
>> +
>> +        ret = create_test_bos(fd_c, &ctx, &sram_bind, 
>> system_memory(fd_c), &addr);
>> +        if (ret) {
>> +            igt_debug("Child process failed while bo creation in 
>> SRAM");
> use igt_info()
>> +            process_setup_failed(pdata, true);
>> +            goto cleanup;
>> +        }
>> +
>> +        if (!vram_bind.n_bufs || !sram_bind.n_bufs) {
>> +            /* Skipping test as we are running out of memory
>> +             * We will keep track in the pdata->skipped count
>> +             */
>> +            igt_debug("Skipping No BOs allocated; VRAM/SRAM 
>> unavailable\n");
> use igt_info()
>> +            process_setup_failed(pdata, false);
>> +            goto cleanup;
>> +        }
>> +
>> +        /*
>> +         * All allocations are complete. Report Ready and wait until 
>> every
>> +         * child has either reached this point or reported a setup 
>> failure,
>> +         * or the parent times out and releases the ready group.
>> +         */
>> +
>> +        switch (process_ready_and_wait(pdata)) {
>> +        case RENDEZVOUS_LATE:
>> +            igt_info("Child %d missed rendezvous release, skipping 
>> bind + exec\n",
>> +                 child);
>> +            goto cleanup;
>> +        case RENDEZVOUS_ABORTED:
>> +            igt_debug("Rendezvous aborted/timed out, skipping bind + 
>> exec\n");
> use igt_info()
>> +            process_setup_failed(pdata, true);
>> +            goto cleanup;
>> +        case RENDEZVOUS_READY:
>> +            break;
>> +        }
>> +        /*
>> +         * VM_Bind starts only after the parent signal all ready
>> +         * children.
>> +         */
>> +        if (!bind_bos(fd_c, &ctx, vram_bufs, &vram_bind, 
>> &vram_bind_err, true)) {
>> +            pdata_lock(pdata);
>> +            pdata->bind_oom++;
>> +            pthread_mutex_unlock(&pdata->mutex);
>> +            goto cleanup;
>> +        }
>> +
>> +        if (!bind_bos(fd_c, &ctx, sram_bufs, &sram_bind, 
>> &sram_bind_err, false)) {
>
> An SRAM bind failure crashes the child, and its handler never runs, it 
> asserts and return false never reached which leads to dead code below
>
> either remove dead code or return true for SRAM
>
>> +            pdata_lock(pdata);
>> +            pdata->bind_oom++;
>> +            pthread_mutex_unlock(&pdata->mutex);
>> +            goto cleanup;
>> +        }
>> +

SRAM bind is called with allow_oom = true , it can cause ENOMEM/ ENOSPC 
/ ENOBUF so will be enabled for oom.


>> +        create_bo(fd_c, ctx.vm_id, &integers_bo, 4096, 
>> EXEC_DATA_ADDR, true);
>> +        expected_result = fill_random_integers(&integers_bo, 
>> INT_ADD_CNT);
>> +        create_bo(fd_c, ctx.vm_id, &result_bo, 4096, 
>> EXEC_RESULT_ADDR, false);
>> +        create_bo(fd_c, ctx.vm_id, &batch_bo, 4096, EXEC_BATCH_ADDR, 
>> true);
>> +        pos = build_add_batch(&batch_bo, &integers_bo, &result_bo, 
>> INT_ADD_CNT);
>
> exec not touching the oversubscribed BOs? The description says 
> "validate successful binds with an exec"
>
> but here the batch only reads integers_bo and writes result_bo. The 1 
> GB VRAM and SRAM BOs are never accessed, so data integrity after 
> eviction and rebind isn't checked.
>
> Should be batch store or load instruction in vram_bufs[i].addr and 
> sram_bufs[i].addr and then value should be checked.  like store DWORD 
> in BO gpu addrees space and later check with cpu mapping
>
Good suggestion . Actually this test was created focussed on this 
https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/6268

where we will do oversubscribe bind and check with smaller BOs

will be accepting this request and create BOs where the batch is written 
and it will be verified later.

>> +
>> +        igt_assert(pos * sizeof(int) <= batch_bo.size);
>> +
>> +        xe_vm_bind_lr_sync(fd_c, ctx.vm_id, integers_bo.handle, 0, 
>> integers_bo.addr,
>> +                   integers_bo.size, 0);
>> +        xe_vm_bind_lr_sync(fd_c, ctx.vm_id, result_bo.handle, 0, 
>> result_bo.addr,
>> +                   result_bo.size, 0);
>> +        xe_vm_bind_lr_sync(fd_c, ctx.vm_id, batch_bo.handle, 0, 
>> batch_bo.addr,
>> +                   batch_bo.size, 0);
>> +        create_bo(fd_c, ctx.vm_id, &ufence_bo, 4096, 
>> EXEC_UFENCE_ADDR, true);
>> +
>> +        memset(ufence_bo.ptr, 0, ufence_bo.size);
>> +        xe_vm_bind_lr_sync(fd_c, ctx.vm_id, ufence_bo.handle, 0, 
>> ufence_bo.addr,
>> +                   ufence_bo.size, 0);
>> +
>> +        batch_syncs[0] = (struct drm_xe_sync){
>> +            .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +            .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +            .addr = ufence_bo.addr,
>> +            .timeline_value = USER_FENCE_VALUE,
>> +        };
>> +
>> +        exec = (struct drm_xe_exec) {
>> +            .exec_queue_id = ctx.exec_queue_id,
>> +            .num_syncs = 1,
>> +            .syncs = (uintptr_t)batch_syncs,
>> +            .address = batch_bo.addr,
>> +            .num_batch_buffer = 1,
>> +        };
>> +
>> +        rc = igt_ioctl(fd_c, DRM_IOCTL_XE_EXEC, &exec);
>> +        igt_assert_f(rc == 0, "xe_exec failed unexpectedly: %s (%d)\n",
>> +                 strerror(errno), errno);
>> +        xe_wait_ufence(fd_c, (uint64_t *)ufence_bo.ptr, 
>> USER_FENCE_VALUE, ctx.exec_queue_id,
>> +                   TIMEOUT_NS);
>> +        result_bo.ptr = xe_bo_map(fd_c, result_bo.handle, 
>> result_bo.size);
>> +        igt_assert(result_bo.ptr != MAP_FAILED);
>> +        igt_assert_eq(result_bo.ptr[0], expected_result);
>> +        pdata_lock(pdata);
>> +        pdata->child_completed++;
>> +        pthread_mutex_unlock(&pdata->mutex);
>> +cleanup:
>> +        cleanup_bo_resources(fd_c, &ufence_bo);
>> +        cleanup_bo_resources(fd_c, &result_bo);
>> +        cleanup_bo_resources(fd_c, &batch_bo);
>> +        cleanup_bo_resources(fd_c, &integers_bo);
>> +        cleanup_sram_vram_objs(fd_c, &vram_bind, &sram_bind);
>> +        xe_exec_queue_destroy(fd_c, ctx.exec_queue_id);
>> +        xe_vm_destroy(fd_c, ctx.vm_id);
>> +        drm_close_driver(fd_c);
>> +    }
>> +
>> +    release_ready_processes(pdata, p.n_proc);
>> +    /* Wait for 60 sec to kill the hanging child process */
>> +    igt_waitchildren_timeout(60, "Oversubscription child failed");
> gives each child 60 seconds. But one child can wait up to 30 seconds 
> (TIMEOUT_NS) in three separate places:
>
> the VRAM bind fence, the SRAM bind fence and the exec fence. Parent's 
> rendezvous can also add few more seconds
>
> if VRAM is overcommitted there can be evictions during bind operation 
> which can take time and the healthy children gets killed
>
> consider timing udget for worst case like something
>
> igt_waitchildren_timeout(4 or 5 * TIMEOUT_NS / NSEC_PER_SEC, 
> "Oversubscription child failed");
>
Good suggestion: Will be keeping  5 * TIMEOUT_NS / NSEC_PER_SEC
>
>> +    igt_assert_f(!pdata->abort, "Child rendezvous wait timed out\n");
>> +    igt_assert_f(pdata->fault_count == 0, "%d children hit fault", 
>> pdata->fault_count);
>> +
>> +    igt_assert_f(pdata->child_completed >= 2,
>> +             "Expected at least 2 children to complete exec+verify, 
>> got %d of %d processes (bind_oom=%d)\n",
>> +             pdata->child_completed, p.n_proc, pdata->bind_oom);
>> +    igt_reset_timeout();
>
> clean-up is skipped when the parent's checks fail
>
> igt_assert_f(!pdata->abort ...), the fault_count check and the 
> child_completed check all run before
>
> pthread_cond_destroy, pthread_mutex_destroy and munmap(pdata). 
> igt_reset_timeout() also runs after the asserts.
>
> Should be something like print the summary, handling of counters, 
> clean up, and assert. igt_reset_timeout() should be called after 
> igt_waitchildren_timeout().
>
=> Actually when igt assert happens the process is killed ,. Will be 
moving the igt_assert in the end.
>> +    igt_info("Oversubscribe summary : %d processes\n", p.n_proc);
>> +    igt_info("=> Faulted Process(unexpected error): %d\n", 
>> pdata->fault_count);
>> +    igt_info("=> Skipped during setup (OOM cases) %d\n", 
>> pdata->skipped - pdata->fault_count);
>> +    igt_info("=> Skipped during Rendezvous (late arrivals) %d\n", 
>> pdata->late_skipped);
>> +    igt_info("=> Bind failed (ENOMEM/ENOSPC) %d\n", pdata->bind_oom);
>> +    igt_info("Successfully completed oversubscription process (exec 
>> + verify)  %d\n",
>> +         pdata->child_completed);
>> +    pthread_cond_destroy(&pdata->cond);
>> +    pthread_mutex_destroy(&pdata->mutex);
>> +    igt_assert_eq(munmap(pdata, sizeof(*pdata)), 0);
>> +}
>> +
>>   static void alloc_sizes_init(void)
>>   {
>>       int i;
>> @@ -903,6 +1529,16 @@ static void run_gt_dynamic_subtests(int fd, 
>> const struct test_case *t)
>>    * Data-driven subtest matrix.
>>    *
>>    * Each entry becomes a subtest with one dynamic child per GT.
>> + * TYPE_ALL_SIZES / TYPE_RANDOM_SIZE / TYPE_ARRAY_BIND all exercise 
>> exactly one
>> + * engine per invocation, so they're wired up as a dynamic child 
>> subtest
>> + * per engine below (igt_subtest_with_dynamic_f() + igt_dynamic_f()).
>> + *
>> + * TYPE_THREAD are deliberately NOT split per engine here:
>> + * threads() already do their own xe_for_each_engine() to spawn one 
>> thread per
>> + * engine internally. Wrapping those in a  second, outer per-engine 
>> loop would
>> + * run the full all-engine fan-out once for every engine on the 
>> machine,
>> + * multiplying the runtime by the engine count and re-exercising 
>> every engine
>> + * N times over. So these stay flat, single subtests.
>>    */
>>     static const struct test_case test_matrix[] = {
>> @@ -920,6 +1556,7 @@ static const struct test_case test_matrix[] = {
>>       { "threads-leak-binding-rand-sizes-50", 50, LEAK_BINDING, 
>> TYPE_THREAD, false },
>>       { "threads-leak-binding-rand-sizes-50-unaligned", 50, 
>> LEAK_BINDING | UNALIGNED,
>>          TYPE_THREAD, false },
>> +    { "vm-oversubscribe-concurrent-bind", 0, 0, TYPE_OVERSUBSCRIBE, 
>> false },
>>   };
>>     int igt_main()
>> @@ -945,6 +1582,10 @@ int igt_main()
>>                   run_threaded_bo_alloc_test(fd, t->count, t->flags);
>>               }
>>               break;
>> +        case TYPE_OVERSUBSCRIBE:
>> +            igt_subtest_f("%s", t->name)
>> +                test_vm_oversubscribe_concurrent_bind(fd);
>> +            break;
>>           case TYPE_ALL_SIZES:
>>           case TYPE_RANDOM_SIZE:
>>           case TYPE_ARRAY_BIND:
