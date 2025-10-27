Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448EBCCF9E0
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 16:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E847910E4E8;
	Mon, 27 Oct 2025 16:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C+RBoNQf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C6B10E4E8
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 16:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761581699; x=1793117699;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wfZ0go5EFldxJsUgzjnIUDrMaIiztCel7BZfZMAyx4c=;
 b=C+RBoNQfXnxgBfBJleYPlkFNLTZYP91oPaOWd9Dc/KPL3BuIxQ6DYDQz
 to2V3xgltQ8XdciFBIcyG88M89l1TryZzusUS/caFl407AInpisRU6lcq
 rmF/TEDGsBWU9UnCctE+/Lwo3OKs7i6apJSk1WjXdglSDWWXI/ZcaSm/G
 oB6F057q2ydN+yIiRuu3egqbmlOZNaXT0xlOMxsuNaq1G1sjI3XGk09ej
 VvN6VcWxrV8X/Sn+3U+RiB+Ny/UHOHXFqdhIIMbXVGudPzJJRUg3vFHG0
 qmPMph7XaHGa1U4S2lRagtiN8K+L1PndzXYqYl1bDWZsnnc15YhZl8mov Q==;
X-CSE-ConnectionGUID: PMx3nZRFRyiio3zAg+uJ5A==
X-CSE-MsgGUID: qGblZ4GwQLWoLp+1Zh/tsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63703253"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="63703253"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 09:14:59 -0700
X-CSE-ConnectionGUID: sMF6b0NBRwmvmFpcqnyjTA==
X-CSE-MsgGUID: tSdrXYyUT/uFWjldcP9xrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="190294083"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 09:14:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 09:14:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 09:14:58 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 09:14:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=skSbHeVTPmtGPV2BLAC2APui0u0IQNYHeRlIiOxuANAQf7pwSVTNJ65WSVPbsH7C+Pc+US8HDP12FS3BtAQE/5NfeaB6fwp6h0MBWq6pZPYd3JwmWq4fCnQdbaEoE/1fGVbLZTAJp9B4/SL1f0ZBJhfXNozvK6ISvP+TzWheinei2ZJOENnx9ioeEJY1bPNyru/Z6EV8oCBGLsfIA3y4sRQQrRuzbfVfeqOazdiS95Ww4XqDzzJ8Bbu2TuZYFZlWM0eLAP5AFqCS44COMT9lnE7d0b9mfDRp+o2eeENxu0TVKTxBA8V0tno5N9I8HPi+ovhE3OBhQeIMBDWpVTjdBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAcx/oMBssfz6cBRKKE2h3H0OPVJdQG0wyRAIkg2U94=;
 b=GQ8gimuXHSjI8aMkgvlkjPH89x5ADgB195XJtz7zYLW1pxWoJXV0TyTslCfRX0SwZAd5xb4n8lLrwRr/eGyBUlhBeUgI1lzIm4kM7YR6VnqaoQ2Kpq8eKzVoELdPYcPb1cPw0tZgYyxNlnaVgrlOYz13ljUlV+MRJltTheB7aFFixwvJ57YRRx3OWNsRh77l6q7m7ZAj75ylKCwErQkkUNY9tfY9GWrfOO4KxBwupCm+tyXE3hJ8JtZYbv8O/nRjQG7BnuIyB8ESVx9kg/8mXkauhGX8EQAL0kYdY6zgzvoAjMCnGCzC05WrRT/cupUuCcV3KfxgGo8rbkl8sulbQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM6PR11MB4659.namprd11.prod.outlook.com (2603:10b6:5:2a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 27 Oct
 2025 16:14:56 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 16:14:56 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>, Jan Sokolowski
 <jan.sokolowski@intel.com>
Subject: [PATCH v2 1/3] lib/xe_mmio: Introduce tile-level XE MMIO access
 helpers
Date: Mon, 27 Oct 2025 17:14:38 +0100
Message-ID: <20251027161440.2906378-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027161440.2906378-1-piotr.piorkowski@intel.com>
References: <20251027161440.2906378-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0257.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:86::20) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM6PR11MB4659:EE_
X-MS-Office365-Filtering-Correlation-Id: 49df6002-6f3a-4c08-aa27-08de1573f7ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3ZIU1JueFRuRlQwS2NqdFBhbUxjYnRxZFUxZ0ZqbEc5TWNBR0xlZEhQY3Ft?=
 =?utf-8?B?QzF2U2haRWRLZW9kMzM1OTUxWlRYN3lFNXJHbS9LTk9JUWI5R3RVcFVvYUh4?=
 =?utf-8?B?K21uR00wTHlSNk1qL0VSRTkxNldMejc5bnpsVUNnOUt1U1VnVjBrZmVYREJO?=
 =?utf-8?B?Mk85QzNDd0pZVUVndk5lYzNnejRuZ0VjV1FTWDM5Um5nOStQOEN5bnNic1Jo?=
 =?utf-8?B?UVNzNDFqaG1BYStIZWJIWUZ5RlZ2NjJFNGNDVnM3cEVDQWt5ZXpwMlhuRllp?=
 =?utf-8?B?VFBXWUJLREFwN3UvdnJRQVQ0Y1lUeEZZWUI0eUgrUlhxY1VNYVFybGJINnRt?=
 =?utf-8?B?cW5nQXNyTWV0SGg2ZHZReTdSRlk4Nk50SEJMWVVUajJnSCtPQTZJc3IyR3E2?=
 =?utf-8?B?UU55OEE0bk0rWmRxYkMrQWdmVTg0WWJXSUVJYTdUcHdEa20wclpPYkpmK3RE?=
 =?utf-8?B?blg1U05udDk4VExNUnRmMHNKM1NOaUFSb2owbUY4ZlRmc0VTU0R0a01xaTd6?=
 =?utf-8?B?UmxJaTR5R0JPaGdjMnRaYkFCbXJRRTk0UDZLY0t6cDB2ZW5teVh6ZjFtYTBF?=
 =?utf-8?B?dnYvcTVFbHZvQ2RkQ0lhUUp2aklESk1XTWJKakxiZlNKcHQ2cmY2cUc2OGEr?=
 =?utf-8?B?NTZFT1prMVZiV0J3bGtRTXJxY01nVjFSWlAvME5iN3dxMVJHMTlqUGVtZGVo?=
 =?utf-8?B?R0l5a3FSUjdMbHJhY0g5Y2xXZ2lMWmtKYmJqaXNKTWNac1cxVWZjSUM3N3Jl?=
 =?utf-8?B?RHk3REh2S0hEaUZUYlJpQ3RqK1kvYzFqc0U1UFQ0aUVucG4vVCs0aFZKWCs0?=
 =?utf-8?B?bzBaSlZsbDIvNm5nVFdseUdBcVdZQW5ZVVZSUkJuQm1FSWRBUzhKa05PZERk?=
 =?utf-8?B?eDcwUW5XK0VGc3RkMCtSTm4vSytYZXJ3ejNrSEp2a3c3c25Fc3Y2RXdpTW1u?=
 =?utf-8?B?L0JTYmN4NnBZdEtMZ29vdXJKZDFmbnRQL0w0RHZzSWp5bjdVcysyblE5YWFz?=
 =?utf-8?B?eW5pSXN5SVNlOWtEOVZCaGYvNGRGTGsrU0Z2UnkzNnovRndZVVNZYU9nNUdG?=
 =?utf-8?B?SFIwWkNiMnBpRDlVYmEyRGR4cmNFREswTkJpaVd0aVVobG9PUUk2VDJYTjdF?=
 =?utf-8?B?eWREVDhyL0lxWXliRVMzRys5Qjc1cExiejB0QTFFeDYvVlZTQVhWY1FBQVBs?=
 =?utf-8?B?TlkraVVQY0duMG0rTDFrWUR2bmgwWTJTODBGQnBtZnlNa1JhSjd1MWQrVC9t?=
 =?utf-8?B?ZkZ5bjJWZUZRRFdGb3pmdlU0RitmcTc0am5DakxxRWJudDBUV1RHWGdFNkVi?=
 =?utf-8?B?U2FJUFpCQXd3V1VQYnRHQ2NhejB2UmRjdjdpckk2U3hsczAyK2ZwRHhyMUZQ?=
 =?utf-8?B?eVlLYVhNUDJXZ1RNdGdINjZUT0pXOHpuVEJGeVRVVEV4Zm5yQjBTL3pxaTdl?=
 =?utf-8?B?N0FRbGo4eEwyaEs5SVU1eEtGY0UrN0tsdVdLam9JWmRZME1TOTB1SFZXN2xM?=
 =?utf-8?B?d0l2eW5Jc3JOMmpNVzdzSzVZRzJNUXR0elBXMGFPTmRWNElqOXNPN0N6VFZz?=
 =?utf-8?B?V2ZYUFFmZWU3V1B1YW9hTHRhMW5LdFlpN2ptcm1pRTJrbmpaemZtbjZWT09D?=
 =?utf-8?B?SUsyenZ2c3JvWE1uSEtsNGtOS0Z2c1orYWliL2xzTnBpNWtkcGVpYis4Q285?=
 =?utf-8?B?TUV6SnpGQUtpK2lMNTRwdE9OM3N3UFc2eWl2SUw2emxFelo5S1l3R09tOVZO?=
 =?utf-8?B?cTFwZmNvVUJZM3padzVIcS96WFdWM2NpSDJuM3hqY1duSDBQRHc0N3lFNEFh?=
 =?utf-8?B?S1FTaDJnaTlzakQ3WEhydmoyUUhJbVZiUVV6V3dqeExnbE54UlRmUXVWWVNM?=
 =?utf-8?B?SE12ZFNiUlJTWHc1U01WRU9qVzhLU1VLTFNpcHcyN0hocDhKL1dRM0pnUHV1?=
 =?utf-8?Q?teZCMKzkR5faIS4KLRiEtV/Y3t5y7awn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjB0NHNBU1kzUnJsSjFhWjAzTlRGcGV2WWl1UldYSmg2ekFRWXBiQWRxNFcy?=
 =?utf-8?B?QlRPcmJNbmdnQ1lxR1R6MS9iRDZyNlV3YkwrVHo2YWhvOW9qS3VMUUpNNllM?=
 =?utf-8?B?ZDFvSWprOW8wa2swRC95c1RJUjV5YzBNQUtFS3JPVmo1M1pMSTRjUFpUYjVt?=
 =?utf-8?B?RHRHaU83dTJqWkgvejRPV3p2dU5NS1gwZkdRY1NLdGlGUDRFSFVKT1o3Y2lo?=
 =?utf-8?B?dGNWK24yMW9lMXhnaHRneUJtdlkwdi9ydkFvdDY3UUtzREFqUVBnSFF2MjZj?=
 =?utf-8?B?ZWpjQjdYdklLVmM0aUdQVWNFbmR1UGRsbjhHcktxb3U3NDlPYS81bTFlNTFu?=
 =?utf-8?B?Y2dJRHB6SENwSlZVai9oMXZwcEVjMjdNaXR1WXZuczV3RlZVVkt4cjRUUjBT?=
 =?utf-8?B?b1ZlemFXUDNhNk1kaEloaTJQYm1DRlgreFBHL1ZnQ0VkcGFkeVRhalNIeFJn?=
 =?utf-8?B?TWsvbDNZbDVJLzJnbHJVTCtPR0x6ZVE5ZGFIaDBSWk1KT0ROdE5lamV5L09X?=
 =?utf-8?B?VERDd2k1alhHVFlyN2E3clJpYy9WNnRCQzJ6YURDMmRrQU5iL3UrOWs5bzF4?=
 =?utf-8?B?eElqcXZaeGRkY2loRWZsUFJTcXRQU1NKcTV2Rlc3T2N2MTBDNmRkL1hjdmta?=
 =?utf-8?B?RWg3UGx4Zzl1UGMyM1JCeFZIUm9oUEpXdEJLWEFUMlZyR2Z5ZEQzajlIeW9V?=
 =?utf-8?B?VGVjZUdSYWdCOW55TzNZVUN0N2h1OThKWGJFczZ4RHJTbzhKeGl6cExjZWlZ?=
 =?utf-8?B?U0E2bW8rUjBPUVQ1OGdBQlZSTTBwbzFhdUNQUDN6L0xkV3g3TVdkd3cyNTEr?=
 =?utf-8?B?YUJUMk93Q3AzenpTS28rYzVJSkxLOW0wTUh4WUp4WlcrTG5NMDVKUWpEYTlz?=
 =?utf-8?B?cllpaUZDUGlyQXNQa0J5cXgzdnlXckJxOWt2VWVqMGRaOEhnV2JObzNGTVho?=
 =?utf-8?B?VVZMclFndVpESGc3S21QV1NaTXcyY1VLeFlxeUFsUXBBY3czVzlKVVQ0Wi9O?=
 =?utf-8?B?KzZaYjBFZmJ0Q085Q0ZESFEyWmtiUW82Q1ROeE5XOVJZTzlmeXF5UFVZMW5l?=
 =?utf-8?B?WERqa0lUNXZTVWNpYzZLYWI5TDczTldEQ1VhdWk3bG90TTNaSXZSOXFvd0kw?=
 =?utf-8?B?eDdKRW9RUVlSMmZ0Ui9SMHNBVEszMm5vTG1aazV2ZHZ6WkpVZTRYUmk5ZVdu?=
 =?utf-8?B?eFpITUtTTldtQlkvdHhIVjY3RllKV3VGcTFIbUMxZlMzSW5CQ043dFFIcW1Y?=
 =?utf-8?B?WnVpVXhHQTRpdGE4NWZ2dEpXTGx4aHZtV1FaOGhwZ3pYNzdVbGhXSk5xMlZp?=
 =?utf-8?B?NXNhY2FHTHZGZGFPL21VWDVxbVRCUk5udGtSYnQyWjBNRm9OaXVpUXZlOGUx?=
 =?utf-8?B?cEMrWmdVTjc1V1kzM1FDbGNxV05vUXQyb24rR0Jrc1h1RGtlMmgrQlB0RHhL?=
 =?utf-8?B?Sml5a3hTSzg0ZmpETXJuaHpOTm10YlQ3NTl2VVVtbkZCSWRXMG5qYlZyRFVX?=
 =?utf-8?B?U3FERFFuQ1JRaVF3QnhveEpIZlVOK0srZnV5UlozZ3JvaFZTKzVWTVFBQVpS?=
 =?utf-8?B?S1ZLTVU1eHVmQW5vY2ZtNkNSY3dJM2dDclZFRm1zOUNENktxa2JGQzVuNEp0?=
 =?utf-8?B?cmw0OHIxSGlEWktpZzNuVkIvY2xtQkpIWWY0TnIxU0ZlV2YvWVY3TkhaYW1U?=
 =?utf-8?B?ZkZuVmphY3Rvd3F6TXIvbUpZTmpETXFxN1kydHpzZ1hXYnZEWFJrWVh2RjAx?=
 =?utf-8?B?YzdxbUJzRXZ1MkJQZGFlNUw3dVgyMmhlTTBIaC93SExkUGVSUmtsVWxuanhY?=
 =?utf-8?B?eE9McDFoOWV4WVdhei9kOU14THBXMk84YWF3L3JweUhaclNBQzFEK1pUMVpq?=
 =?utf-8?B?d0dWclN3dHRxRUJYTnhFRFkyVHRReW4yTTBsKzVLMExUQkE1aHdsdkM3MFlh?=
 =?utf-8?B?Y2JVdDdDb3lPeGJTTmF4OHd2TU1tcWIxVzFCZ1hiblMrUVNPOU9yYy9zUjd0?=
 =?utf-8?B?UDZpek92SHg4eEpEU1FrcWpsQXJMYUV6TEh2bzhRWm56Mm93QnlFZXR3Z0hk?=
 =?utf-8?B?RXJWMHlQemJFc1dVSFVDV3RiQ3pCREdWUFJOZzRWemNsU2VzcTdEOGdVUCsy?=
 =?utf-8?B?K0JJTGMzMkNmbXdsdlYrajZQelNkSWpNVFlmWGNlT0RURnozOFBUVldGSFFI?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49df6002-6f3a-4c08-aa27-08de1573f7ec
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:14:56.1380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eME+Tje9h9xsJz93m1s4x7jKJmDrxpg4M/NSWw3X4rJU50pzg86XO583swjavQ5qADgq0sC2+bLno7VO6gnFep0NRGTLuW16kuna0ZJgFEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4659
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Add new helpers for tile-based MMIO access:
 - xe_mmio_tile_read32()
 - xe_mmio_tile_read64()
 - xe_mmio_tile_write32()
 - xe_mmio_tile_write64()

These functions provide explicit MMIO read/write operations within
a given tile by applying TILE_MMIO_SIZE offsetting logic. Existing
GT-level MMIO helpers (xe_mmio_gt_*()) are refactored to use these
new tile-level accessors, simplifying code and improving consistency
across MMIO operations.
GGTT is also a per-tile resource, so let's adjust the GGTT access
helpers to use tile IDs instead of GT.

v2:
 - find the real tile based on gt instead of assuming root tile

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Jan Sokolowski <jan.sokolowski@intel.com>
---
 lib/xe/xe_mmio.c               | 94 ++++++++++++++++++++++++++--------
 lib/xe/xe_mmio.h               | 20 +++++---
 lib/xe/xe_sriov_provisioning.c |  6 +--
 lib/xe/xe_sriov_provisioning.h |  2 +-
 tests/intel/xe_sriov_flr.c     | 12 ++---
 5 files changed, 96 insertions(+), 38 deletions(-)

diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
index 834816133..8bc446fb9 100644
--- a/lib/xe/xe_mmio.c
+++ b/lib/xe/xe_mmio.c
@@ -107,6 +107,62 @@ void xe_mmio_write64(struct xe_mmio *mmio, uint32_t offset, uint64_t val)
 	return iowrite64(mmio->intel_mmio.igt_mmio, offset, val);
 }
 
+/** xe_mmio_tile_read32:
+ * @mmio: xe mmio structure for IO operations
+ * @tile: tile id
+ * @offset: mmio register offset in the tile
+ *
+ * 32-bit read of the register at @offset in the specified @tile
+ *
+ * Returns: The value read from the register.
+ */
+uint32_t xe_mmio_tile_read32(struct xe_mmio *mmio, uint8_t tile, uint32_t offset)
+{
+	return xe_mmio_read32(mmio, offset + (TILE_MMIO_SIZE * tile));
+}
+
+/** xe_mmio_tile_read64:
+ * @mmio: xe mmio structure for IO operations
+ * @tile: tile id
+ * @offset: mmio register offset in the @tile
+ *
+ * 64-bit read of the register at @offset in the specified @tile
+ *
+ * Returns: The value read from the register.
+ */
+uint64_t xe_mmio_tile_read64(struct xe_mmio *mmio, uint8_t tile, uint32_t offset)
+{
+	return xe_mmio_read64(mmio, offset + (TILE_MMIO_SIZE * tile));
+}
+
+/**
+ * xe_mmio_tile_write32:
+ * @mmio: xe mmio structure for IO operations
+ * @tile: tile id
+ * @offset: mmio register offset in the @tile
+ * @val: value to write
+ *
+ * 32-bit write to the register at @offset in the specified @tile
+ */
+void xe_mmio_tile_write32(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, uint32_t val)
+{
+	xe_mmio_write32(mmio, offset + (TILE_MMIO_SIZE * tile), val);
+}
+
+/**
+ * xe_mmio_tile_write64:
+ * @mmio: xe mmio structure for IO operations
+ * @tile: tile id
+ * @offset: mmio register offset in the @tile
+ * @val: value to write
+ *
+ * 64-bit write to the register at @offset in the specified @tile
+ */
+void xe_mmio_tile_write64(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, uint64_t val)
+{
+	xe_mmio_write64(mmio, offset + (TILE_MMIO_SIZE * tile), val);
+}
+
 /**
  * xe_mmio_gt_read32:
  * @mmio: xe mmio structure for IO operations
@@ -118,9 +174,9 @@ void xe_mmio_write64(struct xe_mmio *mmio, uint32_t offset, uint64_t val)
  * Returns:
  * The value read from the register.
  */
-uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t offset)
+uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, uint8_t gt, uint32_t offset)
 {
-	return xe_mmio_read32(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)));
+	return xe_mmio_tile_read32(mmio, xe_gt_get_tile_id(mmio->fd, gt), offset);
 }
 
 /**
@@ -134,9 +190,9 @@ uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t offset)
  * Returns:
  * The value read from the register.
  */
-uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t offset)
+uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, uint8_t gt, uint32_t offset)
 {
-	return xe_mmio_read64(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)));
+	return xe_mmio_tile_read64(mmio, xe_gt_get_tile_id(mmio->fd, gt), offset);
 }
 
 /**
@@ -148,10 +204,9 @@ uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t offset)
  *
  * 32-bit write to the register at @offset in tile to which @gt belongs.
  */
-void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t offset, uint32_t val)
+void xe_mmio_gt_write32(struct xe_mmio *mmio, uint8_t gt, uint32_t offset, uint32_t val)
 {
-	return xe_mmio_write32(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)),
-			       val);
+	return xe_mmio_tile_write32(mmio, xe_gt_get_tile_id(mmio->fd, gt), offset, val);
 }
 
 /**
@@ -163,38 +218,37 @@ void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t offset, uint32_t
  *
  * 64-bit write to the register at @offset in tile to which @gt belongs.
  */
-void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t offset, uint64_t val)
+void xe_mmio_gt_write64(struct xe_mmio *mmio, uint8_t gt, uint32_t offset, uint64_t val)
 {
-	return xe_mmio_write64(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)),
-			       val);
+	return xe_mmio_tile_write64(mmio, xe_gt_get_tile_id(mmio->fd, gt), offset, val);
 }
 
 /**
  * xe_mmio_ggtt_read:
  * @mmio: xe mmio structure for IO operations
- * @gt: gt id
- * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
+ * @tile: tile id
+ * @offset: PTE offset from the beginning of GGTT in @tile
  *
- * Read of GGTT PTE at GGTT @offset in tile to which @gt belongs.
+ * Read of GGTT PTE at GGTT @offset in the @tile.
  *
  * Returns:
  * The value read from the register.
  */
-xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t offset)
+xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, uint8_t tile, uint32_t offset)
 {
-	return xe_mmio_gt_read64(mmio, gt, offset + GGTT_OFFSET_IN_TILE);
+	return xe_mmio_tile_read64(mmio, tile, offset + GGTT_OFFSET_IN_TILE);
 }
 
 /**
  * xe_mmio_ggtt_write:
  * @mmio: xe mmio structure for IO operations
- * @gt: gt id
- * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
+ * @tile: tile id
+ * @offset: PTE offset from the beginning of GGTT in @tile
  * @pte: PTE value to write
  *
- * Write PTE value at GGTT @offset in tile to which @gt belongs.
+ * Write PTE value at GGTT @offset in the @tile.
  */
-void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t offset, xe_ggtt_pte_t pte)
+void xe_mmio_ggtt_write(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, xe_ggtt_pte_t pte)
 {
-	return xe_mmio_gt_write64(mmio, gt, offset + GGTT_OFFSET_IN_TILE, pte);
+	return xe_mmio_tile_write64(mmio, tile, offset + GGTT_OFFSET_IN_TILE, pte);
 }
diff --git a/lib/xe/xe_mmio.h b/lib/xe/xe_mmio.h
index f144d4b53..f15017c96 100644
--- a/lib/xe/xe_mmio.h
+++ b/lib/xe/xe_mmio.h
@@ -29,13 +29,17 @@ uint64_t xe_mmio_read64(struct xe_mmio *mmio, uint32_t offset);
 void xe_mmio_write32(struct xe_mmio *mmio, uint32_t offset, uint32_t val);
 void xe_mmio_write64(struct xe_mmio *mmio, uint32_t offset, uint64_t val);
 
-uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t offset);
-uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t offset);
-
-void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t offset, uint32_t val);
-void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t offset, uint64_t val);
-
-xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t pte_offset);
-void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte);
+uint32_t xe_mmio_tile_read32(struct xe_mmio *mmio, uint8_t tile, uint32_t offset);
+uint64_t xe_mmio_tile_read64(struct xe_mmio *mmio, uint8_t tile, uint32_t offset);
+void xe_mmio_tile_write32(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, uint32_t val);
+void xe_mmio_tile_write64(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, uint64_t val);
+
+uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, uint8_t gt, uint32_t offset);
+uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, uint8_t gt, uint32_t offset);
+void xe_mmio_gt_write32(struct xe_mmio *mmio, uint8_t gt, uint32_t offset, uint32_t val);
+void xe_mmio_gt_write64(struct xe_mmio *mmio, uint8_t gt, uint32_t offset, uint64_t val);
+
+xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset);
+void xe_mmio_ggtt_write(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset, xe_ggtt_pte_t pte);
 
 #endif	/* XE_MMIO_H */
diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index ff9d1f7d2..2ca73d2ef 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -90,7 +90,7 @@ static int append_range(struct xe_sriov_provisioned_range **ranges,
 /**
  * xe_sriov_find_ggtt_provisioned_pte_offsets - Find GGTT provisioned PTE offsets
  * @pf_fd: File descriptor for the Physical Function
- * @gt: GT identifier
+ * @tile: Tile id
  * @mmio: Pointer to the MMIO structure
  * @ranges: Pointer to the array of provisioned ranges
  * @nr_ranges: Pointer to the number of provisioned ranges
@@ -106,7 +106,7 @@ static int append_range(struct xe_sriov_provisioned_range **ranges,
  *
  * Returns 0 on success, or a negative error code on failure.
  */
-int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio *mmio,
+int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, uint8_t tile, struct xe_mmio *mmio,
 					       struct xe_sriov_provisioned_range **ranges,
 					       unsigned int *nr_ranges)
 {
@@ -122,7 +122,7 @@ int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio
 
 	for (uint32_t offset = START_PTE_OFFSET; offset < MAX_PTE_OFFSET;
 	     offset += sizeof(xe_ggtt_pte_t)) {
-		pte = xe_mmio_ggtt_read(mmio, gt, offset);
+		pte = xe_mmio_ggtt_read(mmio, tile, offset);
 		vf_id = (pte & vfid_mask) >> GGTT_PTE_VFID_SHIFT;
 
 		if (vf_id != current_vf_id) {
diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
index e1a9d0a63..1e1dca866 100644
--- a/lib/xe/xe_sriov_provisioning.h
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -92,7 +92,7 @@ struct xe_sriov_provisioned_range {
 
 const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res);
 bool xe_sriov_is_shared_res_provisionable(int pf, enum xe_sriov_shared_res res, unsigned int gt);
-int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio *mmio,
+int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, uint8_t tile, struct xe_mmio *mmio,
 					       struct xe_sriov_provisioned_range **ranges,
 					       unsigned int *nr_ranges);
 const char *xe_sriov_shared_res_attr_name(enum xe_sriov_shared_res res,
diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index aabbd8c05..077ed15af 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -493,20 +493,20 @@ struct ggtt_data {
 
 static xe_ggtt_pte_t intel_get_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset)
 {
-	return xe_mmio_ggtt_read(mmio, gt, pte_offset);
+	return xe_mmio_ggtt_read(mmio, xe_gt_get_tile_id(mmio->fd, gt), pte_offset);
 }
 
 static void intel_set_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte)
 {
-	xe_mmio_ggtt_write(mmio, gt, pte_offset, pte);
+	xe_mmio_ggtt_write(mmio, xe_gt_get_tile_id(mmio->fd, gt), pte_offset, pte);
 }
 
 static void intel_mtl_set_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte)
 {
-	xe_mmio_ggtt_write(mmio, gt, pte_offset, pte);
+	xe_mmio_ggtt_write(mmio, xe_gt_get_tile_id(mmio->fd, gt), pte_offset, pte);
 
 	/* force flush by read some MMIO register */
-	xe_mmio_gt_read32(mmio, gt, GEN12_VF_CAP_REG);
+	xe_mmio_tile_read32(mmio, xe_gt_get_tile_id(mmio->fd, gt), GEN12_VF_CAP_REG);
 }
 
 static bool set_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, int gt, uint32_t pte_offset,
@@ -548,8 +548,8 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
 	gdata->pte_offsets = calloc(num_vfs + 1, sizeof(*gdata->pte_offsets));
 	igt_assert(gdata->pte_offsets);
 
-	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, gt, gdata->mmio,
-							 &ranges, &nr_ranges);
+	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, xe_gt_get_tile_id(pf_fd, gt),
+							 gdata->mmio, &ranges, &nr_ranges);
 	if (ret) {
 		set_skip_reason(&gdata->base, "Failed to scan GGTT PTE offset ranges on gt%u (%d)\n",
 				gt, ret);
-- 
2.34.1

