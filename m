Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C745CD342C
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 15:09:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B299910EDE5;
	Wed,  6 May 2026 15:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KwchCGbe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCE810E1C7
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 15:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778080181; x=1809616181;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=M26IYFrP8vrVF08J9Fwa8vsNPt5oRjXXhS2Fx6/57lU=;
 b=KwchCGbed23FrR5g0Z7heN7BQBdGv74k8GLs8Ig5++GjO5D3FW6+BJaW
 JAwTx2E1nP2uQTwF7IjhKP2zn1CumxUrMc0sMWnXjl4mZjCJDyh0dxoJT
 zGAKJ1SbjEa0wfVqgIa5huON59tgqAxeS9kgSJtwbdcp3aLUnZ5fmIa37
 F1zFJwfRurCBLj05OI3d1yBwly5YyIWdUEKxm7Xazr+kUr/Sw8o30/kNd
 /upfF1TeWhiYsoXvKjcWXlq2bd+PuAaF4JeU2V6Mb0C4mWMXuBCSnh16X
 2g2+3PQzVShGFQOrLPrst0k1WHEcjICdjnWGO93O2vft3tJ/XpBfrW/xZ A==;
X-CSE-ConnectionGUID: wWSVclX6QCSba4pWHlUckA==
X-CSE-MsgGUID: HRaA/+MtShaPaHhUKjerkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79026395"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="79026395"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 08:09:40 -0700
X-CSE-ConnectionGUID: D0x1I8o2Rn644I5iOfSsmQ==
X-CSE-MsgGUID: ed3kRP52QjOLiTKkGK/haA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="233524146"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 08:09:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 08:09:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 08:09:38 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 08:09:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3auhaQB1ZNq7E5/QEcCaEfe+5DfpbrP1e/Vu2PA/cK//3+sMiTGaKuQSvk5l5lmuu2zaFL9m82SfVdl/9dfjwx2DxrVxaddyyk5vhUw6/YgVloAWGTXJGKJWg9PfFghq5yByFseaBB4zIpjZjCgSOAIctDHmYMWgRWUA4VZnRkMHpEtr20GEOPev0rGhBZTHpY36qIpAYmRr6RGmW1XGd57kxQKqVkF1/jeO1OJMLYiRA/NfDs0WFQnU0GbUDHP1QPFwQd7znpEoW+ZhTZsVh6y4OFIoTH49EuHIkGl7UtTOaQrlbE/V+RMPn94obmZpb4vrgtvd8vAdnw7mYZMyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43bFHU+T7hdnY2CT/JMYO7lTF6SgEscd2eDUnhRtKns=;
 b=Y8jXIh/eYIimWtZa51D+PFigbeklkBAOH558TK3d59VWQRAaea+6BEjBIPYpBk+xKZUV/QD+jCjolTqTuWuR3Ex40Ea3SsZIvjVgGFBEWrV/GPfKlTlSUEOSupLIQ8ODwtpI3rpl9l4MnzmxHW4iXqMZLUfUry2Y1QCkjc3sYz4EQ+Mgv+5q2NXfuIM3xmcCiF2uaOSQkLM7qL3oDe/FFKrWLEouHJf4tGyfGGfAgIcr2U/5lfNj6Ms60AdWdVK6AXPM3MgyKZupEqfk4xPMygy0ois/nd0nrZnwLZo9m5JwjMLV384PwrCZ/s0evCZnUzsqKg0TuU0Ls/K2VczZsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA4PR11MB9107.namprd11.prod.outlook.com (2603:10b6:208:562::22)
 by PH0PR11MB5175.namprd11.prod.outlook.com (2603:10b6:510:3d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 15:09:34 +0000
Received: from IA4PR11MB9107.namprd11.prod.outlook.com
 ([fe80::6d22:9433:de57:68ee]) by IA4PR11MB9107.namprd11.prod.outlook.com
 ([fe80::6d22:9433:de57:68ee%4]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 15:09:34 +0000
Message-ID: <a57ef25f-9ed9-405b-a0ef-f7b7f356fb70@intel.com>
Date: Wed, 6 May 2026 17:09:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] core: add timestamps to logs
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Ryszard Knop <ryszard.knop@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
References: <20260505-add_timestamps_to_logs-v1-1-2d95f499fdfb@intel.com>
 <20260506142559.c6dc7hcz2bo364qx@kamilkon-DESK.igk.intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260506142559.c6dc7hcz2bo364qx@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0029.eurprd03.prod.outlook.com
 (2603:10a6:803:118::18) To IA4PR11MB9107.namprd11.prod.outlook.com
 (2603:10b6:208:562::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR11MB9107:EE_|PH0PR11MB5175:EE_
X-MS-Office365-Filtering-Correlation-Id: e429c990-2c60-49d4-71af-08deab817b46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: NHF5AldidR4o+fOfhE7avOu+Rpaqx1xnny7LZ7b/qTzUVXy1V/n/53MzGrNjvRMcl16uZb3evU3fDhJnvarH4O2300XhBRCCoazNr/VQTw7Ibzs7u0eXl7dbrsBXXaXlkjKFS5/JghMvhcNth1oXnE3gw+gmDJL1olnUE5Qu5VcY/0rWvzExcoyfDPAP9chBaiXbqVboAIgDXp71uYyUsSF6VDxQKqPlkVRd0BFK6X6dO8bjtIpnKd5vqQaBzlJj+ieI4upI8fRzZXmyTMNp0il60f1kjNeQeezCYpHwtzgQY6U9CXuF6iMVjoNoVi1yLRYyJZZdzbW0BMZQ09N5IcPAzjL3OzcJDi79tCvXdTkgLuK4AOyTZ3oyeoQsR9DVbOJjMy9WND3WwjirCqCHs/tuIe7+QZyf58VVm5R4epmp1BbSAF7tXQlwjc8MLpPPBRXSOcg+DUHJtf7q5SYVTZZ7B9TuxoZ4Y6blpFOe8EeVNQejx8wyfxgEssTpa11erRw+bZ+6jl/3tFAuJFc9B3tY4opvtJXkv9+RRxq8eCOCEjas1CP0X5mePJdUMk4SI26UW6rwKNhEVC+iTQnjEwGi6Pc0vENnsxX4OQ4PF+m54IxSefbZeJgzc3dTzv8tpy6IJljn2QW6VxYk9Y4XK+v7YxQ5sRGlzcArSv/pZc/pLSq3mtMYkZKGhZ/Ci6zW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9107.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVZ1NGdQOS92RDBNMkVZdHFxYmRhL3NDblEvaXA5dkloaXhFNW1pR0l5Zzhu?=
 =?utf-8?B?YUw3bDF3MGIzOC91Z1JIYjBPS2JxQUxtOUowQkFYTEJyZ0Z5dmRoa3hFOGRW?=
 =?utf-8?B?Nk95cXZobjFJVXA5Ny9kRjBRWXRLRERhbDFOOHpsR1E3QThOZVlhdjhsSy9Z?=
 =?utf-8?B?QzVQQVlEL0REOXpMUVJQaVBEOElvVkRoL05KWk16bmdKdHdFU0lBT3lRNUtp?=
 =?utf-8?B?M2dSK2w4dlVXQUhxZU5FSnZPRWJWWlRCTEN4ejBqajBES2lKemRCNFNoMSsx?=
 =?utf-8?B?L1JTUmRmTW4vekhOeDhuQmR6L09QRkcwQldudmZRYVVnTi91N21COUI2V200?=
 =?utf-8?B?Z1RDbXRMSVlacWh5M0YxWlNWMERNY01JUlgzT1UzN0lEbHd0Y3I0ZmtBd3BY?=
 =?utf-8?B?cytERHhOMy8wcGtKNkZBb05yRk9VWkhWYlVhbDRsSlp0UlMxN2ZNY3VjWVU0?=
 =?utf-8?B?V2QwV0c3TXE2Uk9WNEE5S2FWWFFYeU5MZEhocGRHUkJVRmc5Mk5JWi9KUHlH?=
 =?utf-8?B?Yjh3ZCtYTkZBS0o1c1lKdXVldDlNejJmMy9STlpYZ2lLWE82RmlQUjFZMS9P?=
 =?utf-8?B?MUNZUkNyK0xSSloxeDhBbjYzdWNFUERqNVdvQXV4YmZERllRaG5LKytjOWJO?=
 =?utf-8?B?T0hKaW1remFpa0RIeXJpekJobDVlbGhQMDMzemZyOEMxU0RUeUxXMU5lckIw?=
 =?utf-8?B?U3g5WUkzMDhWdkR1OUhVZThETUFHR05LdnVEUjRueVBzSHlMdE0weHIyQlpU?=
 =?utf-8?B?cjhMZnBSK3NhdTRtSlQvNEpLV3NwN0FvcGNReTd1VlFVaWE2TW54dWhCRGVY?=
 =?utf-8?B?Mlk1SUxibXZheDNUdHZXbWcycStEMFA4Z0duSXBRazNiVTBxNzdUb1NETjlm?=
 =?utf-8?B?ZURQczZya1FWakgzQTBRbXd0TjlSdmZvWG9qdTdwTkJmZEtDZWNKcTl1M1Fk?=
 =?utf-8?B?cVNxTXhESThJbkwrUi9YL2RJZ1VleDBLMzF3aEw1b0twNUFXUkFNa2R0VjAy?=
 =?utf-8?B?L3lPYnlZNUs0N0lUbmo5STBjSVZQT0liTVpDdVNCTnQ3SjEydWZhOVNFQWhq?=
 =?utf-8?B?TVJGYVA0Z0JoTGZxZXNXc3c1R3Flamh4bEliR1lqSmt5THdIT2VUU0JnQWZY?=
 =?utf-8?B?dTVXLzRQQ29ZOWRFc3dRY2tudURYcUU0MW5VU3p2b3I3YVFhNVFGNzlXNVlU?=
 =?utf-8?B?cTdlNng4MFhOT2ZvZ0I0anFyWjBCbHRmSXNlbkJLVzMzS3hteTFYVkJ3TzJu?=
 =?utf-8?B?YUpzSU1iejFJNGhmRDZncFNpcUJBOW9UUzViMDhJNisxNWlrSG9Ra2FZTVZi?=
 =?utf-8?B?NXBCeSs5Tm5KNS9EYmNMWWxSMEpVQTQxSklMNnZLUXNHQVZ5M3h5dnpobGVi?=
 =?utf-8?B?OWl4dVdjRTBGSTVqUmtJS2dyVm1IdlllQzJuNGdOektNNlZpejRSS3Y2dmZr?=
 =?utf-8?B?dkVBVjB3S3BzY01hTUZjdENETHBOaXlvdGVxclJsTnlpTTkrR3c4SE9vMXp3?=
 =?utf-8?B?ZDgzZkpWL3ZsNmNtY0JVc2d1d0hNbVUzcDBpOGJPcUNkTFQzRXBMNWgvZjJO?=
 =?utf-8?B?UjVUTW14NmNya2tsZU81Q3NyMHAxbTg1QmtZaVJJdjlTeXRxcS9nUFVVUFB0?=
 =?utf-8?B?TXRUejRjdC9leFpiamtaeVhCSkJCdkpLenhDZHIyZWg0eVh5WVkveXo1WWM2?=
 =?utf-8?B?Ry9rS1hZcFBRVlhJZzJyYnFrSUprRlh0Zm1lTE9PSjJkdUJZQWZMQ0tHaDd0?=
 =?utf-8?B?S3pQd3ZnWExRWGVxQk8zSHExTGpoajhKYzU5MWNwUWVCNS9ZQmxyUFovVnZZ?=
 =?utf-8?B?aG9EVUNMVmlZVVhRTEpacDhiRjRKbXVqRUYzY1hkQUhPeWh4QWdEazBRdDdJ?=
 =?utf-8?B?MFpIODJxRlYrVnlLWXRRdlY0blpzb3VIcFZrRjcvcWRQbWVNUDlIdEcwRlNw?=
 =?utf-8?B?bWEvY3ZMbUdMOUIvVFQ3eHpLMThEVS9EUjZ0SEF5Z0VpMmpJU2ozejlFdG9M?=
 =?utf-8?B?R2VhR1RsTjl2Z3lHSVBsL0FJTEF4UnNwUE1ZZk9CVDVmWEVUcXlxcEgzeEsx?=
 =?utf-8?B?REJOWmExeXhzakpRYiswbFlqR3BMVStTYkxTSTd4YUY0KzZkMW1YNWxyOFAy?=
 =?utf-8?B?Y2J0YmU5QWdUVUJXcnVDZThRcGRJeURoY2I0dTR2R3U3YUU3TmhvVmtwNVpm?=
 =?utf-8?B?V0hoMDdzMlF3MXBTckprNDVvdUpQSEJUTUg0blJpcjBHZS82a2t0bkYveTJh?=
 =?utf-8?B?RHJMQUthenlzaHlQNEc1L0ZINWVRR2VYbEJldUtCZFZjT3dSYjBxcWdFcmJB?=
 =?utf-8?B?RjFGb3NYd2NYdWlaNzFuWnNUZ0JPUmFFU2pUODJDSndZdVptU0lYUT09?=
X-Exchange-RoutingPolicyChecked: BApTvKh0Bg5EvsHHaOrEfSqKNqmEtuYomhMlcCMKegUnfCETLva2mnKnsFdjCr3Y2T8pSHH1HY/HhSWJzi7wNpXgts5455SfbtraD33RrCw2X2fsVmTkQqOucctpwWcsRGg8K0af9GVhZRCQOZXgtjbgL+RHYrw3Dpoyx4V1kDKUKNXNiIjdOcrt/5TJByREUBeR6iImaIUkfdkz+gPCd9EN58D2kv/Vqkgcju4oJ12HFwU8Ll8cXPCUvAp7ADur2tYRmJn5HqKlZgigtTcCc/TDaFn8BNHLAM/wiWbAn3dYDLI7M98MSbNzT8SAb3WBNhsOSHxN75BSBFBxLNx+mg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e429c990-2c60-49d4-71af-08deab817b46
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 15:09:34.1806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4qdwmIdAIKPhsj9ADzTBv23/ZCy2IIv+Is6Hqmitob0olaQh+3xCVjTejdlx90w0Uby7imG4LvBn5dnOrAFow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5175
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

W dniu 6.05.2026 o 16:25, Kamil Konieczny pisze:
> Hi Andrzej,
> On 2026-05-05 at 16:46:27 +0200, Andrzej Hajda wrote:
> 
> please use longer prefix, also these changes only debug logs,
> so imho better subject:
> 
> [PATCH] lib/igt_core: add timestamps to error logs

OK

> 
> See for example results here:
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15100/shard-lnl-2/igt@core_auth@many-magics.html
> 
>> IGT tests run often time consuming tasks. Timestamps should simplify
>> time analysis and matching with kernel logs.
>> Since IGT is closely connected with the kernel let's use the same format.
>>
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> ---
>>   lib/igt_core.c | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/lib/igt_core.c b/lib/igt_core.c
>> index 4f79c02948ab..e11b181e7a82 100644
>> --- a/lib/igt_core.c
>> +++ b/lib/igt_core.c
>> @@ -3227,10 +3227,15 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
>>   		formatted_line = strdup(line);
>>   		if (!formatted_line)
>>   			goto out;
>> -	} else if (asprintf(&formatted_line, "(%s:%d) %s%s%s%s: %s", program_name,
>> -		     getpid(), thread_id, (domain) ? domain : "", (domain) ? "-" : "",
>> -		     igt_log_level_str[level], line) == -1) {
>> -		goto out;
>> +	} else {
>> +		struct timespec ts;
>> +
>> +		igt_gettime(&ts);
>> +		if (asprintf(&formatted_line, "[%5ld.%06ld] (%s:%d) %s%s%s%s: %s", (long)ts.tv_sec,
> 
> Can you align it to igt_runner format? It is %ld.%06ld
> see grep 6ld runner/*.c

OK. Looks better.

Regards
Andrzej

> 
> Regards,
> Kamil
> 
>> +			     ts.tv_nsec / 1000, program_name, getpid(), thread_id,
>> +			     (domain) ? domain : "", (domain) ? "-" : "", igt_log_level_str[level],
>> +			     line) == -1)
>> +			goto out;
>>   	}
>>   
>>   	if (line[strlen(line) - 1] == '\n')
>>
>> ---
>> base-commit: 8eb6e58f00d39b3bb79ffc501eb020b36c8f8c31
>> change-id: 20260430-add_timestamps_to_logs-d84fdfd7ef4c
>>
>> Best regards,
>> --
>> Andrzej Hajda <andrzej.hajda@intel.com>
>>

