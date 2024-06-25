Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C43C2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 03:40:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8267410E1DD;
	Tue, 25 Jun 2024 03:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OvToWFiz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C3610E1DD
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 03:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719286822; x=1750822822;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IY+mW6yUFIjyBlK0V/pecVQReKSig0gplhf1+VurYmA=;
 b=OvToWFiz78p+FQeCjz0XV6Y/bH4s/9e6nN+9CfpNy6FB9DXgvc6+eger
 kKiYFuM7BaUib/UvhMbFA/Qdib8dP4jGhPjMncop75EFCabF8tCSQXybq
 NBzFcHjj72NI/oO2iPHWfflQnG2Vl9ot2ueBVWdVkP0+ND2KUcT1Exbst
 kHbL7L1a3E4c2CXmPcbp55tnKDprNp5mR38YFzKOFmQ1VK6Fmc2OvUISK
 sXDWsLOtRsZXD0IiBVFWRXZjFknSJNCwJUtUuwxRvpzm7eIbz1S8LB1vu
 VBFY5IfnFQdODNbIJGJ3hGV4i7+ASccmrPVXdZBAT0qzZWFcvHG3HwcoK Q==;
X-CSE-ConnectionGUID: GaEqLaL4SPiLtXkmGBG6QQ==
X-CSE-MsgGUID: 8eIhFICmQb2Lv0fT8EELEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16409089"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="16409089"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 20:40:21 -0700
X-CSE-ConnectionGUID: GDKDXWi3SFiKiKQeYi3BWw==
X-CSE-MsgGUID: 5ykvPNFqRTaw0zJ/cgiqBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="44196382"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 20:40:21 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 20:40:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 20:40:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 20:40:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgsjU8uwEBUE6ypAtpxJ0O/V+ARLaZx0UV3e6onoduwPJ1Nb30ZO2BcUqS0M7mR4yVK71/rlhbLoadQRJ4J04uEQiDDbWLnZmgAWeLRLUGe/wCz9LXovBpe7mPBQsjddT7hTSQ5hU5HrF+FZZgsgrKp7Pd456H3o/A0gdyOmp7AjOjD6fD9I2hJIelLWYhJe4yZthc50jNptWCtGO6/FqmdWgVnPxbXa5uWPijz14016w2PiT2H/TfFdoh7bodXKndu8AV9DFYJTJ20jYBcBQCXY82ZGE3CD4UuxtonoMPSFuHI0ugaVAGLWgp48HBnnoZK9EA62uvQS1pv4dqcoWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e86Q9MGQ24l7sqLEu1a6pZhR74TNAKF3WhjNz1jvbJM=;
 b=cOPhE+gDStULQqcAyGU50/PpSiRgnWLUmMFbRV28qNg5lmBcjXg6z5eheIzxNmHvb74KkEgWgp9miuoqE/3wzE5mz/vStriaf45AY67x9R7IfRQ9keu7S0+eJ58S7ClbkcH8xlmvusRCwCG7+xMJDgNy/iSp2eF5rPw74OH721ih86+jx0uEOOkOmvDU3Fc3gsvRHufXhanBMl5iWz0uR0Js4Tz5dxjkl2FN93yhZaU97YiVqI6AYagmDAZDFsktTpcRwl+StVQrR0rWhfJZuamea0ursPGHiHLTiKFjd2M7Ewhm7JA6hlYTND8x/jHyw4HS+GRTSL3RnYTnDFUE0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 IA1PR11MB7199.namprd11.prod.outlook.com (2603:10b6:208:418::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Tue, 25 Jun
 2024 03:40:13 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 03:40:13 +0000
Message-ID: <111453f5-c594-4d05-961e-2399d2dc5959@intel.com>
Date: Tue, 25 Jun 2024 09:09:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] lib/igt_kms: Format cleanup in DRM mode printing
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
References: <20240624151028.205562-1-bhanuprakash.modem@intel.com>
 <DM4PR11MB6312DD541E91C4E60C8DA53590D42@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <DM4PR11MB6312DD541E91C4E60C8DA53590D42@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0176.apcprd04.prod.outlook.com
 (2603:1096:4:14::14) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|IA1PR11MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: cd47868e-8ee9-4511-c89a-08dc94c88560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2d5clRUaHhOY1g3MmUrUmlBUCtteDczUUdWenhkWFl6ZSttOWU5RXA1VFRp?=
 =?utf-8?B?TVEzeFErby9DV3I3YXNzbDNnRWM1Rmh3L0VpVWZWZmI0SWx5VSs1OWhVNHgw?=
 =?utf-8?B?UXZLSXUrVG4xL091M2Y3YkRyQjNLak9UNEpwck12bnhva3drekd4Nnl3MnZm?=
 =?utf-8?B?Snp6c2RTbktuZ1JRVW1vR2VVMFFoYkZXSTEvSVF1cEtvNjBMVFllS2t4cG9C?=
 =?utf-8?B?dTR6V3Nmd1EzTkFmVU1SMjhqK3FnemNXUmtUVTBGZmFYcGdkeU1ZZmJuYmxq?=
 =?utf-8?B?Slo3TElkV2N6QzNiVGpWQmRmVHdncXFyY2RjQktGL3hURFE1MVJOUHVyNTMx?=
 =?utf-8?B?VzZ5OVkrazk3T0IyM3BkVEpYRzVVZ3Bka2kyMnhNN1lHbzQrV0M5TDVrQ2lt?=
 =?utf-8?B?VHZ6VHpIU1VIZU9JWHRncTY0WCtibUFIa0VJN3p2ZU5wTW1xTWVCdlIyWUdr?=
 =?utf-8?B?QmcxbERCKzk0QWRpZUdVMWN5VitWZkNxanpLRDJTRHdhSzdhOUpIVWUvV2Zr?=
 =?utf-8?B?OVJhRyt1TVlDK0ZweW5ITGZoeHBldHdTZ1BBa0YrclNWTlRPTnN1MkZadGRS?=
 =?utf-8?B?c3E4S2hWVDJoS1VhcmZSYzN6Q2d4ZDgvKzVyTEJsdGRZTVVLYlhabjYzMGkz?=
 =?utf-8?B?WkZSdGRGTG1JNnh0WEttSWxVa3hnOWJKRmRLTXY0Y3dDRGMyNzdoMG1LdnNR?=
 =?utf-8?B?NGl5WjlBZWdFNzladjI4a0JHNTA0Ty9qWlhEekNNSnRmWTd6OGdiN1Q5VDBo?=
 =?utf-8?B?VjliKzFjOTBTRS9RL1l4U1Vvck5xTUJoSWJ1K2p0ZUdJTzlVekNIQWQrWkNN?=
 =?utf-8?B?QkJDR0RUbk1nc3JuQmtTWFFSaTZncFNSb3BrWlI2a1BWdGtwYTFxOEpKWVN3?=
 =?utf-8?B?OFRtKzNrVFZJVWRjNllVNFZoK1puNzVSZlhqeWlUdjFhNjF5Q3p5a1pIYytF?=
 =?utf-8?B?bXQ1Rkt2dmlxTjRsbDlndjdWcnZxTlN0d0grYXhGSDFRc1lNVWllaWxGbTdF?=
 =?utf-8?B?aVh5dFFJajhkZFZ3QnIybVkrWThyNVdVTHVlZEJyci9pSzNjL2M3OXZtVXh2?=
 =?utf-8?B?dzhDbkVVcGV0bGVJQW5sVEtBLzB4RTlXV2c3dktlWTUzMEdhU29XaHh0TTNW?=
 =?utf-8?B?LzFNdTR1YzN4c2lHb2k4UTY5dU54TEs0emc5L05XUGVpQUxxYWN6VU1aNit1?=
 =?utf-8?B?OElBZ1lGakVDZ1pKbHhtK2hkalM2aHZkODJ6STRlWUpaa2J5dXRQOGo0b3R6?=
 =?utf-8?B?U0t5aU81M3ZMSXNscW95SEwxeDNjTU1uQXRJRnZRQVR6UDN2R2RhbmRSVWFS?=
 =?utf-8?B?a3htYjVPWFgwTmZiOTlrTkJXa3JObUIxaVNqWE9Pak9rbGpmdDhYUllDOUZp?=
 =?utf-8?B?UmJOYnZyZlIrbDNTVnAyUjFOOWVpLyttTGYrZHptMDdheWJIV2ZBVmZtZlNs?=
 =?utf-8?B?YTdpaUc2aGhMVEw4OXkxUk56WmRYWUhTR05KWVJXUXVzYnpnWTUvS3g2Rldk?=
 =?utf-8?B?YzFicm1WQkdhWU0vUUNTWURFcDUxUCt4VVJRekxwTWtDTkNQMEE3c3JPVkwx?=
 =?utf-8?B?ZHZLVThsd0NSNlRrOUZVdTNyVVYxa01mNXhVNEpMdGNJUW81emNQU2xkVFpo?=
 =?utf-8?B?dEVPK3NlMEg2OGpaL2VTcXRvMlZ2MkVNN3NtdWZ5MTFwMzZJR0pXTmxhWGhO?=
 =?utf-8?B?Sjc5QlBJZ1h0bXNCdHhhY2oxUHZxc3pqcWFXc2V6TEJoZGxOZ2szUDNqWHJa?=
 =?utf-8?Q?vJiVoAy7f9WwjjDFBE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzhqZ3JaSjRuUkZhWDlmREZkRUdkSlZOODdjRndjUzFBeTdYQjhFVHU2bHVv?=
 =?utf-8?B?Sno2enpLSTJ1Q1BwRWtMaXk0cUVPUnFxeUc1eG9xeUczbFcwTXQ4aWdNTytm?=
 =?utf-8?B?RSs1anBiYWdaMHM4VFhtM2V3N1JKdFBqY1F1dmpGOEhoUk1vbnQ1eG5hejE3?=
 =?utf-8?B?bG1waFRMdmRJblJoUEZpTlludy9vaDB3M0ZFNE1PR3VGdk4yRzg4UStIUEtC?=
 =?utf-8?B?Q1lwK2hJamtGc05oc2R6dUdCRUp0SnFteEpYWFgvdXNBY3BCeWI3S2pHWk9P?=
 =?utf-8?B?bVRrZXlEY2ljMUtKcm9RKzczZUFrczlHcVBBVHdTYUVTYmYyUXRSVGJZSVFo?=
 =?utf-8?B?ZWdNZGh4S21KMlBkUUhRK3RaZi9jV1BSN3JtdmNwWGtYMFUxaTZKNjdrSG5L?=
 =?utf-8?B?cXBkeGZiMm5md3BCR3lCZlhKbUJlRHQ0STdudFlicFdPYnhBdEhBNXFoM3VU?=
 =?utf-8?B?Yk1lakxGUExOMnE4VCtpQ3BLSTVOdi9oQmJQYVJUYzIwbkluMjZLNUdUVnZV?=
 =?utf-8?B?MkxLcjdMZCtlRmZxc1lhcmxtblgrU2tydm04OUIvY0IvY0M2UnNCbyswN1Ey?=
 =?utf-8?B?OFFueWtBYkRNajVDSWFmSmlPanB0K0QrSVl6aVBpMURZd05xTC95TVFuaEdN?=
 =?utf-8?B?ZHptREpyUFBvNFdxdGhuTHNTeGZ4elBpZjR4Z0hwNkRWZkJ5TXFZYlZ4Nzh2?=
 =?utf-8?B?SFBVMDdxaGkzeGRtNDRHbS94RjZocE92VTZFdlFJcDBPZFdGY1VkRVJtK0gr?=
 =?utf-8?B?MnFhblpLWjE5dVR4MjYxN0NiSlJIMVlFM3ExQ2Z0Z2QvRlFZRzBRZHc3OC9O?=
 =?utf-8?B?bGMwMWRma29BbWw1Y1RTeUV5emJ1SThaTEh5dUNMbWsrektPWmFOMzVQSFNT?=
 =?utf-8?B?SFJEWjRyVjN5QXFOVDMySHpYSWlJS0hsTTZYSVhCcDRXT0NCM29IKys3MkhN?=
 =?utf-8?B?UnRsczM2T2xHVklBanptYlBaNEVCVFBRT1ZmSTAva1NldVpYMm5CeENXRkcz?=
 =?utf-8?B?UytIQ0NmRmZHUXdzelRDWkdubFZtOUtwU2ZvM3JQU3VXUzRZMUtoa0k5czk4?=
 =?utf-8?B?cmsyNVpUaWhxNzlJanA2T05uZ2RHZFYyZ3dUR2dDRlJIL2RWN3g4cFpjTkFR?=
 =?utf-8?B?UTdqUVJQOXg0dHY4MzJGcFpMaTJYNTNDWC9rN2ZJNk1jVU9iemRQNXY4ZHBP?=
 =?utf-8?B?dnNVb0JvSlUvcURzSU9Qd2xQR0JzaVlxV0RoQXJwT01INHdBcW5ONkg4STBv?=
 =?utf-8?B?Yk1NNklHMzdNOElWV1I1b0xLUzRPTVQyRXJCNEkxdFZ1c0VLbmtkVTFlOGRW?=
 =?utf-8?B?ZHFEM1VuYmdzTk1VY25GVFA3amlVcW9aMTh6N0tRMGZLY2h3Z3loWU9mZGQ4?=
 =?utf-8?B?Q1d2SnM4cmNOcDJ3cEFDdkVDK2NxUngydmtJWUkwT2pzbmNmK2VGSFR5WWpC?=
 =?utf-8?B?ZjRKQkg3MXFTb1g2bFFaM3FzRzJFRVVPb2N3UUptT1hUeUluL0hhNkJQdVVn?=
 =?utf-8?B?Z1BlcGY4YzF3QWljcGJWYURWQ3ZkeU9kWm9TMktPU2svbFU4N1N4V0k4V093?=
 =?utf-8?B?V0FvUGZRcVNXNkhpYkFTTWxrQVYvTUs4YVVVTXpzaXBjdldZdlQ5NzNqcVFY?=
 =?utf-8?B?cHk5aDZJaHc1UXFYQ1U1LytKeUFzSXRTRm1GYk4yTER3Z1BzcmZ2bkZtTlBq?=
 =?utf-8?B?T0tvakNwQ2l3MUpwQU9kalltT3cvY1diU3dFcjJ2bXhub05SUHdDQmxPNlk5?=
 =?utf-8?B?d09vdnIvaTBDY3hDc3N1bkhJMXluNFVIandwbFhXSUlBZVFDYkM3bkFMbG9m?=
 =?utf-8?B?YTNOeDc1MEtqS3Q1MDRlcHYyWGtlanFqZWF1dkVEQTJ2NGJ1Qi9RUkMrUTdy?=
 =?utf-8?B?L2pLcGZrT2tONmg0MTNYc2RobzJmTzFDOGE0Rk11OURzQ0RVYXRORUJ6cEps?=
 =?utf-8?B?a1hsSWw2YjFBUmpFMnNFWmJKNTlDWGI4dVpkZm8xdnN2aE4xL0tLSlB0SWFl?=
 =?utf-8?B?bEFIV0h0b1ltUko1eWVwODBDTko4UHExMU1Xc3dpemdPWUJicGVDR1pqRE5u?=
 =?utf-8?B?WllORHlXaStsRS9QK21NZVM4MGVXU0lDY0NjbmRmR09JUk1Ua2E0QmI3eVh6?=
 =?utf-8?B?aWFTRWhnTnRJQzQwRnhNUnhXeVN6OE52WTdOUVo3Y1RXUVBud0JJMm9qQm9I?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd47868e-8ee9-4511-c89a-08dc94c88560
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 03:40:13.3681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHlbYq8jw45UaeczKPogbwqBbvqFGIt69AESUjFr1o+hrs3oXKICLi+dlY7f5TrT2zyLPDMmDHV3CXA8GXrukkMaTzZYKnHccmqQedIPeyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7199
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


On 24-06-2024 11:30 pm, B, Jeevan wrote:
> 
> 
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>> Bhanuprakash Modem
>> Sent: Monday, June 24, 2024 8:40 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
>> Subject: [i-g-t] lib/igt_kms: Format cleanup in DRM mode printing
>>
>> While printing the DRM mode, align the style with the Kernel logs, so that it would
>> be easy to compare & debug.
>>
>> Example:
>>   Old:- 2880x1800 60 2880 2928 2960 3040 1800 1803 1809 1906 0xa 0x48
>> 347710
>>   New:- "2880x1800": 60 347710 2880 2928 2960 3040 1800 1803 1809 1906
>> 0x48 0xa
>>
> 2880x1800 : Is better than using " I think.

Sure, I just adopted whatever the style used in Kernel logs.

- Bhanu

> 
> BR
> Jeevan B
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   lib/igt_kms.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 2e6f44e3c..1c096ec5b 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -1144,13 +1144,13 @@ void kmstest_dump_mode(drmModeModeInfo
>> *mode)
>>   	const char *stereo = mode_stereo_name(mode);
>>   	const char *aspect = mode_picture_aspect_name(mode);
>>
>> -	igt_info("  %s %d %d %d %d %d %d %d %d %d 0x%x 0x%x
>> %d%s%s%s%s%s%s\n",
>> -		 mode->name, mode->vrefresh,
>> +	igt_info("  \"%s\": %d %d %d %d %d %d %d %d %d %d 0x%x 0x%x
>> %s%s%s%s%s%s\n",
>> +		 mode->name, mode->vrefresh, mode->clock,
>>   		 mode->hdisplay, mode->hsync_start,
>>   		 mode->hsync_end, mode->htotal,
>>   		 mode->vdisplay, mode->vsync_start,
>>   		 mode->vsync_end, mode->vtotal,
>> -		 mode->flags, mode->type, mode->clock,
>> +		 mode->type, mode->flags,
>>   		 stereo ? " (3D:" : "",
>>   		 stereo ? stereo : "", stereo ? ")" : "",
>>   		 aspect ? " (PAR:" : "",
>> --
>> 2.43.2
> 
