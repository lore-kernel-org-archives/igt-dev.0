Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3197606A32A
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 15:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=choykwMQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935B510E257;
	Fri, 30 Oct 2026 15:35:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBDDA10E257
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 15:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793374465; x=1824910465;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2um8+hczF5L08Y6kdALayMspdrl4jXKV6pF3K6U1ev0=;
 b=choykwMQRt2a1MOjIrh24mqzgmRmeB4wKvd+i2ZhQrp4yYw4myLYSh46
 FI0QbW47uaqPIYa4iDvfx+jWsI9TNlWCMc6ON1gXEUuXqX3w4eJjNOZ/n
 SrdU99L17hKeMrbbxgtSgsUGarQiFbwxHYXs+p46YEkZrm+fl979KI5kn
 93SULT80IVvURz1IJC4umRkGenBjZbg6bv3kfknVkulAJGvIpWdl+2IhP
 h39ALmWD3WSwJmHDBQZtNBKmw8uW2vlQ1o2nskM8cfWlmdQXre/dnBuBo
 giy6+HHGfL5hl+RDFoTuUkrssS6jhV4c8/WktlL31l4B8IvWI7Gb2w32t w==;
X-CSE-ConnectionGUID: nPcf6Jg7QYSdVWRLFNjMKw==
X-CSE-MsgGUID: viyBQBeISkmnWtkeg58Oyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2023854"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2023854"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 08:34:25 -0700
X-CSE-ConnectionGUID: Uag341dgSNqjgXVBCGkyrQ==
X-CSE-MsgGUID: zctP58lTRAmJg5c0fdJikg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5354995"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 08:34:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 08:34:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 08:34:24 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.22)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 08:34:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nsbad/oLIwnnU7eULLwVqbXLkI3Iw7GDBlhJBqrhySVhCHFbvVr4OBzk9FrT+OTfqubb3IWZHfTR5d7hJ/mLh+XpIdeSodpkVt82rniczAEKoHDFO8YXQBP1fOmjQ4eQctg7PVc2WHbgYNdN0I17L/C61AM2UixFRdGWn9BaO9vIudPT+1Feitd55pBELsGruno3VehWGzzZYlEw4XsgbrsJb46N5XVln4MFxwdkofTPrz9067DtYWtj4oc2Cee+6zV8L0zhYp8/YjhcCiapDWDGS0HbvapqiaqZENrQtelNFA8BsaXz2MS1W3sZYKg/tWrz+C8w+xBPnvL5vcqwPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqWPZxHnV1YWhvtPc/7NQkhGLxkMyUkoiN1Vvgx9IwA=;
 b=NoTD1yEgHh7hSzpFMPrSklOMI31CZaT/kgLIGVTnoInKRi9+RyeL9juTAB3IKugps3U2M953XspTX4LX3XAI5UDEXNwl2AHouRklTHLwSw6F1+H/7hTBiXxY948L4lmlF+ry2dGqXk00aNJyBGGZRllncs8psEGCHCYC2G+90ITuBUcndiQSVymNO+zV5eEIDzLFhrkF8PJxOiq/lpQ3EwSd/nstDdlw33TI+HXaZM+0n58k/byVYpiebgvQi9Kiv9GU0lxAnYJqqz5fFeXzaL+IRiM/IW2AdFTfDE+vGsvZShRfGNdIJ9gX+Fy1AyU1oAkUZYnC3yNWLm/2vA6WcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 PH0PR11MB9752.namprd11.prod.outlook.com (2603:10b6:510:397::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 15:34:21 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 15:34:21 +0000
Message-ID: <156b46f1-69fc-4b7f-8277-dfa63e7659ab@intel.com>
Date: Fri, 30 Oct 2026 21:04:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/10] lib/igt_drm_ras_nl: add get_error_counter support
To: "Purkait, Soham" <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <mallesh.koujalagi@intel.com>,
 <harish.chegondi@intel.com>, <kamil.konieczny@linux.intel.com>
References: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
 <20261029085955.1232163-5-ravi.kishore.koppuravuri@intel.com>
 <410c19c9-77a6-40c8-acbf-fbe100f938e8@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <410c19c9-77a6-40c8-acbf-fbe100f938e8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0278.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::9) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|PH0PR11MB9752:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a49a8b7-8ec3-4c01-97ce-08df369b44ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|11063799006|56012099006|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261021121427099003|261022113327099003|261022105027099003|261022075727099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 0c6XjfmLNCXtWcLbk6aC1P4HfHIZeNHRNMpuVPN1tdbbV/Ru2JNWT/OXEFufo/pr98ZykbhdtyluQrRDBAa7Nv+PDfzQwDR3PrL1IhWqeYgtgUyT0MeqGrj8A3tle2fLG1QWZcvADYdb/D77WOL7IrT6xzZALK2q11Jz6L3i6my8RcFwGprj7WYDs143P/iJskwL0HAGPOP48/wTcZdwhzi7IX2bsfByjyeUyLFMw6EDTBbx/C350NOzEfohDxtD5Y54uSToUdbTbZDTfrEiMNwX4U9M5pMVInE4HaxeeIQWMys8JmKRn04CgVJEROz2ZnVsBsVNBtgkn5g3quJxbSmHdrp5t3K18EUfZGLfpzgzrUDn4q4TjQwD+/y8c++/Q22sK1oB/7kgjVu6ERRZvZ8kJIDYSPd/426kerD0wD2m4OJ6EdscwhiseSyL8dtrWz1prQpJC7bHRSeNvSvhWfVkTNDcvhmL6lFeT2nG1+Ci7PNCm43ArlZ+BWGCVVW43AsEb2PMDi2Pk66CWNhJ9jEeubPw7Df/FSiaOaLjrvheN3JY/nQgMy9h9Qj/jLzvY2ALQ7wCdIDlMcX8jN+gaw82zPg10H0S396b9mFiL3lOaHLjalaHt2doXQcD59aYMK8lToyYEq8vfFdOsuxuAnO/MAsrCuvMwZHP48sT66U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022113327099003)(261022105027099003)(261022075727099003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?em9iQ3MyOHB1SkJqTHJ2MDFvbFVFTk1Nd2ZjNG9ON3c0YWx1cE5lL2JlRVMz?=
 =?utf-8?B?UmxNQTUycTZFaXh4WlJ0SnlpcldSRUdENmdyc09EVDczYXFzVHBhcVNjY0d3?=
 =?utf-8?B?T2hKZksxVXJUdCtzMUptZ1l1dm5zQ2cxc1BLZDA0bFZhcDZrRGI1b3RCTm9h?=
 =?utf-8?B?dEpWeFNCNVU2eGZrRkZSZU0vMzRGdjd5anRubmlzbitoRmYyUnJiLzl2aVZM?=
 =?utf-8?B?OEppaFl0dzlUNjRZUE1xT3Z0Sy94aGNlS1A5eVZhYmNRZy9hQ3dzcHcxa29o?=
 =?utf-8?B?TGFzNGpYZnRsbW1lN2V1THN0TTkyK3R2TDRaQVhZemZDSGRURjc1Qm1iWFNX?=
 =?utf-8?B?RE9tTGg1VkE1eEtvdW9XSjBKWlBGSmw0bTNvdW1VV3pIa2lkR3dGa0d4MnVt?=
 =?utf-8?B?VnhiUzl0bVJhaW9TYUc2RHQ2ZDlKY2N5RG9QYzExWkMrSFZwS0tZUU9OZCs3?=
 =?utf-8?B?SzY4dSt2N2VWME9ZMm14QndGLy9tWlFtNUtBRjd3KzNSV0FSTnRQaTVHTjhU?=
 =?utf-8?B?cnd2cStzQzNzWjBYd1FKRUs5akdlZjNJelRpamhJOUJqblFjSDgyTGV6MlBy?=
 =?utf-8?B?UnJUcU5CclFzL2pnUzV3R3ZkQmxWdGpqalFjcG1EaUx2Q2R3WG1acVNSMXBk?=
 =?utf-8?B?WVRxbGJOMER3Y2kySnpzNnM0RTkvWlcyRmwvMVJVbHJIQjFpbkkvL1RnRWdL?=
 =?utf-8?B?VFN2bEhCL1M5TlFmc1NTSjIwL0dsL29Na1RPbzIxRFYveWdWK2ZEcnpQMUda?=
 =?utf-8?B?V0JwdG1nQ1VlU25LMGJQOUFKb3phYUhGT1VzOXRSN2p3QTB5UmhaUkFFZVVu?=
 =?utf-8?B?Ris3bWRWUmlOdWZTZUpzN25EcFJPS2FoT3VFajduUDJZci90YWVod0lCRVh4?=
 =?utf-8?B?UElNTUVxS3hWbUdOUjVpdS9iakhqSVozYTRjRHRSVjQvbjZQVTRWS3Fjb1p4?=
 =?utf-8?B?OFNRSC9GZEtwU2hxSkU1dFRsenlCV2lONU5vckU2WDZ1YldDeVU1czV0MXlF?=
 =?utf-8?B?T1IxZC9NY0tBclZVUmE5ZHVuTFY5VnMrMkxOdDk1UVdBNDVNSzkra0NzQmdT?=
 =?utf-8?B?L1U0bkRqZm5TTGpkYVg4YmlFZXJNUEpKUUtKWnh1bnVkQUdMWkVEZ3RJOWtZ?=
 =?utf-8?B?SEFldFJIaTZPaGE2S2VCbXJDMDhVRjBPU3hzVlJzNDRma05LQXhHR1VUbnBG?=
 =?utf-8?B?M2RtelBPYXBRRjV0b01od01UNEpYY1p3U2MwcXZ1KzAyZjViU3dSNmpkc1Zj?=
 =?utf-8?B?VG04UVF6SHNac1ZZL0lBcWNKd2J0VE1QTVR4dHc4YTZsNFBjTXc1bTRBOC82?=
 =?utf-8?B?Y2F6UFBhaEJ0QUw5UW1uOFVWVVp3TnJ2K09LZWpHNi9ieWR2aGdrWmhVOUc5?=
 =?utf-8?B?K21JMTRST3NlMGZuVkVyQU9NODJ1UVVWVERBYXBrSlNpK3ZyaGJQaHg1enQw?=
 =?utf-8?B?SXRud3BDaHg4ejI5ZDFJeDAwODdMUTlLTlNtSGgwOXg1MjB0RmxEL2M5ZnJD?=
 =?utf-8?B?cXJQWEtFbGphMVREVE5ncGFyMHRlQ2N5K0dmdE1LelhpV25mM29lRDNGT2hB?=
 =?utf-8?B?SlBDRWYyYS9jWWQ0MVJ3bFhIc2xsUGVyTjU5U1NCN21OOHMzdnNJd0NyM25s?=
 =?utf-8?B?dHk3MWc4VitlNEE0eGFQcDBUcm5SWk5meHkrRlhwaEZPUGFZSVZDbjRUVUFV?=
 =?utf-8?B?MmhaQmhPWnlFWW5zWStRME5mTjdyUGh2eFA3eEZvcStybldxbUVRK0l0NElM?=
 =?utf-8?B?Mk51eDlEb2M1V292LzJadjhUTUJmWUw5VHlNR01meHVNNGJvQlEvMmd2QThH?=
 =?utf-8?B?OHZIOFlMMzM5bVA4cGlpVFFDVFdXbklyRlllc25nSUg3NVJwS2MwMGk5TkZG?=
 =?utf-8?B?cXJBZms1aEU4eGIxaUNYTmhOcE1YY0U3eVJkbE5OZksvMGEvRmNvU1BSUkc4?=
 =?utf-8?B?d244YmZqalF5V1M2OXpLNFhNakJFeWRQMldTa2JTQTdFbEFub3psbXVTNG9M?=
 =?utf-8?B?WjBoeFNWa3dEYXY5SkYxWEE3c2o4aVRia2RjWTMySWNiQmJZZDlpa0lLbkhS?=
 =?utf-8?B?MG9RWEhVdVg1WElwMnJycng5a1pzWWNWMWZpaGNXdE1tUjFQQzhHNjNkQWw5?=
 =?utf-8?B?S2xtUWJ6WDhpanhQTWZvS0s3akR2cVc4WU5LN1EweWpsdWZWRWcvcUhSZzVm?=
 =?utf-8?B?V3pzL2ViWXZCanFTaDFWWkZkQ1RWNXFTSS9rSE5ZRGw5M242cW5ORjBUS2Rr?=
 =?utf-8?B?bnNMZzB2WnZhMGNqMTh3U05IeWxuQWMxZS9sWmJlMGo4YUJDd1I1WEErUGQr?=
 =?utf-8?B?VkpHU0lnLzhpOEV6WWl1c3VKdmhEa0Y5TFM2cjBuSFBVb0NYVDhJazZWTCs0?=
 =?utf-8?Q?JnoLBe41tq1JweSvib7rFbCUQXjEBVIFDz+DU?=
X-Exchange-RoutingPolicyChecked: L2GBZLRyu9WBQmAyw57xVpM8ADvfD7dTaSnngivHRL5r9Vw9aFWhhhzrc9IGNgZ4wz6lotB3kpzB4sJ6ELQTzlKnWhEbaRRTWP0XWgDopzNwudF6MzI3Tr1dYuYEu48jiCBNQYsn3t1WF7aG+Lb6Rz4YRbTm1pjuO/uogRvf0xDwmtgI3oe4b1gQvq3a+NjakozBTSQa4FytEW+ioC/LsJ9l3m5Jv6qY+rJaOr/MrUr66zQTXGqOS4D8AWK/k1QzzZpbejowzdPhkdHXVz4H5XzzgW114MkPuQanGVZInjuEl+iFMOEoydoK1ZpzZ0SIzudTKowWm+LQtHbA2GfmhA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a49a8b7-8ec3-4c01-97ce-08df369b44ad
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 15:34:21.3786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JujjyNXjDNwxld2QTzzNqv6HafJvg32sS0MlHgFAhCoBeIkDao5d02XqmM0zrng2+M6x1TfmzaAYHC2jZwsJEQLAqbZaxXTIMbspYQCPVhn4ACzUAL0F1kKwiwkwFJDi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9752
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Soham,

On 30-10-2026 15:34, Purkait, Soham wrote:
> Hi Ravi,
>
> On 29-10-2026 14:29, Ravi Kishore Koppuravuri wrote:
>> Add netlink request/response handling for DRM_RAS_CMD_GET_ERROR_COUNTER.
>>
>> Signed-off-by: Ravi Kishore Koppuravuri 
>> <ravi.kishore.koppuravuri@intel.com>
>> ---
>> v6:Removed normalize_nl_error() for standard errno in ras_error_cb() and
>>     send_and_recv_nl_msg() (Soham)
>> v5:Renamed library function names prefixed with igt_drm_ras_nl_*
>>     (Riana and Soham)
>>     Normalized libnl error codes to standard errnos (Soham)
>>     Added error messages for error handling functions (Riana)
>>     Changed the error-id max value from UINT32_MAX to 
>> DRM_XE_RAS_ERR_COMP_MAX (Riana)
>> v4:Added support to poll for incoming netlink messages with 10 
>> seconds timeout
>>     Renamed the library functions with prefix "igt_drm_netlink_*" and
>>     other cosmetic changes (Nikula Jani & Kamil)
>> v2:Handled ACK/FINISH/ERR nl responses using separate callbacks
>>     Added a check whether error_value updated by valid callback or not
>>     Added a check whether response required for the command or not
>> ---
>>   lib/igt_drm_ras_nl.c | 317 ++++++++++++++++++++++++++++++++++++++++++-
>>   lib/igt_drm_ras_nl.h |  34 +++++
>>   2 files changed, 349 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
>> index 2822361d3..7e6a61f11 100644
>> --- a/lib/igt_drm_ras_nl.c
>> +++ b/lib/igt_drm_ras_nl.c
>> @@ -3,14 +3,286 @@
>>    * Copyright © 2026 Intel Corporation
>>    */
>>   +#include <errno.h>
>> +#include <poll.h>
>>   #include <stdint.h>
>>   +#include <netlink/errno.h>
>>   #include <netlink/genl/ctrl.h>
>>   #include <netlink/genl/genl.h>
>>     #include "igt_core.h"
>>   #include "igt_drm_ras_nl.h"
>>   +#define DRM_RAS_NETLINK_REPLY_TIMEOUT_MS 10000
>> +
>> +/* Normalize netlink error codes to standard errnos */
>> +static int normalize_nl_error(int ret)
>> +{
>> +    if (ret >= 0)
>> +        return ret;
>> +
>> +    switch (-ret) {
>> +    case NLE_INVAL:
>> +        return -EINVAL;
>> +    case NLE_NOMEM:
>> +        return -ENOMEM;
>> +    case NLE_NOATTR:
>> +    case NLE_MISSING_ATTR:
>> +        return -ENODATA;
>> +    case NLE_OPNOTSUPP:
>> +        return -EOPNOTSUPP;
>> +    case NLE_EXIST:
>> +        return -EEXIST;
>> +    case NLE_NOADDR:
>> +        return -EADDRNOTAVAIL;
>> +    case NLE_PERM:
>> +        return -EPERM;
>> +    case NLE_NOACCESS:
>> +        return -EACCES;
>> +    case NLE_NODEV:
>> +        return -ENODEV;
>> +    case NLE_BUSY:
>> +        return -EBUSY;
>> +    case NLE_AGAIN:
>> +        return -EAGAIN;
>> +    default:
> Any igt_debug log required? could be useful during debugging.
ok sure. Will add igt_debug()
>> +        return -EIO;
>> +    }
>> +}
>> +
>> +static int ras_command_cb(struct nl_msg *msg, void *arg)
>> +{
>> +    struct igt_drm_ras_nl_context *ctx = arg;
>> +    struct nlmsghdr *nlh;
>> +    struct genlmsghdr *gnlh;
>> +    struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
>> +    int ret;
>> +
>> +    nlh = nlmsg_hdr(msg);
>> +    gnlh = nlmsg_data(nlh);
>> +
>> +    ret = genlmsg_parse(nlh, 0, attrs,
>> +                DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
>> +    if (ret < 0)
> Any igt_debug log required?
May not be useful. This if() case is hit during the scenarios (1)when 
the message cannot be parsed, (2) lack of expected error-value 
attribute, or (3)unrecognized command. In these cases, SKIPs the current 
case and continues with the later responses for checking valid reply or 
ACK to complete the command.
>> +        return NL_SKIP;
>> +
>> +    switch (gnlh->cmd) {
>> +    case DRM_RAS_CMD_GET_ERROR_COUNTER: {
>> +        if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE])
>> +            return NL_SKIP;
>> +
>> +        ctx->error_value = 
>> nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
>> +        break;
>> +    }
>> +    default:
> Any igt_debug log required?
Same here. if the command received is not the valid one, it hits default 
case and skips the iteration and continues to the next.
>> +        return NL_SKIP;
>> +    }
>> +
>> +    ctx->reply_received = true;
>> +    if (ctx->ack_received)
>> +        ctx->cmd_done = true;
>> +
>> +    return NL_OK;
>> +}
>> +
>> +static int ras_error_cb(struct sockaddr_nl *nla, struct nlmsgerr 
>> *err, void *arg)
>> +{
>> +    struct igt_drm_ras_nl_context *ctx = arg;
>> +
>> +    /* err->error is a raw kernel errno, not a libnl NLE_* code */
>> +    ctx->last_nl_error = err->error;
>> +    ctx->cmd_done = true;
>> +
>> +    return NL_STOP;
>> +}
>> +
>> +static int ras_ack_cb(struct nl_msg *msg, void *arg)
>> +{
>> +    struct igt_drm_ras_nl_context *ctx = arg;
>> +
>> +    ctx->ack_received = true;
>> +    if (!ctx->response_required || ctx->reply_received)
>> +        ctx->cmd_done = true;
>> +
>> +    return NL_STOP;
>> +}
>> +
>> +static int ras_finish_cb(struct nl_msg *msg, void *arg)
>> +{
>> +    struct igt_drm_ras_nl_context *ctx = arg;
>> +
>> +    ctx->cmd_done = true;
>> +
>> +    return NL_STOP;
>> +}
>> +
>> +static int register_callbacks(struct nl_cb *cb, struct 
>> igt_drm_ras_nl_context *ctx)
>> +{
>> +    int ret;
>> +
>> +    ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, 
>> ctx);
>> +    if (ret < 0) {
>> +        igt_warn("Failed to set NL_CB_VALID callback (ret=%d)\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    ret = nl_cb_set(cb, NL_CB_ACK, NL_CB_CUSTOM, ras_ack_cb, ctx);
>> +    if (ret < 0) {
>> +        igt_warn("Failed to set NL_CB_ACK callback (ret=%d)\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    ret = nl_cb_set(cb, NL_CB_FINISH, NL_CB_CUSTOM, ras_finish_cb, 
>> ctx);
>> +    if (ret < 0) {
>> +        igt_warn("Failed to set NL_CB_FINISH callback (ret=%d)\n", 
>> ret);
>> +        return ret;
>> +    }
>> +
>> +    ret = nl_cb_err(cb, NL_CB_CUSTOM, ras_error_cb, ctx);
>> +    if (ret < 0) {
>> +        igt_warn("Failed to set NL_CB_ERR callback (ret=%d)\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int send_and_recv_nl_msg(struct igt_drm_ras_nl_context *ctx,
>> +                struct nl_cb *cb,
>> +                struct nl_msg *msg)
>> +{
>> +    struct pollfd pfd = {
>> +        .fd = nl_socket_get_fd(ctx->sock),
>> +        .events = POLLIN,
>> +    };
>> +    int ret;
>> +
>> +    ret = nl_send_auto(ctx->sock, msg);
>> +    nlmsg_free(msg);
>> +    if (ret < 0) {
>> +        nl_cb_put(cb);
>> +        return normalize_nl_error(ret);
>> +    }
>> +
>> +    /* NL Reply and ACK arrive as separate responses */
>> +    while (!ctx->cmd_done) {
> Is timeout required ?
timeout is added for poll() which waits for 10 secs as part of 
do-while() loop to get a message and outer while() loop is to wait until 
the response is completed / finished. In addition to the per-message 
timeout of 10 secs, will add 1 min overall timeout for the outer while 
loop.
>> +        do {
>> +            /* poll for incoming netlink messages with 10 seconds 
>> timeout */
>> +            ret = poll(&pfd, 1, DRM_RAS_NETLINK_REPLY_TIMEOUT_MS);
>> +        } while (ret < 0 && errno == EINTR);
>> +
>> +        /* poll()/errno results are already standard errnos, not 
>> libnl codes */
>> +        if (ret == 0) {
>> +            nl_cb_put(cb);
>> +            return -ETIMEDOUT;
>> +        }
>> +
>> +        if (ret < 0) {
>> +            nl_cb_put(cb);
>> +            return -errno;
>> +        }
>> +
>> +        if (!(pfd.revents & POLLIN)) {
>> +            nl_cb_put(cb);
> Any igt_debug log required?
will add igt_debug log
>> +            return -EIO;
>> +        }
>> +
>> +        ret = nl_recvmsgs(ctx->sock, cb);
>> +        if (ret < 0) {
>> +            nl_cb_put(cb);
>> +            return normalize_nl_error(ret);
>> +        }
>> +    }
>> +    nl_cb_put(cb);
> nl_cb_put(cb) cleanup is repeated on every exit path. Could a single 
> goto unwind be used ?
sure. will create a goto for this
>> +
>> +    return 0;
>> +}
>> +
>> +static int send_command(struct igt_drm_ras_nl_context *ctx, uint8_t 
>> cmd)
>> +{
>> +    struct nl_cb *cb;
>> +    struct nl_msg *msg;
>> +    void *msg_head;
>> +    int ret;
>> +
>> +    msg = nlmsg_alloc();
>> +    if (!msg)
>> +        return -ENOMEM;
>> +
>> +    ctx->last_nl_error = 0;
>> +    ctx->cmd_done = false;
>> +    ctx->reply_received = false;
>> +    ctx->ack_received = false;
>> +    ctx->response_required = false;
>> +
>> +    msg_head = genlmsg_put(msg,
>> +                   NL_AUTO_PORT,
>> +                   NL_AUTO_SEQ,
>> +                   ctx->family_id,
>> +                   0,
>> +                   NLM_F_REQUEST | NLM_F_ACK,
>> +                   cmd,
>> +                   DRM_RAS_FAMILY_VERSION);
>> +    if (!msg_head) {
>> +        nlmsg_free(msg);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    switch (cmd) {
>> +    case DRM_RAS_CMD_GET_ERROR_COUNTER:
>> +        ctx->response_required = true;
>> +        ret = nla_put_u32(msg,
>> +                  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
>> +                  ctx->node_id);
>> +        if (ret < 0) {
>> +            nlmsg_free(msg);
>> +            return normalize_nl_error(ret);
>> +        }
>> +
>> +        ret = nla_put_u32(msg,
>> +                  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
>> +                  ctx->error_id);
>> +        if (ret < 0) {
>> +            nlmsg_free(msg);
>> +            return normalize_nl_error(ret);
>> +        }
>> +        break;
>> +    default:
>> +        nlmsg_free(msg);
>> +        return -EOPNOTSUPP;
>> +    }
>> +
>> +    cb = nl_cb_alloc(NL_CB_DEFAULT);
>> +    if (!cb) {
>> +        nlmsg_free(msg);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    ret = register_callbacks(cb, ctx);
>> +    if (ret < 0) {
>> +        nl_cb_put(cb);
>> +        nlmsg_free(msg);
>> +        return normalize_nl_error(ret);
>> +    }
>> +
>> +    return send_and_recv_nl_msg(ctx, cb, msg);
>> +}
>> +
>> +static void reset_drm_ras_nl_context(struct igt_drm_ras_nl_context 
>> *ctx)
>> +{
>> +    ctx->sock = NULL;
>> +    ctx->node_id = UINT32_MAX;
>> +    ctx->error_id = DRM_XE_RAS_ERR_COMP_MAX;
>> +    ctx->error_value = 0;
>> +    ctx->last_nl_error = 0;
>> +    ctx->cmd_done = false;
>> +    ctx->reply_received = false;
>> +    ctx->ack_received = false;
>> +    ctx->response_required = false;
>> +    ctx->family_id = -1;
>> +}
>> +
>>   void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx)
>>   {
>>       if (!ctx || !ctx->sock)
>> @@ -18,14 +290,19 @@ void igt_drm_ras_nl_cleanup(struct 
>> igt_drm_ras_nl_context *ctx)
>>         nl_close(ctx->sock);
>>       nl_socket_free(ctx->sock);
>> -    ctx->sock = NULL;
>> -    ctx->family_id = -1;
>> +
>> +    reset_drm_ras_nl_context(ctx);
>>         igt_debug("Cleaned up netlink socket.\n");
>>   }
>>     int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx)
> Several paths return a generic -1. Could specific errnos be returned 
> with a igt_warn() ?
will check it once.
>>   {
>> +    if (!ctx)
>> +        return -EINVAL;
>> +
>> +    reset_drm_ras_nl_context(ctx);
>> +
>>       ctx->sock = nl_socket_alloc();
>>       if (!ctx->sock)
>>           return -1;
>> @@ -48,3 +325,39 @@ int igt_drm_ras_nl_init(struct 
>> igt_drm_ras_nl_context *ctx)
>>             DRM_RAS_FAMILY_NAME, ctx->family_id);
>>       return 0;
>>   }
>> +
>> +int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context 
>> *ctx)
>> +{
>> +    int ret;
>> +
>> +    if (!ctx || !ctx->sock || ctx->family_id < 0) {
>> +        igt_warn("Invalid DRM RAS netlink context\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (ctx->node_id == UINT32_MAX ||
>> +        ctx->error_id == DRM_XE_RAS_ERR_COMP_MAX ||
>> +        ctx->error_id == 0) {
>> +        igt_warn("Invalid node_id (%u) or error_id (%u) provided\n",
>> +             ctx->node_id, ctx->error_id);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ctx->error_value = UINT32_MAX;
> Keep initial value consistent with the reset initial value (0) in 
> reset_drm_ras_nl_context().

reset_drm_ras_nl_context() runs during initialization and cleanup but 
not before every counter query. Setting error_value to UINT32_MAX there 
will not prevent a later query from retaining the previous query’s 
value. If we initialize error_value to 0, we will not be able to 
distinguish whether the kernel returned a valid counter value of zero or 
no counter value was received. Initializing it to UINT32_MAX helps to 
identify the “no reply received” case.

>> +
>> +    ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    if (ctx->error_value == UINT32_MAX) {
>> +        igt_warn("No valid error counter reply: node_id=%u 
>> error_id=%u kernel_error=%d\n",
>> +             ctx->node_id, ctx->error_id, ctx->last_nl_error);
>> +
>> +        return ctx->last_nl_error ? ctx->last_nl_error : -ENODATA;
>
> is last_nl_error always negative ?
>
> Regards,
> Soham

this holds the last error reported by kernel and it will be negative.

Thanks,

Ravi Kishore K.

>
>> +    }
>> +
>> +    igt_debug("Retrieved error counter: node_id=%u error_id=%u 
>> value=%u\n",
>> +          ctx->node_id, ctx->error_id, ctx->error_value);
>> +
>> +    return 0;
>> +}
>> diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
>> index 011f3bc05..f51784524 100644
>> --- a/lib/igt_drm_ras_nl.h
>> +++ b/lib/igt_drm_ras_nl.h
>> @@ -7,14 +7,48 @@
>>   #define IGT_DRM_RAS_NL_H
>>     #include <drm-uapi/drm_ras.h>
>> +#include <drm-uapi/xe_drm.h>
>>   +/**
>> + * struct igt_drm_ras_nl_context - DRM RAS generic netlink context
>> + *
>> + * Holds the state for a DRM RAS generic netlink request/response 
>> exchange.
>> + */
>>   struct igt_drm_ras_nl_context {
>> +    /** @sock: Netlink socket used for the exchange */
>>       struct nl_sock *sock;
>> +
>> +    /** @node_id: DRM RAS node ID to query the error counters */
>> +    uint32_t node_id;
>> +
>> +    /** @error_id: RAS error ID to query the error counter */
>> +    uint32_t error_id;
>> +
>> +    /** @error_value: Error counter value returned by the kernel */
>> +    uint32_t error_value;
>> +
>> +    /** @last_nl_error: Last netlink error reported by the kernel */
>> +    int last_nl_error;
>> +
>> +    /** @cmd_done: Set when the command exchange has completed */
>> +    bool cmd_done;
>> +
>> +    /** @reply_received: Set when the command reply has been 
>> received */
>> +    bool reply_received;
>> +
>> +    /** @ack_received: Set when the command ACK has been received */
>> +    bool ack_received;
>> +
>> +    /** @response_required: Set when a reply is expected before 
>> @cmd_done */
>> +    bool response_required;
>> +
>> +    /** @family_id: Generic netlink family ID */
>>       int family_id;
>>   };
>>     void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
>>   int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
>> +int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context 
>> *ctx);
>>     #endif /* IGT_DRM_RAS_NL_H */
