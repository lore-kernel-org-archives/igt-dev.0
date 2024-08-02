Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6A6C3DA4A
	for <igt-dev@archiver.kernel.org>; Fri,  2 Aug 2024 12:53:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7361710E0C7;
	Fri,  2 Aug 2024 12:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nsl/yNiu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885C610E0C7;
 Fri,  2 Aug 2024 12:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722603222; x=1754139222;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xIi/MMYgvzbHcKctIGPgEdd5uuXsM0lwlvia24DyRag=;
 b=nsl/yNiuCLb4497NNpe9s2O/JJpHJd2WdbdIAOp0jP5mxDyE5HKPiq/a
 qGHQmBvLHcbSnyZexj/LCd8W8uF3ScdbhneFEIGWDVh9dmgBMoazthv3G
 aJ7MS6kxRYd/0ouWlf/0VR2Rh6c6RKB22B33SVkA1Ym+nJ4Xd+cUeCNy3
 uzOiGHyLufJO679A4sXP+RJoV4ulcWimYoomMBxGJZm6GmGBgDzCDG/xE
 FxvrtELjNBdFngNPWdic9g/vHhu7d+2ALs7E0P4hxwCmaJHnojlKb+r11
 aiRRJuiWXe2KY4W1xsmzD1WLyKY7+lcr4qo3uIJxtbBHv8U/FUEKzjGdy Q==;
X-CSE-ConnectionGUID: 5JnHAG9LQ5qBOhByTSafdQ==
X-CSE-MsgGUID: 75JISHVhSLWzLlgmPe458Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="38082683"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="38082683"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 05:53:42 -0700
X-CSE-ConnectionGUID: 5S7IEGfuTQ+peyhb0EhDvw==
X-CSE-MsgGUID: hgC8kiWPTJ2mPFrkUG2gfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="55631790"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Aug 2024 05:53:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 05:53:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 2 Aug 2024 05:53:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 Aug 2024 05:53:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALLiFAC5JTUMsTifxdkjLH/Fs2gke3LSQpSQOoijmwl+WQt9t/rvgws7NOuBD0+5FjlKJaefrI4g0BOG8gZXXBcr5DR69tqUipsR7g2Oa0MKYYsATUZkbzPJaedn8xW1SCBUnnCeO//tnc6e5CU8w3ruK1UsdTVUAFxYwyx8DNbEGeHf5v8fW/QYlXxKmQJ2s9qadYg6bWQhA0gXIjH24JLo/DzSCLtCPMd2OHW+xlEkclLlwg4eNT4FZPdMQYplWCluFrl8wa0BYB6bvfqmBHsLxbFYMPaU6ttt1CsY4MwSBDt5pxulZ5NIREPLIr4SNhbhIptd/elMe67xXFrnbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuDlmWUM7r9+KypMBxZU7x01BqJO+HWrNrYrgcZgPPg=;
 b=mtUGQ5qF15GfAa1SwWvVBcP1HNvoeedwUI836qA7BxXEcRNwXiV8gS80BDo9jpN/IzkkQmm7BA70xY2hDrhhdYD7k3IbmfqFNk05h08IZoFxAnnoSvrrZUMSKUIXTmCxm7eovT5U8wyyQSkJnlyw+sso9PtdnoyherGDITb/FHfppDMtczgujrb5FVcJAoF3ipNFVAx3mAfSB3apLczaUCqeWGTzqaKc2YbPVratkFGLYuM1PKZDQn4018RvZKNcsetnEbG1uZ+mDWUlJxKleiFsxaPOFXBiGkxqAAmCddfkDdk8PbT9ZUMc3v/BVPFYi9rup8ZjGzVXKkJ4ORtdJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 SA1PR11MB6893.namprd11.prod.outlook.com (2603:10b6:806:2b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 2 Aug
 2024 12:53:37 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 12:53:37 +0000
Message-ID: <3faf7ae8-5e5a-454b-a0ac-50ec7f74f0b8@intel.com>
Date: Fri, 2 Aug 2024 18:23:21 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBGaS5DSS5CQVQ6IGZhaWx1cmUgZm9yIHRlc3RzL2ttczog?=
 =?UTF-8?Q?Apply_igt=2Ecocci_transforms?=
To: <igt-dev@lists.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>,
 <lgci.bug.filing@intel.com>, <tejasreex.illipilli@intel.com>
References: <20240802111059.2105927-1-bhanuprakash.modem@intel.com>
 <172260208965.503008.1673779360718371921@2413ebb6fbb6>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <172260208965.503008.1673779360718371921@2413ebb6fbb6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::17) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|SA1PR11MB6893:EE_
X-MS-Office365-Filtering-Correlation-Id: d1d1948d-2017-492d-31ef-08dcb2f2205e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmsxckVZWTFZNThNeGdHeE56MmtVU2ZlditpRDhUWHlyR1pjSkRscmdpdnFq?=
 =?utf-8?B?OVhLZ3ZMTjJyOG5yNEVVVnpIWC9ybXNmazhrTkdoZ3VtQjdpMUhDdFJudzRS?=
 =?utf-8?B?d2puU1dVVTlZaHo4YkhKanhLclg4dVcyOTBQU01tci9IUGRMYlk2WkIwUGRI?=
 =?utf-8?B?cXJ5bUxNQWt2RDdJUFhSZ3Nob1c4bVFVaU9ETDUzZWU1NjFsY2N3VE9tUGxq?=
 =?utf-8?B?VTErM2RkajJTYkxFVzd3amtsd01PMjdyL0pNOEkrdFdBS2xPVE5tZjhubEt2?=
 =?utf-8?B?M1o2c2JxYzF6UHIxYVJhQkU1Q3pYaVcza1NBMXdwcUk0ZTZsWG12WHZTVW1B?=
 =?utf-8?B?K0s0Uk1XVExDMWV3RUk2ckgvSXBiMnZhamMycVBhMUp4NXdKeFJEZVR3MGdI?=
 =?utf-8?B?Q1hlbjJlMkl5aDBXQ0d0ZDQ4UFd0V3k3ZTVSREUxOUpQc3VQOWprT0crdlFD?=
 =?utf-8?B?Z1hhUk5BNmV4U3ZsUmZLdUVla0JHWjJLUTl6MzN1MTljQ0xmMVQyQkYvQ2ll?=
 =?utf-8?B?T1JxYWNPMmFzWDAxTnlXUGZzSFBpWEUwbE83M1NWUXdTKzE3SkkvM0pidWxP?=
 =?utf-8?B?TktqUXVzUGEvUnMzaFlJYXNZdWtUMUxvMjk1TG1hZGlCelF6YXVERHVPV2NO?=
 =?utf-8?B?L3V0cFcvOVd4M0k4aXZ4MVF4Zm9qSUthMXA4Z0lrT3R1OE1tYXZXODVxaFl5?=
 =?utf-8?B?eDE5T052U2wyUVVGdzh3eHUxY0IwclA1cnNNVjNvN0x1Z2UvNk9qQTViSXBy?=
 =?utf-8?B?alhlMzJabjNoZHRNTUtuQ1g1NzE3dTNYakhZcUJsamptb0xlNVFBOXFsdW94?=
 =?utf-8?B?WFZLdnVTc2JkYTdvZENqSkZSZERWWFVPUlhSQ1FXMzdVNTFFRXV0WDdnMWlX?=
 =?utf-8?B?bkZEdWt2WXVXVHFMa3A4cnZxSDBWSFVjM2JWd2gzQ2E1SjNSRXR4UG4zazJr?=
 =?utf-8?B?blZ5OVBuRDNIaHc4VGY0S3YzV3JEU1NUMy9GQWoxM0I4N3V0MThDYloxRk14?=
 =?utf-8?B?VXd4NDBFZFlWQzNiT0F5V01IeW5tcXZ4bUZ6Z2Z1Ly9uWmtFZENDUm9wRHhG?=
 =?utf-8?B?b1pDazBLYTQvbk9TYkIweVkvN2w4bzFPdXVpRW5KeTErTnh5ZW5mU0paWU1Q?=
 =?utf-8?B?UWNCUHJHTTdrNVZ3YnFGZ1pzVkpTN2w0WWtoTU94QmVleWhKQ2M0MHJZelVy?=
 =?utf-8?B?dlNnZjNPSTNTdllRYld5N3Q5Ukw0MERPTUJWeVJIMi8xVkljT2dQQ0hidnNo?=
 =?utf-8?B?ejVWajM2TEZQekpJcU5IYndlMldyVEVHOCtvNXd0K2wwaUJnZFJWZElDN0dR?=
 =?utf-8?B?ekFmNGJTbGJZSEhWRS81SndudkhhSlVFK1VqMk1UQ0M1YXE3a1N3TFRUWHk3?=
 =?utf-8?B?ZDliWHVqVyt0TmdydDZ5ZllUMWluYjJsRldFN1hpSTRqc1J2cXkyeGR2Q0sz?=
 =?utf-8?B?d0toamFaeTZGd3Bvb21ZeEZaZ1U3VUNzZmNEWUxXbU4zWHA3clY3UGJUNXdU?=
 =?utf-8?B?MzNZeG1MdGp6QU9UZGZTSUUyQTRwMzJTMU9rQWVwZVRPUFA0d08vYy81UGw2?=
 =?utf-8?B?cUlvVkVERlZVc1FoSFNtNWNENVA1MUhwSWhTRmphMWRuZkpFNlhTZWh6clBE?=
 =?utf-8?B?TE1SRk9lSEJnQ3FEdTVic0R0cmNaeVo0U2N5UTlTdFZYcTk3S0FyeWpjdXUw?=
 =?utf-8?B?OEc0Ym94ZmJZQ09oTGhQNTJYN3A4d0d1N3RDbGNrL04vZnlHMlE3S0dCVmtS?=
 =?utf-8?Q?KzZIB1ZUSFr6aqRi+I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SE5ZeXFVVnh4V1Y4QmdYeHl3QmxCQU9FMjBQOFhqTitJeFgvT0t0U2pFYkVS?=
 =?utf-8?B?eUtqZWIwaGJSYXlFcWdUWFBoWDRaeXFQS2hXSVZ6a2p2SFQ0UUltVHhqL1RY?=
 =?utf-8?B?RS9LL2I0VDJEeHljNm5LL2VDa2M1eUNycHUzRnJIR0xFaG1TdjAxNkFtNENL?=
 =?utf-8?B?QTVSMnlndENqMWtTSSt0MEFXbXh1UFF4VmZON1JPRktUQlRsSGcwQzFPTTZF?=
 =?utf-8?B?YnhCN1BCYlVWYlBuRlY0R3kwUVZkTzEyN0I2WkZ2ZkJxN3NZUm5PbmtSVGU1?=
 =?utf-8?B?bUZVdHROcGFLUlAwNVBKWkN2UldiUTA5UW9oWUZYeEcyb0ZKWmw4NjR2UGhC?=
 =?utf-8?B?eW9rLzc5dldma1hObURMRlhEbTNNR09OS2s4WFk5ZmNVeGRicGZUdUlpOGZm?=
 =?utf-8?B?SWIxNDJZT1RvS21hK2llcVU5dGlmeWJrN1BnU2Z1QVFRWHdoN2I3Z2YyT3lR?=
 =?utf-8?B?aGZocm9DNE1TdnZvdWtJdUg0clBxQTR3YmlIZTNNTzFNenEzZVlsUHcrRTZl?=
 =?utf-8?B?bnlEckkxdmtvWUhPamhrUERzSlAyNXJLTE5rQS84dSt6SGVwZGtraExBVnli?=
 =?utf-8?B?aW1QdzR6bloxdkxlQWVRS2h4TlMzMWZsSWh3MkZOenMyanJualkzU1Q4S3dS?=
 =?utf-8?B?Y1ppU01tTWRiVkM1dTVBRVlkbW93cm9rTUEvbDZPRzFhWkcwcUVkaVZ2K1Ex?=
 =?utf-8?B?T2xLZkVkeklJMmtRZlROUjI3OGt1TU5VWXJjbnphTGIyeFlBV1ZLRC9NSGc5?=
 =?utf-8?B?N0x1UnEwQ1NEaGNoREk2OU4xczlvY0NQSGg3N010eXBRM0pMYjQ2OWk2d2ht?=
 =?utf-8?B?QzdnK25EbkhxNnZDQmxDdlhxSmFoWHUrTzdoZ2plbEluenFhS2hvaDZ5WlRC?=
 =?utf-8?B?c205cmN4NWIrQllHR0ZoWXZMSDY0QkdudEpPMHU0dG0wZzdlbEcrcDUwS1FD?=
 =?utf-8?B?OFdSQmh6L1V1VW1IUndEZG81YUZIemZOdXpWdmlubW12SVZnS0ZKWkNJZEpq?=
 =?utf-8?B?Z1BvUjBjWVZ4Y2tZWCs5SkxPam5QSEVMK202eVJ4S0dPbGN1QU41U3VKeVhR?=
 =?utf-8?B?S21QSnlkZk5CQlQwdk1SN2RsUDNBQ1VkWG83UEhwb3BLK1hCU2dqV2VzR2px?=
 =?utf-8?B?NmkyQTdhTFp5RjZKc1k5VjRBb2dDRTRtQnJkN2VwbElRTDJBTGUxYk0rUUhk?=
 =?utf-8?B?Z0tpWlhVcmNtOC9kdTA4NzhDWG4rWThmVEswR3FuTmR5Mk9HblRHdUpmUnM5?=
 =?utf-8?B?VzUvVjk1eXNvS1JCTFBnd2lxSWhIVmR3TytneEVENFVvQmI0N1NadXpoV1RZ?=
 =?utf-8?B?Mi9EWFJKSEg5ZkV1QXdNVE9NUVR5N2U5SkduRmlPM0ZjRzVSd0UrZjVVdXQr?=
 =?utf-8?B?Vkd0TE04UEpOQ3FBM0xkZ1BPVTFSd2xnRUZTMHd4dUJIZTR1WlB1UGUrR1c0?=
 =?utf-8?B?Vml2eURIMFhZL3dpdENkQ2hnR2h0MDVZN0tRR1pjc3RZazdGZVFXRC80dXhS?=
 =?utf-8?B?Rm56ZzBDRE1NWkdvTnhnb3hKd1JSdndydjR6TVhMRGFiR2U0dVdKTnhrLzFX?=
 =?utf-8?B?VlBNaFgydlJ4UVU1U1NiUzljS2JxOEhBOGNJTlM5cGhVQm1YZkIxZDhWWERO?=
 =?utf-8?B?U3R1dzlXNmVlNk5PWlZMSmlnZ3IyY3g5U3orOGtxRHhCWHBoK1JVZFJqWTNJ?=
 =?utf-8?B?YWJiNXc2TVBKZVZKNXdlUzJQNFJMUVJDcjk2anVKZzR6UjltT05IVWNNeHV3?=
 =?utf-8?B?TTVzclJPUS94MkxFckdSN0tuLzJnZzk1WEJRZTJvZkVEZnRZQVRadnBtbXR3?=
 =?utf-8?B?aHJBb1ZKRjVFNWpmL09RQTBUYWdLbW1qdUE0d01pREMzZjd0UXAvaEwxZzJp?=
 =?utf-8?B?Zm9TQ1V2Wks5aHhvRGY5dDJZQXpUVzFlR1AwdHVzQW5IVUUzSVd6c05uNVVO?=
 =?utf-8?B?Z1FaN2pZY0krYmk4blh1VFIzNlY2UTgwcUNnQVVmZ1ZDM1lJSG9pV0VSOHVT?=
 =?utf-8?B?N0oyT1FpcUZiSmNwQkl1UWpSNExmYzhCYW5kRGowVXNmY2NTQmdWM054L1Rx?=
 =?utf-8?B?aG1IS1F6VVB4dTFlVDM5bDBvSW9KdDUyRE9lSm81VGpSWGJKcFNvYzdubW0r?=
 =?utf-8?B?aVY5TVJpbE5FREJLRHc5OHd3MEJYdmQ4TUR5TE1hR0s0UXVBTDdudU81NGcv?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d1948d-2017-492d-31ef-08dcb2f2205e
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 12:53:37.6150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BnKpSMlnqLqJxfl4QST6a7li2bRQbTAS1558NmN9JOeS4NfTMTmnhAmHAF/zjlQJMk1L+mto8tn2pyASS62hgeh2z15P2m0bXETJ2YDf3TY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6893
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

Below failures are not related to this patch, please re-report this.

- Bhanu

On 02-08-2024 06:04 pm, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/kms: Apply igt.cocci transforms
> *URL:*	https://patchwork.freedesktop.org/series/136843/ 
> <https://patchwork.freedesktop.org/series/136843/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11525/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11525/index.html>
> 
> 
>   CI Bug Log - changes from IGT_7953 -> IGTPW_11525
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_11525 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11525, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11525/index.html
> 
> 
>     Participating hosts (41 -> 42)
> 
> Additional (2): fi-kbl-8809g fi-bsw-n3050
> Missing (1): fi-snb-2520m
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_11525:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@i915_pm_rpm@module-reload:
>       o bat-arlh-2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7953/bat-arlh-2/igt@i915_pm_rpm@module-reload.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11525/bat-arlh-2/igt@i915_pm_rpm@module-reload.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_11525 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o fi-kbl-8809g: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11525/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html> (i915#2190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@parallel-random-engines:
> 
>       o fi-kbl-8809g: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11525/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +3 other tests skip
>   *
> 
>     igt@kms_dsc@dsc-basic:
> 
>       o fi-kbl-8809g: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11525/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html> +30 other tests skip
>   *
> 
>     igt@kms_psr@psr-primary-mmap-gtt:
> 
>       o fi-bsw-n3050: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11525/fi-bsw-n3050/igt@kms_psr@psr-primary-mmap-gtt.html> +19 other tests skip
> 
> 
>         Possible fixes
> 
>   * igt@i915_selftest@live@hangcheck:
>       o bat-arls-1: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7953/bat-arls-1/igt@i915_selftest@live@hangcheck.html> (i915#11349 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349> / i915#11378 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11525/bat-arls-1/igt@i915_selftest@live@hangcheck.html>
>       o {bat-arlh-3}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7953/bat-arlh-3/igt@i915_selftest@live@hangcheck.html> (i915#11349 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349> / i915#11378 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11525/bat-arlh-3/igt@i915_selftest@live@hangcheck.html>
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7953 -> IGTPW_11525
> 
> CI-20190529: 20190529
> CI_DRM_15173: 974ee82a5f44e91fd93895cc12fb1e76e55b229a @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_11525: 11525
> IGT_7953: 3ec54005a0329f9435dc66baaa4f685159308bc8 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
