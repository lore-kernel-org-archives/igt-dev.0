Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEE3C79FB6
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 14:02:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09A010F193;
	Wed,  9 Sep 2026 14:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NqGU3CvG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7355210E55F
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 14:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788962529; x=1820498529;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OPpcUe/z92emQzqQVvGZa2tJwDUtTpIqaUGd/ucHy2s=;
 b=NqGU3CvGFZKBLSr/cok1gGoRqKiXFZAkrq4alcIJWtNjPfgde2juI/a/
 IPADrz4oF+1RIDU1rtw+rmTqyES3rXGo1uAyPGsrHeCPCd7swjCNGfo7D
 Ee+tS0H0bewn354qP2sIAA7ID1y+2n5XuXj/jJICwiIAqnP7VEXMvz9ko
 rK5D2rNzIrHwDbNuBcW6YfUi3xObAfOQJbVN4SUDpJXQfmAIVAZGEEXpC
 F0bHsutnVvX7MIiOc7U8LEi6OX8bh981yib00X0xAMieM9qdfRBBrqE9U
 xKcqFmijOvW9Ye6fc0dgnAQq+r7itMT0xPx0dq4VNS7l6M9kk8E+7E9w1 g==;
X-CSE-ConnectionGUID: by27asG3Q0uu/K4LX1zDPQ==
X-CSE-MsgGUID: 5idF6c3ZSq+NATmQRGCkOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89419822"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89419822"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 07:02:08 -0700
X-CSE-ConnectionGUID: gDqPJ7SRSU6non26J1Qmxw==
X-CSE-MsgGUID: lMhTcjhsShiRBFbxNuPL0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="273304291"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 07:02:07 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 07:02:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 07:02:07 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 07:02:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smJ3TB+IMU7y85Hbhdpnxu7MI2ierZgYQx+oQC0dcDFXIGDaNGeubwDakWQb/r1c8oAntkgVAJvchxYz1+LPlz6wtdrVKTtdmUxMFBxOYhmIulKCUZm9gcAMAf93DepcFERdEIajl6LytADKK2dhT1lQod8vOnowrtf73NFY8rwT9yWM0HUB4PQ6U7DFz5aZgOX/prIXPRVhuuH1WjjcZWd6F836z/06nYpItMRhvwOzBotoW6xn0ev9dZjgXja1K9C79bKEQmiV7P4ysGpgapsQr3t1Nu4DHrCj2Exl7JtAEWT2ThWNo14HVS9hsNo3ssHdIRNyl0CZ5oET76hacw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1by3rOKAD21lk9zbp93U7P92J7M2J/CNWIDP79ndDbk=;
 b=LuH9a5rC3MOBdjvBmQZWYhUTiS4q4uypCvIC8PocrSLz8beis2txFHXkTFdE17sZCyzY1rsKPC8fjRxK+8Honp+LGv+LMvru86KnQUc/yuy0+uXgBGb/XvNuwldWugPlUElOh6HSwh/j76hRXkqlnd7c3fFjeM5/uV/fculyBFyaFIYdxNF9spF6AWuDcTlEyXXnr4hBW/NvO/jF7th1KtC4qASKkSbkpbVb5Nxi2pri6W/iMe7/C3qh+rByF2+Y/RJegFxz4uDOOf1SLsvJXZdBUwEbTAJ592k758D5NEVC84B8cmx2zV3N1osuzjhRRd7yzPLnT8RCyOx+KHO8cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7256.namprd11.prod.outlook.com (2603:10b6:8:10c::8) by
 IA0PR11MB7933.namprd11.prod.outlook.com (2603:10b6:208:407::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 14:02:04 +0000
Received: from DM4PR11MB7256.namprd11.prod.outlook.com
 ([fe80::86bc:2f46:443f:51dd]) by DM4PR11MB7256.namprd11.prod.outlook.com
 ([fe80::86bc:2f46:443f:51dd%6]) with mapi id 15.21.0406.007; Wed, 9 Sep 2026
 14:02:02 +0000
Date: Wed, 9 Sep 2026 16:01:58 +0200
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>
CC: Jani Nikula <jani.nikula@intel.com>, Suraj Kandpal
 <suraj.kandpal@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v5 1/7] tools/vbt_decode: fix tables' offset reading
Message-ID: <pd64tz5nvkop744asxruelmx6xjs7iimsmka7tkakqrrespmng@g4gjfjbngwnz>
References: <20260702182619.3973788-1-michal.grzelak@intel.com>
 <20260702182619.3973788-2-michal.grzelak@intel.com>
 <PH7PR11MB605359423E70BE7B33D40719E7A82@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH7PR11MB605359423E70BE7B33D40719E7A82@PH7PR11MB6053.namprd11.prod.outlook.com>
X-ClientProxiedBy: AM7PR03CA0007.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::17) To DM4PR11MB7256.namprd11.prod.outlook.com
 (2603:10b6:8:10c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7256:EE_|IA0PR11MB7933:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d63d7db-2de5-4c90-f951-08df0e7aec51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|22082099003|18002099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: QQgqFA9L/uQ4DiWTcWm1XgJ3yLcMOQ+wQ24l+xDJYmydKspqAmJqjdjDQjvLy9cWqza3IxzzsKrSizowYTgCP0TKAhqoY8X/gNsMCBVv6xg60G9gZa2ks4wngWx6xXrdWNxNHX8UWK+4G7jgrVt/R0GS1k2u9+cTLJu01vjYKysFPpo2EPUrs92fzhWEzI7/wL8Xx9qExNxKNxlwivISjtij256IIXhU758uydQxkjjcIiKPUk5TKrvqKSob+rXGWBAJWbCcsI+p8A885veQZPJpCQs8UPOQXhxskcrTJl4KUdA7a2mepF3nbfl67bYEhgBsVaRC8TgqNOCL0fEEH9F6LBRKDz/r4D5Exqg/uAvO8PhfqBUSTMH+dh28S33wdFvEFpRvzek1cAU/mZauYRK5yAXwlQ0PybepdL8f3z9ei/+DOyySXGToGv2YYX39jxAj3eCAKg6pa5r9Jpa8z77mTosIUDhuJxSPQi7PVgMERMMNFs0bSNY8g5rON4vGkoNBZ8RtJU2aYcO+WXzxrmwwMVLYQ7sbQIEPqckDC57S4g7cBlWFAQhTvoKr8YquAvsvVru0esZyfcYRV+7ASM88T/0AHry4HdgXCLofdROVV+uMBn9XLPumM0RrWOAXg3qMjXrGGpWvp052Uz+JE2plSMiamjHRKbib9k+7Uq4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7256.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1UwYnB1Uk8vWXJYTUF4dUtzc3UrcTdSK0FGNVFFd0tTUXo1ZlgwWXNwc2gy?=
 =?utf-8?B?V09kSmtoVkM0TTZsNFQ5eW1DdXdTeVZBZHRXQzNOdmhibFlHRTJiS2QwNzZ2?=
 =?utf-8?B?RlVIT3FrSUFGdDR0aG0yWUx1NGg4RTNLTWkyaTJtU05sQUhJZUh0TFBjV1ZS?=
 =?utf-8?B?bWVkS1Z6ekFzTDVTVXRrRTJLOTR2emQwQ091L2hJUkJyWU8vdHNsWFdnRVJN?=
 =?utf-8?B?bWtoWVREd0tPZlRHamNoSUVRc1hCSUdJM3cxeThscWxkR1VvR0NsR2pIMy8z?=
 =?utf-8?B?VisvYkxwT0IrYmpXYkJnM25qNVc3SEQ5WXo0WHNwcy9KbUNKYkxGMG9YbHJh?=
 =?utf-8?B?TEpuMW82enh5Uk1tM2xzWVFzWDhzOFk4MS9TVitmUFF2WkE2ZjR0WXpGNkxn?=
 =?utf-8?B?TVY0YnIyaGpnYWxnOHlJWlB3ZDJ5MER4NEFua2EyZFBmcGRHcGV5SHdYYkFV?=
 =?utf-8?B?MWxsNnBzMGhvUk5WbW9pQ1lFTy9YY0ZDTzhodEE2UWlqb0pqeTVwc3Zta3JO?=
 =?utf-8?B?R0dQUzFUZUlEbEFVbGJJVHVjYW1DQUtIQXh6Vm5KTUFYOGFCRXJJRUFyVFVB?=
 =?utf-8?B?U1NnK2Z0ZHdJaDl1S1kyUWVUUzI1akVFaTF0REJJR2ZDdlVSTk5UTDNaZTRY?=
 =?utf-8?B?dEdncjF4Y3BsSExZTml6dk15a2pueWEvdFV1d1Zsb2UwL2wrbHhCdDBJdFVC?=
 =?utf-8?B?OWxGTWVuQkNSOVpMejVmSUJnSjI0MFpHb2thOXkzYk9qSFNLREh6MVRHVjNH?=
 =?utf-8?B?cWt2SldxWmd0L1I3KzFWVzh3T2dwblMxUmNMeDVyck8xaDJlcmxLVFpWQ1Qy?=
 =?utf-8?B?VEEzVFcvY2RKQ1RJSncvejdGbzR1MGdZTEdRa3Z1ajBsWlE2TnR4MUxPQ2lT?=
 =?utf-8?B?YnlnUmYrekRjMDFCb2RsdVc3NndNTndSaTFzakVoV2NxTHI2dGFDL2dSR2Jq?=
 =?utf-8?B?S1RWekRWbnd3azUvMElrR2ZuMjI1VkNMRkZDb1BBcTNEMU13U2R1c1VDZ3M4?=
 =?utf-8?B?TTBpV1dpbFZ5OHhEZFcvWG5OTy9YTjV6YlYxY2tHWS94cGVrTnBETUNhUGNn?=
 =?utf-8?B?VXo4V1lHN2x2SHM4ckc2aUlNNFgrOVhMVmNSWlNmdWZNSncwcWFvQ3Jwckgz?=
 =?utf-8?B?Z3gzZFlyWkNuSWdYVnR4eWNtVU9DM0o0YXpUbjFsbklKVWlyMXRYdnA0cXQv?=
 =?utf-8?B?dExLWmo1QldjSzBlVWtEaklOZWhRaXoxd29ObUJOempGNkZBT3BYdEpyRkMx?=
 =?utf-8?B?cFBML2xHSFlzLytoRHd3aUd3NXVrMHY5b25OYjFLblptcnk0Umh0eDZTTlV2?=
 =?utf-8?B?UjRWMU1LOCtMb3laZlhhQWY2dUJhNlJwQTdXOHlrTVFIWWJ3a3JNc1RsdjhC?=
 =?utf-8?B?QjFzSWM2OFU4VDJoT0ZPMnNSY2E5RlVPQ2RVWkdlaHEyU0lXcDJDd2NTbDRJ?=
 =?utf-8?B?ckZkYXlmZEpjbklNZUJmTU04dUttcUZpeE81d0tHZXNTYUNCb3FPTVFiQUd4?=
 =?utf-8?B?ZEFuQnJ2ekRXdDZodXg4TGZQYm9URFh1Y3ZFZDlYN2s2TUR0SXhLN3MraGsy?=
 =?utf-8?B?cDRHZjEvNVRzVzdMaG1FQmhWRnRrNWVTTFZ0N1BZa2xmWlYySjZwNXgxaWZQ?=
 =?utf-8?B?QTQ5NlBCd3BUTkRyeU5tZUxXNnpWZk1xc3Uxekw3V3VBK1I3U3BpdUUwL2xm?=
 =?utf-8?B?T1g1NnYvcjZhdmJQd3NVSWV0OXFTVXBHVEZpYi8yc0Zra0tLaXFhVVV3dkVq?=
 =?utf-8?B?MUZWQzRQNnBDZkVvTWxkbHNDWTF6SjNYZk5ZN1NrNFRLRzhlQU5TaGRlVVlN?=
 =?utf-8?B?T3VXNkh3N0VxZXBHNlpYbEhhZ2VQSXJ2TTltT2U0U0ttaDFITmpQVGFXVmk3?=
 =?utf-8?B?VS9xcE5IRFhVdVNmL0JXVVJIUndpSldoNTZhdXVHY2lzY2hWSlh6cTlwYzBG?=
 =?utf-8?B?Y2gweEpEQU5OcUVPUlNmeThDckF1NUdZMnFOcHdRb2hwRlFBeVRvNE9EYU8r?=
 =?utf-8?B?YmNpeXpCTjRTQ1cwMjcvWVpURDhyZUtHS3NvNlo4NWZQWXRhL05xYmFMY3ZJ?=
 =?utf-8?B?a2pRU2w5TCtuVy9YMzZkaXlVK3FZUWdJOWlkc0pxWjZLWXUxUkxxRmMzcmh0?=
 =?utf-8?B?SHRtYmhKNEJmQ21QZUpJeGpiWFdKTEpLTkhnRmFDUTA3UXJ3VmhzUURHeXE4?=
 =?utf-8?B?MlZZQ095UStqS2ozQStkaFUySnRHSGxvOWN5K0JRSW9aMEwzL1lFODVQem8r?=
 =?utf-8?B?bEFkQUk0aFp1TVd2WVI4UWhncEtudndKZkZNckVaN1JkWllmTzJmT3l2QlQ2?=
 =?utf-8?B?azRoVUdxTUdKaFVnZ3pyeThZNFl6YkFHRThSQ2YyZnJWeGNWcWtXM3FCdmRP?=
 =?utf-8?Q?zGe9NWMHm8o+mhWg=3D?=
X-Exchange-RoutingPolicyChecked: yOMEEEPSLaft5xJYfoBmERatyTbcI693DJd2qyzMtwMoNnRneq4HyeZdexLAPQuvED2LipK9dXkjOhQxaoJxIfmJJpwIXAoSyXufhei49GNZ+T++wdwLamNB8ppyeziMCvE4Eg4KqhJDvnSblJcS4LrezVK4oMZKCPca8VX5JLK/MKVx4NEiLggMwaFcLqxclAw3bHYjHInxUISx1LSH0MKdgmA6ZlnUWYBD5ygEGoX4ipE2/GNjxPYKrY6FOiTdPHezhPV+Wuh+ij9YbV71YCxkSKek2H15uf58GsoIpBAMXowuHEUBfmJOUeM0GDM4RurTw60Z3hqNegZp5lLt6g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d63d7db-2de5-4c90-f951-08df0e7aec51
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 14:02:02.5896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cq0bdaHi4mTdV7BQ8moD0aWxV3afh+lpLKaR+dnUjxYdjW2uP//4b1VWieFTAr6/QD6hkPc208YjsN8Zkph2ml41/r22TJx2K2jJLJVYgUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7933
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

On Tue, Sep 01, 2026 at 07:49:48AM GMT, Samala, Pranay wrote:
> Hi Michal,
> 
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Michał
> > Grzelak
> > Sent: Thursday, July 2, 2026 11:56 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Nikula, Jani <jani.nikula@intel.com>; Kandpal, Suraj
> > <suraj.kandpal@intel.com>; Grzelak, Michal <michal.grzelak@intel.com>
> > Subject: [PATCH i-g-t v5 1/7] tools/vbt_decode: fix tables' offset reading
> > 
> > During dumping of VBT #57, all rows are same because parser does not
> > change offset read. Adjust the offset to change basing on the row used.
> > 
> > Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
> > ---
> >  tools/intel_vbt_decode.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c index
> > 9451a77318..16f1c96fee 100644
> > --- a/tools/intel_vbt_decode.c
> > +++ b/tools/intel_vbt_decode.c
> > @@ -3480,7 +3480,7 @@ static void dump_vswing_preemphasis(struct
> > context *context,
> >  			printf("\t\t%s: ", vswing_preemph[i]);
> > 
> >  			for (int j = 0; j < vs->num_columns; j++)
> > -				printf(" 0x%08x", vs->tables[n * 10 * vs-
> > >num_columns + j]);
> > +				printf(" 0x%08x", vs->tables[n * 10 * vs-
> > >num_columns + i * j]);
> 
> This fix is in right area, but I think this does not compute a valid row/column offset.
> As per my understanding, the correct formula should be as below, as this ensures we 
> move to the correct table, then to correct row, then across the column in that row.
> 
> vs->tables[n * 10 * vs->num_columns + i * vs->num_columns + j]

Thanks for catching this.

BR,
Michał

> 
> Regards,
> Pranay
> 
> >  			printf("\n");
> >  		}
> >  	}
> > --
> > 2.45.2
> 
