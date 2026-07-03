Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0DCC43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 21:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB72F10F931;
	Fri,  3 Jul 2026 21:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUHtOW6t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7DD10F935
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 21:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783112714; x=1814648714;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1iJDyJ7pOeMDC7snqZHEZiHTsQ4NGWY9bqDjCP/l5fo=;
 b=dUHtOW6tU8QTNAWxO9xN2DL+0KYiIrE+Y0WoIbKv3V4fqAf5PaKIPcfx
 2+OnM298Fu46fSoGCelfursUZjz4sT7GTb4eOIgVJNOcLHvI1akU/IqBk
 3SrTLmuEirBYegmZ5zzOXjxqBKLHcGGwia/Vwzc5JBH0mL9THSceXJBe3
 IOWcFocsxKBQUCndAukU1eBRupVtv0eQKfPG0IAQ79rPLGzbxuLLc7Tim
 MYGlZz486kQ2pX6qMS/SGJanEbe+2ENFMcwLJZx/vv5vDJ2Vqj7r69D4e
 QJmTeyNIUxlR/e28i1P/LQDWFhMvAzW8tKhsjMo3bqJUe0BN2966oCVcF w==;
X-CSE-ConnectionGUID: +1WqX9vjTOeNHINsOJYsnQ==
X-CSE-MsgGUID: Z31JEB1tR4+GDjY5Wej/GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83894296"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83894296"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:05:14 -0700
X-CSE-ConnectionGUID: pVWlD2K/Q+KKK7cxMXZ8aQ==
X-CSE-MsgGUID: LqtH8NaeQGmwoMm2n9zBeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="252127332"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:05:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:05:12 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 14:05:12 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:05:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hh3SVgdyz5zWF6E11NKpxy3Gw8RBzVAyUh0JpUVxqsX4eJyzEPSf0cDeYFpMpJIbjM+/OHaPW6D/MaMzuTwO6Iuo8aJgy4+y+SxDZhsXlaV441YBT//a8UQz0HBcCcAp1qp2j/a0IX5imtVzrXqS/M+hEa6bTHJczGvHVWWEBUHExCHa3oDkd4+lgs9bEESnjnKwMzYiCQBX7HE/Pv3bq9gROxUxp/uWiYkKBo3xwLX06HfHX7NNoqepWThPvIavvBKVTf5MTLKNx+0DwqCVw6eCCp8JFHzPAEB9rrZQMYRp2eBaJ8Piph3XurXlksECPm7HYXjZzbjN/RaT0iFx3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSpyQK+K+rCpvciMuWZ7X0SoN+Ft6jIlVjuRt78s9fI=;
 b=Q/ujOKNZVpUQiEvLcmj3DUFLdsMPR/O4Os4mQrndW5wVOn7seIvFxR4NlaMBHKdSqwhEY8obwev4KomsFX29VlpZ1C0B4KuuvcJlDy+UmGv+HxHP4NlvoJIjBOdiy0Wutsvbzi5O8A9xlSEpUH1zHYP/CO4/KP2BeVFstyLU89j35TweJxFzc5VYpluO1F58UHjLdo6fmoE8C6Pvfywlil8rbEl9Myt0IgNr/Mzgnxx6F1fLaT5dcQCemHe0BBzNI+bPYDPf5UDIENDU4pwbnnZwiDTu4CTLle4XeyjxMhUlN4oIFu8p/gtickCgTJ/4nqVa5QHarxRw/cOHLrQN+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 21:05:09 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 21:05:05 +0000
Date: Fri, 3 Jul 2026 23:04:59 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 18/31] tools/intel_vbt_decode: link with minimal
 sub-libraries
Message-ID: <3fy2te7hlzdfoppxul3swzifx3s2rknxvzmbgsgjksixdg7wdo@l3mstes2tkdw>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <2ac7bbd574bad034aab8e8ea0684741a9d1acb76.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <2ac7bbd574bad034aab8e8ea0684741a9d1acb76.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZPR01CA0147.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::29) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|CYYPR11MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ffe97ec-bcf5-4b7e-e693-08ded946c178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|23010399003|376014|366016|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: CrXCkV+Z00qr3PXsVMZYt2U5c39NO9MZxg9mR3fzVqwDfn6fvsZBzyrpd6ll8AKuEr1QjNAcbp7Y5kB2tgv4TQAyTCf45zMSKXolZtHa7ITir0iscmrDTR2p/KTxIUSmlvFEk9KwLU66D05Ek8M4pY4egsWLtjfuhEQIG+nHciZiId0NZ+fA1JjQM1sWwbzMgc+dADOelKt45p/iLR25AuClRt80D3OGdfQBlZPx7a+j8AnRqBAO0MUBvX5TjrLXoE4sSuJ4PAc6Umu21PQHwCp3yN8M41lbOjiao3HIxmL9k07ymeshgC3iHx++0vPyRi/mhnaFjvad/deNitsdJTdjH17MNWY7ekXd//3gslfq8a4/+atOaeFMu8sW7lxrGfnn9tgg1OgLq2EYc36B8Q+S0dtnP7h79Yk/T1eQfhJmiubx/oqm688JAHnASU/R5EwvPg8cehzHiRGIk2NLHuCvnZ/WypUaYJKGdI2tGM/a3p+9YnoGoir0oR4iT1QMija0FP0irYlRTIxDz1LxPJImbBvHFx4xjX7bb/vCXvN0nW/csAiwsTVwlGMfl4Lyf3hPnaXT2bEfvcipBFXR40oHnMvrWfCSHG74u0LaEdtBQPOWb4owqmybW0wFW7sxofyTPruli+VmNbSqeiPqqCkLG72cPZsLHX+iIK/ne+E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cldMUUJBdEdjTzRZcXZvTlc3NmI0TGZEOW1leFMzUmI5Vk9xUFVNWnNnZmdO?=
 =?utf-8?B?VmlPK0JMRzlzSy9INmhRRGhMNWpvTDBoYmhBTmdmQllaOGlNemNSbVllSCs3?=
 =?utf-8?B?Z0NSaVhZa2pGclpTUTAyRFdZOUtWVCt4NmpLUVJpSFdRbXU0ekhVWE5qT1hF?=
 =?utf-8?B?OFJwZG1DeXdWc0oxTzVMSHcrNE9lb1ZaY3g4bEphR3hZU1BIRHhLeFpUQ0Na?=
 =?utf-8?B?Tm9sSUJPcEhhYnE4V0c4OHptSkNTNzk1dTNEZWN6NlJGRVQySmMzOEY1WVkr?=
 =?utf-8?B?SUdDTW9SWWR6b09iUmovSVgwdmkwNkg2MVNpZ0QySEdpRGlkY2JSV3IzRml3?=
 =?utf-8?B?TlNvczFEVnR4aGpwVnNTNjlVcWtJU2VxSU02THdCQk8rU2d5d2xHQ3l4ZEd3?=
 =?utf-8?B?MzdYWkRBVUtMU2dUNXNxeUNGVktMNXZrSGhLMmJ4NHRuWmpoRkJXK3RURjZQ?=
 =?utf-8?B?WnhKUFBoSllhRHc5SWZYai9kbWNCVGNGSE5wOGVZbUVxbCtMQ1c0S3VxYWxv?=
 =?utf-8?B?ejM0dHU4a09lT2FQRklmTThLNW5LcDBTRmlTZzl5SS9aNFJxYysveHdsM1BC?=
 =?utf-8?B?OFlValB5ZFgrVDZDYWZUNWpweldtNkRGblFVWmNyd0VaTGN1cjdNakd6UWd3?=
 =?utf-8?B?ekQ0R1FEWjBxNXhtY0FPeVl6ZzJ2R2U5V1ExT2Q0U2JCeDZGSzNwUnM4Vm03?=
 =?utf-8?B?SDNzendvd29Rb3pRL3JvbWpxdko5a3BiZmplOTZ5cGlEK3NSWWsveE9RYk16?=
 =?utf-8?B?c0lvTXVhUUpvRCtKQVp0cSs5T2pSa0RpU1JHcTByNG5rL20wRjBSVisrc2NE?=
 =?utf-8?B?K05NaFJMTDhEZjJQSlJlcWJ3UTJibUNKQXlzYnBZenFxbCt5enpMTHY0b25X?=
 =?utf-8?B?RGRvNk1UMXU2cUN1WHNvVjJzTWZiTDVoYmViT1RoQWhRbjdrT3RGMUYwRWsx?=
 =?utf-8?B?Z0dFSHJuM1poWUpSWjBNQjZLQVN1OEZLYTRkMHFDZE5nOXV3dFcrSFR6V3J5?=
 =?utf-8?B?a3FRNVpsVUtlSnM0VUZIUFlva3JNeW5aUHFGOHdFU2g2ZjNKb21xdndnOWlx?=
 =?utf-8?B?d1E3QU40dEdMREFlRko5bjl3TjJjVmlhNHFEWmd6cnY0YnNjV1hYN0pCaSs1?=
 =?utf-8?B?MnhZbVRWa0tMZlNhczZnaDd2ZFY5Rm9UY2duNWJnZkJuRE1URUhHQTBvTkFu?=
 =?utf-8?B?OUNOTGdrdkY3QmVPKzZPd0d1VzU0d21sWExGY3l6NklEbURUWVExVTRTZzcr?=
 =?utf-8?B?SkpMMitVVWVVWGg5bVZFTmp1YkdXZTV5QkdQOWtrOHpua0dUSkRlSkF0VjFs?=
 =?utf-8?B?U3p3NlF5ZWVHRkRhUkVTS2FGQS9aQm5kYktDMjY3d2p4YU1BblpDNXFZMDda?=
 =?utf-8?B?enZJaVdIeXFlelFITEt1blhVbWVhdXlDM3NhV2Z6NHRoRFM4b3hXMENvS1Vq?=
 =?utf-8?B?czlsaTNHZXJqNEdWNUVHS2k1Yk40MENxMUhoSHIzajdqcjcyYVBBYTd4MG82?=
 =?utf-8?B?ejFiOTJReW1peEpOSVVhRmIyT2ZsZUdqRlE3VldSL0hvK2F3Zlk5djd4aDF6?=
 =?utf-8?B?TUZnYnhZS2M4RHQxNnhEMk9Vd2c3NENnbmRtSDNJYU9iODc3TUE4NjRVeWRj?=
 =?utf-8?B?bkQwaUtybTVib0E4VTFScHh5OXJCYzkvWE5MMXA4SmoyRUEyeklOdUw2MENX?=
 =?utf-8?B?OGtndVRpSHlSdGJTQTkzRTIzbzZ1MEUwMTFmZFNNbzREWWZWbUhUVDgyMGRE?=
 =?utf-8?B?Ly9IZE9pUm1qMjVLQTdrbGtlK0ppQlBSYjZwdnZNQlF4eDJlQlBwVWVlcHBR?=
 =?utf-8?B?WFB5N0grSU9wdnZwY2c5emgrV0QxbjJKbXFONVp1bWo2VmRyL1d5RUlwcG5I?=
 =?utf-8?B?NHdvVERkMXNiRzgrTGp5TGNPOFNiQ01ZWi9ZSXEzeUFENGlTcm04WTFOUnEz?=
 =?utf-8?B?UkMzVDBsZ240KzhWTkpaUVNxa1IrV2RZampSZmV2NXZOM1FKZGQrTlVUcXdF?=
 =?utf-8?B?OVc0NHdqNWJ1c2dDUkw2R0FPbmd6dUxQa2FaU3RHcGRwelVwYUJodytDSkFE?=
 =?utf-8?B?aW5BT3Z0N3ZjWUtBRWR3dkRScEFJOFR0Y0FZTDhUcGJHMjRQRllNUFlJMjdI?=
 =?utf-8?B?U3piOVdWS1c0M1NtSGdTQUdiTGVseWh2R0RBRjJCWE56K085MXNuaEt1TTlG?=
 =?utf-8?B?cnNoSERKS01MOXJ0d25UZEhWVTNGY2xkMjFleUxGKy9GajIzcjF3T2Q0Vmt0?=
 =?utf-8?B?UUFqdEFyMHNUZ1d4Q2gvNHRLdHAyaUJNbldtbUMydUx4dk0rUVEwN25ScXRV?=
 =?utf-8?B?U0ZlRUVVRmxGaEZ6V3BMdDhHR3Z3dVRLS3pUNzVUWE13bncvdERZRTgzZllW?=
 =?utf-8?Q?gELbtlzZlp7RlUQkILwOt5eCjK5XAOdj3/5Q66K06N9sG?=
X-MS-Exchange-AntiSpam-MessageData-1: TYi6TKHM3wmzWiHe6v+jeZLbNuJxfTtKwkA=
X-Exchange-RoutingPolicyChecked: V5S2qeTb3f/J9Hl+duQneikMLa8v47/PryQYYdmM9nPZMZ0zFFMRfk6NVFfyHkWBwT4P3tUGEH9e0WhOk5A6vgTW+FWZdltcysmUcyfs8vcQ1BJbYv73c+y+Rr+YWftBBQ+5m/trKnIoZYObZBnAgQI6C4K5qD8rlqKG0mROFwDLP00tYuDH8z3BN5G1o9+VjSG1FMcTamjM4Kv1/GWK3JKwoSeTNR48C3xz3yic/glWVM/XzddQrWdIw2fIK4NlVh/zozpN/sKX6olrSVDqvG1HlthQ/y1XUQPrlpjWuri75GP5MGO5CQaVJP/MLzNmLl3cBIwQWWh+39VQLqzhSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ffe97ec-bcf5-4b7e-e693-08ded946c178
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 21:05:05.0943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJa1DPKX1yEOVAUfF07Gh/7CfuRewuxOJQXfSfVqPFk1YRzcEIQGuxwvdmxdVS3/R8k2BbZH/n4siLXF4U3rfYX3A06co1XvKc79sJ6aDdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
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

On 2026-07-03 at 16:28:52 GMT, Sebastian Brzezinka wrote:
> intel_vbt_decode only needs the chipset tables, half-float conversion
> helpers and the lightweight tool stubs used by those helpers.
> 
> Switch to linking against lib_igt_chipset, lib_igt_halffloat and
> lib_igt_tools_stub instead of the full libigt.so stack.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   4  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index b04754c5e..46cf1a717 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -34,7 +34,6 @@ tools_progs = [
>  	'intel_reg_checker',
>  	'intel_residency',
>  	'intel_tiling_detect',
> -	'intel_vbt_decode',
>  	'intel_watermark',
>  	'intel_gem_info',
>  	'intel_gvtg_test',
> @@ -88,6 +87,11 @@ executable('intel_error_decode', 'intel_error_decode.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_vbt_decode', 'intel_vbt_decode.c',
> +	   dependencies : [lib_igt_chipset, lib_igt_halffloat, lib_igt_tools_stub, pciaccess, libdrm, math],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
