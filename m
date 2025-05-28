Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE302C5AD49
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 09:12:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C06710E599;
	Wed, 28 May 2025 09:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k5eQgHnE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F2710E1EA
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 09:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748423549; x=1779959549;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WBHXeJmFweLXeMZ5EvlmZXm8gF3Uxf0hGQ1gsYJgmys=;
 b=k5eQgHnEOXVJ9KCL0yhQDCKNHIxCVab1RG9mAvF0Pf7KsITyiBBcW8T6
 YfGABhbDD1jciDHF/4vqivbccrA7B1i5lgNCniVZ2eBA9d2tqxqI8bClW
 pzWf4b8WmrZL/OeM5ZQlGF2wE9mTkV9hK2vSnfWQq2wgn9TpD2opXgVqH
 GfYB+NrADUciIrZDDzFWTz2o4RKxJhElZ7psCOeXtpsr25kENybnn3A0J
 HzaEnGY/PtTbS/K99ubWZ5sQwCvJLEjt3NBYoJpHdekp9NObE1vEoQpxS
 cB3Mbqt6IWoMny7zC0Wc6YsKa9P1ixeq2DlLTpr8DnI0jmfauBX87/vVb g==;
X-CSE-ConnectionGUID: CZL1LIH1SI6nI24PNTKshA==
X-CSE-MsgGUID: m6huGYmrTfu6I1RY/o8ASA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50140138"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="50140138"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:12:29 -0700
X-CSE-ConnectionGUID: LtHT7IQ+QBmqUQcqP0tnHA==
X-CSE-MsgGUID: CtuDtdeoRMykD7EjDfCRhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="143099319"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:12:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 02:12:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 02:12:28 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.62)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 02:12:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TbXsU5qO6VnOuLII3aysfLM/Z+s68wD9Av3wnwA7dugFcTg2v5GGpTDjr+iopw8OiLjEdikRQJkcEu1XlYWzQsETQq/BKMYuSjWI7uJyhivzt6ODIzPJwlGlfCW0NYiuOqinEvwJWf0MYda6NV/bJUFToLJv7LIzcEPt0F4w7cOgNHBvDGH6UoQF3PmCgyhhiTkyAZHzj7af++FblzpSCit9KsNdZcxzrXbL1SX+VNtQ7cMX7+jk2yzmJUngjN0rY9GyTqGE6qZBKs51boo7/pNTw++A1+v8NAejVvKLg/IoWJtyPi4AyvonWYMZ2sAIL4n1nmM+LjFxpmgFVPsntQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiyOo2aWM5LU/h/neIi3xmGMwE5xoU7V0OHH1yr4qEc=;
 b=RjJzsEiJB0uulp87AsSjygXq8Rj7zZNqjaDsSnqrc9CyPYDwtL6reBDKvUXKlisZaKfBxkxyn9ieNe5l6JqUVNVedrvM+JoaflerEImgXseJWu2souM4FXzjqNT+s3o1myGksYFWl4SzBi38FqzgOP/gJjf4kU3rYDykA8m6Bm3tp+EvfZKloqwaGgGP5iwiCpZJpm+HlsyyEc1iy3mFMPt6LCt24b+jbwwbjQCrxAwcbLhwULZ1+vOhDiLBPkRLoHAk788YCxiGHu//AnI3FDcIOcM5EgV7WBBVhOWpqcLDxystkcaNIorogyOE82jjSjWan5d0JPERycXg03PDpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB8277.namprd11.prod.outlook.com (2603:10b6:806:25a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 28 May
 2025 09:12:26 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 09:12:26 +0000
Date: Wed, 28 May 2025 11:12:23 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 2/4] lib/intel_compute: simplify compute-preempt
 subtests
Message-ID: <aDbTd41P38rjqwiH@fdugast-desk>
References: <20250522075515.168920-1-zbigniew.kempczynski@intel.com>
 <20250522075515.168920-3-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250522075515.168920-3-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB8PR04CA0027.eurprd04.prod.outlook.com
 (2603:10a6:10:110::37) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB8277:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f453c6e-1056-4605-de6b-08dd9dc7c3aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qk4vV2d5SFIyMzhuMFV0cHRiZVJwOUdKRUJGMndpTGVLY3RvRFZQWU12a1Fy?=
 =?utf-8?B?aVRBWmNPbUh3L01iQ0NlQW9jVFQxdWpadHcvbFRuY2xJNXNEeDIyaGhUcEVi?=
 =?utf-8?B?SU9vQXB3MXBNRnlTYk0yWVJXZ0MxR0pVNDhRTzhNMmtBNnBqRmJ2WG0xRzIv?=
 =?utf-8?B?ditVeXRXZE9LNTE0YmxENENpWDVIZ0NLYlFNRzRHMWd3R00xcXkwMC85N0Fh?=
 =?utf-8?B?T1llRW0ydHlOQUpweXRyWk1JdExXdnRoNHRrZWJDNGNCR0UxWlRXSEdSamtX?=
 =?utf-8?B?SUNEOTBkd2dJaWZCQXNqY05zMkFoQ0hBVGUwYW9VZTdVaXJaTTZmeExCMGI0?=
 =?utf-8?B?Nm5yc2ZFdmtjaXlxeWJnWSs3dkZqY05iQW5iYk9ZaFVIRkFnRkFYNXlubmpJ?=
 =?utf-8?B?bnRBRnJZQ0ZOUXhYeVQwc3J2UVFGSlFya1VOd3NiZi9FSm1ORDBPNm1hOTI5?=
 =?utf-8?B?d0czTlFzUERkbmtOQ1grc1FkaWVpcHljTUc3ZGl3TWhycUlwZkZITjFvWWpI?=
 =?utf-8?B?NFY2S3J6SExnTzJrSUNGZm54M0J0emk5NUVKVi8yWmJ6SFN0MDBoMlpJM3pD?=
 =?utf-8?B?YWhDWTRRcUliMGVwbU1RRnMvRGg1ZjF4bmh5WnJiUnV0MWhiVnFrbDh2M2ww?=
 =?utf-8?B?c0FuenA5bFJoWlZwY0RkMXBwdXUzaStweGNBZnNFNVNoMmZXYW9RNVkvT3Y2?=
 =?utf-8?B?eXJGZC9aK25LRllBUVRYS3ZscWxiMnZoZzM3SHhSa3hrOWZuWTJrVXpHWW16?=
 =?utf-8?B?K1hPQTYwL1UyTjRJcVRXODFRZzY3cTZSeXV3M0xqL1FEN2V6aVFYWXplWTln?=
 =?utf-8?B?NFFTc3hrYXZTRkUxME5veEVncnBxVXpNTzNySVc2enFNeE5xWXI1S1MvUC81?=
 =?utf-8?B?RTZmQnhnbS8vNFV4NzRGSVQyaDhqOFB3WUx4UHJyRGpjOXkvY3ZTYllyaXFq?=
 =?utf-8?B?a0JHdnBEVEhBcnBzZHpVZVA2aDFtVGc4TXpVNHVuQ0hhSVV6ekpVYzNTNndr?=
 =?utf-8?B?dkdaZEZkNXI3azVqaHhPSFlZellQb1RvM0ZJQW1TQzhvYWxKTGRYNllXOTRV?=
 =?utf-8?B?Y3c2S2F2ZnRvRXBRdnZTUlVxK1dOb29vRkhBMXJ3TGhiNkVHVThqRXhTT0lh?=
 =?utf-8?B?amd6UkZTU2FPUG92Z1NmdGJsUmxXd2c2cldhQVZtUWZ3U1AvZjBaQ1pBbjNR?=
 =?utf-8?B?dE8yR1phYW44K25HVDhQRkVTUHplVEZUQW5MUGFKcWh1ei9vd3pqWEs2VDJN?=
 =?utf-8?B?eEtQRDFGbEN0NDZBRUFDRC9PeklOdXNDYmluMnF2VXNYUGlLY0lRNnNDeUhK?=
 =?utf-8?B?U0ZGR1krYW52SHpsVTdDT3NnNDJ5WDNDR3BCTXJXUTlQcDRybFB2cjB1YWtY?=
 =?utf-8?B?ODd1VHNoQTVPK1NxcHpKek5pYzFQUjl1V0Ywbi9jdTlmbERUYVM1QVNiYVQ3?=
 =?utf-8?B?NDk5KzBJbmFYajljelBBd1d0a1RJSk4rOElIVkY1ay9OWGhpQXFJaElpQ1hy?=
 =?utf-8?B?UHRyNG1NbGNxcURVZ3RoNS83eExNSEhCalowNndHYm5UT0hPT25zUDA3WCtB?=
 =?utf-8?B?cmJnUjg3N05XTVR3WUZyb0dyd0tSb04rNUFIYlE2UWZKRnFVUG1WOFB4L0Fk?=
 =?utf-8?B?aDlFSUo2YkFKa0R3WmRNOEVLWmxYdC9aTENzbzJEU1cwaHoxQklJaXhDWUZP?=
 =?utf-8?B?YXJtY2NzWEIyMTdJejlGaTY2aTg4NFM5UmN5ZTJJUlFucVNDazlOekYvOWZz?=
 =?utf-8?B?ZDFCRGF0YzAxVnJaVTIzU0ZYL2tVUDBTVTBPQnZFWGxPd0pGblM1TmRPYjV1?=
 =?utf-8?B?Z01DbnZ4MFQ4UFhQcGdhOGRuYVBOY3ZZMVI5cnYxOUJvN2RZaG95MTBGMkFY?=
 =?utf-8?B?YzROVFlJSHA1M3l1cVo3YTl4dzFvMEg3MmV2VFkxZTI2Y1A4aUFxaWpodnNY?=
 =?utf-8?Q?yg32pvmBGMo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEdJc0FYbGVPV3hIMlNzMWViRGJJTTNSY3RyRCtQUFNnRFhwcjZYb0wyMUU3?=
 =?utf-8?B?andXVGlFQ1ZtYys3STJ6eXd2L0xrcC9pREJRMVBjYndZV3plZlN4dmRXN0Iw?=
 =?utf-8?B?ZTc3eU9reGk5c1dCUVNoZVh1RkFLRzBpWVkwbzd5R3ltd0VQODZvY0dUeFpt?=
 =?utf-8?B?L01HNjNxT0M5TlduOGJlSlFzMVpRalIzUThIL1VvbHk1YytGMlVlc2xOc0pI?=
 =?utf-8?B?cERZL2VxVndZM0pUeVc5ditPZTFZclAwQ2F2RUV3cXA5Y1FmYyt2QzEvUU5y?=
 =?utf-8?B?OWU1cmZ5dEs2RDZUd04xMHF5MERzc2J0TDJuSnFpTVhCbVVuZFdkMTBzS0kw?=
 =?utf-8?B?eUFTOEFTbUFnTkhicDMydnlBTGl4Tm9JWnc2T3lHZm1sL3g2WE0rV1B6dUs2?=
 =?utf-8?B?bWUvdnhTemYzTFVHK1dTT3RraVQzTUwxK1JYb3JKejU2aWt6SXJCNU9NVjNF?=
 =?utf-8?B?K2tub2ZsQm05YkdFUjhFcENTUURUcngweDUyTkc3NitKemZUZmZuT3lNTVNl?=
 =?utf-8?B?VkU1TmcyUGdDN0cxK0N6UFRZYWRDWUlwN3RKaDhQeGh3NEFucjE1RkJldzF4?=
 =?utf-8?B?VVhEZmU2bHlmamFJV1RmRkpSKzVoVzdjV2w5a0IzajU3VlZaNzJUNTVYaGZw?=
 =?utf-8?B?SHVIRVpCTCtLamd5cEV2elZ0RVlLbFg0c0l4RTJXK3BpcHNYN3lqb3VKVmpW?=
 =?utf-8?B?QUdMdldTS21xSm96OEJCUjBBb0tYTmhuRVNuQTcyb05WdVJkdSs0L2tERzBv?=
 =?utf-8?B?M01jeEU5dXl6K3Zlb0N6eXM1WnZGcWt6VWxvMEhYRXN4THhScEtmRXRYcWVr?=
 =?utf-8?B?d3VOQWpPRUJqSll4dnVCTzE3K1NBVklJaTBRQzRqK21Ca1hiU28xZjlnL1Nu?=
 =?utf-8?B?SjRyeUlHWGE0d0R0RExQWXBNbEVVSXZjNDEveDRmN3JtRE5PdkoyMXhHZFJs?=
 =?utf-8?B?VWFydDlLLzEwMy9JVWFvTHNFZ2s2dlVqRW5aOThNbG1rZ3IyVk5IK2svaE83?=
 =?utf-8?B?YmZGSjgwSVN2WHZXY29kYUdobzF5UmFUYm5QUzhtL0hsVVlta05HUVE3R1lS?=
 =?utf-8?B?MGUrSy9hMVhCclV5TlZQYUoxeDZhalBXMEdFaG5GZUl0eDBEejhieVlIZUFP?=
 =?utf-8?B?OE1Ib2F2YXU5b1VUMmZENm9taG8xZG1UTFZxNml3Tjh2cDlMQ1NJT1RPOXp0?=
 =?utf-8?B?MkkxSUY1KzQ1SHRwUGN4emZ5b2ptTTFvOGpCdVdwamNhU29qVkVCNFVzSzNj?=
 =?utf-8?B?UW1rS3VCOExXMzUvK0RDU3BUdytiS2tCeUdOOWlGK0NJL3ZKSEZWWnNYTERl?=
 =?utf-8?B?WnJuYitXUGNEN3U3dmx4cWcwd0tuOTl2WmtSRXFNbWxTY3RlN01zSGhVQnAy?=
 =?utf-8?B?TDNZbDE2eGFCNE1GSExWRDNZQ2VTcXgrQlR6ZGpQMG1xYTVZS2U1bWcyMXdz?=
 =?utf-8?B?dnZOeW5MYWMveDQ0MDZ4TTcrZmhVWHRKZ1htaDVFMGdWQmZxZ0dRa20zNFB5?=
 =?utf-8?B?b2k1STBUSzFXbkdlN2t2MWM2MXlMVjgvSUk1d0xxZlNxK0FNUFNYWjQrRTdD?=
 =?utf-8?B?L0VMb296TXFScmMvc2lXaG9RV0gybkR1OGsrdCtpUGpBMjhLMlIzcFpOZG9q?=
 =?utf-8?B?bnBrVzFkbkdWMHBRV2J6MjRveXJaNnh3NDR1NU1zOUw0YW54ZXdVTXlRRmJL?=
 =?utf-8?B?NENXWXplSEpKSGFYZ2p0bnQwRlRYT1NKb3Jyc1lPTnIyNUVQZU0vOXlzaFpQ?=
 =?utf-8?B?MTdnNDNZR3o2bEdIU1J1ZlhRYTZmZVVKaUE4Y0p6TVorMUYrV1g2aHRlVXNk?=
 =?utf-8?B?NmM2S2VzWmJWek5kTkZhZ3BxV01CVFFSYmsrMUwvT29qU0RIeUlSOVlHUEZt?=
 =?utf-8?B?ZU53UXhvVjlVcTQwUEpzZThzeDBLWU1yV2hwanRwdjM1VEpwcTNHNmhnQUdU?=
 =?utf-8?B?TnNTdmIyNXNaNTdpQlkydEdKbUVIM1I4b2l2NnVWZlQrR3dWaWJTSUhzdWpG?=
 =?utf-8?B?bm9mQWZwdXNnVk5FVFJHRHhLb09zOEtuRTlUTmE0K3N0QXBGVUdqR3Bmc25K?=
 =?utf-8?B?aUJSUEZYWVd3Ump6YWJMbHZtU1BKbCt2NVNrZDFXWnh2dzEzRlkvN0xuaFF0?=
 =?utf-8?B?R2JoK083WlJ4V2RJR2hkVXdJKzAzL2pZYXVSb2l4b2gzQWJ6cU8wR3BZaWFL?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f453c6e-1056-4605-de6b-08dd9dc7c3aa
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:12:26.5259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JH0NAeTIu5DlCrmjLrTqTDTWBtCrBsu/k2iV3FWMYwsWPppga1D0xQ16+k0jG2AyNf2aCnfo5ZrsMuDwcL8Mb4vR0oFhcNkBIZP/MXkA6sI=
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

On Thu, May 22, 2025 at 09:55:13AM +0200, Zbigniew Kempczyński wrote:
> Code in compute-preempt-exec uses locally created user-fences what
> takes a lot of lines. Introduced bo_execenv_exec_async() allows to
> synchronize later with user-fence defined in execenv itself.
> 
> Moreover logic of wmtp and threadgroup preempt scenarios was simplified.
> Now both cases assume compute-square (short running job) must complete
> before long running job will end. For WMTP we have full control and
> we're able to stop it via write MAGIC value to input buffer (shader
> waits for it to break endless loop). For threadgroup this is harder
> to achieve because preemption occurs on some point where threadgroup
> ends its execution. Shader (increment loop) for threadgroup preemption
> uses large x-dim what causes short job preempts it on some point of time.
> This unfortunately requires some fine tweaking (setting x-dim) but
> at the moment I haven't found better way to implement this case.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  lib/intel_compute.c | 152 ++++++++++++--------------------------------
>  1 file changed, 41 insertions(+), 111 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 5579bec85b..d2629ed911 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -67,6 +67,7 @@
>   */
>  #define TGP_long_kernel_loop_count		10
>  #define WMTP_long_kernel_loop_count		1000000
> +#define XE2_THREADGROUP_PREEMPT_XDIM		0x200000
>  
>  struct bo_dict_entry {
>  	uint64_t addr;
> @@ -102,6 +103,25 @@ struct bo_execenv {
>  	struct user_execenv *user;
>  };
>  
> +static void bo_randomize(float *ptr, int size)
> +{
> +	srand(time(NULL));
> +	for (int i = 0; i < size; i++)
> +		ptr[i] = rand() / (float)RAND_MAX;
> +}
> +
> +static void bo_check_square(float *input, float *output, int size)
> +{
> +	for (int i = 0; i < size; i++) {
> +		float expected_output = input[i] * input[i];
> +
> +		if (output[i] != expected_output)
> +			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
> +				  i, input[i], output[i], expected_output);
> +		igt_assert_eq_double(output[i], expected_output);
> +	}
> +}
> +
>  static void bo_execenv_create(int fd, struct bo_execenv *execenv,
>  			      struct drm_xe_engine_class_instance *eci,
>  			      struct user_execenv *user)
> @@ -1584,10 +1604,10 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  
>  	if (threadgroup_preemption)
>  		/*
> -		 * Create multiple threadgroups using higher gloabl workgroup size
> +		 * Create multiple threadgroups using higher global workgroup size
>  		 * Global Workgroup size = Local X * Thread Group X +  Local Y * Thread Group Y + Local Z * Thread Group Z
>  		 */
> -		addr_bo_buffer_batch[b++] = 0x00200000; // Thread Group ID X Dimension
> +		addr_bo_buffer_batch[b++] = XE2_THREADGROUP_PREEMPT_XDIM; // Thread Group ID X Dimension
>  	else
>  		addr_bo_buffer_batch[b++] = size_thread_group_x(work_size);
>  
> @@ -2077,30 +2097,15 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  		  .size = 0x6400000,
>  		  .name = "state context data base"},
>  		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_STATE_SIP,
> +		  .size = ALIGN(sip_kernel_size, 0x1000),
>  		  .name = "sip kernel"},
>  	};
>  
>  	struct bo_dict_entry bo_dict_short[XE2_BO_PREEMPT_DICT_ENTRIES];
>  	struct bo_execenv execenv_short, execenv_long;
> -	float *input_data, *output_data;
> -	unsigned int long_kernel_loop_count;
> -	struct drm_xe_sync sync_long = {
> -		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> -		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> -		.timeline_value = USER_FENCE_VALUE,
> -	};
> -	struct bo_sync *bo_sync_long;
> -	size_t bo_size_long = sizeof(*bo_sync_long);
> -	uint32_t bo_long = 0;
> -	struct drm_xe_sync sync_short = {
> -		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> -		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> -		.timeline_value = USER_FENCE_VALUE,
> -	};
> -	struct bo_sync *bo_sync_short;
> -	size_t bo_size_short = sizeof(*bo_sync_short);
> -	uint32_t bo_short = 0;
> -	int64_t timeout_short = 1;
> +	float *input_short, *output_short, *input_long;
> +	unsigned int long_kernel_loop_count = 0;
> +	int64_t timeout_one_ns = 1;
>  	bool use_loop_kernel = loop_kernel && !threadgroup_preemption;
>  
>  	if (threadgroup_preemption)
> @@ -2114,41 +2119,12 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  	bo_execenv_create(fd, &execenv_short, eci, NULL);
>  	bo_execenv_create(fd, &execenv_long, eci, NULL);
>  
> -	/* Prepare sync object for long */
> -	bo_size_long = xe_bb_size(fd, bo_size_long);
> -	bo_long = xe_bo_create(fd, execenv_long.vm, bo_size_long, vram_if_possible(fd, 0),
> -			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -	bo_sync_long = xe_bo_map(fd, bo_long, bo_size_long);
> -	sync_long.addr = to_user_pointer(&bo_sync_long->sync);
> -	xe_vm_bind_async(fd, execenv_long.vm, 0, bo_long, 0, ADDR_SYNC, bo_size_long,
> -			 &sync_long, 1);
> -	xe_wait_ufence(fd, &bo_sync_long->sync, USER_FENCE_VALUE, execenv_long.exec_queue,
> -		       INT64_MAX);
> -	bo_sync_long->sync = 0;
> -	sync_long.addr = ADDR_SYNC;
> -
> -	/* Prepare sync object for short */
> -	bo_size_short = xe_bb_size(fd, bo_size_short);
> -	bo_short = xe_bo_create(fd, execenv_short.vm, bo_size_short, vram_if_possible(fd, 0),
> -			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -	bo_sync_short = xe_bo_map(fd, bo_short, bo_size_short);
> -	sync_short.addr = to_user_pointer(&bo_sync_short->sync);
> -	xe_vm_bind_async(fd, execenv_short.vm, 0, bo_short, 0, ADDR_SYNC2, bo_size_short,
> -			 &sync_short, 1);
> -	xe_wait_ufence(fd, &bo_sync_short->sync, USER_FENCE_VALUE, execenv_short.exec_queue,
> -		       INT64_MAX);
> -	bo_sync_short->sync = 0;
> -	sync_short.addr = ADDR_SYNC2;
> -
>  	if (use_loop_kernel)
>  		bo_dict_long[0].size = ALIGN(loop_kernel_size, 0x1000);
>  	else
>  		bo_dict_long[0].size = ALIGN(long_kernel_size, 0x1000);
>  	bo_dict_short[0].size = ALIGN(short_kernel_size, 0x1000);
>  
> -	bo_dict_long[10].size = ALIGN(sip_kernel_size, 0x1000);
> -	bo_dict_short[10].size = ALIGN(sip_kernel_size, 0x1000);
> -
>  	bo_execenv_bind(&execenv_long, bo_dict_long, XE2_BO_PREEMPT_DICT_ENTRIES);
>  	bo_execenv_bind(&execenv_short, bo_dict_short, XE2_BO_PREEMPT_DICT_ENTRIES);
>  
> @@ -2172,17 +2148,11 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  	xelpg_create_indirect_data(bo_dict_short[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
>  	xehp_create_surface_state(bo_dict_short[7].data, ADDR_INPUT, ADDR_OUTPUT);
>  
> -	input_data = (float *) bo_dict_long[4].data;
> -	output_data = (float *) bo_dict_short[5].data;
> -	srand(time(NULL));
> +	input_long = (float *) bo_dict_long[4].data;
> +	input_short = (float *) bo_dict_short[4].data;
> +	output_short = (float *) bo_dict_short[5].data;
>  
> -	for (int i = 0; i < SIZE_DATA; i++)
> -		input_data[i] = rand() / (float)RAND_MAX;
> -
> -	input_data = (float *) bo_dict_short[4].data;
> -
> -	for (int i = 0; i < SIZE_DATA; i++)
> -		input_data[i] = rand() / (float)RAND_MAX;
> +	bo_randomize(input_short, SIZE_DATA);
>  
>  	xe2lpg_compute_exec_compute(bo_dict_long[8].data, ADDR_GENERAL_STATE_BASE,
>  				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
> @@ -2196,66 +2166,26 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP,
>  				    false, SIZE_DATA);
>  
> -	xe_exec_sync(fd, execenv_long.exec_queue, ADDR_BATCH, &sync_long, 1);
> +	bo_execenv_exec_async(&execenv_long, ADDR_BATCH);
>  
>  	/* Wait until multiple LR jobs will start to occupy gpu */
>  	if (use_loop_kernel)
>  		sleep(1);
>  
> -	xe_exec_sync(fd, execenv_short.exec_queue, ADDR_BATCH, &sync_short, 1);
> -
> -	xe_wait_ufence(fd, &bo_sync_short->sync, USER_FENCE_VALUE, execenv_short.exec_queue,
> -		       INT64_MAX);
> +	/*
> +	 * Regardless scenario - wmtp or threadgroup short job (compute
> +	 * square) must complete first and long job must be still active.
> +	 */
> +	bo_execenv_exec(&execenv_short, ADDR_BATCH);
> +	bo_check_square(input_short, output_short, SIZE_DATA);
>  
>  	/* Check that the long kernel has not completed yet */
> -	igt_assert_neq(0, __xe_wait_ufence(fd, &bo_sync_long->sync, USER_FENCE_VALUE,
> -					   execenv_long.exec_queue, &timeout_short));
> +	igt_assert_neq(0, __xe_wait_ufence(fd, &execenv_long.bo_sync->sync, USER_FENCE_VALUE,
> +					   execenv_long.exec_queue, &timeout_one_ns));
>  	if (use_loop_kernel)
> -		((int *)bo_dict_long[4].data)[0] = MAGIC_LOOP_STOP;
> +		((int *)input_long)[0] = MAGIC_LOOP_STOP;
>  
> -	xe_wait_ufence(fd, &bo_sync_long->sync, USER_FENCE_VALUE, execenv_long.exec_queue,
> -		       INT64_MAX);
> -
> -	munmap(bo_sync_long, bo_size_long);
> -	gem_close(fd, bo_long);
> -
> -	munmap(bo_sync_short, bo_size_short);
> -	gem_close(fd, bo_short);
> -
> -	for (int i = use_loop_kernel ? 1 : 0; i < SIZE_DATA; i++) {
> -		float input = input_data[i];
> -		float output = output_data[i];
> -		float expected_output = input * input;
> -
> -		if (output != expected_output)
> -			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
> -				  i, input, output, expected_output);
> -		igt_assert_eq_double(output, expected_output);
> -	}
> -
> -	for (int i = 0; i < SIZE_DATA; i++) {
> -		float f1;
> -
> -		f1 = ((float *) bo_dict_long[5].data)[i];
> -
> -		if (threadgroup_preemption) {
> -			if (f1 < long_kernel_loop_count)
> -				igt_debug("[%4d] f1: %f != %u\n", i, f1, long_kernel_loop_count);
> -
> -			/* Final incremented value should be greater than loop count
> -			 * as the kernel is ran by multiple threads and output variable
> -			 * is shared among all threads. This enusres multiple threadgroup
> -			 * workload execution
> -			 */
> -			igt_assert(f1 > long_kernel_loop_count);
> -		} else {
> -			if (!loop_kernel) {
> -				if (f1 != long_kernel_loop_count)
> -					igt_debug("[%4d] f1: %f != %u\n", i, f1, long_kernel_loop_count);
> -				igt_assert(f1 == long_kernel_loop_count);
> -			}
> -		}
> -	}
> +	bo_execenv_sync(&execenv_long);
>  
>  	bo_execenv_unbind(&execenv_short, bo_dict_short, XE2_BO_PREEMPT_DICT_ENTRIES);
>  	bo_execenv_unbind(&execenv_long, bo_dict_long, XE2_BO_PREEMPT_DICT_ENTRIES);
> -- 
> 2.43.0
> 
