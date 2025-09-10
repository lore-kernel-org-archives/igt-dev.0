Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9038FCA101F
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 13:18:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3104110E91E;
	Wed, 10 Sep 2025 13:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k19J6wqg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961CE10E2D9
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 13:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757510287; x=1789046287;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=7gjI9ZSmWlr9f/SiDxUTJ0uCzPjM+sx8rUkWTiMRT8Q=;
 b=k19J6wqgK18vpzf5FbcTCm1rfyDgf1rDrf5Hr8yg8ZFinNKQKy9QFs4X
 ELEIGtwA45gJ/UbzYsobMcp3IbKu2igGhOBOk8fseHsMfM6N4xVfNw7M5
 eYe9ErM4/rUjLDEinLl0RCwx+uoPi3JByUWbVNYXNxotA9ZkiYx5GyNpy
 UbqwEBQORous060yNzsKFfxTFvduezGEhuCcuUfU4kSVFoVArihWoebQ6
 r2W/P5Fq5Vj7n5bKiXN8gSdUB1xB0ilJccl+qWfEu4RHwexs2tSdzUtsL
 zZHlcMOx6hIMOuMZNfCSEQ4AEdklXFSR9cGM00RzP6k6Gb7heF9SgT6Ig g==;
X-CSE-ConnectionGUID: Vql7nY1TThiOKHBskHT6yA==
X-CSE-MsgGUID: 6jNKiJ+YSRKezIeQu6ipPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59767664"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59767664"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 06:18:06 -0700
X-CSE-ConnectionGUID: 8oh3NIUITRe5NSgK/p9kBQ==
X-CSE-MsgGUID: 4Q49TlQVQoGgQNQW0oe5SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="210504895"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 06:18:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 06:18:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 06:18:04 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.69)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 06:18:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GKzIHS22aUChmtGmeJiKq1yT0odq7ZY8bKmSa+j5eRp1UyrR6vqlsTy2SzsJ2NscM/Qou/No9WtLFilm1bUsW+av8Dx40PFMMIiW0V6spkcSEsc+l9YOZYZprtyvnSstlls7JAoutdeYm7AJZwTaEeb9iQzOCW1vI38grlBFGISXKaB48uykm1dFVStWvzmNKCJKr3M0sIhI3X88GPcjQWTmBwU/+KsiDP7i+L+unlaFM9zh/CZ84Bcsd2u3V35HfrCodTPqObuCI+Ml8+sGQIlrH+jk1jJv2BxjIpF9y9hGr+1tiAfOT4/xUTGxEJeGfF8mM9t6PDkTojUOnTwjaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PlrcheoK6Behsaj3nVb8dLY0tM3wEs9GFx/E+FnLMD8=;
 b=Kya6E0z7UsRskGqFci1vNBppLUSLgf2UQvDPyjguClQnPXF4wENPG1NrK75VK9guxr2ebP43SW9NG7v8g0Sx4TJXp6hx/WAtvw4EYnskSm+5+A6WIDjoDrLt1zxGje9ATmxWf8a9tD/iprQxqEhHGpOKZMpl2JRyEw+UUuWbfa5+vqEX7i1Vwwno1jMteB7HxMgaftcDTJeQq3/PKzs2O/vP3FnIHWHe4NaH8Ym7y+omtKy8SchLuABZRgFUCew2M+Th4epzbVCwrv/litQ8Jc4GMNg69drYiWHr3ieO3UtNJ/PhnAWykmFkTvtY/TNxmE95S/Ev74Dr1iSkyOhw4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by CH3PR11MB8093.namprd11.prod.outlook.com (2603:10b6:610:139::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 13:18:02 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 13:18:02 +0000
Date: Wed, 10 Sep 2025 18:47:55 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Francois Dugast <francois.dugast@intel.com>, 
 Daniel Charles <daniel.charles@intel.com>
Subject: Re: [PATCH] tests/intel/xe_exec_mix_modes: Fix, refactor and cleanup
Message-ID: <aMF6g_jTDt40Zq6g@bvivekan-mob1>
References: <20250910123946.1144932-1-balasubramani.vivekanandan@intel.com>
 <20250910125257.vshhygh3iq3ir3rq@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250910125257.vshhygh3iq3ir3rq@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: MA0PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::8) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|CH3PR11MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c9d2c26-7e42-486f-7ea9-08ddf06c7822
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFRGU3EwQUhDbXFTMGU3VlhtNmtPK2dlNktFV2VKaEl1RVZvVEpqZGxRU3NY?=
 =?utf-8?B?MDZyMlA0YVlNcGc0c1hnbmIzM2dNcExiUVhxRkMyMnk2dUtlaHZqVGEyN0dQ?=
 =?utf-8?B?QW1Icjl2YTJINmk2YXlNTzdJcXUvd2I4NE1CSjdyd1k3WXcwMERINlNsWVVP?=
 =?utf-8?B?T1BvTC92UnM1bDZHYjJrNUtlRWtqbk84cnB1dkRIYll2Y1Z2WHY5M2J3dnYy?=
 =?utf-8?B?TGs0aHBmZld3blgwMmNUbTdObkgvbWk1VlRoQ0VpbUFPUzZvMFovQVRMWFQy?=
 =?utf-8?B?RGI1VUNHM052cnM5WFYydGF1RVU0d3VmMVJLdkd0aGs5YlRXZ2FzeUYvTnZB?=
 =?utf-8?B?cWdVY0xneTB1YzJ3MU03eTUxbldaRmJlNzlMcDJWSmNnTFMvQy82V1ZvRUNv?=
 =?utf-8?B?LzJ4bXFqeEVnVXBJdVBEV2tyQlJSYjZ3cUJTb2gvL0tiMmFnTVMvcnlDN2N4?=
 =?utf-8?B?L0JvYlNLL0lzaGFZRGd2MUpFV0hMNXl3ZkRmOXRueC8rOExDS3RlWkZMVWcy?=
 =?utf-8?B?YU9GUjIyazA3bTJnaXk1dUVvcVBaYUtBU2Z4Q1lCQjZhTjlXQ2IrcGJKZjJK?=
 =?utf-8?B?VE9nZGZiM2U1VWJVVk13clFCUTdCZ0o2ZGRmOExtY0NRdGVFbHF0SVp1Mm9D?=
 =?utf-8?B?Y2xRVXAxb1UxYXR5MEFoaXhPZ0tvbEJMeVlUZDdsT2I3YzRwM3A4Sko1WkdM?=
 =?utf-8?B?VWx4UHdQTllMZFhEdmpIM211MjBPUzhEWkovWXJiQ0ZSOU4vejdnYXJnVWYr?=
 =?utf-8?B?d0xsekJHbFdOT1VDNmo4a1NZMXNTV0dxSE9pOEJ3elgzaEY2YWN4LzFuS1JQ?=
 =?utf-8?B?UUxlWE5CeG95ZzRuZlZlcitUTVpXUW96UlJoS2ZvR2R1VmR4UUhBazNsaENV?=
 =?utf-8?B?MS9Yak9La1k0QXdoaGZnbC9PN0JKc0dhNjBoeEE1WVdGbjZ4c2FlNWk4UkNP?=
 =?utf-8?B?MmpXKzdUN0tnQmh1MWVaSFpSaXVyYU0vZ2ZRbjJLc0I1U1hhTGx6WHRmaWo4?=
 =?utf-8?B?QlZWcUNaTlR5WitLOUl0QjcwY0NxaTlwMVBUaS9ndXJKV1RRWFdNVGJmZ05C?=
 =?utf-8?B?Ky9aa1VyNmdqWnhpcFk4d0oxblBleUxsUkZGc2h6Sy9QVWx0WUVnYmRFVHJz?=
 =?utf-8?B?ZGRDWTR6akwvM2FTL1l3TktxZ2o5bmNNdGo0SndCUVFxTG5zZG1rZmlZMjMx?=
 =?utf-8?B?Mk5Ca0hueDNyYVp1eGZBMXN6UmM4Z3hYMUdHWm01SW1aT3BDeTduN2YvckZz?=
 =?utf-8?B?TWgwVVBSeUthQ1J3WWwyOG94ZTZHMUFHT3pxTm5pSENIYmJzbzlVb2tpUSt0?=
 =?utf-8?B?RkNQV2Jpa0xCbEZteTh0T21MaFIyNkNrbVhlQlpMOVk5SUxUcDRlN3RBdy9I?=
 =?utf-8?B?TkVpV0tkNDQ4MWxWTnRLMFZObDN6QXJIRUVhUkVkaFFEMkdLQVozZERDRFhZ?=
 =?utf-8?B?RWhmOTRwcmx4MitQT0xhTVI3U3RNLzdhSXhYTG92QWZCQVkyT1luc1BmZUNH?=
 =?utf-8?B?MjVqSzdxeGgyZEE3MWx6cEVBSVJ6TXdyL1N6K1ptQ2RGajluOU4wN3MxWDJN?=
 =?utf-8?B?cHYvbzNsN1BmYjZwaXdCc1N6c01TdVRIYXlLZUxnU1o5dE1SVUFoWXplRFBs?=
 =?utf-8?B?bjdHWE00RDY2cVhJeDlZZklHbnRHVGhmV2RMd1dJcWFNUFBQeTNsR0RPMVF4?=
 =?utf-8?B?c3FySndkZ0d4RlQrbEQvYy9mSGtjOHM4ZVBlWTRBRHNEVG14bmllR0ttL004?=
 =?utf-8?B?empGb0ZPWTBKNjA5akJteUUzY1NYRlp3cUVJSjN4d1dkbUpZbks3cFhPYVhU?=
 =?utf-8?B?ekJQY296cVNuMkthdUpsRTI5RmVvaVBMMWVuVnZZV2tjaGUyeGJlZklVM2FD?=
 =?utf-8?B?ZFJSTDBFZEVZcVZibEt5dDQ1ZjI1M3lxWXFvYkVBZ2pRdFBtTmhNbWwxd042?=
 =?utf-8?Q?dMm6NzJkD1k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWJ1NlJ1eHRPK2FHV1c5cGtJYVY1TkphQTg0aHhkY2c2eW8rUEdLbGlXNTNR?=
 =?utf-8?B?NDIwck1hd0p2aDhlT3JjQkRvWEw0SGtvVGVMZ2xIdUI3clM2ekNGV3F1MVR1?=
 =?utf-8?B?UklLakt3ZlhNNE50REJEZnNzMnpxbVB0QVNHckhYY2lCLzlIUzdyMWI1eDNr?=
 =?utf-8?B?eUFjcW5MSG9ycEpjK1hSaGZLQVN2RWJyZG1zakVtVnRJSVlrRjVXeXV6Z3cr?=
 =?utf-8?B?SHg3RUJZTytMTjRrRmFFa2lCczA1Wk1vc0dZbkc1TGxiWGlZdmZRQXhZRjV1?=
 =?utf-8?B?Y2VTQnNqQ2IvQ2k1d0wxd3lxU2xzK1hTck41USt3TXB6eE1OTTl2NFNRbWZT?=
 =?utf-8?B?S3FEdXFKSXVadjkvdTE5TXN5NDlDQUJMNkVJbGs2UnA2dnpVNDJuenJ4NlFH?=
 =?utf-8?B?RS91NnF1OVJPL2NQQkFFajZGcU5vZ3UxR2FCSjNLVmNOQVZnQVY3U2RIWS9H?=
 =?utf-8?B?SlJMcHExMGZ0R09rZGhVL08zQjF5U0JWY2FDSVh2aUlpYkdheWtTZ2xiTjRL?=
 =?utf-8?B?VDNHNGNvb0FjV1JuREk3V0ZsNkJkMlBBQzduSDI1amFwQzZzZktOMFRmdjU1?=
 =?utf-8?B?aXd6azg5Q0xhYjZZamtScnprKzRyUm9tNWthVktkMm9QRnI2bldlc2xVa1Vv?=
 =?utf-8?B?cVJGWUFhd2F6RVYvYUdJMytxdlEvREpnOHpCL3FWaTIveE01T014N0tETVZC?=
 =?utf-8?B?MThyeUdxOFAvYzNNQzk1T29Mc1ViYmRwaFJIZ2NtNWt1dUhVREREbFVXWTQ1?=
 =?utf-8?B?Tzk2Nm0xbUx2ZmNYdFdnVkN0KzJJam9EWVhHTWdxbXBpZ3pzdVg0ZU5Hc0ZD?=
 =?utf-8?B?WlpsVVQ4S056ZlJQZlFZRDU2SlpqM2cvOVhGemhuaTRibUdxZFpIT1crc0o5?=
 =?utf-8?B?YmxuWmMzT3IwOWd3K3I5NkxEY2pNcEwyWTBHcVlrcWs5SWdYVW15Slk2SmIy?=
 =?utf-8?B?Q2dxSlk1UGFybFZ5T2Z5ZnFQUnhoRFBZWWRlcm5DcDZhLzRJVXliYzhkY1BW?=
 =?utf-8?B?UGdyTUFQOWtOaVo3cnpLODFwV1hGV1NCTFlva0U4L0ZDSTFpdmpack9jWTVB?=
 =?utf-8?B?TDU0Z1pOeGg4Rm1QQzV0bG5lM3ZneVhkTURKYTNFS1k3TGM5VnVmRTBNSmp1?=
 =?utf-8?B?NEJ6NER1S2xETERBa282WUR0OHYrMXN1N1llLy9JNW9FL21lMmxGRHFLMHlH?=
 =?utf-8?B?TjU5U2Jia1M2dHhaY28yaFp2emNEY3NRbkJqMVhZT1JDT0J4eUs0Y1preVJT?=
 =?utf-8?B?VVp6TWlNOHFVaWp3UTVGak1QYkUrOEpSbnVocXpyS0lFdXBSY3FmeW1RY0Nh?=
 =?utf-8?B?am5icVNzZHVXcEI3UlY2cHRyWU1HbFk3S1FWNXE4TmlyWHFFbHkyVGVpZEhN?=
 =?utf-8?B?d1VSY3dVZElBVDJrZk9ZMlorZ2ZqUzhmTDJZK0w5cGI1eUZuN1FJN1dSei9r?=
 =?utf-8?B?VG9Qc3hMNVowSlB3Rkt2bnVaYmZRU1Vrei80V3RDVmJ2MWtSc1ZubW82MmVC?=
 =?utf-8?B?Nk02VitDM241Y3FXWjJSczQ3R2hwakNjWkJHOXZ6VS90dDgweDJ2d2RoazFa?=
 =?utf-8?B?c0xHcmdZQVFmbDVQM3dyazdKcG9ublh3WFkyS1RzY1dzRVR6alNndXlKTW1X?=
 =?utf-8?B?dWhSWnBQaG5oUnR5R1VMN3FEZGFXQjRmeEhPdFZvUVUxcjdESDlHRHpYRlBz?=
 =?utf-8?B?UFAwNXdyNTNwZnhrYkFEdUhtUE9udWJtZFNjMmg2MU53ODFpOXM4YUNDS0d5?=
 =?utf-8?B?RHFjeU5EdHlwOFJ2MlBzY0lXaXpCVURJc2J4Tjd4Vmx5MzA2a1FzdS9QWUNn?=
 =?utf-8?B?K3FrZURncFdrNEdac3lpNFZEZDZZRUVxVDZGeEFMM3Nwd29JbDh5cDlHdmxq?=
 =?utf-8?B?UzVQMCtwcndlODNLTVg5NkNrK2thV0duaUNRcFhobUI4Q056S05UalIra1hi?=
 =?utf-8?B?WXIrczhWd0d5bEp2NmU3aWY4WURDY09YN05FUkJEcnRNM242YVpvUXFWUkkw?=
 =?utf-8?B?ZUZuZEFtWWpPMUFtVTl0S3dLejBSZUE3WEp6MFhvWFUrQWplTDRtUHBDTS9F?=
 =?utf-8?B?eG5RWHlTMTExTDkvazYxUGUrNWpQTXlQOWs5MTZUd1hGelJyK0JHQlRrOTU1?=
 =?utf-8?B?VVd4OXY5YjhPQVVENmxpZlpNa2dlNExveDN1a3ZIY2JuN2NMMzZqK1ZMM01Q?=
 =?utf-8?Q?2K+GfVproWKhyAg50PKPlY0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9d2c26-7e42-486f-7ea9-08ddf06c7822
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 13:18:02.3093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HjtXJ59DOutKLSmLGWgJ8Y8ekxhC74asw7LTEaMGxnlARpHWl74wXvbSA0lw75JKmV1Ai2R1JcTMNqA3RyR6NfgaEEsHhA1ab/Ljb0vEHM8O5GbDPa177odJlGNPOgE0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8093
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

On 10.09.2025 14:52, Kamil Konieczny wrote:
> Hi Balasubramani,
> On 2025-09-10 at 18:09:46 +0530, Balasubramani Vivekanandan wrote:
> > After the recent change of xe_exec_mix_modes, fixes were required for
> > the following points
> > - A local variable spin_arg was used uninitialized.
> > - There were some variables and macros left unused.
> > - There was an unnecessary loop.
> > Along with these changes, also some refactoring done to simplify things.
> 
> Is it a revert of recent changes? If so, it would be better to make
> it a revert + fixes, e.g. in two commits.

No, it is not a revert. It is an improvement on top of it plus a bugfix.

Regards,
Bala

> 
> Please write all Cc before s-o-b:
> 
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Daniel Charles <daniel.charles@intel.com>
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> Regards,
> Kamil
> 
> > ---
> >  tests/intel/xe_exec_mix_modes.c | 101 ++++++++++++++++----------------
> >  1 file changed, 52 insertions(+), 49 deletions(-)
> > 
> > diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
> > index e65854d0d..b74247bc4 100644
> > --- a/tests/intel/xe_exec_mix_modes.c
> > +++ b/tests/intel/xe_exec_mix_modes.c
> > @@ -28,7 +28,6 @@
> >  #define FLAG_EXEC_MODE_LR	(0x1 << 0)
> >  #define FLAG_JOB_TYPE_SIMPLE	(0x1 << 1)
> >  
> > -#define NUM_INTERRUPTING_JOBS	1
> >  #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> >  #define VM_DATA			0
> >  #define SPIN_DATA		1
> > @@ -96,9 +95,12 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
> >  	uint32_t bo = 0;
> >  	unsigned int vm_flags = 0;
> >  	struct xe_spin_opts spin_opts = { .preempt = true };
> > -	struct timespec tv;
> >  	enum engine_execution_mode interrupting_engine_execution_mode;
> > -	int64_t timeout_short = 1;
> > +	/*
> > +	 * This is amount of time the test will wait on interrupting job fence
> > +	 * to confirm it wasn't scheduled. It is set to 500ms.
> > +	 */
> > +	int64_t job_wait = NSEC_PER_SEC / 2;
> >  
> >  	if (engine_execution_mode == EXEC_MODE_LR) {
> >  		sync[0].type = DRM_XE_SYNC_TYPE_USER_FENCE;
> > @@ -153,55 +155,56 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
> >  		interrupting_engine_execution_mode = engine_execution_mode;
> >  	}
> >  
> > -	if (allow_recursion) {
> > -		igt_gettime(&tv);
> > -		for (int i = 0; i < NUM_INTERRUPTING_JOBS; i++)
> > -		{
> > -			struct xe_spin *spin_arg;
> > -
> > -			if (job_type == SPINNER_INTERRUPTED &&
> > -			    engine_execution_mode == EXEC_MODE_DMA_FENCE &&
> > -			    interrupting_engine_execution_mode == EXEC_MODE_LR)
> > -				/**
> > -				 * In this case, jobs in LR mode are submitted while a job in dma
> > -				 * fence mode is running. It is expected that the KMD will wait
> > -				 * for completion of the dma fence job before executing the jobs
> > -				 * in LR mode. Provide a pointer to the spinner to the interrupting
> > -				 * dma fence job so that it can check that it was blocked, then
> > -				 * end the spinner, then check that it was unblocked and completed,
> > -				 * see "if (dma_fence_job_spin) ... " below.
> > -				 */
> > -				spin_arg = &data[SPIN_DATA].spin;
> > -
> > -			run_job(fd, hwe, interrupting_engine_execution_mode, SIMPLE_BATCH_STORE,
> > -				false, spin_arg);
> > -
> > -			if (job_type == SPINNER_INTERRUPTED &&
> > -			    engine_execution_mode == EXEC_MODE_LR &&
> > -			    interrupting_engine_execution_mode == EXEC_MODE_DMA_FENCE) {
> > -				/**
> > -				 * In that case, jobs in dma fence mode are submitted while a job
> > -				 * in LR mode is running. It is expected that the KMD will preempt
> > -				 * the LR mode job to execute the dma fence mode jobs. At this
> > -				 * point the dma fence job has completed, check that the LR mode
> > -				 * job is still running, meaning was successfully preempted.
> > -				 */
> > -				igt_assert_neq(0, __xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync,
> > -								   USER_FENCE_VALUE,
> > -								   0, &timeout_short));
> > -			}
> > +	if (allow_recursion) { /* Main job */
> > +
> > +		struct xe_spin *spin_arg = NULL;
> > +
> > +		if (job_type == SPINNER_INTERRUPTED &&
> > +		    engine_execution_mode == EXEC_MODE_DMA_FENCE)
> > +			/**
> > +			 * In this case, jobs in LR mode are submitted while a job in dma
> > +			 * fence mode is running. It is expected that the KMD will wait
> > +			 * for completion of the dma fence job before executing the jobs
> > +			 * in LR mode. Provide a pointer to the spinner to the interrupting
> > +			 * dma fence job so that it can check that it was blocked, then
> > +			 * end the spinner, then check that it was unblocked and completed,
> > +			 * see "if (dma_fence_job_spin) ... " below.
> > +			 */
> > +			spin_arg = &data[SPIN_DATA].spin;
> > +
> > +		run_job(fd, hwe, interrupting_engine_execution_mode, SIMPLE_BATCH_STORE,
> > +			false, spin_arg);
> > +
> > +		if (job_type == SPINNER_INTERRUPTED &&
> > +		    engine_execution_mode == EXEC_MODE_LR)
> > +			/*
> > +			 * When main job is executed in EXEC_MODE_LR,
> > +			 * interrupting job won't end it, main job should take
> > +			 * care to end the spinner
> > +			 */
> > +			xe_spin_end(&data[SPIN_DATA].spin);
> > +
> > +	} else { /* Interrupting job */
> > +
> > +		if (dma_fence_job_spin) {
> > +			/*
> > +			 * A spinner job is executing in the DMA fence mode as
> > +			 * main job. Until we end the spinner explicitly, the
> > +			 * interrupting job won't be scheduled.
> > +			 * Make sure the interrupting job is still not completed by
> > +			 * waiting for on its user fence with a long timeout.
> > +			 * Wait is expected to end with a timeout.
> > +			 * After that send signal to end the spinner job. Once the
> > +			 * spinner exits it will make way for the execution of
> > +			 * interrupting DMA fence job.
> > +			*/
> > +			igt_assert_neq(0, __xe_wait_ufence(fd,
> > +				       &data[EXEC_DATA].exec_sync,
> > +				       USER_FENCE_VALUE, 0, &job_wait));
> > +			xe_spin_end(dma_fence_job_spin);
> >  		}
> >  	}
> >  
> > -	if (dma_fence_job_spin) {
> > -		igt_assert_neq(0, __xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync,
> > -						   USER_FENCE_VALUE, 0, &timeout_short));
> > -		xe_spin_end(dma_fence_job_spin);
> > -	} else if (job_type == SPINNER_INTERRUPTED &&
> > -		   engine_execution_mode == EXEC_MODE_LR) {
> > -		xe_spin_end(&data[SPIN_DATA].spin);
> > -	}
> > -
> >  	if (engine_execution_mode == EXEC_MODE_LR) {
> >  		if (job_type == SPINNER_INTERRUPTED)
> >  			xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> > -- 
> > 2.34.1
> > 
