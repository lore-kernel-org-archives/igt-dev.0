Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E95CC83F25
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 08:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069D510E004;
	Wed, 23 Jul 2025 08:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fAUp5Nb3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4025210E004
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 08:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753258562; x=1784794562;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=zXPXGeRAF3thdxF56lOSNZYRjOxwYj1+XcIZnqO4bOc=;
 b=fAUp5Nb37Wq5vYLAWvNVni4BCjBtoJNAgvP5TEabTAUMpu3R+Fb/DtvD
 C+fCovRpIW8k6ldduNG5eFnjr7JBNmlpvly6AwbT6GcQM7Z/TRJqwr6so
 VXhaLxzbdXP3zTitgdR13XB3WdNu7548cjdgHKtePDFpL1Aj1JqBpJVO0
 9UuiG9spPewM3akdd2UfZBYfNm/hmAZ3glwQDLKPtmbcj5M/+CukF8g/k
 36V//2AD0DIUIfsWN6/7OhtBiWSI+H9opFED26GFcoQZZf3rut9kEXn1D
 UU9+naPsl/nudG95Ba/TPkWco/taI3hZX04la5K0ZLoVbOCVC186JPSfC A==;
X-CSE-ConnectionGUID: k2Hv4X7LR4ukwzifXDWihQ==
X-CSE-MsgGUID: ++i+9xZ9Sg6qkgxOJ66ZWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55473280"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208,217";a="55473280"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 01:16:02 -0700
X-CSE-ConnectionGUID: mj5jgBsTRHqnHXL0kFsoFQ==
X-CSE-MsgGUID: vYUP+gY3TzyjNuOQbOuk3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
 d="scan'208,217";a="159473442"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 01:16:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 01:16:01 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 01:16:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.53)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 01:16:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEmNXN4gA7L2c0r4L0HSlmXLPmpu8ujkC30xtz7+gZ1ypqu8tK11Y8ot0JlWVoMctDPZsRKpGdqnmkn4tEtMHhEJobxXLFcna1SBsDfb0oqob9/KfJRxrVCOjSEHYIpgpz0ruRz7KFxyczukupukwCnF3RBOshZOx4vagW5HZgHXnwAx1YsDMWqQ5tdLhS4BQTuVPt2oXCMXV977Vbe2BF7Z79huRcAsCj+i8CW1XGiIsljogYf2P+BxlDOyZJjGBegkMCc5z4jH/DV5gKNfgsNVwx7XNCW9QSoJolHJMjd+nusexTVh9b3JlvXubObQl7fgli1zdcodd4JEKQI21Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OisTOIDIA91AttEAn0D2EddX3fcNwRYaVuu1XbwX3uo=;
 b=BELKdXOODD9e6IQNN69ehU04PuJ3B9qDNkcEIvG0fMpyEouRa7ghaOXEg/LJfo+Mb1zUR9I0quBmcvjZa91qohJKYJIhNLDCKHkelJ5Mn+PUjdOVd7cSDdyMXV8e7mME0u8sAy9oJsL8uAIwaAEcXQiNKspMy8kuJY+Pi+S3NWdt+C1UqLf/8VoqjotlozW2OSnijFfeVsU/0SfgLGn4OoNY8ZBN3vXnt2blchc+wMgSB8g/Kwx/ZJoktQDF8fL9EvUtu2x0uu3QtFG+sMAt3P97AqEMzrM5ZwsFidBtuhJ6VbPLM/V171+jpCNJBonSwXhns9HGKTibOmGV+wDABQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA0PR11MB4751.namprd11.prod.outlook.com (2603:10b6:806:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 08:15:58 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8922.028; Wed, 23 Jul 2025
 08:15:58 +0000
Content-Type: multipart/alternative;
 boundary="------------USvUtQ0eKtUZsJ0D900Z2mni"
Message-ID: <8ae4b458-99e7-4cf7-99ca-bff80fe4582e@intel.com>
Date: Wed, 23 Jul 2025 13:45:49 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel?=
 =?UTF-8?Q?/kms=5Fjoiner=3A_Update_ultra_joiner_supported_platforms?=
To: <igt-dev@lists.freedesktop.org>
References: <20250703062655.894129-1-karthik.b.s@intel.com>
 <175166189116.136663.8937569423738796695@1538d3639d33>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <175166189116.136663.8937569423738796695@1538d3639d33>
X-ClientProxiedBy: MA5PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::10) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA0PR11MB4751:EE_
X-MS-Office365-Filtering-Correlation-Id: 23eb58ea-fa8a-445e-5969-08ddc9c12557
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|42112799006|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEhxYW1wajRMM0ZTMDk1U3ZSTW1JK2ZxZ2hSc1BEdzcwQUo3eDc3SUhSYlE1?=
 =?utf-8?B?dzFzUm4wSEw5UGZMaDd4clhNTCtLRmpwSUJidnBNSzNKRG9GamVEZk5TUW1B?=
 =?utf-8?B?dUVzbUpnblpYVUdobkJQdEVNSkswL1F3Y3hFVEx3bEw3RkFuOXFIODBxT0VJ?=
 =?utf-8?B?RmxUZVUwc3FHTzMxRE41Sy9qaUVlb2RDdGEwY3E0bFNpRFl2VTYrdUhNUEZX?=
 =?utf-8?B?T2VjTDgxdzFwczE4K0daZ1NUK0p1U2ZLaUdEQk5Iem5wN21JU3VITmFOdFV4?=
 =?utf-8?B?cU5rdlVCNEpNY3BqSmp0enpiSFBicW9Bc1oyUXR2M1FURXJSSDF0QjZXMmZW?=
 =?utf-8?B?TkZ4OEFIVTVERTI4emF1ZTRzeEZLYVpMRGpQQlFVMlVWVGsvV2NYb05SVkJS?=
 =?utf-8?B?YllJT0Rud0JkZEVJSlZ0c1JQSThaWFhjK1pMTHhLWWhPMXJYQ2lmdDY5SHdF?=
 =?utf-8?B?VGZPcGtQZjhCSkhoanFaY2RDNGNwd3VsUmNnczYzUkFxRHQ1MzYrRjF1N1NL?=
 =?utf-8?B?TVhtV0ZaRDR4R0pnYnJZNkpYb1NEOHMybm8rbTdIcXNXVk9mSlRvWmNUdDBP?=
 =?utf-8?B?MXQ4b2JBVTlvbVpVOHRySDcxMDVBQ21iUXpVNzhhWWdQMVI1bzBoNUVHb2li?=
 =?utf-8?B?bkFDM2haaGdRU25JM0NOcEs4SVY1L2VLSjdIdzZmRlVpczZYYXpEQkQ0ZWhI?=
 =?utf-8?B?djVVbktXQmJvRElGVlVCYVBJRnVKWkNVeGh1aDUrT256Wkc2a09NQWhWRTBX?=
 =?utf-8?B?SjErYzdiRWk5RHVNekNZUlpYMmZnNFdaYVhWbThXYVNMcWZIQkUzcUlwekJQ?=
 =?utf-8?B?dmhjYVErRzZtMjhLbEhOcHJpVVA4OSthNllObWxQZjMwM2hLWTZOd1gwbmxK?=
 =?utf-8?B?RXYrdWFLYWwybzlMaFZDMHRtbmEwT2pWMkpYV3Z1S2hhTkdsMUJYOHhKSUxq?=
 =?utf-8?B?UjRjNngvOGV6WGhWOFphbUd3akJVUkhqVnpzQXRUT3ZERFhkMFdCWVBLb3I4?=
 =?utf-8?B?M3lRWVFlUDVjdjRLZHIyQ0hTUEpFQ0VNWW5lbWMxY29sS1l3YnJjdENUY1d4?=
 =?utf-8?B?R1dKa1lzdkN2blpBaUs3R0dQZGJwbXUxTlRwcEtEN2lwZUs0NVJmcXBSNnlH?=
 =?utf-8?B?NUY5ZldybjRGdUJ4SzNoNVlDanVYbjJCRlZTZDZnMlE3MDZONUxMNG1Bbis0?=
 =?utf-8?B?U2k5TkR0UHpubzFmZFFhSUtqS0dPOTFWUVlzYUtWTWphRGl1b3lCVmxUL3ow?=
 =?utf-8?B?Z1R1V1ZrZFpMeWFzRXZoVE1LMDF3a2lxMDBMMVNEbktHclBabmxuUUovNlhW?=
 =?utf-8?B?UjJsQjFqcEcwS2hCeHQvbTIzRWtpcUNZMllWZ1ltaXJ1bnd1VVhac0lscE41?=
 =?utf-8?B?aHpTM3RucU5DSEF6aTFqTHJJbklnZ0U0ZjJkQVZ2eVZmWEN2OEVyOU9rTklF?=
 =?utf-8?B?WDJjVmVDZ05qQ283QTNNeXdXNWFVR3NMNWhZQi9kOGxUbzN1NUZIWHFFMko4?=
 =?utf-8?B?elEzdmJ1NzBidXBRZjgrdjZheEthYWwyamh6Y1V1N1F2NDJFcTcvZUZJTGFW?=
 =?utf-8?B?RjdPQis3U1R6N2x0OFBWSC9zQ0FHMFRaYkFJdUZ3ak9Odm1XendITE9oS04z?=
 =?utf-8?B?M0FMeWxybHZmV2Y3RXNkQlhBWXhwVS9IZUd1cmw2K3BwT2hSZlM2dlB2NHph?=
 =?utf-8?B?eEFwY2FBWXdPRnhJUnZkRUlET3Y4Y3BEQ1NmTlM1ZU5MNk54QXFmaGppN2pT?=
 =?utf-8?B?ZUQ2bm9IRk93N1YvVkdpS2NFZHRrZkNGQk5UV2hBbkE4Nk44UzJSRzlyazZM?=
 =?utf-8?B?MTRtY1BVL2Q4eWZHU0Z4MDliLzJuNU53WEJmMVg1elh2SnBsT1BQQ1k1ZGFU?=
 =?utf-8?Q?PKzuWpFLQTGe6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(8096899003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eThldEhpYzdaOUNIUTdTTzlJRDFnUTlQWHBhWGlpbllwZEdjU2l0dkU3eTVa?=
 =?utf-8?B?SlRMT2k2U0g2dDQ4dmZKblNuUWlMbVR4eXphaWNOUFF4NDRsWG5YNFd3ZlY3?=
 =?utf-8?B?NkJ4OU91c3JwdnYxbnFJNVpMZ21YUzFBdnJYRTVLdDAxTG9rUmlXd1FHdmNB?=
 =?utf-8?B?OVpWUHBweUx4WG1VUjVnam5hdndReWZEcVlTK3llbEpneFBFYkJZZTl6THZN?=
 =?utf-8?B?VDd2OUNEVXR3eTltcElRTzZFbGY0WVE5S3BvaktBczBLOHVPemltdlcxdmpy?=
 =?utf-8?B?amU3eHZuaG1vYThMNUhGSDZmSXRKUStzV2ZOcE1xVUJPSmtEM0lHZkM2a3FD?=
 =?utf-8?B?cUpQMjdteFZ2ajNJanU5N1l3d29xZkZpZ2hLVlQyRWIwa004ckNXRlJkMmJp?=
 =?utf-8?B?TU5jZDVTTFhick5HRlFCRmtRYWdxQmMrbytnM3hkSVNWMkpMV1lpMDN6T1l4?=
 =?utf-8?B?a016N29heFRuMlBxdnc1dE9KdjBzYWdUSm1WUEhVUU5Ka0hxb1Rwdm5Rc0p4?=
 =?utf-8?B?QzI0UnVhR3UrQlAwU1NnQUNaMEtLbXl4d0ZJMHp3TU1pdXN6V0xjUnp4S2M3?=
 =?utf-8?B?ZGI4YXV1d2xKdTI2WDgxd3hwbGFJS1pjZER4aTJNY1M2RkdnS2NmL2g4U3Nu?=
 =?utf-8?B?Vjl1SGlydStTaTlody9NeDJ6VVVCaUFwMC9QaUZYVU5kL0Y1SStpRGk2aWRX?=
 =?utf-8?B?Wm1hTHljZFFZb2pCY3VFMXF0TWhmOEkwNkptdEZCSkRqR3V2RTlaUURSQmlF?=
 =?utf-8?B?Sy9EUjcyMWxLSkJDajh3UnpiTzl6Nmw1ZGovaHMzOHZXeG4rWnRKR3pIUFh3?=
 =?utf-8?B?bnBxbzEzeFhValZpbDRVNEU3RU1PQndUMEp2OE9ENGIzUUJlc252d1haK3d0?=
 =?utf-8?B?dnpyYXViQ3NLYUpROWRiRGFKdGFiM1ptQ0EyM3RNNjJpZ1JDekQ2M0ZLcXJu?=
 =?utf-8?B?N053M05nN0EzWHlhNEtaY0ROZTJhVVViUUVFTDNWT1lLQzBidVFnYWdFMi9S?=
 =?utf-8?B?dTFtQzlCaHpvQXh6V0x6a1Q1TWFPb1A2UWg3NDVHS002UjdNY2kxSEFPZFVF?=
 =?utf-8?B?b3hPMTlVNTM3RlR2aVpBaHhmNGhSMEx5WDdaOFlEd1JaSEJJejJ3ZXV1KzRG?=
 =?utf-8?B?UUl6WHpFbURUYXdxdVRqbGJ3WWg5TEZTTjJ5K3VZb29keVY0TjI2MHEwcC9G?=
 =?utf-8?B?d05sUE0wMmRXbzY3akQrS3NtanF3RVVHVWJ2eGgyTzlNWmc1T0s2VUplb0lM?=
 =?utf-8?B?b0JPZnY5cjFqY2xiQlQ3NHZSdlBZYldIT0paRGV6QzIvdTFNK1N5SzFrWHo2?=
 =?utf-8?B?czI0VzZydUpzZCs2c1ZUdGIrNnFoeFFjV0RNdE4yZjBqdjd5MG8raXBTWmtX?=
 =?utf-8?B?eThiNVB3OVZhYXhObC9hdXp4ZE9DbXJkaVo2UlN3WGUwVVBQZlN0bTBpWk9J?=
 =?utf-8?B?WDZTM0JxajRqUThxZE5jSHYwS3J1aGVReVRwbzU5TVE1VDkySW1Odll5emxx?=
 =?utf-8?B?bzNtK2RHSVhDSnVPZDkvZ0t3NFpqeWN5bWJDVU5weWxKcDA5NHZ3TlNGMHZ0?=
 =?utf-8?B?NU9WbzlVUHJkOU1HeXViRW1HNVZxazkyYWlUemlMTDhjSmVWdDY3TnJtd2pR?=
 =?utf-8?B?cnAxQzg4UnpPZnFrV1RjZ1F6VVY5ckZkM2s5V0ZBbUh2QTVUUDBseDd6alRn?=
 =?utf-8?B?cWJFQkw5RWl0d28rOE1JM1NSeEJkM1VlT1pQRS94bGRqQXZpSzJvMEczdW1P?=
 =?utf-8?B?cHNLeVBDMWx4ODRMS1RCQ1hQSTFobmVFSWxkcWFaa3gxU2poTU9rNHZxbG91?=
 =?utf-8?B?L2IvS0tjUnhWSUdMN3FlTDIvM1EyRHR1UVUyS2JHNHR0Z1V2MnlNMU1rUlFz?=
 =?utf-8?B?NGgrSHdKSVZ1d2E3d3BjUWQ1S3NVWi9PWml2bFprNlJxbjh1TUViVW5Tcitu?=
 =?utf-8?B?aUlLZ0F6SEgxYkpvaHErTCtaU3BLOGczcC9pK0loOGlxTUwwV0ZSbmlDaFhq?=
 =?utf-8?B?aDZDbmQyOVYyRzlnalN6dkdhbGNkbUc4c2NuRWtwVzF6UlFzTjRtMHNiR3ZE?=
 =?utf-8?B?VHg2VDlFaUROQVRpVHlmLzI4VnNhaTMwbUtMQytyWXlrbi9HNExTK1EyQ2V1?=
 =?utf-8?Q?/dcQLQ7coho88ez907omZ5ueo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23eb58ea-fa8a-445e-5969-08ddc9c12557
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 08:15:58.1196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zbQezhhtPxviHD+8+8kHTldqQWE3VCkndSkMJj18KDEcGr1vrjbIGjRqsw5xAPdWfU7vz/+kmtRJF0O7IP461g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4751
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

--------------USvUtQ0eKtUZsJ0D900Z2mni
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Unrelated to the patch and seem to be an infra issue.

Results for ultra joiner subtest exists for this build and is skipping 
as expected.

https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13393/shards-all.html?testfilter=ultra

Will merge this patch.

Thanks,
Karthik.B.S
On 7/5/2025 2:14 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/kms_joiner: Update ultra joiner supported 
> platforms
> *URL:* 	https://patchwork.freedesktop.org/series/151106/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13393/index.html
>
> ERROR: The runconfig 'XEIGT_8436_FULL' does not exist in the database
>
--------------USvUtQ0eKtUZsJ0D900Z2mni
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>Unrelated to the patch and seem to be an infra issue.</p>
    <p>Results for ultra joiner subtest exists for this build and is
      skipping as expected.</p>
    <p><a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13393/shards-all.html?testfilter=ultra">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13393/shards-all.html?testfilter=ultra</a></p>
    <p>Will merge this patch.</p>
    Thanks,<br>
    Karthik.B.S
    <div class="moz-cite-prefix">On 7/5/2025 2:14 AM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:175166189116.136663.8937569423738796695@1538d3639d33">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/kms_joiner: Update ultra joiner supported
              platforms</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/151106/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/151106/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13393/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13393/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <p>ERROR: The runconfig 'XEIGT_8436_FULL' does not exist in the
        database</p>
    </blockquote>
  </body>
</html>

--------------USvUtQ0eKtUZsJ0D900Z2mni--
