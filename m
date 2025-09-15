Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92BFCAC597
	for <igt-dev@archiver.kernel.org>; Mon, 15 Sep 2025 18:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF21010E536;
	Mon, 15 Sep 2025 18:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ej7ju9QN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF45F10E532
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Sep 2025 18:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757961498; x=1789497498;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1q41qZ7KhtxnNTe95/UL5oRaN9PZvm/PY6JJIFhACh0=;
 b=ej7ju9QNpRqu3SDeYb4JFGJfoWxC+WjZdb2eXIDJ6uDtZpkfkEKXJa0H
 o7Cs3nJ/ZUgTHiQhSODM9QsLw5TJekepxVyrDnkK3/4b4AIgR17rSkc9q
 N09YWVcVwO6awdOCu0Y4nU+sRCsRiNCNppIYYnpXDMCCANMr+OpEPcEm9
 TGBMaVuoIoJt5d9VuOvCAjHoBeT2QLgSus8CrnbnG98BQWbl1w2Jzzun7
 12+VjcUtMrAWXp+7aN2q8sI56u31/xf5rBaHoxhK75AiCFAeFeJPjx6fj
 53PccANankO5lBRviwCt/wUYTR8HibqEkMojOg5hJZnZSzwRBcXkq0bvI g==;
X-CSE-ConnectionGUID: 4Q5Hu3PQTsCqspNNOlbVnQ==
X-CSE-MsgGUID: qtPYp8sATv2oR6VGFDGozw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="59922226"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="59922226"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 11:38:18 -0700
X-CSE-ConnectionGUID: KrScmKbzQHebMel8WW4SvA==
X-CSE-MsgGUID: dObE8h6dT8SGrNZanlygGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="175505113"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 11:38:17 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 11:38:16 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 11:38:16 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 11:38:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZoYLOXeRGniPXJj9TumKxNTJs+4lgrXg/AhDbJ41N7EUcnagOqvjKnB51B0ZFAOv9CsRb5o0deLPpwiFm1dkqa33Rg7buP8rWPwsJM3JNf7ZceC441SqzMQ8VLVV/CIrgxLD3nI/HFzCZE3WvnaM3dQnccLUOEfP6+t6bptqXKHkanPuAs+c/27t7P36/aFqitZp4CODCONak06/7+/nlmohfl/xSq+bXVCTn7shYab0+/7ZqUAoVzXSekGiFREXhLl2r3A63rI/wGXt8f74pxHTorQ+AUInfObXmIbMOKtITEg5REigAfl5CVuaDqdN534voD6+1nm5N+RRcc0Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKWR+U2i2/DwzH6uUYEEwaYTNmxr9Xe9/JFituDIuLo=;
 b=wxT/5E4/zv/GesjEUX3UQiZGgboxyTmKbEzWaKdhMYcXiFu+dL00Fz4Jzmc1yLV2lmSKyTyYHprJonib19vgUt9WxOkXKqqM3LLvsm2WXTDnHMRDlagA6JanJxXPOaLXsBFvJRxYbcDHyPWlOYVXavzDQEQNs8eE5uup71HG5c05ykZqoUchph9pnlaQxP8rJTCqxfD3zrCWlP26bQ+wNsJb860B4aHndVFVG6UqILEMUJ0ttYD0xisvr3oa92IC8hvWXdgdVKW6gnvZcAVoo+oQ6Y8DyCPgzTD+xrTmzQFey9kh2qzHKw1Y9ydUI9++/dTLDF7PmYD/r98W+ksbpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by IA4PR11MB8991.namprd11.prod.outlook.com (2603:10b6:208:55e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 18:38:06 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%5]) with mapi id 15.20.9115.018; Mon, 15 Sep 2025
 18:38:06 +0000
Message-ID: <cf271382-f517-4ddb-9ba9-95c61f1a9479@intel.com>
Date: Tue, 16 Sep 2025 00:07:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 2/2] tests/kms_cursor_legacy: Improve timing
 accuracy in legacy cursor test
To: "Sharma, Swati2" <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250818214431.1331399-1-ramanaidu.naladala@intel.com>
 <20250818214431.1331399-3-ramanaidu.naladala@intel.com>
 <607416d0-acc0-4723-a717-c587625b5980@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <607416d0-acc0-4723-a717-c587625b5980@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::21) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|IA4PR11MB8991:EE_
X-MS-Office365-Filtering-Correlation-Id: 85625b64-5561-4407-5f8a-08ddf48702c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHRWeWRicTBxVVFCVzRZSGZORWZtVWlCOFBxakQ1VHpnV1A0Y3NBbllnV0Nn?=
 =?utf-8?B?cVplWTl5aTh4WUhWY0RJS2ZnVkVGdlY1K09SNWRVK2pGOXpoQTlkYmc5dFBY?=
 =?utf-8?B?ODBaWFMrcW9YdUNkOHVvN05leXhJV3RLdnAwK3piRCsrSDhTT3dRaGVuRWxm?=
 =?utf-8?B?ZHBqVVJ3NjVhQnN4b3lJd1BQbVdCN1p2RU1jZVE5cEZNbGRydktORTdkKzIv?=
 =?utf-8?B?M1hySmZIb1diUGpieXBhckNVenN2STFzaG9iVXEvRUYyMW1QdlA4RGYwRHl2?=
 =?utf-8?B?VGcybU9Uam90SExvYm55dWRsUHgzN1Frd203UVh1TnhxWXRRVjN6S1RjeGJy?=
 =?utf-8?B?YmpFaHRmRUdwd1RTWTVCVEg3QnhkT3FHck1rMGRONEt6ekRUVWJVNWovT0NO?=
 =?utf-8?B?emhhNzYrczNYTk4wYllpajJ1VXIvV1hwYlJvZGNRRzU4aElMNUlRZlBzL3V4?=
 =?utf-8?B?RVFzSy95QkxGL1NSNllTMHRncVBobFE2bm04cytKemtZVW9MTFFhZXNRdGNz?=
 =?utf-8?B?blhydnB5WkNERVYrQmZVeFE2TVA0YXcwNGhoclU0ZnZiZjdIZHoyS1kvdkln?=
 =?utf-8?B?WkMrSCtyZG9sZ0xUbVFQTlpOS082UmdxN2pWYzRhanJkZWkzUUhUVnFoa2RF?=
 =?utf-8?B?MC9HQUdVL1JyYW9hWkxTS0xZNnVXWXVRZnprblcyRmNaK2pxZGxJeU5FWUZi?=
 =?utf-8?B?MVRZRkd5TFpjTWRWZU9YdjBKZDBFZUZ4VWZtRlBDNXZIR2JXc3VPc2xmWUFv?=
 =?utf-8?B?NFBDTmhlV2E4dHgvTUdyNTNGcDFPM2dBR09wV3NVUDB2Yy9IVFRXaGxOU3Bx?=
 =?utf-8?B?Z1VNTW12NDhJaytMZlRHZDJQVk5pdzRjcXh2WWc3SEtBWkhwUkltLzh3Y1Z5?=
 =?utf-8?B?V0VsSnY4MC90eDV6RFNHMXFjVGtwVGdqK3lEcmZtYjV0YUJ4a0k5MlJSMHZn?=
 =?utf-8?B?V3NKWmc3R0U4eTArTjJjdnE1NE91VTRTWStBS0FFeElBRk5wZ01EK3lCaExY?=
 =?utf-8?B?ekZkNzcvazNyaUxWM2NNVytuRGVOYmhFbUI2Z010MkVXWHRXaXJxTnpoVmxo?=
 =?utf-8?B?QUNjWjI5YkFlRTFPaDNOL21qRFErdUJhWm1PelZuYlkyRkRweHVDVXFJZC9W?=
 =?utf-8?B?Z3dWY2VNYUF6NXFOaXg1QVpXemt0eHFPT0k3NDhlM0psbHI2RWU0ZUFNVTBK?=
 =?utf-8?B?SFJXSVZIOW03ZnQxem9YY25RcklkTmJVUVZuaElkSi9Bd0pKeG9UdEFndnp1?=
 =?utf-8?B?b1dNNUV1QnJTQWlmbHZCOEdpdjI0RjNpNVRTaU91VjlFNXB3OHFoM2lVYVFk?=
 =?utf-8?B?aXJRK1RZQTVFVmF6ZWVNVU5JSUpodWpuVWE4NzRhWjI4cHlQQzczQ0VRR1Z6?=
 =?utf-8?B?M0txcEMvZy9YNEF1QXR6UGdDeGVmNnlHZjlPSUpyRTNWUEhTdnprOStwQzNX?=
 =?utf-8?B?UkF0UlpoZ3dFSWMybGVkOHZkWnR3UUI0SnRkTHNpL1Rjc3N4bXBmQkI4Nnd1?=
 =?utf-8?B?ODZ5YXE2NUFKbzdZaUk3V3BacU1sRVh6akZzdDFrWHQzWEtYeno0VHJ3d2tj?=
 =?utf-8?B?QXBIZWhhdTR3VWNkWmxodVBqQjBXUUFFRGM4azBnOFVWMWRuR0dwQ2Q0b2l1?=
 =?utf-8?B?NEFFNHZseHdOS1kvSFJ3Z1J3RnVzQTVrNFNOc3VHZGorUHdHQzgwRE9Lc0RI?=
 =?utf-8?B?VnVTSHhXUmQvSVpKV0NEaHR5cy81MkFMYzhPSlVpaHpROCtyVHcxZzdUWDc1?=
 =?utf-8?B?NGhESXYxR1l1dC9obEFxS0lXdmhJdkFvQnlNOUNVVytLNEpBRmVVaDk1Tm9H?=
 =?utf-8?B?eUkwRnRBT0VsN3phd2xKbkhKZGxhaXA5blpwcGEvbCtxWjJxRE5OQ3NlSFZP?=
 =?utf-8?B?R0I5cGVOaktRZzZyL1Y3SFZKZFptVVFsQ1NqOU9KeGF4VVVPRlhrOWhBM2FN?=
 =?utf-8?Q?v6jftyiAg0c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0JiYzE0Vkl5cXJpeFZGMG5udjlFSnYwOEx4NmV4UDhQdGhBZXN0OE83UWs3?=
 =?utf-8?B?TVZQMURBYWVyaEtrYjl1K2lOMk9pZENZRlVHb2ZOK3JMcWJWZDFiMVRwUnZV?=
 =?utf-8?B?cGJMYmVpa1dOcTFNUVBlckpTNHkwT1ZITGc0WWVTOGlNYXdhbGl5TDRkbWJS?=
 =?utf-8?B?V2xZMU5JU3cvTUZVTEdCcDQxZnMyQndEWHNyNDRxUFY2WGhhZTcxL2FLeXcv?=
 =?utf-8?B?WDQ0eEFmekw5d3NoSisxY0N6UDA2RFBjOE1STXU1VWJjWDlmZFczU08xaWRl?=
 =?utf-8?B?ZmJ0QzhBODFnYTg2MjFIaG82N0lOYzRHWW5UTDNkUGd5eFpaNnZMQTlTOHNi?=
 =?utf-8?B?WjQ2aDgrcVRMalM5dlQ4MlNaNjE3bm5ZS1lXMTFSczRuK3hhc0hHcWVrcjls?=
 =?utf-8?B?djhEd0NjK0xKTVVIM0tKaWhhMUY1bzhlZjdvTjlSYnN2Q3BGSGxtZmRWT1Y4?=
 =?utf-8?B?ZFZhTlp0dnRXS2xTK21UK0pTeVdkZ0phS0ltNnpocUpXTEg5ZEgySzFLNFhC?=
 =?utf-8?B?UElxSlFvNSs1bS9nZ3FjcHhacGdUS241ZXl4UmRSVnIrZUhIdHM4VDZVTUV0?=
 =?utf-8?B?OGpRcVlWdEI0b0FOVG9heFhTZ1hWS244SUhHQkpOa29OZit1aDcvV2ZXbDh3?=
 =?utf-8?B?T1hvdzEvRG9UQ0dobExscVhZRld2Vk9LOHRmWlNXK09kS0VIK2d3bG82UnRt?=
 =?utf-8?B?ZFZtRVZHN0daOHp1VmNHMEozTGpuZUgwTmJFV1N2Z2JZL0M2NmVRUFFQa3Rm?=
 =?utf-8?B?ajhpTE5FdlFFSC9UYytTYlllMDhWL1NOOW8yWWJOdTNTa2lYeWdmcmkyaGpD?=
 =?utf-8?B?NE9aenZpVUNLOEE5NzhHdFhScHo0blZKVFlTSThlQkI3VEFqZGdra012WURy?=
 =?utf-8?B?bVdPT3FZNUxvQUloZjQ2Y3h5b0FDS3hGb3dQdXEyTktkcGtTWmhIMUxpc3Jk?=
 =?utf-8?B?d1JYRnhGYkpWQTZTeTRjdkxOMjJMQitseXBOR2FOYTN5QnhhVTNJZXE0YVJr?=
 =?utf-8?B?R0JBOHEwaEIyUW1EeWpYZlEwOVdFeEk3Z1cydVkremdQbHdDYklZQ285TDZX?=
 =?utf-8?B?VitQUVJWeDVkWFBTQ1RrYi80M2lweDg1UUZTclZxbmN3UlY4aXNBWXZhQlZt?=
 =?utf-8?B?RFBCN1l6empiOUxaaVNGWDkwNy92a1NGRXI0RHFQVElvR2pVbHg3ZndJbndo?=
 =?utf-8?B?TDF4RlRxU3dYblNyelhEdHpVQWMva0c2VUcxMkJTeVViUWhUM1BtSWpyOWVj?=
 =?utf-8?B?eExYR0I4b1Q2bkhreTMxZEpiRmlYWVp2TkJ1UUVYZ3k5cjZkVVU3cFROQVdo?=
 =?utf-8?B?YzdJS2I1R24vMTJEeXZSV2RiYkxGNWpJZ0ZzMFRobEdwVUFKelFVN2l2STN6?=
 =?utf-8?B?U3lGa0QyS3VDRkdnSE5HZFdaQ0ZUSDVNZ3FKblFmUkxZejdCZGtidlZUQk9o?=
 =?utf-8?B?SGFqeFp3aVlxSXhWSzFaVXJSTUIrbnFtd0Z6Z3dMWWdOZUZTNXhtejhCVG1x?=
 =?utf-8?B?WGd2SHV1a013d1dEaksrZTh6ZERrOTNDeGw5KzN4a2JlYnJ0OE9HWmJod2pS?=
 =?utf-8?B?djYxbzg1azVFM011TkhpYmxpL0RTOXordktYbHRZQ0NUc2VYMHBzRk1ocksz?=
 =?utf-8?B?ZmZRcU1mZUxwWWtkanJVY0w3c3ZBbS8vMDNxdXFVMmNoSjhtNUdoK3daQWdz?=
 =?utf-8?B?QmNrN2piSHVUNkh6YlQ4ZFJYR3d0UGFFa0dHbDBtdHRsOFRZRTdrZ2UvcUZa?=
 =?utf-8?B?ZDhweGQ4bU9CdlA2dTBDWk1xMUgwTWpVREcrYVN4NnRmVXYvcDlodVErRHBS?=
 =?utf-8?B?V1RBZUlCVDdKT0ROV1hZQm1BQXRQR3VVdHhZSENVYmN1VkZWcXFIVjRSYk92?=
 =?utf-8?B?UEkrZ016K2J5Yi91d0tFM0RTV0ZLeHZZbFpIQ1h0bXpWOHJWZlFxN2d2eWNS?=
 =?utf-8?B?S3RGYzNZQnJHdHJSNHU5Vk1Ec0thWHVleFNRUDN4bUNVQjlXK2hFS3pZZStu?=
 =?utf-8?B?Sk55WCtSMlpkamRvV3NyN1ZNY2xVZTNROVovenBNRlBBWXl5aWZLQlVTYVJl?=
 =?utf-8?B?VXFnbXRZMkk5VE5JYVk3eHJGdytRd3EzNmNucnJsMzV1dzd0V1NjUkhUbHNG?=
 =?utf-8?B?a1hjU3hSWkNGQnRFSTg3bTVEZzRlU3R6NldqUzNvcU8yVittUCt1WHdBS1Jw?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85625b64-5561-4407-5f8a-08ddf48702c5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 18:38:06.4610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zhSmtBKMMuHPvYbgqTV8lmHoN19/CAWvBXSyWz3gzJ2Jq/elL7lg1kPNeaesjXQLeeVzR6l9D4bvOZlOZ3KgofZB0Ndp0CtyAITMYUERlBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8991
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

Thanks Swati for the review comments.

On 9/3/2025 1:13 AM, Sharma, Swati2 wrote:
> Hi Ramanaidu,
>
> Please find review comments below.
>
> On 19-08-2025 03:14 am, Naladala Ramanaidu wrote:
>> This measured time is then used to estimate the number of frames
>> delayed, which is factored into the validation of expected display
>> behavior. The adjustment accounts for timing tolerances and helps
>> reduce false negatives in simulation environments.
>>
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   tests/kms_cursor_legacy.c | 18 +++++++++++++++++-
>>   1 file changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
>> index 9f6e644e1..7fda490ea 100644
>> --- a/tests/kms_cursor_legacy.c
>> +++ b/tests/kms_cursor_legacy.c
>> @@ -238,6 +238,7 @@
>>   IGT_TEST_DESCRIPTION("Stress legacy cursor ioctl");
>>     igt_pipe_crc_t *pipe_crc;
>> +uint32_t vblank_tolerance;
> Why have we declared vblank_tolerance as global var? Do we have plans 
> to use this in other functions?
> If not, declare locally in flip_vs_cursor_crc().
> Also, vblank_tolerance is misleading..rename it to vblank_increment or 
> vblank_step?
yes. it should be global variable. In future it can be useful on other 
functions. i will update the variable name in next rev.
>>     static int try_commit(igt_display_t *display)
>>   {
>> @@ -1587,6 +1588,10 @@ static void flip_vs_cursor_crc(igt_display_t 
>> *display, bool atomic)
>>       igt_crc_t crcs[3];
>>       igt_output_t *output;
>>       igt_plane_t *cursor;
>> +    struct timespec start, end;
>> +    double frame_time;
>> +    double elapsed_time_ms;
>> +    int delay_frames;
>>         if (atomic)
>>           igt_require(display->is_atomic);
>> @@ -1594,6 +1599,9 @@ static void flip_vs_cursor_crc(igt_display_t 
>> *display, bool atomic)
>>       pipe = find_connected_pipe(display, false, &output);
>>       igt_require(output);
>>   +    vblank_tolerance = get_vblank_seq_diff(display->drm_fd, pipe);
>> +    frame_time = (1.0 / 
>> (double)igt_output_get_mode(output)->vrefresh) * 1000;
>> +
>>       igt_info("Using pipe %s & %s\n",
>>            kmstest_pipe_name(pipe), igt_output_name(output));
>>   @@ -1628,10 +1636,18 @@ static void 
>> flip_vs_cursor_crc(igt_display_t *display, bool atomic)
>>           igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), 
>> vblank_start);
>>             igt_set_timeout(1, "Stuck page flip");
>> +        clock_gettime(CLOCK_MONOTONIC, &start);
>>           igt_ignore_warn(read(display->drm_fd, &vbl, sizeof(vbl)));
>> +        clock_gettime(CLOCK_MONOTONIC, &end);
>>           igt_reset_timeout();
>>   -        igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 
>> 0), vblank_start + 1);
>> +        elapsed_time_ms = ((end.tv_sec - start.tv_sec) * 1e3) +
>> +                   ((end.tv_nsec - start.tv_nsec) / 1e6);
>> +        delay_frames = (elapsed_time_ms / frame_time) - 1;
> Why are we subtracting 1? Can you add a comment here?
Sure. i will address it in next rev.
> Since, elapsed_time_ms and frame_time are double, cast to int. Also, 
> use round() which might help to avoid off-by-one errors on boundary 
> cases.
>
> delay_frames = (int)round(elapsed_time_ms / frame_time) - 1;
>
>> +
>> +        igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0),
>> +                  vblank_start + (1 * vblank_tolerance) +
>> +                  (delay_frames * vblank_tolerance));
> Can we write helper for this expected_vblank too?
> Something like this
> unsigned int
> kmstest_get_expected_vblank(int fd, enum pipe pipe, unsigned int 
> start, unsigned int frames)
> {
>     return start + frames * get_vblank_seq_diff(fd, pipe);
> }
>
> Then assert will be more cleaner
> igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0),
>               get_expected_vblank(display->drm_fd, pipe, vblank_start, 
> 1 + delay_frames));
>> igt_pipe_crc_collect_crc(pipe_crc, &crcs[2]);
>
