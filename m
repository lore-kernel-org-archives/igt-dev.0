Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4014CAC597
	for <igt-dev@archiver.kernel.org>; Mon, 15 Sep 2025 08:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE9410E2C5;
	Mon, 15 Sep 2025 08:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="URoKcjDV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E1E10E2C5
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Sep 2025 08:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757926076; x=1789462076;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=/yAwas9eQTJ/UuHWX3EMSo8u0oITExYFWzfp1WIdqls=;
 b=URoKcjDV57qFwJAqhjI0ENbEvsfC2O9AlNwzd0ktii2htSKempLnCjzj
 nWxYZs1DUozzbqpL2rTVHlLrhL80DggewM8KIbRbpdep66rwSg8Kl5RGR
 VCyMxI+3p1A80QWHtBVxh3q+b49mb4Qi2tfo+g9R/cvfVasMqjvMBc3yP
 0U53noc8PtDZFgjsKeu3gmLySccs8iAkZ2cxWni0lL8L090N51AntqtvD
 aSQlxJ1VZ4kuhdkHQ+WFoQcEm5GSSkasmnNyCbHf/Gg0XJosutFxxKq2V
 xKACWBDeA12ikzGoJtxYqd+/XqQA1cLPptxXiTF7Mq+AJ9UTA8iUALwfw Q==;
X-CSE-ConnectionGUID: iPx2yu9gT8ipP46ZtGyvMQ==
X-CSE-MsgGUID: YIrsmWwxS12AQ2k+NS36HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="82761854"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208,217";a="82761854"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 01:47:55 -0700
X-CSE-ConnectionGUID: 0zsriNxzQoW4qcWrhkkbOQ==
X-CSE-MsgGUID: HiZI9inoTaG/et/+s/iN/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
 d="scan'208,217";a="175358969"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 01:47:55 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 01:47:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 01:47:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.44)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 01:47:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LuuDMmqn2THmeAYuMZfKKMzNGgbix+jtpJ0frx0K0ICFpOK8vg8IHPjm2YUhPblDyxw4wNqGhzJRCnZfZ8iBwVa9CwCGuTy5iR63FnjtkHUlHDVxmvvAF9t3Ouc6POt5BdINSyWNHbE5LK7EZja84E8m87gcMHwGEfD4vAJdOHpVBY0Ms4Dwq5KR5CK0uS/SB0Gb0AKX78A7PipyEfX4L7eCc+1py0DD64F5Tg1Qhkxd72ax+KafOBsTN0VBd1MM4P2pPo/5TLQSeKcbJdf1vcrdEHa/uUwUWuDI3CUfcotFJunPsZ7Lrg5YGp8i8gbggEwQzzDI1Cb0riu/lCcSUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORynmCcFxU/NKHi1VnPREWwHcbwusZ67yv20uy/CKe4=;
 b=QG98uBUnMRjupVs2P1aiItKFcNIWovn59SkqroywDxXNSZ1KTk6Z7Aq8k0y6sLXZbyXEtjXUmLpdw/SaMvESljbEI/3JycnUhVDDKff9dnCeuBHq3FI66ygiZ/5kKu+hcW5dCdvIzqy5o9uISKuvjUvGP3AHHsJuIyhG+pcP+OIU8m2Cm6an7SllTSJTbQYS6x5hPNT//DAX2shXD6k7JCVJ7svWOf7t9wlGyWF8U9FgBFvU29lmIcFC5V6UByapDiFzDuhJ4JUeVidDLFCO/26CtddNgh/0h8kHQXd+7mrRNbqQ5QYehj4Z+Ozreh/oCeidb6UlMBn3J0m0QdxU6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by CYXPR11MB8730.namprd11.prod.outlook.com (2603:10b6:930:e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 08:47:52 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%5]) with mapi id 15.20.9115.018; Mon, 15 Sep 2025
 08:47:52 +0000
Content-Type: multipart/alternative;
 boundary="------------2Uuqp9qCKNC64cPKSfi6JTri"
Message-ID: <a71a2e7b-54c2-4e44-aae3-137593b1d565@intel.com>
Date: Mon, 15 Sep 2025 14:17:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] tests/kms_color: limit iterations in simulation
To: <igt-dev@lists.freedesktop.org>
References: <20250910090059.351698-1-swati2.sharma@intel.com>
 <20250910090059.351698-4-swati2.sharma@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250910090059.351698-4-swati2.sharma@intel.com>
X-ClientProxiedBy: BMXP287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::35) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|CYXPR11MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: 74e2ed25-888d-47dc-37aa-08ddf4348e93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVpvYnEzTU8zL3p6M2FxS0cwREUwbE5hWlRReUJ5R1llZm1tTityRk5VRnZM?=
 =?utf-8?B?bEZ5UW0yQnNoMWEzd3FJWmkyVGExTU1rejg5TFo1RzNncVV1YlFnRlVhNmk4?=
 =?utf-8?B?eS8rdFNOdzR5OFRrUlVNdGVESjlNNnU3QUNoR3M1Nm9yL3lQcllnS0hTaDdh?=
 =?utf-8?B?L2JLYS83LzFkOS9nYnBjQVNFZWpVV01NWVVVa3lzNlZ0MFFudkhwcGd4TUF0?=
 =?utf-8?B?SzlxUjZBYkFyc1F5U01QVGdaRWJMRDQ3blM2ellwZXNmZVdhZUdmNFIyYVpa?=
 =?utf-8?B?NndSVytzTzIyTmo0VVhUV3FTMDh6NVZiaTA4WVUzaVhIZlp6TmNmWnh1ejdO?=
 =?utf-8?B?UFZhNWlxWUdnL3RvQ1NGOVJqYWlwK0FCNXhMaEs2eGVBd3c4ZzZFOCtJMlg2?=
 =?utf-8?B?Ri9BbW80UDJkN0E5ZU5nV2lVSDN6ekM0Wmxwajlta2pseEFrUUZLbjM4enpJ?=
 =?utf-8?B?VXdkeTY0Q3hnVUNGakdVNkV2VzhiaWlURzJRdGg3TU9vNHNIeVIyVS9WRFdh?=
 =?utf-8?B?bWtwZS84bHFxcHpnRlF0MTJlSDVJeGtEY25DYkg2eWMySmV3Q0hBa3ZoSHZ1?=
 =?utf-8?B?NkpBWHhyaE5lZy9aNzZ3ZjRYbWU2Y1R2a1ZENzY1VnpiQXIwWmJXSXFYQVdp?=
 =?utf-8?B?SHFqQnJ5RXFzZWN0WEp4SVRlT05xaVdITHJWcklhRDhYdURnZUUwT2hNNnQy?=
 =?utf-8?B?WlJQZmVLeXVtVkZCME1OL29lTmU1NlFWRnA2MG1CVytUdnowdkhEUVRTM3lV?=
 =?utf-8?B?QlovNkUwejdnWFQxWjJHODYxazlMenRDOXZlV0Y2ZmdTY2NaeERzckJRRHhI?=
 =?utf-8?B?NVg0MFRseTgwRDJHMXJMTkcwaVJrOUs2MElsN1JFTHZBSmlaSnI4NVR4MDVL?=
 =?utf-8?B?QU5yMGpvVHdrU0ttQklpMGZVYTZybnBFTENNM0laZ0I4VlE1bW56OVlHM1Ez?=
 =?utf-8?B?UWNBNEVYK2xtMGFGQnlYTGlSNVkxczM0djh5djdkS0NrNjBwVFgyTHNSOG1r?=
 =?utf-8?B?UFFMUmErUHNNSEJHRWRNaWxhSnFYZkxPYldXY3lZODl3NytaeCsxZlNzNkxx?=
 =?utf-8?B?MWQwcEdOVFFydTdFM1owdWZKc1cvMFVoNHh1engzQVZYU3p2SUxObWlIeUh0?=
 =?utf-8?B?cUhxb0JtK3k0MWpwZ2pzK29yZnFGWE81OGRnTUNjQ1JpVDVOZUJ0TFQwVGli?=
 =?utf-8?B?QzVPK3BsRUd4S0pjTG1yQnJ3Z1VWaTJOeDE3anlDdVdhQng3VkY5UlFjcU9h?=
 =?utf-8?B?MkIyKzFBcG5jUWh4UlhCeVk0ZlR1R3BnYkNRZ2FKdXFuRStXb2lTRHFmNW9k?=
 =?utf-8?B?K1VLaWhjRkYrY0l2N25xT2JuZkZuQVRwZWgvcTR5MVhSNUNjUWN2WmdIemNl?=
 =?utf-8?B?Uk9MUUxReDQyd3Fqdy90ZG9IUytoNWtKWWFRRjNGbmwxYjNaREg5NHBDRGIy?=
 =?utf-8?B?aTdXMktYOXdNUWpKVGRsQmlRTkJxMlZNdVAxS2pCTkVKQkZRdGNXdUt4UXIz?=
 =?utf-8?B?cW85QXNxTUJPVUFINGhoTHlGUTlFL05GNk1OR3ZTRUFhZUtCNE9RRVNpMDY4?=
 =?utf-8?B?d2ZQU1dSODZwaFoxVVdTZ2pyZHB0WDNTRmlUQ05BMTJ4d3NsTjBhR0l3ZDcx?=
 =?utf-8?B?cEtUeVUzYjRkc012UXBsYmdCUFB4VDllS2c0NDR3RTZZU0xzUVdQNS9zdlQ2?=
 =?utf-8?B?YldLcXd6VWRUUlZPWDZUMCtMeUwrbERpV0s4SjRyY2ZVMHAyZURJcUE5aGVi?=
 =?utf-8?B?T2ZQdERaMUFXQ2t1eGpJZ0hqTEY0WU1xTXNiS1dFQnhsZ0JCa0tOR3BtRTlS?=
 =?utf-8?B?dUhOeG52cHp2WFhhZ1RRZWNQRkg4NFZkNnN1V2hWNXF2dzViWmdkdWxDTU1T?=
 =?utf-8?B?L1B3MlFxNnJUdVRhQjBtUEg1VUhSL2dHYzZHcDRIbkF1UkxkUzBNOW9EbTlS?=
 =?utf-8?Q?0NRE+sIsP0g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVFEdVliZ3BBZnNNSFk5SGg5bkV1UFJQREthZXIrczFVVUU4RWxVNnptK0Fu?=
 =?utf-8?B?TFB4blhja1NCemNIMk1Fa2lZN3FVWTlxTFBaU0FlN3VTUVRFRG5CcWkyNlQ2?=
 =?utf-8?B?eVNXMnpCQUtaV2tkUVRsNHBScXUxbmhiTlU5Um03UDMyM0hyNGtlMEp1V1Ro?=
 =?utf-8?B?d2ZlVTUrcFFFRWVWR1NwUHczMW96a1l3aU1zSVlEWGVlUURRejJpcXp4MUFU?=
 =?utf-8?B?YWVYVkMvVHRXNEtqNjFSaGY5NFpMdHdnQVFSbTIxYlNrOXIvM3VvUG80L3di?=
 =?utf-8?B?ZGpNOWxGL016SVQvTkQ5VEdOa1lGdDJNK2FjQ3JnL2VqbHE2WmViNXNMQ3JC?=
 =?utf-8?B?ZHkwTnJ5eVljTHJDRm9BQmFHaDFUWTRRakgvNXQwSDFRUWdPVTd4dDRNS1J3?=
 =?utf-8?B?RHlBWkxHYWQ2bW9JcTRDc2pwZCtTbzlTbm5xSXRHaTNpQ2J6UkFjT0ZZOXgw?=
 =?utf-8?B?bXdEbDMwK2JVekJwcXBPSUNNNXhyVXlaYlQybHhGRHk5RG9ubWxKV0pDazlk?=
 =?utf-8?B?UWhuVkVJUUhhV0FaN1dFNXZlb20wM25jSDB0aWl4OFpEeWhRZEc1VTh3MEVm?=
 =?utf-8?B?cnVHM1VzaktWWEtRN3d0UnpYSHRvNFFwSDVTU0YyTkZ1Y0tKTStvRUdWaWJi?=
 =?utf-8?B?RE1NWlVWWGV2K0xNL3ozZ05Wdnozb1BDVFRYR0lSa0UyeVhjOXJjUkw4Tzdi?=
 =?utf-8?B?MzdBQU1wZDRMdmtKbHRPZlpvK091L3IxSkhYbEw1clYyZ0Qyd0p3WEx4N2x1?=
 =?utf-8?B?eUZQcHNmenhDVnV0OUgyUS9TUjBsaG5ORHRIMmpmanIvTGladmtHc0FCYkpX?=
 =?utf-8?B?VVJPUFBobk9vV2E3S3VPemhxQlFvSlBnaG1DNUxUTmdQRHNxZHY2RTJaZWlv?=
 =?utf-8?B?aVd3U29sa2tRUFdQM1FaK1hCOXN3V2dSWWluLzFGS3g5T1R3WThtTlNLVFF4?=
 =?utf-8?B?VDgzd0JDRXRsNi9SZDNXN2Z4MGJYTDNISTNVMlB6ekZRZ1lGcGh1UmRGdFI0?=
 =?utf-8?B?QXRBMzNjZmplSzNVMnpEVTVYWjVJKzkzKzZHY2Q1ajFJRGlCcklpaFQzQTV2?=
 =?utf-8?B?ZWptZWp3ejBjYWZnMU5EUjE4eVNhMUlOZU16UmZDa1JvaEVUTzFGb1RzMWI1?=
 =?utf-8?B?Y1BSaUdYWUZZMXRuWS9oYTlncE83Wkk1ZXA4UHcvQnl2cU1hVjVGSXN6amVK?=
 =?utf-8?B?ditlZUFUditFNElHRW5RVUVaZHdzYUVHMzJ0TTZabWF5dzBnTklNaUplVGt5?=
 =?utf-8?B?VlFkV21KTy9LeHlGamFGTGRSa2pWS3BndmJ3NDFNeXZlQ3h4TmcvWjNzT1po?=
 =?utf-8?B?ZkF6Y1E2a1JLQk1xQW4vYUVKY0YvcFpxdmpyNjlHb2dVbnllWUtDYWdUT00r?=
 =?utf-8?B?dFZRNS94aWdDSGQ1emRaaUYvK1J1Mjg5OVZvcFIycHZCcnhmVUpJWHdORzU3?=
 =?utf-8?B?TWNxN2ZyOVF1eDAzeWliMWtMK2RnQ05laGRnbWJwQXNSTzAySE9OSkp3cjhh?=
 =?utf-8?B?UVdHelJHbWMvbG5YYW1Pd3Q1VThlSUxLTjVuSWMxLzk5bWJ0czZ1V3FtQm9J?=
 =?utf-8?B?T01QNVZFNGxhSFYwRkZPVFgyWnMvc0N2RmxGUzE2TlUyVU5ZYlZpWENyNlVJ?=
 =?utf-8?B?RXM0bFhWa00xdENFSTZKbndUdDhOTzFvYWpFRlU4NVdpVGx2amZIVlhZdDNl?=
 =?utf-8?B?U2U0OWxueTFBQVdmUTFPejhNQjd0Y1hTNHRBeEZQcDFWMG02c3FMRHd2b2Qr?=
 =?utf-8?B?TUk4MnV0M3RCVnMxaTE4ZERWS0dnSisyWG90TDVkSG05RmxObGx2TE1OZExq?=
 =?utf-8?B?VWYySG5udm5JZHhSclJONEJ3ZzVsb3QrT2VWczF5eHZ0QTJ2RjVmOEE0WDZB?=
 =?utf-8?B?Ukw2VFoydXF4elo4Z1BDK3BCdVlEWGgxZXN4d3VNaUlqdWZ6VEV2L2hOQUEv?=
 =?utf-8?B?eGI5MG1Ld3VZdE1scjNicU1HVzJVclZJWFVlNy8ycS91WHprOEdncWRmYUtZ?=
 =?utf-8?B?U05jeC9HQkFxVXFWQTgxaXVUUW1aVGIyQ0wyLzJabjkvdm1FSXJRTWhodkpq?=
 =?utf-8?B?SkgzVUxUOENyeFY1UFUyRGFFWnBTa1ZRd1paaThZWXU1bkxWMWt3OXI0ZzN2?=
 =?utf-8?B?VWNJSU1BV1ZsOUNmeHlrMFd5T1VSbHEyUFQ0SXBIeHlablYweUtoR09VSlYz?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e2ed25-888d-47dc-37aa-08ddf4348e93
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 08:47:52.7691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9xi0YqH1SV4NiMQOORvUkWV6BJPPlWue+GWS2j2b079pK+TPyGq+q2rsJsqd/TO3DwV6zz0kuIgqzrdpLKX3g0uNk+yU84FFRedipn3hQd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8730
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

--------------2Uuqp9qCKNC64cPKSfi6JTri
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Swati,

On 9/10/2025 2:30 PM, Swati Sharma wrote:
> Skip exhaustive CTM and deep color subtests when running in
> simulation to reduce runtime while preserving coverage.
>
> Signed-off-by: Swati Sharma<swati2.sharma@intel.com>
> ---
>   tests/kms_color.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 447fcc7f9..c424083b7 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -1151,6 +1151,8 @@ run_tests_for_pipe(data_t *data)
>   							       ctm_tests[i].fb_colors,
>   							       ctm_tests[i].ctm,
>   							       ctm_tests[i].iter);
> +				if (igt_run_in_simulation())
> +					break;
>   			}
>   		}
>   	}
> @@ -1162,6 +1164,9 @@ run_tests_for_pipe(data_t *data)
>   	igt_subtest_with_dynamic("deep-color") {
>   		for_each_pipe(&data->display, pipe) {
>   			run_deep_color_tests_for_pipe(data, pipe);
> +
> +			if (igt_run_in_simulation())
> +				break;
>   		}
>   	}
>   }

LGTM,

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

--------------2Uuqp9qCKNC64cPKSfi6JTri
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Swati,</p>
    <div class="moz-cite-prefix">On 9/10/2025 2:30 PM, Swati Sharma
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250910090059.351698-4-swati2.sharma@intel.com">
      <pre wrap="" class="moz-quote-pre">Skip exhaustive CTM and deep color subtests when running in
simulation to reduce runtime while preserving coverage.

Signed-off-by: Swati Sharma <a class="moz-txt-link-rfc2396E" href="mailto:swati2.sharma@intel.com">&lt;swati2.sharma@intel.com&gt;</a>
---
 tests/kms_color.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 447fcc7f9..c424083b7 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -1151,6 +1151,8 @@ run_tests_for_pipe(data_t *data)
 							       ctm_tests[i].fb_colors,
 							       ctm_tests[i].ctm,
 							       ctm_tests[i].iter);
+				if (igt_run_in_simulation())
+					break;
 			}
 		}
 	}
@@ -1162,6 +1164,9 @@ run_tests_for_pipe(data_t *data)
 	igt_subtest_with_dynamic(&quot;deep-color&quot;) {
 		for_each_pipe(&amp;data-&gt;display, pipe) {
 			run_deep_color_tests_for_pipe(data, pipe);
+
+			if (igt_run_in_simulation())
+				break;
 		}
 	}
 }</pre>
    </blockquote>
    <p>LGTM,</p>
    <p><span style="background:white">Reviewed-by: Naladala Ramanaidu
        <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20250910090059.351698-4-swati2.sharma@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------2Uuqp9qCKNC64cPKSfi6JTri--
