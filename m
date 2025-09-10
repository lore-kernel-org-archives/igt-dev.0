Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5E6CA0FED
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 04:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE7310E2AD;
	Wed, 10 Sep 2025 04:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bx9RJyE9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1D210E2AD
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 04:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757478875; x=1789014875;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5PLTeziPIHwuJItGGGW/eic2oN3N0Y9igeq61Qg7TUw=;
 b=bx9RJyE97I2QYF6bqc5vkixSSrRtSpmOGyaE/L851KCsWqrqqivx4+L/
 MS8Io+lpDWNdDnsNLv7uVRszxydMxti48w+GYyW+KAuhBizRVuFk9dcrI
 e30x+xIs/GUFhRtPPWQCed6uTGP79HdQGB2Ox9zxOXaFV3AuWMkP0ivbS
 Qy8Sxe1MjKsMZQo3Wvzno+INSdwfLKRmpYrA8+dJA6MCJeYFn2berXyOf
 nB4e0gMSQPTvO2QC0RQzCmu8caUvzkl+MW5/9QuYj9beR7kGdhquB4rlI
 Hi0J20DvdM/t9MxRDOTltNk3MVgdRqcTsf61Q46jZ7UNM+VT/pMmkyAoh Q==;
X-CSE-ConnectionGUID: VN7isLjuTIy14yDdNjkKpA==
X-CSE-MsgGUID: DzlnLbsVRAmCidQ/K6nKqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="58817734"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="58817734"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 21:34:35 -0700
X-CSE-ConnectionGUID: NIH3B6dXTZqA1lQL/RF3RA==
X-CSE-MsgGUID: CZyEuXP3RMaIEjidiShYBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="210409909"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 21:34:34 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 21:34:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 21:34:33 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 21:34:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZ/Yu/DIfgndlby1P1RG4gk9HpaEbMdio527htpGuWTdD/2Zfe5f0v3oxvTISWTG4pkoWYaO5hW9PXLI/j9E0nAwoBnKW7RgHKAOashgxwu/n+VHPoZMdPgrNnvbcXOjQamspOQk/+g5hYhGEx/qaOeDjNs/w5xmG/BaAM2FU4zfO9xjX0YjstlwAexbAqqxsl+VKa2XGhZHVzh5LdP6vMYIzsM3quUQY9aHIaEHv5jc4VUqW/byi2ytn84gQXaZ2O6Zt54G7NrArlIQfmTdMQf5GafEZ5wKjdytkvMjkRT7XAYnyC7T4gHEKSS8/22t9DlgpCMOM10p7PKILp5FcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXMUBH0xeXgtJtV40jQ2k1HSdX3CdqyoZVXYu0hqvAM=;
 b=l3v4FAmh6xa+mrcikZtTY0GhmLraXuOKI4EJizjY4Atp3wZUtMzCNaXUUCTTFkqACkDlQu2VPnD9RaUhZjljVt6oKhbKmq69XjZ5p8EYfwFpPK/WnmzdUtU3QKP0MZtGMwfpQobvcrLWKgrwKRo5/b2JwFcc0rN5HmK7DURclRFVFcfznQ8ThjaZ974cVi8sBzkmvRQmhLzJl7B/19Vz+/3eT28VA8PtQ9D3Ff4GoWtmtjeh7iM48RYsyFbodAEiNi01JD9p8VHA2juL3OSc1chYyrNLv+IFP3vjp1CbmYCaSVlYWe4+GmkTzDMWoApl59GeRbCK2bsuFIcu8gtaig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 SA2PR11MB4827.namprd11.prod.outlook.com (2603:10b6:806:11f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 04:34:26 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%3]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 04:34:26 +0000
Message-ID: <4c36f7b1-6765-4cd3-8b7a-a1fb77e4a8c5@intel.com>
Date: Wed, 10 Sep 2025 10:04:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v4 4/4] tests/intel/kms_dsc: Add force dsc and
 joiner test cases
To: <igt-dev@lists.freedesktop.org>
References: <20250905210816.319104-1-swati2.sharma@intel.com>
 <20250905210816.319104-5-swati2.sharma@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250905210816.319104-5-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::8) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|SA2PR11MB4827:EE_
X-MS-Office365-Filtering-Correlation-Id: 995edc2f-eb3c-420f-ecde-08ddf02352cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDYvUXV5bFZPOGplTGtMbUZrZzZxckJRdUtkVlNLOTMvdVRDeUlyZTNFTDFz?=
 =?utf-8?B?OTZBU05xcWxrWmRsdnFUNGN1TzA4Ukp6ZGttZ0FFRzUwSE1vdWVlbTBoV1pF?=
 =?utf-8?B?Nld2ckhjNHRHVHNvUnhHM1YyWjYzZVhXVy9PTElGcjBxVHlvb3IwUkZTb2pY?=
 =?utf-8?B?YVRkR2dNUzFDVlpjY29hUTJNVnh3S1BKdk5iQ2FJSnJZUzhvcnplN215VUpR?=
 =?utf-8?B?NmpjVmhvMnpEcmtOcm1GTCsvTkpjam5wZEhoR2dKZStnZFpNWm02VHpaa0gv?=
 =?utf-8?B?emxCanFrYmpMb3hVOWk0OXZWMXFZUGtDYXhwZFpaajZoUGJRUE9RZmw0Kysw?=
 =?utf-8?B?cm1HRzV4dC82d29MaTE5NVJwcEdBQ2Q5VjdENVNqTWF3cDY4ZU9GNWZmOUtW?=
 =?utf-8?B?NWNkeDBVYkdqUUZVQkw3NndIejZBVk1id25uM0hvcUFyWXlPWkRoSXJNdy9V?=
 =?utf-8?B?a2xYdWl4L3l3SDBmOG1PTEJIRmp1bDlkeWx0eDI3MkZOUmxHMGNFZDdIZWxQ?=
 =?utf-8?B?Q01uaXAveTg1TWd5REsrOStEdTBHSmRxODZlYU5UazVkUWZxeUdNd21DdlBs?=
 =?utf-8?B?b2tHUjRmSHpwUHVBT2Z0YzBQLzFsMGVoL3Rndy9qRE1WTE1hSFliaks3R3ZE?=
 =?utf-8?B?NmFWaFJMaCs5eHEwVEVrR2Q1Zmx1Ni9vZjRYNVRoaXRrNnpWck9Md04yTEM4?=
 =?utf-8?B?UWh5ejVUcEVwYjFxdnZuN2w1aTA0eEtSNlpQV1FnWml6bENkK09hQ21mQS9K?=
 =?utf-8?B?RXUyUDJ6NU5yUGVPZTZ2ZFhsdlJyL2dud0NGZE1UVFY1ZHBET2swd2xncXpN?=
 =?utf-8?B?V3JXNGhaNEJoYnFNRVgwTkMyUndQUHFsOHZzSGxHeUdVSU5aeUNSdUg5dVY3?=
 =?utf-8?B?bWY1NENqUDlrS0Z3UlNVSVMzU3JFZCtKOEE2SHg0MFNGbTlnaGRRbUFncG1B?=
 =?utf-8?B?T3pLMkNSays1ckhaNFQzRTJtenM4dHhZRis4L0hIR2hVZ0hJdnlqT3k5c0lS?=
 =?utf-8?B?NTRDN1NPZTZKbzNPc3A3b3Q1SEdMb1BSYU03Y1ZhbTkxbVJzKzE0RzFIbDlG?=
 =?utf-8?B?UnBUY1NScE50VXlKZDdjWE5zdjI1endTS3BjVkxiQjlwT1I2bUVHeUtuWkFj?=
 =?utf-8?B?RWtncU1sQ0dqKzFRdVdqbDl4Rk9aRDdXdnNpdTVNVzlrT2I3a1gzcDdxRVVn?=
 =?utf-8?B?RTdpZGVNbzlyT0p1Vis0Y251MDFIU1BuN3VCRXNNWHRCWVFOVWVRZTdKZXpn?=
 =?utf-8?B?V042YmdnMXJhdEVOTy83WVhmTU4wQXhmVlROa0g3WFNaY0s2YStGancwdW9a?=
 =?utf-8?B?MU8xd0RrNnhhdzNnSXc5Zk1FZyswQ2NITE5uSWs2amwxRzJBRXlaM2FoU1NF?=
 =?utf-8?B?K2lINmMzOWdqUGt4V1VJaTRUTnFrL2FJMkd4RnRoT2lIa2dueTM0eURnZVJ1?=
 =?utf-8?B?dzdxeWxnMVdmT1Jld0Y4b3I5QlBPMUNtOHpBeTFEQWtpYnBRbGxvTVZGakFh?=
 =?utf-8?B?RzlCT3Vhb2lxRzg3aHkvdzN5Q0svT08rM1JQY0xvLzFlT001Wk1Jejd2MkFX?=
 =?utf-8?B?UFFMbGtiMi9CN1ZLc25NK3hCZ2xOSW5pSWtKU281NUVkdTdhNEg2L3FrdG5S?=
 =?utf-8?B?eFQyMXpSSVN3b2hlMEt3UklERFBqVTB5SEhxdllLam5SRHVwT3E1WVNWcmVW?=
 =?utf-8?B?TVgzOFF2UXB0amJ4a2VYSVIvekFqckYxQ28wbkJkcThoL1pzSFVFSGlsMWVq?=
 =?utf-8?B?N0h1aW9DNzdyTHhpdlZuSDVMSkhwMGRvNFdQcWtONm1yWXFpeVVzNzYraGQv?=
 =?utf-8?B?UUNSWW16bUJFaFUxWUg4U3NVdjgveXR0SjJUVklRYjRFVXJ0RENCb0hqWmpJ?=
 =?utf-8?B?YnJ6K2tJbmVhWW5vZ0VXSHJZc1IycTlqelJZQXRLeWt6QzhHU241aGVxZi9X?=
 =?utf-8?Q?csde1hi1qsM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1BtMWRlMG1MUFBHWFRuNk54K1E0R0l2RStkZ2h6a053cjh2aTFDY1FQVEFu?=
 =?utf-8?B?STFvVURWOER1ZjUrSjVDakZ1KzZueU16QTh6L1R6ZEdVbXRQMUdoeWZ3S2JK?=
 =?utf-8?B?aDZUSkQyNk9mRjJyRTdJZXhXOG9JUExIeVltamhyY21BZlEwRHVaekxIUWNS?=
 =?utf-8?B?aEJjcisraURmR1dyUU9NcFdVcVpVc3N2RG90a1RiN1FEb3VIQlk3UTVSMEg1?=
 =?utf-8?B?QUh5K0Q3QkduWEFucVRjZU1OLzluRkxvRXl4TzBhT0ZSZDlITlZwdzBMYWRF?=
 =?utf-8?B?aEpVYjZJcURsOWc0UThGei9ERmplVEREQllURXk0UExhVzdocVgyS0JoSm4y?=
 =?utf-8?B?M1JCSmlBUnE3YkFuUlVESHd3MnRYSkxMcDZRQTI2UllkVzd3OHJ3K1dBWXhH?=
 =?utf-8?B?aXl3ekg2am1kdHA4d0dJVENVNE5FaDZHcXlmeFkvMGQrTTdXcVZQNjlYdlF0?=
 =?utf-8?B?NGhxSFQ1RVRTY1hScWl5Mjcza2R0L1hscVc1WGdYMVMvUGxIZWVGcjN6N3Ev?=
 =?utf-8?B?VWVxTmVSWXFjUkVGVzNGMlg3VWNXemZOeVZzRFUxV0QzMW4wMnZKVTlpQ2lm?=
 =?utf-8?B?VU5MVW9KckdjRDY0UWJLWm9TOTBKM3pmRGJuY29JalJ1S3R6SEVDQWtUWXdy?=
 =?utf-8?B?YU5taG10YnB4MWgramt1d2ZpbEdOazhkZmhOR3UxMXhQeVNmZjJWUTdhSDUv?=
 =?utf-8?B?R2p2akcyeTlqeXdEc05URnBVKzFYUVhadFB0RmlSQWc2WnBkc2dwNGN4WG5l?=
 =?utf-8?B?cVVCaFRzeWVmaDRmZXQ2YVRXY3JQcHBod0MrTVl0bU82ZEd2ZWgvNVdkMlhj?=
 =?utf-8?B?dmdadEVSRjg1bFdXaCtqOTErcnNaSzFFRy9YNDIvUEJ5YTFmRzVOUWZxR0Ux?=
 =?utf-8?B?UzV4bmVSYm1QSi81N2VUOW43N2hwM0grNlVXY0tjTzdEMy9FMTdRQmlRUUtS?=
 =?utf-8?B?T2gweHB4MWZBclRHbFhmYVJwZTk3VVc2bGxVVG5OUVZoUkN6MGV3OEV5VFZw?=
 =?utf-8?B?UkpZTkkvaVorMnhadGJ1aGdESW9yeElqRVdKNDNDMGZkbnVSQW1qWWpDd0lK?=
 =?utf-8?B?T1VSdUZOZjdESDJBVTNWazB6TytaUWhvNzZ3Z3hScEcxUTgydzFSNFBid3hw?=
 =?utf-8?B?bTlwd2tlV0srR2IvNnc0dzU1dldaZzlmak4xOGZ6SkEwSktHd3B4dlpsbDRF?=
 =?utf-8?B?UnZ0QWY0VXMrQWd5elBKL1ZiaStpYytHTzVmdnpxRUlnZGcrOXZmSVFQUElB?=
 =?utf-8?B?MHlWbHBJb1FFUis3VFRWTVBQc05DL0FPUVN4czdxWVhBdHlnRWZ1S1JaVVl2?=
 =?utf-8?B?M2Myc2FRK3l5TnhDMDd5cHJEcGpaUkNLVXN1ZE1VVDJ0YUlvVGlLanBmQUo0?=
 =?utf-8?B?RFZJOGxwSTVPZ25YYWJqbGZzeldFR21DQ2pETVRjdit2L2pLbWtDaVJkd3dV?=
 =?utf-8?B?ekt0MklrcjhSTGJieTg3MXVNWUpDMDNVOFVsZGRpRzhWNktXWTlMSFVBcVo2?=
 =?utf-8?B?bmxsR2JsMFNnY2JjTGJzdUdhbWtIQlhiQytQcXI4S01NMWV2Y1pkM01sZnN6?=
 =?utf-8?B?K2JHZHJPOWxkYjdkZ0JWcFNwa0FkcGNJcHVJNFQzSG1mN1JDWWhXNERWNFpl?=
 =?utf-8?B?RitoNnZIcjBFWXg5YjhXSnQ0VTFzVTY2NTYzVXdxSGQrY2NZSDFxdjJ2RVQ0?=
 =?utf-8?B?MmRsZDhmOXEyYTRCdmUzRG9uRllCYm5LTkFXdUNVQVlLSk53OEU0Mmt2OFpR?=
 =?utf-8?B?T3RwWWgwU21QNG1vbnJ1N1N3eWNOZHZicWFMNnEwOVU5Sy9oeUVKaXFUbUJv?=
 =?utf-8?B?Q0EzTmprdWt0eVJCV3dpSlRVSllqYmx4VUMzL1Q0WlVJWktqdm5wQ2lWOTd2?=
 =?utf-8?B?VkgzOGdxeWFSc25HVG1xbkt2alN4RnVSM2xzL3pvR3JndWV0V1ROZXN6WUNu?=
 =?utf-8?B?djFPMTkvSkwxeVp0MmJ6RXlHdEIwWTM0ZFpUL1k2RGxZN3hvNVN1T1dpNTFJ?=
 =?utf-8?B?cmlzYXc4TXdleXQzeHl1R05iZC9pdUN3alRGODFKanpHQWVTaVBBSzRxRmln?=
 =?utf-8?B?bDhVbTNlc2VraTdKTmIrSzljdWIwNTlZK1hhMzFrU3RvM0pWcyszcEFpclR4?=
 =?utf-8?B?Wis5Skx1SlA5dzFJQkNtY2lqTVEvZitnOW9acFFiZEwxRExUcm5XbVh4Nlp2?=
 =?utf-8?Q?Ujl8jbR+B9f4YAcCC1LfJkk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 995edc2f-eb3c-420f-ecde-08ddf02352cc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 04:34:26.5919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YamRM9F8fA16+I/MFCd950NtCOBEERLUFM6ixZtCDPXGEgVntzlndcgYBtQ/Zw8cU0B5iVYxhEvgnE+uUPtA5Y+9J7/Q2TAvWuE6vToR7Fjb4KISZ5AkncJv416RdI9x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4827
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

Hi Swati,

On 06-09-2025 02:38, Swati Sharma wrote:
> Add test cases where we are validating force dsc and force
> joiner.
> 
> v2: -fix if() for ultra/big joiner (Ankit)
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_dsc.c | 198 +++++++++++++++++++++++++++---------------
>   1 file changed, 126 insertions(+), 72 deletions(-)
> 
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 7f0745370..5720167a4 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -55,7 +55,27 @@
>    * @with-output-formats-with-bpc: DSC with output formats with certain input BPC for the connector
>    * @fractional-bpp:               DSC with fractional bpp with default parameters
>    * @fractional-bpp-with-bpc:      DSC with fractional bpp with certain input BPC for the connector
> - */
> + *
> + * SUBTEST: dsc-%s-%s
> + * Description: Tests Display Stream Compression functionality if supported by a
> + *              connector by forcing %arg[1] and %arg[2] on all connectors that support it
> + *
> + * arg[1]:
> + *
> + * @basic:                        DSC with default parameters
> + * @with-bpc:                     DSC with certain input BPC for the connector
> + * @with-bpc-formats:             DSC with certain input BPC for the connector and diff formats
> + * @with-formats:                 DSC with default parameters and creating fb with diff formats
> + * @with-output-formats:          DSC with output formats
> + * @with-output-formats-with-bpc: DSC with output formats with certain input BPC for the connector
> + * @fractional-bpp:               DSC with fractional bpp with default parameters
> + * @fractional-bpp-with-bpc:      DSC with fractional bpp with certain input BPC for the connector
> + *
> + * arg[2]:
> + *
> + * @bigjoiner:			  big joiner
> + * @ultrajoiner:		  ultra joiner
> +*/
>   
>   IGT_TEST_DESCRIPTION("Test to validate display stream compression");
>   
> @@ -81,11 +101,13 @@ typedef struct {
>   	int disp_ver;
>   	enum pipe pipe;
>   	bool limited;
> +	int joined_pipes;
>   } data_t;
>   
>   static int output_format_list[] = {DSC_FORMAT_YCBCR420, DSC_FORMAT_YCBCR444};
>   static int format_list[] = {DRM_FORMAT_XYUV8888, DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB16161616F, DRM_FORMAT_YUYV};
>   static uint32_t bpc_list[] = {8, 10, 12};
> +static int joiner_tests[] = {JOINED_PIPES_DEFAULT, JOINED_PIPES_BIG_JOINER, JOINED_PIPES_ULTRA_JOINER};
>   
>   static inline void manual(const char *expected)
>   {
> @@ -135,6 +157,7 @@ static void update_display(data_t *data, uint32_t test_type)
>   	int current_bpc = 0;
>   	igt_plane_t *primary;
>   	drmModeModeInfo *mode;
> +	bool status;
>   	igt_output_t *output = data->output;
>   	igt_display_t *display = &data->display;
>   	drmModeConnector *connector = output->config.connector;
> @@ -147,6 +170,11 @@ static void update_display(data_t *data, uint32_t test_type)
>   	save_force_dsc_en(data->drm_fd, data->output);
>   	force_dsc_enable(data->drm_fd, data->output);
>   
> +	if (data->joined_pipes == JOINED_PIPES_BIG_JOINER || data->joined_pipes == JOINED_PIPES_ULTRA_JOINER) {
> +		status = kmstest_force_connector_joiner(data->drm_fd, connector, data->joined_pipes);
> +		igt_assert_f(status, "Failed to toggle force joiner\n");
> +	}
> +
>   	if (test_type & TEST_DSC_BPC) {
>   		igt_debug("Trying to set input BPC to %d\n", data->input_bpc);
>   		force_dsc_enable_bpc(data->drm_fd, data->output, data->input_bpc);
> @@ -246,17 +274,22 @@ reset:
>   
>   static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   		     unsigned int plane_format,
> -		     enum dsc_output_format output_format)
> +		     enum dsc_output_format output_format,
> +		     int joined_pipes)
>   {
>   	igt_display_t *display = &data->display;
>   	igt_output_t *output;
>   	enum pipe pipe;
> +	int n_pipes = 0;
>   	char name[3][LEN] = {
>   				{0},
>   				{0},
>   				{0},
>   			    };
>   
> +	for_each_pipe(display, pipe)
> +		n_pipes++;
> +
>   	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
>   
>   	for_each_pipe_with_valid_output(display, pipe, output) {
> @@ -265,6 +298,7 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   		data->input_bpc = bpc;
>   		data->output = output;
>   		data->pipe = pipe;
> +		data->joined_pipes = joined_pipes;
>   
>   		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
>   		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe))
> @@ -285,6 +319,22 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   						      data->drm_fd, data->output)))
>   			continue;
>   
> +		/*
> +		 * Skip invalid starting pipes:
> +		 * - Bigjoiner needs 2 consecutive pipes : skip last pipe (n_pipes - 1)
> +		 * - Ultrajoiner needs 4 consecutive pipes : skip last 3 pipes (data->pipe > n_pipes - 4)
> +		 */
> +		if ((joined_pipes == JOINED_PIPES_BIG_JOINER &&
> +		    (data->pipe == n_pipes - 1 ||
> +		     !check_dsc_joiner_constraints(data->drm_fd, data->output,
> +						   n_pipes, joined_pipes))) ||
> +		    (joined_pipes == JOINED_PIPES_ULTRA_JOINER &&
> +		    (data->pipe > n_pipes - 4 ||
> +		     !check_dsc_joiner_constraints(data->drm_fd, data->output,
> +						   n_pipes, joined_pipes)))) {
> +			continue;
> +		}
> +
>   		if (test_type & TEST_DSC_OUTPUT_FORMAT)
>   			snprintf(&name[0][0], LEN, "-%s", kmstest_dsc_output_format_str(data->output_format));
>   		if (test_type & TEST_DSC_FORMAT)
> @@ -334,85 +384,89 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		igt_require(is_dsc_supported_by_source(data.drm_fd));
>   	}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC on all connectors that support it "
> -		     "with default parameters");
> -	igt_subtest_with_dynamic("dsc-basic")
> -			test_dsc(&data, TEST_DSC_BASIC, DEFAULT_BPC,
> -				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
> -
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC on all connectors that support it "
> -		     "with default parameters and creating fb with diff formats");
> -	igt_subtest_with_dynamic("dsc-with-formats") {
> -		for (int k = 0; k < ARRAY_SIZE(format_list); k++)
> -			test_dsc(&data, TEST_DSC_FORMAT, DEFAULT_BPC,
> -				 format_list[k], DSC_FORMAT_RGB);
> -	}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC on all connectors that support it "
> -		     "with certain input BPC for the connector");
> -	igt_subtest_with_dynamic("dsc-with-bpc") {
> -		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> -			test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
> -				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
> -	}
> +	for (int i = 0; i < ARRAY_SIZE(joiner_tests) ; i++) {
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC on all connectors that support it "
> +			     "with default parameters");
> +		igt_subtest_with_dynamic_f("dsc-basic%s", igt_get_joined_pipes_name(joiner_tests[i])) {
Can this be dsc-basic-%s to be consistant with other tests here and same 
at other places where applicable?> +				test_dsc(&data, TEST_DSC_BASIC, 
DEFAULT_BPC,
> +					 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB, joiner_tests[i]);
> +		}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC on all connectors that support it "
> -		     "with certain input BPC for the connector with diff formats");
> -	igt_subtest_with_dynamic("dsc-with-bpc-formats") {
> -		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
> -			for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
> -				test_dsc(&data, TEST_DSC_BPC | TEST_DSC_FORMAT,
> -				bpc_list[j], format_list[k],
> -				DSC_FORMAT_RGB);
> -			}
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC on all connectors that support it "
> +			     "with default parameters and creating fb with diff formats");
> +		igt_subtest_with_dynamic_f("dsc-with-formats%s", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int k = 0; k < ARRAY_SIZE(format_list); k++)
> +				test_dsc(&data, TEST_DSC_FORMAT, DEFAULT_BPC,
> +					 format_list[k], DSC_FORMAT_RGB, joiner_tests[i]);
>   		}
> -	}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC and output format on all connectors "
> -		     "that support it");
> -	igt_subtest_with_dynamic("dsc-with-output-formats") {
> -		for (int k = 0; k < ARRAY_SIZE(output_format_list); k++)
> -			test_dsc(&data, TEST_DSC_OUTPUT_FORMAT, DEFAULT_BPC,
> -				 DRM_FORMAT_XRGB8888,
> -				 output_format_list[k]);
> -	}
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC on all connectors that support it "
> +			     "with certain input BPC for the connector");
> +		igt_subtest_with_dynamic_f("dsc-with-bpc%s", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> +				test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
> +					 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB, joiner_tests[i]);
> +		}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC and output format on all connectors "
> -		     "that support it with certain input BPC for the connector");
> -	igt_subtest_with_dynamic("dsc-with-output-formats-with-bpc") {
> -		for (int k = 0; k < ARRAY_SIZE(output_format_list); k++) {
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC on all connectors that support it "
> +			     "with certain input BPC for the connector with diff formats");
> +		igt_subtest_with_dynamic_f("dsc-with-bpc-formats%s", igt_get_joined_pipes_name(joiner_tests[i])) {
>   			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
> -				test_dsc(&data, TEST_DSC_OUTPUT_FORMAT | TEST_DSC_BPC,
> -					 bpc_list[j], DRM_FORMAT_XRGB8888,
> -					 output_format_list[k]);
> +				for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
> +					test_dsc(&data, TEST_DSC_BPC | TEST_DSC_FORMAT,
> +					bpc_list[j], format_list[k],
> +					DSC_FORMAT_RGB, joiner_tests[i]);
> +				}
>   			}
>   		}
> -	}
>   
> -	igt_describe("Tests fractional compressed bpp functionality if supported "
> -		     "by a connector by forcing fractional_bpp on all connectors that support it "
> -		     "with default parameter. While finding the optimum compressed bpp, driver will "
> -		     "skip over the compressed bpps with integer values. It will go ahead with DSC, "
> -		     "iff compressed bpp is fractional, failing in which, it will fail the commit.");
> -	igt_subtest_with_dynamic("dsc-fractional-bpp")
> -			test_dsc(&data, TEST_DSC_FRACTIONAL_BPP,
> -				 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
> -				 DSC_FORMAT_RGB);
> -
> -	igt_describe("Tests fractional compressed bpp functionality if supported "
> -		     "by a connector by forcing fractional_bpp on all connectors that support it "
> -		     "with certain input BPC for the connector.");
> -	igt_subtest_with_dynamic("dsc-fractional-bpp-with-bpc") {
> -		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> -			test_dsc(&data, TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
> -				 bpc_list[j], DRM_FORMAT_XRGB8888,
> -				 DSC_FORMAT_RGB);
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC and output format on all connectors "
> +			     "that support it");
> +		igt_subtest_with_dynamic_f("dsc-with-output-formats%s", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int k = 0; k < ARRAY_SIZE(output_format_list); k++)
> +				test_dsc(&data, TEST_DSC_OUTPUT_FORMAT, DEFAULT_BPC,
> +					 DRM_FORMAT_XRGB8888,
> +					 output_format_list[k], joiner_tests[i]);
> +		}
> +
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC and output format on all connectors "
> +			     "that support it with certain input BPC for the connector");
> +		igt_subtest_with_dynamic_f("dsc-with-output-formats-with-bpc%s", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int k = 0; k < ARRAY_SIZE(output_format_list); k++) {
> +				for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
> +					test_dsc(&data, TEST_DSC_OUTPUT_FORMAT | TEST_DSC_BPC,
> +						 bpc_list[j], DRM_FORMAT_XRGB8888,
> +						 output_format_list[k], joiner_tests[i]);
> +				}
> +			}
> +		}
> +
> +		igt_describe("Tests fractional compressed bpp functionality if supported "
> +			     "by a connector by forcing fractional_bpp on all connectors that support it "
> +			     "with default parameter. While finding the optimum compressed bpp, driver will "
> +			     "skip over the compressed bpps with integer values. It will go ahead with DSC, "
> +			     "iff compressed bpp is fractional, failing in which, it will fail the commit.");
> +		igt_subtest_with_dynamic_f("dsc-fractional-bpp%s", igt_get_joined_pipes_name(joiner_tests[i]))
> +				test_dsc(&data, TEST_DSC_FRACTIONAL_BPP,
> +					 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
> +					 DSC_FORMAT_RGB, joiner_tests[i]);
> +
> +		igt_describe("Tests fractional compressed bpp functionality if supported "
> +			     "by a connector by forcing fractional_bpp on all connectors that support it "
> +			     "with certain input BPC for the connector.");
> +		igt_subtest_with_dynamic_f("dsc-fractional-bpp-with-bpc%s", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> +				test_dsc(&data, TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
> +					 bpc_list[j], DRM_FORMAT_XRGB8888,
> +					 DSC_FORMAT_RGB, joiner_tests[i]);
> +			}
>   	}
>   
>   	igt_fixture {

