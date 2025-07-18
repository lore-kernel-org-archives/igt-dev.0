Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCE8C83F17
	for <igt-dev@archiver.kernel.org>; Fri, 18 Jul 2025 12:21:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073CA10E16B;
	Fri, 18 Jul 2025 12:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HJ1YcgaN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0866910E16B
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jul 2025 12:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752841261; x=1784377261;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XTUP4IEySevd/qNh094mFPMSIoImr+m+uN6GoDJvOJA=;
 b=HJ1YcgaN+xB3cl3B58U5t2SX22spf2QvAECw095QbJgPIKCykQeCD6ga
 BipAfOwYzKxxcxSU3EQU57GZd4YMUMGr6naeB7IfRamZdaOes1asbPomN
 kp3IxgD/XLeoEnnZwpU2wRiF+36ILhkaEL8R3uy8xW1Aj7jx/jQpvftF+
 MovrYdTCojsTU1DD4HNWGuwSjF+e3ROKVF6ppIIZiFQX0Z1LCXKKMTRRP
 qu7IQuYqqkfJ8vKpmgOYaoqMm7k0zpF/WD7RpAIAvlKZtqqo5L3Z5AzFK
 Oly6eGRYQ/DOf756DAWwX0She5ldB85zKx6MgLa9zNcztPJtAK0G5Hh5z g==;
X-CSE-ConnectionGUID: RQscNNNBT/SEje+/ybo3Cg==
X-CSE-MsgGUID: y5+qtrWPSROslg6Fo7HGTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="66582559"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="66582559"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 05:21:00 -0700
X-CSE-ConnectionGUID: 7wJaJNibSyeWCf5peTnGgQ==
X-CSE-MsgGUID: lhw/NvvFQ+mRH9lb2WLE6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="195177209"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 05:21:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 05:21:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 18 Jul 2025 05:21:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.69)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 05:21:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aoHGKnWm3mmAQNNpy4+4oKzQokahw8CEqATNnlcAWJDq626WGErTVcPVhxr+wo0tD1eARtpFeOcq0MsdqzXCVQB/CqyMaLVYS8NgNYNPXhyHPqsGmiItybF3RO94V7mGCai0UUmBTjVHKD9ecFltNbRGMkC5jVCMi2ok5elT4P9B4uyAg8ohaJJ6JkClVjyOvOC6kG70i2PZaHBBeZwrZJHMjZIgSuOrig2CeBxLrxYAaXqKBWABHy7o211cy2w53fAYeKBpScQPKZONesMEbWasXhV56KtyLN/xai0zv5f93Vd+SSqn8T7ooXre37da774HYsePvznAKfM/LVzyrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5B6FS3RHnPX6Lk6SCICKuZ4OoueyQkJbeAJFSlVgMY=;
 b=bIyx/iJqQDBpemXNN6qDEQRP/zHCmxhrOImmGBK8qjVy98zTXvR33eRnim7h+Zr8c79bqWYdtCd6x6khIp0i3LBRDzcKYIjGZKlyQi5PHU7Mr+w/L3DXwqvioNpNE6sJWbSLGpaoifjLxndhD0FRxSZE/eZaXXbpuVE+FtKuZNfV08hy+75ffHlPoBO6lS/dU+GF8e3PA+Y0GwCDOL6YIh3v0f9YiA+s+i/Wa1DuwJrrtEzNWz0FAF7VsHCrQ6oKsWAEodRHBof3yoURhNxyQ7T8WcmhPm1jSPg+HSpoqbEfWS0ofwctlYLGLBk4mVZ2VylYqDLrEAq+k4TfWOUMcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by PH0PR11MB5063.namprd11.prod.outlook.com (2603:10b6:510:3d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 12:20:31 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.8901.036; Fri, 18 Jul 2025
 12:20:31 +0000
Message-ID: <ef386b50-ee8f-4ac5-9155-79b167ab9293@intel.com>
Date: Fri, 18 Jul 2025 17:50:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel-ci: Block unsupported downscaling
 tests
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20250707192209.783141-1-ramanaidu.naladala@intel.com>
 <20250711201310.156705-1-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250711201310.156705-1-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::19) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|PH0PR11MB5063:EE_
X-MS-Office365-Filtering-Correlation-Id: 83bec097-e2d6-4516-f9b6-08ddc5f57ce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWt2REVLRC9ROU1hZnVqL3NXNktnb1I1WEtUeU4xS3hyTjZmT2hUdXI5TG1m?=
 =?utf-8?B?TlIwNThiZHV1dEc1Z0M0NElRdlF2MkVsV05Ja1EwdGVjbEsyTWVJL1NJaFFw?=
 =?utf-8?B?MUxqS25ZbmFnNXg5ZFNIK2t5dm9IZWdoTkdBY1ZSMGRGWi8xTERMdU40MWZu?=
 =?utf-8?B?LzdXU29YdndPc05MZFordU5Xeis1aWxweDYwUVlISTZpWFQ1L3RWcnBxSTFE?=
 =?utf-8?B?TWxOMU0rV0JacmxuS0NCNGNhU0RGTEVRZWtib1B2Nm5MNG1pL0Y0OUZtR0VL?=
 =?utf-8?B?WU9OazdOWG5iN2dBRzFKSDN3cDVBN1QzWTljczgzU1plMWFIK3paYk1nUjBO?=
 =?utf-8?B?dm9GODlHeDY0WHY1U25sU1RYcUJhZldCL0pvU0dJazFLQ0NZci83aUs5L3dR?=
 =?utf-8?B?bE93bC9kMG1vTnpCUjRtQ1ZSSnFuelVMcnJIR0p1N1lKOGhjQkJOTUhCdVJt?=
 =?utf-8?B?Z1RwTk42R2krTldhenFUZFQyMjduME9rQVJiRll2VzZIUFFPYzZCcmtSUEFP?=
 =?utf-8?B?K2J6SHdRd2drd1ZlSWdaZUVNN1FxZngxaG4zL09PWG8xZW45aHZYcGVhRlE1?=
 =?utf-8?B?aU1Vd2RsdEQ0ek1lYXdldkd6UWJEYWNGZUl2eGNXTW5WbHlSZXFQNGZOVnM5?=
 =?utf-8?B?NEZzdnBHdkRsM25BY1V6dzJlSGUyUjBFMDBCMEJ4Ym5GMkUza0ZPNzE4NEtB?=
 =?utf-8?B?bHhESGRwUVBiczZHMEd5RWZkelJiMGFnWWl6Yktqa1doTmVPcXhPL1BlWFlZ?=
 =?utf-8?B?czU5UENKWDhDajhWZUtSZWVaak9TMEgvK2Q2QnlkK1V3bm1SanZqc2tPZnRo?=
 =?utf-8?B?OHczc2FHekErOWdVODdOZ1B6UFZoT2NLQkNOcGlsTmRaSWNaZzNvV0Mrdndx?=
 =?utf-8?B?NExZYWhNY1Z4U3NRcXpXYzJab0ZadTZVaXYrYVZsQ2hub2hpVzFyMEJPcitl?=
 =?utf-8?B?WHlDZGV0SHczMXgrbGxVdUhJRXB2ZHNFeDZydGJkV3pWN2ZtR2tPdlBOWFpz?=
 =?utf-8?B?ekU2bndkT2ViRndiaU1TWTMrYnFuQjRoSEdWcWx1c0s2VXd2TjJsdWthUmg2?=
 =?utf-8?B?OGZOQ2ZGYmJHRUpmZ2g2K0xrbzNkYWJEc2tkSG9hY3U1Y3hDOWZ2L2dSMXlD?=
 =?utf-8?B?Q29nRlJ0NGhIcWkydEdqeGNlQy9qQTdJV2xYMEQ2dWEwQmNqMENYdE9IWnRt?=
 =?utf-8?B?eUxqdXAyWERnLzZVNUNhYnd5WW1uY0oyN1c1cnZCZUNhV3Z6ZDJBNXZCbjlk?=
 =?utf-8?B?SHYwYml3TkxwNmQ4dVB6ZG14STlxMlowcGlUOXBCN3pZc2ZiRHV4KzhuQU55?=
 =?utf-8?B?ODdYWHIxYXlmZHZCNExockVoa3Y3OUxtdVdOMDZZQXBqRnNJQm1lS3kyLzdj?=
 =?utf-8?B?UEF6VmJUWFVBcG5PcE8rZ0lqUjhBSUpzT3FiamRSRmRaS2phYlE4OHgwcHpz?=
 =?utf-8?B?TlJvTWxwUUpndTloT3hHSlhPdmg5UHVjZVgwQVFzTWduaEJxZ0RpeCs4VUpw?=
 =?utf-8?B?Tm5ERnovdEZCdGhXeGY5dTlRQ2R2TmVVMmJqb2tQMGovcHJNSjRSMXhJT0dV?=
 =?utf-8?B?WDJWNnlrVjFoZEcrRmxxUHErRzZLTW8rU1VSZWhzcXNlUWN3ZGJldDBCTitW?=
 =?utf-8?B?NFM1K0NTRGRUbXNPVEhqWktsVUxXbHFIOGlEQURJekVtRVh1UWNHcXRwdWRq?=
 =?utf-8?B?U2NCaTJjbHlPeUcrWjNVYW1PcDAyUWk5QnJnSkhnQTlVeDEwUzR6Tk11RkN6?=
 =?utf-8?B?U2wvUkl3LytpNjN2NWUxaVRZdUlTU2FQSGx0Q2IyNnV2cTJiSlYrL1FpcjI2?=
 =?utf-8?B?OFBlc1FnYVBnQktYWlQ3bElPYmZZZzNMWENWZDVHakNjK0FkS1VHZ2JGazFT?=
 =?utf-8?B?YnBqWUFlS0RCMGdnKzZlV0VqZER3ckVpTW1ZSUd0NklxZVRiYStwa3dybzh5?=
 =?utf-8?Q?ykInDvHL9HI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am1CT3diZzBBb3NwRnBKSTluRUVjZXhLZ3RHODFBbUdFb1ZNZVFFQklCZTZJ?=
 =?utf-8?B?NjdJdXF0c1FHYmNOamVCKzV5bHdaUGN4eUpXVmY0WGFGMUZNWjBvMEE2Qkda?=
 =?utf-8?B?cTk5WXZPY3FkbkgyU2tERmNFRTlqdFU3QzhoRmtWZGR0OFZSbGZRS3BPU0sx?=
 =?utf-8?B?SVdmc3FKUEpGaVB1bUF3YlV0YUtkWEJwNFFkUVJxU2t6ODhRdmRnZXNoN21h?=
 =?utf-8?B?ZXdIWHpqeUFYbU9TSEhoUCtEU0FXSFQyOUtpQXZNaTF3SjRPNXNZT3FSRzcw?=
 =?utf-8?B?WnU4MkhMRVVycUhpNldpTUJpdmlIN3Q5YUZya3hJdVgyaGJTTThvamwwUG5n?=
 =?utf-8?B?TFNSMWR2ZjVZcGMrTDRDNjR2blNGVmdJc1dmL2RPZVpQMmVwTUxoNkZvem5R?=
 =?utf-8?B?Q0g5dFJzeXBVQ2ZPMTRSRDNKRnhYclZMUEk2ZlVodEFWLzVZVkRkVDRZVXRY?=
 =?utf-8?B?NVA0RGhidnRIY0lzMVJKQ0I2R2pmb1oxdTM3cFhaRFhReGdOMXNTQWlvU1Az?=
 =?utf-8?B?aVh2VmJ0SU9lZEQ3UnVDbkc0dGVVM3Jud1MxZk9xRTRCaFJROS8ybit4UXpm?=
 =?utf-8?B?cmM4SzBSL1F2UldYYmo1eW9GUFZJYUp2eFZXWVV6ZC9TTHZBQ2tHQzhPQWJT?=
 =?utf-8?B?blBGNnJFWG9IZFo4YnFXWk1mV3VTZFV2dHhqRHBPZS9STHE0RHdzQWYvMlJq?=
 =?utf-8?B?NDc2bm10QUovYmRtdDloTGJzWGZVc1BRcTIxZXlQanhDN2pIN2hHUllESTQx?=
 =?utf-8?B?QXhGTTRSc0ZyNkQyT2p1L3J0TVJGcmRtd0x2b25HajBDcXZOWUVuemRiYjFq?=
 =?utf-8?B?VElrSXdqNCtCaWIzaXE1Um5jcnpqUWlMQW1rSVBkb2wyMkUyeERZbkNqT2Na?=
 =?utf-8?B?cjRoL1BNSkV1bEU0QmRCcDhUMHF6SDR4aHBLUi9yOWVDWWZCRHA4U3p1emVa?=
 =?utf-8?B?em9KRGw4V2VrVTIycklWdWEzS2dzSTEzTkpGVzlUeURjdEE3akdGbSt5WmVL?=
 =?utf-8?B?cW9Bdll2ckwzVDBtNFNLbmdzRVRneWdsUXFRTE9rZ0FBY3M1T2hjdUZTUDRX?=
 =?utf-8?B?bjJjVVUrQXhoMlZQcmxEQ1YwNGlzNkhuM3FFdGw4Z2RabksxbnRzOUx1WU1S?=
 =?utf-8?B?Z3QxdEJKZWdIRFpPSUhKamNYVko1RWora3ZPakhMVVQ0MUw5R253MjcvVzFm?=
 =?utf-8?B?L2JmOEk1bDNVbHJ5WWJUZ3c4bG9GdURaYTRGVFEwVC83Qm5KTFd2RThhQVF1?=
 =?utf-8?B?L2FrMDIvbzhQalJ4NjdTcjE1dFhxTkdZdjZzWElaVzkwS1pkR2ZGUHBXbHd1?=
 =?utf-8?B?VkRvNVg0c1NnVlZsNVpBZS9vajBBQkZXbXhQQnRjNjFiOERDRzBFZi9aa2Nq?=
 =?utf-8?B?cVRySGxGNEt6bVI4RW1LdTgwQVFsc2RicjBERzZ3K0E1eVNweWlWd3R6WU5j?=
 =?utf-8?B?aGhVUEhKNldtSnNaYWd0b1E3NHZyWG85dVgvUk81ZHBQejVqejhINGQ0dGU5?=
 =?utf-8?B?S0JSS3lYZEE2K1BuMSs2cElwUUozWHcxZDgxcWw2S3BoSXhvN2dSaHJ2ZGR1?=
 =?utf-8?B?bjhPd3ZYdWdMVXdVMnVxR2ExMTUzVGczQ0ZjNHhXYmdaMk4rYXpwN25meEJ1?=
 =?utf-8?B?UkgyYkhKRlBYdXlWNE4zRnpOSHdaNHl4R2ZscGh1d3N1Q3lwc29zRGQySW9E?=
 =?utf-8?B?VlNyVlh3K3I5aHhBZUZVcERpU1pWdnBQWjM5ZlJsQVNRU2VXQ2NnZG9sLzNE?=
 =?utf-8?B?RnVkWmUzY3NHdmtHUlViMjlhbEkrNXdxc3FaM015M1l0WFpSNjQ2RHFmcHI2?=
 =?utf-8?B?VmlPbWhwSEtodWNURHBhajRjMGwySURmSEFYcjlvK2JqOGNOVVRQRGhmbjlE?=
 =?utf-8?B?YjZjVGtTdEpJMVNQb0xubStCZGZ1akR1YisyeHZsMVVSN2NPdzc4TDFnN1Bp?=
 =?utf-8?B?bDgrVTdWNnp2anhiRm5tMHZUam9TMzBYOFdpMTdJckU4OGp6NEFzS09QSkpB?=
 =?utf-8?B?YXhTWXBXWVM2RHBHU0FYdncxclRsQmNhRzAxSm5RRndjYW0vQk42Q1dCdmNs?=
 =?utf-8?B?YnF5VVZCb0Noc0pVMU5LY05IVExjY0d4WlFzbWJQSmpJamZEL0wxQzdndjQ4?=
 =?utf-8?B?OTRCSDE2anUzZTJtN0FWSmxJSU85L0xQQ20vVFVaV2pscTkrdzczQnlJbXJz?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83bec097-e2d6-4516-f9b6-08ddc5f57ce1
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 12:20:31.2800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/YCzNsfgCTPZlZ8MbE7I9UhIhnD7JB5bA/mHCd/GEsPjOGlEcR13Lf70D1RAaMDN5KtWdO4//15/egTLAVHeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5063
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

Hi Ramanaidu,

On 12-07-2025 01:43 am, Naladala Ramanaidu wrote:
> Adds the downscaling test to the blocklist due to failures when
> the maximum downscale factor exceeds the 3.0 limit in either
> direction.
>
> Bspec: 50441
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/intel-ci/blacklist.txt | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index 6c91f1a70..bb4b8dfec 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
Now, files are renamed. It should be i915.blocklist.txt
This can be fixed while merging.

With this fixed, patch LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
> @@ -84,6 +84,11 @@ igt@gem_exec_alignment@pi-shared
>   ###############################################
>   igt@kms_frontbuffer_tracking@.*drrs.*
>   ###############################################
> +# Maximum downscale must be less than 3.0 in
> +# each direction
> +###############################################
> +igt@kms_plane_scaling@.*downscale-factor-0-25.*
> +###############################################
>   # Tends to generate invalid configurations
>   # using CCS planes or configurations that
>   # exceed HW capabilities resulting in sporadic

