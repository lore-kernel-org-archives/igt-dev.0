Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8A3C36002
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 16:18:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619A510E00B;
	Wed,  9 Apr 2025 16:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bo5rgFoT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D998210E00B
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 16:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744215526; x=1775751526;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tt9iQrVlhRPdFRKLUOVH/Ul++GwYp2mbkXLEqos48PE=;
 b=bo5rgFoTOujNIPcNE0r5E7okxN7DVx9iat34IDy8UgDBDxGsLdO+ED8l
 w86v4C/X3CIBeinmbRtZMSl4JvYjHTEoupFc4eqUXQtn2VR6GYxcOb9r5
 Nef/kYyRQxQqiHExMUm1WOJW0xIdw7LhchtVXT8Qbzc2Di20s3bs0Tk7w
 K/NVOgnv1ybk7In5FTG67GLc9WCERXrRa1/SNExClqqXe+SSK638wBBd4
 E2yAaDfoGvxthf2r6TV6DWY1UYps4TmajgLV/n0YPvT0lQe6b23yGDCPU
 al31LY4NA/zN2+xpv2HXfiZZyRCWnLXEHrpcx03mQQaVNIriFF7rRs1Bm A==;
X-CSE-ConnectionGUID: qk4MEzKRS0CtT0iZY0+P2Q==
X-CSE-MsgGUID: kiBIp0hSSImBT41XMnHJ2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45791938"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="45791938"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 09:18:43 -0700
X-CSE-ConnectionGUID: 46evNynZSmqtcCrvpVI/gQ==
X-CSE-MsgGUID: VVQwmEfDRVKsfUt9pQkFtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="133497429"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 09:18:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 09:18:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 09:18:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 09:18:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZVOAIGcsI8oiusv2X4ee9MyauTfq1fgn/nFfLC6l7Z6FjEaECGw66uLiJih+xsCJLxszKj0SZlP+n0eOaxgJqnpSQq7wHblPjt2zAF56ofgKBR2HTF3B7hADfoBdgsA35jrVhGatbup+KoNFtvvBgKCrUzI2Z9qIUw+f4LDo04gb2L7B91czD1CLY8Pfp3kmWMsjEBmX7RDic1+i+N4Z1j2/vOLqBrXNTKKxt5s+jjKHmmDbMAdex0ZvhO+W2moUdOnDoS0cDd0ZGLC9AXrxBCX0n+0w/rNcSWHRnM0SBOyxKNud+3DqOg0kbraj8TweU0/8hd2ArMYhxFxlrE4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FBZU3tBZE5DB7pWm1VD4MaTvR6IGU+Xe5iIqhawnUI=;
 b=qHYGoL/DBD5Vz9cgDFWMFcg4ThjuhB34uKLxXoO3TmFgRMS7lyV142ftVhWTvaBImATERxu/VSgPor8BI6S2P29O/Ohgkf8jO1psnmOemwWcG74PmjMLF/N/Xy4kHySVCqigNFSwuPxr6GGcjhIMYlh01vUT+s2StKT8fvG2kTdjXu94XHMIXeoFX29caq2olONYnbl9zg0Ca/khVjq1Afw3NAbvM8u4TKeMuODL0cEBtbcq/avPsD/U5DZzIWB7PWAy+QwYGooS4eBXGuk71EbpknVRG9hpLsvQshYw9hP96r7zMr+FvpbXgFls9/1c+rGn/WnV9fRCxCWm+yQDPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by IA1PR11MB8804.namprd11.prod.outlook.com (2603:10b6:208:597::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 16:18:27 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%3]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 16:18:27 +0000
Date: Wed, 9 Apr 2025 16:18:19 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <vinay.belgaumkar@intel.com>, <kamil.konieczny@intel.com>,
 <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v6 3/5] tools/gputop/utils: Add gputop utility
 functions common to all drivers
Message-ID: <bjqgoxqmihbtmsxjuy42i7zvsbmywyxrmt3lmdldgadtwyfb4n@tjohlawy5ukk>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250404132421.1920451-1-soham.purkait@intel.com>
 <20250404132421.1920451-4-soham.purkait@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250404132421.1920451-4-soham.purkait@intel.com>
X-ClientProxiedBy: VI1P195CA0069.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::22) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|IA1PR11MB8804:EE_
X-MS-Office365-Filtering-Correlation-Id: 9530f766-7eaf-4aa5-8bd1-08dd778228ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTNvWEdlajNWSHJxRUg3R3dqeUQ5SFExQTY0Z2tzTTZBb0xhN2xNeEJmN0d4?=
 =?utf-8?B?MjQyUTFVUnEyRExQbEVEUTdxa2VrUHVSR3JBRnRHVzF5TFBwQ0lCTm0vb2d3?=
 =?utf-8?B?amUxNzBHZVRqcTdZYTl5S3Z5bWQyR25ZdzJab0VzdDdoU2NMYVBzbjh0a1FG?=
 =?utf-8?B?akxkNS9SaWRLcjFtVUVHUWI4Q3dtc3pmd0VMWlJuUEgzdmh2SWRIbmRnRlc4?=
 =?utf-8?B?b0lkOXNOQ2FKelVKS0V0UVhlUFF5Q2RURkc2R2ZFdUhPWkZXT3M2ZmEzNEgy?=
 =?utf-8?B?eE44MEwrWjE3MUY2a1FuSVJiYVRsTlZVVnN2V3NYeWcyRjBxeDFBNVUxTVVz?=
 =?utf-8?B?c1UyZTVESHVTZUVqanF3bFZxMk9CTUhhQXZJb3NJdlM1MzVyekhqeXhHeFh4?=
 =?utf-8?B?dXhDd2VVVFhBMUd3K1dqRDdTZmZna2V0QmlTUDNGVEIrZTZyK2V5OVpHNERL?=
 =?utf-8?B?NFFYL2RxM0wwS1pYa2ovdlE0b2t5Sm5XYnpZZlpnOXZUTHRsVmhCTEFXUFNj?=
 =?utf-8?B?STAycGhGL3V4b3loZ1dXcFdUSGV0eWFkaFBPeTVXSERDNmlZNjhmclU0U1pG?=
 =?utf-8?B?TWxkS0p6UWNEdm53bG9zVEYrTU4zMnErdjl0ZHZ2cWRmeWlaY0w1U3JGcU9r?=
 =?utf-8?B?aDZlUFVsM3RjeElPMEkzSFczbThWbWVUTGl1UEtoSCtBUFA4Y0ppUndtSVpX?=
 =?utf-8?B?Yk1PcHBGWjV1S29UYTJPeTZvWFpWY1BwRnpPUVJIYUNtcTNiSytuV3Z3OXRY?=
 =?utf-8?B?RUZnU3JEck1LVVJ5T1M3ZENaRDEwTy8wcnRJVXlkVHNpdUU5SmVndUhwZERH?=
 =?utf-8?B?L3VzTU9SU3RQQ3VISDE4N0o4SW0yWG5CU1Nrc2loanBGWGlSK0hhRmZQL1ZS?=
 =?utf-8?B?MlpmYW1sTVQ3bUE3MnRIMFdhUG9xUWNzTDNlRUNqc0gzaHpDeVQzUTVEeWJ1?=
 =?utf-8?B?dExMTDRranVIbkxCbkpTQ1ZIcW5IaW5KZ05vNWhZd2ZMUVAvMGNzMXliWHdJ?=
 =?utf-8?B?M1ZIb0Rrd3VIdFcveEdSek1EUWkyUCtDS2hDTmNQakkzTFNaVTRnclJaZEMy?=
 =?utf-8?B?cXVzSVJjVmxTNGxlLysxQ213OXRpR1dERTV1QndSYzUvOHJSVi83c1ZMbVF3?=
 =?utf-8?B?RE51aEJRanRaQ1hoeE5uK3VHUGxTQWNDYkwzb3drZkRBM1FWbVV0QTNUc0pP?=
 =?utf-8?B?UFU5R3VkZTFGMlk5dWFpbVhqaU5RdXFmM1RNazExWlNBd0Y2Zk16blI4cWRI?=
 =?utf-8?B?NzQ4MjdlSmJqNU1lY3crYXJ3dVdPeWhvZW9YdTg0SHVLYnBLTzJEMHNvUG45?=
 =?utf-8?B?S01zVnZ4U0kvNm1aYU00UG9Mc0JFeHVNZkVHWUFJd1kyeDMrQ1p2Yi9VVzg0?=
 =?utf-8?B?Ulp4SkZBMEpDa0NhYnhBcURUVWJBbGppbjlPS2V2SGpVd2tobU40UkFhOFBV?=
 =?utf-8?B?RStYeVQwUDNUTkJoTnhFVFpNRlN5YWVPOXJjN3FXaWV3OUFEVnh6dHZkVHRJ?=
 =?utf-8?B?Y2VyYWdlLzk1bGx2ck9SWk1EWVlsV1owMTdOdXh1VzNMRi9od2xNZEErZDBQ?=
 =?utf-8?B?ZUJySVN1cHN0cG95M0dQQTVEeHc4clFjWjF1M1FiQ0I1anNWVGJzWlJsaEJW?=
 =?utf-8?B?T0dQWTh4eitnRkF1UTFqVkFiODE0MDlrblJPaEZuZXZSRzlKOFdnd1J3KzEv?=
 =?utf-8?B?Ym56SnBYYTliTVg0K29tejZORmdPQ094RWlyUnlDZXU0SVFZek1IcnlGVml3?=
 =?utf-8?B?Ky93NHdGWjgwT1kwYXR6SGlqbThnQml5VDV4UGxZMXJsbGpaOGlyTlhpRm9G?=
 =?utf-8?B?Y2ExUVV5eXFFWm9kYmJoUlpUcEhWL3FxYmsrVWJQTlp6UkNPSHdiVCtoeU9U?=
 =?utf-8?Q?VtkP62o3Bgr3E?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1VDelZpSTlsMnNTU1VWbWZqYjRRcjY0UFZRVFBzU3AyUmV3VlZLTEhWcXp0?=
 =?utf-8?B?aGI3akc1aVM5QWlKc3NMZmRuVEJjZ3NtSFk4ay9wY0NDV1JucVhwZFlYVjd2?=
 =?utf-8?B?Z1lYVDk2WjVMQlNjOXZXU2FtQ2k5ZDIxRHN4K2NIVDZSdnZoU2djR3RyRFA5?=
 =?utf-8?B?UFlTQUhFRkRzZDZEK2M3WGtxY21zQm5COU1HbjZpbmJmRHlNWm82YjQzaU1O?=
 =?utf-8?B?SGgzczVQWjVrQTl3aFJ3Sk9nREhPREZ2S2FTZ2FGOVhTeEdUOXI5cTVpazJK?=
 =?utf-8?B?cGp6R1JobkJxVTQyd1ArM1U0TnA0K1RNdkJ3OE5ocFMyN1RxbHVmNjJ1UGxL?=
 =?utf-8?B?R1ZKUzVBWHZCY2hRQithdk56SlFlMHkyOGc0NWd0MGl5R0ZiUk1QVEw1a0RJ?=
 =?utf-8?B?MkhVeDRCai9rZXVjYVRtWXUyL09pS0c4RzNmdSttTlNPVVQ3cVhJeEpCZGlu?=
 =?utf-8?B?Nkg4UjJUZmxXQ1RwVlp4NjlSVXRuK1JkVmJoYldDT2RBTy9RRXhvL1JMYXBV?=
 =?utf-8?B?bVhveitOR1VKMjI3RldKQlJlS2ZKNm1Ga1NES3docmMxMGZ4bFN2L1pMMUp4?=
 =?utf-8?B?WTJEQWROQVdnUTNGWjNUeHlWZ29MNGQ2VFQ2eFNWN2FtWFMxdklFbTc2VytZ?=
 =?utf-8?B?YmtuVzVWMWo0NWRqMkxoSGFyUi9sbGo2MFQ0bUdDM0RjZnZsSXBhZWtRbnJD?=
 =?utf-8?B?bmZOR3hzcTZOR0N1NmFUVUJCaUxnSjF2eWZZZ0dtTUtydmZ2elFyWG43OXBv?=
 =?utf-8?B?SzBTMFptYWM0aU5wb28ydWd6aGY1OVVGRmRkeWZnREFWYmRYdXIxVTZrOGxh?=
 =?utf-8?B?RmlTaStZdDMzZjA2VFdYTmsxMjBNcy91QnhaNXZwNHNlZm9FZ3JJeTJ1bTA0?=
 =?utf-8?B?VFl1Q254MnFHaW0wTFVsaFdvbC9mRTEzb1VxUFh2emRORFFSVzNTakgwdllG?=
 =?utf-8?B?c253SldJME5qb3o2M0E4T2laR0tuVG1pcE5SUS9UdExraWJwQmpqREZJb1dw?=
 =?utf-8?B?T1lLNlV0d3prRmJTNGlLYVoxaENRcHpOUm80REhuQWx2OWdOOFV6SURPa1U1?=
 =?utf-8?B?STY0Y3BtSXJBdFZKUEsxZkEwNG93UkxSYVVvMnJjbVhBMHJZVWo0U0JHUzVt?=
 =?utf-8?B?RStqY3F2QjduSmpLQ2tRTmh0N0VLVXlPY3lZSk81SllsTU8vanNtcXMvNm9X?=
 =?utf-8?B?YkRzTHJPTzRuRlV2bXZuK3A4Qk5ubjBSWVRrWDdneEV2VTNMcjBVN2pRWHZz?=
 =?utf-8?B?UDY3S2xNanc0UTZhUG5QY0ZMTnJaakZ1bTVia082a3E0NmQ4aXRzbHN5OGx3?=
 =?utf-8?B?eE5NcFY3eGd0b1RPZEwrbEx6TkIxaWx0WFVucXF1bzBnemJ1U3ZqcmJCS1Z1?=
 =?utf-8?B?Yjh1K21OakFYajcxbXFoa3lnb0lOcVFiZzZyOENqZUpNdG5zNzlxSVFXUHpJ?=
 =?utf-8?B?ODUwZHROYkVKWmdkYVRPRnhGUXBYODc0a3p4MFV1aWJFK21KaWpFQjFlT21j?=
 =?utf-8?B?QXNJQUhhb05xakpKblg1TU8veUNiWjEyTFNuS3JRUTU5azhyeExXNFFOU20r?=
 =?utf-8?B?MWl1VXZkdUpHTkU1Z2x2R0pkVnU0WUJFdHJNbFI1MHNTazR2NjhVTEYyaFZT?=
 =?utf-8?B?ZHBwdkd5eGdsUHBKV2xndDJVV3diRlJmUEdLQ044d3NJYnZCNEJrSzY4TUhs?=
 =?utf-8?B?OXRGRiszbFBZbEF4ci85bDNxaG5scC9xZml3b0pYZGNKNUcyRTVjNFV5VHVF?=
 =?utf-8?B?dzMyZ0FsRk55eDBFYU9sMDBUdmozejNzRTNCMWQ0QjU0SWh5SS9HK2tBVEJ1?=
 =?utf-8?B?emFweDhnOW92bTYzTnM0S1V2WjJMUVFTNE1TeDhqa3RJS09xWkVYdVdRdXp2?=
 =?utf-8?B?VG9kNWJmTUlHZkJaZG4xUW82OVVwYzdMd3ZmaVlnaXFqMzVvcVpWWXdaNDFZ?=
 =?utf-8?B?UCtlUldKd3J1WnhXVk1hVnkyT1c2TWFiNHJuN3EvWkJiUndUME9mUTE2c3ox?=
 =?utf-8?B?QWFzamk5RHZZYmQ4OUlEM0NEeGRvWldVSkU2cSs2U2xPbWsya25yQ2xnUEs3?=
 =?utf-8?B?SWxOR3M2QjBtMnlXNHZoS1o4a0xlcGZrUlc0YWROcU5sK0M2Mm83bnk3RVI0?=
 =?utf-8?B?UGxGSENyMldWZjUwNHVzNjE0WVk0TmJ3K1NJVU9VcGZyQ1UrWFdLOWhZQWdI?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9530f766-7eaf-4aa5-8bd1-08dd778228ab
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 16:18:27.0098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qApVqglBEZVtEOXdyOZtg14eOqDdHYawhPSQLb2HNaW6dM3muL8kDWc7ajSA1YkesmySCct537uI2i31IOx+GGmHTOujCNWOYbzzv3jTwxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8804
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

Hi Soham,

The patch looks good, I only have one suggestion below.

[...]

> +void print_percentage_bar(double percent, int max_len)
> +{
> +	int bar_len, i, len = max_len - 1;
> +	const int w = 8;
Does 'w' stand for width? Also, if w is not meant to be changed,
this variable could be made into a symbol with #define and a
meaningful name. Regardless, if you consider that or not:

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Best Regards,
Krzysztof

