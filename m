Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D6CC5DF74
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 14:14:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742E510E00B;
	Tue, 18 Aug 2026 14:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQUlUGJ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D215610E00B
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 14:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787062461; x=1818598461;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7oJSQma9UY7XEfyVqvQvJxGVY12xaV6NcNnDLqKxTH4=;
 b=eQUlUGJ9NKcwZojUaOwboROuXaqwt0MCxK7lmfVzZStVxmZkWohyog34
 WtFJld6fiGMO8l2RD9og5d6HeEmqMekBXFQxL6JbY/tcQ4kj8JOGmF0F/
 way8d+RXDoy6dLK4k5y3li9fnSMfJ3xH8Yr+aDwlEdScc3uzyj0pItcZw
 yqy2Hh6tCaTTscSHpFeZz5nRbBqp+BcYpevwCcu3CoFO0wS+T8HHKxo+Z
 kQn3UvMlrcwz5vCB3EYgVCel9X3BHlA7BYC8fUZsvBqy4VOjvCotYJsv+
 iW/VpyQ+E1qSFYqYB1ErMMdIsrhFlusHwRtYzLb+iTg0mzeQ5HxHhc9ce Q==;
X-CSE-ConnectionGUID: 3w6qoEXBQNCnsmL/+4O2hw==
X-CSE-MsgGUID: TzIXYrMxSbqXg4bthMTCWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98918328"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98918328"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 07:14:20 -0700
X-CSE-ConnectionGUID: poj5BIZ1TpaYU/d0HvcGyw==
X-CSE-MsgGUID: CVDBxpY8SRu8bRhaT4hgdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="262610942"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 07:14:20 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 07:14:20 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 07:14:20 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.64) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 07:14:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kosSx5gfSouaaTS/vHQigRtO+4zVyeGLMMOJGBSf8asUO1In20VzlUzmh0XbHOgXDD3/eiXH6hwMyiUZaYuwipMk5snda8Sipii2ifImMehtEhRe6p+XAqhYqXYmQIU3T6gcUoQlYJoNEuNcxEc471+FAGTQvDqFUdmXpSfCeEZPuCkEYZ5KEzmc5Z7TX9tcoFgkDIn3Cp1g+pG4nULXMEIny6uYS6eLjj+Ez07YoVPnwM58m+8RsWfnrZGCvMkXO0sboJDdMvMACV6HEybAdRFHauTzkbmdB5NMeLDB2qwbNEY3leNWs9tvp58VFHN3dip6/k0NbeHbvLP5bGm7fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6Cf3mSugJ1gVLyFKklYIPCbd7Z8rQ45HQfaoa/fX4s=;
 b=TCkskeFVvz7dDcqAOpMCP2ocIqnu7XnffW7jwC0oHkLWmrkrJdktSWRV+zuG72O9wzUNne1Db0hwWFyUk7GU3LUKW/9ZrEz/Qw1Kg/NtXwdPNMV1V0J+/IyTfLNJc1cw76m+Asg9SnFUSr6ODwShx5pAEtVjwkn1OPCo4rLE2VvgwYpHkRTsDZogda51xw8GkP+l/p9ZwnPn5QQm6jIH6rSx8JJxxLZ8wEWfNk4hDIRo86ggYSohCEI5r3JFTG8beQ2pAJdTiSiBkoare6HSB7KCwb8UUdGYA/e0gi/jbxgqOTmdJ84HavG4JOgYOW6QPlImuyMasSTThz+mQtCbpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by CY8PR11MB6988.namprd11.prod.outlook.com (2603:10b6:930:54::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 14:14:17 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 14:14:16 +0000
Message-ID: <aec316db-cdf9-4cc0-b016-70be6f66eb45@intel.com>
Date: Tue, 18 Aug 2026 16:14:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/6] tests/intel/xe_sriov_scheduling: Disable VFs
 before resetting sched params
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <cover.1787056235.git.marcin.bernatowicz@linux.intel.com>
 <ac3abf6574371b4418cf898f16bfe9443f48a653.1787056235.git.marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <ac3abf6574371b4418cf898f16bfe9443f48a653.1787056235.git.marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0275.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::48) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|CY8PR11MB6988:EE_
X-MS-Office365-Filtering-Correlation-Id: a90cfbec-e90c-4def-dc61-08defd32fc8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|4143699003|11063799006|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: DH0B207iafkC9amjyPEEmOxoLaolnjM4iShCeFZBJd/wdXV/VVNTUSMtRDDuEpomoToKcs7mqZCQrgvQY0yMrn5pR0px8x/Mib85M729aTEh+jcHE9WNdJW0NxY/2Qlk2cz1oOFCsXnvto7yTsTRAo7UqyUpQfrJT2PgZo+16n23Oa9nwBQEyj1I2ki2cSSMeLLqPgQBzNm+1yT4SofmrGeMabMKLQDiIqHYiSvO8hth4jyO2LQvVqJgtLqb7LYbV4fPeEkiVYlNMgKiEwPk+c+I1DO32qEIK0nrS7lzx0+gcss3Vhs/AyMGiXOBGg9SDOpEIzyKVHhYWYnQDT5im2Yj5XrDDJxV1GMa9r/Mf1NnU/OAoP1L9dJWHfbDDmsvhj2D2ShG4PiiLLo10+syqa20ih+7yeP+MWQMPA90vUVH0IMrly4UHvpGNPAkClyOkx12Aka3pJe9VIzqE40SODTaRo/f4WcMv0s/E+wKZOorghO3boUT0w6Voynq7sRW5K5mGBAZKYJKImtZ+hCiFFr0QYZBGzKjghWWKo5McIceqki+8VruXnN7h3LcfdhDln1kQJQbQIfgmfJWj5VUIrTb5dR268qWXlNASt95X0QxE9bzVshG47/S0rkyTGoMLaQF8IyTr9h+aOO/dPbx4LzYAGVwTpzQaW59n7iMbeE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(4143699003)(11063799006)(56012099006)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlZTeVFUdWRmblNYekR4NFE4UUNMSHFrUDRkNVpNWFNRcENxTDdrb3puOXZ0?=
 =?utf-8?B?bFA1eTk2Ky9GVytUdGNiSWJuQXRaZ2VJN0JPaERSOGZTak5GSEd5RlgvNENm?=
 =?utf-8?B?L0hGL3FMUWdNVnpLaERhR2FGQkZZclYxMlhNMDkxZngyTnRMcGR3cDV0MVRM?=
 =?utf-8?B?czU0WklSY3liMTZTY1RsT3lzUi9zWTg1VHFiRUt4NW1NWjhwQ1I4WDJrRmI4?=
 =?utf-8?B?Z2FLcTRTTmZyREdhMHdGMW0zZlVxalo5OWJ2Tnp1QkZJS1RzeG5jV05oYS9X?=
 =?utf-8?B?NmpUV2pkMWMzbEFjVmEzZ2haZzlMaTl4RFhDWGQrVXNkbWZtdnNVWnp6UE5M?=
 =?utf-8?B?MlQzRUVaeEIzOUdlY0dxUjhsZkFOaEptckJiaVZ5b3psR2hDYnU3Nk04UnhH?=
 =?utf-8?B?bGVvQWFhTUhqamZEZVFoMTFVQ2d1UWNEcW8wYm1RL0J6dnBNaEZ6VVNqNWVP?=
 =?utf-8?B?c1oyc1BweTlua3VjVzdrRFRYWGREQTcyaTFKS1ZJRjhSMzlzemYwTXBlYWFE?=
 =?utf-8?B?RnJHSDlhNG5Xc2ZoOUoxNDJQTjZ2dHhSS2V5TkE5UUgyNVY5K0hJc2FNbndT?=
 =?utf-8?B?VGRUd2lZd2xYUEdUNUd1Mjl6UFVXWmRTUE1ic0cyWmlOWWhUUUh3dHo1YitP?=
 =?utf-8?B?akFLRkM1SzNIQU1wajFYcnQxTXhORVB5cHIyNytXYjNkT1NrOS94Wk53NWZT?=
 =?utf-8?B?VjBIU2FhS0NvYllPMUxCOE1iMWZyaGdDTjNKREtFblA0d05RYi9yd2cydmti?=
 =?utf-8?B?V3ZNN014OFJRUjNnNkV0Q1ZiQ3pyYW1BalJGREZnNUhpZ2xHZHArTlhCZTFx?=
 =?utf-8?B?Zm0xVXE4dXRKN0VuWG9GOS9aV2dQcDR5NGVXdTcwS1dqRXdtdDh1TDY4bW9r?=
 =?utf-8?B?WnlDTVg5STdlMkRKVXZKLzkvMTlYSVQ4YjMrZ0lPQmJ4WDlkQk5xQzFGSGJO?=
 =?utf-8?B?amNpaFpWQUNqK3o3dEE2QXEvU2pTNTUvV1Z0UzFRalk1Mmx2WWd3U0pVSWsr?=
 =?utf-8?B?L0EyQ0g2b2ljYlIxZkVWS2NuSk5aQ3FuRmQrTnV1U1lZV2plRjJSUzhBMUVz?=
 =?utf-8?B?R3R4WnU4VTJGK2txTTJQZW90cHVHMnlab2xRV05vODZlSEpXMXBFQTI5RzdX?=
 =?utf-8?B?OEsxZUZmV28xeVpEMHFVNk9XbXE5Z3JxYU81ZzhkWlp2dE12Sndna1dHeVFl?=
 =?utf-8?B?MEhtWFdIQ0t4aGVOcGVZM3BZWU9zVlhSeXhmb1pTWHdUL1ArUXZNRVNnZkRp?=
 =?utf-8?B?RlpFaUJPMXcvcDNQRUpLV1BZSkxGaWF4NWNOdEpFeUYxY0FlOHpEU0xCU0pl?=
 =?utf-8?B?eENsMUJjUVhkQWVNNkN2dksrVVVsZTRsdUNDM0E2ekxNV0RGNEFxTVhFSHJm?=
 =?utf-8?B?VHZGMFRGMGw5Ulc2ZHY1dmVIS3c2NUFsZlFFRk5FaEFiSGp6NjdHN0tqRUJT?=
 =?utf-8?B?OEc1ZGVCOEMweURQblZXOWw0NkJ6US9uTU5xc2NyZCsraThLbjgrY2I5VnNZ?=
 =?utf-8?B?RnVGZnIxSXJIdWRnWU1KOGRJSk5nWWJEbS9IQlpKY1RBbUcvUjBJRlZJNW9m?=
 =?utf-8?B?Zm1Ma3BzSUtFNnpOZE1yWnozVXRSRnV6STFWNCtrdXIxeDlGM053WHBoY3lR?=
 =?utf-8?B?UzlLa3AySnpESDhSUG4zUENkQ2pLY2xMQUord1g3WnVBTmQwdE4vQnd2RDRS?=
 =?utf-8?B?cjc5Qkwxcm9uSWtoOWw3RUpmSzcybmVxRWFzL3F4cWdQcHd0VkhsczEwUU4x?=
 =?utf-8?B?L25MaEhTdDFlODhINzZ3d3NzVElGNGNsbmZZakNMS2JKQ1JLVkxqeHlUMVdh?=
 =?utf-8?B?RDNQcDFkcU5HZHB6cHJvQnpPdGp3dis5SmFoSWRLSWV4NVdlM1lyR2FmVDNR?=
 =?utf-8?B?c2VUZm10bzhiamJEbnlJT29XUW5sTU5SYXpsM1RVYjh0ZXh2YUs5RVl0WjVo?=
 =?utf-8?B?ZmdLdXpFRGpraFJLeDVLTnlJREE4d3BTdm51Qm5KRTZ5THRyQjRvM1pQS2Zo?=
 =?utf-8?B?NW5mWmFYaEtEV0o1Ti93aVpySlArZXdkeWJndTBMWTZUN3orOVJTOFJWblB1?=
 =?utf-8?B?Snh3RmphZ1FFUU1FaUwvckVCMXNDSUg5VlRXQzNGaUN6UmVqQzFya2NycEM2?=
 =?utf-8?B?aEhxOHNPdGY4NWNid3ZKTnNNTFJGL2Zldk5ob1lVdVY0UmMyOFBoemhjbGRP?=
 =?utf-8?B?dkwzdWxZVlVNR2hJQ0pReTFDTTZ1a25DMUJpdXdvWHFQZy9vdEtURkNvUzg0?=
 =?utf-8?B?ZWJiRUR6ZDRKb00rRXBsbG5XWmNuS2hsWk1TME4wNU4yUnJkQWg2TFlTNUFl?=
 =?utf-8?B?WHgwcVNPUmpzeHlwM1hTYm1QUFE3S3lyQTJ5Z0d1QXVTSkk0QUY1UT09?=
X-Exchange-RoutingPolicyChecked: JVx77Wyc2GLScteuESHrXs4kkls31CIAVZXXSPIXEapGm2GqZhWOUPbmJH++4dQRA4g9ye4DcparJ0bMiMRjctJ2I+1qjfyEkXZ2oQph39XZoXxrkyrOpCQF88lQQUVU8H5uZwEPfZxYgUsod3gAS5xOuDyHh5R3/KrYuxVuwF6e1F8ZQ7Vikk0o3zw2wNejm6SV+dOIyyj/TMSbWBlNUhBpIv4QhzaBWKygWUazQ3RMhJ9fnwtZK4jG/K1ee3culeoZYvlhkKStGSmOHWPbL4CXNpb5wxxAbJTTUBnPc8AZetqCkY69YGCVjo5ivNMfbZse963GFB/UlDXs/MjWsg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a90cfbec-e90c-4def-dc61-08defd32fc8c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 14:14:16.6437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0coQzZdVEszbmnognxQ+ZYsN9AFDZiLlljbACOWykdQT+BrWdGImc4z6VHyN15lSsfdffYjIvGdGSLm0UdgR5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6988
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


On 8/18/2026 14:39, Marcin Bernatowicz wrote:
> Disable VFs before clearing scheduling parameters in fixtures and final
> cleanup. This avoids resetting scheduling while VFs are still active,
> which can leave cleanup incomplete and cause subsequent VF probing to fail.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   tests/intel/xe_sriov_scheduling.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index 5d30b961d..a2240e473 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -1565,9 +1565,9 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
>   		}
>   
>   		igt_fixture() {
> +			xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
>   			__set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
>   						    &(struct vf_sched_params){});
> -			xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
>   		}
>   	}
>   
> @@ -1617,18 +1617,18 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
>   		}
>   
>   		igt_fixture() {
> +			xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
>   			__set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
>   						    &(struct vf_sched_params){});
> -			xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
>   		}
>   	}
>   
>   	igt_fixture() {
>   		int ret;
>   
> +		xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
>   		ret = __set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
>   						  &(struct vf_sched_params){});
> -		xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
>   		/* abort to avoid execution of next tests with enabled VFs */
>   		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
>   			       "Failed to disable VF(s)");
