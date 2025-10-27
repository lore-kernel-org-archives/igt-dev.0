Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD3ACCF9E0
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 17:35:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5FA10E520;
	Mon, 27 Oct 2025 17:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nbKm5r5r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C843510E521
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 17:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761586544; x=1793122544;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/rdWNDnT+ebZTysXkfMK+Zr1ExkTvokhFILXOQe8r/I=;
 b=nbKm5r5rsbAheTonFwHH168+bO2kBZfyK4UyibGQ2eZvOMSa9bakbQRh
 aXouQKgTxuOA2G0fQg2oc7vdGQoswwE1L2lEQBAEf/LuO6i5PEutKNMhz
 rNJHSZyQNdS0o4o9WSvgtbPKLp+DmShYA8B0c6DQe7EtU7YH6iGtBuevl
 Ogo7U1vhZ+TzXlzFiahA3X9lF6xXj/uUk/kby7nWNxWdTeeQviLrGlCVq
 Ex7jZEASiy1yWdLhaIBoNmissbep9RvLXRsirziVthlnPapGwOJAXG4uV
 5bF5BLpCDaCkZ/go5Tn8AQ7nTfNnrxxgAigOFJhqV8iO98IY73YrmVcKn A==;
X-CSE-ConnectionGUID: 4v37gWP7RY+3dcUOuRDHJg==
X-CSE-MsgGUID: fVb27CXKQQ+p4ueWkTWN+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63826921"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="63826921"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 10:35:44 -0700
X-CSE-ConnectionGUID: i03y2hnaTrymwXC9UOVhZA==
X-CSE-MsgGUID: AwhgfHKoS1m9lxKLpDntuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="189142827"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 10:35:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 10:35:43 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 10:35:43 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.38) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 10:35:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SoR3Fo8Glej19/x89kJLFxw7qXfDPMou8mwSsFcwdc81RExweZdxdh9lZ7A1e7d2qbbkee7q6RrD1fHy8BFK+lfCp2qx1ggzgWAg4AuljiMbxEZgdORLhZvvx7fNnRs74eNDjMbyKxm4CG2jDKFhrcvALPE4wQY9DgyKwhtGrovedy1HZBmaD+vlxwT5yCIWse7vpUDkXJSBc7SqZScW9XXaFAAND0wzZoxvNCOGVijWin7t7UhEpWJ0z4haRukcMAq1sGtPKeEpf4B5/GENzZqsY+xUvB2VnM0kNjOyz+7Jp62kxS5DmL6NPbGSvvW3z/hZu8R3qcWp0vHx+DMDIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jLdWraz/DEP1cSzo5tIi2OryNIPINMw9i6JcNZcg3Y=;
 b=ZZJok99ND8TymqBiAKWXDVjRsvrlJ7EymfRoOshSYBMhQO2juqi4onrDuRvC+Tca4PUEbrtkY2w9Ix4PyQKMAKd67Zw8pGNvzJMUDwbirpjMwxgTfNt6l9F0r4w0F4enboTNLyIEcLEd6l5eYz7Fi+Jnbq8omkQONsm8Q7WxIJbSDKz7iW3gkSxJdxKBUpCSiF7ZuOc7cZUN9LfRz5SLeFJNrFIp1OMFZWB02WXB5+U/ollN+ydYKdOsRRPEQpqBBabmKoAei4bOAnO2wFYZvKC5RDYMyGV9heMKuGtS1Um5AAma3RYo76ymeKZTV0Qo17+fHAzk77Fl08792OYlpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by MW3PR11MB4697.namprd11.prod.outlook.com (2603:10b6:303:2c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Mon, 27 Oct
 2025 17:35:39 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%5]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:35:39 +0000
Message-ID: <d9c3915e-ce9a-452d-ab1d-2a44043635c7@intel.com>
Date: Mon, 27 Oct 2025 23:05:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v2, 1/2] tests/gem_ctx_freq: Fix frequency restoration in
 exit handler
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>
References: <20251023111258.2108907-4-sk.anirban@intel.com>
 <20251023111258.2108907-5-sk.anirban@intel.com>
 <20251023125448.al23rxko5dfpbjj5@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20251023125448.al23rxko5dfpbjj5@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::14) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|MW3PR11MB4697:EE_
X-MS-Office365-Filtering-Correlation-Id: e595c008-cd1e-42b3-f584-08de157f3e3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHBaZmNzWWRnT1hIQmpwTGsxREgvemsxVlFtdU53K1dvZHEzS3NsMjVKK1pn?=
 =?utf-8?B?N2Y1czMrdnpZemJnNS83QU5KcVppUUdUK3JWTUpEOWpIcEtwL2tBcERncDNE?=
 =?utf-8?B?Umc5aUdXMXpMQlIyNEh1blpqcGhsUVEwTUJia1ljL0VIYWdvaisvd29NQVBh?=
 =?utf-8?B?cWdSalF4Q1JtTU5neHlWOUs0VlJySFpGUG4xMWFDZmpRSkV1UkNPQVY1bWJx?=
 =?utf-8?B?OUltbkVGRkdVWEExMVV2cHhFZG9iYmFhRWtOT09XVW5YVXdrenQrNndSTHRt?=
 =?utf-8?B?ekk4WHZxVXVPQW9HcHpRTnZ0WStxa3gwdDR2M3l3UmU5SDVzdUlrQjBzQkVx?=
 =?utf-8?B?emVpbktEZjI2ZjNlZTBHV1ZSM05xeThUR0tJcEVDclVSeGVJanZUSmRQVFQv?=
 =?utf-8?B?ZnlTdW1tZ0tYQjI5U1JvZlhiZnFScWE1OGNta0JTeDlvYjlIK001QXQ2aHZa?=
 =?utf-8?B?ZnZENFRNV054N0lSR0NjbnhTOUo3Z2hpQjJpNE9waTVRcVdQV3hBTXJ5ZU5s?=
 =?utf-8?B?bXoySnAzOHROZVp6THFNc3lhUENKTmg0ckdxOWhUNXRNcE5YUHpaV2FKcVNu?=
 =?utf-8?B?dXlyMGtvVUJwVitHblkzdlYwT1hvcjBOMmlBZE5TUjQ1L1NlQTFXSHZnWVA2?=
 =?utf-8?B?T1BLNlg3WlF6WGI2STVZdG9RdzJZSGNPVGhyeGtmVmtXcnF4Y0JrMFk0VlpI?=
 =?utf-8?B?aUVrblJ5TU5hS1lWNW9ZQlR0bjY5TVZRSVF2ODNNVTg1R2xlQVRweUxUNk1n?=
 =?utf-8?B?MUhOWjg2YkJ2Mkh1VHJvQmZKWkhSUzVoTlB6TzErOUVPeHVuQVVUbm9kZ0tN?=
 =?utf-8?B?ckJYaDNpWEFlMTd6OXp2UnBBNFB2bGl2WlVaeW41MnBOTGxvMjdXOFMwTU9C?=
 =?utf-8?B?eFV5UVJJenllcjUwVlFyOU9NVXRFZ2VpNVp0Y0lzMEp6RHV5NkM1SHNNZHFL?=
 =?utf-8?B?REFXdGVPaDkvUloyU2JQaWhUblZFVmFqTmI0dHNlTjdsR0V3YWhjekZPOTNj?=
 =?utf-8?B?YUh2dTVKR3poM0E1WDFtak4xd3FoRVF4TzdjSmhYSGszQ3VHQlZwaURvSXJ2?=
 =?utf-8?B?QzVNOExiYTU0cTdvWFZrY05WQjltYmxNRHc0M3BPR3NUUmFFTnVpQTZWK3px?=
 =?utf-8?B?bnFBdklxWlZGQXF6bEdsRUwvLzNmRXNBTW14dXNSU2JxY0p3QkcxZE8zUEF3?=
 =?utf-8?B?eldMSy9nR3FsOWJtbjdFMXF1OTJhVVI5QjIzQ2djL1NVSmJQSmNOMncrbStZ?=
 =?utf-8?B?N3hWMTlWa05zRXhlTXNrWHcxb0FBMmc2cEp2eTJKbFpMOERGd0ZHWFc1V0R0?=
 =?utf-8?B?eTBXTTNUaFMyVkJ4ZGY4dDZiSzNWN0IwYlZmbVhUdEJ5ald5L0s3dENXUXlh?=
 =?utf-8?B?M3cvbHhkaGtxVHJaRUUrMXRFbEJrUWc0WnBDVzRia3Fob2xmcDFZdVM0em5z?=
 =?utf-8?B?K2J3VXE0bE94T2RKMTZjaTdqSkF4ZnFZa2hpOWhjWnlQcUJhd3paRVd1Q29L?=
 =?utf-8?B?WmdEcW5nWnNKempVMXo2Uno4Zm1vYTNGSmtSam5HWkFlZDRtTHBwVTZQY3B2?=
 =?utf-8?B?MVBibFZ2cklTbGxIK3YwTHVFNFMrYnI0ejhxODVYc2NQY095NkVnS2RXUlhp?=
 =?utf-8?B?ejk2RWtDYkZqY3pRQzRrOXJoelRqNFIxMG90cmxLZmlwRXRDYlNTNHJrZUQv?=
 =?utf-8?B?V3c3eTNGYUd0cnFNWnFzR3RNd0JkUWl3MG1UTnBEREZXYVprMWdtWjFUUmdh?=
 =?utf-8?B?OXdPVGh2UVBzbmRvSEdDZ1dOMENZUDhKUVdpSTRZWHkvL2hUZ2k4RUU3KzFK?=
 =?utf-8?B?T1ArdFRkSzZoZ1hOZkExV2JEU3lGVGZVWUUwdEtPaGw3eklzSmdXNDFJUGF3?=
 =?utf-8?B?dU9QU0dMdkpPdHJHQ1oxZE92bFR6dURLZkNHYkpuQytXb1dFTmVVL0ZXOGVz?=
 =?utf-8?B?ZlEvR2I4REE4N1YvUjBVV0JLTmlOZVFDZ1V3RS9hMzhNWGZwYVN6azRoUExL?=
 =?utf-8?Q?Jyv6GYWRLIoVLa5j0AzITk4t0M1/Hw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(921020); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3I0UEtOdEFDSUZFZ2s3YWs3TVdCVmxNdjcvSy8xZ1FSVUlWSXpDWTBOU2No?=
 =?utf-8?B?Rkd6TmRUUzhtbjBMZktUdlZaVW9hNjRjZGI4ODFHU0V4NTBacXFZOW9aUDl0?=
 =?utf-8?B?djl5MkVkVUQydFRlVU82cTNTcktPdS9uQ3RDTnhzL3BLLzRaeVRndFFieHVz?=
 =?utf-8?B?ZEZYNm0xNmZ0VTZ5V2lyTW5QK3hGdnJ2UTNncnd6QlhsUW9GTEFLRHlOZUNU?=
 =?utf-8?B?bWNodnVDUmVCWTJ3V1Zvd1F1eHJIbFV5MVhDcDE4aXR6OVZnMFNiYVZJc3Iw?=
 =?utf-8?B?b0FXUjZoMklsV1d1ZEVsaTNqMXdodjQ0Q25zN2dqcm5QRHM0L2hXQ2oyeE9x?=
 =?utf-8?B?c0F0T0NLSzdzRThLRTBvTXF0L05ZdEZkOWJhSG55ekxjbm93R0xWeGtIbTNE?=
 =?utf-8?B?enVBV3VsM2JDVTJUdHBESTNkSk9EVUZock1KalA5d0JYUG5tYUVIN0x4QmlF?=
 =?utf-8?B?ZnBxTTcwVXJXMEtGQ3loYmk4bzhYcWhTNnZWM3JVS0ZVVksxSXVwZW1zWjlK?=
 =?utf-8?B?bVNYcDJRSlU3L1Z6R3NvaS83a1Azbmc2dDgwY2MwbG5rWVVTN0IyTS9MSm1y?=
 =?utf-8?B?TUpYbk01cE5QL3h3S014TFFiUFd3SHpHK2diblhJSGJYSWVMSzJmZ2hOYnFv?=
 =?utf-8?B?UEx3RnRNZWVaOEUyVDBSSGtXN3R3c0twS2ZZV3FOblpjZ2lTZEI4d2ZSL1k5?=
 =?utf-8?B?UE5kQUo3aWJzdTNtbkRCN1JtMWVic0dkcEV0OUYrQTF1M3V6M0xNR0p6VnJr?=
 =?utf-8?B?V2lwSW5sc0xPYWdMNEphNGlwYVk0dHdFVVZCU1h2SWtpT0pLU0NUV2JLRHF0?=
 =?utf-8?B?dW12K0hLWmdlazFtYjJiUjVqVHZMNmpCNGlmR2JWcFMrM3dObUdDci9xK2h0?=
 =?utf-8?B?V1BSeU04cWthQS9PZGxTQk1Ndkc1bEo3c1NQVmF1bTM1TVFHRXYyREljaVJ4?=
 =?utf-8?B?bnFTbUhOblllWkxuSlR6bXIwWG9GclA3RDZMTWV4R1hORTdTanBPQWgyOE1u?=
 =?utf-8?B?Mlg4WEw1SnJ6ajNaS1pHdkZ3MGoyaUlGWGNVeHNMVStabDVFLzFLeE1Xa0Nv?=
 =?utf-8?B?RVFqVGdzZ0lIekdTb2JDOEhtcVd2b2JiT0VxT2hNTDVRQkQ1Y3R1MGdBVDNp?=
 =?utf-8?B?R3VhUlQzNnhCMU1rMHY2WDRzQmdEaDd1a0wxMjVJOWNMWkNJcmlxKzhyMitr?=
 =?utf-8?B?MkphSlZVOFBhTmQrK3cyM1JCcWV1eVBtT2pNSkdPQkhnREd3alBQQ012ODdK?=
 =?utf-8?B?MzExdFFRR3gvTFJkTitoWkFqeVBpejEwdHk0TlBHanE5dlpzU0dtV0l0Z0h1?=
 =?utf-8?B?UEdoOGNFTzZWVE1sOXpuKzBxUmtWdENnSXRKWkt6L0U2a21IcUoxSmxMVmNC?=
 =?utf-8?B?ZElNcUovWXB5STAxYmR2N1puSllxS0tueUkzdE1RYWhxa1lGdno5eGNsaFpM?=
 =?utf-8?B?S1Q1UXg4UUZlS0tFdnFjaThNSytLWU1DNUViWEpGRXZEYlhXUjh6YnlkZkpy?=
 =?utf-8?B?RncwNWgvbEVlZGMyQlg4VEg0TUF6aDI5OE9McG5DemxEUEo4ZkU0UkE5dGhs?=
 =?utf-8?B?dkRwM2lhVTVtSFhFUWpkSEZYS1JEenAwRm4zVzl0dnNWSlpKa3djZVNaU1ZX?=
 =?utf-8?B?ZyttTHZKUUozcXpvVFZGdXlsRGk5bUdjTEJVMjgwUUM5T3dYOVZ5UDY5WnJ1?=
 =?utf-8?B?Mks3N2VrS09ac3pVQVkzWU5GMjBmZlI2VzBMNGNQTTZsSm9jVlNVblo0QmZK?=
 =?utf-8?B?QVhQZmk3OUl1Uk8wYlhYNjZCa3hiSll6Q0Nlck1ZV1V6WUFpcnI1NjJxTFpH?=
 =?utf-8?B?WS9lUFBDVEk2eFJaKytGS0tPWkF3WWRqU0g2TUtCZVJCSEFxN25XZVc5VnFV?=
 =?utf-8?B?WTNoQkNZbkozczZyRmIyNzhCVk5CN0I2ZW92MnVzaHF3V25naUpnYmhHNVFM?=
 =?utf-8?B?U2crQjJRUm8zdk13S2tHVHVOQXBFUE1RVVF2cko4b29FaHlIUGZXejU4bnUz?=
 =?utf-8?B?NXFLZ1Y3My84dFJFUjRyZHBOUkJ5WVJYcW9YdmRBMFhjVlRYbHcvKzNaZnFU?=
 =?utf-8?B?RVp3WnNSR05XWVZOM1dpNjYvcnNaSkZOS3hTUHlHZ01qcHpDVW5QN2xvMHNT?=
 =?utf-8?Q?jk1+sX/SbAK/DkxqcPjvMwmc1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e595c008-cd1e-42b3-f584-08de157f3e3c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:35:38.9439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Qjn+UY4ZLMX08OyGuBVCyMPRJh9J5QJ2AfMx+xPPN9R6eJE3U4QHPVbGYK9+KaSycU9oM5XV7an9NCF7f3TXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4697
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

Hi,

On 23-10-2025 18:24, Kamil Konieczny wrote:
> Hi Sk,
> On 2025-10-23 at 16:43:00 +0530, Sk Anirban wrote:
>
> small nit about subject, please use 'test/intel/' for Intel
> only tests, so it will be:
>
> [i-g-t, v2, 1/2] tests/intel/gem_ctx_freq: Fix frequency restoration in exit handler
>
> Same goes for second patch.
>
> One more nit, see below.
sure, I will fix this.
>
>> The exit handler was failing to restore frequencies as it was being called
>> after the driver was closed. Reopen the driver in the exit handler to
>> ensure proper frequency restoration.
>>
>> v2: Use global sysfs variable (Riana)
>>      Fix buffer length issue
>>
>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15103
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   tests/intel/gem_ctx_freq.c | 22 ++++++++++++++++------
>>   1 file changed, 16 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/gem_ctx_freq.c
>> index 29fdf89cb..fef2dda2c 100644
>> --- a/tests/intel/gem_ctx_freq.c
>> +++ b/tests/intel/gem_ctx_freq.c
>> @@ -197,11 +197,11 @@ static void sysfs_range(int dirfd, int gt)
>>   #undef N_STEPS
>>   }
>>   
>> -static void __restore_sysfs_freq(int dirfd)
>> +static void __restore_sysfs_freq(int dirfd, int fd)
>>   {
>>   	char buf[256];
>>   
>> -	igt_pm_ignore_slpc_efficient_freq(i915, dirfd, false);
>> +	igt_pm_ignore_slpc_efficient_freq(fd, dirfd, false);
>>   
>>   	if (igt_sysfs_read(sysfs, "gt_RPn_freq_mhz", buf, sizeof(buf)) > 0)
>>   		igt_sysfs_rps_set(dirfd, RPS_MIN_FREQ_MHZ, buf);
>> @@ -214,10 +214,18 @@ static void __restore_sysfs_freq(int dirfd)
>>   
>>   static void restore_sysfs_freq(int sig)
>>   {
>> -	int dirfd, gt;
>> +	int dirfd, gt, fd;
>>   
>> -	for_each_sysfs_gt_dirfd(i915, dirfd, gt)
>> -		__restore_sysfs_freq(dirfd);
>> +	fd = drm_open_driver(DRIVER_INTEL);
>> +	igt_require_gem(fd);
> Why require gem here? It was checked in opening fixture,
> no need for repeating it here.
>
>> +	sysfs = igt_sysfs_open(fd);
> Imho 'sysfs' should be local var here, so rename it into
> sysfs_fd or some similar name.
>
>> +	igt_assert(sysfs != -1);
>> +
>> +	for_each_sysfs_gt_dirfd(fd, dirfd, gt)
>> +		__restore_sysfs_freq(dirfd, fd);
>> +
>> +	close(sysfs);
> As you close it here.
>
> Regards,
> Kamil
Exit handler will be getting called after fixture, so my intention was 
to use the same variable if possible.

Thanks,
Anirban
>
>> +	drm_close_driver(fd);
>>   }
>>   
>>   static void __disable_boost(int dirfd)
>> @@ -262,6 +270,8 @@ igt_main
>>   				sysfs_range(dirfd, gt);
>>   	}
>>   
>> -	igt_fixture
>> +	igt_fixture {
>> +		close(sysfs);
>>   		drm_close_driver(i915);
>> +	}
>>   }
>> -- 
>> 2.43.0
>>

