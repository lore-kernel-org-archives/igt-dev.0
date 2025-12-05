Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD510D37497
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 20:40:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C60E10E27E;
	Fri,  5 Dec 2025 20:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JLCf+GHH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79B110E27E
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 20:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764967235; x=1796503235;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1Jik8eCFuFA5fTC2seUcI7is18s+jctagvz3KyTPH2o=;
 b=JLCf+GHHWnQNxoD7vn/WB2LmXopRlS0KWTJTKV5mqKOZmUpkDDYH7ILA
 AUImvdlmqTPe2e0eTx7QFqhATe9pjmw+wpclJLeejhAoMZ8z7Ei3bz9Vx
 HyMMwt/yuggw1a1kwk3YNdPznD4uo7GfXpLs+CvxtF45s5IlQJqvAXMuI
 NumFZs55+xZ/3TH8RTZUY9dSU9CkdCwR4WbrDUfDCBB6VKRP24S7duWzU
 /EoUXGXVYV563We119p3dH5PJw2Br3LuMTe1M8ELMVENWLMnzXcWH14va
 Y5BlNv+Vzz6IZXy3+ZT7j5pB7QYbhjRq+mKCprOis2XZsVgKNXVHwGYKL w==;
X-CSE-ConnectionGUID: JG3KtN0rQH6v/PFnJDzJEQ==
X-CSE-MsgGUID: 7nRpm9pbR3y3qVN4E3iIYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="78470429"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="78470429"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 12:40:34 -0800
X-CSE-ConnectionGUID: 5ck0WoDKSVSnnzIV8/3Hwg==
X-CSE-MsgGUID: uWDa2Q71SOCNSBsl1j2csg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="200530589"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 12:40:34 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 12:40:34 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 12:40:34 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.19) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 12:40:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sXEw4fp1zThUKn5n4KtK/Gx3r49CxMCEd3WmPjLAdawUDBnpiEBfQdjT50qYoyoSIU4MBeHnLHeU8tdSQTeFD9bwBb1/mmertxzX+PVZgwn0EXjjnboNZhZXkqio2juZb2F024VHMnnzrmR9wcrz344cGCB5U1C4NPC8PTRUveT0wvcvqaBaISd8p1Glh36bqwKDG2s27F7fKLgcLwVrHo0sI9reKbhGU8Qt37HmRdLW2kvstA6w3N2y4F2f3u1YIBw1Z+bwbhhMDUjrDhzSic6N52rytwlp7K/bwMMQYexzYZLiU9zLqP4tSKJDDuundVhArQjpHjiJweDbi015MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHKFNO0gqg3YURlvJAOjj+eraytrY8J9vDQUtqyn27w=;
 b=LjRMfKQejXgRZHbyECwW/oPyDXKVXhNjBEId1V5KtBqLFpAcBloHKUSaEgjykne7GiTf+q52pB8lZVQzqyOIq1ZL2X0ZtkvH2lsV7zyiL7R98iU0q5AxJxCrHvvaV4sFzA2P89UVZZbVGneSYT2zuThCww0MpGCyYCj3qqwbypGypltBkmLwnmITB0Ae8IMliiRRt3QkGnFE6MFgJLfGkJbuIKCkqXO6ORX0F8+HPStpTy9JLlaoyNHFlYg0n1v3sb06O4NqFX/KX0P4FAAjTNJuupU2PQJQkWDxMQiYMHc/cCvsGU7k4h/OxaGGf6Tys6zDZ4ZbPhaYfV54+CAVEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB7624.namprd11.prod.outlook.com (2603:10b6:8:141::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.16; Fri, 5 Dec
 2025 20:40:28 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 20:40:28 +0000
Date: Fri, 5 Dec 2025 12:40:21 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/4] drm-uapi/xe: Sync with
 DRM_XE_OA_CAPS_OA_UNIT_GT_ID definition
Message-ID: <aTNDNRFxlwLhsdAG@soc-5CG1426VCC.clients.intel.com>
References: <20251205000528.720706-1-ashutosh.dixit@intel.com>
 <20251205000528.720706-2-ashutosh.dixit@intel.com>
 <aTIxXnBjmxGzvj0d@soc-5CG1426VCC.clients.intel.com>
 <87pl8tprzs.wl-ashutosh.dixit@intel.com>
 <aTM+3OtRZUrhbiJZ@soc-5CG1426VCC.clients.intel.com>
 <87o6ocpta1.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87o6ocpta1.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0316.namprd03.prod.outlook.com
 (2603:10b6:303:dd::21) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB7624:EE_
X-MS-Office365-Filtering-Correlation-Id: b29ef8d8-4e7f-4d16-bd76-08de343e86aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0VNOW9IUVorQTZGSWxBYmpFRDZtTXRnaENDNlE5Vk1OOU9QWnZpZWcxZXBJ?=
 =?utf-8?B?d1UxQys4R0NLNUJLSkRMZ0VwTkYxWk4wSUQxb3gzUWZaaUxhNUV2RStndTdw?=
 =?utf-8?B?OXdPT1J5OWsvMjU5RkpTSW9MWGpJcXJZN1FFNkFDMHRIQjAyeHNpb1hVNmRu?=
 =?utf-8?B?R25NbmlVdlVNRDlUTUw5Nks1TlB1RVJ4YTY5d3ZlbEhPSWQ0WEZ2ajNWOXF2?=
 =?utf-8?B?MVdoZHdlZkVteStRUlFqVXN3eUxRWjh4MkxZTjJwbkpJOHlZVExpblRNMDlt?=
 =?utf-8?B?SjdjL0xsTndIQUZvNzlIUjZkcWZ3ZTQ3bzd5S3J1cEwybkFjMFBpalJraXVo?=
 =?utf-8?B?N3VrR0E3dzZnWkhiZkNMYjVMVENBeFlIVG5admJCb3ZmN0x6d0lEY3dsQzAw?=
 =?utf-8?B?MllDTWdCL3Q0bU5qOXhBMnh4WXRwaGFpMWNLZlpVdmRxSDllcStUUFJrMndw?=
 =?utf-8?B?eEJHUVdiem9mKzdCYmwweXhFRTgzUkxESjJuOFZxV0ZDdVpPcjRGd1ZOYnlC?=
 =?utf-8?B?VEZuTE9SdCtZUEpxMHNKV2V1c0FWRnpwYjRGTnRhWklVMUhiS1FKKzJpMTA1?=
 =?utf-8?B?SGN3Wm1EbmJmbHdTTkZTV3ZXcDMyU3Q2Qk9jOURNeTY4WEFoVnBDbWRTK1BX?=
 =?utf-8?B?eDhzajBWZCtkSnVPNk1vNXNDbndHRVpnWWsxbTFhR3lObDV0MkJwaG11VTBv?=
 =?utf-8?B?RkNaQ3hSaXg2RnZIdFdvNllSVTF2R2cwQ21hdDFOaEl6N2NQUkpMaUNQZFhs?=
 =?utf-8?B?ZG03V2c3cmJvQVRGS1RaZVV2SGcrRTVidHhMODdRWkRrNGtSMUpiNGZFRnpR?=
 =?utf-8?B?cEN4aXhQVXZGOGxrenZ3OTlza3lUWG41bThzeXQwSmR0VGhDVTFGYWtpUVhh?=
 =?utf-8?B?d01Zb2VSNFZhVGI3cG9XR0VPZlpKVzNwd2VxVnJ3d29CUjJPbDVRTEM1d1Zh?=
 =?utf-8?B?eVNyTVc4OXhNdzlZM3dTbGVlRFR6Ulh3Qy9CV3ZzYS9XdFY5amIvT3hiMjlz?=
 =?utf-8?B?U2I2cDNvb3RpeDFYbDVwYW5kWHBIOW53bFFvTGV5VXozMlhHR1grQStJSmJz?=
 =?utf-8?B?ZWJkSHRmMmZVTEpqckJiOG1odXpqTmQ2WERMYlo0WElNTmd1dHdoZndDT0ox?=
 =?utf-8?B?V3JYdU9TWEtMMDBlYitLVjByNkltYlBUY2QyRFgyaFY2TE53RUlZb3Zra3N2?=
 =?utf-8?B?SnpadVNVVGpjT2w3NGZkYzlzWjZ3L3JlQkxTcXd0MGttL0I2RWo3MmFMWk9M?=
 =?utf-8?B?T004SlVmU1NBK3gzbEEvTFNIbjQvSXpPVVBXdjNsVmZ3bWdKSTRyeUliMkpG?=
 =?utf-8?B?SmtKSzVOR0JhOC9kVk8wajJma0lwdjdja1JndzZ6NTNSSXp4VnFJd1Q1NWhi?=
 =?utf-8?B?WUdya3FPQ1NjU1VSeUhGMW9XNjkrbUtiZjlIY002ckFCa0laczZTZHJuV1lB?=
 =?utf-8?B?cEVhTkJqeWVGTTd0eEZMelViM3B0Y0RPK0lHMHdlZFhPYk4xdzdOT0FCWlVX?=
 =?utf-8?B?WlZnQ0kwbmVTd0h1Ykt5WEdrWVpoMWFMbWtuTGpwOUY4YWhqeXVaM1JlbVZa?=
 =?utf-8?B?V0VtUm9KK21nemx4VVRvRkxFUGVDdmpqMlhLVko4dDBKREtoSll3T0J4a05U?=
 =?utf-8?B?NjBkbkRaTm85QlRpNDNyS1d1WGdDNDNvS1dlOWlBL0dZSHpXRmpTUzJnUXpr?=
 =?utf-8?B?d2doQjNyOXNFWjBLKzNIVGhmTHB4ZVlpOEdWZG9WWTMwTFh3RTIyZHZtdE1R?=
 =?utf-8?B?MER1dmtFaU9qaVM3Nk5MSHVvMjI2WVJBQ1hYTHFpWnc1TVZJV1BqTEpJemVP?=
 =?utf-8?B?Vnp3QXJNamZvK2J5ZzdaZ2ZNNHBTWTdBb3l2alI5MU5SeDZJcnRWWDAzV2kv?=
 =?utf-8?B?bU4wRUhJWDZnZms4RFFsMmFqSUIzT2ZrZGJxYWlqaUtCY292Y290cGdYOHhw?=
 =?utf-8?Q?on2SOyoAiF2wLXv3nXmewfwZL0JU0ol3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWNmVTlhOFdFZ0xkTUd3YTZ3c3d5c0owWHJYa2tWZHJtdWd5VyttUWtycXJM?=
 =?utf-8?B?VktNUEROUXp0Q3VOTUd2VldtcDJJVXFJc0dXbDBGSStOcUo3K0FXNlVpVmNV?=
 =?utf-8?B?UWNUbWxUWmhwVG1TVmlYSUhxZElNS2I1SlNCajhObjhiZWRpYmx0eVRvVnZx?=
 =?utf-8?B?VXFlOEhlK0Nna3F2dFJwNWdUZEVEUE9LNzB3YkJwVEZQYkxYekRWUUU5M0w4?=
 =?utf-8?B?R0d5dEVUS1orUUF5NERWMVl6WVJTQWU0UTI0K3U2SFpUanp0VXo5bzN3em8r?=
 =?utf-8?B?Z0lwUzZJeHp0blVSR0RSY1V1K09pbENtVXc4M3BtVUx0YkhrWms0NlNjM2lo?=
 =?utf-8?B?eVd2WVl2MEJ5U0QybDhrN2dKdWtCU2lmb1FUNmpUNkp1aUNrUnlPSVlOc1ll?=
 =?utf-8?B?ZDRpMjlQN2I2THc1VlFKT3lPVGtEQlBuOS9rYTFJYlZQRnB3cmt1NXBxTHBE?=
 =?utf-8?B?ZWVLdWVVMzBvWDBlbDZBaTdwaVNTeDIwM2VyeW5TS3VtcHRJcFF5ckh2NEJL?=
 =?utf-8?B?QzNZeGlYSkdXOTN6dy8rWDFpQ3pJQVFtWnQ3M3E3Vy9pMVZKUDI2aXdkcTZ0?=
 =?utf-8?B?VjdjSnZDNXpzK0VVQ2orKzRWOHBxWlNmN1Y4WXhIaWhnZm1Cci9JUktVSU5V?=
 =?utf-8?B?UmhsZzFUamlMVS93Nkh5RlVXc0Ezdk1QYjA1UVMyNjBUay9vNEZicXM2TzJy?=
 =?utf-8?B?T1FJTC9YVUI5OWs2ZGRvVmcveS9KZUhBVXhkYjE1aHR6RDFCdUhPSVBOcTBl?=
 =?utf-8?B?Sk5UR1Y3eGZXRUhRamRNampVd3BjbDJqa3pGYjFITktGelFyZGdTc2c1Ym82?=
 =?utf-8?B?VmJLV1BaQ0NiZ0lodHdBTzk0WEVsTlk4L2dxT2FkYjJCbXphVGo2SlFrWXBa?=
 =?utf-8?B?aCt2K3FlVEJ3N1FiUS9JRTZxUG1ZKzdKYVNJbDdWb1djS3pkQXBoQkhINCtN?=
 =?utf-8?B?enIrVEtrMTZOeVFBZUhBNHdNQmh2TytYY1dZNWdva2RQakoveENUWDlKWXk2?=
 =?utf-8?B?L05qRDNud1ZSUThqK3c4STdrZTVVQk1qUkp2cE4yYjI1Z3pzQjVFcVBQWWcv?=
 =?utf-8?B?S25pL0ZjT3l0SXVoRTRkL0VXWEo3eGZ2NTlrN0pZUU82b3RzSW9KS0JSbUwy?=
 =?utf-8?B?SlpHWDVaazZiMWJSN2RPOGRWS0VjUUxTK2hzTjh2TmFmSjVicGl5RFRNOTRB?=
 =?utf-8?B?Q0hRSUdaOFRmbndvaFdjcHVMUTZyNXV3YWFBT2FnbXpnb1d4dnpyUjBQZmFZ?=
 =?utf-8?B?U1JscWNJc3p1emorcnZRZGxIVmc5VXJmakNZY2xLN0xrS1JuMjNMQmFCLzVa?=
 =?utf-8?B?aTE3VDQ4NjZpVGJOT09hTUYxZ25BaFZRS1B5MnNyZUJaNDhoY0w5emJZdjhs?=
 =?utf-8?B?MVllZDV5U3lCTXhnakJVbnUzRmtTZWJnMmZQMWVNY2YxQWcrb2lrMFp5QXgy?=
 =?utf-8?B?MXlHWndueWdXY0U5UWF2ZG81clYyQjgvNjZGeTVPY3pTUFVIRDJRQTdXTEZW?=
 =?utf-8?B?Q0Y1RjVnc2VPcnVVb0RBOWhKN293dU1RNlhvbVZhNFdIeUxIT2l5Q1Q1QXN5?=
 =?utf-8?B?YUZyb3cxTFovVXEzT0lvcFRJZFZmZnE1KzVNdCtDMEVzRENkTEhHeUs5czIv?=
 =?utf-8?B?Mkxsa1pSRVVJTlNzemplejhFUWZlU1ZSc0RyOU82a3VWVUNWR0hCdXo2N0ow?=
 =?utf-8?B?b25weFRZemNFS2Z3TStKQ0F1UWhUcEg2S0xaS0J2S0VPRThkOHZZMzNoOTdm?=
 =?utf-8?B?bFo1UkpzTGh4eTMyVUZoZ3ZYeWxQVDhtVW03aFQ2Qk16cHhTZzlaNWhhS0s3?=
 =?utf-8?B?Z1k4VzdkV2kxZVU0SGFpSFVHd0lxV3RBNlNEM05xeUZZM2VTcjhmSWJsajQr?=
 =?utf-8?B?TnE0VU9KYWZFMWtFTzBNSndmQUlBMDRHdHFNWmJlTGRSM3RLVlpsWnQrM2FM?=
 =?utf-8?B?ajB3Tk1CR01TbklIOGVCaVI3dkMrYkUvZTk2dXVaQlBBWURIYmxUZkZHUW02?=
 =?utf-8?B?cFROUExtKzR2ZEo2emNDUjVjYzg5VmRHNzhWbjl6aW41UWwzbUpJSEZKQld4?=
 =?utf-8?B?QkkrWEJ0eXBYdVVmMkYyQkdkdHVEclExT2RYaTBab1hHNWhzNDZEbUlnSDRu?=
 =?utf-8?B?NW90NXpvL3Zyd2Y1UXpLbmtZTHZMNGZVdzN0VXFaRGhBc0xCbFdRN1dPZVB6?=
 =?utf-8?Q?8WrC52kBDGFTs2hBOsxFXwc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b29ef8d8-4e7f-4d16-bd76-08de343e86aa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 20:40:28.6667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o15ehoS0Ves3iKrA4q4G+tJkBz3emMakudgRyYzK+gGoIdYJzmiNnH6p7K1S/1lLWX0+B2OX+JrJVYN4OtMthF+41mUPQW/JYXlci0kpjWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7624
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

On Fri, Dec 05, 2025 at 12:28:54PM -0800, Dixit, Ashutosh wrote:
>On Fri, 05 Dec 2025 12:21:48 -0800, Umesh Nerlige Ramappa wrote:
>>
>> On Thu, Dec 04, 2025 at 06:44:23PM -0800, Dixit, Ashutosh wrote:
>> > On Thu, 04 Dec 2025 17:11:58 -0800, Umesh Nerlige Ramappa wrote:
>> >>
>> >
>> > Hi Umesh,
>> >
>> >> On Thu, Dec 04, 2025 at 04:05:25PM -0800, Ashutosh Dixit wrote:
>> >> > Align with kernel commit 16e076b03658 ("drm/xe/oa/uapi: Add gt_id to struct
>> >> > drm_xe_oa_unit") to bring in DRM_XE_OA_CAPS_OA_UNIT_GT_ID definition.
>> >> >
>> >> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> >>
>> >> Is the intention also to bring non-OA changes in this commit?
>> >
>> > It's just a sync with kernel xe_drm.h at the commit (latest one) mentioned
>> > above. So yes it will pull in all the changes till that commit.
>> >
>> >> Then you may want to change the commit message to sync header file or
>> >> something.
>> >
>> > It already says sync. Otherwise I just titled the commit as the last change
>> > that went into the header file. I think anything is ok, but if you or
>> > anyone else has any suggestions, I will change the title to that one.
>> >
>> > Also, if anyone else merges their changes to the header file first (I have
>> > seen several pending merges on the mail list), this commit will change. But
>> > it will always be a sync with the kernel header at the mentioned commit.
>>
>> I'd recommend - "Sync with kernel header".
>
>Hmm, it already says "drm-uapi/xe". See other commit titles for the
>file. So we need some more indication on what we are adding in the commit
>title.

I see, you can keep it as is for now, if I can think of a better way, 
will share.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh


>
>>
>> With that,
>>
>> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>
>> Thanks,
>> Umesh
>> >
>> > Thanks.
>> > --
>> > Ashutosh
>> >
>> >
>> >> > ---
>> >> > include/drm-uapi/xe_drm.h | 55 ++++++++++++++++++++++++++++++++++++---
>> >> > 1 file changed, 51 insertions(+), 4 deletions(-)
>> >> >
>> >> > diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
>> >> > index 89ab549354..62e3221f59 100644
>> >> > --- a/include/drm-uapi/xe_drm.h
>> >> > +++ b/include/drm-uapi/xe_drm.h
>> >> > @@ -210,8 +210,12 @@ struct drm_xe_ext_set_property {
>> >> >	/** @pad: MBZ */
>> >> >	__u32 pad;
>> >> >
>> >> > -	/** @value: property value */
>> >> > -	__u64 value;
>> >> > +	union {
>> >> > +		/** @value: property value */
>> >> > +		__u64 value;
>> >> > +		/** @ptr: pointer to user value */
>> >> > +		__u64 ptr;
>> >> > +	};
>> >> >
>> >> >	/** @reserved: Reserved */
>> >> >	__u64 reserved[2];
>> >> > @@ -403,6 +407,9 @@ struct drm_xe_query_mem_regions {
>> >> >  *      has low latency hint support
>> >> >  *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is set if the
>> >> >  *      device has CPU address mirroring support
>> >> > + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT - Flag is set if the
>> >> > + *      device supports the userspace hint %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION.
>> >> > + *      This is exposed only on Xe2+.
>> >> >  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>> >> >  *    required by this device, typically SZ_4K or SZ_64K
>> >> >  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
>> >> > @@ -421,6 +428,7 @@ struct drm_xe_query_config {
>> >> >	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
>> >> >	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
>> >> >	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
>> >> > +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1 << 3)
>> >> > #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>> >> > #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>> >> > #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
>> >> > @@ -771,7 +779,11 @@ struct drm_xe_device_query {
>> >> >  *    until the object is either bound to a virtual memory region via
>> >> >  *    VM_BIND or accessed by the CPU. As a result, no backing memory is
>> >> >  *    reserved at the time of GEM object creation.
>> >> > - *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT
>> >> > + *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT - Indicates that the GEM object is
>> >> > + *    intended for scanout via the display engine. When set, kernel ensures
>> >> > + *    that the allocation is placed in a memory region compatible with the
>> >> > + *    display engine requirements. This may impose restrictions on tiling,
>> >> > + *    alignment, and memory placement to guarantee proper display functionality.
>> >> >  *  - %DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM - When using VRAM as a
>> >> >  *    possible placement, ensure that the corresponding VRAM allocation
>> >> >  *    will always use the CPU accessible part of VRAM. This is important
>> >> > @@ -787,6 +799,17 @@ struct drm_xe_device_query {
>> >> >  *    need to use VRAM for display surfaces, therefore the kernel requires
>> >> >  *    setting this flag for such objects, otherwise an error is thrown on
>> >> >  *    small-bar systems.
>> >> > + *  - %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION - Allows userspace to
>> >> > + *    hint that compression (CCS) should be disabled for the buffer being
>> >> > + *    created. This can avoid unnecessary memory operations and CCS state
>> >> > + *    management.
>> >> > + *    On pre-Xe2 platforms, this flag is currently rejected as compression
>> >> > + *    control is not supported via PAT index. On Xe2+ platforms, compression
>> >> > + *    is controlled via PAT entries. If this flag is set, the driver will reject
>> >> > + *    any VM bind that requests a PAT index enabling compression for this BO.
>> >> > + *    Note: On dGPU platforms, there is currently no change in behavior with
>> >> > + *    this flag, but future improvements may leverage it. The current benefit is
>> >> > + *    primarily applicable to iGPU platforms.
>> >> >  *
>> >> >  * @cpu_caching supports the following values:
>> >> >  *  - %DRM_XE_GEM_CPU_CACHING_WB - Allocate the pages with write-back
>> >> > @@ -833,6 +856,7 @@ struct drm_xe_gem_create {
>> >> > #define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(1 << 0)
>> >> > #define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(1 << 1)
>> >> > #define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(1 << 2)
>> >> > +#define DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION		(1 << 3)
>> >> >	/**
>> >> >	 * @flags: Flags, currently a mask of memory instances of where BO can
>> >> >	 * be placed
>> >> > @@ -1013,6 +1037,20 @@ struct drm_xe_vm_destroy {
>> >> >  *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU address
>> >> >  *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
>> >> >  *    handle MBZ, and the BO offset MBZ.
>> >> > + *  - %DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET - Can be used in combination with
>> >> > + *    %DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR to reset madvises when the underlying
>> >> > + *    CPU address space range is unmapped (typically with munmap(2) or brk(2)).
>> >> > + *    The madvise values set with &DRM_IOCTL_XE_MADVISE are reset to the values
>> >> > + *    that were present immediately after the &DRM_IOCTL_XE_VM_BIND.
>> >> > + *    The reset GPU virtual address range is the intersection of the range bound
>> >> > + *    using &DRM_IOCTL_XE_VM_BIND and the virtual CPU address space range
>> >> > + *    unmapped.
>> >> > + *    This functionality is present to mimic the behaviour of CPU address space
>> >> > + *    madvises set using madvise(2), which are typically reset on unmap.
>> >> > + *    Note: free(3) may or may not call munmap(2) and/or brk(2), and may thus
>> >> > + *    not invoke autoreset. Neither will stack variables going out of scope.
>> >> > + *    Therefore it's recommended to always explicitly reset the madvises when
>> >> > + *    freeing the memory backing a region used in a &DRM_IOCTL_XE_MADVISE call.
>> >> >  *
>> >> >  * The @prefetch_mem_region_instance for %DRM_XE_VM_BIND_OP_PREFETCH can also be:
>> >> >  *  - %DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, which ensures prefetching occurs in
>> >> > @@ -1119,6 +1157,7 @@ struct drm_xe_vm_bind_op {
>> >> > #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
>> >> > #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
>> >> > #define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
>> >> > +#define DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET	(1 << 6)
>> >> >	/** @flags: Bind flags */
>> >> >	__u32 flags;
>> >> >
>> >> > @@ -1273,6 +1312,7 @@ struct drm_xe_exec_queue_create {
>> >> > #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>> >> > #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
>> >> > #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
>> >> > +#define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		3
>> >> >	/** @extensions: Pointer to the first extension struct, if any */
>> >> >	__u64 extensions;
>> >> >
>> >> > @@ -1657,12 +1697,19 @@ struct drm_xe_oa_unit {
>> >> > #define DRM_XE_OA_CAPS_OA_BUFFER_SIZE	(1 << 2)
>> >> > #define DRM_XE_OA_CAPS_WAIT_NUM_REPORTS	(1 << 3)
>> >> > #define DRM_XE_OA_CAPS_OAM		(1 << 4)
>> >> > +#define DRM_XE_OA_CAPS_OA_UNIT_GT_ID	(1 << 5)
>> >> >
>> >> >	/** @oa_timestamp_freq: OA timestamp freq */
>> >> >	__u64 oa_timestamp_freq;
>> >> >
>> >> > +	/** @gt_id: gt id for this OA unit */
>> >> > +	__u16 gt_id;
>> >> > +
>> >> > +	/** @reserved1: MBZ */
>> >> > +	__u16 reserved1[3];
>> >> > +
>> >> >	/** @reserved: MBZ */
>> >> > -	__u64 reserved[4];
>> >> > +	__u64 reserved[3];
>> >> >
>> >> >	/** @num_engines: number of engines in @eci array */
>> >> >	__u64 num_engines;
>> >> > --
>> >> > 2.48.1
>> >> >
