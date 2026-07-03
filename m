Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D7DC43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 21:21:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB86D10F941;
	Fri,  3 Jul 2026 21:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T7G8VzdS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006E910F93B
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 21:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783113675; x=1814649675;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Hd0ydWRviimmkk8b0gpoCTIA7z5NGMDYOPpMy97y7bM=;
 b=T7G8VzdS7fCDXDTHH+RVShah6hKLbIMsSS0cqr/4e2+tBU2APB4m5Mie
 yMZk4Aes90dXEo2oKIH2Ch4zUqcVHVABzLVluKCUXBG7YzWli8BZPoRsP
 04EA8XbShvly9SjAs1993DjSCeibev7DJ3J94FCjl1+hR6n7qlqfsgrzT
 B6fTl2+vMW08tKqtQFpyfAsm5EnLAnnK83u75lmOO2O9C9sYj+MKXgnQF
 5AlUa7mdo20A42KrJ6gGuD+MWnw+Z5sr8ILiWfSawM+HAc/jR3r75SnjE
 u76eLBO38WgbD88znzkbnj5uJv8HpZ6ibuSAlvP0U8KAmVJOt7Mm6TWKd Q==;
X-CSE-ConnectionGUID: nNQrkmDjT4+AFy8BLPB9EQ==
X-CSE-MsgGUID: pTtUwpr6RrCeHptDRIEo3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83638141"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83638141"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:21:14 -0700
X-CSE-ConnectionGUID: r1MvtdCZRrWhSnM5pyUe0A==
X-CSE-MsgGUID: 8yuhis7CRXSGlMR36aniXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="248738662"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:21:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:21:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 14:21:12 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:21:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJDrG20pDkrGFQ36V+Ns++06mOQ8Dks1+GA8TfMKUM9xxUok4G6iwvLudi8K/u1CE4wYq/e8xoxKEXdCoTnQdJvu+hI0j4U8szWuqaT/BIwqVq2OQHDndzdgJxx2hpnsLIvkgWfNLLAHa0ijM15QywHoYppTMAJ5ZMzOgIGRQexRRE8f08njLkUxhgEpXIi8oOZAQiABZGKgJflA3A7PrVvJL5i+KFx9rAY+efwnbCKbSetDN2Hs/jx/08z3MMxw1mv7eOFLdXToaP0hOX0dMRUvjmkkVUfKZLJrnoMp/fKqjn9pi2/JVhVePpXSPU8qZvonO4qpjicSTova0iQ16g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PrBlYd51VNnMgJR9XEYjthVH50A36huksNlIgUslek=;
 b=ac/UzqAqyomEbJ3CKvanaRMZCpRJTR3EQHwfEwyKa4HRR0wSEiOq29ZSe4vYZLeKdSsdclKHtrlz6MdX3tKkZaQHtINUtN3rMh/YiTFEpMj9z86k7Zyxs8Hc8dhZKqaI0x72Fj1aLk3yeocya0TidyOuY7MAqnDiZxxB528ZJSQzScYkmlJ1CfHvQ/SfoaX74uNJvMYzzLsG/bYeVt21F3aukAdFxYj8jhrSPVGj4NJDiNubMcvPQlB6iswaNQUKR6sRLpi8P2BWHgVOyx7mTS7oPXpCIq9oKM5k9ejDM60qs0KVez4NMFugtUMt4WlWYX7lFtY1ttfJVP4znN5gAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by PH3PPFC80959CE8.namprd11.prod.outlook.com (2603:10b6:518:1::d4b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 21:21:10 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 21:21:09 +0000
Date: Fri, 3 Jul 2026 23:20:59 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 30/31] lib/igt_core: move igt_load_igtrc to
 igt_device_scan
Message-ID: <rpwmsdsahgtovwsygcssyxeiiyw3nb6mt4euntvt2owertmeq6@7njkbp5za66m>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <fb33bf2816d029fd36fe54bbd0cd11be85696513.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <fb33bf2816d029fd36fe54bbd0cd11be85696513.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZPR01CA0132.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::22) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|PH3PPFC80959CE8:EE_
X-MS-Office365-Filtering-Correlation-Id: 236e8011-c080-43fb-137f-08ded9490052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10070799003|22082099003|18002099003|3023799007|4143699003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: SSMjWdCeW7HV1WmkX2mq+Cb47kwC+1DkeUagUu6OWEzlStFxxwJ2rf0OpqqN7YWyE4RiRLGQYF/y9/3xHJe5tE2DdURtYJN5MFpjz09LoxZmXfvjIbMr76PS1P93/afFjtRpUVyqrfpAeA27CsLEs0uHxOPjVo/Hc0Ph4i3a9PA21r6KPAkE9lVPvnLLKj2ellOazIRjght3agxZRTsVMIu5As5BCtPyZ1lbgMW1oiJdJNRD8RO0WEEThREeYIfiSZgXIx93DkNBvwcwCiBG2aPQwKJPJtEYXqePTyyY+G703j4qi1lJSTi5Oc81eFYXEMWQkPBOBJaoz8w4Oz4PaHTe/CP+fwYRkzpXgLG/1W8tA+lK3YVgdiveevg7PslL13479Geu7hNtHBB2RzmaTj4ukZcZLddAT5UHq0a31v3jOVgKG7ZmZ86dMZrRpbArL4NUNhBHf7ti+4OWk1tJJimjk8otRTT/sdSKPI/mE4mwOIzU1LxmBDtS0hynL9B3dH+LLwvs4lNZswo4LEZj3lS/xHhNBKm3FYyyLWzgO6be2V/H8aK61IN6EdCUv8A+63gDj8NCT874ihDWTFVVpvW4uO9EfqaDHJ9jxt5AEAp6p513oZrVXFNHgSOQ2NeQ+ZWaSv9v1Np58EItIuEbkwEUn1fHQWL2QjsP8i98HV0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10070799003)(22082099003)(18002099003)(3023799007)(4143699003)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm1rZEZZY0o4dXdDRldoUU9GTlpnSWxOQ2V3c3V2Z2NmazZwMkI4YmdGVGYx?=
 =?utf-8?B?UXBqaFVvdkNib2kxTkNkYTBlOWFHNnUvMDdYclhrOGdJN0dwWWVkcnFsSUdG?=
 =?utf-8?B?ZUhwRE1ZM3BGQ1p1TDA2ekxYNGNVZWZlR2RZSUhzNUpybTU5R1pBdHpUalFL?=
 =?utf-8?B?ZlZxMXM1eW1JM2VzS1d6cEg0UUNHcFVUWmhNNTE1YlQvTC8wVnNVbVdMUmpO?=
 =?utf-8?B?aDlaVFNwdmJmNW81bXBMY2lvRHQ1TmFrTW9EdVBsVUlzS0hDVkQwelkwbm5T?=
 =?utf-8?B?UlBHalpvZDVaS01uRTMvdCtZVThEdHptN0FJdnFEZ25WY0tXREd4ZFVRbHpK?=
 =?utf-8?B?UE5laHlSejhCQWFiS3Myd2tLWDFudGhmTGJST05YZW9IMDk4aWJrVFEwN2lI?=
 =?utf-8?B?djBEeUhjYlNoVk42eEtDVVJNZVRjd0hnRldWYU8zdG8weDZ3UEVWNmo5K0ZP?=
 =?utf-8?B?NmRsaE05OVluZUVObEpvSzArWnNHdTNNR0pHSGVmeDhIVlJ6QUY3bmFGbGc0?=
 =?utf-8?B?KytNVjFBaE1PV1cyODY2Yy90L003TmttcW5FY2lvRnRiQUFOSnBKYTg2clRk?=
 =?utf-8?B?MHBNT0RIeWh6LzhRaG5XbUhPUUNldmtCOEp2b1k3VWMxdWIwNzhxS1EzYXk0?=
 =?utf-8?B?MW9TS1dVYitOVDVRUnVkV096a3VuTFUyNjVUclBIVEJKRTNORW4vaVRYcVNF?=
 =?utf-8?B?NkJBUXBUVHppN2RLZnpjbzlQUUR4dWtVZmROWG1WQVB4MzA4bDZsczRFTmFo?=
 =?utf-8?B?SU9iaHRGMmE4NEJuR2RKbExQQlBJdk5pWFdtbW1tNURFbGhqanBUcC9hZ3Jt?=
 =?utf-8?B?QmpJSXE1WGg4N1laeWtsU0s0ZnYvYjYrZDd2dVFTVmU2Ri8rM1Nnd0FPR0Ev?=
 =?utf-8?B?ZnFFU2t2Y1dmTHk4TmZiclE0dUNldkRwcUJYbVNSZ0hrMzlOc0JEa2IvN09X?=
 =?utf-8?B?MmkvNW1xRDUzcDRRRmpON2dqZS91VThyd1RCd1ZOc0RoNG1VM1dNVXAzdnF2?=
 =?utf-8?B?Vno5SHN1UFRLY1VZUVNnOUZPU2QxV3RWZkxaaldxbmxzalZpVktFeEdIT29Z?=
 =?utf-8?B?M0FTN0NlVTQ2VDNrNU5uenBqRit5RGpiMEUvb2FpcE1TeHIvbTlVakhzanBo?=
 =?utf-8?B?c2RlL2o0TlBlejdOY2xVb2ZhUTVLeXQ0MHpMSHpyaDBlc0ZUSEkybEErZXFQ?=
 =?utf-8?B?Z05BaUUyOFJad25IRVVCcTRqdEpsVmE1ZGZRNHc5eHJCREFjMzlPMUtvejMx?=
 =?utf-8?B?NmVQb2g2bXNWRGJIZHQzbVREM1YvdXpvc3lIbzNJb0crYkVSZUhFQm9nbkJj?=
 =?utf-8?B?M3RjVTZScHI0S083OUhoRzZJWjBnM2lYZkFiRldzUmNvSC9EOHhHamIyRGg4?=
 =?utf-8?B?K0o3QWkzdythOG0vdEgwc2xwVU9WcDBRdnk4SE5ERUQvRGtSSW5hb2ZjWHFy?=
 =?utf-8?B?UXlOeXI1R3RsQldYSGczT0llbWJRRHNaemQzczlWUDJTSDJKVWQ5SVpad2VG?=
 =?utf-8?B?SytUa2lJSk1wNXhNK1NxMDNrY1pNaVVkc2d1azR6TVhyM3BIKzFyYTNzKysw?=
 =?utf-8?B?UzdQMEp1N0ZDT01FZ1prU0hweGFuVkcyeUdzNFpvZ1hYNlZycUR4M2R5L09p?=
 =?utf-8?B?TkxyelhJcm5IZnNVY3RiWlBWMGZZV2hXMTc2SnhkU1NVRVp0K2MxYk5DdkFM?=
 =?utf-8?B?dDhKQkkwbTM1dmhQYlZKQjEyVEVXVGdtaTJOazMvRTJwQ1FSNlBjQ0Rjc3NM?=
 =?utf-8?B?bzFMM3dHNURjcUNrVGRjSmltcjlXUGd3NmZWamVBZVRmRE5GUVh4MmNlbENZ?=
 =?utf-8?B?WnFXbHBXdEprYTZSa1lhd0tMRWpRMTdvYXdxN2ZNWmYraG9NY09ETnVpTGtB?=
 =?utf-8?B?c1hrTUZoUFVPanY0OXBmbTZqVzVTQnNvMndNbUZoZjVmWlZBQ25XUW51TkZY?=
 =?utf-8?B?disyVmxXZDhNQWpkQlZHZFRudXVja09IdmsrQTR2a2prQzVMMFQ0Mmhhc29T?=
 =?utf-8?B?VmlRdHhhYmxjZ04xV3hqTjA1aHBjMUw5Zk1wV3RXVFVIRTVrM1FlY0hxdk5p?=
 =?utf-8?B?bmxUalFwRGZBSVgvMVBpMHdma0cvSGhaS3ZNYmxZd1dlUkgyRTZxWW1RTWQ3?=
 =?utf-8?B?MzV1d3ZyQnZhYndhVkN0Z29pbHJVK2c0NUxZc1A0S1lGTzNEU0pQVFR6d1FZ?=
 =?utf-8?B?b0tveWtUU1F6Z3lhWVRxc0pueG93L056RFBBUFNQcEZtSmVGd3pyOEwvaXRG?=
 =?utf-8?B?T2dsZk1HQlljTlR4LzFIUSt1SURWcGtLU3pMY3V2azUyTW9LR1VWNUVzaW1Y?=
 =?utf-8?B?QkVVSzNLZTBTSU55djFSUFcvR01pU1dYbFNjVHVmOVNvY1V1ME55ZW1BdEFv?=
 =?utf-8?Q?NWpeeH2pcZCKA+s2AnLT50Zye032QAe+yZIjfY6bfd6iJ?=
X-MS-Exchange-AntiSpam-MessageData-1: eAniCRVry07K9LWkWEU3OOy+X9tK4M9WZdE=
X-Exchange-RoutingPolicyChecked: ivCT9Q7dWqlLyxoncc98SH+mQ9+KSWw+wO1UzWM1syhDz9K/k/aEYrtrEL6CJNj2TcbzzQoNQ2KiO/fkqnOiZi9eCMBF/cGAyHby7G4OXnTbQac15HOxmVzGDjCkLYS0i4U2YuvrN8nOKE6ZpeWtGHp7aPbxwy4+ad9OIYXEviwz+wInulk7RwkS7lOM4XEG/mULaAH6aLUzChIeLTXg5rrf15SAqMuU8etfL9+Nel9ch8s+tvb309OMP7Q8VKh3tnuRuipTrH8qUH9750GR0Y1rH9k9yPdaVHO3tdVJZ3fanQJNdxMF9rkEoGjwyHi0XCEdK6nFLs2bf53/tZyIQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 236e8011-c080-43fb-137f-08ded9490052
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 21:21:09.6397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/6QgBqpsTdRmoV43PpAP633rtgTK1WcpZ04qxbc4MPNzCU3pY4zAogrsOPUwbc0ydQujUjtyf2lj+OO5dnjGsJxpKeaF9CPV2oRYtjXS4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFC80959CE8
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

On 2026-07-03 at 16:29:04 GMT, Sebastian Brzezinka wrote:
> igt_load_igtrc() is used exclusively by igt_device_scan internals to read
> per-device configuration from the igtrc file.  Moving it from igt_core.c
> to igt_device_scan.c co-locates the function with its primary user and
> makes it possible for lsgpu to link against lib_igt_device_scan without
> needing the rest of libigt.
> 
> Update the declaration accordingly: remove from igt_core.h and add to
> igt_device_scan.h where the implementation now lives.
> 

What happens to runner/executor.c? It's also calling igt_load_igtrc()
directly, and is including igt_core.h both before and after the patch.

> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  lib/igt_core.c        | 47 ------------------------------------------
>  lib/igt_core.h        |  2 --
>  lib/igt_device_scan.c | 48 +++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_device_scan.h |  2 ++
>  4 files changed, 50 insertions(+), 49 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index a7c097d9e..2f737b01a 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -972,53 +972,6 @@ static void oom_adjust_for_doom(void)
>  
>  }
>  
> -/**
> - * load_igtrc:
> - *
> - * Load .igtrc from the path pointed to by #IGT_CONFIG_PATH or from
> - * home directory if that is not set. The returned keyfile needs to be
> - * deallocated using g_key_file_free().
> - *
> - * Returns: Pointer to the keyfile, NULL on error.
> - */
> -GKeyFile *igt_load_igtrc(void)
> -{
> -	char *key_file_env = NULL;
> -	char *key_file_loc = NULL;
> -	GError *error = NULL;
> -	GKeyFile *file;
> -	int ret;
> -
> -	/* Determine igt config path */
> -	key_file_env = getenv("IGT_CONFIG_PATH");
> -	if (key_file_env) {
> -		key_file_loc = key_file_env;
> -	} else {
> -		key_file_loc = malloc(100);
> -		snprintf(key_file_loc, 100, "%s/.igtrc", g_get_home_dir());
> -	}
> -
> -	/* Load igt config file */
> -	file = g_key_file_new();
> -	ret = g_key_file_load_from_file(file, key_file_loc,
> -					G_KEY_FILE_NONE, &error);
> -	if (!ret) {
> -		g_error_free(error);
> -		g_key_file_free(file);
> -		file = NULL;
> -
> -		goto out;
> -	}
> -
> -	g_clear_error(&error);
> -
> - out:
> -	if (!key_file_env && key_file_loc)
> -		free(key_file_loc);
> -
> -	return file;
> -}
> -
>  static void common_init_config(void)
>  {
>  	GError *error = NULL;
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 3337293bc..afaf35aa8 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -95,8 +95,6 @@ extern const char* __igt_test_description __attribute__((weak));
>  extern bool __igt_plain_output;
>  extern char *igt_frame_dump_path;
>  
> -struct _GKeyFile *igt_load_igtrc(void);
> -
>  /**
>   * IGT_TEST_DESCRIPTION:
>   * @str: description string
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 7c7995224..a15a4624e 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -33,6 +33,7 @@
>  #include <ctype.h>
>  #include <dirent.h>
>  #include <fcntl.h>
> +#include <glib.h>
>  #include <libudev.h>
>  #ifdef __linux__
>  #include <linux/limits.h>
> @@ -2477,3 +2478,50 @@ int igt_device_prepare_filtered_view(const char *vendor)
>  
>  	return gpu_count;
>  }
> +
> +/**
> + * igt_load_igtrc:
> + *
> + * Load .igtrc from the path pointed to by #IGT_CONFIG_PATH or from
> + * home directory if that is not set. The returned keyfile needs to be
> + * deallocated using g_key_file_free().
> + *
> + * Returns: Pointer to the keyfile, NULL on error.
> + */
> +GKeyFile *igt_load_igtrc(void)
> +{
> +	char *key_file_env = NULL;
> +	char *key_file_loc = NULL;
> +	GError *error = NULL;
> +	GKeyFile *file;
> +	int ret;
> +
> +	/* Determine igt config path */
> +	key_file_env = getenv("IGT_CONFIG_PATH");
> +	if (key_file_env) {
> +		key_file_loc = key_file_env;
> +	} else {
> +		key_file_loc = malloc(100);
> +		snprintf(key_file_loc, 100, "%s/.igtrc", g_get_home_dir());
> +	}
> +
> +	/* Load igt config file */
> +	file = g_key_file_new();
> +	ret = g_key_file_load_from_file(file, key_file_loc,
> +					G_KEY_FILE_NONE, &error);
> +	if (!ret) {
> +		g_error_free(error);
> +		g_key_file_free(file);
> +		file = NULL;
> +
> +		goto out;
> +	}
> +
> +	g_clear_error(&error);
> +
> + out:
> +	if (!key_file_env && key_file_loc)
> +		free(key_file_loc);
> +
> +	return file;
> +}
> diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
> index f24a193cd..5b04033e3 100644
> --- a/lib/igt_device_scan.h
> +++ b/lib/igt_device_scan.h
> @@ -103,4 +103,6 @@ int igt_open_render(struct igt_device_card *card);
>  /* Add or use filters to match multiGPU devices */
>  int igt_device_prepare_filtered_view(const char *vendor);
>  
> +struct _GKeyFile *igt_load_igtrc(void);
> +

Maybe it's just me but using the typedefed GKeyFile in the definition
and the non-typedefed struct _GKeyFile in the declaration seems a bit
weird, is there a reason why they don't match? If not it's a bit more
readable IMO to have them match but this might be out of scope of the
patch.

Thanks
Krzysztof

>  #endif /* __IGT_DEVICE_SCAN_H__ */
> -- 
> 2.53.0
> 
