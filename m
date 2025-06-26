Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9547FC7115B
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 06:09:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3801610E071;
	Thu, 26 Jun 2025 06:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dQ2bUBpA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B316710E071
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 06:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750918188; x=1782454188;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qGlfqDOORFwK25M4T2lJtY29OE1ZHMkoY9J3t3aJ9NQ=;
 b=dQ2bUBpAkT1U2RVsxdig7jtFog06R8LGf1HX8BN5J7jQwdhSzAsbqHTh
 jk2pzazu+hY+rgoRHg2sJ385Us5DjNgPjY2IIyKcrDOnw6CcA0QU1/6dM
 W1G2v/XVI4wWc3OQwX4Kf5YkUvWxBw3oBZucHKGnPt0mZleoijS/e0Cfd
 AwIHU2JVVCu+d3c1jZt2dyAWrhhPCmYcjhx5QVjDsMKkKLiRVzkTYBXgY
 XaLmfCuFfumBTEYFofin9+r19KbnisjWWgM3W7nIfcrExGychCr0p6VGd
 O0SOhtlJnQM3JmXZvgNVbPWgdt/HHClwMd80RjEwaAZSSOzIRKBl+lkLk g==;
X-CSE-ConnectionGUID: vChKsumVS/a3LbYd0LJ/QQ==
X-CSE-MsgGUID: xxqXkwiUSJiQ28o2QogYKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52429732"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; d="scan'208";a="52429732"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 23:09:47 -0700
X-CSE-ConnectionGUID: HBiWbJGETOaIEqpQkVHNvQ==
X-CSE-MsgGUID: k6rk/nr6RyKvpY8d/6+WbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; d="scan'208";a="189607724"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 23:09:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 23:09:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 23:09:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 23:09:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Al7MjD8m3ud/0vNeY4HfLHVRO8lN8nk16proGvyl4uZSy4QP4jIbApZIvkXiH4vZSO70TdVauiExma2IDYgIptYMlOZinEaCIFbnRZ5O2lztAb9H+LyN5nMmimkE5ddfi2pNjho5PTH0QVJ1vUyiaw0LFodh3gE9Qi504aNpZsJVCizWVlSlCbFj42cR1XT67ZAhnI+5S9RN5p+gibpEXEtpeQcgJg+P5OEMbfQWZol0h8Re2kTXZbLH+5JiYfgCySJGgL7fvmj5x4mpLAnAmke9XbomZjCrOtXWaH8Zkg02WsVlq2u4ADt3erhjm2cOXDfwRFvDeOg8kNYTPF2L/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJjUTH6xpY+fi/NV5yy77u6t6I+HNUbt6Oo6nRgtiAU=;
 b=d4uQicTSpauW+QanKs+R+qjeMdnHhnmUyRNSdhdTC0QUf8q389Nbq388coxkAxMlC1U02I330PNSK8Edn9T3PKHj5vI5ZeuWhQcvwRf9lE847YB1uDJ20yjhfNQW9VrdBVE9f/laQap7yUDBqf4U0neFWgsb9SLDXxmIiBSLiAmSh0jcIl/2+/UxE7wZ0V8NqXDQ3+gYtvzdf2L2E2L46qdgCyy7G7XI+zXGPImSmnqn+TElR9BRwBVD6IRHhXdQXiK5diArM8eGXCsbR2s17H7/joj0FwX2RjAoF9U5H1/OtF8hi986fAWJlLkPfV/vRI/FjWoKNExBs9hk3c2kXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by LV3PR11MB8766.namprd11.prod.outlook.com (2603:10b6:408:212::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 06:09:30 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 06:09:30 +0000
Message-ID: <0a5c4704-d396-421e-a72d-96af988785c9@intel.com>
Date: Thu, 26 Jun 2025 11:39:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v15 1/5] lib/igt_kms: Add support to retrieve async
 modifiers and formats
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <arun.r.murthy@intel.com>, <chaitanya.kumar.borah@intel.com>
References: <20250623110918.606014-1-santhosh.reddy.guddati@intel.com>
 <20250623110918.606014-2-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250623110918.606014-2-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::17) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|LV3PR11MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: c6f47b3d-50a8-4f63-287f-08ddb4780311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnAxN3FDYnNlMkNLYm9ERUN3d2N0UWl3UGNhYzdxd1dnb2NwNlJvSTNPN0Iy?=
 =?utf-8?B?SHpSVENCY0tQSDBsMTR4K2M1d2xIUmJGUHdMcm40aDMyR3pjWEx1N3hKZWJx?=
 =?utf-8?B?ZkhSSVMyemNqSHV0eFRDek9ya3BxaXFyQ0FCU1AvMmtnVDJRYjZMKzRtLzZz?=
 =?utf-8?B?QmpzNjIrRkNzZDVGWGN0S1I0Y1VRWWlDQk0vWHkybWlqMVd3WU1oRnFjUjds?=
 =?utf-8?B?MFdpS2dwRjc0NGtTbDMybFRaMUg5a3BXTENsdnkyVWIrczNyQlA0VmN6L3N4?=
 =?utf-8?B?U3R5a0NRbWRBZWIyTndBR3NSVGtCdUFwVTZ0MjM4cTlBQUJ4dklCWUs2a1pt?=
 =?utf-8?B?WkRma3ptOXlSVjNLdmN4aXNxeUlOR0RhUEFCR3BhVUZpRzJOb1I2aUdOWFBp?=
 =?utf-8?B?UHJWUEE2R0IzaitZbHZZYWhDdUhPeVJUZGFoVFQ1OVFRMmFPdHFNakRrMjdK?=
 =?utf-8?B?djB1N1ZCN3UwdkVqbnBpSXBpQmpBbEpyMFYwSFhpV2NqTUdxRDkyV0l5cktK?=
 =?utf-8?B?RDRray9aaWtEVTBDS2Z0U05DVFRCRTl2S1lvaTdaTkwrYVhGQ013WWRWN20y?=
 =?utf-8?B?L3lQYzhnb0sybTFzWGZvTzh2alZQK0hUQUsvVEtTV1BhZ2FuaE5zVTVsc1dG?=
 =?utf-8?B?MW9KQWVHTVNqV1hwTlY1OHRzTGJ6RXEySnJQUFYzQ1Y2aEhBUHl3WGpaaFFG?=
 =?utf-8?B?ZHZaYjN5T2YvRWUzaStnZ1JVNVF2YlE1cThpWGxiRFRoNjRBeWZRTVo1MDJa?=
 =?utf-8?B?RmlrMm1va0JNVlQ3d1IvQ0dNWGovblpiejNwZlhydzkzSUxUbFRrQmx4TUFj?=
 =?utf-8?B?UG5BMzlTanRtaGtJWWRORnR6NXJIdC9mMjNLbDdSNTllUDhiNW9BczQ4aFJl?=
 =?utf-8?B?OU5QRjBPZ2diaytxTTVYQXduZjQ3YkdnMFYvTFJBUm44RWVBOHVGVU53YUNB?=
 =?utf-8?B?Mm83VmIxdVBZUWFJQ3RSQ2VsTWVrSndyZjd1OUljaG5OTDZFOEx0RzBPREFI?=
 =?utf-8?B?YWQwUWJEb3hGRVEzQm9YYlY3YTlhaHBjUytPQUFrT0hiV0kzK2tndk9rVlhw?=
 =?utf-8?B?aHdyTjRvTVBhamFiNDhqaVphZkIxY0R1dzZzZkE5WFBGS0pxeWd3Wi9sV1lN?=
 =?utf-8?B?clNYSnFoTVF0NlEyc2NzNlFLQmRLRjZOZktXa243ekFvVmpocDU1bkxJS29Y?=
 =?utf-8?B?eUYyczdpcFQrUTJlTU1zWUExQ2xsQWJyMFlYeWxaVVNJVHVKbmlKWUZGVXE3?=
 =?utf-8?B?WXdmOUhZOHZVMlg0c3REZzNOcWZhN3QyZVpaUGhpM01YckRBengrVUU1NFVt?=
 =?utf-8?B?cDNXYWwxRUNMbkV3UlN2YkNuWDE1enpMa1IvZVhvc1NiNWhRUDZDTjdZQ2cv?=
 =?utf-8?B?S01oaUVhaEdnTHNqQzUrVjV3MjB2K0NHU2JNQ3hQNjQwa0UzM3BVQUxHcDY5?=
 =?utf-8?B?dnlacDkybG1uUndTK3Q3OVo4RXJDWDVHbmVIUjIwdzFrT2poTlhNdWRKamVu?=
 =?utf-8?B?ZnZ3RzZyS3A5dlQwVWplMWFiY0hhcWRkaFhaRUxPMUlUY3prRC9MWUxtTVhD?=
 =?utf-8?B?S1RvUGtDNjFaODVWL2ExaG16SE1QNkNkelV3eUNodWhyaUpTaUZVcnJwN3Bt?=
 =?utf-8?B?R0xiZVFaSEExS3Q2TGhCYjhQSXVCL2FsV0ZjTFNYaGlmb1JIM2JTaU0wdzR1?=
 =?utf-8?B?NVllTzFrVGk0ZVVYQzFNNGFHVjJmOFE3L0J0VXFGUGhEK0pweUdaMlFmOFpy?=
 =?utf-8?B?cGVZcXdWZWhXa3U3a083S005OUZuOW93VDRhMExzLzdmVjFldlR3N1JOL1h2?=
 =?utf-8?B?ZmExUENxLzZ3QmtEQkpYcTV1TUN6VElOZDEreTIwNi90QmZJQ29nWWxZL1p1?=
 =?utf-8?B?TFZETTQzK1pCa0x1L01pdGdNSkV4MC9aTWd5bFhueG9rcHlKYkJPRWtYd2dP?=
 =?utf-8?Q?BUgiRgcciYU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzE0dUN0eEhneTFwKzdXSWVpVFZJaWRQcVp6R3hCamplOHMzVSt3UytBaFRw?=
 =?utf-8?B?azNUamJKdERxOHdIYWxXR1lIVDNicEpxSStpQW9FTERkbXN1WCtMdWV3ZGxV?=
 =?utf-8?B?UkJXM1R0U3BRWDhPTXZ4Ykxib0g0Q2VnNVpLekRoaWZScFpENlJLRk1qNGZ0?=
 =?utf-8?B?RjhrRUZBNHhNa3R3TlNydk4zTG9NaE14cnBWUDJnVjFwMUVrejgzdTJJNHRV?=
 =?utf-8?B?aVAzYmFiQ3Z5WDVDcjFGaWxtc29uWkZid09EK01XbmhvRlBQcjBiT3Y0d252?=
 =?utf-8?B?NjdISUFxYUdXU2xKUUN4V3hOQ3A5OUFzLzYyNDR5bTgxdFJCcGJTOWU0MDQw?=
 =?utf-8?B?VnNTYnI4VTFndktHb08rTHpPSnVWOVhFYzRHaDZOcWExNVRabzhWT1JaTG42?=
 =?utf-8?B?Y2RqZVVubmNmWGg2enhEd0Y4SEUwQUFqZExDMUdkQnM0TE5hM0RuSURvM0lT?=
 =?utf-8?B?ZUgvRWhUZmV4SDFLWURnNVVjT3YrdHlxV1kvSG5IVE1jTHlwRjNhWmNtaVNL?=
 =?utf-8?B?Rk1ZUmovdlpRai9QRXVMSVdsRDZvenpDdWxZVC9EcTg2d29ySko0R2wvWm01?=
 =?utf-8?B?VDl4ODNkSmtYQys5Q1NmZngwRGUrTjV4SGMvVWE3TWloRTd0a2REZHhFallW?=
 =?utf-8?B?MWxuaDhSOWxRYkl0Y0NFekk0WHM4R3pyd1E2NWcrUURrd0tlUW1GYzArcTIz?=
 =?utf-8?B?WUJVR3RUdnhwVVNCVGthT0txRVd1aUIrZ2hxb2xUOTAzemFBamJ4SHFhZmF6?=
 =?utf-8?B?R1c3SStQdHJQMnZzdnVUUG1LNHVodUFPbjFBTnlNckh6VGNsQmJpY0Q1RlJ6?=
 =?utf-8?B?eDR1d2VnaVUwcVo4OWtDT2JPK3doT2VBUkV3SFRoZ2NkUktrd0VoWmRrLzVB?=
 =?utf-8?B?QXdyKzliNG41dTVjUy9zd1puNGNYdk1vOXFFSUd4cUVRSy9OS3U0RXZDREtw?=
 =?utf-8?B?MjduQW1TWUo0Y3BuVVcraW1HaVlPOHEzaWU4VXVrdW5WeE1ub2J1bnBHS3VU?=
 =?utf-8?B?NmN5blZyZml5K0RrZGFVaGI1K2tQNkJ2TTcvdTByQjd4RzJFZVFuYWhEeER6?=
 =?utf-8?B?QW9GVjlIRHp4NWRaR3hqQzc1YUZJWTFJT1pxaDZONWF4cEdwWm9jeElIT0ww?=
 =?utf-8?B?MTh0bkR5MVlHc3ZrMzQ4eDFhM21VZTNhT1FGNXIybjh1NFpwTjhqU2NQWUcv?=
 =?utf-8?B?TFlKSlJGMzJ5Q2V6cFpCMi9DeTZpcUxxNFVmc2tzSEk0akZVNjczSG5Sd3Ni?=
 =?utf-8?B?VVc3OXp0QkVxY1RsK3grTlFyZ2xDUjgweXVJbldFc1RESE5LdC9JY1doUWM5?=
 =?utf-8?B?VkRXQnFEUytSR1hlZGxkZFgvZGI0K25JWVd2aVFyaXZ6ZjAzZm40aGd3WDl1?=
 =?utf-8?B?SFlhY1ZDcnltMnBYcm93WXhQZTIrVVd0TUdlWkNkc0dGMmtQYXlrMVAzYm5v?=
 =?utf-8?B?RnJ0Y3o2T3FxajlWMDhFbGcwUHAzNXpzQ2dqYXByOUxjU0NCYWlNT3d1U1Q0?=
 =?utf-8?B?WElmaURVWkpKWEVIdmpPK3UxdENxVjVoaHAxS1V1OHpZL01FVC9nUVloVm5D?=
 =?utf-8?B?eXdlMHlLL1loamNMaElsU2dhWDlvREk4Z1RsM1dpZjA5eEhpaHVhVlBiV29t?=
 =?utf-8?B?QXVMUGZsQmVqek0weEg2ejhucEhFV2VjZG5aK1R6U1hyUGJxNDVjdVVNR1ov?=
 =?utf-8?B?dGxjQVBZYVhRTU1VWHNwVWVBOG1yTXl1OEVnNU1kbXpxeUtmcnhRR0x0OEJu?=
 =?utf-8?B?ckZqVGFOdTV1ZnVHOXFZV29vVG9PUnlMdENuMUc4REpWaWFuVnhhZ3Fyc0RI?=
 =?utf-8?B?UnJEMVl3Z0NnWnYwWHEvdHNjbHV6Z2s5WDN1V3dzTGJyZkpnd0JSRXhzdDZL?=
 =?utf-8?B?cGkzQWl6U2NXZVEwRXVqN1dkQUJRZXBPMEVXbzhDRXN6TjdGdXlVNytQQzgz?=
 =?utf-8?B?YzJpT0tza0dCaWRCM0tyaWd0ek1ZRis1Q3J0NUplR2JtTFg3VlBSM1JXbHpa?=
 =?utf-8?B?amwzb2hJK0RwQXhwWmdqdFRnZmlhczhGZEd3RThweXVIT1E4Q2NtajhSZGQz?=
 =?utf-8?B?TWpZOWtzeHNaMUdJdTdMamtuR1JCdXFaaU5KNHZCaTV0dFFDalhUdzJKRWtk?=
 =?utf-8?Q?CjfHqoMMKbWJ+RwDRD7d5g9AG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f47b3d-50a8-4f63-287f-08ddb4780311
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 06:09:30.0229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 75vBiXR2L6SE4bFq9mAV+Czea4oBEtc1nOm72HtqJhxDV/ge4yekjvPAKDuJqXzLeclUvfV8L/VmulDDwPAZyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8766
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


On 6/23/2025 4:39 PM, Santhosh Reddy Guddati wrote:
> Parse "IN_FORMATS_ASYNC" plane property to identify supported
> format modifier pairs for async flips
>
> V2: Add new fields async_formats and reset idx.
>
> V3: Improve commit message , remove unused declaration (Chaitanya)
>      Introduce structure to hold a format modifier and its
>      associated format list.
>
> V4: Implement format+modifier tuples for async similar to IN_FORMATS
>      (Chaitanya).
>
> V5: Re use local variables for async formats and free blob after
>      usage(Chaitanya)
>
> V6: Initialize async_modifiers and async_formats to NULL. (Chaitanya)
>
> V7: Fix async format count to return 0 on failures (Chaitanya)
>
> V8: Refactor parsing blob to a common function. (Ville)
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   lib/igt_kms.c | 73 +++++++++++++++++++++++++++++++--------------------
>   lib/igt_kms.h |  7 ++++-
>   2 files changed, 50 insertions(+), 30 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 9ee03e870..599901ee8 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -701,6 +701,7 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
>   	[IGT_PLANE_FB_DAMAGE_CLIPS] = "FB_DAMAGE_CLIPS",
>   	[IGT_PLANE_SCALING_FILTER] = "SCALING_FILTER",
>   	[IGT_PLANE_SIZE_HINTS] = "SIZE_HINTS",
> +	[IGT_PLANE_IN_FORMATS_ASYNC] = "IN_FORMATS_ASYNC",
>   };
>   
>   const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
> @@ -5786,13 +5787,43 @@ static int igt_count_plane_format_mod(const struct drm_format_modifier_blob *blo
>   	return count;
>   }
>   
> +static void igt_parse_format_mod_blob(const struct drm_format_modifier_blob *blob_data,
> +				      uint32_t **formats, uint64_t **modifiers, int *count)
> +{
> +	const struct drm_format_modifier *m = modifiers_ptr(blob_data);
> +	const uint32_t *f = formats_ptr(blob_data);
> +	int idx = 0;
> +
> +	*count = igt_count_plane_format_mod(blob_data);
> +	if (*count == 0)
> +		return;
> +
> +	*formats = calloc(*count, sizeof((*formats)[0]));
> +	igt_assert(*formats);
> +	*modifiers = calloc(*count, sizeof((*modifiers)[0]));
> +	igt_assert(*modifiers);
> +
> +	for (int i = 0; i < blob_data->count_modifiers; i++) {
> +		for (int j = 0; j < 64; j++) {
> +			if (!(m[i].formats & (1ULL << j)))
> +				continue;
> +
> +			(*formats)[idx] = f[m[i].offset + j];
> +			(*modifiers)[idx] = m[i].modifier;
> +			idx++;
> +			igt_assert_lte(idx, *count);
> +		}
> +	}
> +
> +	igt_assert_eq(idx, *count);
> +}
> +
>   static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane)
>   {
>   	const struct drm_format_modifier_blob *blob_data;
>   	drmModePropertyBlobPtr blob;
>   	uint64_t blob_id;
> -	int idx = 0;
> -	int count;
> +	int count = 0;
>   
>   	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS)) {
>   		drmModePlanePtr p = plane->drm_plane;
> @@ -5818,40 +5849,24 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
>   	}
>   
>   	blob_id = igt_plane_get_prop(plane, IGT_PLANE_IN_FORMATS);
> -
>   	blob = drmModeGetPropertyBlob(display->drm_fd, blob_id);
>   	if (!blob)
>   		return;
>   
> -	blob_data = (const struct drm_format_modifier_blob *) blob->data;
> -
> -	count = igt_count_plane_format_mod(blob_data);
> -	if (!count)
> -		return;
> -
> -	plane->format_mod_count = count;
> -	plane->formats = calloc(count, sizeof(plane->formats[0]));
> -	igt_assert(plane->formats);
> -	plane->modifiers = calloc(count, sizeof(plane->modifiers[0]));
> -	igt_assert(plane->modifiers);
> +	blob_data = (const struct drm_format_modifier_blob *)blob->data;
> +	igt_parse_format_mod_blob(blob_data, &plane->formats, &plane->modifiers, &plane->format_mod_count);
> +	drmModeFreePropertyBlob(blob);
>   
> -	for (int i = 0; i < blob_data->count_modifiers; i++) {
> -		for (int j = 0; j < 64; j++) {
> -			const struct drm_format_modifier *modifiers =
> -				modifiers_ptr(blob_data);
> -			const uint32_t *formats = formats_ptr(blob_data);
> -
> -			if (!(modifiers[i].formats & (1ULL << j)))
> -				continue;
> +	if (igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC)) {
> +		blob_id = igt_plane_get_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC);
> +		blob = drmModeGetPropertyBlob(display->drm_fd, blob_id);
> +		if (!blob)
> +			return;
>   
> -			plane->formats[idx] = formats[modifiers[i].offset + j];
> -			plane->modifiers[idx] = modifiers[i].modifier;
> -			idx++;
> -			igt_assert_lte(idx, plane->format_mod_count);
> -		}
> +		blob_data = (const struct drm_format_modifier_blob *)blob->data;
> +		igt_parse_format_mod_blob(blob_data, &plane->async_formats, &plane->async_modifiers, &plane->async_format_mod_count);
> +		drmModeFreePropertyBlob(blob);
>   	}
> -
> -	igt_assert_eq(idx, plane->format_mod_count);
>   }
>   
>   /**
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index a85fee515..7bc1a6886 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -365,7 +365,8 @@ enum igt_atomic_plane_properties {
>          IGT_PLANE_HOTSPOT_X,
>          IGT_PLANE_HOTSPOT_Y,
>          IGT_PLANE_SIZE_HINTS,
> -       IGT_NUM_PLANE_PROPS
> +       IGT_PLANE_IN_FORMATS_ASYNC,
> +       IGT_NUM_PLANE_PROPS,
>   };
>   
>   /**
> @@ -438,6 +439,10 @@ typedef struct igt_plane {
>   	uint64_t *modifiers;
>   	uint32_t *formats;
>   	int format_mod_count;
> +
> +	uint64_t *async_modifiers;
> +	uint32_t *async_formats;
> +	int async_format_mod_count;
>   } igt_plane_t;
>   
>   /*
