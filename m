Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAB7C43458
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 05:17:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABDE10E0BA;
	Fri, 10 Jul 2026 05:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FbcYzrbs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6776610E0BA
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 05:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783660606; x=1815196606;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1rG75uwCCIH1VHWXyNZisHgAiqVs9vyVdgHyvEG661M=;
 b=FbcYzrbsNvH0841YaYlwlPpARVmHwECshHjZI8ASoRKtd94BLpSvxo+m
 VE7rcEP9YftK76dEOB6LgQopfZ0Qgr3YzB8GMN2iRh3lEH81SI291XaID
 3PybXj5h2p9zflRiLrwy75gNjZrZShRKfGjYnP/hyQtWePlD0qpI3vzRJ
 IS7SNBrZ4bgGukHkUUaBq+vyH9J5pkN/V5K/F0rjlNZb5Ao2VIJY7cBZN
 AQu9ShnVzTzbDL5/GCD1sIN/24+1/7pRoMSDCCwslqVKYION4l9M4VGYB
 ouwXku6UKDD49m0lvk2K80C+QOM+6Y/U44/pEvFVOpwDM8o4vm/kOXQO9 Q==;
X-CSE-ConnectionGUID: YY2RWh7aQyqKsBxjUybOzA==
X-CSE-MsgGUID: QSr1PNqXRMOM1nt6nTt4aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83334896"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="83334896"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 22:16:45 -0700
X-CSE-ConnectionGUID: o3qI0p4gQl6FX/U1XhUX3w==
X-CSE-MsgGUID: cpAtUxLaRhOe17E2/Cykvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="250783650"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 22:16:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 22:16:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 22:16:44 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 22:16:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k92Fkb2ibqmWoNH9iahpbxjmaZGN9VD2epXkypXPF9PskFZmfnNzCAyUdhtv1X+IxRGOrzB+at/gIaZSJB2av+zPTIYZF3hnmIZGsBBg0yuWKmCt+dLuWsUZHc+XbVWEK6aYPeTXJ8/V/QcISlHTsPUjK+kOBnZn61owFYdcc0JIzmso153imoGeh5LZyml9V9fyXWjmieBSnzaJjGoR2u71QE1eiJzw2f0pkgDVGauUaYgyCPXn8IPj50ofl/B8M9Nad/YfgLru8qRrM67CrbgExetHCt9EBgSNNR+Rt6kHHrsduFtWc8pGZAE0jHl3/dxmavKSPnX+TGgv2hewSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4Ht6CPsxyQsvYk0vkY4A1SZ6lw3iTi3HE8DQIVF5lc=;
 b=LAqNk5/b08PwWZzrnKMDvg4YsG3zOTA1iaCy4IHeBCsRAKbNTssNHBYzq4yq82vRhIuaB0lb5eSr5c1rs9uv9Q56DSJIOy9dHls9lRgleawG9ZYllC7oPj66p3JbkMaPNwls4XtHBSipYnTu0NW5K+uQE+FUILnMyBYnm8MWDSrxJ/9OHbYi2ZnIaDsqXNROdzmuw4Ug61twhNRMO+3VK3zurOGBfP5jtgWVdDp+4lk4JPS9uZAfpwlbXbfxAjxpc7+GaywyX4VU2CjBjvQl+4dVS8S5JVuM+G8541n069fVMaM0IzXY3gaZYGh3kQQiHsWlBYlKve8TVF9Ilm/jXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 MW4PR11MB7127.namprd11.prod.outlook.com (2603:10b6:303:221::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 05:16:42 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%5]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 05:16:41 +0000
Message-ID: <27e03d0a-6c98-49c6-b8cb-2c91243a0765@intel.com>
Date: Fri, 10 Jul 2026 10:46:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 03/12] tests/intel/kms_frontbuffer_tracking:
 update the outdated fbc status reasons
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260601204407.39934-1-vinod.govindapillai@intel.com>
 <20260601204407.39934-4-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260601204407.39934-4-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0261.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::17) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|MW4PR11MB7127:EE_
X-MS-Office365-Filtering-Correlation-Id: f414a6a8-c04e-4324-f2e4-08dede426d53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 7UBtdAFETYLX8Vk7UMtbwJABXbG8VfP1+/u69tOLefa3IxVr2+iYBpRK4Qus0xhV1QPz0zvnnwVuBF7yhV+iGWKl3vR8z81SDMGXmIgxzo990rzu7YuXE47d4THHqfm9qYsqapMPdVj67Zu7AERjK/SSZAvi5Vmyer95Lx9SA0J1VbGUpyxHOU+4Tl4zoRPBnkqwDc74iDVETPV5iJ3Qk5LMLZt6nTvEJ+6NPBhY0FwdAkzLqnbUuVnBTobaxvIFlUYa104J+NG2I4jIqwGg25fQi3+5X/my1yJP0Dz1SnDKAGScPSt1E5bHmQYxYHmlcvHuUnpgZ+5x/nzxmsyYFdyUYXJhTFVujEgDUT1HIFlFCKX9hDuvuN/rSpbi/t0hEMlbXPAMbafhpVlY2XKKgJ2M8mUMrIES/EXBNZv61EYP9cAEfzNJ3YpwHXgq5X+RHVZtM9KjxDVKDHxZOgCU3f0ItNq0HjxsItP7xY+UzdC6a86EmG7kUSgJS1KcwHzTdBGBins+VCtRiesLi5tYBCfiCr8wPii1yr7omG0opSRl3W+fsD7vQT68mP7/FmUkynNeolBxwp4AgNWfsTKCYeMQPmZUC6YczEOJgsZLR7HCDum3I8K/6dHGv9/65YadA4a9VnyMzzvFTtpZIc7shFDc3N6S435i2+6zoXwQ6fs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXRUdWN1bEd1NmR5QlBOUVBXM2N3U0YzN0UxOCtPb3pmbzBGbisvZVFWOFlO?=
 =?utf-8?B?TVNxSVZXUEY2MVVZQkZydU5aMGJKYS95ZmYwWmNjbUxXVmlBMWpienl4QTJP?=
 =?utf-8?B?TEVkMmVwMlRTSzZqaVRrTmIxYWdxZlVQbks5KzkrSTNRTjMvNFBIVkdTVzA4?=
 =?utf-8?B?VVEwTDFIOGRJY1lIR1NzTzhpc1RxbFBwOWlyc244K083VFJKdDRrdTAzcHor?=
 =?utf-8?B?TEQzVFQvT2U5MmtLTDJ0YmNnTXRYRldORkppdTlTSUJRVnhpUlR3ZXAxZjBQ?=
 =?utf-8?B?YXF3L0plWlJiZDg2MHE0M2xNZnVzSVZvOXE1Q3FBdTlXN29UUGpDOUN1Y3BU?=
 =?utf-8?B?VDFhczQxdlFmQlZHc1hkT1M1bDE5ZzZKS2tkY2ErcGM4Y2pGbUlac3V3cUFJ?=
 =?utf-8?B?KzcycU9BazYyZ0lvME0yOUQwdXkrZmc3VStpV0R3ei9zSWZicWF6ck94b0tO?=
 =?utf-8?B?d1ZMb1lCc21MbllRVjhiTG1DSHdTNm1DOElVaU16U3M3dlQvaXZ1R2Y5MlFq?=
 =?utf-8?B?Rzl1cFVaQjZ5aVplNXdtYmViL2phRzBFUTN5ZCszbEI5RUNFc2N0Z1B0NEJ2?=
 =?utf-8?B?ZnJzclJzMlFjWjBmclN1QXFEcElOSkdpOG5EenlFeHlMZmp4UkNMTTVORDd1?=
 =?utf-8?B?eHJVNVVBRWJTZFdDanNUNnU3dFR4aDdmZkpTZHJ3dG40bFdRM0c5ejRaSWlG?=
 =?utf-8?B?djEycjBYNGVOSVAwbytmcUhmb2tDYSt4UVdsZHFPNTNmTmhITVU1Z2g3TW8r?=
 =?utf-8?B?ZXhFd3NSWWxTc1QvWjF2WDlnNW9PdnNQMVVGY2RHaUt1RE4rNWwzZzhPeDBR?=
 =?utf-8?B?VDgyOFM0ZXZFOUM0aTk2Yk81aFVyRmRXaDJWUVJuVU1hUjY4S2xYTHFuM3BP?=
 =?utf-8?B?MjkybzlWMi94UWVnclFXZlNBYjFnc0g5Z0tpYXpBWTBRR3NvaEtKK1d5K2I1?=
 =?utf-8?B?b1N3amFabHh4SVBpSDdaSWl6RXRibC92UnBYVzNML3VtMThQZ3doYVlRLzJw?=
 =?utf-8?B?SERKM0xLelAwSWRhcHA3T2tHdjJhTUpQNzU0ODhyN0hIazd3ZVkyTkttcVZE?=
 =?utf-8?B?cVBIYXlZYk1QMHRORnhXMk5kS2FTWDBIY28vVURSUkliU0FITkd2ZnRvd21H?=
 =?utf-8?B?WGtpSlZGL2xWN09LenBZRXFQT3A5VkYvNjVLYUY2bFhVL3hiS2RRWTZ5NHJL?=
 =?utf-8?B?QWc4YnVaN3kzOE5mRHFCZ2JMSjR5NEtUc1FrSUN3RExJSHk4S29qNjZ5SHBQ?=
 =?utf-8?B?bWxqbHVHSldMVmsxUTVZdjk1V2JLM0Q2ZXRzV1FNMWw1UFRiZFZmaTFvcWJR?=
 =?utf-8?B?allNbFozN2JMQUl4bEtSOEYzWGo3YlNtUThPZHpTOURjWUxzQnlZdkdSQ1dO?=
 =?utf-8?B?V3B4VENJYnBad2NxQnBQbzlkRmFndkpxcGU0N0x3YWZHdWJOaGJrbmZvR052?=
 =?utf-8?B?aFJuQW5OTURZTmVWaUI3b0pzZUc5Vjg2aGIxcXhyOERuNEhSMGN1K2hHRUNo?=
 =?utf-8?B?S1kvVGJnMENxSVBlbUdYR0JRTHRmMHNyb2l4clJsL0tJRkVobGFkU3FjOEFw?=
 =?utf-8?B?N0E4TXhyRDIzUS9wSytqR1lEM2IySW1iS0t4SkR1RTNOTWdQOERSMWRydXZC?=
 =?utf-8?B?L3o0RGhFYUpzK2trRHRBZXd2Rko2dXJ2aGIrMGs0SEZud0dqcXpHYUV2UG1n?=
 =?utf-8?B?V2RiZVZyZDJaZFZPY2t0RXUzVEVPNjVXSEtEaXN2TFRONmF6K3hSaTRScThZ?=
 =?utf-8?B?VjJ3MHBIdkxYck95SFZRVmdNcC8wR1pIUUlEMUJwbTVlZTBJOUdET0J4OXc2?=
 =?utf-8?B?YS9IMW40dHVNbmI5VytJQzl2czVIVWExYzhMUVZsUnkzcE9IMXZxZTdIRTQ2?=
 =?utf-8?B?OFpFSHNCdHkwV2Y4WGNZWWR1SzB4V0JJQjJRN3BNaGU2TTZHYXgzM25iRzds?=
 =?utf-8?B?bnZYMWdPZEhwYm9yekE3aVY5RERkcDBsYlRieEJHam1iNllHRlpPUUFIS1g1?=
 =?utf-8?B?UTZtTzhCY0F0aVlCOTVjSk9ydndwbG1PcDFWM3A1ZThiTmJKWHBsNHpvNE1t?=
 =?utf-8?B?KzF5VklzYUdKTk0vK2ZMUzNwdzNNdzF0ZGFSOGZiMmptYzJqQVRHZ1FjRTFN?=
 =?utf-8?B?QjBMQldTNzF2Y1BRYXNvYThtNDJ3bzBQVmhZem1GYzlJS0Zrb3ZncDJ4aDlY?=
 =?utf-8?B?TUZUUkNyUmpNcm4wTHlGekJGcDhHK1UrYXZaSmlRb01xMUR2UkpDbW9vTWpS?=
 =?utf-8?B?NFozRXdjK0JJN1NvakE4OEttd3prTHhPQllvbi9EckRhclFkUUp6UnNQRGlO?=
 =?utf-8?B?d0lMajZzRit6OTB1QlJPUjJjZlNsQUNaYWJIMFdheVpzODF3U21pRVZrcTF0?=
 =?utf-8?Q?CO4Cs5RYFEOrK8mM=3D?=
X-Exchange-RoutingPolicyChecked: ZDUPQV5w61dhzaao17gbGjIwYPkL1Grorf71CDz1YfRm14UUc5wySaCupFcmOzrfItUl8+KnA5mYvNMRW2ieD/9ieic9nvcteYGmO90H4TU/7FBcbg628t4ebBrN9NdzpJGq5Obpk0pOUTTR0ylexj/M/CyJC+7kHB4AtUQ5p8Ao4W/OxIhqWq8PHCHRsD0sVd4o3AeL8wtmljgjnKyC167NbI0UrZnH98QDZt58aqDrVYUUPzAbaYM73uH95DGm9xEclMU3q8g1OPH5sYPyyetIj/299DFyQuJzh91uSNay8UQoYvzDORIZyjCp0anmy8GhTKwtZ0gL91RfkXfX7Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: f414a6a8-c04e-4324-f2e4-08dede426d53
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 05:16:41.7730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8TQwl3Z1tsfxK+b4yovHxpIkZDlWDnEVWnYiGL+8+yWMqvUAp+qtohbG+hOA/f8n7TGgVOIimyER+O6mu2Asvrf8lnsoi37wAKUOQ5O3neTH2C9iw34AgmBJxDmNqeBL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7127
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



On 02-06-2026 02:13, Vinod Govindapillai wrote:
> Replace the fbc status check for "mode too large for compression" wchich
> is no longer being set by the driver with "plane size too big" and
> "surface size too big" fbc status checks.
> 
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>

Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

> ---
>   tests/intel/kms_frontbuffer_tracking.c | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index df8fbfa2c..fabfe11fc 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -1730,16 +1730,25 @@ static bool fbc_stride_not_supported(void)
>   
>   	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
>   
> -	return strstr(fbc_status, "FBC disabled: framebuffer stride not supported\n");
> +	return strstr(fbc_status, "FBC disabled: stride not supported\n");
>   }
>   
> -static bool fbc_mode_too_large(void)
> +static bool fbc_plane_size_too_big(void)
>   {
>   	char fbc_status[128];
>   
>   	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
>   
> -	return strstr(fbc_status, "FBC disabled: mode too large for compression\n");
> +	return strstr(fbc_status, "FBC disabled: plane size too big\n");
> +}
> +
> +static bool fbc_surface_size_too_big(void)
> +{
> +	char fbc_status[128];
> +
> +	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
> +
> +	return strstr(fbc_status, "FBC disabled: surface size too big\n");
>   }
>   
>   static bool fbc_psr_not_possible(void)
> @@ -2497,7 +2506,8 @@ static void do_status_assertions(int flags)
>   	if (flags & ASSERT_FBC_ENABLED) {
>   		igt_require(!fbc_not_enough_stolen());
>   		igt_require(!fbc_stride_not_supported());
> -		igt_require(!fbc_mode_too_large());
> +		igt_require(!fbc_plane_size_too_big());
> +		igt_require(!fbc_surface_size_too_big());
>   		igt_require(!fbc_psr_not_possible());
>   		if (!intel_fbc_wait_until_enabled(prim_mode_params.crtc)) {
>   			igt_assert_f(intel_fbc_is_enabled(prim_mode_params.crtc, IGT_LOG_WARN),

