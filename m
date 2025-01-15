Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19AFC02180
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 23:27:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACBB10E829;
	Wed, 15 Jan 2025 23:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SHAa65yH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4E210E829
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2025 23:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736983640; x=1768519640;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=o4PTMqkksRE4jAIqnY7ZYHT3gFog2gR70x8XkhgCn+0=;
 b=SHAa65yHbS0WUEgfBl4pBiKkZ/hvt4gNAjltk+l1xrGb/Qrg1AuFgY5o
 0D8rCLTo7o7zTwHoEjY9J9DyBO4PIhxeVg7SRledd78jv4INw/PMDd0GI
 AZt0Tcq/OcfYKm5Q7Hg0oKRvJb3yOxgq0liROnggFTafR2+mA63/Q2ItJ
 qaWJMrC/NtvOhv4HV7TvWXNSu84iaI1zvC8LtcXz4n32pTrH6yWSkB1Tt
 vH1ZPueDFwL6WDd7hq2oy6Qy+3ecovAfOALnfWtabwV5mBeL7QEsUqyyE
 tQDQpUG0N8+WD9rgF2x5/h5KB7fQECZBPRoRHyYGh7YjDNCXl3x4weFVg w==;
X-CSE-ConnectionGUID: X1nLotK5Qm+FCDmrPHwUsg==
X-CSE-MsgGUID: 6VMxMLYHTbWCWsYAXsnnEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="48343365"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="48343365"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 15:27:19 -0800
X-CSE-ConnectionGUID: v/Q8WSnCSAmBj1mH6TECIw==
X-CSE-MsgGUID: X8hBO3BjRriYgvILcqDArg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="105111312"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 15:27:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 15:27:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 15:27:18 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 15:27:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPU/CqROnOSVWjSspkqX/Uwd59rUsp2690mVSQZeHPFc9l6BEDBC94MmWt0OPgNwXw1iNs9WB+rdZClw+GdxpxP5c4oFOetHGjCQ5chC+oaYdepjRBhsQ9Ug63Q5mPw6ROZkm6iLamya5o+mCnZk2/abOTuVotoag4UUEdpFXSgK4RcuaIb+1SUiYjER4HBfEqDMtLyJ/Sy4pOJCj2CYYG3zQwixJADTq2qWHfhuXhNv3BRXUdfyFMHuKFThbndrygNT8zKNhpX48a9I7I5bjNyEwJMyikQ0cGvpaRqVbcDYIoTkK1R7v8QSq3TvzkpgVNxKz9Gv4V/zPxUeBlcKJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UnDbHNEpq9HAY17XqiD3ca7nhunUHcPL6Bb2MJAhYZ8=;
 b=x69uwA9psz5ZGxP/kbtbNUITGGy9FRoN/SvQ+UpP86oYMGw4I5f7Lwc62sXYzUD5EnJ8a+HKcN0/sod2n9aWdsa0S8PYkF0i2PoKEU9YCSWl+P8jd7mmTPhAmj37nVp9W42AqELUwzj4U5Sh+H41kE+cCfrzQhQWWDGe3rQwoRIWc0GUxREu9Fz0DKz/TIWlat3Mnz0cplm9xY0xomeBN/1Wrur7pXNuGsXc7QAu4PeX+z8Hkl9hgbDZxi99FbQCRMcueRU8z1SMOd/z+3kasBjafbatvso0l433A5Ld4ZZSlOGxqKQwjlD7ISP+D8CkAjJ/GpHmiWd7V53MdHui+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by BN9PR11MB5292.namprd11.prod.outlook.com (2603:10b6:408:119::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 23:26:48 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 23:26:48 +0000
Message-ID: <cb414d75-d63d-42a2-b831-9a3bf0d8d8ae@intel.com>
Date: Wed, 15 Jan 2025 15:26:45 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/7] drm-uapi/xe: Sync PXP uapi updates
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20241212001829.2082490-1-daniele.ceraolospurio@intel.com>
 <20241212001829.2082490-2-daniele.ceraolospurio@intel.com>
 <ca21490a45e63c4e5c4224e454ad4ad5dba58f5f.camel@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <ca21490a45e63c4e5c4224e454ad4ad5dba58f5f.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0012.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::25) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|BN9PR11MB5292:EE_
X-MS-Office365-Filtering-Correlation-Id: c60d5858-9d9c-40fe-a78b-08dd35bc1506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjMvenJYY0xMMll4STE1elJNYWV3djBJUlZIejlEaXI3UVRvNTdqUU9QelRr?=
 =?utf-8?B?TUhMOEJlQzYzWmM2VC82ZlRJbm5MbnB0LzlkYzJneko1b3RXL1pyU0wrMmhR?=
 =?utf-8?B?R2lJZ2dUV0RKTklaMUMxaDUrTVlCZUpadGo3MnBpWmlPZTB3TFZwSExaNCsr?=
 =?utf-8?B?b2I5MXF1eHRhakZMVnN3dkJzeGJVb2pzOGx0cjNYb1ludmJJR1h4YnY0ZERm?=
 =?utf-8?B?RE9qbml6M3B4S1FBYnJLMnR2a3cxN1NZK2JWVk52WEhFL1F6aEtyaWNzZ2JE?=
 =?utf-8?B?Y2o1RGphZlByaGdMVWRDWXU0MkU2Z1dJcjJXNXg2a09FNmNJM2dXWnR4Q1dK?=
 =?utf-8?B?N0RRNjNDWFE2WVQzRkhuS2QyUnh6MTVNZTBTMHlGSk9aT0hqcDRzY0JLcUdk?=
 =?utf-8?B?a1JzWnk3amhJQ2ZjektFdCt4cHFYcHUxbVJSZ09JNnl4c0hPdlBWZHdtVUox?=
 =?utf-8?B?czdSRXZVdjgySzFtWi9MK1ZQTzJZUmVhWm05VHZPS2lNTVlzWmRaL0wwUXVa?=
 =?utf-8?B?ZlpXRlFKbmdMQUkxQk9YRGRDTVdsTGloU1hOaWp2UGFrWHZJeENPWFNwRkNq?=
 =?utf-8?B?QWl1OGIzT3VqcEFIOGJ2SGYrNWNydUUyQlJDeE1iV2FiU0pNZ3JGZFJCTlgv?=
 =?utf-8?B?WndWSHRjSVVMcThGZWhvYmJpNzVXRVErZmNESzlrWFZzcXh1d0Vma1Mwb1Ux?=
 =?utf-8?B?TlEzQzZzd0t1c3FvVW1OdksrU1JRSm44WjFuaHBsK05WY04zUk5KY2JRTUpO?=
 =?utf-8?B?OHJ0QVZBd1h2eXQyTmxja3BySDBZTVFIYmRoSnNtNUVzbkM4LzB6M0Y2Q0dw?=
 =?utf-8?B?TVd2ZmhpaFlTb1BNUXhXSkdVSFNDL24yeTZkQW5FWXIvL2pjR3ZIUUN0S0xj?=
 =?utf-8?B?NTJCVkJub3Jiakl1bkhkUkdIRDB3cEJvaWp5OCtYYTVnMGxDb25KcitDYU4x?=
 =?utf-8?B?RVM0QWNZM3VOcUhYZE1FSXl0YVdCUlVKK1VkbGZ1R3FYcU82V2JQT0NoTllC?=
 =?utf-8?B?MVVMeEtPNmdXaDM0UklXcFc3aGpnRXNaWllzQ0N1TmxEZlBGRmcwKzI5aThC?=
 =?utf-8?B?dWNUM05yQ21mQWg1QlhRVnhUbG5OK2IzdWU0RStPZm5LemQrUDNxWWZwMmFy?=
 =?utf-8?B?WEdoSFluMnRBL29nU1ZNdDRGTk9MdjNSaFhhL24yMlA4cTU1U2tUSFpkUHQ0?=
 =?utf-8?B?eHphaFhZQSsxVDdBbGhnOUNVMUlPRmxkU0plVTlDU1I0TGZIdGJNbXlCeW5G?=
 =?utf-8?B?TzZJMXlyTzBkT2o0QnBRamR2OVV1bUd2RHcwSG04ak4wYzVLSXZidmo0b052?=
 =?utf-8?B?SzF4a0ZENzRobUJLM0NPenpyR2ladVZCODRieHVERWdrMytMUEtBc29QbDVD?=
 =?utf-8?B?VllCWUZMOHVNc3JpU01vYXZZZTdhVVY0K05kRHhyZ1FRaTRnei9KaE5scDhi?=
 =?utf-8?B?NmRIRnJDVjBGOHpBanJrVUpWN2g0cnF4WVBBTDZjZHNHMkRLQkEvK2pTNi90?=
 =?utf-8?B?eFl5dThzdVFBcitzRTk3Z2JvK2NFMmdBZUJQMnNYVGdXMy95akthZmFEOFJL?=
 =?utf-8?B?dnVkR0FZUTdNdlhMcDFRcGt5TVNscUZrR3lEcEN6N2RQa0hSejJJMWtpSXRm?=
 =?utf-8?B?TlE4KzlIMXYzRDdPbm1oS2lIc1N2NmhBaUQ1aGdpdmw4NDlEcnlJZHN2Q3NK?=
 =?utf-8?B?ZVRxVUtubklWeXVuVFlwTDIrSzF2TWxTWktVZUJFRTN3YnFBclhaZENha3hz?=
 =?utf-8?B?RXZuNk9jczI5K1g4U0VsSkQySXpSNFNNOUt5blJYelh2TkY0ZW1UODNEQWRE?=
 =?utf-8?B?T1piT25ucmhady9zcDlRQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkwzKzBvSmltSUtKb09VWXg1ajIwTWw5MFRWZXJqeWowd1JMU3AyZXZ1cUVD?=
 =?utf-8?B?RVRBUE1Ba2Nia20vWEdOMjBYUXZoQkJjd0VyNGRJWEZRTGVuWUt4bE9JVXpL?=
 =?utf-8?B?SkNVNkV0a1BMSW1GZThvRytRc1RYTVV4V3piV2hZSnE2SDFPQWlncC9QL3hn?=
 =?utf-8?B?b1MvZW50dkdXSWE5Y0F3Z0dxbnp3dkk5V0FubVdNMWwwMWZSRlU2cDArNUZO?=
 =?utf-8?B?eDFRSHhVYkN0V3pTTHlSczVTT0JkSTM1RExodUttRWJoODcyZHZQanZUcU9j?=
 =?utf-8?B?WFdmeHNxY0hTbFJTeDNma2pSS2pzd2l4OUJidENrN09hVWV2cVM0UlpzRHJi?=
 =?utf-8?B?UEJnKzNKZEZod3JZa2lDS1hLb1Y3RXZnRmFGQlpuSm45TE16R2JidEx6bExi?=
 =?utf-8?B?ckFXaUgwaFhqNklwb1k5eE9LWlV0RGtod0tINWdlNDFHMjdjU2VoenRLSVpv?=
 =?utf-8?B?ODBjQ2dPTGlNVkVOdjQxRGY3KzBNUm9NcnZCK1p1bDBQeXRWcDBra2puNVdJ?=
 =?utf-8?B?eWI1TUF1NWRiNE1QdnNWb3VJUkV4aS8yTUhOeU9pTVJIZHhsVDhweWpjZlZB?=
 =?utf-8?B?VWd3dXFld3dud05MaHZRK3VLeUlaaHVobWpWdVJ0R2ZBUm1DK2lvWUdvVWla?=
 =?utf-8?B?UDZSYWNKN2pqdnJLa20wNjVaK2lyVFgvVlduNnlNVkNFOGpscHhKT1REODVt?=
 =?utf-8?B?Q3dQcHE3d0R0V1U2SHR2YmVWRHkzazlqY3FkK2piZXFnL2JNbjFLMHBQRXJL?=
 =?utf-8?B?UEJxWUovN0NiZEszeU5mM293MWRUTGY5eEs2SWJxZndmVkIwS2FJWnNxWDNq?=
 =?utf-8?B?OWxYQVpPSU4rMjhGaTZPRHVjd1NIbjhqd1FmSnVYY2RFL3ltYVQrQWd4cndD?=
 =?utf-8?B?d2kzdkhpTlkzTDRMQ3lwckNSbHhuT0pUcEV1WmtFK0ZDOWUxOUtZSFhKUStS?=
 =?utf-8?B?OUFycnNOUHRnSVc0a0hJVmIxamQwbE1Hc3A2bjJBekpKVTZtVzFSYnlTM3l2?=
 =?utf-8?B?QXp0cDdtaTBuTSt2SlZwdlA1YU80cXZ6akljNUlmc1hXUUx2Z1BzRVpsUlYv?=
 =?utf-8?B?Yll6T2VPOUpEd0QrU0VoR1lJUnZrM1VGUFh2dXVkRngzUDV4K2l5OHpXbUxw?=
 =?utf-8?B?c3A1TEVPSVRoRnVvbkVQMXdrdzBEcUdneE1LWC9kU0FWQ29wM2lWa3dlRXRa?=
 =?utf-8?B?SkswZTdjZWxXRU9hN25TTlZIU0pKNDhITlBzQ21BME9IT1ZrbTc2S05KSUhr?=
 =?utf-8?B?aVZwaDNka2F4bHM2SldLaEczaUI0UzJ2Y3JDZEJnQ0hJMlAyclF2YUVrNXEv?=
 =?utf-8?B?b2x5enVWRHVSN2g2VlhmaFFJQWorRjBRaEJuQjJRUW13WFZZbWhaY1FrWGxV?=
 =?utf-8?B?aXBST0pwMmVUZVdSNmlUZ05jaUdLVTFvY05CQjNtL1ZqVXAxd01uSEZOWXl2?=
 =?utf-8?B?OXdUd0FhcURWTDdNRGZ5a2d5TmdtYWdZNW5pcWRhYk91ekhQTHA4VnpHVHg4?=
 =?utf-8?B?OFBsOTRhY2RhSDZRaEpQeVZqNjBjYWZjNG9ZWEw1K0d5dE5KWm9DL2xBS3lP?=
 =?utf-8?B?djcvRnZEMFR5ZzRONUEycVZuMHhuNFpzSFA4UkRFS2xSM0wyRFQ3bklYYlpX?=
 =?utf-8?B?UmFMZGZKeHNXRjZEd2FwbDJsbE5XTG10bEJSYXE1TDFQejI1ak10d0VDbzRs?=
 =?utf-8?B?VGdmMm44SDZwejEzeGVQUjB1TVp2a3NhMXY0NTZpcHlNNFkvZGNUY1FFZ1h3?=
 =?utf-8?B?TVhyVjR2a1Q5dm5EbDRHRFVQc3BRWXYwaVJ3RW55OTh2N05tM1hHUnJWYjhC?=
 =?utf-8?B?TlhNeVFSc1ZZK0JQVTNIYkZtc2VjQk5Ob2p3ZlBtZnREMEQ0MFc2TnhZSmE0?=
 =?utf-8?B?RFlRRmZQbHNTNVM2WTZ6Y1EzdDVMVGIzSS9aK2NtZDlwT0YzTWlGYXd0MFJh?=
 =?utf-8?B?aDFWSDNGYnRwWXNHNTdOZHNROVdnUkRwWlplWXgwb0R4YXpJcUhrY1prMTZQ?=
 =?utf-8?B?dzdvOThZSUt5MWFjSk9tWXdmV3FHNGg4OTFBeTk3R2VzblowbnRzVEl4TXRl?=
 =?utf-8?B?M05RcU4yUVUwSzBVS1c2bUpCRW5MdTZPRStUTkVFVER5TEdKaXgwS0hQVjIy?=
 =?utf-8?B?REZZL0FWTm9HODdONk1IK3lrbnFsejFsUWRJQTFlY0xLbkhiaURHV3ZodTJs?=
 =?utf-8?Q?L6LKGpqPt5UPfZdrL5HtY5s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c60d5858-9d9c-40fe-a78b-08dd35bc1506
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 23:26:48.0845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0xqdxl9fy0v1w50mUjwqxooA77HDFscf315Yg7XunZYdzm4bsQx/2YULP1luXSjPuTbQhYoeMAGGnwko2H9p2pqdezgTSW8AbsZd4RpAZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5292
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


On 1/14/25 18:25, Teres Alexis, Alan Previn wrote:
> Since this has already received RB on the kernel side, I provide my RB here on condition that if anything changes on
> kernel side in coming days, we update this (ofc need to update anyway for reference kernel merge point).
>
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
>
> As a side question (not blocking) i notice the UAPI documentation for DRM_XE_VM_BIND_FLAG_CHECK_PXP doesn't mention if
> the bind will still stick after a successful prior bind if a pxp teardown (key update) were to occur in future. (which i
> am guessing it would? - i.e. once bind, it is forever bound?).

Yes. The only impact is that any new binds will be rejected, no impact 
on existing ones.

Daniele

>
>
> On Wed, 2024-12-11 at 16:18 -0800, Daniele Ceraolo Spurio wrote:
>> Based on the kernel series still in review:
>> https://patchwork.freedesktop.org/series/136052/
>>
>> DO NOT MERGE: will respin with the final version once the kernel side is
>> merged
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   include/drm-uapi/xe_drm.h | 94 ++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 93 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
>> index 56163eb91..5b288af1f 100644
>> --- a/include/drm-uapi/xe_drm.h
>> +++ b/include/drm-uapi/xe_drm.h
>> @@ -629,6 +629,39 @@ struct drm_xe_query_uc_fw_version {
>>          __u64 reserved;
>>   };
>>   
>> +/**
>> + * struct drm_xe_query_pxp_status - query if PXP is ready
>> + *
>> + * If PXP is enabled and no fatal error as occurred, the status will be set to
>> + * one of the following values:
>> + * 0: PXP init still in progress
>> + * 1: PXP init complete
>> + *
>> + * If PXP is not enabled or something has gone wrong, the query will be failed
>> + * with one of the following error codes:
>> + * -ENODEV: PXP not supported or disabled;
>> + * -EIO: fatal error occurred during init, so PXP will never be enabled;
>> + * -EINVAL: incorrect value provided as part of the query;
>> + * -EFAULT: error copying the memory between kernel and userspace.
>> + *
>> + * The status can only be 0 in the first few seconds after driver load. If
>> + * everything works as expected, the status will transition to init complete in
>> + * less than 1 second, while in case of errors the driver might take longer to
>> + * start returning an error code, but it should still take less than 10 seconds.
>> + *
>> + * The supported session type bitmask is based on the values in
>> + * enum drm_xe_pxp_session_type. TYPE_NONE is always supported and therefore
>> + * is not reported in the bitmask.
>> + *
>> + */
>> +struct drm_xe_query_pxp_status {
>> +       /** @status: current PXP status */
>> +       __u32 status;
>> +
>> +       /** @supported_session_types: bitmask of supported PXP session types */
>> +       __u32 supported_session_types;
>> +};
>> +
>>   /**
>>    * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
>>    * structure to query device information
>> @@ -648,6 +681,7 @@ struct drm_xe_query_uc_fw_version {
>>    *    attributes.
>>    *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
>>    *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
>> + *  - %DRM_XE_DEVICE_QUERY_PXP_STATUS
>>    *
>>    * If size is set to 0, the driver fills it with the required size for
>>    * the requested type of data to query. If size is equal to the required
>> @@ -700,6 +734,7 @@ struct drm_xe_device_query {
>>   #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES      6
>>   #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION      7
>>   #define DRM_XE_DEVICE_QUERY_OA_UNITS           8
>> +#define DRM_XE_DEVICE_QUERY_PXP_STATUS         9
>>          /** @query: The type of data to query */
>>          __u32 query;
>>   
>> @@ -743,8 +778,23 @@ struct drm_xe_device_query {
>>    *  - %DRM_XE_GEM_CPU_CACHING_WC - Allocate the pages as write-combined. This
>>    *    is uncached. Scanout surfaces should likely use this. All objects
>>    *    that can be placed in VRAM must use this.
>> + *
>> + * This ioctl supports setting the following properties via the
>> + * %DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY extension, which uses the
>> + * generic @drm_xe_ext_set_property struct:
>> + *
>> + *  - %DRM_XE_GEM_CREATE_SET_PROPERTY_PXP_TYPE - set the type of PXP session
>> + *    this object will be used with. Valid values are listed in enum
>> + *    drm_xe_pxp_session_type. %DRM_XE_PXP_TYPE_NONE is the default behavior, so
>> + *    there is no need to explicitly set that. Objects used with session of type
>> + *    %DRM_XE_PXP_TYPE_HWDRM will be marked as invalid if a PXP invalidation
>> + *    event occurs after their creation. Attempting to flip an invalid object
>> + *    will cause a black frame to be displayed instead. Submissions with invalid
>> + *    objects mapped in the VM will be rejected.
>>    */
>>   struct drm_xe_gem_create {
>> +#define DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY       0
>> +#define   DRM_XE_GEM_CREATE_SET_PROPERTY_PXP_TYPE      0
>>          /** @extensions: Pointer to the first extension struct, if any */
>>          __u64 extensions;
>>   
>> @@ -906,6 +956,9 @@ struct drm_xe_vm_destroy {
>>    *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
>>    *    handle MBZ, and the BO offset MBZ. This flag is intended to
>>    *    implement VK sparse bindings.
>> + *  - %DRM_XE_VM_BIND_FLAG_CHECK_PXP - If the object is encrypted via PXP,
>> + *    reject the binding if the encryption key is no longer valid. This
>> + *    flag has no effect on BOs that are not marked as using PXP.
>>    */
>>   struct drm_xe_vm_bind_op {
>>          /** @extensions: Pointer to the first extension struct, if any */
>> @@ -996,6 +1049,7 @@ struct drm_xe_vm_bind_op {
>>   #define DRM_XE_VM_BIND_FLAG_IMMEDIATE  (1 << 1)
>>   #define DRM_XE_VM_BIND_FLAG_NULL       (1 << 2)
>>   #define DRM_XE_VM_BIND_FLAG_DUMPABLE   (1 << 3)
>> +#define DRM_XE_VM_BIND_FLAG_CHECK_PXP  (1 << 4)
>>          /** @flags: Bind flags */
>>          __u32 flags;
>>   
>> @@ -1087,6 +1141,24 @@ struct drm_xe_vm_bind {
>>   /**
>>    * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
>>    *
>> + * This ioctl supports setting the following properties via the
>> + * %DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY extension, which uses the
>> + * generic @drm_xe_ext_set_property struct:
>> + *
>> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY - set the queue priority.
>> + *    CAP_SYS_NICE is required to set a value above normal.
>> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE - set the queue timeslice
>> + *    duration.
>> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE - set the type of PXP session
>> + *    this queue will be used with. Valid values are listed in enum
>> + *    drm_xe_pxp_session_type. %DRM_XE_PXP_TYPE_NONE is the default behavior, so
>> + *    there is no need to explicitly set that. When a queue of type
>> + *    %DRM_XE_PXP_TYPE_HWDRM is created, the PXP default HWDRM session
>> + *    (%XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if isn't already running.
>> + *    Given that going into a power-saving state kills PXP HWDRM sessions,
>> + *    runtime PM will be blocked while queues of this type are alive.
>> + *    All PXP queues will be killed if a PXP invalidation event occurs.
>> + *
>>    * The example below shows how to use @drm_xe_exec_queue_create to create
>>    * a simple exec_queue (no parallel submission) of class
>>    * &DRM_XE_ENGINE_CLASS_RENDER.
>> @@ -1110,7 +1182,7 @@ struct drm_xe_exec_queue_create {
>>   #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
>>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY              0
>>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE             1
>> -
>> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE              2
>>          /** @extensions: Pointer to the first extension struct, if any */
>>          __u64 extensions;
>>   
>> @@ -1713,6 +1785,26 @@ struct drm_xe_oa_stream_info {
>>          __u64 reserved[3];
>>   };
>>   
>> +/**
>> + * enum drm_xe_pxp_session_type - Supported PXP session types.
>> + *
>> + * We currently only support HWDRM sessions, which are used for protected
>> + * content that ends up being displayed, but the HW supports multiple types, so
>> + * we might extend support in the future.
>> + */
>> +enum drm_xe_pxp_session_type {
>> +       /** @DRM_XE_PXP_TYPE_NONE: PXP not used */
>> +       DRM_XE_PXP_TYPE_NONE = 0,
>> +       /**
>> +        * @DRM_XE_PXP_TYPE_HWDRM: HWDRM sessions are used for content that ends
>> +        * up on the display.
>> +        */
>> +       DRM_XE_PXP_TYPE_HWDRM = 1,
>> +};
>> +
>> +/* ID of the protected content session managed by Xe when PXP is active */
>> +#define DRM_XE_PXP_HWDRM_DEFAULT_SESSION 0xf
>> +
>>   #if defined(__cplusplus)
>>   }
>>   #endif
