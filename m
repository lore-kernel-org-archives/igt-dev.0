Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CE5CAC5AC
	for <igt-dev@archiver.kernel.org>; Fri, 26 Sep 2025 04:32:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896B310E15A;
	Fri, 26 Sep 2025 04:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OMc93rE+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353B310E15A
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Sep 2025 04:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758861141; x=1790397141;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=yhNksaFNPbR1My3oLXInsE6WgUy+ngIdnVuIRqReQW0=;
 b=OMc93rE+OEZ3uox7E4GZsqze0KMCWI/peUB9UWbHVNEaetd3y4PMMWrq
 d9Jse8m2wOLPcNVRqyBIYfAhQyaxskM1QWmG7kpppCeNWq5P2wrRoaTdn
 AayDXLIKWp0mXArTD94cf7fF2XubKWjpHjC9rzYstiLPc0V0u7yxRxWB1
 OPksBgiVk3hAEDVD9a3wKQhyqtz1sdwAJONU5ex1+EkYWQiHbG82Ae3BY
 WZxhOHMH1OyMwMRMk9NdQCd1Z15izJs1t8y2/b/cuIN5IyosehY4U+iTr
 gRRzO+n6pXDb5yLPlrfsvfTPHz/EkbqGxLlpg3kFnqDay297ba/J9NV4+ w==;
X-CSE-ConnectionGUID: s/F5D4ROQWe0skJ78m4Z3Q==
X-CSE-MsgGUID: XJ5Lb0iXS8yGUNM85tsAOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72622061"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="72622061"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 21:32:21 -0700
X-CSE-ConnectionGUID: DnHMyDp8RF2hkyhRM06fNQ==
X-CSE-MsgGUID: 9HQND7OMRue8S31R9XyO/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="177349107"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 21:32:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 21:32:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 21:32:19 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 21:32:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMeELnEMi81OQfNngdTdNOjVPA1mBW47XISho7rCYqZBPckyv3mc3NO1gPOblKeL0da5ubSObdKg88JlcRPW4Nnhz69sqRVUVN6HcZOuxsqErp7s3bGua221V5lR1UiCvE7ClltAj2HxTnSvPSogSMo9duZz0WQBpfoIbwjS4iB930HnCNafN3FVupXsCY7oSZcKxeG8lIUwTxE/iZWXjHpJBmu/uqeLf3sB0xneUE/fHiQoyYKKNWp9FIhQN2RYarhr9RMOQz1GPU7BQyUCVXRl9RZ+n0koddU4XJalsGi0UT/PPkCXAXslyPL5eXlcKZjJg0NUj9A3em2gCogxgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QB2WJAuYQhoDZ0LSb1tviWwzIYfOZ0NSGjg83ko35yo=;
 b=u+kkXmr/vu2z/ZoW7DijIpurN96wniHg6MNAEIzGCHAtjpELdDi2v80pETY99dE3aX/f9oKzoqe24FIslXPSltM9Z8G/DGdUEE+fYsBMfP5++ixs3yzeiTTiqzUhnS9ffXBBu49ERPLWox8MU7i0AEXY5864R5RHpcEmRdD63zbVzfpFaq2tLjZSgwfmtra5oWhNXGp8/zchlHTs+PbkYMiQR79jdQ1brRY+dXodjnTDnggxov5xGgJpTjs2I1DnnlPFnb/g14S34N4ZmHHTHVUZJ0+QlDReUPz6W0GnOQzqmsksngI8Z3hwbF732g2PcnBPEAxvQsCcA3QySYlNVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SN7PR11MB7568.namprd11.prod.outlook.com (2603:10b6:806:34e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Fri, 26 Sep
 2025 04:32:11 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 04:32:11 +0000
Message-ID: <70f31c21-4915-43bb-8e99-0539a87da95e@intel.com>
Date: Fri, 26 Sep 2025 10:02:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/kms_setmode: Fix clone mode mismatch by
 preferring eDP mode
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250922044249.1374338-1-jeevan.b@intel.com>
 <20250922044249.1374338-3-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250922044249.1374338-3-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::20) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SN7PR11MB7568:EE_
X-MS-Office365-Filtering-Correlation-Id: a6c5d47c-ef27-4c43-1b65-08ddfcb5a885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alhBRVdKTGtpaVFyamJDT1RPWEtGZmlUaTlzck0rU3ljVE9pS2RZNHF2RE9S?=
 =?utf-8?B?VzVBRkh6emVJazV6SWw1Mkh5N3BzZEl0SmVld3g2UFV4Tmh6cXNPRWlraG50?=
 =?utf-8?B?QTh1S3RzdzRCajZaUklyKzd3eGE1RnhubHB1V1NOMUd2am1zNUdEcE1keklk?=
 =?utf-8?B?OGQzb1JFcjlyTDgzN1JlUGVNR1h1U0h6K0xocDJhd1NTNng5bHBNd1l3RE9v?=
 =?utf-8?B?blpZc1RWcnRBcmMxU0VHNGQvSHNNWmxqRVNMUlMwYkhpd2RnYlVUaGhRRGpJ?=
 =?utf-8?B?d2tOUVdYYUZRY25DYWpYb2h1TWYzSmZBT2lpZHhpYjJxNk1ab1JMRW11OUI0?=
 =?utf-8?B?MkEyY2xSVnVWNTcyYmpxcFEwbTFDbWs5Y1drTW1qVndKWnd1cVYvaENtR2Yy?=
 =?utf-8?B?cWhjUFA0TTQyUmtxN3hJa3FTOVFWOVFzdzdIdUZneFNqUVM3TFk1VE5wcll2?=
 =?utf-8?B?WVlGbjM0Y01Bam0xSHBTZDFKN04ydmRRY05tRS9JSGlrWmwzRjBsQ01RYXN2?=
 =?utf-8?B?eFVHR1F3R1JxSkVPaldJeXFYY21xVVBUV1c4dEx4THIwSW5TSDRhTWV2UDZM?=
 =?utf-8?B?QlZTeElBcU44dVg4bjNnelkrUWRHdjJYbHY3UE5yakxEOVh6MERQY1pwb2ZL?=
 =?utf-8?B?VHo4U3FQcWhZcE1YaFdLS2lLVXdpWDRacEl1RStuTTc3NEo4Y3JhdHlldU9M?=
 =?utf-8?B?aUVPajRlSXpxeUxhTXA0QkFUekpzUy9PUzFhVTVkeE5ycXJtMFZOUGJJS0cx?=
 =?utf-8?B?elVEWlRjZ0s4VENZaVJTOHhoL3JsQVBQOWJYZk5EOEdGZjRsMkhteTdvU0ov?=
 =?utf-8?B?MXdFSGxjZ0xmTmcveW5kMkY5RWwrRHdlay9Ja1pBN1ZsYmxXdlpWMFBlbkZy?=
 =?utf-8?B?b1RTMGFiSWtqWXI0VUJvOEt4WUlvcmlreEVsUnZMd0p1eC9tOEZWMU9xMnlE?=
 =?utf-8?B?OUwwcm1ON2xQLzZ1Ynk4RU1DZWhxTDJGczhiZkNCMUI1T1pXUEF1cElvY1ZO?=
 =?utf-8?B?YmJTbHZ1R0toeUdRWXYvWm5FczBqUERWczR3bGlBd3BSVFhrejY1UE5BWW8v?=
 =?utf-8?B?VGpNMXVrMlZUdzlUd1drblZjMTQwaTBEdkYzRnN1RVYycWhSV3NSRFcraVM1?=
 =?utf-8?B?TE5NS0Y3cVZrYndERExHNnBocFlSR3BWTzZWbHROTk9UNVhCUEJiMW1uSHI5?=
 =?utf-8?B?QmIzWjVrOUFQVDhJaTFGM3NyaFVYb3JrVmRNK3gwS2R2M1FUeC8zSDFpMTV6?=
 =?utf-8?B?TUZLeXFrR2NTSDVHSDJpTE1SNWMyUFZVUGVNYlladnorNnRvZjd2b09yb2tw?=
 =?utf-8?B?RU56Z2J0QlBTb0V5ZmVwT25BU25HS2FMUjNSRW9qbSsrM3NBVG5rODduZG1W?=
 =?utf-8?B?OXdhRzdKRmx3N1pVcS9QR2JVS2RreXlkVU81Qk1obzhpYVUwS2lQaFYxOGJK?=
 =?utf-8?B?RVIvWVFjU0xabFNVR1IvekRpTitReXdJOGhNUWlmbGlaaE81cFdyUzZ4cTcy?=
 =?utf-8?B?K3FESTV4ZU5OV0pCbDc1VEJVTjZGZWRjWGJNUVdmbzI5WEc1cFVoc1dORDZa?=
 =?utf-8?B?Mjdpa2VvNVZ5LzdoT3pOcEZwYUIrNzdpUnFnenMxTkdSUk9TeUdleVJBRk02?=
 =?utf-8?B?Z05hblViMVpvQ25GekU3TG5WbzI2ZG4venR0R3hMdWNOem5KY3lzN1MyR2My?=
 =?utf-8?B?VWtXZmN0aVFRak5KZWZwTHp2ZnRYbUtVOHpyUlVTSHZuVXJGT0dlWVk2aEQ0?=
 =?utf-8?B?MVBvNDZtUTV4d3FYYjd5TUVSQ29BYUVTZjRzc2dNQzVTL1JCNG0zSjhMZ0ZR?=
 =?utf-8?Q?Mt/EEAzIYj1BdkKJWso6g6iOGjfZwwxrFA+wI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVR0b1hzejVwNFg1b1BONW52ZnNMViswazZSeHJDc25yNFY3eW5DUy94WkRX?=
 =?utf-8?B?T1o1QlBQR3FTa094UDVJRmFxczZpZjQ0Q21iTE5SU1Bmd05nTkRscXptQ2VI?=
 =?utf-8?B?MEtSTGdwTzh6TFRneUw5dU5GUzlQYWFaSlk4OHRUWFlrd3ZKTnREeEVkMDFy?=
 =?utf-8?B?VWFQNGlzWnczLzMvdTVtODRXSng0WlJ0dDJScEVZbS9GbDEwK0hKS2MzVmdP?=
 =?utf-8?B?TElwUnRncmhLRlBLY1BlaUlZMDdoNEkvTXd5WUx2S0kxSjRrOEFxaENsOHh3?=
 =?utf-8?B?RjdVaXUwVjVCN2hERndSQmFyK3hPMWZRUDVzdTdKaEFnejBzWFRGMzBqZ1ZR?=
 =?utf-8?B?Mks0dW93eUszbVkwRmRVYnV1YXkreC9kWXdQQzN2YThiRFZHaXVkektHYzBV?=
 =?utf-8?B?UERkTFNvM2tCN3hMUmhUUXdKYlZ3cUNpZW1hK0I2aklWMGYzc0tBUUtUemZz?=
 =?utf-8?B?N2FwOVpZcVJsV3E0SEhIUUxCWHlQM0dnWjBHUHlEQUNQNkx1U1p6dXU2cjEv?=
 =?utf-8?B?bDFPbWdydDg0N2FHdGFLK09tZzZ5UVlXSDJ1RHlMU09Xa1FvS2lJV2haS1p5?=
 =?utf-8?B?U1AyWUtJYnVXbXdlQ3Y5OFhFK0VPWTVCSHFMYldZYWRpdENFdmpFYWg5NHda?=
 =?utf-8?B?dVhMYXM3L0dpN2h3dDZRQnVkeG8wVHk0S0ZHbmhxVTZ2ZkxiZU93bWFTVytS?=
 =?utf-8?B?WVV1WHZ4Qk1yYkVpUW5pY0lDcG81dEUvUHNic0N6YXhRSUxVaXNxdFFXbm5P?=
 =?utf-8?B?cDg1eTQrOW52NDBOWklueEYyVGVNMlRGcjJkOVpaWUZhQlRwTUVsMlhvZys3?=
 =?utf-8?B?YkptVHhSbGhRRTVnRVM1eVhCY1NoajVxdTFkWksxWktVcmFMNWVnaUZDb3U4?=
 =?utf-8?B?ZnNTT2dPdnM2V3d0aStoV1lzbmJyNGZPemZOZDV6QkxreTYyVlF4cmZQbDZR?=
 =?utf-8?B?N1o4aGxVY0loY0xFNjBPNmlmblo2cmRsRm03TXRVN29ScDhGQkdKTWRSNk5O?=
 =?utf-8?B?UE95dEVkSlBSb1pzcVk4MWticUpSNHl3bjBFNWN5aTlIVGdDeFBQbWx2Mkxw?=
 =?utf-8?B?WUFYYW1tTE12MlZvU2EvRG90YUpFamNsYjdob0Jla0xuMWs3TGRHbkVGYmU2?=
 =?utf-8?B?YlZ3Z1RhcDdrWTFhNGkxRUZZSzBhS2l3bUtFNWVENkZYQll5bzUrZkJ0Nk8r?=
 =?utf-8?B?ZndWY1REUVJSWldINXhQT3lEdVM3VTF0dlM3SGZKRlJZQ2Rtd3RheUk1Vmx4?=
 =?utf-8?B?SDRPMHlZZDh1SSs5cmRacXpaWm9wTlJkUU45RE16bGpGZThpZjdhVXJSanBX?=
 =?utf-8?B?eU0vbzd6eUxJYWM0bjQvQUxlY0VMN21DeXh1dGhybU1JS3hyYWw2YXlUZndl?=
 =?utf-8?B?UDh4MlJCZGlJcVpnMmhvVVZHQTY3Y2pOUi9hd3N5NDBlNGZTWnFsZWI0bm91?=
 =?utf-8?B?ZktRc3QvTC94QW1HM0k2VXJXeGxCZUFaLzF1eEF0c2hlSmNRRnNSaHRUaE0v?=
 =?utf-8?B?Vm0zK2E1b28yUDgxaFQrYkcwb1paTVh2N2ZXcHlnN0NHTzlDSlFoWHlGUXpq?=
 =?utf-8?B?eU0vUWo4dUtvWUR3akdrdk4vMjRWNWk1azNGMUpqZTQ3L2hZbXFKZmhBRDlQ?=
 =?utf-8?B?aFRHem93OXdlTTYrdURPYk9XTFNLZWpFS09xaS8wOXptbWJQU2RraElBcDNi?=
 =?utf-8?B?N0RTT29DZDFMZ1lxMjFwREpIaHl0em1uOFluYTkxOHZYL0Mwbmh0UWtGT204?=
 =?utf-8?B?YkxtVytJeGdob25OUFdxaUwyWFVSUUg1SURKS0NicFdaYk5uZ080RjVHR050?=
 =?utf-8?B?dndtQWY4dHhKeXpWUE9PMi9tcGZRaEFKMkNsajB0R3kwT2RNQTIyZkxCOExL?=
 =?utf-8?B?WDdtZGFlYjIxNnR2Y3ZlaXN6VXNmNEorY3hrQWE3NmFUMEdiS21MUWVGdFJC?=
 =?utf-8?B?cGkzbHNMeUFKRE9xTW1uS2lsS0k4UThaVDUvQ0RqbTIvdkVYSWhZbkJDTHVK?=
 =?utf-8?B?L09xcVk5NTVsZ3Y4cFNMdzRuNmY4REgra3ZmcXFJaWtPWWFLa2x4dHByMi9a?=
 =?utf-8?B?RXpoWDQ1U3pTTlhid1Y5b0YxTnFjL1ZkTjJLWS91NUdOV1Y5eFlpMno0Y2hO?=
 =?utf-8?Q?gAdeObDRvrbVbheQNbDud6Evn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c5d47c-ef27-4c43-1b65-08ddfcb5a885
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 04:32:10.9753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HIZfE8BmCJl//4z33jKUEgmg6Zyi/Rzl/gF3jYVX4QK/42lBp93AqNhah3pkCHbx9zDkhbxPJdlTC358kQ6eoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7568
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

Hi Jeevan,

On 9/22/2025 10:12 AM, Jeevan B wrote:
> If an eDP connector is present, prefer selecting its lowest clock mode for
> cloning. Some eDP panels support only high refresh rate (HRR) modes,
> which may not match modes supported by external displays. To avoid invalid
> clone configurations and test failures, we choose the lowest clock mode
> from the eDP connector when available.
>
> v2: Fix logic for eDP fallback.
> v3: Fix comment to say ‘lowest clock mode selected’ instead of
>      ‘default mode’.
> v4: Update commit message.
>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13780
> Signed-off-by: Jeevan B <jeevan.b@intel.com>

I tried this out with the failing config as this is not present on 
premerge and test is passing as expected.

Tested-by: Karthik B S <karthik.b.s@intel.com>

Patch LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> ---
>   tests/kms_setmode.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 48d0c3e1e..135918007 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -256,6 +256,25 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
>   		}
>   	}
>   
> +	/* If an eDP connector is present, iterate through its modes and
> +	 * pick a mode with lowest clock, since internal panels typically
> +	 * dictate the clone mode and may have HRR support, making them
> +	 * incompatible with modes supported by external displays.
> +	 */
> +	for (i = 0; i < crtc->connector_count; i++) {
> +		drmModeConnector *conn = crtc->cconfs[i].connector;
> +
> +		if (conn->connector_type == DRM_MODE_CONNECTOR_eDP) {
> +			mode = &conn->modes[0];
> +			for (int j = 1; j < conn->count_modes; j++) {
> +				if (conn->modes[j].clock < mode->clock)
> +					mode = &conn->modes[j];
> +			}
> +			*mode_ret = *mode;
> +			return;
> +		}
> +	}
> +
>   	/*
>   	 * If none is found then just pick the default mode from all connectors
>   	 * with the smallest clock, hope the other connectors can support it by
