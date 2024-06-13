Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403E8C27C4F
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 04:19:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEB210E048;
	Thu, 13 Jun 2024 04:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CtNshKko";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA82D10E048
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 04:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718252371; x=1749788371;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ga2/JwetT87GvgwgETr/zYwfiCNs60h/PSZD+zq0FIE=;
 b=CtNshKkokQ4pXrBk7n/8nf2x7B1NBQvtKuFP6GCb/uVwLhelEez/3kMt
 3g4/wN+vC0t7metJcal+M41cd/+xRHONxM6pFYJ2+rL0azhq8frlhqCfw
 E4anrpWZrDNpg3cYS5udAbVx5O5XlWjmuFDSJEYzkEnrwlEU1v0NUb2II
 WGIwF7zxrO8gAPTMAhE7uQ59rEePGbyc3a9A36RuYXmDlNLXNXlkHT3Me
 Z0Py5b63POGhIXvMKYVA3tCDBIh3uVp8rUfP+CjKBAFhlzIY13tlER5+e
 RxLKvuSbvsey9+XrUY0q4nZ3bAvYNm5p4TNtJxVK1xhBRd2mh08ZiUa1r Q==;
X-CSE-ConnectionGUID: fCzGfK47SxiTvLAvVnZ7kQ==
X-CSE-MsgGUID: /Y+cFuS1RnmtimmGLNf4NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="32591525"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="32591525"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:19:26 -0700
X-CSE-ConnectionGUID: MzY7+4JaR46lhPNHTkWU/Q==
X-CSE-MsgGUID: /gcQ9QwJT0SnCLbmA89zGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="71214781"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 21:19:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 21:19:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 21:19:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 21:19:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dllFvVxdvw3zohxbD4h9++osAB9axsz0W46vC4EzKf1wXnT2MNfBDsKgE8CPpORe78yYogNO/5OMDqmcd1gHxLVQoOVfAmyubGzu/UDgdVY+7ZNd6XVF5p+eLQjy/U2CbUvOml/BABLobedT8iEc31VYqW7SnutEsPxW0KMxaRD8jd4nyvtx4A/QrK3TfklXkTJwmZBrBJ+CrUbJTMqNT8qlBv+lIKnG/8m7I2VccyuuInDlt6yVkIfJCHbD2x/vxJYfEuY8hCgUXXh08wBvu+kyUJJacRRV3gQDzmfUOEz0p2JlS3E1XApAogqYCvgXBVE7Gf2IbL+kLofrNBjuOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkxD7eazX3qoZHjeBEfwmRWjLw2KHabiXtBi09Ks9tQ=;
 b=QqdtsYhTgNy/5Wh78ZL0OO9JdXfPl2CyVWq53yukECH2dBc6ot9UQWGtkV+3ExT5ZIOwdo2bdww2+AxXXzjCEEgxBEPU+EbdTWalya0mCIJGHiroDEt77LOdp7bwujK45jtV/Af1Iila6yujJRhKDWaWFmDmrc62xpT6l1tVzzYBuEIbODttSShdeMmlOHiSo66BWCBkBvvzGPXeT0yUsk3vTD9ZGDMiAhzEsRzLrUY70V/XjMl5a/d5tCYdmv+mqCMelG0tMi12+K07EKZUYtaTCCNlC7QGKNV02psb0ibz4v6jIrlNJjPjAnwrvHfzWUcytoGX6x3zHb6nc0T1cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 PH7PR11MB5886.namprd11.prod.outlook.com (2603:10b6:510:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Thu, 13 Jun
 2024 04:19:23 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%6]) with mapi id 15.20.7677.024; Thu, 13 Jun 2024
 04:19:23 +0000
Message-ID: <6edb4331-e0e5-410a-803a-7e9402e4e5d9@intel.com>
Date: Thu, 13 Jun 2024 09:49:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t V2 2/3] tests/msm: Move MSM tests to new dir
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Rob Clark <robdclark@chromium.org>, "Helen
 Koike" <helen.koike@collabora.com>, Emma Anholt <emma@anholt.net>
References: <20240612070335.3758500-1-bhanuprakash.modem@intel.com>
 <20240612070335.3758500-3-bhanuprakash.modem@intel.com>
 <20240612085917.fuedflaohprijgr2@kamilkon-DESK.igk.intel.com>
 <5bd489d6-4582-4580-88bb-65c4fe2580e0@intel.com>
 <20240612122855.rwhbyzu24qq2y4qq@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240612122855.rwhbyzu24qq2y4qq@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|PH7PR11MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: a375b098-8e3b-4842-0b26-08dc8b6000e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|376008|1800799018|366010;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1lEUFlEYzBCQkw3Qmo1SG5iS1lzSUVjSndPNFZtQ2g5UXFzd3U3blVDYUt5?=
 =?utf-8?B?L09sME42bVdwNStibGlSMFJQcjlnZHdia3RMTTAza21RZ3BlZTM3QS94bTk5?=
 =?utf-8?B?Mk9vOGdzMjVyMGRZdnhtVkoxc1JoNXBsTURPTUROUjYzSnVISGY4QXQ4YWI2?=
 =?utf-8?B?Uk8zUkFlQWZ4RktBR1dQdHQ2a2VFSXdvOW5PeFRwcDYrWnN6T3FxWHY1K3l2?=
 =?utf-8?B?RGc0bG1HRENTQ1RWUnhubWxCcVRvOUxNOEczYnpmaTU2d1h0NnVNUkFSS29i?=
 =?utf-8?B?a3BrUVNiNUdqNU9PaElFOGdObjYrbTZDa3FVY3hMRERGSVhzc2N6MGt3ODdH?=
 =?utf-8?B?T1BWSHd4ZG5DTDlLTzkvMVFoQmtROWRReW9FSjk5VUhjbW95NHlCc2Roallx?=
 =?utf-8?B?VVU3QUV2SFBYUU5USnFhNFExa2U5U21TSTROelJYZDN0UHdyTldyUzltZUtu?=
 =?utf-8?B?K2pYZ004YVNVWU1kUFhzV2pDZElrTzBWMm5HdXp4ajRUYk9QZXVDWjdOSVgv?=
 =?utf-8?B?eEJEV0dmRXFPeG1HUFlhVkF3ZERNTmgvTVU5RmpMdlBGZXNsNjlaVHN0VGQ5?=
 =?utf-8?B?NTloYnB0V29qOHVDM3B1RTBnOUZDeWc1QkRqUEswK1pMVGw2cmViWFJHUW9L?=
 =?utf-8?B?RjdZcDRRTDBhRmlqT1U3cm03UDRuQ2tOK3U5YXJ0MmpPK2xWdVRuSjVqOXh6?=
 =?utf-8?B?UTVUc3grRVhVSmE4ZUhJbWxCOU90TEIvVXF2TzVHWWc3cGU2N2hIWVpuWUxx?=
 =?utf-8?B?bGFiNS92MlBhM0NWdWdQM3FmQ1UzSHFiVkRHeVlHc3RvTm4xZ1RRTUhKdTk4?=
 =?utf-8?B?REpMbVlnQ293bzdVVWZmT3lnblBzTm9NNmR0Q2tUbGNaWEtQbGpqcjFHWXk3?=
 =?utf-8?B?VVhKc0djRS8vZ05DV2Zkdi91b1UrekdHVTBHYisrOVVTbGplcnZpS3d1ZTk4?=
 =?utf-8?B?bWVSbWRVWTZYUzZRakYyZ2c3ZHEyTkF5UVdTYzRIZWNPWmlyRVErV1BBdXRx?=
 =?utf-8?B?TWVhd1FsdTloRzRCMnZSNnBMTmVTa1lDUGZCM1VEUVpwMWtEOTI0TTVHZm81?=
 =?utf-8?B?Qkt5NmdBYVJ6U1lGN0xiUjhlRHpWUDcvOVM3YUVQQTNDMDRmZjNLdDFCYlk2?=
 =?utf-8?B?MjFpbTNpU2dnblJpelZDU09YWEhJOXgxNytGQjd3T05BWEJocW04c05Bays1?=
 =?utf-8?B?RWVSSllLb0liYmY2bGN2TTdjejUvaDFQU3BEU1AzVUFoM0FGbkZ0NkFiZHl5?=
 =?utf-8?B?ZUswSjlTQW9DTndlMEMwOXA5a2NkdkpFLzF6azVOVm4yNndTaGxHMjFoc1M2?=
 =?utf-8?B?WEQ4dkpBKzZxM1JQYmpHS08vWmphLzRFbnVSQ0RnaFdSeXJrRGZoV2MybUZE?=
 =?utf-8?B?Z3Z5UVJ4bEgwVzVLNFdidDhWUVJMZ09qbDBQT0k5NUN4T1l6VUxRUTVnaytr?=
 =?utf-8?B?RnVsVlYrUU5DY1ZBRmpRay9XSit4cXNuSG5uUnRWcnU2TnJtczdjcDhxWU1X?=
 =?utf-8?B?NWhhV0dWQ1Y2L0MyRE9OYUdEQUVNRlhtbEJXcHVDeUZPM0VpeFlCMFBtUE5u?=
 =?utf-8?B?QjNpK01DdnFzc2FzMHYrLzg0Rkd3WG55S3lOdmU5V1AzbHRSSmI2S3VGOTNi?=
 =?utf-8?B?ZWpoZnVkMldpcFU0ZWZ6cmFiTCs5VDdFeDdPQ1Z1OXp6bm9pTnAyd2E5MkJt?=
 =?utf-8?B?NXlKOG1CalVKWW5FTTF3VldFUnErT2NTRENoRkd5M1k2ZUhwS3pHTFgwdytC?=
 =?utf-8?Q?radPxWV5S3LGohnIqqEY4H1zx97aOpHxJpyXlIj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(366010); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnpQUEpMZ0pzMWpLelJyK3ZUdUd5a0E1dXBZSlRueWhadmo3M1dYUFNDV2xo?=
 =?utf-8?B?Zk0yUitETmtXQ2FkNHd6UU8vaUc2b3lJRVdJVDZ1V3R4MjdtRWJSbzhmU0k1?=
 =?utf-8?B?VElVNGNzZVdNMXVMMTczL2xCa0hWcW14NTFtMHg3bW5udnpONVd5SkJTNEZY?=
 =?utf-8?B?RTZpdGZIdG1KNEZDc1hDQTJNb3FiMW9NdEd5NFhCQVZOY092M2tmMHp4cmlH?=
 =?utf-8?B?SVRXWDJqOVBMWE5MQVZHVTV3V0xOMGIzSm1JVk9mWmxGdHJDcWUzMmVDU3FK?=
 =?utf-8?B?ZnFXOURHS2dxaVBmVERHY3FaRkE4UDBzcjNoZ1MrcHV2eENlVSswWmJHejBR?=
 =?utf-8?B?cXBVb0NhNzhlc01hcUFFMlM5ajB4OG0rN09YaGxaZitrQkEvbUFuTVRuOEw5?=
 =?utf-8?B?cm1sUWZqZ0FYZUNrM0VveDFITDdTcXMrY3dNb0RvdzRqZ205ZkdQUitNbkFp?=
 =?utf-8?B?S3NoL2tjOXRGRFVWWDg1bkkxVGNRdE54OVQ4R2ZiakZXbk84V0hmTWFnV2xJ?=
 =?utf-8?B?ZlptL3U5R2d1bWZiakk5Zm5YYXU2RWFGWXFVUStZTThvbXlmQkF3MEUrK25X?=
 =?utf-8?B?SVUwWWZCUDNHQ1ZCeTlLQ3VKSmh3MHZ5TWdTZU05RWErOEk0SjFyU0s3SmJj?=
 =?utf-8?B?RjIvUUJIM0ZNYm16anZXRVRlK1Y2UGxQUjk1L1NzYVNDWU85N0I1TzI4QTl3?=
 =?utf-8?B?Qm1XQ0prL2FNNjA4RlZ6cGxsZ1NaVHFNYzBFSG5TNS9KWjhxM0R2VmVlazQv?=
 =?utf-8?B?YjlFU0ErZUxUdzRqZ2MvcmcvbkVCSkpUaUtGVzhHY2FtNFRPa2FHNE1WOXBN?=
 =?utf-8?B?Uzd5ZG53RFNMN0JEMFBFL2dkTjkydGNGLzFPTVJWWlpLbzBCU3hIdUl1b0tS?=
 =?utf-8?B?eFVzNnN5eWsxbG1TVkVPYWU2eDJBampoMExYdHArNExGaTdxN0FMaEdreVEy?=
 =?utf-8?B?NnFKZ05uL1VFaUhvM216UnJLV0RMVHJqUnRYN3RWQWRxbzQ3cTYrYTN5dGZ0?=
 =?utf-8?B?djl4Si9DSEFPWWRKVXBSbk44NjFzZUxpWnNGZXQreWpva21ucGE5UjZnbm54?=
 =?utf-8?B?MFphdXJMSWtCckR4Sk1NcmpkRk5uZ0pwMTkraFBCaS9QVFJxMzZMQWxDbkNl?=
 =?utf-8?B?SHliWGd4MVd4cElyM0NhTTdjVTlLbUVtQndqMkhiYXFMQStjOEJ0YnArMS94?=
 =?utf-8?B?cDJnOWN4UWIrTmc1N1I0ZW1tQS9mbXJWUERiL1ROWFB2UHdhTS9pSmg5cmN0?=
 =?utf-8?B?ZG1jTG0xZHMvcEY3a2xSTVBNKzFGVTJXREZNdVM0SDd1Sk1RUmRidW5RSlFl?=
 =?utf-8?B?K1VKOVA2NjdtZkFnMXlhdTRrdkpNaTVvaGUzMXJZMUM1TUNQTmw2SUtYZXlM?=
 =?utf-8?B?S1JUTTdHWTVkVUxVK3pwUDdjQXBUeW9YZEloZnRsZkdwWSt0eXNYVVFyMGNx?=
 =?utf-8?B?RTU4cU80YzJhQkwzSk5iNG1sWVBYYndRejE2d1VIaDNIcDd5MEpBTGh6Wmdp?=
 =?utf-8?B?bDlUZGgxMHhSdTc1NmdidGVnVTQrKzlvQmpCYkhtQ3E5NDdjZXZ5SUMrOGRz?=
 =?utf-8?B?YzBqbUV4VzhHM0lvdFRCQmRhd1JIZERtdWYvZVJranpkZHorMWN6NVRja255?=
 =?utf-8?B?SGwrVHJGVmt5MU1vRG1DK0V0bzZKZ25VeVhPYnIxK1FOTU9VOTBReThnOUdn?=
 =?utf-8?B?UmdOd0drWDdBbjdueTl6ZE1nWk5YUU1NWUpQZXRrQVl3RXhIRzhwZEoxT2Yv?=
 =?utf-8?B?bTRWcThFWGxaZkxmcXlhODZIWjlLeWV5UkdZMXVJZ1lIL2E4YkJ3SWFtMTRz?=
 =?utf-8?B?TS9tNTBwYnZ6MUFRTUhDL3dnQTVmZG5sbjRLZVphZ1VialpGV1FqQkYwVTVi?=
 =?utf-8?B?Sm5IM24ya2JsTzkyd1JWU25GVGtmcEZmbWZ6QUlQWHlRSU5WRXRPdTJFR3V2?=
 =?utf-8?B?OTU5c0lKYVRKTFVPcFJ0OUl5Q25HUEVKU0gyRXl2SlljMkZFZVVrVzB0K05H?=
 =?utf-8?B?dFdMa3AwL2FoR2NyVUljRXVsOEFjTDJVYlBlTFZXYkVRblVPbmpQL2Zrbjd4?=
 =?utf-8?B?a0RUS3lwY0dZemgrN1JrckN5bHJCY2hnRmx1aitPTzVzRWJYMmx2Rjh1WDZr?=
 =?utf-8?B?WFNIalZBdTRDZm9TYURmclFzOEpDUit4ZlFYZ2x0Uk9PVmRjWDBua1BFZXRj?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a375b098-8e3b-4842-0b26-08dc8b6000e6
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 04:19:22.9288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pf7pI/53/mNxEq618pfXbg5kz8wuCREe2nSLlD+MNA8MY/7+y9J6wFWX0zzhYQWFxNYqqco+xpNZkyu8OuwvrPPj1srMW6dKdCPXe3EHHzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5886
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

Hi Kamil,

On 12-06-2024 05:58 pm, Kamil Konieczny wrote:
> Hi Modem,,
> On 2024-06-12 at 16:26:43 +0530, Modem, Bhanuprakash wrote:
>>
>> On 12-06-2024 02:29 pm, Kamil Konieczny wrote:
>>> Hi Bhanuprakash,
>>> On 2024-06-12 at 12:33:34 +0530, Bhanuprakash Modem wrote:
>>>> Move all MSM specific tests (tests/msm_*) to new dir
>>>> (tests/msm/msm_*).
>>>>
>>>> Cc: Rob Clark <robdclark@chromium.org>
>>>> Cc: Helen Koike <helen.koike@collabora.com>
>>>> Cc: Emma Anholt <emma@anholt.net>
>>>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>>> Acked-by:  Rob Clark <robdclark@chromium.org>
>>>> ---
>>>>    meson.build           |  8 ++++++++
>>>>    tests/meson.build     | 19 ++-----------------
>>>>    tests/msm/meson.build | 16 ++++++++++++++++
>>>>    3 files changed, 26 insertions(+), 17 deletions(-)
>>>
>>> I do not see any msm files moved, is this an ommision?
>>
>> Yeah, we are not moving any source files, but we are storing bins in new
>> directory.
>>
>> Can I change the commit message?
>>
>> - Bhanu
> 
> If you made a big change to patch you should remove r-b and a-b,
> as this could potentially break someones ci.

I know, but I haven't made any changes in V2, hence keeping the R-b & A-b.

> 
> For me it is ok but please resend with subject change and
> description updated and wait for ack from Rob.

Sure, I'll resend this patch with updated commit message.
And I don't think we need to go through all the CI process, since it is 
a commit change only.

> 
> btw whats wrong with binaries msm_* in build/tests ?

There is nothing wrong with the existing one. Just to maintain the 
uniformness, I'm moving all non-Intel test bins to their corresponding dirs.

- Bhanu

> 
> Regards,
> Kamil
> 
>>
>>>
>>> Regards,
>>> Kamil
>>>
>>>>    create mode 100644 tests/msm/meson.build
>>>>
>>>> diff --git a/meson.build b/meson.build
>>>> index 701a5cc35..6ae3c2684 100644
>>>> --- a/meson.build
>>>> +++ b/meson.build
>>>> @@ -276,6 +276,7 @@ includedir = get_option('includedir')
>>>>    libdir = get_option('libdir')
>>>>    libexecdir = join_paths(get_option('libexecdir'), 'igt-gpu-tools')
>>>>    amdgpudir = join_paths(libexecdir, 'amdgpu')
>>>> +msmdir = join_paths(libexecdir, 'msm')
>>>>    panfrostdir = join_paths(libexecdir, 'panfrost')
>>>>    v3ddir = join_paths(libexecdir, 'v3d')
>>>>    vc4dir = join_paths(libexecdir, 'vc4')
>>>> @@ -316,6 +317,12 @@ if get_option('use_rpath')
>>>>    	endforeach
>>>>    	amdgpudir_rpathdir = join_paths(amdgpudir_rpathdir, libdir)
>>>> +	msm_rpathdir = '$ORIGIN'
>>>> +	foreach p : msmdir.split('/')
>>>> +		msm_rpathdir = join_paths(msm_rpathdir, '..')
>>>> +	endforeach
>>>> +	msm_rpathdir = join_paths(msm_rpathdir, libdir)
>>>> +
>>>>    	panfrost_rpathdir = '$ORIGIN'
>>>>    	foreach p : panfrostdir.split('/')
>>>>    		panfrost_rpathdir = join_paths(panfrost_rpathdir, '..')
>>>> @@ -343,6 +350,7 @@ else
>>>>    	bindir_rpathdir = ''
>>>>    	libexecdir_rpathdir = ''
>>>>    	amdgpudir_rpathdir = ''
>>>> +	msm_rpathdir = ''
>>>>    	panfrost_rpathdir = ''
>>>>    	v3d_rpathdir = ''
>>>>    	vc4_rpathdir = ''
>>>> diff --git a/tests/meson.build b/tests/meson.build
>>>> index 16896de99..122fbd07c 100644
>>>> --- a/tests/meson.build
>>>> +++ b/tests/meson.build
>>>> @@ -314,14 +314,6 @@ intel_xe_progs = [
>>>>    	'xe_sysfs_scheduler',
>>>>    ]
>>>> -msm_progs = [
>>>> -	'msm_mapping',
>>>> -	'msm_recovery',
>>>> -	'msm_shrink',
>>>> -	'msm_submit',
>>>> -	'msm_submitoverhead',
>>>> -]
>>>> -
>>>>    chamelium_progs = [
>>>>    	'kms_chamelium_audio',
>>>>    	'kms_chamelium_color',
>>>> @@ -424,15 +416,6 @@ foreach prog : intel_progs
>>>>    	endif
>>>>    endforeach
>>>> -foreach prog : msm_progs
>>>> -	test_executables += executable(prog, join_paths('msm', prog + '.c'),
>>>> -				       dependencies : test_deps,
>>>> -				       install_dir : libexecdir,
>>>> -				       install_rpath : libexecdir_rpathdir,
>>>> -				       install : true)
>>>> -	test_list += prog
>>>> -endforeach
>>>> -
>>>>    if chamelium.found()
>>>>    	foreach prog : chamelium_progs
>>>>    		testexe = executable(prog,
>>>> @@ -457,6 +440,8 @@ endif
>>>>    subdir('amdgpu')
>>>> +subdir('msm')
>>>> +
>>>>    subdir('panfrost')
>>>>    subdir('v3d')
>>>> diff --git a/tests/msm/meson.build b/tests/msm/meson.build
>>>> new file mode 100644
>>>> index 000000000..74169b5b2
>>>> --- /dev/null
>>>> +++ b/tests/msm/meson.build
>>>> @@ -0,0 +1,16 @@
>>>> +msm_progs = [
>>>> +	'msm_mapping',
>>>> +	'msm_recovery',
>>>> +	'msm_shrink',
>>>> +	'msm_submit',
>>>> +	'msm_submitoverhead',
>>>> +]
>>>> +
>>>> +foreach prog : msm_progs
>>>> +	test_executables += executable(prog, prog + '.c',
>>>> +				       dependencies : test_deps,
>>>> +				       install_dir : msmdir,
>>>> +				       install_rpath : msm_rpathdir,
>>>> +				       install : true)
>>>> +	test_list += join_paths('msm', prog)
>>>> +endforeach
>>>> -- 
>>>> 2.43.2
>>>>
