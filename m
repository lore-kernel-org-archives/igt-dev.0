Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765B6FF8875
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 03:45:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2556710E08B;
	Thu, 30 Apr 2026 03:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LKo/J/4m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D1B10E08B
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 03:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777520739; x=1809056739;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4af3Q+vVvxXIm8qfNlgKROAHowCAHMy0PqyyI2OZQIw=;
 b=LKo/J/4mP1QCqSjBqKD9D3vi5ZNlimk/YW4Hrp8sPFjQLp+uzS2CAi4Y
 GWipM9Jf/74gKWh2V86hiTqaqbFnYbdPn5hrD2FVxw2/2xHojTYjCoado
 FCe7Dm3/7ffbs3xX/DeWNcTjbhOCnOiXD9zQ0BlEwB1eHBoo2d5D2iVCE
 9zTi5YB9yJRKD87BVykTYN0B2wLsLrJhN7zO8kyvLkh2y2ztIJtiAl2Ud
 hoGx7Ga0zLE1zKd0kbLiUplobrWlQxgSUgbEihaIthwBbrZ41JFoY9BHl
 71jb9TNAiDTX7nZ4iLOp+TtiqHvgm6nOZGU8qZtO7gV68VMPz/AF/7zqa A==;
X-CSE-ConnectionGUID: yvpovE6fRsiwaAiKW1DQvQ==
X-CSE-MsgGUID: fO9W8RhkSxCnX+JZueDxQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78380875"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="78380875"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 20:45:39 -0700
X-CSE-ConnectionGUID: HAVPppC/Q2OU4x/0QcT0MA==
X-CSE-MsgGUID: 3uAnVJ62Q9SEt7hYJnKh5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="233616847"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 20:45:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 20:45:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 20:45:38 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.39) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 20:45:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUg9imO3vkJP/XM4VI+BtU2MPvlifT5PIPozUg+evKve/gXIRYPYRGgWKOklVqEZP5lKD0BqpTTtuue5hUIl1ebTS5RcUtwhqL+lhUkIhS36IZxy2IT8ZM5nljLxG9n5L1JfBcSCB8yNBoWShGbAlQ01LRwrZE9V85K1B4p2RO5hPr6leMKgxUExNX6QKs46GAEouEHn+669YE22zxhsu+kPc89/fBjclXfq06GeQywThm2nPfraWQwGGkF40EOd+xRR76dV5YoXUlUtCQcugh1x5+uEdc1Hu6lLuFRqnFYOA4i9ihDPReGtRT3rpsLOAVVFN+Sd6EsuAQgF8/dVlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znraAoen3+9nmp0+B178EXd2yl0VUEOYi71JkZyXAmI=;
 b=dxT3Vic2c1ggiCitngZCTqtDxY1PWUB1zAbZz8W4dzBbhp2eA1JltmV+UG4IH5mh3hnsuXmzLyq5GiqpDQncCEi0dYwppNPlOcm+ExkrXBwiNphVemUQIIVzEFzEHbbQYut/gP7yyhLvoF2nFwOiuVhwT6oNctnnU5/TiXR13kpVrTtvmA+jAm3wGJ8GFIQ+qfOEN1rXMfFKnwAKa6pChW4rcJLARiH1niI7benQ92kqvIhwzfS+Cv7AxamwWbwF9iYgxVTNop67rC1BVqhT4bPRB6Wy6cFnwXUAD+PXYVD5K+YrnFj5Wa0TT6zgjDEMJPs4mjAbFIuFatY5cL7B1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 PH7PR11MB7661.namprd11.prod.outlook.com (2603:10b6:510:27b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Thu, 30 Apr
 2026 03:45:34 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 03:45:34 +0000
Message-ID: <feecb41f-3a98-4d68-9d4f-c7618ca80d49@intel.com>
Date: Thu, 30 Apr 2026 09:15:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 05/11] tests/intel/kms_frontbuffer_tracking: use
 a bigger buffer for fbc status
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>, <jani.nikula@intel.com>
References: <20260416092559.88735-1-vinod.govindapillai@intel.com>
 <20260416092559.88735-6-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260416092559.88735-6-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0041.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::15) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|PH7PR11MB7661:EE_
X-MS-Office365-Filtering-Correlation-Id: ef23046a-3ee9-41d2-f643-08dea66aeee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: poBzs0JCRDj1KnHrP9o/4lreTqrSnabcnVrGcyFV8IMh6k1bIBxyFh73WzFelEzVUWrmAVlFni3ihLuWKDrZ+V+yhTpbEriqDl8/iY5linGluc8hy7HVNSfEh25IEymNXu92ELKNrmP7Hdpq9vDMnMkHkSUtPNR9OBVnLUCmhJg4E1+AArXCQ2N7XED58fBW5zr0FYo6Wf9xQDL3cAujG6vk+CX8aoHTcKslTpv9foI9+4EDRU74PNyMAp0xnMgc30pPgG/aqE78i851BNz9e1uI+LO2AoouDRYTUB5V18OLj7q0g1HiJRriwsJfsB6XaxYRCXW5QgdfTvO+OqfQtAxjncnBfGBDUZR9RMBt6m8CWqEiFJRU9tq5ftoeBD1h7jOmbJudOC580DC5WiPdnz4boXvOWvLYn/erLGx0H3EfnZ4+VC4sPIMixJit3yFCT9xHB73dO2fOPf8MpD8+qCZzVoxNPtNBbCCGT52QcFsGGyXh/GdJSlSpTGKiSEdwvRBPJSw8GPljz443vGSzwm3sywTUMoNWy6FBmYHwa9rEPyom2c6kVnWxdQh+D19mNXfRP5dBhyUXbhytJy34+7Zy3BNsMzG5Fy+8PjA35Hdv45z1GtkbtrisE/p9MkpDj3D8IsLHQ6cYtH6MTpodFFpYRAoLy5Yh4faANbnH5pCG/QT4dejwpVRDoBTkmp8AwYT+IXNU7xjkoXJbPsArJi7G2Wb+6CnXmALqGxBqomg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzFKdmNHWlVobi9UbGhMc2tLQWRJL25iOGpMcjFWNUZyekUvdFloSWE2OGlH?=
 =?utf-8?B?TTJxRWhGdEZHRWpSeWxpQXozc2lhUWdtaStISklNdmNWNmcwNWhxYnFDYnY5?=
 =?utf-8?B?QXBxdklaTVR1dWxPVnJuVnNGWGsyRGhYY2IreEk5SEtGc1VFZjcwQWJXZTl3?=
 =?utf-8?B?cFh1RzVlSVhVbEliaFRsd09peC81bDQ1RGJGdjZYNlJ6ZEN6QjFlRkMyK2VQ?=
 =?utf-8?B?VDdMZXoxRmt3RzZ5cEFDZTQ4cnVQaFl2S24yenJlZit6UkVwN2w5MnE2em9u?=
 =?utf-8?B?ck90R0lnMzc3bitPaU5IMTNRZ2txQ1Q1RlJtVGJKc1RiQ0xac3pPRitSUCtG?=
 =?utf-8?B?WGNqY0gvWmMzVlRwMEVjNzVNV3BxdTZ1NjdBMytvMTFJNXd5UHozMklWQjRk?=
 =?utf-8?B?cGNtZUFlRVdvcGlHRkFwMm5rOHZ0VGp5OUFSTWlleFlXaWV6ZHRGVVlDckRp?=
 =?utf-8?B?MDY3bTdMQW1VUmNMQWdkakNSaG1Nb0E0b0VZSWxyY3ZIMUtCVlc4TVI3TTRu?=
 =?utf-8?B?cm5pZWMrUGxWVG9Bc2VsQWhnbkhMNXFQbzNBOG9vVjcwMm9aSFp4emxEZmdI?=
 =?utf-8?B?ZEprSFJ1Z1RUSG1OMTNHeGtPdHo5SFM2RkJ0d25nT3Q5bVlHWlJURDJwOVht?=
 =?utf-8?B?VnoxUjF2ZGVPVXM5U2p0MFQ1OVJPU05VWXBFM2dVSnVvYWNFOWd3YkcyTkg3?=
 =?utf-8?B?bFAza0xDbWdXZnhFeW8wV1lDa1FuanZUMkt1VnNiRXR1UkdjV3M1TDF1VDVX?=
 =?utf-8?B?aStMbkREWnRyVDBqT0dPN3dhZDVidmVkYVdudC96aFgveUx3WEVvZHgyUVlT?=
 =?utf-8?B?M3pDTTlFRjVIdVRtbUxwSlZtS3NndE9pT2xtaEs2VE9JU2h0Rm8zOEFMZEt6?=
 =?utf-8?B?WXBZQmQ5eFFFWTV5bnduRVRBWS9mNkxHWlQwVU9NUk5vcSszQk9sVzZTSGlL?=
 =?utf-8?B?UFdHcWtOOXAwdXBKRHBIR0VGMGhnTDh5cklsdDJ4a2V1S3NFbGFwdUxkekp0?=
 =?utf-8?B?QlpUekJoK2puNTBnRDg5a2k3dE81K24yRitJeE9UWUdvR1V3NTVwZWhleGkz?=
 =?utf-8?B?VGU1eENVc1E4c05DTTdESVpEeWM3QUQzTmJrMTJFdkJHd3dhSFd2bHBXeU4y?=
 =?utf-8?B?UnE0a0dXcjdMTWZWRDI4TmN3dG9NMnBXeWhWQVNBeC9rcXNFN3o3THM1VDBw?=
 =?utf-8?B?MEpVWVV2dHNGNXlMaFZ5UEd3NnJDV254Y3lBbzBuMHpMVTlDUlFQd0QyVkJs?=
 =?utf-8?B?OWdrWENlTGtMN1R0M2xmbGtsakFmNjlveXJ2M3BYcHFhTFNtMy9EUFgzcGxz?=
 =?utf-8?B?QlQwWGVIZ2RWMmo1Vy81UE9NUVB2NWpzb1RTMlhiRVVDNTY4amlCdy93dWJp?=
 =?utf-8?B?b1dGVGJIcHJpZmNiU2FjNFd5K3ZTSENRa1NabU1UQjA1aENlL3h3V3JsL1RS?=
 =?utf-8?B?b29wWFJwNk0xTXZLTDFoVk9DTDNBNHYxY09qNzhlNUtDQ0k1UDk2MG1OS1h2?=
 =?utf-8?B?LzMvQWpZYXpXNER5Mm5HTzRnZ2IvbVVIc2Jpd1A1ckNDd0pLUGh3a3VFaGl0?=
 =?utf-8?B?UWZtUU9qNkVkb3JwSmcvU1llZmxsQTJUU3I2My8xT0tLY1pJS21Qa29icFNK?=
 =?utf-8?B?cHV1VzZwcVpNTTF1ek8wcUlQaUk0TjFOU3dlYTliN2xtYmFkWUtiNlhZd0dq?=
 =?utf-8?B?d3NMZWZLU29DZTZrS3NEYVVYc1NnS2ZpbGl2cGF2OURjWEdhcmcvNDFPL04v?=
 =?utf-8?B?UjRuL29vcVpsWVRZd2c2eDM5T2s4V1R5L2lJUXpWRWp6aEdRQ1MxV3pZVDFO?=
 =?utf-8?B?ZHd5UnNTVTltSjduNnp6VnFkN082RkZKWkROa1BBR1E1MVdJSGdtamIreGxz?=
 =?utf-8?B?NUptWVNWdURlajgvSSt1SE5xeU9DbGRnQ2FoRHhhMk1RbWU5bmtHc3JwQVpP?=
 =?utf-8?B?QnVlckxGZ09memFiaWVFRGZFT2hBOUJwMEN6STlDa1lIbmx6ODdJeFcvc1R3?=
 =?utf-8?B?VTkxN0xZNEJ2K1JZTUlPWjJaTE44NS9vR0Y5dHdRdVdOYU9HT0xKQXR6M2lq?=
 =?utf-8?B?MVg1WldVeU10eEk0ZzhONVVpUUpPUjduOVFWREVVRGZwMFAwQVJncVFQelVn?=
 =?utf-8?B?b3JUUmVBOTkvQ0pPeWdzeEYwZGxVeHdqZGx1T1liOFgxeWduR2hyYWJVVXpt?=
 =?utf-8?B?UGtRa0htdWNWdmxPcGJyT0NSa2F6S3lkcnFJbTVMSmZjWlAyR2JOQ0JUU2I0?=
 =?utf-8?B?WDJMM0NSSnF3SzI2NEF1MlRvMTJRalFzeVZOTFZEUGtZL0lOU1FtaExTd05H?=
 =?utf-8?B?WXNWSVk5U1g4OE9UQzZMY0ZDMVFwd0ZpbHlIZWJzejExSS9tWFVoMUI0eEtJ?=
 =?utf-8?Q?Pfr9QL98vfi0ugx8QmCdVx10p3kJPPAsUkYlY?=
X-Exchange-RoutingPolicyChecked: Yjalprqmgn7GcppXzPOYaL2YF+E1YwCO+dLJpOZsl/2XzVBAYEuovq6n0Ua4OsRG7vyt+s7gvBzOFFOR2ivtitKcpxXZLV9BnaHVm5D5l2s2R23WIKz5T9fVVABJlNkrStzZhAzbdjlYRSFe1L9aagptGkjmnb2ExZrNloCCL+swyKGIpbTlEr5VUSi3vPWSOglYovGMPSHgZn0+CvOaOOXM73UhU7fjjauxqPy43kwOFwuMvtVr/nhtHHkNO9IXAbkoY0gX150oiBv15/Qm/620fZ1SbxZ16fQ305IKxUyOf7I2G86doGdxqhUAgl+0qOh3YxG9QealccD/DYOpQQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ef23046a-3ee9-41d2-f643-08dea66aeee4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 03:45:33.9848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WeevSP1bE3At/ojRuNrNx8MLF9GVpNdeaIuPbC+orIkmDA5rxhRSIU9ZFg5pkkSVdfB7EfkfaOcqcdrgK2Fg8JNwqkoI1nit+VugxHqb4kM/zqKqeEwdPCWGqYFpblD4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7661
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

LGTM
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

On 16-04-2026 14:55, Vinod Govindapillai wrote:
> As the FBC status now include plane specific FBC status as well, we
> need a bigger buffer to capture the complete FBC status. Define the
> buffer length in a single place and use it across places where the
> test need to assess the FBC status
> 
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>   lib/i915/intel_fbc.c                   | 2 --
>   lib/i915/intel_fbc.h                   | 2 ++
>   tests/intel/kms_frontbuffer_tracking.c | 6 +++---
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
> index e2fbe3680..fde9ef03b 100644
> --- a/lib/i915/intel_fbc.c
> +++ b/lib/i915/intel_fbc.c
> @@ -10,8 +10,6 @@
>   
>   #include "intel_fbc.h"
>   
> -#define FBC_STATUS_BUF_LEN 128
> -
>   void intel_fbc_enable(igt_display_t *display)
>   {
>   	igt_set_module_param_int(display->drm_fd, "enable_fbc", 1);
> diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
> index e4b9e5529..f83818aff 100644
> --- a/lib/i915/intel_fbc.h
> +++ b/lib/i915/intel_fbc.h
> @@ -8,6 +8,8 @@
>   
>   #include "igt.h"
>   
> +#define FBC_STATUS_BUF_LEN 512
> +
>   enum psr_mode;
>   
>   void intel_fbc_enable(igt_display_t *display);
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index 4fa185e76..fd3b75b02 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -1570,7 +1570,7 @@ static void drrs_print_status(void)
>   static struct timespec fbc_get_last_action(void)
>   {
>   	struct timespec ret = { 0, 0 };
> -	char fbc_status[128];
> +	char fbc_status[FBC_STATUS_BUF_LEN];
>   	char *action;
>   	ssize_t n_read;
>   
> @@ -1620,7 +1620,7 @@ static void fbc_update_last_action(void)
>   static void fbc_setup_last_action(void)
>   {
>   	ssize_t n_read;
> -	char fbc_status[128];
> +	char fbc_status[FBC_STATUS_BUF_LEN];
>   	char *action;
>   
>   	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
> @@ -1640,7 +1640,7 @@ static void fbc_setup_last_action(void)
>   
>   static bool fbc_is_compressing(void)
>   {
> -	char fbc_status[128];
> +	char fbc_status[FBC_STATUS_BUF_LEN];
>   
>   	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
>   

