Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FB6C83F2D
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 08:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B14010E262;
	Wed, 16 Jul 2025 08:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X3ko/u4R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072E510E262
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 08:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752654638; x=1784190638;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PVvsOvTeN4TFCrkxolvqs8zSxfWOWwyOEAUNoWNF+UM=;
 b=X3ko/u4RkrXO+IvLk6HTjsbH/6X2oVLe8RUhY+rW8Y3pfgTxnV8U0Xal
 7zJnLw0N22cGdN9FlacN/rP2VS/jwHCCv4PnPhAvNJlq5f0W33nJHZQxZ
 knSntPoVRV210Q/z7RJxhl3w18FMGQ9GWh7rTAbuJtMiRD4PHwCDOqDC/
 Um5bGrnCkaaFkAxMK9hoBgzH2mURIaObcb7xSKYbnmg3++LHKw9HhS3Dx
 PTJys8ZhufjqxMlaI/5xqlDWMHzsCYUJ5Y2Rzz1HW+VizISLGnuq2pZId
 FJqVCFCJNw1yB8lZaUCJDUcORDFUa7aFmEsw6ooVDnJut/vCmLBJVSOL4 w==;
X-CSE-ConnectionGUID: PlCCBHLyQyOgm7R3Dm0/Lg==
X-CSE-MsgGUID: H+D7abIVT7irvTIcgYpVdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="66246606"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="66246606"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 01:30:22 -0700
X-CSE-ConnectionGUID: 8voc2XLgTO+wPpa06CXH0g==
X-CSE-MsgGUID: rzAQNThITImCScSNL5ZNrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="157792490"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 01:30:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 01:30:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 16 Jul 2025 01:30:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 01:30:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfyhoWNKfsguWVYdPzfHKbQiDXuYi9CPtQl1EwhDFg7vfiu0iJ+gsfOVO5XcmGBqQQun+yeO7hAjubOXZZWIdjm+42YWhHy1K5mzEnmdLKWhaf0PkFTwrOzzeEdgMwXhxA9fQa/EUBrTFXfPUKmqYwnyx+ku7s6qSFwUkJj0P4q+9BCUM+R4lNXOCwjNZVjgbS99GMUcWeXnN83Jy1XsIanaspZ2IbeI2DQwZAAGb0ZP2lUndYP9vfdV2QDqSQ359yYIZA/QjOffTMsCZFCFFKan06iAj5LW5X8vZCOpma0I+baeK+HMJHaHVE7695QbkfhgJ3tKMR5NWreoQFFH3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGZxTaFTIqtyH4WwN/fBG+kIQPvguiQFetwVEXZH+RY=;
 b=cfCGfOv74959dGddh0a/T+C7mQtXgiJUsJ1DYYD7CKsvc9Tixwmi4KtccWh02tsTgynjkrdE8BHhmDZXSIRjlR8j2bDLMr/rKOHyWl0yIFrszIUq6ROfHgZQlNSCepot9ViE02McDPXlfC3rf59XADxx0zHzeCxFk4AdDZecv/5ZOobKM0VBNv1AE1dN69qKa99wUir64CvhDxxH2pcDObQuoTVOX7GKP4PMSuc67rkk8ImBFtiTM56I/uQHCKVnIv6l99AY/8ksNZRAFMeAlqAut6PueTVGzvJ/1oxVi34izNQGfz8/UMqZ8zP33YcAMT99XC8PX/Rm/b6ZVZYqIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB4811.namprd11.prod.outlook.com (2603:10b6:806:11d::17)
 by DS7PR11MB6295.namprd11.prod.outlook.com (2603:10b6:8:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Wed, 16 Jul
 2025 08:30:11 +0000
Received: from SA2PR11MB4811.namprd11.prod.outlook.com
 ([fe80::e790:74e2:d7b6:9fe4]) by SA2PR11MB4811.namprd11.prod.outlook.com
 ([fe80::e790:74e2:d7b6:9fe4%7]) with mapi id 15.20.8901.028; Wed, 16 Jul 2025
 08:30:11 +0000
Message-ID: <54297603-f1cc-42df-870f-711873c190a8@intel.com>
Date: Wed, 16 Jul 2025 14:00:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/1] tests/intel/kms_pm_vrsr: Add test to validate
 VRAM Self Refresh
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Samala, Pranay"
 <pranay.samala@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Poosa, Karthik" <karthik.poosa@intel.com>
References: <20250626124215.112702-1-mohammed.thasleem@intel.com>
 <20250626124215.112702-2-mohammed.thasleem@intel.com>
 <PH7PR11MB6053B843D15BB0D2221E8D22E746A@PH7PR11MB6053.namprd11.prod.outlook.com>
 <CY5PR11MB6211B3B68717CBD2B1F692D19546A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <CY5PR11MB6211B3B68717CBD2B1F692D19546A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::21) To SA2PR11MB4811.namprd11.prod.outlook.com
 (2603:10b6:806:11d::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4811:EE_|DS7PR11MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: 9909df19-90fe-4630-967d-08ddc442faca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEVOZ1VFeVcyV25rYU1qWEFaWUZtNFltbmpHRzRLMWFJTzlQVFpOV3ZpemN4?=
 =?utf-8?B?SGxiZWY3WnRlaFF6dzB4SXEzeEZ5U3dBTHpjUUFmM01WaVhIcUVxaTFhcUVr?=
 =?utf-8?B?YUNqTjMyTGt4aEZva24weUR2aUNoYTkraFlNdjR0S3NZaitxMG9GdTVKSXVX?=
 =?utf-8?B?V2VrMkdqNk5Yd3hlKzdzRTJnMWhIRXZZY3d0dlE1NnRMQkpneWtVVWpIdTRy?=
 =?utf-8?B?U2dUZFVhT2xtL3JnY2tOR0lVQmhUSjVEVjN4S2JnRkpjMjlpck83b1FONGJC?=
 =?utf-8?B?eUdSZ2IraStiMjM3QmhFVHhvdituS09SZUIxOWEwVTc4anNlVmI5R0ZENUZO?=
 =?utf-8?B?ZHhBNkI0dUwrejBwcFVqZ2RuYk1TZlBmU2RQYUpyZ3oxM2FGWnUzVDQrVTFO?=
 =?utf-8?B?dG9oa1ZVN05wcFVxTEF5V0N0ZVU4dXQ0a01lL3pUYysxS2hrSk15NUcxV0dn?=
 =?utf-8?B?RzJjSEx3SWV4dTdiVkhNUmgvWnpuVHZJT1NmTnBNVzVGbldmNlkvZDJJNTlv?=
 =?utf-8?B?Y2JXQmQ5ZGk5eUhwNzk5RmUzYXBUcHBuaFZKUy9JMmpiWjRnb1dveFZieU9p?=
 =?utf-8?B?QklOa294VjZSWE1XSjIrWG53T2s1NUdGcVJXeGR5RXl4TVlDTUVPM0dtU3dl?=
 =?utf-8?B?b1JGOXlZM1MxU2dWMVB0UWhNc2RtajBUU2NpcHNhMk5zck5obDI4bFY4TVk4?=
 =?utf-8?B?MjdrK0xQTDJCbnRzNk5IeU9tNlFDQmhTT3c4RUFhZUo0ejFrUGV5R2NPWnpp?=
 =?utf-8?B?RzhUaVpBSjBJVkpHeWRQM3BNcFFOTEZFTzFEdXF6OW83b1JiSnRwb3RPeW40?=
 =?utf-8?B?b2dDL0VXY0dwMVZqdTdtSVN2QkNqWXRGc2lIcWhycmVZMDZ0NXJ3UGNIZzFE?=
 =?utf-8?B?aE9YeE9VT0l2Z2h5NHduY2FTSlcwK3pkOElrMTRaU3V5WCtzM2UzbXhlZEUr?=
 =?utf-8?B?di9FM01TcjNmMGlnc25NbjlMditORG5KdWd4ODFqQ1lmVW9qY1k4TFN4Yzkx?=
 =?utf-8?B?UXVXR2ZoY28zN1NMa251UVhTWURmZlVNTi9wTWNQZm1kWkhzcWdPcEZDVlYv?=
 =?utf-8?B?WjFSSVhkZGgzQzBpUWVEWGxaUTNwWS8yNE1UdTZsUi9YV2dDcHdTandjQ3Na?=
 =?utf-8?B?OUZ1SmYydmFXSkM3MWRrVTZZeEdBYzE5bzVib1RDZnRBTGJyQnQxcnkxRzBr?=
 =?utf-8?B?SWFQQ0lQNEVkZHhwTUhkNDlCcmlRN01xWVdtSkRCZ0pLUDNPM1FQa3ZDUnZQ?=
 =?utf-8?B?TkpwN2NCdzhTTWFYUnlhU2x0SDNRN05qVkxyZWtWKytBWTJ2WUladDUxK3Jl?=
 =?utf-8?B?dWJDSTYwdzBoS3YvSnh6eFplYlcxSmdINzd3a29zZCtDWmV4VjRmdGU4K1Zx?=
 =?utf-8?B?bXBhb04wd1JxWUxZandFNENURXBqZmxBcjl6eUx3bGRMeFQwTy9rZEQ2Qmph?=
 =?utf-8?B?SmhEUlM0cXhXUkFQdjVmdFVBOFo0SjZ1b0d6TTdINGFoekJFRFgySUN2ZTFT?=
 =?utf-8?B?WTdtREcxV1NuNUhuTUdzVE5wRllaaDBxa1lDSUI0M1BqMGp3S2w0d25lU0Rk?=
 =?utf-8?B?UDE5eDU1aFRvVC9KcXZkYll4aFV4VHNKMG5SODloVTJOM0FhNUJnTy8rUHIz?=
 =?utf-8?B?TWVhMTI2Y3RQR1Y4UkNkS0llOS9WMlN4a3NIamJjaThrMFQvdENGL1paazAy?=
 =?utf-8?B?Qmdub0pGRTJReDhJVnFuT203OUdxSkpXSUxRQ0JJSXZGVVBsazZIc09qUW50?=
 =?utf-8?B?YXpHTm5IK2J0WmZVOENmUnJaYVRYT1VGbHlqMmRLTngvTW1yM3VFQm40WGJZ?=
 =?utf-8?B?M1hkbzRoZlRBdVc2bUtsZmE3Nm1rMW5zMTMweFpHY0ZjQTZIak1LYTZkUFZQ?=
 =?utf-8?B?d1Z6UjVRdTB0bHF0cU5lMXJqdFdac2tPYnoxTk14aWFBNEpnSEdlVnNRb2dV?=
 =?utf-8?Q?dSyVGxaGxlU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4811.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDRVS2RpYjVJeDFlQVhCQ05ZZUIxejZ2NXpDTlBFeTlEMWF5TDVRb2s1K1lt?=
 =?utf-8?B?N0xDUUFBZnlsQ2pFUVVGOW0xT1g0Z0IwRXlzRnZyb1RDUGNESFZmZjJGQVQy?=
 =?utf-8?B?eWdPRkRQdjZja0VDWENxMVh3Y2FsU20zTy9SZlZIMlJIamI1VFVpNUJBN3d5?=
 =?utf-8?B?bFluYlN3eEJ3REhLaW9EUGdlZTJManlqdTZOZUx0RjNIWnVyMk9mdU1wU2Fa?=
 =?utf-8?B?SXNzd2xkS2lOaXh2V3pPa2x0ZTdYQ1pWckx5MEpXVmxPdTRwTEc4R0p0OWM0?=
 =?utf-8?B?WiszR1kzOFdjQXBuMmxDSEU4bS9aam5DblN0MVpxZFZoTkxlc2xPcjBFT0VR?=
 =?utf-8?B?N29oRjd4bEJGNS9reXdneTFJOTJYZW84all0bkZhUEJjVmZWaGtKSkFzdWRN?=
 =?utf-8?B?bEloL1BGdGRiZlRHTWtvem1VMlZZMTJMOEFpZUxaNHBzWE9MSWlwOWRESTNO?=
 =?utf-8?B?T2RzYTE3MlZRckVDeDNDbzJ3UVVrKzZJYnBKOFJJREJvUUpjQkwwK213N0w3?=
 =?utf-8?B?S2c3UkM4OWlGd0NvNkQ1SDdBR3hLMkVhN3VINXF1YjF6QTgwWTNJWHNLcVdD?=
 =?utf-8?B?azlZZ3JiRGM1cTNDQVRvRmhPZW0vbHNYN1p2c1dLT3JSRkxwdHYyU1U2N3Np?=
 =?utf-8?B?T0ZoWjBpL1hNZkpIQ1YvNElqV3NheWhnRnk2a0MrNDVIeDA3eDJZdGVTbDZH?=
 =?utf-8?B?T2x5R3JWUUxSd2FlMktDTmFmTm5ONFNiQzU4R0JaaGRMazZDYmQ5Zk5XcDJ3?=
 =?utf-8?B?YWx1RlhraTg0WUJmRHlmSTZnK2kvN1pUZGVtTDZzS09IZzVWcXNScjFHZGdm?=
 =?utf-8?B?ek0rL1ZmcFVXMGFBTkJITXFBWXVYMG5pTm5McGVmWVpOOTd4M2U5MWZnUFB2?=
 =?utf-8?B?VS95a3ZJY3R2MUpzTlprSk1WaXBpRzlpVWJoS0RLc21UQk1KODNMcTF5TmlD?=
 =?utf-8?B?Z3VianhuS1ZNcWpkY3Jvdmd5OE9MWFpJS0d1aS9xN2FTZVF2VHRnUENVRlh5?=
 =?utf-8?B?aHUzV0MrNDhwR1ZwWE1hV2N5eUx6T29LM003Z2s4c1k5cnd0LzVLS1RHdmhX?=
 =?utf-8?B?TVNtRkFpQUpHdXNXeW5reVk3USs5a25zVW5yZ0RTN0lhRkdyZGRUd09SOTZJ?=
 =?utf-8?B?djFxZ2JrVnI5djJPcjl6WHJSUFRHUHcvcHpOZmhybi9FNUdBV1FSWU9GWDJJ?=
 =?utf-8?B?dzhQeDhLQmhFN01aMXNyTlU1Z0YxL0w2K1N1amlkdWU1Q1FpMDZpYk9Jbmhx?=
 =?utf-8?B?VC9vY3NLdndQdUEyTnlhaG03Zk4wcFlMK0pVdXJBeVRGSkR0M1VYamNaaGlD?=
 =?utf-8?B?ekJsN1dJLzB5OUpqNEJveElONGdnSDYvU0c0a3FLdnhiRXR2UncyTVRBTVpl?=
 =?utf-8?B?YW9SMmt0cDVUR0hHMjdBaytTSW5uWDJ6MVlaTUNaeGd0QzIrSVJqczNQMXdl?=
 =?utf-8?B?UFFmUXJrMS9leDdhWDZ0Mm54cGhaNStjb25mUi85eS8reCszcUZjYXkrVVg2?=
 =?utf-8?B?UTQzeHYrKzgrWURLbXBoejQrM2hEM3oxbnhHMnhZUXU5QnFSL2gvL29OVUd1?=
 =?utf-8?B?WW1lbXorSVMrYXN0aHBJTm1hVmphMFp5Q2xqcTF0TExFdXdxZlEwbzkwZFU4?=
 =?utf-8?B?OERCWE1yM2ZpWmZMcjlSeGFTcndFS2xjMEpYWkdDTDZMbnZKMmdjZ1gzcFRx?=
 =?utf-8?B?Q21DL1p4cUJUb0MvY2R3ajh2YUozZXVPZWNQbHpNVkFzZFlEYkxhZnJuRU9t?=
 =?utf-8?B?Q1ZFVDNFZC9iNGJvNUZtK25heXlFTm45Z01TMFpkSzlublFwRWdLbUI1TUZP?=
 =?utf-8?B?VjF6dnJqdnRURUFkRVB1dmxoYjJOM2VHQndNVXNsNGx1dS9zeDJ3bWQ3V01G?=
 =?utf-8?B?dGxDSG9ZTFhyODJoamdKQWJZQVE3UGluWk1IeG8xY1l6VzFDSlR3d1M5VmVU?=
 =?utf-8?B?VXRlWGVJQjk4Qy95REhUeFF5bEt4UDZVWkovQkl5aDBFZmR3bDI1dGlMbnFy?=
 =?utf-8?B?d1Zzb2NuQzJQcXRONkdQQUY1bTZJYkNxNG9wSGdDZlhpeTEwYjBHdWJzMDR3?=
 =?utf-8?B?cjVhT0s2UURvSVFnQjQzbDJOY3pKM2VmeDNDWDRidTlSdG9xKzJPWHRiOVlD?=
 =?utf-8?B?Nk03a0QvdzVEeHowSVY5VExvRDF2eHdkdkMvTTIvMXREeHJDNThlKy9XaWRS?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9909df19-90fe-4630-967d-08ddc442faca
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4811.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 08:30:11.5449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /63JsfngVKS8tjeZtGJtinayExJjMRYvJL4roiG33uSDdY1if1Thrn2+37zvY3EvkzsDwcNgjhP1D9Zm7JPXxsb5baE6LjjL+yMmJ00+sew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6295
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



On 6/30/2025 2:58 PM, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Samala, Pranay <pranay.samala@intel.com>
>> Sent: Monday, June 30, 2025 2:55 PM
>> To: Thasleem, Mohammed <mohammed.thasleem@intel.com>; igt-
>> dev@lists.freedesktop.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Poosa, Karthik
>> <karthik.poosa@intel.com>; Thasleem, Mohammed
>> <mohammed.thasleem@intel.com>
>> Subject: RE: [RFC PATCH v2 1/1] tests/intel/kms_pm_vrsr: Add test to validate
>> VRAM Self Refresh
>>
>> Hi Thasleem,
>> Split changes into separate patches for better clarity.
	-->This not required to split into two as it is new test altogether and 
will check other comments and update.>>
>>> -----Original Message-----
>>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>>> Mohammed Thasleem
>>> Sent: Thursday, June 26, 2025 6:12 PM
>>> To: igt-dev@lists.freedesktop.org
>>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Poosa, Karthik
>>> <karthik.poosa@intel.com>; Thasleem, Mohammed
>>> <mohammed.thasleem@intel.com>
>>> Subject: [RFC PATCH v2 1/1] tests/intel/kms_pm_vrsr: Add test to
>>> validate VRAM Self Refresh
>>>
>>> This test detect primary connected panel and also adds a test for VRAM
>>> Self Refresh (VRSR), focusing on display flips and power management
>>> efficiency. It handles transitions between power states like D3Hot and
>>> D3Cold. The patch includes validation of VRAM residency and power
>>> state transitions, ensuring accurate testing of VRSR functionality.
> Why don't you add this test in kms_pm_rpm ?
	--> Will check on it.>>>
>>> v2: Add skip check for output and primary plane in device struct.
>>> (Pranay)
>>>
>>> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
>>> ---
>>>   tests/intel/kms_pm_vrsr.c | 623
>> ++++++++++++++++++++++++++++++++++++++
>>>   tests/meson.build         |   1 +
>>>   2 files changed, 624 insertions(+)
>>>   create mode 100644 tests/intel/kms_pm_vrsr.c
>>>
>>> diff --git a/tests/intel/kms_pm_vrsr.c b/tests/intel/kms_pm_vrsr.c new
>>> file mode
>>> 100644 index 000000000..efde9fba8
>>> --- /dev/null
>>> +++ b/tests/intel/kms_pm_vrsr.c
>>> @@ -0,0 +1,623 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2025 Intel Corporation  */
>>> +
>>> +/**
>>> + * TEST: kms pm vrsr
>>> + * Category: Display
>>> + * Description: Tests to validate vram self refresh along with display flips.
>>> + * Driver requirement: xe
>>> + * Mega feature: Display Power Management  */
>>> +
>>> +#include <fcntl.h>
>>> +
>>> +#include "igt.h"
>>> +#include "igt_sysfs.h"
>>> +#include "igt_device.h"
>>> +#include "igt_device_scan.h"
>>> +#include "igt_pm.h"
>>> +#include "intel_common.h"
>>> +#include "lib/igt_syncobj.h"
>>> +#include "lib/intel_reg.h"
>>> +
>>> +#include "xe_drm.h"
>>> +#include "xe/xe_ioctl.h"
>>> +#include "xe/xe_query.h"
>>> +
>>> +#define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
>>> +#define KMS_POLL_DISABLE 0
>>> +
>>> +#define MAX_N_EXEC_QUEUES 16
>>> +#define NO_SUSPEND -1
>>> +#define NO_RPM -1
>>> +
>>> +#define USERPTR (0x1 << 0)
>>> +#define PREFETCH (0x1 << 1)
>>> +#define UNBIND_ALL (0x1 << 2)
>>> +
>>> +/**
>>> + * SUBTEST: vram-self-refresh
>>> + * Description: This test validates display flips with vram self
>>> +refresh
>>> + *
>>> + */
>>> +
>>> +IGT_TEST_DESCRIPTION("This test validates display flips with vram
>>> +self refresh.");
>>> +
>>> +bool kms_poll_saved_state;
>>> +
>>> +typedef struct {
>>> +	int fd_xe;
>>> +	int debugfs_fd;
>>> +	struct igt_fb fb_white;
>>> +	drmModeModeInfo *mode;
>>> +	igt_display_t display;
>>> +	igt_output_t *output;
>>> +	igt_plane_t *primary;
>>> +	struct pci_device *pci_xe;
>>> +	struct pci_device *pci_root;
>>> +	char pci_slot_name[NAME_MAX];
>>> +	drmModeResPtr res;
>>> +} device_t;
>>> +
>>> +typedef struct {
>>> +	device_t device;
>>> +	struct drm_xe_engine_class_instance *eci;
>>> +	int n_exec_queues;
>>> +	int n_execs;
>>> +	enum igt_suspend_state s_state;
>>> +	enum igt_acpi_d_state d_state;
>>> +	unsigned int flags;
>>> +} child_exec_args;
>>> +
>>> +uint64_t orig_threshold;
>>> +int fw_handle = -1;
>> This variable is not used anywhere in the code.
>> Remove it if not required.
>>
>>> +
>>> +static pthread_mutex_t suspend_lock = PTHREAD_MUTEX_INITIALIZER;
>>> +static pthread_cond_t suspend_cond = PTHREAD_COND_INITIALIZER; static
>>> +pthread_mutex_t child_ready_lock = PTHREAD_MUTEX_INITIALIZER; static
>>> +pthread_cond_t child_ready_cond = PTHREAD_COND_INITIALIZER; static
>>> +bool child_ready;
>>> +
>>> +static void display_fini(device_t *device) {
>>> +	igt_display_fini(&device->display);
>>> +}
>>> +
>>> +static void setup_primary(device_t device) {
>> You are passing device_t by value in many functions. This causes unnecessary
>> copying of the struct and can lead to bugs if you expect changes to persist.
>> Please change this logic wherever required.
>>
>>> +	igt_plane_set_fb(device.primary, NULL);
>>> +	igt_create_color_fb(device.fd_xe,
>>> +			    device.mode->hdisplay, device.mode->vdisplay,
>>> +			    DRM_FORMAT_XRGB8888,
>>> +			    DRM_FORMAT_MOD_LINEAR,
>>> +			    1.0, 1.0, 1.0,
>>> +			    &device.fb_white);
>>> +	igt_plane_set_fb(device.primary, &device.fb_white);
>>> +	igt_display_commit(&device.display);
>>> +}
>>> +
>>> +/* Assumption that detected panel is primary display gpu */ static
>>> +void detect_primary_output(device_t device) {
>>> +	igt_display_t *display = &device.display;
>>> +	igt_output_t *output;
>>> +	enum pipe pipe;
>>> +
>>> +	for_each_pipe_with_valid_output(display, pipe, output) {
>>> +		drmModeConnectorPtr c = output->config.connector;
>> Don’t use variable names like this. Rename variable 'c' for better readability.
>>
>>> +
>>> +		if (c->connection != DRM_MODE_CONNECTED)
>>> +			continue;
>>> +
>>> +		igt_display_reset(display);
>>> +		igt_output_set_pipe(output, pipe);
>>> +
>>> +		if (!intel_pipe_output_combo_valid(display))
>>> +			continue;
>>> +
>>> +		device.output = output;
>>> +		device.mode = igt_output_get_mode(output);
>>> +		device.primary = igt_output_get_plane_type(output,
>>> +DRM_PLANE_TYPE_PRIMARY);
>>> +
>>> +		break;
>>> +	}
>>> +
>>> +	igt_require_f(device.output && device.mode, "No valid connected
>>> +output found\n"); }
>>> +
>>> +static void dpms_on_off(device_t device, int mode) {
>>> +	int i;
>>> +
>>> +	if (!device.res)
>>> +		return;
>>> +
>>> +	for (i = 0; i < device.res->count_connectors; i++) {
>>> +		drmModeConnector *connector =
>>> drmModeGetConnectorCurrent(device.fd_xe,
>>> +
>>> device.res->connectors[i]);
>>> +
>>> +		if (!connector)
>>> +			continue;
>>> +
>>> +		if (connector->connection == DRM_MODE_CONNECTED)
>>> +			kmstest_set_connector_dpms(device.fd_xe,
>> connector,
>>> mode);
>>> +
>>> +		drmModeFreeConnector(connector);
>>> +	}
>>> +}
>>> +
>>> +/* runtime_usage is only available if kernel build
>>> +CONFIG_PM_ADVANCED_DEBUG */ static bool
>>> +runtime_usage_available(struct pci_device *pci) {
>>> +	char name[PATH_MAX];
>>> +
>>> +	snprintf(name, PATH_MAX,
>>> "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/runtime_usage",
>>> +		 pci->domain, pci->bus, pci->dev, pci->func);
>>> +	return access(name, F_OK) == 0;
>>> +}
>>> +
>>> +static uint64_t get_vram_d3cold_threshold(int sysfs) {
>>> +	uint64_t threshold;
>>> +	char path[64];
>>> +	int ret;
>>> +
>>> +	sprintf(path, "device/vram_d3cold_threshold");
>>> +	igt_require_f(!faccessat(sysfs, path, R_OK, 0),
>>> +"vram_d3cold_threshold is not present\n");
>>> +
>>> +	ret = igt_sysfs_scanf(sysfs, path, "%"PRIu64"", &threshold);
>> Add spaces between concatenated string literals for style compliance.
>>
>>> +	igt_assert_lt(0, ret);
>>> +
>>> +	return threshold;
>>> +}
>>> +
>>> +static void set_vram_d3cold_threshold(int sysfs, uint64_t threshold) {
>>> +	char path[64];
>>> +	int ret;
>>> +
>>> +	sprintf(path, "device/vram_d3cold_threshold");
>>> +
>>> +	if (!faccessat(sysfs, path, R_OK | W_OK, 0))
>>> +		ret = igt_sysfs_printf(sysfs, path, "%"PRIu64"", threshold);
>> Same as above.
>>
>>> +	else
>>> +		igt_warn("vram_d3cold_threshold is not present\n");
>>> +
>>> +	igt_assert_lt(0, ret);
>>> +}
>>> +
>>> +static bool setup_d3(device_t device, enum igt_acpi_d_state state) {
>>> +	igt_require_f(igt_has_pci_pm_capability(device.pci_xe),
>>> +		      "PCI power management capability not found\n");
>>> +
>>> +	dpms_on_off(device, DRM_MODE_DPMS_OFF);
>>> +
>>> +	/*
>>> +	 * The drm calls used for dpms status above will result in IOCTLs
>>> +	 * that might wake up the device. Let's ensure the device is back
>>> +	 * to a stable suspended state before we can proceed with the
>>> +	 * configuration below, since some strange failures were seen
>>> +	 * when d3cold_allowed is toggle while runtime is in a transition
>>> +	 * state.
>>> +	 */
>>> +	igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED);
>>> +
>>> +	switch (state) {
>>> +	case IGT_ACPI_D3Cold:
>>> +		igt_require(igt_pm_acpi_d3cold_supported(device.pci_root));
>>> +		igt_pm_enable_pci_card_runtime_pm(device.pci_root, NULL);
>>> +		igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
>>> +		return true;
>>> +	case IGT_ACPI_D3Hot:
>>> +		igt_pm_set_d3cold_allowed(device.pci_slot_name, 0);
>>> +		return true;
>>> +	default:
>>> +		igt_debug("Invalid D3 Selection\n");
>>> +	}
>>> +
>>> +	return false;
>>> +}
>>> +
>>> +static void cleanup_d3(device_t device) {
>>> +	dpms_on_off(device, DRM_MODE_DPMS_ON); }
>>> +
>>> +static bool in_d3(device_t device, enum igt_acpi_d_state state) {
>>> +	uint16_t val;
>>> +
>>> +	/* We need to wait for the autosuspend to kick in before we can check
>> */
>>> +	if
>> (!igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED))
>>> +		return false;
>>> +
>>> +	if (runtime_usage_available(device.pci_xe) &&
>>> +	    igt_pm_get_runtime_usage(device.pci_xe) != 0)
>>> +		return false;
>>> +
>>> +	switch (state) {
>>> +	case IGT_ACPI_D3Hot:
>>> +		igt_assert_eq(pci_device_cfg_read_u16(device.pci_xe,
>>> +						      &val, 0xd4), 0);
>>> +		return (val & 0x3) == 0x3;
>>> +	case IGT_ACPI_D3Cold:
>>> +		return
>> igt_wait(igt_pm_get_acpi_real_d_state(device.pci_root)
>>> ==
>>> +				IGT_ACPI_D3Cold, 10000, 100);
>>> +	default:
>>> +		igt_info("Invalid D3 State\n");
>>> +		igt_assert(0);
>>> +	}
>>> +
>>> +	return true;
>>> +}
>>> +
>>> +#define MAX_VMAS 2
>>> +
>>> +static void*
>>> +child_exec(void *arguments)
>>> +{
>>> +	child_exec_args *args = (child_exec_args *)arguments;
>>> +
>>> +	uint32_t vm;
>>> +	uint64_t addr = 0x1a0000;
>>> +	struct drm_xe_sync sync[2] = {
>>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =
>>> DRM_XE_SYNC_FLAG_SIGNAL, },
>>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =
>>> DRM_XE_SYNC_FLAG_SIGNAL, },
>>> +	};
>>> +	struct drm_xe_exec exec = {
>>> +		.num_batch_buffer = 1,
>>> +		.num_syncs = 2,
>>> +		.syncs = to_user_pointer(sync),
>>> +	};
>>> +	int n_vmas = args->flags & UNBIND_ALL ? MAX_VMAS : 1;
>>> +	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>>> +	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
>>> +	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
>>> +	size_t bo_size;
>>> +	uint32_t bo = 0;
>>> +	struct {
>>> +		uint32_t batch[16];
>>> +		uint64_t pad;
>>> +		uint32_t data;
>>> +	} *data;
>>> +	int i, b;
>>> +	uint64_t active_time;
>>> +	bool check_rpm = (args->d_state == IGT_ACPI_D3Hot ||
>>> +			  args->d_state == IGT_ACPI_D3Cold);
>>> +
>>> +	igt_assert_lte(args->n_exec_queues, MAX_N_EXEC_QUEUES);
>>> +	igt_assert_lt(0, args->n_execs);
>>> +
>>> +	if (check_rpm) {
>>> +		igt_assert(in_d3(args->device, args->d_state));
>>> +		active_time = igt_pm_get_runtime_active_time(args-
>>>> device.pci_xe);
>>> +	}
>>> +
>>> +	vm = xe_vm_create(args->device.fd_xe, 0, 0);
>>> +
>>> +	if (check_rpm)
>>> +		igt_assert(igt_pm_get_runtime_active_time(args-
>>>> device.pci_xe) >
>>> +			   active_time);
>>> +
>>> +	bo_size = sizeof(*data) * args->n_execs;
>>> +	bo_size = xe_bb_size(args->device.fd_xe, bo_size);
>>> +
>>> +	if (args->flags & USERPTR) {
>>> +		data = aligned_alloc(xe_get_default_alignment(args-
>>>> device.fd_xe),
>>> +				     bo_size);
>>> +		memset(data, 0, bo_size);
>>> +	} else {
>>> +		if (args->flags & PREFETCH)
>>> +			bo = xe_bo_create(args->device.fd_xe, 0, bo_size,
>>> +					  all_memory_regions(args-
>>>> device.fd_xe) |
>>> +					  vram_if_possible(args->device.fd_xe,
>>> 0),
>>> +
>>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>> +		else
>>> +			bo = xe_bo_create(args->device.fd_xe, vm, bo_size,
>>> +					  vram_if_possible(args->device.fd_xe,
>>> args->eci->gt_id),
>>> +
>>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>> +		data = xe_bo_map(args->device.fd_xe, bo, bo_size);
>>> +	}
>>> +
>>> +	for (i = 0; i < args->n_exec_queues; i++) {
>>> +		exec_queues[i] = xe_exec_queue_create(args->device.fd_xe,
>> vm,
>>> +						      args->eci, 0);
>>> +		bind_exec_queues[i] = 0;
>>> +		syncobjs[i] = syncobj_create(args->device.fd_xe, 0);
>>> +	};
>>> +
>>> +	sync[0].handle = syncobj_create(args->device.fd_xe, 0);
>>> +
>>> +	if (bo) {
>>> +		for (i = 0; i < n_vmas; i++)
>>> +			xe_vm_bind_async(args->device.fd_xe, vm,
>>> bind_exec_queues[0], bo,
>>> +					 0, addr + i * bo_size, bo_size, sync, 1);
>>> +	} else {
>>> +		xe_vm_bind_userptr_async(args->device.fd_xe, vm,
>>> bind_exec_queues[0],
>>> +					 to_user_pointer(data), addr, bo_size,
>>> sync, 1);
>>> +	}
>>> +
>>> +	if (args->flags & PREFETCH)
>>> +		xe_vm_prefetch_async(args->device.fd_xe, vm,
>>> bind_exec_queues[0], 0,
>>> +				     addr, bo_size, sync, 1, 0);
>>> +
>>> +	if (check_rpm) {
>>> +		igt_assert(in_d3(args->device, args->d_state));
>>> +		active_time = igt_pm_get_runtime_active_time(args-
>>>> device.pci_xe);
>>> +	}
>>> +
>>> +	for (i = 0; i < args->n_execs; i++) {
>>> +		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
>>> +		uint64_t batch_addr = addr + batch_offset;
>>> +		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
>>> +		uint64_t sdi_addr = addr + sdi_offset;
>>> +		int e = i % args->n_exec_queues;
>>> +
>>> +		b = 0;
>>> +		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>>> +		data[i].batch[b++] = sdi_addr;
>>> +		data[i].batch[b++] = sdi_addr >> 32;
>>> +		data[i].batch[b++] = 0xc0ffee;
>>> +		data[i].batch[b++] = MI_BATCH_BUFFER_END;
>>> +		igt_assert(b <= ARRAY_SIZE(data[i].batch));
>>> +
>>> +		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>>> +		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>>> +		sync[1].handle = syncobjs[e];
>>> +
>>> +		exec.exec_queue_id = exec_queues[e];
>>> +		exec.address = batch_addr;
>>> +
>>> +		if (e != i)
>>> +			syncobj_reset(args->device.fd_xe, &syncobjs[e], 1);
>>> +
>>> +		xe_exec(args->device.fd_xe, &exec);
>>> +
>>> +		igt_assert(syncobj_wait(args->device.fd_xe, &syncobjs[e], 1,
>>> +					INT64_MAX, 0, NULL));
>>> +		igt_assert_eq(data[i].data, 0xc0ffee);
>>> +
>>> +		if (i == args->n_execs / 2 && args->s_state != NO_SUSPEND) {
>>> +			/* Until this point, only one thread runs at a given
>> time.
>>> Signal
>>> +			 * the parent that this thread will sleep, for the parent
>> to
>>> +			 * create another thread.
>>> +			 */
>>> +			pthread_mutex_lock(&child_ready_lock);
>>> +			child_ready = true;
>>> +			pthread_cond_signal(&child_ready_cond);
>>> +			pthread_mutex_unlock(&child_ready_lock);
>>> +
>>> +			/* Wait for the suspend and resume to finish */
>>> +			pthread_mutex_lock(&suspend_lock);
>>> +			pthread_cond_wait(&suspend_cond,
>> &suspend_lock);
>>> +			pthread_mutex_unlock(&suspend_lock);
>>> +
>>> +			/* From this point, all threads will run concurrently */
>>> +		}
>>> +	}
>>> +
>>> +	igt_assert(syncobj_wait(args->device.fd_xe, &sync[0].handle, 1,
>>> +				INT64_MAX, 0, NULL));
>>> +
>>> +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>>> +	if (n_vmas > 1)
>>> +		xe_vm_unbind_all_async(args->device.fd_xe, vm, 0, bo, sync,
>> 1);
>>> +	else
>>> +		xe_vm_unbind_async(args->device.fd_xe, vm,
>>> bind_exec_queues[0], 0,
>>> +				   addr, bo_size, sync, 1);
>>> +	igt_assert(syncobj_wait(args->device.fd_xe, &sync[0].handle, 1,
>>> +				INT64_MAX, 0, NULL));
>>> +
>>> +	for (i = 0; i < args->n_execs; i++)
>>> +		igt_assert_eq(data[i].data, 0xc0ffee);
>>> +
>>> +	syncobj_destroy(args->device.fd_xe, sync[0].handle);
>>> +	for (i = 0; i < args->n_exec_queues; i++) {
>>> +		syncobj_destroy(args->device.fd_xe, syncobjs[i]);
>>> +		xe_exec_queue_destroy(args->device.fd_xe, exec_queues[i]);
>>> +		if (bind_exec_queues[i])
>>> +			xe_exec_queue_destroy(args->device.fd_xe,
>>> bind_exec_queues[i]);
>>> +	}
>>> +
>>> +	if (bo) {
>>> +		munmap(data, bo_size);
>>> +		gem_close(args->device.fd_xe, bo);
>>> +	} else {
>>> +		free(data);
>>> +	}
>>> +
>>> +	xe_vm_destroy(args->device.fd_xe, vm);
>>> +
>>> +	if (check_rpm) {
>>> +		igt_assert(igt_pm_get_runtime_active_time(args-
>>>> device.pci_xe) >
>>> +			   active_time);
>>> +		igt_assert(in_d3(args->device, args->d_state));
>>> +	}
>>> +
>>> +	/* Tell the parent that we are ready. This should run only when the
>> code
>>> +	 * is not supposed to suspend.
>>> +	 */
>>> +	if (args->n_execs <= 1 || args->s_state == NO_SUSPEND)  {
>>> +		pthread_mutex_lock(&child_ready_lock);
>>> +		child_ready = true;
>>> +		pthread_cond_signal(&child_ready_cond);
>>> +		pthread_mutex_unlock(&child_ready_lock);
>>> +	}
>>> +	return NULL;
>>> +}
>>> +
>>> +/*  Do one suspend and resume cycle for all xe engines.
>>> + *  - Create a child_exec() thread for each xe engine. Run only one thread
>>> + *    at a time. The parent will wait for the child to signal it is ready
>>> + *    to sleep before creating a new thread.
>>> + *  - Put child_exec() to sleep where it expects to suspend and
>>> +resume
>>> + *  - Wait for all child_exec() threads to sleep
>>> + *  - Run one suspend and resume cycle
>>> + *  - Wake up all child_exec() threads at once. They will run concurrently.
>>> + *  - Wait for all child_exec() threads to complete  */ static void
>>> +test_exec(device_t device, int n_exec_queues, int n_execs,
>>> +		  enum igt_suspend_state s_state, enum igt_acpi_d_state
>>> d_state,
>>> +		  unsigned int flags)
>> Alignment should match open parenthesis.
>>
>>> +{
>>> +	enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
>>> +				     SUSPEND_TEST_DEVICES :
>>> SUSPEND_TEST_NONE;
>>> +	struct drm_xe_engine_class_instance *eci;
>>> +	int active_threads = 0;
>>> +	pthread_t threads[65]; /* MAX_ENGINES + 1 */
>>> +	child_exec_args args;
>>> +
>>> +	xe_for_each_engine(device.fd_xe, eci) {
>>> +		args.device = device;
>>> +		args.eci = eci;
>>> +		args.n_exec_queues = n_exec_queues;
>>> +		args.n_execs = n_execs;
>>> +		args.s_state = s_state;
>>> +		args.d_state = d_state;
>>> +		args.flags = flags;
>>> +
>>> +		pthread_create(&threads[active_threads], NULL, child_exec,
>>> &args);
>>> +		active_threads++;
>>> +
>>> +		pthread_mutex_lock(&child_ready_lock);
>>> +		while (!child_ready)
>>> +			pthread_cond_wait(&child_ready_cond,
>>> &child_ready_lock);
>>> +		child_ready = false;
>>> +		pthread_mutex_unlock(&child_ready_lock);
>>> +	}
>>> +
>>> +	if (n_execs > 1 && s_state != NO_SUSPEND) {
>>> +		igt_system_suspend_autoresume(s_state, test);
>>> +
>>> +		pthread_mutex_lock(&suspend_lock);
>>> +		pthread_cond_broadcast(&suspend_cond);
>>> +		pthread_mutex_unlock(&suspend_lock);
>>> +	}
>>> +
>>> +	for (int i = 0; i < active_threads; i++)
>>> +		pthread_join(threads[i], NULL);
>>> +
>>> +	active_threads = 0;
>>> +}
>>> +
>>> +static uint64_t read_mods(device_t device) {
>>> +	uint64_t mods_value;
>>> +	char buf[256];
>>> +	int ret;
>>> +	char *mods_ptr;
>>> +
>>> +	ret = igt_debugfs_simple_read(device.debugfs_fd,
>>> "gtidle/dgfx_pkg_residencies", buf, sizeof(buf));
>> Line length is of 106, exceeds 100 columns.
>>
>>> +	igt_assert_f(ret >= 0, "Debugfs dgfx_pkg_residencies is not
>>> +present.\n");
>>> +
>>> +	mods_ptr = strstr(buf, "Package ModS: ");
>>> +	if (mods_ptr)
>>> +		sscanf(mods_ptr, "Package ModS: %"PRIu64"\n",
>> &mods_value);
>> Add spaces between concatenated string literals for style compliance.
>>
>>> +
>>> +	return mods_value;
>>> +}
>>> +
>>> +static void cleanup(device_t device)
>>> +{
>>> +	igt_plane_set_fb(device.primary, NULL);
>>> +	igt_display_commit(&device.display);
>>> +	igt_remove_fb(device.fd_xe, &device.fb_white); }
>>> +
>>> +static void kms_poll_state_restore(int sig) {
>>> +	int sysfs_fd;
>>> +
>>> +	sysfs_fd = open(KMS_HELPER, O_RDONLY);
>>> +	if (sysfs_fd >= 0) {
>>> +		__igt_sysfs_set_boolean(sysfs_fd, "poll",
>> kms_poll_saved_state);
>>> +		close(sysfs_fd);
>>> +	}
>>> +}
>>> +
>>> +igt_main
>>> +{
>>> +	device_t device;
>>> +	char buf[256];
>>> +	int sysfs_fd, ret;
>>> +	uint32_t d3cold_allowed;
>>> +	uint64_t mods_prev_value = 0, mods_curr_value = 0;
>>> +
>>> +	const struct s_state {
>>> +		const char *name;
>>> +		enum igt_suspend_state state;
>>> +	} s_states[] = {
>>> +		{ "s2idle", SUSPEND_STATE_FREEZE },
>>> +		{ NULL },
>>> +	};
>>> +	const struct d_state {
>>> +		const char *name;
>>> +		enum igt_acpi_d_state state;
>>> +	} d_states[] = {
>>> +		{ "d3hot", IGT_ACPI_D3Hot },
>>> +		{ "d3cold", IGT_ACPI_D3Cold },
>>> +		{ NULL },
>>> +	};
>>> +
>>> +	igt_fixture {
>>> +		memset(&device, 0, sizeof(device));
>>> +		device.fd_xe = drm_open_driver_master(DRIVER_XE |
>>> DRIVER_INTEL);
>>> +
>>> +		kmstest_set_vt_graphics_mode();
>>> +		device.debugfs_fd = igt_debugfs_dir(device.fd_xe);
>>> +		igt_require(device.debugfs_fd != -1);
>> Please address to skip the test with proper skip message as requested in
>> previous patch.
>>
>>> +		igt_pm_enable_sata_link_power_management();
>>> +		igt_display_require(&device.display, device.fd_xe);
>>> +
>>> +		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
>>> +		device.pci_root = igt_device_get_pci_root_port(device.fd_xe);
>>> +		igt_device_get_pci_slot_name(device.fd_xe,
>>> device.pci_slot_name);
>>> +
>>> +		/* Always perform initial once-basic exec checking for health */
>>> +		test_exec(device, 1, 1, NO_SUSPEND, NO_RPM, 0);
>>> +
>>> +		igt_pm_get_d3cold_allowed(device.pci_slot_name,
>>> &d3cold_allowed);
>>> +		igt_assert(igt_setup_runtime_pm(device.fd_xe));
>>> +		igt_install_exit_handler(kms_poll_state_restore);
>>> +	}
>>> +
>>> +	igt_describe("This test validates display flips with vram self refresh");
>>> +	igt_subtest("vram-self-refresh") {
>>> +		detect_primary_output(device);
>>> +		setup_primary(device);
>>> +
>>> +		ret = igt_debugfs_simple_read(device.debugfs_fd,
>>> "vrsr_capable", buf, sizeof(buf));
>>> +		igt_assert_f(ret >= 0, "Debugfs dgfx_pkg_residencies is not
>>> +present.\n");
>>> +
>>> +		igt_skip_on_f(!strstr(buf, "true"), "vrsr is not enabled.\n");
>>> +
>>> +		for (const struct s_state *s = s_states; s->name; s++) {
>>> +			for (const struct d_state *d = d_states; d->name; d++)
>> {
>>> +				orig_threshold =
>>> get_vram_d3cold_threshold(sysfs_fd);
>>> +				mods_prev_value = read_mods(device);
>>> +				/* TO DO: Created fb >300MB instead making
>> 0
>>> threshold. */
>>> +				set_vram_d3cold_threshold(sysfs_fd, 0);
>> Functions set_vram_d3cold_threshold() and get_vram_d3cold_threshold()
>> can be wrapped in a helper function.
>>
>>> +				igt_assert(setup_d3(device, d->state));
>>> +				test_exec(device, 1, 2, s->state, NO_RPM, 0);
>>> +				mods_curr_value = read_mods(device);
>>> +				set_vram_d3cold_threshold(sysfs_fd,
>>> orig_threshold);
>>> +				igt_assert_f(mods_curr_value >
>>> mods_prev_value,
>>> +					     "Mods residency is inaccurate:
>>> %"PRIu64"\n", mods_curr_value);
>> Line length is of 107, exceeds 100 columns.
>> Also add spaces between concatenated string literals for style compliance.
>>
>>> +				cleanup_d3(device);
>>> +			}
>>> +		}
>>> +		cleanup(device);
>>> +	}
>>> +
>>> +	igt_fixture {
>>> +		close(device.debugfs_fd);
>>> +		display_fini(&device);
>>> +		drm_close_driver(device.fd_xe);
>>> +	}
>>> +
>>> +	igt_exit();
>>> +}
>>> diff --git a/tests/meson.build b/tests/meson.build index
>>> 9b87a0d24..ef18340d7
>>> 100644
>>> --- a/tests/meson.build
>>> +++ b/tests/meson.build
>>> @@ -266,6 +266,7 @@ intel_kms_progs = [
>>>   	'kms_pm_dc',
>>>   	'kms_pm_lpsp',
>>>   	'kms_pm_rpm',
>>> +        'kms_pm_vrsr',
>>>   	'kms_psr',
>>>   	'kms_psr2_sf',
>>>   	'kms_psr2_su',
>>> --
>>> 2.25.1
> 

