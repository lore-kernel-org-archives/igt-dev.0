Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED2260A3802
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 13:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eDl8DJWu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A4E10E254;
	Tue, 20 Oct 2026 13:32:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015F710E387
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 13:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792503070; x=1824039070;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4oW6B7p8mRGbh9DOeFeSqddAWVwlO272Qlyc5eDFlP8=;
 b=eDl8DJWu8PyCf1iya2m41X9LskHlfaqlxf2gfztJDyUe+l3PjtbfNt3w
 DDbDDVmeKeWaClZt22iYSdJ/oH5Q+0rMf+F2lT4Jmt7tgwkf9gX/KVEe0
 U/m5hSK7YXYOjBKYd1lWDPupvWeOeBkbebZv1GgomLLjvAyrCbw55nVxc
 40vWESUH+wmKzSgJaULnleOMhpyjmhGiz8WRoZO5ouZKSdWTGXZfoFGx3
 BJf/UKSsaOW5KnR4eze6qvDOYHGv+e1AvsNFAoagPpsDJTKQ96GDn5NUk
 VdRpZOnrRrcSi1zCCnM8DU1B88YsrkkiBv56EjmkzzoBdUr5v8zv8w+hN A==;
X-CSE-ConnectionGUID: DFaj3HQCQXuzlo76M6qE6w==
X-CSE-MsgGUID: 3PvPHam9STOQ5vTdIOAkfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1080992"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1080992"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 06:31:09 -0700
X-CSE-ConnectionGUID: x+j8PBGTTeOwIZ0Ba3/AMw==
X-CSE-MsgGUID: PWoKrhGPSxe2ToxhMay/Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2700970"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 06:31:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 06:31:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 06:31:09 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.66) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 06:31:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUY+W8JW2ncbws6VA2EjDK6yXdKb+KoVY3AkL/zVa118dD3PQirajFi8oh7fe7VPcspMG0fhupqTzqdA9+2mfGXAhIOmIvOlwePqs81rclusZw8TGKNdgia4EYqSzVLsQWmuJ4CB1beC07G6T//nUVohUJX3SH+AptkQcimJ0OkEY0KzKwLWP15zbo1ale8CT/vCkUZJo9/qPETCGc3o3N4Gj5O/b7vQ2aw8cjPxXPo3xNZnVqfw+4+JrYk5zfSqq8y0NQey/o9qK07Hwlx3GjK0xNMxYztT4taGLqClDff39vLIiYLQQyciY3hoYroFT7EftbIt6qG6Vlx2jIyA8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oW6B7p8mRGbh9DOeFeSqddAWVwlO272Qlyc5eDFlP8=;
 b=opyoeSfWswo9r6rtAyFREzVHumLqnX5TrvKAwXTRHt5fuxxuT8YJvQ+Rdl4a00Pu932biEtPbjVs9H0ZqZ56EVG3O4DLjGfh3a8oAFzlQs728L8RBfWNBlvpk9Wr1lEagVEnjbI6mW+oNkeCmKey0bgalChJHGirL2rLy6KkQ46bY2M1pgAK84RHgdFcbZeabmR2MvTxCscOAraxtTXOlB2CD+YkvI3tC+mLNIM0D0/RGDekIVcIeg6PKCPcR6bDKy0rrNacSNoAo9WrUj7fDkggLo/MNC6qBNIT7p23KCxrCR2teYO/zn0jNRGI3G6kaKCVVxiwJ2LzYUPZqBtsyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PR11MB352303.namprd11.prod.outlook.com (2603:10b6:8:50f::18)
 by SA1PR11MB6968.namprd11.prod.outlook.com (2603:10b6:806:2be::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Tue, 20 Oct
 2026 13:30:59 +0000
Received: from DS4PR11MB352303.namprd11.prod.outlook.com
 ([fe80::c82:2fc8:5d51:9a1b]) by DS4PR11MB352303.namprd11.prod.outlook.com
 ([fe80::c82:2fc8:5d51:9a1b%7]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 13:30:58 +0000
Message-ID: <1730d442-4c14-4edd-95ae-2e852fe9fd88@intel.com>
Date: Tue, 20 Oct 2026 15:30:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/gpu_cmds: use proper surface format for all platforms
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>
References: <20261019-bpp_surface_fix-v1-1-c030fa182e3a@intel.com>
 <20261020105648.3uerun3eqj3mvguz@kamilkon-DESK.igk.intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20261020105648.3uerun3eqj3mvguz@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P195CA0004.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::34) To DS4PR11MB352303.namprd11.prod.outlook.com
 (2603:10b6:8:50f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR11MB352303:EE_|SA1PR11MB6968:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b5f621-3667-45a3-10d0-08df2eae6067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: lI6Tc9nsWPhIKMMXPFRskWeUlg+d5HP+7M6RUogvuHxa//JipzIbkvLUgKiMdzu+F8lszuloyDCc6wulfk0Mi7VQbzn19Wg6lKtwaOMreqgQSDRExSr8nvN+DSQZ4xdpZd4+g0BTdN4EUY9Uw++v7QiWKYnK7IMmegO2PtcAMSQIsaVg3KxteleUyAaBZjWg81GxugqxlEUaRfJjT1+19W+hEYdjEUBg7r8/6n2wXhcv6MefjnZW7Xg6MX44WobxfyEc+Kxu/HQ6TzU5lLHfBzEMTk4KLR/HdvR3UYbfgRdAlXKiWpe/k+uJEFlIzK/Oao7u5AMos0pdvD9IWaVM7C4STizyXfDzMTk/VvtNegzXpgxmcA6VB8lVh06LYHWM1v7gSyC1bLkqlf+zNygko5LUUPXj749qvNuJwiCWqu6VKg/VQu5nDyT/iY9Lrrh+pat902EkitrSM9QRiVmrz2Dvasg0VmYnQABLV4bNmAWxUNb6IVs1AKlm56gKP7lYJtNJKdPIA/am+5M1KF0nVHI0z70e8Bu3JJZTL80G6yU09mcG/oAc4JOkviELj0ru56PaUpzBkp0PBAvLfDV+XH4TMzwUSD7CFzlMXa2YfP+AiXoXWirlyaFoKMJqutKCSl8pPv+lVJAf+Q5/BZG1iFp4MlyKoiZ+Y5ElKvSy0iA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB352303.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjZWVVYyZmJIN0I0QnZKS0s2Q0FPT0wrQVZ0MFZMWkI1MElPQWRrMXhLVFFa?=
 =?utf-8?B?QVY0bVpsWTlrYXdVY2p3RVg4akxyc2hHMUpIaUFQdW5Cd21oT3lvR2hhbXhi?=
 =?utf-8?B?eGVPNEp0WGkvM1hRSmZxNlFaeGlVN2w4SUtEcnFvbUhlZEdJUzFneGlGZFlm?=
 =?utf-8?B?azVtRzVLcWp5c3FTUEVhR0R3S3NXa0s5WDAxMjN0OXRQcTZIVUFxeThwWHNS?=
 =?utf-8?B?TVVWSmI3WVRQSFFBUk5HZEpKODQ5YVh0Z0RMa0NzNHhtSTRoa1VVQkppcjRO?=
 =?utf-8?B?TnVRWFp3MDd4ZkcrdUZVZnc3VEFwQTZMYjA2WktMbDRIelVTQjlTVkxpYThq?=
 =?utf-8?B?UC9Ocnp3ZmhBRmtRa2lsUHVtZ2JCZUV5SWhRRjk2b1RaNjFWSHdLZ0NVbkxQ?=
 =?utf-8?B?WXR3cnBlaUZzTDRhVEo0Z0l0SnI5R1pOdWUwaDdPWWZFck8vNm53ZDFhMVEr?=
 =?utf-8?B?YVRGM25vWElKM004aFhzcWYzaGZsUXNUdWV1d1ZzZVNURmZseVFXNnd1dThq?=
 =?utf-8?B?NFM5ZVJ5VTVBZDRIMFh1Z1dyVm9yRUZMYWJwNW9KZ05NNnlBQVA0SG01TDAx?=
 =?utf-8?B?YitDdGNFb2ZuWmFQN0lRWHE0ZVE4aXMvRUR0d1JTcUQ4RGt3MGVJWnJYVDVB?=
 =?utf-8?B?Q096VVNpSzhCaEx3N283T2RJVCthKzBKdEl6cW1FOXFYRitaeFVUcWVhNWRK?=
 =?utf-8?B?QjBSWEV1NmhtYUcwclpDSGRwSVdXcXJOM0tiak04R0lQODFxd3JnZzEySVBy?=
 =?utf-8?B?YU9jTXhUVXQySEtmWjVqdGNGNUNFZEhwQkEvSjdWRXMxTE9ZR1pTTGhZYXJJ?=
 =?utf-8?B?SFg1VllJSjJoWkh1eVNGcjJLOVJHS3FLYXo0ejRDN2dJMmJSeHBXUElESWxt?=
 =?utf-8?B?TGNyVU02K2VWcWptZDRiL085bFFzOE91Z1JiVnVncUF4ajA5eVpITmpiTmZs?=
 =?utf-8?B?V2tMK3hxc2NLZUQyelpXTjZubXlEcUdDLzZHTWVJRVRtZUhacHc0dmdmMFBt?=
 =?utf-8?B?a3NHbTBYWnJZYlFpSUhFMDBnYzQzbjFjNHREb0MvRWdIdXFQRks1bzg1b3M1?=
 =?utf-8?B?MUFmQlA4Tnl4Z1hyTU1ra1VHa3hzOUFhbVhnNFdkUXZ0bEQweUNJRUF5VFJ3?=
 =?utf-8?B?ZmI2VDNZamJMbndBUHNFRkVXWllOL1pwaFFHdDlncmVUa2Y4QWdVc2dKRG53?=
 =?utf-8?B?NDZUdDczUG9mYnZ3UGhRakYwTHUwZXFYYkNiUk9IalFwNlJ1U3pFYThtc1hz?=
 =?utf-8?B?NlRXOVBibWpQaDBVajRpWnJFamVIaVhwTkEvZkhIcWRDN1RORlVXMXFFekRJ?=
 =?utf-8?B?bXNNYXl5QzBCQUNlYzROYWw5bE5ZQkNSdVp0cWt6bDNLN0QxL0RDZnA4V0dN?=
 =?utf-8?B?Z2lQTFlaYXUwZUxLZi85VGJUVzM3OG9pR3lUNFRhUFpQcXVyYkZTamlHdFIx?=
 =?utf-8?B?QnpJVjk1cEZ0bmorblN2REpOSlVJampyamZhWi9XbCtjTzdLNVZSOWpnbmFj?=
 =?utf-8?B?YnExYlhSVThoWldPcS8veSt5RGNPdlFmRDV1S2lGU2p3YTR5aiszOFhxeTl4?=
 =?utf-8?B?bE9HcWZ5R0Y3a1pNLzh6QzRwdlVxYVg1TGVuUmxRV3ZiSVQ3d1FycDFVZHRR?=
 =?utf-8?B?bDgrM0k4OUJxKzhncmhqMW8yREgxZTIyb2VjODVhR3Jsd2J6NFk0c0Z6c1lz?=
 =?utf-8?B?UndVWmJHQkkxdVJJUzNPa0wwWkt5eHpiN3JDdU5qdGhuTHdySjVGUWdsN2hh?=
 =?utf-8?B?ajJmcU5ZdTBQZVNSQTlGK0RFV25tb1huc05YTlUwM0U4SXpzazk2b3JSWmZZ?=
 =?utf-8?B?YXZQR1gyNHR5dVIwWTZsV2tUbms3NjFlbTNhQ0ZXdjdLZ0trR21IOXZPYWo4?=
 =?utf-8?B?alF3c1pQTHNYemwyWHh5WWFXeGpjbFBZQTFQZDlLSk0rd2JwZkQ3b2VlcTdh?=
 =?utf-8?B?MEdUMUVOVzJmQTdobzRDR21Jbk84d1VGL2dzTmV4NkFURzl0TXF0SDdSUmlX?=
 =?utf-8?B?bXl1WkU2ZWNTam12b1BHQ3JFTEk4QTE2MnlQaFJCU1hZMWN3K2hoMEpjeVdm?=
 =?utf-8?B?bFBUR1c3SGt3bUJnaUZhSG9BRngrblMzNW1BbTRxNWdYYTVVTnlldWdocG5I?=
 =?utf-8?B?eE1LZUd6allzT1ArR2EvVzBXZ0h2MG5OVU1RMmVmVzRNN1hyV0dUYStUYTZl?=
 =?utf-8?B?VnNyejZDREdkS2VIc3JBcGVMYWxJQWZzRDJOZThaK3RwVVpvRXdGRTVVMFhZ?=
 =?utf-8?B?V05SWHFQc21YU01YdlR4MlJjZngxb003dW1EUUxJQmxGdisrUjNLcStOK0JP?=
 =?utf-8?B?SGYrSnFvRFpmeWpVREp3UVhDTGZCYjcwd1V4YSswVlZnRVlKK1JKQT09?=
X-Exchange-RoutingPolicyChecked: hip0lHxylQwBYd/Qmotg43I1Lp6PX6cjEpb3JxWR0lMx/cLhr5W0LWORzpdikQp//E2jqmPZCsXK09KSRoh1HptMD8s3RUg9YFHAaj+WTlW5HSkuLAOaILWbfcin2j8B8HyjtAJEnfFFeVlmtVOcN9KptCLQvRprnzcKI/gYAHL4N9VwqeG5zj688WiymTXS50PPJCSHfEXeVgI1cQ8tk8EZGyocrpa16Av0hl4RTMMWp1X4FGyr1UkhmUdVV8sk6HwaEK6zyxq+JiSk+ckmQGJNCRI+N7PrvlDyNNDm0SlqGSNrrf/YGtjm5cwD98FDHyI8nK79ohfY9F1WGWQpJQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b5f621-3667-45a3-10d0-08df2eae6067
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB352303.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 13:30:58.8432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7q6Wy+krGknIk9Yc3MOQTmOAbDGx2J2ffH4+sBGTZMfSJi13H4P3ftiFQS9KCAx9MGGzzEsvPtIF5HZwr5l+tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6968
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


W dniu 20.10.2026 o 12:56, Kamil Konieczny pisze:
> Hi Andrzej,
> On 2026-10-19 at 19:23:31 +0200, Andrzej Hajda wrote:
>> On older platforms (< 2.0) SURFACEFORMAT_R8_UNORM was used always,
>> regardless of bpp, as it does not matter for media block send messages.
>> Since 2.0 format reflecting bpp is required. The code was adjusted
>> only for newer platforms, conditionals were added suggesting this is
>> kind-of-workaround. The patch removes these conditionals, there is no
>> point to keep them and perform cargo cult on new code.
>>
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> ---
> LGTM
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Regards,
> Kamil


Thx, merged.

Regards

Andrzej

