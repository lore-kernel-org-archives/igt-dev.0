Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CCDC52D7C
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 13:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FDB10E452;
	Wed, 21 Aug 2024 13:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDFL9E/C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D568010E452
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 13:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724246706; x=1755782706;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=XAzrTA5qoshpBqjrXOuw12fyOO+wPjgXElK7WXWf6Pw=;
 b=aDFL9E/CtfUlqga8FZNi4tg1nVT2wuiyntO9h1VrFnpjYAYuQt5kM/6U
 VW27TEfdP3hrds+BnD9ptb1UAweCoka60dL2NWRCQGJ+XhQGmyG99lFuU
 reIGoBe5UbsIQcHp/lj0Sj6kY7YBJTtyGiZU9WOCvQLXNRi/GAZDc7ES2
 mXcplF4tk3xznpW4wPQ45nRN4DYpTLIuwQYt1UF2gaaph3GfAi/wRtCBd
 xFb5ISCiUMjU529sk2V/wRvAjXU5CmolrQUTFuHnueRNjQig5J/9dsM7t
 8Goeo/qrz9SckqLowj5dBOojCZutWgGU0vR1OzkiywaKcU9qdFAkrvi7Q g==;
X-CSE-ConnectionGUID: Spi7YAnhSyGcSdlDDOBMiQ==
X-CSE-MsgGUID: bHBZsgvQR5yfA9PY1bmSLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="40118823"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="40118823"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 06:25:06 -0700
X-CSE-ConnectionGUID: FTifUTKTRkGBhUEpCNnVww==
X-CSE-MsgGUID: VjScTRoVT9aMeeu1cV4yfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61227540"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 06:25:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 06:25:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 06:25:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 06:25:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 06:24:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTt4cTFFNRyJRr5qDmGdP04Nzt+fEtQ1MFo+MZJch34oJ/qW5GPclCkhUkDDlX9tx91f1hyTF1fufM0cUdSYiBXDQy1BCmzBlVVDxZCzNPnplwHjqdYxZ6hNxrXG1ULdLeA4jTtV4c1ecMyLlcTyuK/7RPDxiDFvXDZMdCsoVCtS82gXlpG+XCcmfQy7/cw1nLg6ta335QjySL+JgGsGmHC9vYEYuEE/VNpFnd3Mxi7BntDoAdpzpfsCoaNg3w6omC5Al4XkDTWnlExVyUuN+pjELHkcWVAlBDadpei2xggLNC7UaT9GTuFE+wrtl/P2rB/G9oRwt3+6npdqePy9yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYZ4Req5EXuEBN/huxT1j4QfZngokrPwGU987uFIzN0=;
 b=QsvglAPPpGDTzhFm/9lNViiYwZLRjeG9cxf+HyXu+ipL4Bgfldp580FI0tkjsoa41x5YvIWnnIY9UuQztX3mUliUDZ9JGt33gN4dN6cWjeKAMdbECVPw2VZYIJOvf4FF25AylmwjAL5bD9IaArsuwBaZUDY9dKI+yTTEGnEX+qGVvpoUtA9lJTpg0Locj52Bok0bR9Wgy2IzZfyJOEu37AiUgIP7N39ciShy3I97o1DezcoK7evnPVC68225G5jLyfpqDU1Gt4XVgDJMQ7GGdjSdCcplBhGcVWNMkt56qZtycKM7WwBdRLn4aVPGRmfZRo4bQCTg2gmQa1LIQCDegw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by PH7PR11MB5817.namprd11.prod.outlook.com (2603:10b6:510:13a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Wed, 21 Aug
 2024 13:24:47 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%4]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 13:24:47 +0000
Date: Wed, 21 Aug 2024 15:24:36 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: <igt-dev@lists.freedesktop.org>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t v2] i915/gem_mmap_offset: Partial mmap and munmap
Message-ID: <gohu7lp6s2xhckqdayrwmsxzkpmucpnrzvnotktafw3pfvbosz@ybjztcocclmr>
References: <20240821121157.19055-2-krzysztof.niemiec@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20240821121157.19055-2-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: BE1P281CA0346.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7d::11) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|PH7PR11MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a76e85c-37bf-4e27-a92f-08dcc1e4a0d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amdLdHNsQitZQVR6N1dKTUs5YmlMZ2NUaldIYldkMXY1QTVkNjJEakpKZFdv?=
 =?utf-8?B?c08xZUVJSGFwTDFHUFJTcnB3d1AxNElOQU9jK25Lcjd3UzJJWHZYN1EvRGEy?=
 =?utf-8?B?YmpVZmVnenlaeUM3ZDF1d0owdVk3OTVJbDVFMXc5ZisrQ0Z0b0VHUFFaNHNh?=
 =?utf-8?B?TXJPZElHVUwrS29KME5LTXRLV1NsaHpOdXVEeDZnVzhIR1lkQk1tOXgzYUlE?=
 =?utf-8?B?U0ZhZGp5NUt3YVBVcERDRVo4cTZxREdrb2lOOWJBWFkxV3B6cHUzeTJFSkNp?=
 =?utf-8?B?c00xSFJGbUxZOEVYU2lRaWV4VlZ0cWNHWTh0MEFjNzRZajZFdlQ2Z2JMNVF2?=
 =?utf-8?B?bUp5Y0hmdnhwK3JCM0VzVWxHZU9Ham8xQitlbHVPNzVFNWYra0E1TEFJeWRL?=
 =?utf-8?B?ZFRTMGVqcDBaWTlaaTFLeXVkSmxYRzhuTnRrNTNSaTRqQVRqVHlpY2xRcjYx?=
 =?utf-8?B?SzNBNm9jVlpEckxrNkR2Y1FJa1JhZERZRmh1eGJXVEFwVDZLNkpIUUZrR0tL?=
 =?utf-8?B?SHBjV2xZVzFxWXYwMUxES2ZyWTlrK3hFZmhMempHd2xuMDBGcnFGRzlZaDdO?=
 =?utf-8?B?bmJyK0dMVE9hanFNc3pid2VyWk54V0dQVlYxQW5aRHNkMjZMVVpBZTh4QUlz?=
 =?utf-8?B?M1FtK2lYMG43WU1TMFVyUTNFeE10blA0RHJVeUpoNExWWk9ITHpCbi8zL2Fy?=
 =?utf-8?B?YWxxTzBlQ1d4THd4RDlESlV3YzlBVkRKbW1XQ3Q5QVhOYWlkSEFmdVhjVkd5?=
 =?utf-8?B?UzhkV1I0TWlnOHM5L1J4NDY2cUJPNmZaRlVZUXc3bzJZaDJCam4wcmhYdnhP?=
 =?utf-8?B?ZjNXNUdDR0lVR05rejdZYjUvaW5qSkQzRE9XUXVWN0FxRU15eW9NYUFzSnRE?=
 =?utf-8?B?cTNrdWFVOWpqbnkvcm1XL2Z5MUtnQXI3Zk5aRHEzTXd4Yi9WUTdRcWs5N3k2?=
 =?utf-8?B?dTNpTU1CK01iUHNoQkh1RG9EUjluWXlUT3FhRzZ5S0xud0J0QWxLWElkT3Jq?=
 =?utf-8?B?a1hjNXg3RENSS0E4Tlo0VXNrQmdMM3htOTdkSHl3RERDTlUyTGRQNGFmV1d2?=
 =?utf-8?B?Q3RQOXgwZkRDZWxUUHRMbGE2VXBxK0UvUW01STU5K05DZFQ0SGs1MjdnbVhT?=
 =?utf-8?B?dUZGZFhiYXJ3U01TTWxFT2hzanhkdDNHVGZoZGlxZEErb0k4dTRSTUpzK2Fv?=
 =?utf-8?B?NlB3NUpCNmhMRFJSeS9lTytVWTNSV3g2UGFsOEpYSkRCd1lNQUErV3Zjd0ZI?=
 =?utf-8?B?VHhnVnU5VUlKdjBkZWNEWFFVaDdwSlBKNUV2bURPUHV6V1RNNG9TaVBHakd0?=
 =?utf-8?B?Tkt0MHhDS3VHVFhUbHgrYUNQajMrOHdyOGtaYlJQRU9yY2VwUjIzakY3TG1J?=
 =?utf-8?B?WVlidHFES2RIMWxvVWxUUWV1ZFo0dVNNZ2k4N0d5b0ZRSFRaMGJWZ29jazIy?=
 =?utf-8?B?SnYvcUhoMVJzeS9TQlhqK09aK1dtaVpBQTBsTGJ5TVpMUnJyN09XNndtUWFt?=
 =?utf-8?B?L0t2NHliM0dyZHQ1eml0LzU1aG1heHFGbnhFdlhlOGFlRlRtcW04cldyWjhZ?=
 =?utf-8?B?RUQ5R01NM05Cc1pMUVNyTzFXRU13engzQ0FXeEQrR2NPUEtoMTFxYVYvRDI3?=
 =?utf-8?B?MXNhejdRZHFTdEloemJxTkRhcjRyOVN5cXNMQTJ0b2hJY3k1YlJQcktpUjhY?=
 =?utf-8?B?anZrS3dEWDhMZW9qWVF1OVBkZHVKTlpRamlyN01uZUpWdklXMis1anRYWVJn?=
 =?utf-8?B?MzhrUU5TUHhQYnNvZU1UTzdrZml2bytJUzA3eEF4OGR1Tmp0QjUwU1c0Y0Q0?=
 =?utf-8?B?cVc0RVVMeFB4bGhGc1VGa2oweElUWThEMFIvZG9IanZ4blg3RVBmNTFPeS9s?=
 =?utf-8?B?c3ltdGgxNE1Za0pkNnZhWkZXdzdVa0JHaVE3NUM4NTZSSVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WG5YSnNKN3JJaUs5bXNGemVHMHZMdW9tMmIyZUZDM0liVEpQR3UrMFFWTkRK?=
 =?utf-8?B?VnF1VlovRXVQN1VaQnY2SHpxZmlmQzQ0TUZtZGo1czczSHhuMW9hcStJT2Vw?=
 =?utf-8?B?ZnN5REJUSFNyZnZZQnphZk42ZS9kN1duMEhlT2lST0NjRU1RbTV4TE51VzFu?=
 =?utf-8?B?M0p6czlhcXh2T2dTNlV6QWd5YjlPampNMndXMU9oczg1MWZxSkNlV20yYzBM?=
 =?utf-8?B?V2tWanN0dmdIMytsTk1EZXIrS24zTHZSOFVlQzB0L2RtMDdFR09wQzllMXBR?=
 =?utf-8?B?U3FSa1NZV2xhbFZzZEY1TEtqOE1xUnFxaCtuTjFHU1cvZGdwU1NjUVYvakZP?=
 =?utf-8?B?UU5UakVEbW5uNXhRdDF4M1RGbkZPRVdjdmhZUVlVL05JS091c2NZOUNvYTZs?=
 =?utf-8?B?eVJGajVteVF4dEVFV3A2OU9IYzBLQkdTcm5KbE1GMGR5dDhLR1JoNDJrc0tu?=
 =?utf-8?B?RlA2UGJYbHJjNWFneExFS212VFdKWmRCZndBNGpvSWplclVJVWpTMnlpTUsx?=
 =?utf-8?B?T1ZXNmVJUWRFQVBSWmIwYlZHVlJmNGNSWkowaGtST1FYRGVBWHI2UGFGZlF0?=
 =?utf-8?B?SlFXS0g1dEFZY2djWFhCM1dySWYweE5lMWFqVEVUR3V1R3RDb2hZS2xyZS9U?=
 =?utf-8?B?U0FVZVhlMHhJRUQ4cXh4ckRObkp0N3NKN2RLVWk4Mm55dFRuRjlEbmdnZzNX?=
 =?utf-8?B?cG11NU1lcDBaalc3ektIWCthR0Rvak8xYjdQclVSbVNxVjlSck0zWkFTTm00?=
 =?utf-8?B?cXZRbGVCK0xHOUFiOWdNSVVnbG5SQXhqajZjVkFZVzFGaHd5dk9ud2o2c091?=
 =?utf-8?B?aUg5eXBlN2FNdHJRbElSMGFuYkdUaEMyWSs1TXQwcGtrQmFSODhqckttQlRl?=
 =?utf-8?B?cXdjZmhHYjQwS1NhZzE1TEx3RmFmWGwyNWlSQnlTK1dFcUcyWjh2akZMZ2RR?=
 =?utf-8?B?MFhZUEdXdmtseGUzd000Rkx2d25HbXI0dmMxT2NEMzMwTjVGWGdobW1Pb09o?=
 =?utf-8?B?TGpHTjRZbHNCUG41aW96cTd2a1o5VHI4alJNSnJNYW5BR2lyc1FpMkNOZS9U?=
 =?utf-8?B?QVhTM1V4K1hxcWVyV28wOG1RRjBiYzZqWjJxclQxcVdmNDhWdkg2SGN3azF2?=
 =?utf-8?B?NzZnaVFBV1RHSVJvUXl2V3lPL0pBcnlpSUhMMCtWS3VDeXJMSHNSempRVDgw?=
 =?utf-8?B?UHVqTklDUERIN1VXYmhSdVBjU0pCSHZ3NlRuY2FqQlRKNDZZMTlMRTB4RVVt?=
 =?utf-8?B?VlJlQUF6TTNyRWozMmU3enMvc1JqSHJmZnI1cThCLzliWkcxd0Q5d1kweHRF?=
 =?utf-8?B?bFVBbzIyaVJUdmROdFA3YVhib0NQVVRtaHliUzVkemVGSHg3Z2t2YjlDWlZM?=
 =?utf-8?B?Q25kUDRRYTFndm1sSTNkejNFR0xTT3p6ODg5RzFtZGV6QWl6Rm5EZExFa3Nl?=
 =?utf-8?B?WnB6dFYvaHIrOWwrTDNLVUUrc1R2MTZiNExGVjUxbnY5enZjOERWc1YwMWlM?=
 =?utf-8?B?QWI5TFVmRkpDU2NhbFN1YlhBMWlzaStndVVKeWFWSXJ1c1BPOFBDaU14UmlV?=
 =?utf-8?B?dDI4SVB1M25nalpVeUpkSFlQSW80ZmRWK01kRDJHWjhPZ0cvdDRUV01PaHda?=
 =?utf-8?B?d1ZJMENudkt1REcyWHRXZDQ4bHBzTFc1NWtQbjV1QW9DODdGcmxMc05CQnZC?=
 =?utf-8?B?ZzAxb1dZb3B1RlVrelQvZkZwU2NucnNad2NBTk1FMTdSNVN2YjBWWlAzZVVX?=
 =?utf-8?B?V3ppaUNFTnNadldGTFo4UmpoeXR1RXdxNmpsOVpFL1YraWswN3Jac1o3bEI0?=
 =?utf-8?B?dFBWbU9QZHJpNXU2MWxwWFh5UXJqc0V3UStBMmczdys3ZHVPZmtxc3dZZDIy?=
 =?utf-8?B?ZU5PMDhsR1Z0alJYRzFCYWlpSTV4WUtUc2dmZUxVaFlHMUhzNUxsZ2dmSDFR?=
 =?utf-8?B?eGlIdGo4TDZWQTIrYWh5UlMyTW5DWVZVSzZRTWtVcnFwWC9Id1BwRk1EanJi?=
 =?utf-8?B?Y21BWTFCZk9kbTdsaDhUVmF2N3RIR3dCelVESys3MEVwU2kyNElVek9YWVBp?=
 =?utf-8?B?c2JFb2F1eW5iSlFzK0VpS2lKS0hDNHFPbGRnRkdPTzdDZTdQTjFZaHYvMDNB?=
 =?utf-8?B?dStmU1QwcU1nNnhBc002UVczME5RM0tjMHgwMnJJNS9FVW5HQTQzWHJtN3dJ?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a76e85c-37bf-4e27-a92f-08dcc1e4a0d6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 13:24:47.5930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPeF+4L+O+oilFSL1kkrFn0pIqsef/C5yBAGoJGvlPqblqoKNor3DneP1RVejRJbn05V7lXp7wtqhMnz6DqZbZFUZzXNyL9CcL4n1MyE78A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5817
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

On 2024-08-21 at 14:11:57 GMT, Krzysztof Niemiec wrote:
> From: Chris Wilson <chris.p.wilson@linux.intel.com>
> 
> Based on a test case developed by Lionel Landwerlin, this exercises
> creation of partial mmaps using both direct methods of a partial mmap()
> (where the mmap() only covers a portion of the object) and
> munmap() to do the same.
> 
> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Please, ignore this patch. It has been sent as a result of a little
misunderstanding. I will send a proper v2 later.

Thanks
Krzysztof
