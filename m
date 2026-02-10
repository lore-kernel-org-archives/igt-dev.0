Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF60BE9463A
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 03:53:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A5010E198;
	Tue, 10 Feb 2026 03:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g+FHPfwZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFC310E198
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 03:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770695584; x=1802231584;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=sKdD3oDzrKPN5XZ6hTKo5tH6/nwfLPaNAD+xTrJQr68=;
 b=g+FHPfwZWPWy/IxH8+Fvdvfg9on7pKzw8l6ccgDBeCYYK4fOfSkfj4sw
 9xEH/Ol+oW0y7uebEaMSDusVg21kkvMNq+a+EUiBfz4G2CyZnMjpAfmoG
 XKf1na9hploRVDDYMrgwR/2Gn05PQmoCChKYGw8HjZ1CirErdPXUVUHBl
 bScR31uAkyCTMpgyluK+q3w1CNLX25NjXZBcUrOzcIIjpAI9cc3Jean/Q
 kM8JkyL1JL67EXKZU1U8eTEuNOqTNcdcvgFT0HReC9OBdpyX4XVx6ClNF
 2Deb/P6+iu8ceLwRz+vFVXB/AIYu/hMB5Cuyrodf1U4TyvHGcNVg3J5jF Q==;
X-CSE-ConnectionGUID: 7EpxboMnQFiHWPv26eu0RQ==
X-CSE-MsgGUID: KzEMJq6YQ7O40rsLw3Iqyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71857578"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208,217";a="71857578"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 19:53:04 -0800
X-CSE-ConnectionGUID: JHv9ntOESaO0pbN7MF9HDg==
X-CSE-MsgGUID: ZU80CC1jRdiaghwXA/uUEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
 d="scan'208,217";a="211101390"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 19:53:03 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 19:53:03 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 19:53:03 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 19:53:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1chdUMncu2SAhODhsVRmi3e4Xf0OeBSgl0nM0jilVhK6MHMegbzD4nD7nHa0cJmyEgCOYJCPzkSzKt8Qpw2HEf7wPkAZMbWLwPPpfLQBGIwkMYRKAY8VVowA8td8RqJtwQck5cAFM5qyLiJw9GXpod/WOMwMbIn4H3SJEIZb45QTXxlJyd9YCOD+EP6JKjU6mSqkJ7WZEOv6DRWfgjOmsVGHVWcXoDXpLBcYADmb+NCyqp+Ir0rwkrOaRdY65zZPC+A+Q7L6JzCk9iI3wn5znKrA8PhTQERvDe1GqpMdw0U5jsu51rrAYxEzxii/oG0Kms5j5Z/M8nsRPhxvoGvag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6+ZylxUhiujyBuSI7wx4HKh+qZRJHAwSzujMJVmEHc=;
 b=Dr+/UjBz58UDJwmlJd2UvUuuHfJpHS/SUsO0pzw8uJLPMSO7ToMlcpuDRblwNHLr0SQDK+dURGUMs8ogj5qLlMhmBgDf4/cY/uA4g01oHkNRe+Vfd/cMhD5xpzkQhIedHF2Hh1rA4ySHimsoIWNlThjFbs6dvIjGqRLdjCmpX3PW0qK25UdnVRhrARVt3iODrV9xJzpouzDy+c3xW5tBYwo5qmKCekNv5I+UYm7zRX64lhGZCF8p8bX1ypJmewXrDe2z5urbJlpxwIslazbFH8GomMjcIaHwyYEMrpKHKgR9SanLS46PQWPCdQNbJGW6jGRowWEvj8HYVKWcQdiY4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5253.namprd11.prod.outlook.com (2603:10b6:208:310::20)
 by PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 03:52:55 +0000
Received: from BL1PR11MB5253.namprd11.prod.outlook.com
 ([fe80::c721:b1ce:dcb1:11e1]) by BL1PR11MB5253.namprd11.prod.outlook.com
 ([fe80::c721:b1ce:dcb1:11e1%5]) with mapi id 15.20.9587.010; Tue, 10 Feb 2026
 03:52:55 +0000
Content-Type: multipart/alternative;
 boundary="------------nyQbTHdwcjcxQy0ya6MG00Wq"
Message-ID: <df5ee99c-0720-43cf-b3ab-224ac77fdbce@intel.com>
Date: Tue, 10 Feb 2026 09:22:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/2] tests/kms_plane: Skip unsupported modifiers
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <sameer.lattannavar@intel.com>
References: <20260209083331.1088550-1-pranay.samala@intel.com>
 <20260209083331.1088550-3-pranay.samala@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260209083331.1088550-3-pranay.samala@intel.com>
X-ClientProxiedBy: MA5P287CA0248.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::11) To BL1PR11MB5253.namprd11.prod.outlook.com
 (2603:10b6:208:310::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5253:EE_|PH7PR11MB6451:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b860d7b-3ef0-4982-45e9-08de6857df3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3RSTkduZXllVlhTTm1ER2xzeDB5c01Xc3V6VVRWUmhtRWlmRWNCS1UyK2Iz?=
 =?utf-8?B?b3h1cm1UWkpObDBYUFJWaGN5S3JSSFFnanBHNGp1U2JCSkd0QTJ4RTY2V0lk?=
 =?utf-8?B?eVBVQnU3SDduNVQ0UC82T1BpbjU0L0xuVkw1RUVHNWRseFRnUDY0VTh2cWFP?=
 =?utf-8?B?NUtzRHpvSXVlMHFOWUYySWZrT1ZPVHFtSU5wOFp3eGU0eVFReW9jb3VTNmI1?=
 =?utf-8?B?S3dHdStramF0SlMvS0VCME9mK1BKbmErQmltQUl6V0tITFk0SThYWlRINUJS?=
 =?utf-8?B?Z3JzYzZqZFlmWThWUmMyMEVBN0NaOCtaWXRJaERoY0RRMmR0YkV0dWtZMmNp?=
 =?utf-8?B?Wk1tSVJiRUlOb0NhejV3Ym5Lb0RYWE93YWVjTEptN2ZUcHBzWDRTVW5BQUVQ?=
 =?utf-8?B?akRlVm55d2ZQZ2g3N3ZuNTRYdzdSU1J4QUxSemdseU9BbzhWOWRWb1hwZDZD?=
 =?utf-8?B?LzhNN1FiNkVxS0wyNmpKZkZCUzNta0hkWk1kSm9PYUx4VmdUeFF0L2FHWFdZ?=
 =?utf-8?B?UG5ZcmRCN2orbjc0NzZlQ3J1b0kxei9CVzJaY05nU1dMeHR3bU15aUVWSmpP?=
 =?utf-8?B?R3pwOGhoZ0hMNTFPamVtT25wdEJVeXhUa0kxMnBydC9vVGN5bXoyMzQrVlNl?=
 =?utf-8?B?ZFN2cEdFcTVqVm5DVDk4Q05vYmhVT1Ztb1JlNDFQR3d2S0FYZi8rUVRMeGJB?=
 =?utf-8?B?ZGpQaHdMVHhvQkluNjNidHNXOUhRTHNNV2ZaWU5qakZTWno3bm9YaElEVnJN?=
 =?utf-8?B?MnNUcmgzZVhXWEJZZlcveXBBcE92Y2JReDJEQk84a3JuN1l5bGZEaURSdkl1?=
 =?utf-8?B?VXNhcnZ3NmVCSHFmaHdHWXV3ckpyWjBCZWpmU0lQYlNuUTFBZCtwZ3ZOcHZU?=
 =?utf-8?B?OW1EeFkzUHhKODl0a2d3cS9Lb2ZUQTFKZk5VUnpNbit2TTk0SDFDamIyT1Zi?=
 =?utf-8?B?eFpWaHlkSkNqRW9UK2kvc3FlMFJIcnJQSTRmckFPWjVsN2xlZlFMcC96MEJZ?=
 =?utf-8?B?bG45V3U5WEo5STl6d0FZTlZ4U0lqWlk4NEphRVlqMzR4c2ErS1dNb0VIRnZp?=
 =?utf-8?B?LzNveHRYYk5mL2JUUlJ5QlI0Q3gxVGpuVVlpYzhKaHRNSU9ud3lSZVBSZ2tF?=
 =?utf-8?B?aEYvREdvMFIyVmRKVEU3UDlJbjVJejZxU2tIVlN4VWt5dEVUdHFTa255QjZN?=
 =?utf-8?B?cnhYVUlJRWJPa3F6cEJjUVA5ZHJLS21hOEo5bkFoWkp1SEJWaFN4WDZWZ2k0?=
 =?utf-8?B?M2VGYklRTWZ6ck96dTlBc2prT2FONVl1ME1hcTJrZVlLS1dHY2ZmVFBhQnlm?=
 =?utf-8?B?cjFJWHp5by9KMHpHdk05b01oMG9rd0lzTTRBNzJXN2txeDdsbkpodlFDNVVB?=
 =?utf-8?B?Z053QlhwV05SRGowdmpUaGZVNi9BS2Y0RTg2ajZwL2lnRm9lOWVBVnNFUU8x?=
 =?utf-8?B?U1hGWUxSdE5ZMFpKai9MbW9VMnl4VER0MGVONzZlWVYwZHNjUFRnUTNOZ0V0?=
 =?utf-8?B?cnlVc3BKcVVvV3ZkQi9wUkdCc3VnVzhDclo2M0Y3MTRpSFVIaGRQMThWLzRx?=
 =?utf-8?B?UjJ2R2RNSUZHVFhkV1FHMjVlSnRZdTBWM3ZBTXhBYWl5eXhQR2lLcVpMTW9Y?=
 =?utf-8?B?eUUzbE1TckZCT1ZlV0thNnQzUWRXVDF4c0l1UzV1OVpSTmQ5TUFRS2VOS3Zr?=
 =?utf-8?B?MWk1ZHpDcHQ3WGNlbjFFbUNTTi85ZWM4bmJ4b3E3R3lMZXRQelFZc2d5VjlH?=
 =?utf-8?B?SEZFUVpjeHlyN01EKzZZalZrUGloM01aRE11N1V1dXoyZFhmSFk1S3FUQUl6?=
 =?utf-8?B?b3RTcEgrb1RDUGJNZ0dZVzFNcTZiMHdsbHAxZmxSQjVCOE0yVWFGK0x4bG1V?=
 =?utf-8?B?V1ZqSGhEOE1TZFRxYmdNZ3lvOE1MKzQ1QWdnNWRKUFovL2JzcmZocGpEMi90?=
 =?utf-8?B?b2piS0dodU5WWnBBT1U0TGtUbGxhUVRrdkd3STFVN3E4SHd2dk9ZUHdPTUx1?=
 =?utf-8?B?K1pTSndNeUIzcEtXR1JVcWo4dTEwOFVKbkMvR2daSUNCNDRZL3pGUDQ0NmRj?=
 =?utf-8?B?T21zOHVwbUZnZGZsOXFRMEJkVDNyNzhOcWJ6NmdHZGJodmRuQzk2a3VKMGFV?=
 =?utf-8?Q?uOq0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5253.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djc4UFJVMkwwQ1Y5OEdweVQzdWVmTWJMei9hczA5MXFncTJ3eHZHYUdlNXlt?=
 =?utf-8?B?Q29EbnlZVEI1ai9XMFU5VlFYTmVKeHNLb3paT2hJRlFuNWwrYjBSYXlEcmNG?=
 =?utf-8?B?NlhrYXRmNUh0bkJVT1lMcnBab0lDajlINE9wRnJ2c2ljT1pQQUlvdFZXNDRi?=
 =?utf-8?B?UFMrWkVsN0s0YUxvYjRuWTkzNE40YVRkWlhKWEdYK1plRHYzR3MxNkhKZUVv?=
 =?utf-8?B?dnFERzFxSWliNUd1cmUwTlYxWHZ3R0F1SFpBN2ZkZklqaHJlZTBwYWs1cVFv?=
 =?utf-8?B?T095ZG9qMm1OM0JMTmJsR01lTGczMjZoTGtIdVhhNEQ3UXEra3RIRjkxMktt?=
 =?utf-8?B?MVJJYW1tUlhaVTFIMm1VU1NJM0R5cDhJc08rM3Njd0FQTnZ0ZVdBZ1BUTGZo?=
 =?utf-8?B?R3ViYmhJNDV2YVUwcnlzR05zOXN6N1FlMkRUcE55WVAxb3ZGbFUrcmlRYWJx?=
 =?utf-8?B?U1N4SkhyWXJxRWttbmd6U0R4YldqV3FOSnozcFFDTEFSK0FTMzdtV2pMMzVx?=
 =?utf-8?B?My95Nm9FWTZZcTNTS0pFYXI2c3k2Y29NdnR6UWJxSWFLeDZnNEtlcjdkZFYr?=
 =?utf-8?B?YTNZc2locndlU2ZNUzdMenEvNVBjeWhLS0xCNzd0QkRDMlU3cUV2TzlvQ291?=
 =?utf-8?B?MktFRGdVNEJ3MnN3MzlKUUJXYjBFNGIrclhQUFlwbGk5THlVdS9tKzY3NVcx?=
 =?utf-8?B?ZFpUbW1JVUozZ3F1eHNzU1ErZmg1clF2bzlaN3l0bHF0MFAzVy8xNG9xS01C?=
 =?utf-8?B?ajczdVB2TUNUT2N6OHhYeFZoOWdMWkdEZ1pwd0pqUS8zV2lzMVJhV2t2cktC?=
 =?utf-8?B?MXpOUGtLeGc0QVZ5MnFuRXJwS2dWdHlkMnpQQWp2d0pBS09ZdUZNanpZQnUw?=
 =?utf-8?B?NkdXQTVPZThKTVBGenh5RVJLMktaMFZYVnlXVkUzTHFZcXlnSmoyVjRySWRz?=
 =?utf-8?B?Y1ZqVmdTYmJGcW5BZkk0cWk5SGxYQStmclV4K1RHdWR2MXZ4aXhZWG4vRHJz?=
 =?utf-8?B?aVZZTFVnOWlJd3h0aDMrWlV3R0N0T05zQ0tlcUdQT0ZETHNRU3p5eU9leWtv?=
 =?utf-8?B?UjNmaGprODNYNSs4anl3a1NBdXFaR21oNklFdkJvbFg5WVUvNjg4N3NFUmpi?=
 =?utf-8?B?R0M2Z3AzcmhJMUtHeXA2d3FGYzBycWxPL21QZWh1UjFYU0hxazhrS1lab2FP?=
 =?utf-8?B?VThqMEkzeC92ZEZiRE1zRUhxNHZjQWxTMWxNQ0gydHZKWElsMG5nWEVTZ2sr?=
 =?utf-8?B?Y1Nib2dmejVKbXNIQm9qdUFNNVNHNk1YNGVJczNRbTNZY0RqZllMSUUwV0JC?=
 =?utf-8?B?M3FiRVJOc1pRcXpIRlVwMHFDZEM5aEJBckpYaEdXVTRIRmE5Z1h3NXF2QXJo?=
 =?utf-8?B?cHVCcEZoeFlKMlFjUklTNDdHMG9lczBXMHdLa25HSzdPWTB1SVkvN2RZNGVQ?=
 =?utf-8?B?bE9nWGs0QW9OUk0yam0rdkwyTEtUbDN5QUJ0MjFQYkd1QWQ0WkFNeU1QaHNQ?=
 =?utf-8?B?UHRudVVFS0I1RkJnQmxFeTZkdStJQUhEUmh6Yis5aEdDclZSamFBTVRZdnBX?=
 =?utf-8?B?WTVjdTFTc2N0enlJTWpTNXhUK0Y3VjlpU2x0QkJHbmd1My9WSjJoaGN5dFow?=
 =?utf-8?B?YlhzTFhwWGZhNmQ0d3g2ZVM1YlIwMHdsaUdxdXVpUDUyTUpnOG1YWVhQWlln?=
 =?utf-8?B?MXp5dFhHdlJQbWNod21JN0hMbkk2ZXhhcWFaNUhCN200MUlUU1JOekFldmVE?=
 =?utf-8?B?UHVjb2dBZFhpY1lnaTZXQlBZWEZUbHJQUlFzQ0tmOE1vVTRBL3ErTzFLK3lD?=
 =?utf-8?B?NjVXMkxHS0ROeDlZdkN4SU5xWW5tT1pqeWhjVUtlTDhaWDJsS0dUNTlEUzVV?=
 =?utf-8?B?QTVoZXlKZjFQci9OcmFmbG00TDR1UG1hdU8rWWZKOTQybHVDYW90cEkrM0Mz?=
 =?utf-8?B?NmJ1YnNnTDZabnh6N3BGWXZ0V1ZncTJPZ0VFMXJFOUNRcHJjV0hOSkxUNUtW?=
 =?utf-8?B?YTl0Z3o4KzRSYW9WWXRyTlU2TjMvOFFhZ0dVRS9iMTRsN29XRDcwTGJIZ2g5?=
 =?utf-8?B?Vmg0TEE3TVNnaEpkVDJYWDJrZHdVOHZMb2FsOFhBd3BYR1k0ZDNVVWJ4ejRx?=
 =?utf-8?B?M3lMZnBOamZCK2IrSkR0b0VxdDFqMExjY1Z0Ky9OSGl6ckZidjdQTzgzS1JU?=
 =?utf-8?B?aVQrMy9zc2c5aVVRenQzK3UwRTROZ0NaVkpvVmEwY2J1YkN0aEVoY2FuMWR1?=
 =?utf-8?B?M0tkL21nMk5xVGZzcVRSUy9LakZRSGhuZUlBWW5Ia3NUZ003SFVuanJMUUNH?=
 =?utf-8?B?eXlySHUzNWorb1phSEp1emhiUS9naHdjRDJIcUJLeW80Vy9EQjdFMVJraXAw?=
 =?utf-8?Q?BT/nePNcRrNSA5R4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b860d7b-3ef0-4982-45e9-08de6857df3a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5253.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 03:52:55.3962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OO5sw7hLltqrAB3Rxoyt5SVy70NMlbwrkUn9jvcUvIztTzA2lCW8EzPEJ6OTHfCoINfx07YnNcU+Ch22ijqkSdU2QfTafovHBrLKpSm0wI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6451
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

--------------nyQbTHdwcjcxQy0ya6MG00Wq
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 2/9/2026 2:03 PM, Pranay Samala wrote:
> Skip modifier subtests that are not supported.
>
> v2: Avoid code duplication (Rama)
>
> v3: Introduce pixel-format flag
>
> v4: Use XRGB8888 for modifier check for more robust capability detection
>
> Signed-off-by: Pranay Samala<pranay.samala@intel.com>
> ---
>   tests/kms_plane.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 22c45ae5e..f0eb5a854 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -167,6 +167,7 @@ enum {
>   	TEST_PANNING_TOP_LEFT           = 1 << 2,
>   	TEST_PANNING_BOTTOM_RIGHT       = 1 << 3,
>   	TEST_SUSPEND_RESUME             = 1 << 4,
> +	TEST_PIXEL_FORMAT               = 1 << 5,
>   };
>   
>   static const struct {
> @@ -1469,6 +1470,15 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
>   	int count = 0;
>   
>   	for_each_crtc_with_single_output(&data->display, crtc, data->output) {
> +		if ((data->flags & TEST_PIXEL_FORMAT) &&
> +		    !igt_display_has_format_mod(&data->display,
> +						DRM_FORMAT_XBGR8888,
> +						data->mod)) {
> +			igt_info("Skipping: Modifier " IGT_MODIFIER_FMT " not supported\n",
> +				 IGT_MODIFIER_ARGS(data->mod));

same info message repeated multiple times. Add pipe and output names to 
make per pipe skip message.

imho,

igt_info("Skipping: pipe %s, output %s: modifier "
IGT_MODIFIER_FMT " not supported\n",
kmstest_pipe_name(crtc->pipe),
igt_output_name(data->output),
IGT_MODIFIER_ARGS(data->mod));

> +			continue;
> +		}
> +
>   		igt_display_reset(&data->display);
>   
>   		igt_output_set_crtc(data->output,
> @@ -1497,6 +1507,7 @@ run_tests_for_pipe_plane(data_t *data)
>   		igt_describe("verify the pixel formats for given plane and pipe");
>   		igt_subtest_with_dynamic_f("pixel-format-%s-modifier", modifiers[i].str) {
>   			data->mod = modifiers[i].modifier;
> +			data->flags = TEST_PIXEL_FORMAT;
>   			run_test(data, test_pixel_formats);
>   		}
>   	}
> @@ -1507,6 +1518,7 @@ run_tests_for_pipe_plane(data_t *data)
>   					   modifiers[i].str) {
>   			data->mod = modifiers[i].modifier;
>   			data->crop = 4;
> +			data->flags = TEST_PIXEL_FORMAT;
>   			run_test(data, test_pixel_formats);
>   		}
>   		data->crop = 0;
--------------nyQbTHdwcjcxQy0ya6MG00Wq
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/9/2026 2:03 PM, Pranay Samala
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260209083331.1088550-3-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">Skip modifier subtests that are not supported.

v2: Avoid code duplication (Rama)

v3: Introduce pixel-format flag

v4: Use XRGB8888 for modifier check for more robust capability detection

Signed-off-by: Pranay Samala <a class="moz-txt-link-rfc2396E" href="mailto:pranay.samala@intel.com">&lt;pranay.samala@intel.com&gt;</a>
---
 tests/kms_plane.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 22c45ae5e..f0eb5a854 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -167,6 +167,7 @@ enum {
 	TEST_PANNING_TOP_LEFT           = 1 &lt;&lt; 2,
 	TEST_PANNING_BOTTOM_RIGHT       = 1 &lt;&lt; 3,
 	TEST_SUSPEND_RESUME             = 1 &lt;&lt; 4,
+	TEST_PIXEL_FORMAT               = 1 &lt;&lt; 5,
 };
 
 static const struct {
@@ -1469,6 +1470,15 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
 	int count = 0;
 
 	for_each_crtc_with_single_output(&amp;data-&gt;display, crtc, data-&gt;output) {
+		if ((data-&gt;flags &amp; TEST_PIXEL_FORMAT) &amp;&amp;
+		    !igt_display_has_format_mod(&amp;data-&gt;display,
+						DRM_FORMAT_XBGR8888,
+						data-&gt;mod)) {
+			igt_info(&quot;Skipping: Modifier &quot; IGT_MODIFIER_FMT &quot; not supported\n&quot;,
+				 IGT_MODIFIER_ARGS(data-&gt;mod));</pre>
    </blockquote>
    <p>same info message repeated multiple times. Add pipe and output
      names to make per pipe skip message.</p>
    <p>imho,&nbsp;<span>
        <div class="scriptor-paragraph"><span>igt_info(&quot;Skipping: pipe
            %s, output %s: modifier &quot;</span></div>
        <div class="scriptor-paragraph"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            IGT_MODIFIER_FMT &quot; not supported\n&quot;,</span></div>
        <div class="scriptor-paragraph"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            kmstest_pipe_name(crtc-&gt;pipe),</span></div>
        <div class="scriptor-paragraph"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            igt_output_name(data-&gt;output),</span></div>
        <div class="scriptor-paragraph"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            IGT_MODIFIER_ARGS(data-&gt;mod));</span></div>
      </span></p>
    <blockquote type="cite" cite="mid:20260209083331.1088550-3-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			continue;
+		}
+
 		igt_display_reset(&amp;data-&gt;display);
 
 		igt_output_set_crtc(data-&gt;output,
@@ -1497,6 +1507,7 @@ run_tests_for_pipe_plane(data_t *data)
 		igt_describe(&quot;verify the pixel formats for given plane and pipe&quot;);
 		igt_subtest_with_dynamic_f(&quot;pixel-format-%s-modifier&quot;, modifiers[i].str) {
 			data-&gt;mod = modifiers[i].modifier;
+			data-&gt;flags = TEST_PIXEL_FORMAT;
 			run_test(data, test_pixel_formats);
 		}
 	}
@@ -1507,6 +1518,7 @@ run_tests_for_pipe_plane(data_t *data)
 					   modifiers[i].str) {
 			data-&gt;mod = modifiers[i].modifier;
 			data-&gt;crop = 4;
+			data-&gt;flags = TEST_PIXEL_FORMAT;
 			run_test(data, test_pixel_formats);
 		}
 		data-&gt;crop = 0;
</pre>
    </blockquote>
  </body>
</html>

--------------nyQbTHdwcjcxQy0ya6MG00Wq--
