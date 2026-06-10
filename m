Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717B1CD98C7
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 07:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1AC10E782;
	Wed, 10 Jun 2026 07:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dAC0TSxc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799B410E6C6
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 07:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781077579; x=1812613579;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P8avO4J12ZqtIWQElYvLYsUFAGDUuRxhlUzWWJtt/CM=;
 b=dAC0TSxc7OfUWOemk8ShEXJX/MVT8rrDBz512B4eHkLz3u2bKgkLmMWH
 jHqS79AMmaAzv0DydixmFZu81c1P6+9zHGrs6CSiOKS4fCmtMtH5DfP1F
 Nl0MBZAPYGQ/MAXtzJVIaoTocqcPMNoo/jRCw4k2uxMCA5PYu4XFXu46B
 9NZiznNrevvPFyp32DkvFYt4/u6daI3DnBDDqBZiEPxY33s++W4sFgeo1
 Fsa+8kwb/PwsZysA4EMN8anGIu5Hue8M+GNKA8+8DUCIhowI4eI82yVIN
 szIhAqL95uXzfFJrxkORClKKRnD/9vEGo2hXVYr/s3o3nKEMfeEo4TNZ1 Q==;
X-CSE-ConnectionGUID: 6XyNyk1QSUaOryLaBPusQQ==
X-CSE-MsgGUID: extEiur/RoyYmCpW3IenEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="99440471"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="99440471"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 00:46:18 -0700
X-CSE-ConnectionGUID: lXZ4XY/URHaHpC92/58u5g==
X-CSE-MsgGUID: uoIiiasNS4iiI7EqkIFxrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="250031276"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 00:46:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 00:46:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 00:46:16 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 00:46:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLj7zlxPofQLkGxrA9/9D6I/zApyW2MJA+4FFFwjLhKD76qvy/uIJlFW74ZUq8gbCnZQcUtCxg9fwrjiDQIkjBhzpdzrdR9GQWzBQYW94uNNyQDVYUNoxOk0ERfl/Cv06Bc9ijJwvmEPGdK8Ii1Fn3oB0IZV9sHwIBRRO5koj8Vd2ZXt8xSQreaNjVSofidLCVkJuj15/xR35E+Hce5LmM58phZI0U5951k+O1ji/UIIVn+BggqwM744CW54rhM79XkFchjUV0GYrfam+CCXMy+2WGJCQDvZSaT18MCXLLT16o0qcUwvagZc4eFEsOSEntrf76WfKJZzBsVtDglPvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bkL0dDdgxlJlfz5r4kREBTHrV3OwZkFRgeYQSkj630=;
 b=AdGmYOqqAOlSqXqoB6jYz3bzO0VrfgdxagxZdXjQdnABcpV5aPMaDRmnlCxWL7Hk/abBZMjFNi7PsCWTzQJZ6fAAfrWkyxi74nGWLyOayBZZQPdmSbFknfKryCxrBHXpD/bNtWHctGDYduC/+JZOtW0oPj5k1HoeBTl71IbP/pinVgYmXQsMLObcRgpMozCyNLnjvxRWpvDD10chrvFUvahem/bOMY6kL4MgoYNu1qaZF6F8wa4EIpLEsfn+n5ZWwF45qzsuHmkXtGdFT/v4GL6aqInixA3awANQNoymjT7BK1Via9/40PHBQqo26cEtNtVA0pcOZ3eQt1Rr5h1u4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by SA2PR11MB4908.namprd11.prod.outlook.com (2603:10b6:806:112::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 07:46:14 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 07:46:14 +0000
Message-ID: <133ca30c-f662-4d09-be29-edb90382c95b@intel.com>
Date: Wed, 10 Jun 2026 13:16:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 1/2] tests/kms_color: Prepare FB creation for
 explicit YUV color range handling
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <sameer.lattannavar@intel.com>
References: <20260605064103.855630-1-pranay.samala@intel.com>
 <20260605064103.855630-2-pranay.samala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260605064103.855630-2-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::12) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|SA2PR11MB4908:EE_
X-MS-Office365-Filtering-Correlation-Id: a4c8cebb-3679-4c5b-f03e-08dec6c458ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|4143699003|11063799006|3023799007|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: xqOlIJ0Ls6re3rrUrNSmME+hz784Y1quz2evuOoUV+6JQ4O5tP49EbACna0vWp7rqaNnrWR77gStj74xh/mRGNo3mbdAbGSPXwob1Y7cu1AP0jI5CvGcsZeQM1AexalrJACX75eoXUBP8A4NduMuG8EPHOV8MU+6iwZsET0g+ShY2w6g4b/NotpV1dq5w3fk8I9Is4SnbDyzGydqNUvIgRa+PlOIo2U1kzIauzLQzgs/7wmUsTGwq+PBmfBtCNvjRzjyUsuJ8Lz5k+dJTelTiOslgTeVLesGthOJDg9kO8pETdQ9k6MYAuEO3wUA3RGPdkERmvnkWWjIEmfBztR0NyDIak9aT1XzWFkSZJw7+YuF7dyi8YzS5i6i6tbPpFA9S7YwiwvHMDbBNcbH6wmEk7VgIn0d6dZt9LRQl2U0FmEFQDEFON6KgIT7JLk3o4YqIYNZtBmxBqZESqHbYIq2Fo3UhMrHYNrNDN+BiKbGDIodczsEdbCjBXmjbtEXLf9RfXVS3ym8Cl+UkvF1mSJK79MbWV51r4jtvv4BJZN298OCa4OIK+ZQCC86URxSNJHx4dRBOwmDAyi6sVxRG7BkoPBDyoqJoPL2ihuVHroV6IdyYolzI7Sbzy96gnj7iPMm+J4r0f7KqHHmBDm3x1Qs6EM0GqaGLOcMsSL3cndWdOJ31gi5PlVc/83gk0gwQ9vt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(4143699003)(11063799006)(3023799007)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUhMK2RRMHkwajAvOFN5M2V1T0xSU0M1T0dOUDlSZTQyZExIZncyQlhlalNh?=
 =?utf-8?B?K3hVZXRPcW0yeE1XdC9LTzgzaFZ2bzdzVzZsd2tOWnhQSEIvT0ZSUWVabjRt?=
 =?utf-8?B?cGxaaG5sNHd1b2t1NGljTTdpd3lPQjRDVlFXK1NnTjVSaEVveUFsdFVGR1lr?=
 =?utf-8?B?cUNUVE15THZLYUlJc3RESnJmc2puVDhpY3poQTNYQnhLYWtic2xOOENPelQz?=
 =?utf-8?B?bHI0RFMwdVVsczVTY0t0K2VjUjVzU1VES1M1a2VzVTlpdXhQRE5uVjBub2RV?=
 =?utf-8?B?bzdFdnNIZTI4VW9QM1JkK2RzOTV2QStIbmdNaVdHVkRqcUFMdElyaVRwSFNs?=
 =?utf-8?B?ZnFMeXJtTGM4T0xaUGJMOHJtU0VYYjV3Z3N5WmJDTGhkZ1J4NXZUWHhuZEYx?=
 =?utf-8?B?N21NaEh6cDk5c1cxZG8zSFdxV1VrZG4rSGUxSURHanhTNVZXbTRWcGg5YXNF?=
 =?utf-8?B?YmM2WFluSERkeWs4UDhMNTYwZlpNZ3RiZU9zZ0MvQ0tsYlBvS3dnNWY1NCtK?=
 =?utf-8?B?ZE9OK1J2Tjg4Y3ViMDlubitQWlpzcUVCYmdKMnlFbEVEcVFRd21EeWFBaWtM?=
 =?utf-8?B?UTVaVWJNRTRRb1RHM0RwMTJmS05JYmhqbHVwOTRpT2E5RTZScHRUR0pTak1n?=
 =?utf-8?B?UTAwcjdLN3dXem83eTlLa1AyZDVPQ3JQSWlyVHgzTTJ3R05kM0piMUU4OWww?=
 =?utf-8?B?VmZVcFIzRElDcXhPWDZsT3BTUFRoNjdMdEhtOFJ3R21Ga3R5VCtlaGNidE9Z?=
 =?utf-8?B?all5SzI1TlFFRWU1VFYzTHFKMjBqaW1PWG4yNFE5d2o4aWZaOUxXRGFvVTE1?=
 =?utf-8?B?STV1czFzZk5PejhEQWtoc20zUnNadUd3MnlaZk54YkVQUGRLZGNPemxiVjYy?=
 =?utf-8?B?aTRrUEVwMFRLNG5FMkdsME96VlJKeFNwbzhBTVo1MENqcnZnL0kwaWhZc2Z1?=
 =?utf-8?B?ZUlncllOc2trL0IxS3RyVHQ1SUFWeE9oL2h2RnlqQkNaLzYzTVJoV2RhSlpp?=
 =?utf-8?B?RElKdzYxSnRxaUttcmwrWUFaOFFpazcxSmpKN0FqekQzR2I5UFhRUFFhREJX?=
 =?utf-8?B?cS9vU1RUZ2djS1NRRXRUTmhSZk1nbkh2cVhMaS80NkIrL1I5aVB1ZVhXa1VD?=
 =?utf-8?B?dGpyVGprYXRqcVFTdUVRbG85TGhZOUZ2M2xCQ25RN0FtTmx0aGxkYktNQVFI?=
 =?utf-8?B?ak9HMisvYzAvTVdwT2h4TlhhZ2pwa1c3d2orSjM4U1RTVjZjOUJMTkNBUVAz?=
 =?utf-8?B?aFo2ckkwWWpnVHk0SFEyODVwL1NuUUp2NkxTb1ZVNVV5LzVweWZyRlB1dVpJ?=
 =?utf-8?B?cG1VUVdDdWFESDRNZTVJM2hFS0JtTlA1K1BCcTBaaCt1bWY5R2hoQ2ROY3hK?=
 =?utf-8?B?ajcvOEdJMk1tM1pTd2t6WHdsWjJ2TFZWY2VBQUFpN3dTeDdRTWZpWWMzN1Az?=
 =?utf-8?B?YXFtMEdUSWk2c01FRUdjU29palhVL3ExOUwxdUd3bXVJbDg5SnRqT1BwbURp?=
 =?utf-8?B?a1B1aW9PUTdENUVIMjZoRGZtbU9MZHVNbkdvRnY4Y0hoT3N1RjJsMzljUWtn?=
 =?utf-8?B?SElteGNLMEJzUDB2cXNMRkl3QnNoUkhzV1cvU3hiQ2pOZ0xwUktnR0JGTmhT?=
 =?utf-8?B?YVNnMmQvM3hLdCtlbUdxeGg4NlUrbmJYcmgxQzY3d01EWG15cFRPRnZCSlNP?=
 =?utf-8?B?c21KMzZGSk51QXJYTG1WMVpCRkl5OURZRjNlRzVaTkVidzNiVGFaVnlCdUt3?=
 =?utf-8?B?NldnRW9ENlh6ZHNqQkFvZGdlL0l4UDg1ZTFmbzRoeUtpZHhXYUI3YzY2dWpS?=
 =?utf-8?B?QTFmNE5Kb2F3elQxaFIzYlhCRHRva1o3YzNSMS9GNlRHRVllODVxZ0IvTzZY?=
 =?utf-8?B?THRSM3FQWWpRNkliYnNzWlZNTTFxd3lTeFMxUXNPOEYxVjBHUGdYM2ZGSVZF?=
 =?utf-8?B?YjJGYjdsT1ZtOFFtb2xOUURqelRNdFVhS04vaGJVMTI1dXAxeGl5aER5NWxT?=
 =?utf-8?B?WUtaQUt4RUZWc096VmkxLzFFMGFnc05VKzBjK0luZFpCakx1M0lSb0xtMUtS?=
 =?utf-8?B?eld6UXZ4L3RRUjVuYmlvakswSUIvMXY2MDNWZGFzOHd4Z2ppN0dMcnU2Y0RU?=
 =?utf-8?B?c0R4VVdCb2hJc1JxalBvWnFORnJzUjcwdXM5Mkl0L3pYdTVmNVpmRnpROGdi?=
 =?utf-8?B?ZDVwb0dpdG1jRUpLS09vYkxZVmNidVJPbitjdVVGbVpyZllGZG5qQ0kyL3Y1?=
 =?utf-8?B?Y3pvVVNFM1Uxa25HMHl0MFY0a2RjVGhrb0JFUXdvSC9OandtRjF0aSsrNXZj?=
 =?utf-8?B?SDB5TjJvejFJb3RrZjNpb0NoTVNTWkFRUVBCSWdFYTMrQnF3MERaUT09?=
X-Exchange-RoutingPolicyChecked: QKntHcaCtmWeRTnBBVT7OZrGjmHgEwPGFhr7JE2UO0+gYIedDts3yWw2VDyd/o3EjiJeQ1Vxuo53UqAIsykwB8petG2FM7xOQUOu/HaUj005t+VIqXAvDMqQdfvFauQ0jndxrXCBF8ntkewoQgjpfN/6rO0R80+v7jprk5EVZ2IFbVHehnnQCzoFughllmFWzAznWzcvqA5eYQQyonXbUY2Xh0rfnQ3Ho2PeUzdwuLUQIHtdKIxxF/q3kJa41OMXwzBGNmIRIXjy1JrslzY8Z8LIXqWn+UCKu6p/R7OidNIsSml+DdShoDaEoi2KyP60ukeKTnbLWFeKPVEV+/oG3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c8cebb-3679-4c5b-f03e-08dec6c458ff
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 07:46:14.4885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9IKOo8s8fd9bxnDmg2FFJzNEJyj02C4psSF1Ch+zKj/VUuIH2Ydb7XaCXfdT2sFn/Ey+QUq2SwG09vFYZlbmIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4908
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

Hi Pranay

On 05-06-2026 12:11 pm, Pranay Samala wrote:
> Switch framebuffer creation from igt_create_fb() to a common path that can
> use igt_create_fb_with_bo_size() when explicit YCbCr encoding/range is needed.
>
> YUV formats may otherwise be interpreted with implicit limited-range defaults
> (16-235) instead of full range (0-255), which can make color expectations
> non-deterministic in YUV coverage.
>
> This is a preparatory cleanup and does not fix a user-visible bug.
> It refactors FB creation so YUV paths can carry explicit YCbCr parameters,
> while RGB paths continue using the default framebuffer creation behavior.
>
> v3:
> - Update commit message (Swati)
>
> v4:
> - Split the patches (Swati)
>
> v5:
> - Add a common FB helper to centralize framebuffer creation (Swati)
> - Keep RGB formats on the existing igt_create_fb() path (Swati)
> - Use explicit range/encoding only for YUV formats (Swati)
> - Update commit message (Swati)
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_color.c | 94 +++++++++++++++++------------------------------
>   1 file changed, 34 insertions(+), 60 deletions(-)
>
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 565edb2dc..f4b792fdd 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -78,6 +78,20 @@
>   
>   IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
>   
> +static unsigned int create_color_test_fb(data_t *data, int w, int h,
> +					 uint32_t format, struct igt_fb *fb)
Nit: is create_test_fb better?
> +{
> +	if (igt_format_is_yuv(format))
> +		return igt_create_fb_with_bo_size(data->drm_fd, w, h, format,
> +						  DRM_FORMAT_MOD_LINEAR,
> +						  IGT_COLOR_YCBCR_BT709,
> +						  IGT_COLOR_YCBCR_FULL_RANGE,
Should encoding and range be defined as parameters?
> +						  fb, 0, 0);
> +
> +	return igt_create_fb(data->drm_fd, w, h, format,
> +			     DRM_FORMAT_MOD_LINEAR, fb);
> +}
> +
>   static bool test_pipe_degamma(data_t *data,
>   			      igt_plane_t *primary)
>   {
> @@ -104,20 +118,12 @@ static bool test_pipe_degamma(data_t *data,
>   	igt_output_override_mode(output, mode);
>   
>   	/* Create a framebuffer at the size of the output. */
> -	fb_id = igt_create_fb(data->drm_fd,
> -			      mode->hdisplay,
> -			      mode->vdisplay,
> -			      data->drm_format,
> -			      DRM_FORMAT_MOD_LINEAR,
> -			      &fb);
> +	fb_id = create_color_test_fb(data, mode->hdisplay, mode->vdisplay,
> +				     data->drm_format, &fb);
>   	igt_assert(fb_id);
>   
> -	fb_modeset_id = igt_create_fb(data->drm_fd,
> -				      mode->hdisplay,
> -				      mode->vdisplay,
> -				      data->drm_format,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &fb_modeset);
> +	fb_modeset_id = create_color_test_fb(data, mode->hdisplay, mode->vdisplay,
> +					     data->drm_format, &fb_modeset);
>   	igt_assert(fb_modeset_id);
>   
>   	igt_plane_set_fb(primary, &fb_modeset);
> @@ -191,20 +197,12 @@ static bool test_pipe_gamma(data_t *data,
>   	igt_output_override_mode(output, mode);
>   
>   	/* Create a framebuffer at the size of the output. */
> -	fb_id = igt_create_fb(data->drm_fd,
> -			      mode->hdisplay,
> -			      mode->vdisplay,
> -			      data->drm_format,
> -			      DRM_FORMAT_MOD_LINEAR,
> -			      &fb);
> +	fb_id = create_color_test_fb(data, mode->hdisplay, mode->vdisplay,
> +				     data->drm_format, &fb);
>   	igt_assert(fb_id);
>   
> -	fb_modeset_id = igt_create_fb(data->drm_fd,
> -				      mode->hdisplay,
> -				      mode->vdisplay,
> -				      data->drm_format,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &fb_modeset);
> +	fb_modeset_id = create_color_test_fb(data, mode->hdisplay, mode->vdisplay,
> +					     data->drm_format, &fb_modeset);
>   	igt_assert(fb_modeset_id);
>   
>   	igt_plane_set_fb(primary, &fb_modeset);
> @@ -285,20 +283,12 @@ static bool test_pipe_legacy_gamma(data_t *data,
>   	igt_output_override_mode(output, mode);
>   
>   	/* Create a framebuffer at the size of the output. */
> -	fb_id = igt_create_fb(data->drm_fd,
> -			      mode->hdisplay,
> -			      mode->vdisplay,
> -			      DRM_FORMAT_XRGB8888,
> -			      DRM_FORMAT_MOD_LINEAR,
> -			      &fb);
> +	fb_id = create_color_test_fb(data, mode->hdisplay, mode->vdisplay,
> +				     DRM_FORMAT_XRGB8888, &fb);
>   	igt_assert(fb_id);
>   
> -	fb_modeset_id = igt_create_fb(data->drm_fd,
> -				      mode->hdisplay,
> -				      mode->vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &fb_modeset);
> +	fb_modeset_id = create_color_test_fb(data, mode->hdisplay, mode->vdisplay,
> +					     DRM_FORMAT_XRGB8888, &fb_modeset);
>   	igt_assert(fb_modeset_id);
>   
>   	igt_plane_set_fb(primary, &fb_modeset);
> @@ -520,20 +510,12 @@ static bool test_pipe_ctm(data_t *data,
>   	igt_output_override_mode(output, mode);
>   
>   	/* Create a framebuffer at the size of the output. */
> -	fb_id = igt_create_fb(data->drm_fd,
> -			      mode->hdisplay,
> -			      mode->vdisplay,
> -			      data->drm_format,
> -			      DRM_FORMAT_MOD_LINEAR,
> -			      &fb);
> +	fb_id = create_color_test_fb(data, mode->hdisplay, mode->vdisplay,
> +				     data->drm_format, &fb);
>   	igt_assert(fb_id);
>   
> -	fb_modeset_id = igt_create_fb(data->drm_fd,
> -				      mode->hdisplay,
> -				      mode->vdisplay,
> -				      data->drm_format,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &fb_modeset);
> +	fb_modeset_id = create_color_test_fb(data, mode->hdisplay, mode->vdisplay,
> +					     data->drm_format, &fb_modeset);
>   	igt_assert(fb_modeset_id);
>   	igt_plane_set_fb(primary, &fb_modeset);
>   
> @@ -654,20 +636,12 @@ static void test_pipe_limited_range_ctm(data_t *data,
>   		mode = igt_output_get_mode(output);
>   
>   		/* Create a framebuffer at the size of the output. */
> -		fb_id = igt_create_fb(data->drm_fd,
> -				      mode->hdisplay,
> -				      mode->vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &fb);
> +		fb_id = create_color_test_fb(data, mode->hdisplay, mode->vdisplay,
> +					     DRM_FORMAT_XRGB8888, &fb);
>   		igt_assert(fb_id);
>   
> -		fb_modeset_id = igt_create_fb(data->drm_fd,
> -					      mode->hdisplay,
> -					      mode->vdisplay,
> -					      DRM_FORMAT_XRGB8888,
> -					      DRM_FORMAT_MOD_LINEAR,
> -					      &fb_modeset);
> +		fb_modeset_id = create_color_test_fb(data, mode->hdisplay, mode->vdisplay,
> +						     DRM_FORMAT_XRGB8888, &fb_modeset);
>   		igt_assert(fb_modeset_id);
>   		igt_plane_set_fb(primary, &fb_modeset);
>   
