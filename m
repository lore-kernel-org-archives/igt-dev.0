Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE214C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 20:59:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E94810F92B;
	Fri,  3 Jul 2026 20:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O/QWHll7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1BA10F926
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 20:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783112321; x=1814648321;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TUaFvqquxSTrRjpFFFO82GQdGSoJUAiICVn/RqZi9M0=;
 b=O/QWHll7G2TU+kw8Hjew1a79RRFXoKYKeTpOi0glQCo0AZimgBBWhFof
 OV9xIfzHZlSQBy+4LJ1HsZsh7SLs05K5z/EyPgnxBlpJfrXit5/ItWY6m
 de51SX5fxNUN8VYx6Jpjmx1tgshh4yxOSadSPD2lDQ40StBiF03l/fq6R
 VEeihPy/9KgTsoxWmoA1EpvLAdzteGK2OaZlJD77ZVfN2ay/2ilP8c1c+
 4K56vuZiV11F6KHmgDGSKav4P+/hSiIoZElIXCXgnUlnT2BMYe/sLqdu+
 CtiFwBAFfmhEk4VpwXmGQnDtyC61HyfIEskarpQfiO+Q26rdlmRqAMX7D g==;
X-CSE-ConnectionGUID: +wceNGlNTZ6zXMeya0YHPA==
X-CSE-MsgGUID: NP6M5iwiRJmmHP0KWDGonA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="82966569"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="82966569"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 13:58:40 -0700
X-CSE-ConnectionGUID: Lbaryz5yRkC8n8ew+3GTXw==
X-CSE-MsgGUID: vukS/umHTCmf0l/vuqDfyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="246811916"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 13:58:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 13:58:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 13:58:40 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 13:58:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hucIpi4RYss7l6fIokWjdFFRQckFsb3jKLkI7HPAUv8XmWT/VOE8ZNCgunSi1xvrKkYpsZzrF7do0vGlrcqzTTACX+y11W+g9MgmMUr8RDpiS898Dh/hfPRx3AaaKTCftKA6Agk20VenG6Us88lsYHTdaUwXsak3Hav8oskaWqdhupF0NMGVeqTACW6wMBFCcTCyVUrBWTxFe/V/KUIo6f0YwmULMvnw2FToe1F/ZXkkf1+JR3n8PsL0xCesqk+dIh5+nNRRpYlinGPwWqkzunisw8PQr2mkrgZRdwu40GbD9gQT2ze0w4tcsdXOnploE+ZOyD1yGnKhAcj9wWHmPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G17+G0WOXau3+IwnywNGiZi3vLjTldWh/GCwBXFjdhM=;
 b=MsPm252DHAgFvmTLmFtsiYGKvAcdGup1DPQlyxpp75MexAUVn86aIJ4D6NN4hTuVNwJmbpPm+1CAKOuFjpXF/iUTvN9ZZr72PwQ9vOiSyqaCRNl550oCa+UbItYKPKH0TFw72hftc9qmiicauwOJwlykDmjxvtt9iMEu+F8ZrsMaoO6r4uKEF9U2aCi5XAPc5PRRctK1PIj8o3Nr4ggvm+v4jdm/TUaHeLlaGUR4vOCGW+gBxZjJEsWcLLyuRjSskFLrMvj6egQGj7UsFXDPq8a98SO8jB9E1IUuUqKFgt+TL2eIvkuCF3F0+Yfgi6g8OIllkuXIiFXgOZVkKT0AAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 20:58:37 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 20:58:37 +0000
Date: Fri, 3 Jul 2026 22:58:32 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 09/31] lib/igt_halffloat: introduce static
 sub-library for tools
Message-ID: <454kzj36ibbkaigyc35ryvbtn3opxpdc6peyr2qbqxvvwgghz3@23y2dmrltq7y>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <86f7e4fd4af5c051405e0a82a1ee41b478444da7.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <86f7e4fd4af5c051405e0a82a1ee41b478444da7.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DB9PR06CA0023.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::28) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|PH8PR11MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: d8e1793f-63bd-4896-dbee-08ded945da6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|23010399003|376014|18002099003|22082099003|11063799006|4143699003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: J2IusQzRFzTCG5x1F1y02Qe2rAqGzhp1kA+rRBNsZMBhUTTMWLK9BYlzXKQ9Itb/BvDJhOq+snB7AjC1EXDGlDvkscOXsa7y8NQ/TUGqAgTa6F2W6RmkA/flIgI5d03ub/TivAtA5xMBABSeBDFOP8EiyuxZYQv7asnUHS+ucMwyEwP4Xn+denIjVlyNiHEt+yw7c3J0xvqsJwmfWnahIx5K/cJ3kVAv0753NbNmQaijB1pT/bS2eRpA8GYNIS04I8Zn3XvXyQn8tOkOLorNYDlYKmny2ceBiaqtMMOOm0rgVnwgGqDKQ9hEq1X3wgX2pBR3aXLhcl0wsCEHYNdVaXwRGcxHkGjNn1fVu+NHkIh1lT1VrmMsrMC1M0mQIcTSEPFC2zdlnQMCCB92G7QiWAAGI27LQHwH+QNPKjGn3+QTX9AaJobck+6UkUe2kmwIO6nWuM09+fejbZ9gxHvXCTWUgL4anAPv5bZZit6MeExF1recGi9hz7UEa9RgwG1ud4u1WSSmZuTeZy05BQJFrHjhbtY75Qbig/SW90VHZmhRsCEcOc23aZvdPPXeffUFzDzwuAINc7ltxACB0/46fNqO7McL98N9g18gfo6UdROSM4HxTxJiuVKUAJkNkRv97JkqjOT7/Wx4qLBECRzYnutQqx0xspbdtTCHISXHd+s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE5NL09xaUxDSlZwMzd1UHV3azhFdmVJNjlQLzNhTUhYN0QwZTlVQXdDcWM0?=
 =?utf-8?B?SXpPbEZRK0NKY1gzYXFtQk5hcGNjQTYvOG5mbWxPb3FFWFE3Z1lCbkt4dGVi?=
 =?utf-8?B?T2h2VGMwWUl4NTQ5ZVY1RjlKOU5pb1JMUnpyZGwyVm1wUklUYUJhTU1aaVF3?=
 =?utf-8?B?Ulg3SHFXNWtuOVQ5djlFd2JuTHZQbEhxK0FLZGZYTWh6N2lEZGtHTmNNMGln?=
 =?utf-8?B?QjZGUFZsTXVvUytJRytCam5VZnZaY1FKdXFmUGtZaHdYMXlGcHVWZUw1MGlT?=
 =?utf-8?B?L1JQNXZxK2dKTmlzQ3NramhiZW13TVVxZjhPUUJhanZqbXByUGYwL043NmlN?=
 =?utf-8?B?c3QrYWp6UUtvOG05bTM5QllWZlFGMlNwT25QcVlsdHZZYy9IRHE5L0hQeVFl?=
 =?utf-8?B?bVZ3QUJkWm5iOFRLMTRyckREeEkwcFVRN3VuclFZWFpMdzZyakYrK3hValB0?=
 =?utf-8?B?VEJsTWh3ZWx1dzNaS0tYMzF2NzdacjVUTW1jV3ZCWURmaVREYVhTdlJRbkZE?=
 =?utf-8?B?SWFuTEtDcll5blkrWm1xdHZLVGhSRjJKdDhDQ016Z09rUUYzcDhKdVZ5NHBn?=
 =?utf-8?B?M2VEZEhocTVNTzdtZ0Q3NEJmNmsvL21DYTNwSWQzRzZld1NpY21TeG5jemN4?=
 =?utf-8?B?NkNIRWlMVElzVjR3QjlxbzN0ZFZZdktZUzJtSCtzY2x0ZTgzS0FtNUFDUmU2?=
 =?utf-8?B?SEZVcHMyS015QnVJZmhyS29MNyt6aUJhaXZ4dWN2WlNLcjk2V3FDcDhZUUhp?=
 =?utf-8?B?S0oyb2RsZmdrWG15VWV4Q3dFRjhiMWUzaW9YT3BxL0VKZWNVVkxVaGw1WHZ5?=
 =?utf-8?B?cWE5WUJpRlJwV2RZWTRNRE5VczllcEdaRUMreHlrUnhUMGQvcWtkb0pUWGtu?=
 =?utf-8?B?TUlqZklHaldBdWQ0RmN3VEZlRXB3aXNKZ0VJMWNRL2lsKy9xSkptY1BmN1dh?=
 =?utf-8?B?MTlDVVVkUnlXNGFPTkptYit4ME1hWVRZY2txckFFYzVsRzVYYUxYVEthRUpi?=
 =?utf-8?B?eTltRHdIZHRBSzM1OHBnM2I5MkdBM1BJWWtHN3A4eHB1d1l3UDlzT2VGeS94?=
 =?utf-8?B?QXdWUXhTK3BnT2h4WllQY2Y4eHg0aTNoNWkxeSt0NDVidDM2WnNhbnQ1NGJO?=
 =?utf-8?B?TC82bGVvY1BkRzFkWUtLTUlrWXMrd3ZXcnJtQXBBdW8rUEl6b3k4ODREN2I4?=
 =?utf-8?B?bzMvekFPc3E2bjJSbnFnZmpOQVBPUmJBVGxUNnFHUG94em0yUDFtNDAvTWtn?=
 =?utf-8?B?Qy9zTmNGV3lMdG0wUjJ6UTFDV1lqMTFYN280MVdnTTVJSDFrL1ZNVVJpUzhR?=
 =?utf-8?B?U0N0Nmt0OWdBaDBYZU5heWpJK2xyTU5FQ2VwaWEwdmZkaWkwVm4zQVdERUp4?=
 =?utf-8?B?MGIvZkY2QWxHbG5uVzJweFlMT1haYkdUa1BpS1cyMjN6a2lZVzM1bHVwUDdS?=
 =?utf-8?B?SXRIRUJiTE5UcVhuZGlzeGZxTlAzaWQwbFJCVmxIZkhseVBkVlBOZjJtRnBR?=
 =?utf-8?B?S2VsQkNiM1VwR050d2Q3ZjJnVDFmaFNKUEE0dWsrTXE0bzh3Vzc5QTBvQVJZ?=
 =?utf-8?B?czVrUkJkdHZoTnI2V0llMEcyTS9HdGRneXFTRTZaTExiWVhQQ2w1SmxmQ0ZU?=
 =?utf-8?B?UXI1NktXeWpsT2pwR09KVGsrTlYza1d4ajRpTjN2UDI1Tkw2dWIwdGFPMTVV?=
 =?utf-8?B?Y09UUmc3ZkRRUlliYUEwa01MWWg2QTdRZ1h3Z2FhOHhrbGs0T24vY1B5MlA0?=
 =?utf-8?B?bi9GR0gycUNRa0Zwam1MOGFVT1VDZEpkZGZiRmh6SXNWN3RwTlNqYmJSUWo3?=
 =?utf-8?B?SXN0ajBKV29paTR0ck1ueFJJVHlSVWw4VVY1alhXdWNhRi9hODBXNURIbFBs?=
 =?utf-8?B?ZUVneDhpQ3FpVjJlZEU5TGlyME8zS1JpTXNiMnoxSHFOams0aERFNTlWZkpR?=
 =?utf-8?B?akVUZkx5cXlHcjVWdVVhUjJjM2tmK0M4ei8wQmxIejl0L3lCRlZ6YXNxQTEy?=
 =?utf-8?B?K09WWHUvQU44eFpFMHlEM1VIVjNsRHlDNnJDZElsblVGbHhyOXBzY1lRYXB5?=
 =?utf-8?B?N2RqTVNNQmlXb0MzMXJkRHlWcURFcXZqeFB5V0xDZ09wZHVtYThiNE8rc1hZ?=
 =?utf-8?B?VnNQQjdSck90Q0dIMks2R3BGZmR6ZmtvbldWd2NGL1RHNU5XMDF5azdBVzFE?=
 =?utf-8?B?bVUwTE1GOGczYisyaHVWSldndXdFK2hoQUVNRTRDZnk2VFFVQlpiZ2d2THJT?=
 =?utf-8?B?SkhiWVFYc2w5SmVWUUJYMy9nclBvZ3cvaHNTTWc5YnU1Smhld29KNkt4ZE53?=
 =?utf-8?B?YTdVN3UxT0t6OEpSbXBxLzJlelp2Z2dpOHdXVEJNeFNIaHJsMFB6QkR5enFJ?=
 =?utf-8?Q?/9+4pexoMmLLnsxHvLbx+8oTTle4obqBYzn/DL504HpIi?=
X-MS-Exchange-AntiSpam-MessageData-1: zgi0onzgDaOotRes/dXIxcb/rMoGQVAyoy8=
X-Exchange-RoutingPolicyChecked: bQ5yARqmFSPKfyjBDv3bKTAqTH2iMYp52nI7E1sEVGQJJgSmeL+aVewdvtV23Hd8BDWBOTwp1IlCQuOEJfMJFKsbrHf+JFy9jZs91fdV4u79JsuXGdiAHCwX4h605ybI2A/F4Lj5T+Q76q5Ecu4kQVGxwQ0BHeaOEjHqkE5aaUv4atlf5Y7X2tvpk1WmK+06mSOVF4bdyxkmjswTblppGIWsyXElKwXk44Ndhldb4BV6gO9/wWRYR5a90Sx9nbHyfB1oepjTcUunsQL+3+o0qa3WA/XP9g3EDHLaQWwK4ipdqScFPzXU6li+64mgeTNFR831rbUXimB1nKkKfcen5Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e1793f-63bd-4896-dbee-08ded945da6c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 20:58:37.6629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZA4JfefAYFNsZ5v7Sy+zt6Jek69lYAGguTxpuqzEcz5U3FFbT2l7jRJahlWmJRyE50TJDLXhNFyXS+Fm9gwkdjkP971V2eZkdZ7aP1k0tQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8107
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

On 2026-07-03 at 16:28:43 GMT, Sebastian Brzezinka wrote:
> Add lib_igt_halffloat backed by igt_halffloat.c with a math dependency.
> Tools that use half-float conversion (e.g. intel_vbt_decode) can link
> this minimal library instead of the full libigt.so.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  lib/meson.build | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index 2c1fbcd43..93db217f8 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -415,6 +415,14 @@ lib_igt_stats_build = static_library('igt_stats_tools',
>  lib_igt_stats = declare_dependency(link_with : lib_igt_stats_build,
>  				   include_directories : inc)
>  
> +lib_igt_halffloat_build = static_library('igt_halffloat',
> +	['igt_halffloat.c'],
> +	include_directories : inc)
> +
> +lib_igt_halffloat = declare_dependency(link_with : lib_igt_halffloat_build,
> +				       dependencies : [math],
> +				       include_directories : inc)
> +
>  i915_perf_files = [
>    'igt_list.c',
>    'i915/perf.c',
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
