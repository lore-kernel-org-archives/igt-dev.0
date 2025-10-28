Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76301CCF9E0
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 09:35:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1559C10E378;
	Tue, 28 Oct 2025 09:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f0RTwAtt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A04710E378
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 09:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761644136; x=1793180136;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p+oln26lbAbDOxV6HlZVIbTMShiAiV2i9aDaGFFjyd0=;
 b=f0RTwAttOMpPuoYrzwy+E24Aha7xvzjvtSOEqQuUqhBkv4VnTaFXLQ8t
 743PguD/mRs6v2KlkBpYf4D5cOpIS/OgXt4iOeQtlfvNwDWYfrrJgghh4
 orNxyk3tu0dZdsNP1rRu9Cz/95ILGZUawHj+648nnHSBWFO7XsumWTOwQ
 f/w9TeeT3aBt1KCWp9zZ9LxzUCWdPOCUR8gjEGhzKqee1NNiL/UMQI4Ag
 iA/5SlJGwMx/0+PYBqnzZp/GAagNGmZSL5+6a3Rs4FS/yALPkgbxZOCFb
 5GXt45XluPo8txsGycL23C4dmAa6SUVljyu+nmhiZ8Z+7BELrNEteq1BN A==;
X-CSE-ConnectionGUID: Luity1jaTiKenF5QWhN1YA==
X-CSE-MsgGUID: hzbE4IfDSL+3OyNpfPAPXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74339916"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="74339916"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 02:35:36 -0700
X-CSE-ConnectionGUID: LL6KtHnjQJawW/m7lu2bZQ==
X-CSE-MsgGUID: pkRfQ7DaRbuVXljxJVhxeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="208896656"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 02:35:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 02:35:35 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 02:35:35 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.11)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 02:35:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jcn8oxL2qO1ZYmRnlL8Gxfc+6YnmljLLv58aZB7Vp+bvzKO5B7T2MFI3YLZGp+9A7a6ymCFcip+U+M31plBpCr2UVibQlBQF0Ji328yvBo9KCW2dtEB78BBN379xMsIkJxQpmCax+4RZdICXma5pdw59YOuym4ANEaoojmvmujKvibYptvmKBdirMsD/jLY8JUZvzia+a7B2XHAXyXOGN5js0BiDjJfG4NMxq5xRraQZghAU5MlOxwFTTIYZmERR+Te5TB3h5Uzyg8u96iWzJGoma3EgNw2TgM34mMQekahqUUpFPe7VzzFcNQrdTM0ZvUuq9dadQgHRFSJZoJWM1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNwz95Geq/2BvHvkl/EQwpIOVlr4xl1MWhLLIS7hEMY=;
 b=dhmKKmkrvZnida/4pYPaUCXV9+4w35Y++CrLLMJiBeot249EkeEGV4J070bEC8SW7kPkAUku3AtWcX+UYie+lmZsfkHzKD5ZxBDPJ9R1x5bZgfZYmFmYMfE1wtd0OC8iuazfBS+XMUEa8K4OqFRQQ78ffh5thq2Liywop59YXhuBWIqKNq8pAk+gFctiMEXvVY6YIQgEmSx+reX2sAAYGRL+d92B4SD3vG7djCcBW41d6rlMHNa7BWwVrjDKygCXK91zW/5RvJrpEvx8bKFpdcKH5qBF3U5AUarM9rDr38AI409Y/bVPzxY+RLwLRIS3ACjx6tgsuEwoc4N2pl682g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 09:35:32 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 09:35:32 +0000
Message-ID: <2d4eaf92-e1ac-4503-902c-0f8b86758aa6@intel.com>
Date: Tue, 28 Oct 2025 15:05:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] intel-ci: Update PTL display blocklist
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <jouni.hogander@intel.com>, <vinod.govindapillai@intel.com>,
 <swati2.sharma@intel.com>
References: <20251028055607.735698-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251028055607.735698-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0158.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::6) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CH0PR11MB8189:EE_
X-MS-Office365-Filtering-Correlation-Id: 14da0032-050a-4721-336b-08de160556cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|42112799006|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0lJUXpTQnNxeGZZd1BKMlRla01ZRDdpVWhJNkJXYzdPUys1YngrRXMzdml2?=
 =?utf-8?B?WjFmTVpEZEdVQklHY05MZUpOdi83M3VNOGY0eXMyUVVXdTE0dGJmSjFVMFZv?=
 =?utf-8?B?eDVNUENqR1BkSmJnSE9mWjRmTWJEQW9kRFd5STZWS0kyckp1Ull4VEh0RVhL?=
 =?utf-8?B?R2wxemhpZWoxTDJIdkpMVXhGMVN6SFFLRXdzM0ZScmpVdWxxd25mcCs0WFUr?=
 =?utf-8?B?RVVnUVptZ3YwbmdxdllqekpLSWkvbElZV21COWFlMDJ6NlNnc3VGanBnL2ha?=
 =?utf-8?B?ZHM0U04xeG9WMHI0WXE5b0FwR1F5bldzSEZ5bndtRWgrNDJPczB2cXdWQW9S?=
 =?utf-8?B?WVdORVVyNkFDRG56ZzcwTHdDTzlQR0UvM3Faa09BQzllcGJGS1ZxQ24xSE5a?=
 =?utf-8?B?MkI1Qzh5bDYvQmVWTFBjYW04WXAxalpVMUU1ZTZKL0ZabjB3VHc0c1ViOWg3?=
 =?utf-8?B?cFUza0UzTUtxbTU2NFhGdDlraUZLa2dmbTNHbkNncFBqdkQrUUtpcWhVeUVn?=
 =?utf-8?B?eDQzaGlScFBlcHlsN3NuSmhKZUJUR2w5N3ZQTU5CaFJPdWJPaVNpN1dWV0gr?=
 =?utf-8?B?cjlmeldQbStMNFdTRGNsOGYrU3pvNzNBaUF2YVg3clJLbS96V014MUxmV3VV?=
 =?utf-8?B?bTRQQkFlSmV1SG5DeTZld0NLNGxzdFE0ZytETWcyYWdZN0wycHBTSjh2S2VU?=
 =?utf-8?B?WjhZV3MyTHdOYnBwT1VoMUVWNG15TkZ2UUZURmEwSFp5TkxmekN1S1hDRldX?=
 =?utf-8?B?Y3gzOFJ0aTBuU0MvYXdraGhqaEdwZXFpTXdCTDRZdGp4eG8rZEJ1YU1laTF2?=
 =?utf-8?B?bzJIeGFjaE1qMmNrNVI1Q00yb3Z5UlFtYTk2NEg2MUp1bHBhQ0thcVRhYmNn?=
 =?utf-8?B?RGEvSHVXNDk5QUFFYW50d1lkbjlCYzBGS0c3cWIzTjFMYWRxK25ROTlGZ1l0?=
 =?utf-8?B?TUJoTmZyck95LzNDSXlhMnFRR2pVa0lmL3AvT0h4cDM0dXFJb3Y4YWVqZ2gw?=
 =?utf-8?B?dHgrZXlYOWV5QnhseEM3YktsRDZwSVU2UWNFQWZGejFkbmhZQjJzK3J2ZU55?=
 =?utf-8?B?U1hublJIT3dSc3FheTZUQm9BUDUrYjk1TUhCcW9pNEo2by9Udm1jV2hBVFhI?=
 =?utf-8?B?aDBRR29kRzBvc0pXWkRqYmdkYXZ0UVc0elBrYUIxdUkwMktrSStxSlZlQUtF?=
 =?utf-8?B?TlVUWWV2a3JraFM3N0hyUlVFakFvTnBPemxETklZeWVZWTFhN0JYT2pwTVFi?=
 =?utf-8?B?bUpheWE0NXBnMWZPTTc3OHA3RDNiK1ZjVGt3bU5CK2h0eDJMM1BCWFhFVlg5?=
 =?utf-8?B?QXpScGowSGdtOW02dCtIbWZCcDVReTJ5MmVyeDlqSHhsWmd0YUx0VFVDRkNz?=
 =?utf-8?B?Qmg3MFpRUnAzZjVGQ08vdWhCOHFxaTlFQnhKT1JqcUYyUEJVSms3WnRTekhy?=
 =?utf-8?B?NlUxSU5SQ0tkS3BCSXlZa1NrcE5kYktRYnVBSmQ1M3JZT2hDUGZJU1RLRXBq?=
 =?utf-8?B?OElHSWZoQ210NytyQzRuVzg1MC9mVHlvaldxcTZvUzN3ZXBRbGFSQ1BxczUy?=
 =?utf-8?B?WGs3Qnd1U0QxY2V0eGFxME9vSVNJWjZjY1JveEk5cEdhSVhmRi96Z2RpUkwy?=
 =?utf-8?B?SW50MUUrT0RMVkM4ellCQ2d3TVVQaFZkRTBsWk9UMjdlNzN5eDdLRmx0bFRv?=
 =?utf-8?B?V2xrdFNnQ1RPMytUckJBcXQxcGJqOWw2T3d6N3FpV1Z2WC8vUVpvZ1lUR25F?=
 =?utf-8?B?QmYySTdSZSs5OG1Ga0RCZFI4eVBNbVY4K0FKbzZRamxmZ1lYRUpIYzliWXZI?=
 =?utf-8?B?eURzSkcyV3pHWE8yVDhyWHhJc2x0cTlWNVp0NzArZEh2UStwUS9WZDFyTk1U?=
 =?utf-8?B?aUFoSTltUUl6TitWVTVIdTdRelkvUklwYURoN1k3UGJrNFFRZ21LY256cUJJ?=
 =?utf-8?Q?B71NIPPkkv6UVz7452/hm2wxaGzl5H1l?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjAvbWZJTS9iYi8wYXd4ZERiUFNaMzVEUHlTenN1YXIvaG1QZGdlUkhYUTlF?=
 =?utf-8?B?NW8xZzFJRVVqNUhoTkllWStBb3pLL2hNeGU1ZnFxY3FVSC9pQ01RTzF3c2RF?=
 =?utf-8?B?NHNrMWtoUGlUOHh2cmRmcWNkbUVVQTY5WUY1VS9hdUIvTU96QnFQTHB5Q21j?=
 =?utf-8?B?TmF4eXVOYlFGS0tZSUNsZjE1Q1ZjVTk0YVE3elRKcE1sK1N6YmJnaU5jQWFH?=
 =?utf-8?B?dVRpUVR2d2ZadG9HdUdCU2pSRVQ4ZGdNREFCdWU5MGYwWktZcDQ4Wk9tRnZw?=
 =?utf-8?B?MHRnZG5Vb09pcG1GZGtQaWFhcGlkNUM1bFA1OFI0NDlVcFNmLzZmNVRjUVpy?=
 =?utf-8?B?K2dLVXNSc25qUHYyZnp4OXV3NTUrRE0xVDVhM0t6MEo3ZWVwNytlVHIyMXlN?=
 =?utf-8?B?TFdwK2o4WWE5ckFnenQrMGNyemVkZ0NRUmp6L2N1dnh5cUdnTW90Q3pjRmky?=
 =?utf-8?B?VXpmTHdrRmZvaFhwNU43WWFIRzg4TTIxQUVYT1NRRWhXeXZ5cHFTVmQ1dzJ3?=
 =?utf-8?B?QkJhMlhUaUhzV0FVWXVveWJmTE1ja1RHZ2loejdiKzM5MEdKUlNiVzlDcDFI?=
 =?utf-8?B?V0tsL3N1WHQvNUtHd1hmODFQQnVoN0lmeWVlMmVLZ0lyVk5pRjRvT2RQb3ZW?=
 =?utf-8?B?Ull6SkhLSGN3b3VzOXJjZlhwK2lyeG9sT2ZFYW5UditkU3JLMTFPNmFNaXBY?=
 =?utf-8?B?eXZIaUNsUy93aEMrcWR5clp0VzQ1ZnRnVEpxd2luWWVCV1dINE12SC9kR2RM?=
 =?utf-8?B?b2E2WTJUK1lOQ05mckZMb0ZOdWt4eUF1VGQ0bXA0UFdvUkRwSXpTZjdlOEFr?=
 =?utf-8?B?TkUvdWsyUkN0dTVtR0oyMkhOaVo4cjQ3QlMxTm9mYXNwYjhMOThnMUtGQlRM?=
 =?utf-8?B?RC9mOXdmWlB2alRPWmlYRGoyZEJ4NUgvZWNZSHZDNnY4blE5Y2RsTWRWNzZy?=
 =?utf-8?B?ZzRzdFU4MVNiYURYVm5UN0dpRTFwbGpoRGFEUFFtdURDNkRMcjNValo3Y3hK?=
 =?utf-8?B?UlhJOTBCVDlzVThsT2VRUDNQMkNvNHlrd1Q5Qm1ZYjdiVncwUXAwVE91cVYx?=
 =?utf-8?B?VG1uaG9NcW9rU2hndGs1R3JjRmpPcDA4NzBGbWZqaDhwRmJISGdNUkZ3Nm9E?=
 =?utf-8?B?UkVvQUZEUFVEbVlmeUdrazY2OU5MSExwVERCY3JZM01ETyswQ2JVTVlHWUJZ?=
 =?utf-8?B?RGEzUjJhdzFUSWMyZ1BFS2FCeCtIV2xGRmVDMXp0SlRsZjRwNllJd3R4U2Uv?=
 =?utf-8?B?ZGFBR09HQnlFVlQxOGg2YWNVT3JOSE5zNnNiVnNrYWMxcGx5b3RwanFnY1V6?=
 =?utf-8?B?REhIeEw5MmZRN1hEWi9nblpvWmp4bHZiVlJHeTJvVC9YUmcxMnNGZTdlcEw5?=
 =?utf-8?B?MlZ2eTNSbmtiZGpvNEVKc0hXd2VSTFZFcnlHUE8yaGNsaDB5TGFmZ3FvOUNJ?=
 =?utf-8?B?dTNMZk55djhSWHJVdWlKN2NlVDNqazV5MzlvVG1aNkNZZGZ3T1lMTTBXWDZ0?=
 =?utf-8?B?M0dSdHlJeVVjMnVRVll5czFoeERiNmRzRDZzMlRUVDZKeDBka2d6M2ZWejNC?=
 =?utf-8?B?cEZ3bWlsUXJyTDZEcEt2MHhYK2ZxdC9nYkZKVWxLMnVXMTdQb2NranRROS9H?=
 =?utf-8?B?RWdQTUdZZVM4ZXdwTlZpcXBlcTgyakxRV3lDMlVJMTliVEFQcWZIU1NqV3J1?=
 =?utf-8?B?VWlBSXBQdlhWc1hIa1lnSTNwVktNQTFxcmtkRnpRcXlNVkR3UkZ6TVZTSFZx?=
 =?utf-8?B?YVM3TDRkWlVEYWxydkFiRzdHVk02b1lZaEZ1Q2xNY0s2OGtuS0dtbEptL0tX?=
 =?utf-8?B?QW5va3pqK0k1anI2RXQ4aktQVGRzblJhQjErTEVzMERPMENsUmVCamJzYjky?=
 =?utf-8?B?Yi9ZS2pPNGV2bWl3Q3h3RGcwbVZMMWtoM1pxQ3ArdkdDamd0Z3dGODB2ci9M?=
 =?utf-8?B?dmlxVFNyazMvV1IxZU93MEFiN3AvMzZnRDZDbDhQSFArajNvTmY3VXQ1L042?=
 =?utf-8?B?bzlMSlZlN2J6aEFrT2VXS2M1aE5vTndwbGQvVktqaGZ2L2ZTU0t1S0IyaW5U?=
 =?utf-8?B?VzEwWW1XZXd0L2NoT2RWc2E5bFRUYll1aUNPSTlRU1h6SzBQeDFuQnB0K05S?=
 =?utf-8?Q?GrVd5LpW8WsRkbu2rnfWA/zEa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14da0032-050a-4721-336b-08de160556cc
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 09:35:32.3808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Ho98WZ9a7RgwKzWzxBnpslGc6m12APP2Zeg2lrFtb3GIQGfQYTJkHr08WyPtLAYX9M2N10C4D3bu7wT/I7pDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8189
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

Hi Santhosh,

On 10/28/2025 11:26 AM, Santhosh Reddy Guddati wrote:
> Remove fbc tests, update psr tests from display blocklist.

Could you please update the commit message to make it clear. So FBC+PSR2 
is the only invalid case?

Also could you please update the LNL blocklist also in this patch as it 
should be the same as PTL.

>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/intel-ci/xe.ptl.display.blocklist.txt | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
> index 4c3803235..549de5f55 100644
> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
> @@ -155,10 +155,8 @@ igt@kms_bw@.*4-displays.*
>   ##############################################################################
>   # Expected skip on PTL, FBC + PSR is unsupported

Please update this as well.

Regards,
Karthik.B.S
>   ##############################################################################
> -igt@kms_front_buffer_tracking@fbcpsr-.*
> -igt@kms_psr@fbc-(psr|psr2|pr)-.*
> +igt@kms_psr@fbc-psr2-.*
>   igt@kms_psr2_sf@fbc-(psr2|pr)-.*
> -igt@kms_front_buffer_tracking@plane-fbc-rte
>   ##############################################################################
>   # Expected skip on PTL, UJ not supported
>   ##############################################################################
