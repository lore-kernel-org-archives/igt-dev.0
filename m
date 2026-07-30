Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF32C54FDF
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jul 2026 09:37:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F7210EE77;
	Thu, 30 Jul 2026 09:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VqEuC9Z3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AE910EE34
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jul 2026 09:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785404217; x=1816940217;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=H3QDri3kAX6cOZeAjYMlZTTZ97y4vCySIZQ0JitoqC8=;
 b=VqEuC9Z3JeVrUUHekwqHyuzrymBOcdGm38/72wXJ3clmgBHWDnEVZx2h
 Pv0oxJYyDVRx8ZeOs1zsKdDiRKMnkJ30zyzqWU5Npq8VdQh8Aw4YvcwBM
 9QeBBSy2cAydWnYLxmW7KaOqS9VD6Z9+7eKzN1TUqNu/h05A9EJuwEvm6
 9uxhf8QSX0WXAu20ENmLfeBa5RIs5vkcz+y0c2JF898pGu24Ys4yX8+B+
 Vnh5bmo/wdrumIyzru36YQUB4BJbH5WUO+gyGBwIa2JomtLKErnUQkYE6
 YPYF2h8xzMy5wcAJ2ByWLg1rqS14gz5m3xAX6PQR5BEW0R3Y+sMsaR966 Q==;
X-CSE-ConnectionGUID: vnEknAWsQT23k3F4csdyGQ==
X-CSE-MsgGUID: JO1txAj6TGKUiGvsxybwCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85145654"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208,217";a="85145654"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 02:36:56 -0700
X-CSE-ConnectionGUID: B8O49+CaSIC4OmNj5x4PCw==
X-CSE-MsgGUID: 1DM05ZqnRZqHWnlscl06Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
 d="scan'208,217";a="259015421"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 02:36:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 02:36:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 02:36:55 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 02:36:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wucsrfWNTPBKemlAP+sgvNtyw8ulIzu+8uLS5S07mlxl9orD0MZnQaPjnxqOZzWMa2Nmz0HlXZc5u4MwvrO/r65fWGGDVFHu34UKaQFq9uHt2XQ9dLxQ2Kuu3nfKIL/kt2RrcOxJDD+8+M5s3r2k5kLi4P3YRYxxprHckeKlbpQXfkzG0MPo5pcljJqcezfsdiKAiZB6awS2bR05+VZIF1v6ereVvCNSLOl/2wrl4PSe91ilGa786rnIlR6mCH1OULgsT/+ncxV9eLflZAiX/bdt6v6BiSdvBQyL0PqwgLpMttVLPFmeBNqbx2YQTB9QfY1juAOPf+AClVTL3sagEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBF0SRUCLuJ7/vMZqcaFyPgsJooi7H3o7Uo4J0VRf3Q=;
 b=knZFxm/mtlPpT91XYGjb56+eQv4+FyF19Jgxm/cbprIwLH98m6OaK900ns3JydADD1sNIC9mQlQ0DkYo7YTKCbu9zk6vxgBK7Yo9oEysniVZZnlJwNDEOGoj876RopqprfW+niBH2qXoAYT8nmq5mGw8nt9t/2f+deoNahlqSjp2pmWhNTHYxBN1Em7cXruQzWtLRWx3HQdjFhXAlMILYddLNmWVYAbX7ZJGU83XyoOs2SzC8mQdYp3q593wUNJ6hokyLJ4xn1twWswZ+pcd1EhdVcivZ36lrccWaIrR1p8VC7JwiIVbnggYqtOb169WpUSYztOtdxIEBYdGzHAZHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4926.namprd11.prod.outlook.com (2603:10b6:a03:2d7::16)
 by IA1PR11MB8222.namprd11.prod.outlook.com (2603:10b6:208:44e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 09:36:47 +0000
Received: from SJ0PR11MB4926.namprd11.prod.outlook.com
 ([fe80::50b8:e73:5783:b611]) by SJ0PR11MB4926.namprd11.prod.outlook.com
 ([fe80::50b8:e73:5783:b611%5]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 09:36:47 +0000
Content-Type: multipart/alternative;
 boundary="------------4qYbZ5suAMEPbjcksMzaDXt0"
Message-ID: <80e90da0-8d9d-477e-9e22-28072180bddd@intel.com>
Date: Thu, 30 Jul 2026 15:06:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 10/16] tests/kms_vblank: limit #outputs tested
 during suspend
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260713085515.463575-1-michal.grzelak@intel.com>
 <20260713085515.463575-11-michal.grzelak@intel.com>
Content-Language: en-GB
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260713085515.463575-11-michal.grzelak@intel.com>
X-ClientProxiedBy: MA0PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::9) To PH0PR11MB4920.namprd11.prod.outlook.com
 (2603:10b6:510:41::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4926:EE_|IA1PR11MB8222:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e47f470-4ab0-4f52-b1a3-08deee1e12e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|3023799007|8096899003|56012099006|10067099003|4143699003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: qhvZMDA4r6xCQkkEFKZtWP2/ZrJc4XIF2FHZ61b3dLhMD7GPJcqaaGmSp11SYiX6mW3GwaaeZmq6YjM0Fqqm5xFssbae46z9nbeAdT2u1C8b/izDPPf5KMoHex4+VwaA4Y0/jyKopvwQQhgfuIfdQqi2zUkLB0GBQiMc+ofuBA1fRH79ar7nKmU/xqK0Dzv90V+DShcIw9LoCos0lQ1JJsHJxeakTM5lsVKr3kSh/weK9OQdk2eMz9U6+LVTFKULchGZ+Py6h/lxosWAoO1fNZW44l91CqrZYWQinm6Szm22/wCrqQBgeiMix8wNrv4BjfWDgcci1VwW06PEk5FF9msexm8VHgPKa6f41JzhGe1SkC2+MevXSa9Q/fUGdX3VAIUTR+p0douetHK76NpjjsROwztGROHB3rUzEuutDg5oQVbPcFzsQqhq2fFejCx3h/05RQXbluOXvvuGZLW6aXBXZWykb7oUnvVoEVr7+KBGrJR0NV3NdR0J+QA/jpOGOWzSowqBWknsAKYBu1qdnNatZShEuMSht68gemsOM5nb7Edli5iu3PHTJBy8bmkVQojgCgUhr96htnuc5MxiuD0sZ+C7gcvBeQYqZvlP23Ih2jTtldCxqxQW9exPvuFAQN9EMQaSAUn7XOmV1teVB3w3vURIiZnHAejcDGuQKOo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4926.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(3023799007)(8096899003)(56012099006)(10067099003)(4143699003)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2ZSUDZTczY0TWxXRFVyMzE4SDlWMzB2bTJrMUJ0L0tSbC8vWlRnVVM0Ny8x?=
 =?utf-8?B?VTRjVXhmNWw5YVZmdWZCbEpqcHdxeXR2RlVNTTdPVGg3S0FFMEZHekdaYXdF?=
 =?utf-8?B?Q281amlDcUVISEloSkNyWEVjTmh1TDg1WVRpY2RCc1kxeXNZbHJ0cmxyOGRk?=
 =?utf-8?B?WmowbEYwbVRaVnlPN05qdm56NTMwVlp6cTMvNlBodmtpeldZYzlxZk9tN2hV?=
 =?utf-8?B?L1ZwVTJySk5SSmQxYlluVzRkazk0QUJJdUMvMnhQditMOVl0dW1WSkkreUdD?=
 =?utf-8?B?UTl6WVhtcEk5bjZjZ3h4ZXFhSWxWKzQ5cDJSQzZkWkNaMEVCU3BZVGJpZWxM?=
 =?utf-8?B?eWdIaEhUMFBZMWlPeHpFTkJMUU5pc1YvWWlYc2djRDFaM2cxNE5tVHpTaWpx?=
 =?utf-8?B?Z2J3QUZhVGNUcDU2dkIrYTRER05oRGQzV2RwU1Bsb1h4SDdONjRkVUEyRTBw?=
 =?utf-8?B?OU9xM1lBbGdXcE1NM0tMVFBldytjUjJacE9TMnEveWQzdmNubEtDMXhPU1lO?=
 =?utf-8?B?VzRBL01ISVFTK3c5cHBjRW5zZ0ZiaEMxaFpqajZvQlpqTXVLUXVIalYzM0dj?=
 =?utf-8?B?MEFtajRRSTBpZ3ZtaDk4UkUrZHFkRWlVaTR5cmo5cGl3YTN6d1lGQ0lrTm9T?=
 =?utf-8?B?MHB3L3lIcjExV0JWcDFqTDRTcjlaak9xQzRwMkZGTmJabzEwNWxEbUpzVXFE?=
 =?utf-8?B?cUkwajBiUjBFSGY4YlZjdlFxRzZzamxsT05pSC9UWGNIZzZ1K0w3NFZJZWs2?=
 =?utf-8?B?SjY5anpzL245K2M2M2V5UjliWExUV1UrTVRvcGI5Z1BXeHY5NDVXYXJZL1lN?=
 =?utf-8?B?c1Vsd0VRWXRVbVRZT1JKcEdaVkFuaDJqdlJua01LOWpBdFpVSG9la05uK25Y?=
 =?utf-8?B?eUt3MkFnWml2VjFObWtmbjEzMDlVRkZhN2FDdVN0NzBMb2ZjakZXTlhoZDly?=
 =?utf-8?B?VDkrQXVoajBsaUVSVE5OVnM1MGpLUzNyWDdpN1N4NG56d3NSSGhvbnc0dWZy?=
 =?utf-8?B?OWN6ZE41TkJmZ1dVR0x2Z2hJbFl5SzBzdmhNS3g5Q2k4ekc3ZHh6NjZDQUF1?=
 =?utf-8?B?cWVPaTcwc3AwYytRd0dlblF2dWpCVW02ZGc5RzkyM2kvSlhXb0RHT2JQZlpM?=
 =?utf-8?B?RG9wa3V4RnBNYlNBWFJZaDJnazhSVmRuaDhZcEQwWWR2TGcvcWtiaFg3Vzg4?=
 =?utf-8?B?dC9GQmZNQzdmeWZDVXlOR0ZZRFluVHRwcURZZkFsaUs3SGJvWGJreEwyeWxj?=
 =?utf-8?B?YVpFUkJ6anJqK3lneVdSZVdzQ1RxQWZySng0TjFSNXNWbGc5NjJzc2J1REhR?=
 =?utf-8?B?ZWJVWUQyL0tSRi80N2MrRlJVa05VU3JLTWFDenF4cDMzRWFlTTNVRGMwN1N1?=
 =?utf-8?B?VXE1KzdhMk9EV1ovaWlrNElXZHRmbkVtRmJXcFM1WjRab0xZWkRldStBYWdm?=
 =?utf-8?B?ZnRoWG9NUUJ5THhpaE5WdmlYaFpBeEFudjlFK0VCN2NCYzZRVlQzcTlFWnVn?=
 =?utf-8?B?eStUTlZ2ODh0emNjK3NhOFFTK1dWUUREWVdwUlVObk0rRnRkeVJleXhmbHQx?=
 =?utf-8?B?MWU3QThYU0trNUNSZEZuUElxRXR4V2RnbjRQWlVyT1FGa3c4LzRtQzhLSW1T?=
 =?utf-8?B?MXJNV3RleDgrSHU2dzRXOFlnU093R1NQN3NtU0dyMmgrK1VuWkdSOElVK1R6?=
 =?utf-8?B?cERDZVlBUzRQTERielk5cWwxL3M5TjNVakpaQ0lCODEvaDF1dFZ1bW9GNXFJ?=
 =?utf-8?B?Z0xQRFBEa3dsYWg0UnBaTnRubk90ZFZ3T2VJekhOczdCM1ovKzc2cnhLMHRM?=
 =?utf-8?B?MUgvRW9DUTZlSmxrQUg5M25wa0tnVHhJcjRFelJWSGFaWjNlMm83ai90MWx0?=
 =?utf-8?B?a2gxczl6ZExpRDl3RDkvQkZ2bmZyVFN3cnZNSkFuSmV3ejd6TFYvcGE2aHA4?=
 =?utf-8?B?UnZReVYzMDA5T1V5UlkwL3RJam9iVjJDZHlIdUlYaUZUa05pT3hqb2FyWVNR?=
 =?utf-8?B?UndYZDEyV0VnNUsvZDRmNFFhZG40bGhoT2VYVjlRcGcyOXBVRyt6RVpWclQ2?=
 =?utf-8?B?OEt2QTgyTlhKZUJ6Rld0Z0FKUER6Vmkxalp5VllBcWh6WG9RZWppUHJLUmRy?=
 =?utf-8?B?YnlIYXgwZExCMGgrMUZXcmxuUnRTWVpvdHgvMXQ2S0xPcGtBNjdUNVpYOWc4?=
 =?utf-8?B?cXFMNzZRaFhjbS9qMzdvV2JTTnBNVTRBY3Y2a09qV1B0T0NSY3RVeXFYdjZJ?=
 =?utf-8?B?dmh6ejVubFNhUVJFNGxBRHVJUDhsUFc1ejhRUnhhNy9UUE1lOTlubHZFYmk4?=
 =?utf-8?B?bHpPT2VkZE4yYkIrRVpobWgzeFdwVnZIbjlXdE5GbEtkdk0wS1lnMTNBTEJm?=
 =?utf-8?Q?jB3+newGwp/8U0to=3D?=
X-Exchange-RoutingPolicyChecked: XzFrXITyFrIrdRM2NKu3+mJ/GaByskymn5TBjGupT31fZ66CEhtNjGG2Zn8h2dEQM9f0dOS4s8KA8Irc/uj5Qid1kNyT93xFhBfXLXQMy5UGKqmKKqwG9VBWuTBH1NHeZ8nDzyeYuA/PXzSWSbfM35A0BKkhEhvp0xoJSzAVqGFWRw2dj4wqJX1hgvWekThOnezNpUaHMpnmjSvciSACUty2eEF9/ntO5ZIS6JHDZCZZonNtHc0X+KKXKUAzBoHAoEptqEimmzOJ4jrvskzLYp5CGK5ddMdZ7J2jeoGehnaAR/ygQH5w6uohFHrDWP2s84Y+KQbqSis5Rhfsxj9RlA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e47f470-4ab0-4f52-b1a3-08deee1e12e9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 09:36:47.3002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqX8XspQycSgr9PqZu8DcuRV380kSiBIPyr+AFRa10+CRXXnDf/hOlH+SF8pyylAQ6xuFMZtYgS/K74yXAG50qyJdbzOepK5oqErnxtKlz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8222
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

--------------4qYbZ5suAMEPbjcksMzaDXt0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 13-07-2026 02:25 pm, Michał Grzelak wrote:
> We are iterating through each output while testing suspend. This results
> in extended execution time. In turn this leads to hitting CI enforced
> timeout.
>
> By default limit number of tested outputs to 2. Test each connected
> output when passing command-line parameter.
>
> Signed-off-by: Michał Grzelak<michal.grzelak@intel.com>
> ---
>   tests/kms_vblank.c | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index 47b733af15..7ad23da355 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -109,7 +109,10 @@ typedef struct {
>   #define RPM	0x80
>   } data_t;
>   
> +#define OUTPUT_LIMIT 2
> +
>   static bool all_pipes;
> +static bool all_outputs;
>   static int active_crtcs[IGT_MAX_PIPES];
>   static uint32_t last_crtc_index;
>   
> @@ -476,6 +479,7 @@ static void vblank_ts_cont(data_t *data, int fd, int nchildren)
>   static void run_subtests(data_t *data)
>   {
>   	igt_crtc_t *crtc;
> +	int output_count = 0;
-->Initialised once entire function but never reset b/t subtests, IMO 
reset at start of subtest would be better?
>   	const struct {
>   		const char *name;
>   		void (*func)(data_t *, int, int);
> @@ -516,6 +520,11 @@ static void run_subtests(data_t *data)
>   			igt_describe("Check if test run while hanging by introducing NOHANG flag.");
>   			igt_subtest_with_dynamic_f("%s-%s", f->name, m->name) {
>   				for_each_connected_output(&data->display, data->output) {
> +					if (!all_outputs && (m->flags & SUSPEND) && output_count > OUTPUT_LIMIT) {
-->Hear as well : output_count >= OUTPUT_LIMIT , to limit only two 
outputs..
> +						igt_info("Skipping output %s\n", data->output->name);
> +						continue;
> +					}
> +
>   					for_each_crtc(&data->display, crtc) {
>   						if(!igt_crtc_connector_valid(crtc, data->output))
>   							continue;
> @@ -538,6 +547,8 @@ static void run_subtests(data_t *data)
>   							run_test(data, f->func);
>   						}
>   					}
> +
> +					output_count++;
>   				}
>   			}
>   
> @@ -628,6 +639,9 @@ static int opt_handler(int opt, int opt_index, void *data)
>   		case 'e':
>   			all_pipes = true;
>   			break;
> +		case 'o':
> +			all_outputs = true;
> +			break;
>   		default:
>   			return IGT_OPT_HANDLER_ERROR;
>   	}
> @@ -636,9 +650,10 @@ static int opt_handler(int opt, int opt_index, void *data)
>   }
>   
>   const char *help_str =
> -	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n";
> +	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n"
> +	"  -o \tRun on all outputs. (By default subtests will run on three outputs)\n";
>   
> -int igt_main_args("e", NULL, help_str, opt_handler, NULL)
> +int igt_main_args("eo", NULL, help_str, opt_handler, NULL)
>   {
>   	igt_crtc_t *crtc;
>   	int fd;
--------------4qYbZ5suAMEPbjcksMzaDXt0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 13-07-2026 02:25 pm, Michał Grzelak
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260713085515.463575-11-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">We are iterating through each output while testing suspend. This results
in extended execution time. In turn this leads to hitting CI enforced
timeout.

By default limit number of tested outputs to 2. Test each connected
output when passing command-line parameter.

Signed-off-by: Michał Grzelak <a class="moz-txt-link-rfc2396E" href="mailto:michal.grzelak@intel.com">&lt;michal.grzelak@intel.com&gt;</a>
---
 tests/kms_vblank.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 47b733af15..7ad23da355 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -109,7 +109,10 @@ typedef struct {
 #define RPM	0x80
 } data_t;
 
+#define OUTPUT_LIMIT 2
+
 static bool all_pipes;
+static bool all_outputs;
 static int active_crtcs[IGT_MAX_PIPES];
 static uint32_t last_crtc_index;
 
@@ -476,6 +479,7 @@ static void vblank_ts_cont(data_t *data, int fd, int nchildren)
 static void run_subtests(data_t *data)
 {
 	igt_crtc_t *crtc;
+	int output_count = 0;</pre>
    </blockquote>
    --&gt;Initialised once entire function but never reset b/t subtests,
    IMO reset at start of subtest would be better?
    <blockquote type="cite" cite="mid:20260713085515.463575-11-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	const struct {
 		const char *name;
 		void (*func)(data_t *, int, int);
@@ -516,6 +520,11 @@ static void run_subtests(data_t *data)
 			igt_describe(&quot;Check if test run while hanging by introducing NOHANG flag.&quot;);
 			igt_subtest_with_dynamic_f(&quot;%s-%s&quot;, f-&gt;name, m-&gt;name) {
 				for_each_connected_output(&amp;data-&gt;display, data-&gt;output) {
+					if (!all_outputs &amp;&amp; (m-&gt;flags &amp; SUSPEND) &amp;&amp; output_count &gt; OUTPUT_LIMIT) {</pre>
    </blockquote>
    --&gt;Hear as well :&nbsp;<span style="white-space: pre-wrap">output_count &gt;= OUTPUT_LIMIT , to limit only two outputs..</span>
    <blockquote type="cite" cite="mid:20260713085515.463575-11-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
+						igt_info(&quot;Skipping output %s\n&quot;, data-&gt;output-&gt;name);
+						continue;
+					}
+
 					for_each_crtc(&amp;data-&gt;display, crtc) {
 						if(!igt_crtc_connector_valid(crtc, data-&gt;output))
 							continue;
@@ -538,6 +547,8 @@ static void run_subtests(data_t *data)
 							run_test(data, f-&gt;func);
 						}
 					}
+
+					output_count++;
 				}
 			}
 
@@ -628,6 +639,9 @@ static int opt_handler(int opt, int opt_index, void *data)
 		case 'e':
 			all_pipes = true;
 			break;
+		case 'o':
+			all_outputs = true;
+			break;
 		default:
 			return IGT_OPT_HANDLER_ERROR;
 	}
@@ -636,9 +650,10 @@ static int opt_handler(int opt, int opt_index, void *data)
 }
 
 const char *help_str =
-	&quot;  -e \tRun on all pipes. (By default subtests will run on two pipes)\n&quot;;
+	&quot;  -e \tRun on all pipes. (By default subtests will run on two pipes)\n&quot;
+	&quot;  -o \tRun on all outputs. (By default subtests will run on three outputs)\n&quot;;
 
-int igt_main_args(&quot;e&quot;, NULL, help_str, opt_handler, NULL)
+int igt_main_args(&quot;eo&quot;, NULL, help_str, opt_handler, NULL)
 {
 	igt_crtc_t *crtc;
 	int fd;
</pre>
    </blockquote>
  </body>
</html>

--------------4qYbZ5suAMEPbjcksMzaDXt0--
