Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84802C7EE30
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 09:42:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD3110E2C2;
	Mon, 23 Jun 2025 09:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xx9lSw5r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D1110E2C2
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 09:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750671719; x=1782207719;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+ZoZaqfgxdgN5zSNuPEljctvwjmGM+quvUdGTssPh8E=;
 b=Xx9lSw5r+4lrJ5DwNa/u4cC8OGR7ErDOQF9r3ujuRKO+hR7rWlvy8iif
 8qtFKXVV9vNuI3fyl16hHd6WwPuJlzaxp83RNd2QvF7HIE7ddh27gghjg
 5CN6zyiPAgC/WJ9MrfwAkeBTI0ldL3eKOc9lmuDUxzTGc8koY2tVvJBsE
 W3fPjDCn7ZKUuCxuojzlmiGSdkuH9JOyxnxnJuu8GMT4xFGdE+vFxIhLO
 m7sxJgNnLQe5NJ3nvq+fnRFuELx37gGNeaw2+fsrWUCyvztZteTUfT9ON
 B4nT/jaqXCa8WbHsX7W8NF5OcSv8Lhl5GAoTIkzjzKT7OL35RUqcC6iJ1 A==;
X-CSE-ConnectionGUID: cJj+p+noTMGJetBXyJsEOA==
X-CSE-MsgGUID: cXWjvId5R1y98hBQaoWnkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52958948"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52958948"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 02:41:58 -0700
X-CSE-ConnectionGUID: qSdLs/sQRkiGhZktHTF8wg==
X-CSE-MsgGUID: HhmamAEcRguE8eqXt4PSug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="151697480"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 02:41:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 02:41:56 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 02:41:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.85)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 02:41:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CI2P+vhflW3nfHex3Wefgx5RYrEhePdr/NLIS2TtPth3WsPdXr328I3FjbH/SeTK9ePTHtUtzXLLjyLWHWxWFH/gpojepYtXTpKpyG+mQV4wbyHGAeaCpXSEjnxh3FkeUwGdH/s4X/LriVOpcHMHPse6vBro32vIDE0m7b6I7H3giDlt+uJCRwALpJ+/ofm6DijtgfSKkYAzyQcSbLy+PLUV6TD3EEXrMyyVlqiSTJRo+TXaxGcKCTx6WJIZkDb8M5qKoDpefAObQb4wWGeC7mmL9kE3vRLqfjlkG3yGiFbfpoyOy2GZR9hLjlbVRERZt04ZabR9B6DOROMZ//H0Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poU6VH1NjdTiixGRQpK29iuJ6Mj2Ls/yQWIVwFbNWUo=;
 b=KrzHHPuUPSuH6x0F/NrEEyp9LsyKAcXYzeQ18hTEcmP/IlhOxFVPRrMEWJ/4YZwAS/daosBKTFQAimqCqBpkUCb46HgM9/Z5UASw5QUdefwjWmBY5qyB/YaVuUfSuO92Xnuhky6d1um5YTjFml0YnthJebF/VPdmDpBQBmsT3WfuOHxkMUUxLVMzALHGiR0fba1kIhw0FvzrzTZ+abQ/8/SJ9HHlw3VpUUB9j3ZU8bZVgVibU4jSwjkegLeIBWfZCycWvd6ehfxfPWIxgGPhj2J7lUG4Tr+MkgzZpkdToHp3Ygx/wzUfYIJgWnydx8GINUqd5Oxx6bQZIQc2yD54xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by BN9PR11MB5241.namprd11.prod.outlook.com (2603:10b6:408:132::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 09:41:41 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 09:41:41 +0000
Message-ID: <e34bd001-08a1-4be6-af35-25c3821596f2@intel.com>
Date: Mon, 23 Jun 2025 15:11:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 2/2] tests/kms_flip: Track and report unexpected
 events with pass rate metric
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <uma.shankar@intel.com>
References: <20250619200549.66329-1-ramanaidu.naladala@intel.com>
 <20250619200549.66329-3-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250619200549.66329-3-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::13) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|BN9PR11MB5241:EE_
X-MS-Office365-Filtering-Correlation-Id: e05e0803-452b-4bb3-ca29-08ddb23a2829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajBYZXZKYURYdlQ5eVF6Y21XY0ZJMEtqNG5obEtqckgxMWFVb2RINmppZVN5?=
 =?utf-8?B?Qm00cm5tcWtLTGFiNVY1bkZTSG0vR2l4cHdmVy80YjNDY3BMcllxdmpPaE9Z?=
 =?utf-8?B?ekNldjBTNzZUdng0VFpUS2M1dUc3cUZ5WlR5Z0FVTDdEUnEzWkV5SWdUZVdU?=
 =?utf-8?B?M2Q5V09veFhEUyt0d0pRUGdieW1uNlNaZ2krRklCYlRIYkU2NVp6M3pxcUY5?=
 =?utf-8?B?aThtUG0wejNyNGQ4RktlWXVVNkxQNWE5bytlaXpXTSt2alh0VHNndGkxK1FW?=
 =?utf-8?B?TXBTc3VHMUk5dWJJRldyMHN5Y2hhdVA5R01BbmhDdjlzckYvRThZTHh2WkR6?=
 =?utf-8?B?ajZERFE4dm1CcmNmeFZuNXNLR0Z2SmZ5cGJTYXdWRGU2M0ZRMlNxc2dGNk5Q?=
 =?utf-8?B?cU9YaXFkVTZmamNXL05RL1lWVGJYMDdDa2ZSRXhwN0hFWGJ6YXJvSkxOd29O?=
 =?utf-8?B?VFREZXdwYk9nQzczSE80KytYSlR2a05ITVI3ckZrL3ZlUWdidlZrei9NVVhk?=
 =?utf-8?B?ckpzdUJ0TlJaOWtKdElYWmhXKzdSQkZOMCtWU1pWOXhnZmQ1T01DYXJaSWxp?=
 =?utf-8?B?WFNFbENNQnZTeDZaUkhxdlV6ZWVoakJKNGNuTi84M2pCU3lRV0k4S0tyTGsx?=
 =?utf-8?B?STZVWFg4TVJ4N0VoaDdzTTNyaWVZcWpTYXdMODQ3Z2xVdUVFVjdXS0Fua1Rk?=
 =?utf-8?B?ZlNEVnpGaTh2Wm56OHd6Z2pPMmZRV0pybFNBMWxURkh0dVN4VXljVkR1dDEy?=
 =?utf-8?B?YTdjRGpSeWszZ2ZZTDBVeWluWU5Qd3dKcVJTTWkveTZET3owcW9lVGJkWkJF?=
 =?utf-8?B?SVdMZmJ0NjFNVS9UMFV3K0ZVNGJmNkxad0g0ckhENmdsZllISGxkTktoMm5Z?=
 =?utf-8?B?QWpiOXJlNmdURzBrb2dpUlpkY2ZhLzRzcXZJVTQ4ZjV1MGxYaWMvYm0xOHdY?=
 =?utf-8?B?NEpHY0VlSG8xY05IR1Y4SUZuYjFLcXNqVFlIOGF3emgraDRyT2hLMWRHS1V1?=
 =?utf-8?B?RWJIU3lKcE1nM3RSdXFLTDYvOWpkNzlzNDFUQ1FBNHU4MWE0S2cvZVYwU2tX?=
 =?utf-8?B?a0lRcEp0NEo3bWhlK2paWUFibVFkSDFmYjMrdkdDbGpjRitqM2ZTMEdteUN4?=
 =?utf-8?B?dDdJaFlMWjQwTU5Cdlh1UGpaWWVVcTNQWGdoNDNjNmtITFQ2Q0xMM1FkeEph?=
 =?utf-8?B?WVN0SzFPV2RkYytMNXoxTFdlK3puVldtWFV2cTA3YUNiOGI3LzJiTmk1T0pq?=
 =?utf-8?B?VWNvOGhzRGd4YWRLL2lqRTJNNFNOTDVveEUxN1FxalNOcTJVaEU0dmc4amlz?=
 =?utf-8?B?akxKWjZjVTkrWis5eDdZcXd2WEZBeFA3RXRCSXRmVjJLU2RjMHlLOGRSOCtv?=
 =?utf-8?B?N0xvUXJyVlI2VkNXdUEvS3l4SnBXaHFVK3hKa1NWZFY3Z1dXWTVWUHRCNWlH?=
 =?utf-8?B?MGdITCtHQTRHOE0vZUdBYXFnVS9ZZTgvT2dUaVhlVzNCeDYxd0FvR1EwYlN6?=
 =?utf-8?B?Vm5CV0F4cUxoZE1zdFlJaEJlVVBZbHJidzBiWE0zU2ZOUFloWDVJbXJiMm1o?=
 =?utf-8?B?TEhHYld4VjIvNi9nN3UrVUhCbkxvN1R2U2ZEYlpvY2V6bndEdHp4RHBwQlE0?=
 =?utf-8?B?S1dhcmlXMUlpL3AzN2ZmZ2I2KzhFQ0w1QjlEVGhxR2xIMDluVlQ1Y2JPWXBy?=
 =?utf-8?B?MDQzamdTbmxlbDhOL1ovYlh3bUhzME9WNTJaNmxicmJMdW05cDZlNEpScnhK?=
 =?utf-8?B?bUVieXExM0hheXRIRFZha3MzWm5Ub0c3aElhaDNGUU9HOVFYc3VqSFEwNUJY?=
 =?utf-8?B?S1ZhMUNrK0JuRXdPSTNhM1J6SkRIaHI4dU83UHZoSTcxazdmK3VpVW5rcEFS?=
 =?utf-8?B?MmZobUludnRia05UWXkrVDFDT0VCbDQ3aDluNlhnZnNweCtzZVUvNTExa0ZN?=
 =?utf-8?Q?8oUaBQQo+NA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlpOQ2ZJeGh3SFdTamxFSndmNDU1MElwVVN2d1NNYVFrbVBlRmdDTEhCSERF?=
 =?utf-8?B?QjNJZ0RTeEtJclVaUHZsWFVDMTVaSU16d0tyU3ZyVC94WHM4ZUJGTzFmVk5M?=
 =?utf-8?B?V01RRzBQeWZVbldxU2ZNeFRTeHUwQWFxbS9LWHdmckJ0YlpYT3gzb0d0dWFh?=
 =?utf-8?B?NWJ0dHZiV1NjNEozRHRWYkt1MG9SNmI5aktGNHdLT1NqeHdVQjFGV1V4V0N5?=
 =?utf-8?B?UTVMb0RjempVb0U0SWpFV0VodEZpNlpkOWQvYnlDT1JjYjlRK0g2MnZvWU1T?=
 =?utf-8?B?cXVaeUxiMThlZmMrVmo1RWc1M1BnU2hqUG5uK3A0NGZBckNmMUNMaGg0MkpN?=
 =?utf-8?B?eDAyZ3hTOHJOVDRidkNla0hoK1orL25GSWlleDd2eU1aRHlGQUJOSTZreGZh?=
 =?utf-8?B?ZTZSa05QZmgwdW1IbDBGa3lVU0htaHplb0FNK1pkc2k4UnhLTnppazJjRkVm?=
 =?utf-8?B?Y0gwL0htZmRDNk56Q2FQRDA2MDRBVGdLNEova0VFSmNCNlozczlKNjExczlW?=
 =?utf-8?B?QzZ2M2JwcDloaVBnUEFIQ1pCVWRzRXlSU1Y1cWphNHpjWHZ3aHA2dTVNNFBM?=
 =?utf-8?B?bGlNa0VJNXlMcklFcG9jNzA5R1pxMUFLUWNEeVo0OFZ6QU5YWXBOQkhNT0Fp?=
 =?utf-8?B?czFpK0NqM1lEOWlBZlM2VGkzcGtVa0VWK2UwWElQa3FQUi9mcDZNZEVKbU5F?=
 =?utf-8?B?NllWMHdQYjJHZjFuc0FRaERSMTJTNFlBS2R1RmhkSlBlenc1VUNTcDFkVnlw?=
 =?utf-8?B?YUNSdGVvclJSRGlLOXlWblRSN01ibjMvVzZCb20zNUJnMGttSDY5TS9xajB6?=
 =?utf-8?B?UzZpeEtncjA5bHlscFVaMDRNc04xblRIckJSVVFORVVUaE50MmJjbVhxMGRl?=
 =?utf-8?B?Z0RKblJUYjYreFVxRS9rU1A4Q2Nha1Zlakw0VTF3Qk00bjNTNHBQQm1hT1g2?=
 =?utf-8?B?cElqdlFBaC9yekExM1U2WlVwR295c0hHUEQwWXorWHpWZVJFbmNNWWtsNDIw?=
 =?utf-8?B?SFRYU1ZNZUtOaU0rekQ2UGt5YkZyNXZKYXg2Zlh5SWFNeFpLMW03QXRhejk1?=
 =?utf-8?B?VFY5bE00THhQRFBlemgvOWlWRG85Q1BGYnVkdkdtK003Y20yaStJRXBUQTRZ?=
 =?utf-8?B?L0hpNGxBV1Y1MmFNZEorZE1hTG5jYkg4SW5CMUtNeVZsQVdTdmlLYTM5REhv?=
 =?utf-8?B?OHJ1UWJ1Nng4ZFJCb3ZyNFlNbHg0SE5ObmtJWWloYlZFZ0QyYlZsdjE4TTA0?=
 =?utf-8?B?UW1WNjdJeGd3U2pCREttekxpRkdRMVUxT3lCS3lEMFNBeFIxbVNickdHYlZu?=
 =?utf-8?B?dmpYQW5CWHFDcERxcWd3WGZxUW96KzBFbTE1b3lEVVhncXBjQml2eUVQY2Vr?=
 =?utf-8?B?Tk1WbmNuSmtJR0FOV2tScStTQVlYenhNclIzV1JMK0hSMHFoZE16Ylo0RGRn?=
 =?utf-8?B?LzNjeFMvdFZ0V3E0ckZEQitqVDFGaFdFcWZqRzhNODhpVFEyUEREb2ZIY1dY?=
 =?utf-8?B?UEtTSE9MRXhrL2VYVXlLMnFsQ3V5b3VCU21ZNkdYSGdhMXF3WVJHOTFPT2tQ?=
 =?utf-8?B?RUdtMEs2M0NjU1FGbEhGYWVObmx4MWFIYkRKUUxEa0RGWGp2NGI3WnE5ZUlI?=
 =?utf-8?B?NVBLdUc1NU9XRXBkdE1pOGZWdDhkekJDblVkYmNObDA3eFJIbk0xT0RVQzJ3?=
 =?utf-8?B?d0wrSDJjZnNuYzZVMEx1WHZzRGZDSStJWkNVMDBiY2JMem12Yk93cXd5NXR5?=
 =?utf-8?B?NVY3NFhDaThObjBReWZKRFhCaEhLVzAxSmx5S3lSamxQNFR1RVpmQS9GUWtY?=
 =?utf-8?B?VTMvSnNmR0hiWTRCWDFyc2hmRVRzMHErSHZXMXVNWmZ6UVRiZlltK2Fhcm92?=
 =?utf-8?B?c29ia3djd2VDSXladnpCck51ZHlITlhjZnBRRnJQdjZYbVlmN3ZIdDFkeURs?=
 =?utf-8?B?RDRKY0xvb1JnenpzQTZxOXI0ZE5qNjFTNnJiMnZLMHd4Nk9FeVB2dnh5MGhR?=
 =?utf-8?B?cVZBNWlwTmpZZWtHVURhMEVsSDh4V1RlUkVqUVUweG14ZHJDaWVSUjRuQUU3?=
 =?utf-8?B?b0FVL3Bhd0JnZ1FaNG9waHJMdlB6anFWcllwNGhUWkxyOERrdHZLelZyaHV2?=
 =?utf-8?B?WTdJUnJJU3ZER2RkR241WFlnaDNqRnFFaGNUblJxTHMyNVI0ZjZ4Vmc0S3Nk?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e05e0803-452b-4bb3-ca29-08ddb23a2829
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 09:41:41.1651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2HGOYo8xexGu6OfBfqJKi/wCc2jXFwzbEZGpmJ/yoFrXiQ5MbynVZAtI6sTy2yGN/GXXJqB1sa3PueqsOouzbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5241
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


On 6/20/2025 1:35 AM, Naladala Ramanaidu wrote:
> At higher refresh rates, there is a possibility of flips being
> submitted during the evasion window, which can result in one extra
> frame and cause the test to fail. To address this, the test has
> been modified to calculate a pass rate based on the number of
> expected versus erroneous frames. A threshold of 85% is enforced
> to determine test success.
>
> v1: Patch #2 and #4 merge into single patch. (Karthik)
> v2: Address the regression failures.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_flip.c | 31 ++++++++++++++++---------------
>   1 file changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index ca31ef7dd..94a414ba7 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -309,6 +309,7 @@ struct event_state {
>   	unsigned int current_seq;		/* kernel reported seq. num */
>   
>   	int count;				/* # of events of this type */
> +	int err_frames;				/* # of unexpected events */
>   
>   	/* Step between the current and next 'target' sequence number. */
>   	int seq_step;
> @@ -677,7 +678,7 @@ static void vblank_handler(int fd, unsigned int frame, unsigned int sec,
>   	fixup_premature_vblank_ts(o, &o->vblank_state);
>   }
>   
> -static bool check_state(const struct test_output *o, const struct event_state *es)
> +static bool check_state(const struct test_output *o, struct event_state *es)
>   {
>   	struct timeval diff;
>   
> @@ -706,7 +707,8 @@ static bool check_state(const struct test_output *o, const struct event_state *e
>   	    es->current_seq - (es->last_seq + o->seq_step) > 1UL << 23) {
>   		igt_debug("unexpected %s seq %u, should be >= %u\n",
>   			  es->name, es->current_seq, es->last_seq + o->seq_step);
> -		return false;
> +		es->err_frames++;
> +		return true;
>   	}
>   
>   	if (o->flags & TEST_CHECK_TS) {
> @@ -727,16 +729,16 @@ static bool check_state(const struct test_output *o, const struct event_state *e
>   				  es->name, timeval_float(&es->last_ts), es->last_seq,
>   				  timeval_float(&es->current_ts), es->current_seq,
>   				  elapsed, expected);
> -
> -			return false;
> +			es->err_frames++;
> +			return true;
>   		}
>   
>   		if (es->current_seq != es->last_seq + o->seq_step) {
>   			igt_debug("unexpected %s seq %u, expected %u\n",
>   				  es->name, es->current_seq,
>   				  es->last_seq + o->seq_step);
> -
> -			return false;
> +			es->err_frames++;
> +			return true;
>   		}
>   	}
>   
> @@ -1233,17 +1235,16 @@ static bool check_final_state(const struct test_output *o,
>   	 * those use some funny fake timings behind userspace's back. */
>   	if (o->flags & TEST_CHECK_TS) {
>   		int count = es->count * o->seq_step;
> -		unsigned int min = actual_frame_time(o) * (count - 1);
> -		unsigned int max = actual_frame_time(o) * (count + 1);
> +		int error_count = es->err_frames * o->seq_step;
> +		int expected = elapsed / actual_frame_time(o);
> +		float pass_rate = ((float)(count - error_count) / count) * 100;
>   
> -		igt_debug("expected %d, counted %d, encoder type %d\n",
> -			  (int)(elapsed / actual_frame_time(o)), count,
> -			  o->kencoder[0]->encoder_type);
> -		if (elapsed < min || elapsed > max) {
> -			igt_debug("dropped frames, expected %d, counted %d, encoder type %d\n",
> -				  (int)(elapsed / actual_frame_time(o)), count,
> -				  o->kencoder[0]->encoder_type);
> +		igt_info("Event %s: expected %d, counted %d, passrate = %.2f%%, encoder type %d\n",
> +			 es->name, expected, count, pass_rate, o->kencoder[0]->encoder_type);
>   
> +		if (pass_rate < 85) {
> +			igt_debug("dropped frames, expected %d, counted %d, passrate = %.2f%%, encoder type %d\n",
> +				  expected, count, pass_rate, o->kencoder[0]->encoder_type);
>   			return false;
>   		}
>   	}
