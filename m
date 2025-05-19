Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A21C3DA6D
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 07:57:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABBC10E301;
	Mon, 19 May 2025 07:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hij9OS07";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5097710E36B
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 07:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747641432; x=1779177432;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WpD3jBcayDIEI3YUP5lb0yWm6RIM8xRaIsqq5i70ZkI=;
 b=Hij9OS07PGv9c3au9oIkdul+StNXUgAvYRYwadge2FcEI0Hsdph0Tp2G
 Trk2uEnrXvmNuzfT1EMIrWE7b4T6zKOUrc4C9dfMU7bN3qv466dyyueUy
 JcI8fcEGK/U4N/Rve84EPm3dlSd6xTqXysSZi9Pti53Yp3n2JC9B1vALs
 HX2xQvqe0ZAMZWk5mmpkbfJsUc0jBH5YWfJ0qdwRwotGnKFBA7MGjvoKY
 LH8Z2X7gvyly0x1pI8pJVzuzd8dDJ/HuDIxjEkV3BEtafubGj4WIGYOyU
 qwhoJNUK3sO3v49yWo6fqFHKVCHwATUULoyqdwYwYM4JSuFifv+Wcyv/N g==;
X-CSE-ConnectionGUID: gROMLyvyTSiwk82ZdJJrFA==
X-CSE-MsgGUID: aSC8nJdkQRerqfL90swSQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="67085448"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="67085448"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 00:56:49 -0700
X-CSE-ConnectionGUID: IQHdlYEvSNSIrhfe8YP/5g==
X-CSE-MsgGUID: ZgGwUuVfT1++ShZrY868tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="139134660"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 00:56:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 19 May 2025 00:56:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 19 May 2025 00:56:46 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 19 May 2025 00:56:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1SjMRRoinPMLJjgGdGxbFbKshqiHMPDWU20/knJ9uY1amfBO1NnxxqZ1i+Vo/rxclt4j77iR9NAvaMJEXKK5HXpgIY8+Pa8tC/MOLYQtuNKKNDkHrM71XLd2CGOmp9jYdiPTytYWx+RGIdusWgnw65hHfF4pplmBQtBhjUqTSVHJeWzWv1lOjVAPRonwv3+DwRPUMhXcMgfxkiAae/45u3dmcS3l/SmxDjrWjDOs0r1vCQQ9+WReGkhQCl/xSkaHkhKe6tp7FGGPll2Ozzao3R9LuqeEpIFkw/PPFqkDjjNKTytEpLyl51iKC7RHXgdFZyDoF8xXuJWjAcBXygDQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/33r79YArDoNWbLU1CX0IZCaPoaETyN6kPFpZi84Zfk=;
 b=xPvmd4+b8kr/Vq8q3Z8w4af6v+oM7HLgQ7cWtvj4tKoWw8V/b7uuEQRX7zz7XUD9i/2Mlv+5GpkVDeGLOPtkitWG6pcJk/mh9cdG+o5mxt4TPfqAAKxwUa1Luq0CXEcSI6QV/f5jryWQh35RZiBbD+Z53hFOZlpCAeT/k63mX8RoYqZfKs6FoFcDDZjz05kvTXeCXVTdjg5YbAgLyQ4brI5aJdo+h4yYX6R0GvPvzBdsVG8xAzoEX5chdv7wQHkKV8vjKfINi64Ddf6hewW1T27cGofFX1rWr358P4GD4eGv+Ui0iusjCmc+RzghNqJ88y6hhiPjTmg+KW+fhSpsYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA0PR11MB4735.namprd11.prod.outlook.com (2603:10b6:806:92::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 07:56:43 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 07:56:43 +0000
Date: Mon, 19 May 2025 09:56:37 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 01/15] lib/xe_spin: limit width/pitch for mem-copy
Message-ID: <aCrkNboCHoRHMLl3@fdugast-desk>
References: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
 <20250513185811.897232-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250513185811.897232-2-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::11) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA0PR11MB4735:EE_
X-MS-Office365-Filtering-Correlation-Id: 0df9e2ad-a625-492d-76d0-08dd96aab1e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFM2Z1VET1gzMmZ3Q2d5Y0tZZTBtV211Q3cvSjlzSE9KZ3JUbmZyZkFOTlZW?=
 =?utf-8?B?WlMycENWTUxQYno4V0l0VFQzUStOTlhWd0pxUHQ4RXBMZFlFdUJSWnBsbWFJ?=
 =?utf-8?B?M2hMR3RLMTRWdW4zRy9RSU5YUjVPcFB6YUM3b3g1MmNFUENyZVFKY1JUR2ts?=
 =?utf-8?B?RnplcWU2eGVEaFhGR002ZDJ1TEcwRmRubVhOYjZJKytNckRWS005U3dwRmk1?=
 =?utf-8?B?ajAvcmFyWVFxaFFCZHJLMmlpMjE0R2VYOWpEQk12elM0ZjdBV0ZqM0t0TlFs?=
 =?utf-8?B?L1I0Szd2Zi83anUxRDhnTVc4U3VRdndrQkZpY3VxaXZKNnJZbUNiRmZ3WFNK?=
 =?utf-8?B?UW9rTnRwSE0xT1huT0dTd1QrSFp2QnB1OWh4ZU5sSjFUc0NhKzZyV2grbjhh?=
 =?utf-8?B?UXo4SzJWZkYzTHRHUjZkb2J3cTkvVTgxU2U3VlNJZ3RnVndvbXdXWG1DY2xz?=
 =?utf-8?B?K1V2SXdJTkI0TmVlTTh4b3h0SjAzZWNSbWpVeEs4bE5uZldCKzFWSHdEQk5P?=
 =?utf-8?B?a0hkdi84SHFDNE5rY016R0t5akdZZVNsS2YzdEk4VHpiVXpMZjJjRGducGxr?=
 =?utf-8?B?S0NxaW5HSS9WbWRUNXIrbENUckZtd2VNK3Z5cW05MWZKanVnR2JuTHAzd0Nn?=
 =?utf-8?B?dFlIODJrUmxYY1ZiS2ZnZ0xtRytkL0ZvMlBRR3luMnJtdU5LaENDL0tOOVov?=
 =?utf-8?B?OG9EbDM4UWdaWEYrNDRnRGV4eGxVcTR1a1BQTTAyWDhsbHh2MXB0N0RRSnVu?=
 =?utf-8?B?ZEpMSkl4bEY0bXJZS29vZFY1TFNTSzBMR2lETG81N2tiNUZTVnV4U2lzS3g4?=
 =?utf-8?B?OVhZbVBxcDIwbVgydEFSMlNmZHV6MlpmNjBVSkdyUWo1Rjk4WWV6S2hxNjA0?=
 =?utf-8?B?TE9KMkNPalVkWGp1bmQvQlM3M0Z2d1BxYUR3cWZlZDFEdXdkNkpCWEVxdzNZ?=
 =?utf-8?B?a1owajMzWmwrcXgwMjZFRjlKeG5xUG1HWW9pSit5QTJud2lRMEVrZmRDTEZC?=
 =?utf-8?B?MDRnRXlRMkRXVllmbm0wZWo2ZzE3bGdWMFQ3UkNYSERrbWdWMndsU2EvRFpP?=
 =?utf-8?B?RTNxV2ZHbjF5Vk8rVGJPK1huQ2lWU2dmVjEzS083cDJ2QW9ibjRjVUZHeTR1?=
 =?utf-8?B?OFQzTk9XLzd6dVlxYWl2cTlhSEJ4OUZQOHgxTUpOTkhIcEFRWU5UY0pSWG5h?=
 =?utf-8?B?Sk9wWFVmS3NSa2VjaTF4eUNSb04xdlhrSjRXSWVGVklmdHQzMVhxeFZZVnVS?=
 =?utf-8?B?UzJqNUlpNk40K21CRzNQd1h1TTJVS3g5Wm9pUlNSTzNxRzN5bEZMc21iMDBi?=
 =?utf-8?B?OGtucFZtR0dkMEpPSmhCdWRYK3oyUk0zeVFZVUUvVVE3OC9Wc2V4MXpZcldR?=
 =?utf-8?B?MVQ2eDE3MnR2WjdKdWZQdU96WS9Mc0xVamZvd0JGT0lUdFNCK0tZcVE3Vk84?=
 =?utf-8?B?T1QycVBWcldjL1REM0xLWjIybXZWdXNuNmt2TGpPbE9na05FZUxMTngrNll2?=
 =?utf-8?B?RHZzTFRhMUNPOGZuMGhpYmtwbVVVZUt6MnhoS0cySGsrQ1dOYTVtTE1vODFq?=
 =?utf-8?B?U3p1WGhueGtHYlpyYWZwWm12c21RN0h3NStpSzBFaWtOa2paVUdzcmkvUzNp?=
 =?utf-8?B?R3FuMll2RWJ5V0w0dWJySGZWTTZyMHBRalFWT3JQSWMxbHZUMGYrS2h5SDZp?=
 =?utf-8?B?ZFhreUpHNHFzS1Q5RUo5d2hEVFhDVGR3NXBUUTgyNVNieUdlQi9ZZXovQmk4?=
 =?utf-8?B?azBnV1JsV2gwdUIvQjh2WEdFWGxCQkhTa3RVTUxHa2tQTXFLYWgrYUltUzBw?=
 =?utf-8?B?N1VoZjJaWlU2RW9WOGw5S3U3Smk3NjBuc3lNN2lXQnVYb1RjL0JKYW91U0My?=
 =?utf-8?B?SFdrNWJlayt6Vm50TEV6VWI3Mk5TVEhvVTB0bnFqMTF1RldBL29VU2FmV1Bs?=
 =?utf-8?Q?PH046wei0S4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGNxNzBCQWozYkhOdEtnQ3ZXcDVpQks3UGpHV1h2ZUVNa0JzMkY3d0E2MVBE?=
 =?utf-8?B?ekx3MHhOODBoZmViZ242YThUL3pNMkZoMmlLR3M1OXNIbWhsRjZRT1hiTkhz?=
 =?utf-8?B?c3RGNWYzbHNQWnFLZE1pVzhiZHc0WGc1NE5qMW5rN0lacUdHWWxaRHAyajNs?=
 =?utf-8?B?ZC9EQVZLMlIxa0piVGhRS1lwdHRvZDY1dTM2NFNudDVzN1o1K280MnNNa3pL?=
 =?utf-8?B?MCt1OXJmNjFtc2VUL0tqNTVXeVVTUThJMXZHZit6Z2taOGUzWWtUUE1peDRy?=
 =?utf-8?B?NEFDcjM2TXJwVGNiVklLMDBJbTFIbFNpcm5pN0t1TUZVMG92VXJ0REFCYWpJ?=
 =?utf-8?B?WFdmQ21zK2tTR3Zjb0lPV0M2cCszQi94Z2JjcHJDM0hBZnk1RGdWdzNzT0Vo?=
 =?utf-8?B?cWd3Wk1iUEVlZEdSeE1EU3NwZEJoN0UrdCsxTTBPOE40enozWStpb1dvVEcr?=
 =?utf-8?B?S2d6VENNSUVyanFpS2txS1E0dnpTd3RZcHQ0ZkFlZmNYWi9pa25qS3l4SkJ4?=
 =?utf-8?B?Qm9PdG9vNWF2S0RJVmE5NFRMai92a1ZZMzU2U1RaOVhoMUxHdWQ4ZU9Xb3JV?=
 =?utf-8?B?R1BuYlgrR3ZXdHRlb0QxTDNIRXQrN3lVRTRLdmtrTktZSUtUaGw1YnVOQVIw?=
 =?utf-8?B?T0JrUE92elMzNjNCQmYvTi9GM21zb2FRV2NUZis3a0FwRVk1SFhHam5UVlpu?=
 =?utf-8?B?WlM2cGRPZlA1YlhlODNnU0VQSFJKUVZkZDJzM05nK05QY3dtNVN0dEwzRHdI?=
 =?utf-8?B?VFNjcEdpV1lISitYQUtsK1kwa2x3YlNtdDB6UGRwV010ZXJ3cm5FcnU5N09i?=
 =?utf-8?B?N21PSHM1RnhUR1FSckFtZzV2S1J3bCtIc2hOV09hL1BGeWltQmxMTXdpSjdS?=
 =?utf-8?B?UWxTWG0rK2w3QmNQcElGN0pPbHM3ZHhFdjAzVGkzTHJUMkQ5NDVhNDlHODhT?=
 =?utf-8?B?aGU2QUNsY1hwSUltVWQ2MmhtVTd4YnZsQjNtZm12bDdJcG42bWRuSm9sT1Rl?=
 =?utf-8?B?VnlvbC81dTQva3FqVmJwWnRJSDdFaHgvODRNRDIvUVNDaEl4WGloN1ZWWVR1?=
 =?utf-8?B?OERHQzluMjRUZFBhcFRDZVBGeDNyeGVJM1ozTlZJMTB2YzR0b2t5SXRoeXBp?=
 =?utf-8?B?TWFkQ2pzMmxnRUptbDFmSXBIQ2tHdTNmQW1OZEhCMWcvNk94RFZvc21na3lq?=
 =?utf-8?B?SUVGN2ZJZU15L3NVcThmbnFEaCt2OE81RmpIT0Rlc091ZmxBcGt2SmJlY29V?=
 =?utf-8?B?aTh3Vm1ESlN1eUNvT3dxMzMvZW9sL29pUG9oUHNLTjFFOVZvNmJhT3JTcGVQ?=
 =?utf-8?B?UzZUME5neStMUnVzRzI3eURrNExzaktLR0Z4eHBFY0ltVzZyNlBwb29nQWlp?=
 =?utf-8?B?VmxWWjlxUmowMmwvNHY0cmUrOGVYNHE5SHpMTDNGWlB3YmlpNThDMEhMMnRX?=
 =?utf-8?B?d1RqSTVldldCclJqT0ROV2UrVmFBM1BDUkJPanFScVk1cUljTGpNLzVRZGNW?=
 =?utf-8?B?WE5JTGhnbkFDby9VNkh5RnhpVUo1ZFhYUytwYmUvL0RGamFjR2dnVTEyMGVM?=
 =?utf-8?B?L0NQdElCcjN2RXdGMVBuN1oxUlBZT3V2OWg2WmFieTlCbXhNbW5NTVFaM2Ns?=
 =?utf-8?B?US9yUDIvcUoyWW5lRjArSm83VnpQYXFRNFVVeU5zWG05RU04Mjc0Vm9mU0xy?=
 =?utf-8?B?NjhFc01XeXYzbi80d3Iya21OMW0zWmlpQXlERzdaRk80TUc1RVpmYXVkL05E?=
 =?utf-8?B?eTdGMDk0ZnZqZnpWNHBWTFFhcXB0QXF4ak41ajVZT1NTcUdSNjNZbytRQ3lt?=
 =?utf-8?B?T21aNUxwL2VFLzZnTFZYa2Iyc21GYkVneEorcmxHcHZxaStiMzZQamYxRjFI?=
 =?utf-8?B?Q3VIWHFYVUVjVWFEQUxwQ05MQWNUaS84ZGptWklzOEExVm9ITUhmZ3R4NDJ0?=
 =?utf-8?B?TjRzdUdHRnZYSDVGOUZjaStXMjFxd2tPamNpOE1OVUh5cUo5bmZWQ2krd3By?=
 =?utf-8?B?YmVwVkhJZVNPaVZMZ01TN1RwMlU4WS9WdVJtcCtHcXdKWVc3VStlQWdHSTFC?=
 =?utf-8?B?RVNqZWhDTzlCakFucGY5QVdnRHN2TXRhWU5CQW5FcFg2Z0w5b3hKcnV6OFg1?=
 =?utf-8?B?WldDdll3eER2SFJTd2MrRWYrWUlpWDRnSlNRdmpGVDloMlBMZWVDMG56dTMy?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df9e2ad-a625-492d-76d0-08dd96aab1e4
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 07:56:43.1793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9Dsm3ZTKn3T8fuXYjjp3+wjXig025Hl2p2U4wzoOfhe/KKigaSY6Aqjvx2aUQBDsBxyg+6CocrTqLR7RGM4NMikilvetglEpVyqN0LMj7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4735
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

On Tue, May 13, 2025 at 08:57:56PM +0200, Zbigniew Kempczyński wrote:
> Mem-copy for byte copy requires width/pitch to be max 256K
> (higher bits have different meaning and setting them might lead
> to undefined behavior). If witch/pitch are too high limit them to
> the maximum possible for the operation. Asserting might lead to
> test stucking in multithreading scenarios so displaying warning
> was selected instead.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  lib/xe/xe_spin.c | 35 +++++++++++++++++++++++++++++++----
>  1 file changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index a92903b6bd..6683d1f351 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -126,11 +126,38 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>  	}
>  
>  	if (opts->mem_copy) {
> +		uint32_t src_width, src_pitch, dst_width, dst_pitch;
> +
> +		src_width = opts->mem_copy->src->width;
> +		src_pitch = opts->mem_copy->src->pitch;
> +		dst_width = opts->mem_copy->dst->width;
> +		dst_pitch = opts->mem_copy->dst->pitch;
> +
> +		if (src_width > dst_width) {
> +			igt_warn("src width must be <= dst width\n");
> +			src_width = dst_width;
> +		}
> +
> +		if (src_width > SZ_256K) {
> +			igt_warn("src width must be less than 256K, limiting it\n");
> +			src_width = SZ_256K;
> +		}
> +
> +		if (src_pitch > SZ_256K) {
> +			igt_warn("src pitch must be less than 256K, limiting it\n");
> +			src_pitch = SZ_256K;
> +		}
> +
> +		if (dst_pitch > SZ_256K) {
> +			igt_warn("dst pitch must be less than 256K, limiting it\n");
> +			dst_pitch = SZ_256K;
> +		}
> +
>  		spin->batch[b++] = MEM_COPY_CMD;
> -		spin->batch[b++] = opts->mem_copy->src->width - 1;
> -		spin->batch[b++] = opts->mem_copy->src->height - 1;
> -		spin->batch[b++] = opts->mem_copy->src->pitch - 1;
> -		spin->batch[b++] = opts->mem_copy->dst->pitch - 1;
> +		spin->batch[b++] = src_width - 1;
> +		spin->batch[b++] = 1;  /* for byte copying this is ignored */
> +		spin->batch[b++] = src_pitch - 1;
> +		spin->batch[b++] = dst_pitch - 1;
>  		spin->batch[b++] = opts->mem_copy->src_offset;
>  		spin->batch[b++] = opts->mem_copy->src_offset << 32;
>  		spin->batch[b++] = opts->mem_copy->dst_offset;
> -- 
> 2.43.0
> 
