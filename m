Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B08C3ABB2
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 09:14:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5592510E5BB;
	Wed, 28 May 2025 09:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bkMc2Z4Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E9210E5BD
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 09:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748423680; x=1779959680;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rU88nL0eVKek/FzSN8cYe82iqaWH4ewL4Y02qJWv3Po=;
 b=bkMc2Z4Q+MYyz5bVypaLXUC/Au9wpm4X7pk1F2aFMdXNg9+ph/Lygaud
 KdEM5wgzz3Wo43cfrjRdwi4b2kTznycgJ8pgtvCHdsqWGN3f738KmsYTW
 kq5UDYy51FqCihbHgOGyIyCJuCNUTyBURjp8LOVQOqzOIrLk6jWgX2o8t
 MG94hah4q6mxRnqI4a3ADnCJVTIwJf5NiswJMzzuHwlAZGPnEGC1gbmCY
 7jV2S0d3P3nVMp6gIkTRdkr+iouA5kUhK6ipWnlP99zHFM0jGwmgotzA8
 EsireJVpP2fSbkkFbTcc3U6CAJHPKxmY2bS/1OyGL5+yKN6xxxS1LqlVU w==;
X-CSE-ConnectionGUID: uP5na35sTd+F+XHb7NTqFA==
X-CSE-MsgGUID: yoYGZ9lzT6mZDdp+APRkHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50317450"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="50317450"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:14:40 -0700
X-CSE-ConnectionGUID: w8nhJwVKSZu5+L7zRcLGvw==
X-CSE-MsgGUID: tr35J8QrRS+1YW//GpET7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="166361814"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:14:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 02:14:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 02:14:39 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.70)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 02:14:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4vaPc3tgvSNjF8n6YL+r4pM75ZULkr/bHCApUMGTkCBb3U2p1PgtEPnHUlQyovVvlCgUthS7lJzbjrxnel3HznVy3KmWs1NumPX/3d5x0xrXiP8YHd41cECoE11T4GdRecaflLva5obBfiKUdSN5rwrJILHK9x6MRsDQ8tNhUzh4AP6QT24Ph+/vHjWuEXiGOTmMqW3x96wT9ktejKRAFGn1g+jQ4sJ14Q7foO+KhU75oOctgz4hjscBsETFCp9/DvDfFVCNyKIc7hihPlV5oPcQBp05LQAPpUaAu4XII1CF1Eb4b4FYsXcSXjyQci3t9aL5FpWk8ywqR7lNHjidg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKjqUBRxJ2CzImJ1Oxi1tboakIsiRh43QBOi3mHFBXI=;
 b=Hp5AM2QTfdSCZVai2w/lOTH5sKaRGxFV3/VKol7XV2sVAyRVnFtdnBsy2biSVaPJRdxA8FIx0mVil34MLyWrUM4inwfsZrm4yt4YVPpbxP8P824ZVk2VDasbjKCJea8GHKUu83JLSmmTx11sE2ydkm5CtnHlO/uGQThis8JRvdXHefrjHIClWcO4XNTuc9IIHLytzz8OCCwM6udZW+wcsH0otAbKWsys10fj4MdtTF2l+lT9wt8gcjIm/NEKmYPoCvSvu3GOPd6OpCcHcscJYmqwBuJ7R6n1ZSJm3UyMaXEKxED4OozALjQN1jjpPjxucIuA4BDmEutT9VlBkpM9ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB8277.namprd11.prod.outlook.com (2603:10b6:806:25a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 28 May
 2025 09:14:21 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 09:14:21 +0000
Date: Wed, 28 May 2025 11:14:18 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 3/4] lib/intel_compute: calculate array size at
 compile time
Message-ID: <aDbT6sKAmuEa1Hv3@fdugast-desk>
References: <20250522075515.168920-1-zbigniew.kempczynski@intel.com>
 <20250522075515.168920-4-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250522075515.168920-4-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0322.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::27) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB8277:EE_
X-MS-Office365-Filtering-Correlation-Id: bcd322c1-3b48-41e5-2366-08dd9dc80845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDhoK2JvNUxCVVdwdFAxZ2ZmbXE0MEJseFV4M1JtSDluNlRiRTVOL01rMW9X?=
 =?utf-8?B?Lzg2eGxjbmhKY1hiVGVNOXFGMmp3dG1sVEl4Q2JtbWkrKzZLWWxHNkMxS1F3?=
 =?utf-8?B?MU9PRTUyOUsvcTJJbVFDNzVEbWxaVjJkUXRVSVRhOUxmRTRMMWNGbFIxS1BP?=
 =?utf-8?B?Wnd6N0hiVGRDVTh6ZHc2Wmx2ZjlEcmFiTlBDZ1U1RkYrdHNxSlB5N2x4Vkx5?=
 =?utf-8?B?SXcxNGREclZwb3MxY3poMVN1d3VXWDBVUU8yOTFzbG5McUNLTUNsbU9SckVp?=
 =?utf-8?B?YVhLOUh2QXI3azFMemNhSGFVYmVzWndiL2xXYVhucXdFd3BORTc0QXpCTk5E?=
 =?utf-8?B?NG9BeGZVWXNQL0lQRDZ6bk5HV2lsT2xhYWdFNlhwUUtxRDZRdkNTa294MmJO?=
 =?utf-8?B?RXMwbEpROXhsR2tPeXZGdXBlN0tYbFdLR2hJUjZRSWdGRDF4YjZjWVdTazlk?=
 =?utf-8?B?eWlDQWdrMXJYd2pKcDlaVS9nS29hKytYWHBiZVlSTDVVeXN6biszaFpNSFZs?=
 =?utf-8?B?dzFzR1VBa2w3YUFQZFFOaXpkMFE1QWg2eWYvQ0lzV2Z0bVRnT21ieWYxRito?=
 =?utf-8?B?SHM5bkcwcmJQU3pwc3hjODVsQTBianVVd2hBZVc4eDI4UVNCc3dSU09xN01Z?=
 =?utf-8?B?Y1ZHdjhKenNqaUU3VnoxcG5ocEdhUitLc29CV1FaYVNFVS8rbkQ1eEdXVGpt?=
 =?utf-8?B?VTl2aDBObzdSYVN0aUwxNU9tNi9ieExQUEpDQUVndFZqVW0rV1lMbGVIcjRX?=
 =?utf-8?B?eEtpMHNRYUF3Z1dERmovQzVuTDlSL3VwWXV0TFpvcW5vcmJlSXJKdWtmN3BV?=
 =?utf-8?B?QXJJZlhIUEppNXhMTEhoRDVqZ2JmamtDRUlmQUFJdHpRUmUyZ0xjajhrRGxu?=
 =?utf-8?B?V1lVa3JqV0tJdnZSWUphRXNOa1ZsVmY0dDIzV1lMMVZDbThoNkx1aEY5dzE1?=
 =?utf-8?B?M0ZybTdKZmF5Uldaa3AvWUgvVUtVRmpOdnYremtQN3I1ZWJsTEpiZjA2aXdx?=
 =?utf-8?B?U0lNTENabGRGN2JiSDlBd3BtL0xQR1RjWEVrblZVbDdKd2tVY3I1aGNZd2p4?=
 =?utf-8?B?elI0UEFnZEk4RXlWbFM1d0h4Q1RBem1FU1ZlSTRrWFM3OTlkbFJNTUNZNWli?=
 =?utf-8?B?R3lEQ1VVMDlwTEx6QUVoa2thTWNtQktKajBCbDR4YjdYNWM2WDM1YUNxM0Zq?=
 =?utf-8?B?eUJsS1hjcy9rUEtOREt5MVRqbEhZckhyNk0yRnFRa1NhbEc4SzFyREZzN1dN?=
 =?utf-8?B?QUhzd1hqQVByMnZ6Zm9xTW1seVJtVFQ4YkRJanRoYXQ2dUpCQ0lkZkt4TzNP?=
 =?utf-8?B?U0xUdnpZajdvTm1IdUw3aUFzVnlIYTR4V1ArMHVFeUtMems0SDJBWVpvcHpt?=
 =?utf-8?B?UlRITDlpWkdTZk5mdGpxNWRTMzR1VW5DQWZyb1Z4SW0wVjRsVzFhQWluajFn?=
 =?utf-8?B?V0ZaY0Q4Y3JjTXdJeVFYeTNETmNPRUhLOHFKd3NaZkI3ZzRVWE04NXFmdENU?=
 =?utf-8?B?Y3pFQlM2Nm1KK1RGT1RNc2NMVjJFT2FSekExdmFrbk1QcHFTSXFyY1Uwemxy?=
 =?utf-8?B?bGNDTXNEdGJJVVRXU2M1VENHNFRCcGFuUEF1VTN6WWN2VHpFUkREMkNjb3hH?=
 =?utf-8?B?Q1MwMjMyN0wxK083NklXWEEySWJ4R25Pa2VqRTVpaGRKWWIrMDhiTjluZWt5?=
 =?utf-8?B?N1l0bXlYL1d1cVZEV2J5MmdkVTlrOFZOMEVqUjJIc0w1VVZOTUxwNGNRcTNj?=
 =?utf-8?B?ZFhhMWFDWUdkU1NkYkdyTENDb1dFWDhYbHdiZ01UVGg3SkNaNXRGeVYxNnZm?=
 =?utf-8?B?blZNaXQrWFlZQVpreXRzLzlJVHUrYTM1QTBwR3Y2UGFHUFBLbEdkeUpONzF1?=
 =?utf-8?B?RjlhYnRGY004dFZaZTZaemNWQjZtRXpLMzZQTWdYYjFOeUlFV3lMTkp0MG9o?=
 =?utf-8?Q?Y4S+7eP/rUo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE9idGU4dXN0RGV5UVU4S1IxaTVHakVGcjI1NkRIbUpVUlNDYjlSVEYybGM0?=
 =?utf-8?B?RWo5K0dGN1NOdHRHcllPSEtNaW9GODlFUUZ4c2s5aVBDWWYrT2lFM2xJU2Jv?=
 =?utf-8?B?TWtNYTIyN3JabEp1N2VybThTTWVxWm1oR1RMZk0yd0REblN6bkpjTGF0VXJU?=
 =?utf-8?B?bTRBTnB4S0d0d2l3c1NwTlZyeFlGbStPc2tIUkU1VXd3bWNkSmtrbHV0T0Jy?=
 =?utf-8?B?QnNYYnU5YlZvVzZrT2l4Y0VDMjV0Syt5ajc0NzcwVFFkUk1Ucy8wSFlxUW9a?=
 =?utf-8?B?OHZCZFZHMlFsaW5pbTNiVnVmeGZEdjExQ2RDMmZZRWZhd1NKQjVEcmdxTm5n?=
 =?utf-8?B?eHRrdm9YS2lzaERKdituUnRXbjI3djBBR2VCYlhickdBdkdCS0J5S1RTMXJP?=
 =?utf-8?B?cTY3WEMwaHY4S2pXVjBDRXNjcFJTbHZRREpUTlg3a0h2SUtLczcrNVVPc0gr?=
 =?utf-8?B?bm1aR3QraktwV0RUbXRrbjQxZDNydUhpcFFDNCtqekJPdlpDUXhjQ3U0NmJm?=
 =?utf-8?B?NXlDVFBUYU9JVGFMVEFzMXFyL3FNZDlzODFOUnU4ZHB4cmJCOGdsQnNBL2ov?=
 =?utf-8?B?ZEQvODRFYnE5bDdXbmFtMjlKbGFYSkZTT0dqOHBQbFBBZDh6WDFPN1kyOHlJ?=
 =?utf-8?B?WjBpbVd0Y294TlRoWDR3eFFHcFlKNFJFaytuaEcyVUU2b0Ezd1YyYjgxZFIx?=
 =?utf-8?B?b3dQY2p4NjQwOWdVTTVER0Q4VjZTKzljbGhQTGs5ZkhiYXFmOGx4RGxGdlJY?=
 =?utf-8?B?TWpYZnVKb2FNRXQrNXFlbGVMYTVFR3haeFI4QTFxNzZML0NzdG1VMDE0MGwv?=
 =?utf-8?B?WUZpYkYrTU9wTi9meURsNTI4bmJqUFNmT2M5Y0R5aHloVkJkMUllMXlISmpk?=
 =?utf-8?B?ZmQyUkptU0NFS0Q1VENQVmhCbk1RYXlIZndyMmZiZVR0ZEdlV0g5VTN1QzBv?=
 =?utf-8?B?anBMQTV1MzBDcjR4T0FGZTFVa1g1QTROb3JNSU1lc0FybGhTS0poQXE4SHY4?=
 =?utf-8?B?RGxETTV1SHpxbHNhNTlWa2RTcHFkSGdhMi9QRmN3bXZJRmVuYWExOVlIMlk0?=
 =?utf-8?B?TVlvSkJjd2ptcDBkQ1JjeXU3RGFQYnFoNVlYZGNZNzM1V3Bzdk9KcFpTQk9I?=
 =?utf-8?B?QmlWVUlwSnRNK1MrcmI5UGhDcHN0dTVNdm92SjZnVXlsVGNFTXBzVi9CQ2JQ?=
 =?utf-8?B?V2w5ZFFwdjRDR2VIbEZnNHZoTVJXd2dleFlzUXUvMUpCM1VjbnNwMmYrZHVq?=
 =?utf-8?B?UGc0TFlIUTF3WVhjN0hrbk5kNVVGcW55RFJIOTdhRVErSzhkSUR0amVkaldQ?=
 =?utf-8?B?ZlFocTRVTmE2TkhyQ0VXY2dlSFM5c2creTFOOGZZbE9JMmpUQ2pqblJ0QkRm?=
 =?utf-8?B?YVJHTGlOb1pjVjM0MFQ4ZzZUM051bFhRVnZMSWdPY252VGRzakNQbmlLZUg5?=
 =?utf-8?B?MWZJaDQra29xSXBQTXhWNDY2ZXVwRkxXNnZwQXRZWVlodUxocExjVXhTaTVm?=
 =?utf-8?B?MmFKVW43cWRCcXBsbndrbWZsWVI3WUQydkdEQTE0R0FMSFJUMlNiMENwWnhZ?=
 =?utf-8?B?cXN1eGpXNVdzV0FlQTBzM3pPVzNXV1l4dzd6VkdudzJkT2xwYnQweEdybFRa?=
 =?utf-8?B?Y1VUckhmZklOZzdWZzRDb0NMVlg0WktxdUFDQytIejZFSzdzdEIxbXJXNDgy?=
 =?utf-8?B?TGJEM1AzYllOYU9VSVRoOUxyeDE0MUZTVEdFSUhpRkNRR1hQYnRVY1JsUUZV?=
 =?utf-8?B?blFFc1BLS0lJM2h5NytGajBSOHAyZTRmMkx4NE5NZ2NIbHlVSUVwMlJ4c05D?=
 =?utf-8?B?c25IYm5LYUlqMXVKbzNzVnExbXM0bUF4NFNDbTN5Ymd1YzB5MFdqa2NzeExG?=
 =?utf-8?B?aUI5dEQ3cmEwQVp4UG1Md2xicWNsZGM0TDNqUm5vQkttOEJ5a2s4WXJIMjFq?=
 =?utf-8?B?MFVkajN6ZHBIdHROcTFiWGJzWlBvcnBzQnloK2lCOFRTT1VCSXgwWjZ6REtz?=
 =?utf-8?B?cStpZittRkpRU3NiUUE0ZTVMQ2E3cGorcXAvYU01dHVPVURzeTdJY2UyOFFj?=
 =?utf-8?B?a1d5YmNoTFVUM0pXMExrU2lKbmYvSDdkTll0NXBseFl1clhuZzgrNzdnMCtT?=
 =?utf-8?B?Y09PTXNrS1Fyd3B3d2ZVeEhKQnhXdHpVR1dWM3EybXhNWENyOEdPR2ZGSnFr?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd322c1-3b48-41e5-2366-08dd9dc80845
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:14:21.5931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X4FIaijMgUj8bPzvbd3Vh69xgS1Tl6bTgHbBzNFfVd6jlMkjU3uKHFQ/+WeDoRmqOiu/2GlnsUKt47K90cidgR8WeHzmJLvjwNY3Eo1QoGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8277
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

On Thu, May 22, 2025 at 09:55:14AM +0200, Zbigniew Kempczyński wrote:
> Instead of predefining number of entries in bo array calculate this
> on compile time. This prevents from use predefined number of entries
> in other functions and encloses elements calculation to local function
> only.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  lib/intel_compute.c | 56 ++++++++++++++++++++++-----------------------
>  1 file changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index d2629ed911..d47e2b08ef 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -767,8 +767,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  			 struct drm_xe_engine_class_instance *eci,
>  			 struct user_execenv *user)
>  {
> -#define BO_DICT_ENTRIES 7
> -	struct bo_dict_entry bo_dict[BO_DICT_ENTRIES] = {
> +	struct bo_dict_entry bo_dict[] = {
>  		{ .addr = ADDR_INDIRECT_OBJECT_BASE + OFFSET_KERNEL,
>  		  .name = "kernel" },
>  		{ .addr = ADDR_DYNAMIC_STATE_BASE,
> @@ -793,6 +792,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
>  	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
>  	uint16_t devid = intel_get_drm_devid(fd);
> +	int entries = ARRAY_SIZE(bo_dict);
>  
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
> @@ -801,7 +801,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  	bo_dict[4].size = size_input(execenv.array_size);
>  	bo_dict[5].size = size_output(execenv.array_size);
>  
> -	bo_execenv_bind(&execenv, bo_dict, BO_DICT_ENTRIES);
> +	bo_execenv_bind(&execenv, bo_dict, entries);
>  
>  	memcpy(bo_dict[0].data, kernel, size);
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> @@ -851,7 +851,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  			igt_assert_eq_double(output, expected_output);
>  	}
>  
> -	bo_execenv_unbind(&execenv, bo_dict, BO_DICT_ENTRIES);
> +	bo_execenv_unbind(&execenv, bo_dict, entries);
>  	bo_execenv_destroy(&execenv);
>  }
>  
> @@ -1062,8 +1062,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  			      struct drm_xe_engine_class_instance *eci,
>  			      struct user_execenv *user)
>  {
> -#define XEHP_BO_DICT_ENTRIES 9
> -	struct bo_dict_entry bo_dict[XEHP_BO_DICT_ENTRIES] = {
> +	struct bo_dict_entry bo_dict[] = {
>  		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
>  		  .name = "instr state base"},
>  		{ .addr = ADDR_DYNAMIC_STATE_BASE,
> @@ -1092,6 +1091,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  	float *input_data, *output_data;
>  	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
>  	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
> +	int entries = ARRAY_SIZE(bo_dict);
>  
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
> @@ -1100,7 +1100,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  	bo_dict[4].size = size_input(execenv.array_size);
>  	bo_dict[5].size = size_output(execenv.array_size);
>  
> -	bo_execenv_bind(&execenv, bo_dict, XEHP_BO_DICT_ENTRIES);
> +	bo_execenv_bind(&execenv, bo_dict, entries);
>  
>  	memcpy(bo_dict[0].data, kernel, size);
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> @@ -1146,7 +1146,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  			igt_assert_eq_double(output, expected_output);
>  	}
>  
> -	bo_execenv_unbind(&execenv, bo_dict, XEHP_BO_DICT_ENTRIES);
> +	bo_execenv_unbind(&execenv, bo_dict, entries);
>  	bo_execenv_destroy(&execenv);
>  }
>  
> @@ -1299,8 +1299,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  			       struct drm_xe_engine_class_instance *eci,
>  			       struct user_execenv *user)
>  {
> -#define XEHPC_BO_DICT_ENTRIES 6
> -	struct bo_dict_entry bo_dict[XEHPC_BO_DICT_ENTRIES] = {
> +	struct bo_dict_entry bo_dict[] = {
>  		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
>  		  .name = "instr state base"},
>  		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
> @@ -1320,6 +1319,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  	float *input_data, *output_data;
>  	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
>  	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
> +	int entries = ARRAY_SIZE(bo_dict);
>  
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
> @@ -1328,7 +1328,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  	bo_dict[2].size = size_input(execenv.array_size);
>  	bo_dict[3].size = size_output(execenv.array_size);
>  
> -	bo_execenv_bind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
> +	bo_execenv_bind(&execenv, bo_dict, entries);
>  
>  	memcpy(bo_dict[0].data, kernel, size);
>  	xehpc_create_indirect_data(bo_dict[1].data, bind_input_addr, bind_output_addr,
> @@ -1371,7 +1371,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  			igt_assert_eq_double(output, expected_output);
>  	}
>  
> -	bo_execenv_unbind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
> +	bo_execenv_unbind(&execenv, bo_dict, entries);
>  	bo_execenv_destroy(&execenv);
>  }
>  
> @@ -1692,8 +1692,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  			       struct drm_xe_engine_class_instance *eci,
>  			       struct user_execenv *user)
>  {
> -#define XELPG_BO_DICT_ENTRIES 9
> -	struct bo_dict_entry bo_dict[XELPG_BO_DICT_ENTRIES] = {
> +	struct bo_dict_entry bo_dict[] = {
>  		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
>  		  .name = "instr state base"},
>  		{ .addr = ADDR_DYNAMIC_STATE_BASE,
> @@ -1724,6 +1723,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  	float *input_data, *output_data;
>  	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
>  	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
> +	int entries = ARRAY_SIZE(bo_dict);
>  
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
> @@ -1732,7 +1732,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  	bo_dict[4].size = size_input(execenv.array_size);
>  	bo_dict[5].size = size_output(execenv.array_size);
>  
> -	bo_execenv_bind(&execenv, bo_dict, XELPG_BO_DICT_ENTRIES);
> +	bo_execenv_bind(&execenv, bo_dict, entries);
>  
>  	memcpy(bo_dict[0].data, kernel, size);
>  
> @@ -1780,7 +1780,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  			igt_assert_eq_double(output, expected_output);
>  	}
>  
> -	bo_execenv_unbind(&execenv, bo_dict, XELPG_BO_DICT_ENTRIES);
> +	bo_execenv_unbind(&execenv, bo_dict, entries);
>  	bo_execenv_destroy(&execenv);
>  }
>  
> @@ -1797,8 +1797,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  				struct drm_xe_engine_class_instance *eci,
>  				struct user_execenv *user)
>  {
> -#define XE2_BO_DICT_ENTRIES 10
> -	struct bo_dict_entry bo_dict[XE2_BO_DICT_ENTRIES] = {
> +	struct bo_dict_entry bo_dict[] = {
>  		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
>  		  .name = "instr state base"},
>  		{ .addr = ADDR_DYNAMIC_STATE_BASE,
> @@ -1832,6 +1831,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  	float *input_data, *output_data;
>  	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
>  	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
> +	int entries = ARRAY_SIZE(bo_dict);
>  
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
> @@ -1840,7 +1840,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  	bo_dict[4].size = size_input(execenv.array_size);
>  	bo_dict[5].size = size_output(execenv.array_size);
>  
> -	bo_execenv_bind(&execenv, bo_dict, XE2_BO_DICT_ENTRIES);
> +	bo_execenv_bind(&execenv, bo_dict, entries);
>  
>  	memcpy(bo_dict[0].data, kernel, size);
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> @@ -1888,7 +1888,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  			igt_assert_eq_double(output, expected_output);
>  	}
>  
> -	bo_execenv_unbind(&execenv, bo_dict, XE2_BO_DICT_ENTRIES);
> +	bo_execenv_unbind(&execenv, bo_dict, entries);
>  	bo_execenv_destroy(&execenv);
>  }
>  
> @@ -2067,8 +2067,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  					struct drm_xe_engine_class_instance *eci,
>  					bool threadgroup_preemption)
>  {
> -#define XE2_BO_PREEMPT_DICT_ENTRIES 11
> -	struct bo_dict_entry bo_dict_long[XE2_BO_PREEMPT_DICT_ENTRIES] = {
> +	struct bo_dict_entry bo_dict_long[] = {
>  		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
>  		  .name = "instr state base"},
>  		{ .addr = ADDR_DYNAMIC_STATE_BASE,
> @@ -2101,19 +2100,20 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  		  .name = "sip kernel"},
>  	};
>  
> -	struct bo_dict_entry bo_dict_short[XE2_BO_PREEMPT_DICT_ENTRIES];
> +	struct bo_dict_entry bo_dict_short[ARRAY_SIZE(bo_dict_long)];
>  	struct bo_execenv execenv_short, execenv_long;
>  	float *input_short, *output_short, *input_long;
>  	unsigned int long_kernel_loop_count = 0;
>  	int64_t timeout_one_ns = 1;
>  	bool use_loop_kernel = loop_kernel && !threadgroup_preemption;
> +	int entries = ARRAY_SIZE(bo_dict_long);
>  
>  	if (threadgroup_preemption)
>  		long_kernel_loop_count = TGP_long_kernel_loop_count;
>  	else
>  		long_kernel_loop_count = WMTP_long_kernel_loop_count;
>  
> -	for (int i = 0; i < XE2_BO_PREEMPT_DICT_ENTRIES; ++i)
> +	for (int i = 0; i < entries; ++i)
>  		bo_dict_short[i] = bo_dict_long[i];
>  
>  	bo_execenv_create(fd, &execenv_short, eci, NULL);
> @@ -2125,8 +2125,8 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  		bo_dict_long[0].size = ALIGN(long_kernel_size, 0x1000);
>  	bo_dict_short[0].size = ALIGN(short_kernel_size, 0x1000);
>  
> -	bo_execenv_bind(&execenv_long, bo_dict_long, XE2_BO_PREEMPT_DICT_ENTRIES);
> -	bo_execenv_bind(&execenv_short, bo_dict_short, XE2_BO_PREEMPT_DICT_ENTRIES);
> +	bo_execenv_bind(&execenv_long, bo_dict_long, entries);
> +	bo_execenv_bind(&execenv_short, bo_dict_short, entries);
>  
>  	if (use_loop_kernel)
>  		memcpy(bo_dict_long[0].data, loop_kernel, loop_kernel_size);
> @@ -2187,8 +2187,8 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  
>  	bo_execenv_sync(&execenv_long);
>  
> -	bo_execenv_unbind(&execenv_short, bo_dict_short, XE2_BO_PREEMPT_DICT_ENTRIES);
> -	bo_execenv_unbind(&execenv_long, bo_dict_long, XE2_BO_PREEMPT_DICT_ENTRIES);
> +	bo_execenv_unbind(&execenv_short, bo_dict_short, entries);
> +	bo_execenv_unbind(&execenv_long, bo_dict_long, entries);
>  
>  	bo_execenv_destroy(&execenv_short);
>  	bo_execenv_destroy(&execenv_long);
> -- 
> 2.43.0
> 
