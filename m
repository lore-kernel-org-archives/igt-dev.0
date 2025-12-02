Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B71CFD376
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 09:23:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931A310E5C6;
	Tue,  2 Dec 2025 09:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NRwNO1Gx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC87310E5C6
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 09:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764667405; x=1796203405;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ENc64b7Z3SGKjg/7n3S0+A6I6DWOqCCiLgil7a+Eq08=;
 b=NRwNO1Gxia2PQWd6ygwWmnHPQsoNL7VZNfLDCvOZlM0Gc+xqfzD+43mr
 0NwujaO6PNcPDaFo62MuaruaIW8CTyi6dUDdSghQGMlX6ImgbPgzT53Sz
 rQVvLrIvBkA2RZj2YZqMnZlQ5qIWkC+sdSRbBBUV1n56sv4W24G+jL70Y
 isbDgkHOO7c2SLOk2Y4KNCoLuXB5BtDe10S5I87oK9tTdEoCqiuXmTdKN
 hDy4kUCfvRBJ5KS+jyitMWOfLwAKNdwkByXsTFWtqNOp+RQ69aLEqmbhT
 pDlzAl7cefd8yw7noVCdGUul4/jci1ftLNndxZcPGEbf7HytCsuxEmDMu A==;
X-CSE-ConnectionGUID: 9sYt2gl9QUizQ2FZV6hzDg==
X-CSE-MsgGUID: G4VNWTyGR/WJ3CzfnwIXJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="65629490"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="65629490"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 01:23:24 -0800
X-CSE-ConnectionGUID: PeiNxqghSU2E3dp25FtLYA==
X-CSE-MsgGUID: 274S7DtwR5usBNV1pTEXzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="194209984"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 01:23:24 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 01:23:23 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 01:23:23 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 01:23:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgq5uHq7jDq3iqIqttr2VzZKR1va5ITkpdcOU8hAYb3vkkczhquCtOFeMMIEE14iLO3QhFOWRj1iuwG9J0dII170jErbXRqTbc8g0tXE/9SGzuc4U/GWDtpImlz7JCtQ5DfIW3k/+ujDuV3wS+15keRyThFMvz1PyxB34y/k1CR8FSKKj0HY0Tak/0/pwEWFEoKzEXyovTo45I7O7Y9ReqHmZlHdWqxIKrN1f4BBIj6jkToEKhymUdJmhre+T0lHUMIXw8aXxq4zO9zzNwZFz3mxuuJX6TX+FbK9SlhyDUmcZLcLwGLrorJo+eqexklaWvDgA27RbC6GC0rPdYWVwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrRjVbShOW+6VOnZJIBWDWlXHpSu+ykDZwKuNmll1as=;
 b=K28uaTjLCuCP2OGvcajWUllesOkHxsrwlwT1eqNCvoQ17SrZdMVvLVjDrJaoxBkcqe9GUOXAL/nNdHMLMdfBNvnJkdjZRYEjP2x/moQls4hb3iRDI/umQNLGl7hM+VkY7xXqi/3jr9KyAbETtilC1ejtmv0Zr3aIb3ul1p/iFxeswRuw0tWXDYmmikYaZIFf6ycF3v6vpE7geMA2XHbKhOvlvlMTLrCY0ylT6PrMLyLF2PY4vVo1nO7aOEDyOybHQJ7oZzE77yfvyhaeQjRoCIKy+qpkEYXFhjUrXkMJ/j8SjnB+ZAf6nwu0xcJ0muBaafMCsGBregu9KpJOmRCHKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by BL4PR11MB8870.namprd11.prod.outlook.com (2603:10b6:208:5a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 09:23:21 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 09:23:20 +0000
Message-ID: <96d10d84-ecf2-4320-b028-89392aa4f976@intel.com>
Date: Tue, 2 Dec 2025 14:53:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] tests/intel/kms_pm_vrsr: Add test to validate VRSR
 with system suspend
To: "Samala, Pranay" <pranay.samala@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Poosa, Karthik" <karthik.poosa@intel.com>
References: <20251111180004.11865-1-mohammed.thasleem@intel.com>
 <20251111180004.11865-2-mohammed.thasleem@intel.com>
 <PH7PR11MB6053406D406468DAB8479E05E7C9A@PH7PR11MB6053.namprd11.prod.outlook.com>
 <PH7PR11MB60533A10CD2C21E8321A20D6E7C9A@PH7PR11MB6053.namprd11.prod.outlook.com>
 <PH0PR11MB4806C67F8B4156A537FB81B5E4D4A@PH0PR11MB4806.namprd11.prod.outlook.com>
 <PH7PR11MB605365FB561855E7F6A8E79DE7DBA@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <PH7PR11MB605365FB561855E7F6A8E79DE7DBA@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::20) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|BL4PR11MB8870:EE_
X-MS-Office365-Filtering-Correlation-Id: 73a0eb52-d614-47de-e435-08de31846f08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1dDWHJGVFVkbzBqZkxsTzdCbnQrekhrV0lPdXVPckdxMEZGK2kzR2IyVk9B?=
 =?utf-8?B?RHorWGJuMDRIMFhKUkt5Y3pSL2FCVXJ6djBoM1kxMGFRU2x5M2RjYjNOUU9j?=
 =?utf-8?B?cjNQc1o0UWhCUTZVcHlBY2V5Kyt3SVZSQkVJNkthVFFodHVwRm5YQkZFdUVR?=
 =?utf-8?B?Z1dNby9rVDhlR3NlQTY5a3lzbUJrUTVHOXlLQjBkaUJyYUpJekc5clVTWUFi?=
 =?utf-8?B?SnNqbDM2bzhSbWtDVkFWQnpPTmpEQTE0UFRwY1d2TzdTVS9xUC9vYW5VTVNv?=
 =?utf-8?B?SGZDcThuTDhtMWdWbEsrYXo3Q0V0OHRjTGpzNzlkSndhUXVFTENqSnNjanBT?=
 =?utf-8?B?YWphTzZWVGdnc0syZnJKamxaUzZqRkF4K2dMVFhCWmxWUFJzaEVVYjVrcFY5?=
 =?utf-8?B?VnhwM1VnaFZuT1FOUGQwbkpEcW8wbTVHQ2loSHRFMmxyYkNUU3NPUC83amVB?=
 =?utf-8?B?NnkydFdUVnd2eWpsSG5YdVBPTUZYMFpJWUF6SWwydVhWMzQvUkY3MDNrMk5E?=
 =?utf-8?B?UkdONVFkSkVvTUErU2hkN2lJMlNpQ2VLalhXUTBjRDUzUitxY0JyaDJaZVJS?=
 =?utf-8?B?OVcxVXU0SXdtS3FkaStEVDZieFRQTHBjZzdnbjBQM1ViTVNSM3VEcWpRZmhJ?=
 =?utf-8?B?ZnB3WEVCQVNZT3F1bmpRTkFwSGk1UzU2U3hUcVBmTFFNL2tFblpoTWNJQ08z?=
 =?utf-8?B?V3ZCSjY1NlFlaUt0czVxQWc3YjlVUGFERU9qam1RRlV0SCtzYldQdUVMc3ov?=
 =?utf-8?B?bitqV1RJUXp6a0NOUEI2VWNMMmQ2UGRPVEhzWTFZOWJwbExDbjE2UWNLVzdC?=
 =?utf-8?B?VmFKc0J3YlBHY3F5TS9SUjdJZy9qR3hMMEZCVkczVlpkejVGbXBFaVRaYUJl?=
 =?utf-8?B?S3ZPa3RLMzFFaktpSm5jb2ZnUXMyalh3MTl2TFZadExKb3dDTXM3Vkc1dkNG?=
 =?utf-8?B?SGNpZUJxZGhSMWxhR0lBTGhyY0dlbUhFMjNkQ1RTWUtGc0FvQ1l1TzhGSFAz?=
 =?utf-8?B?WEd6RmhudVZaQkRWUHNzMlFuY0R3MjdUT0Eva1g1UmhQdUZ0ak1uU1pSY0w4?=
 =?utf-8?B?MWlhcUcxUkZSUXMyTmVMQUt6WmkrcjlmNjh1d25sMmplUGw5NU9pbVNmY2hv?=
 =?utf-8?B?TzN1dzBqdGRGT0FxVW5oUElERjUzVU1vTGJpUDRDaDJiVFEvK00rTjNQa3Jp?=
 =?utf-8?B?WGtQNHJJZlR6UjRpR1pNZVI5dDh0allJclRJT04vaWNueHlhaXhrOEFNb1Vi?=
 =?utf-8?B?VmJtMlptb09nb0JMNUZseC9rQUFhQmxNditkYjNQaXZGNG15N0F1RCtkbFF0?=
 =?utf-8?B?TUtYeWl0OTAvc1BHakt5QUN4ZjJBZWpjUHAzTEpRNlUyMCtqWU12L2FMM1ZL?=
 =?utf-8?B?ZDB1YXlVR3pHaGpYVms4VTk1ZExLRVlhNWZQcTkzVUlpU2ZUclJUS2FNTE9q?=
 =?utf-8?B?cGJReTBtY1pLS2VnelVlL0J1MzFVNWh2bW0rSFQ5Z3VxMERZQXNlOC8zTU8v?=
 =?utf-8?B?UVZ6RVUrWmtaT3QxeEVOeTNJTjFRa0JKUndyZzcrSTZqb291bUVzektIdUUy?=
 =?utf-8?B?NS9TdVBHdkhjbGpDeHAyNUNQWU5wa0M1T3FnVHF2UzE1Q05iTUFLVGhSeEVG?=
 =?utf-8?B?TndwM0FsQ3lwN1V1N3JYTkY4azlOUWt1b0Zwdjdra0NPU1puMEIvNkFDRmZk?=
 =?utf-8?B?cCtwVUp6VlNhTDU4c0IrVXA3MnMxdDQvVXdYOTRNVXNHTkU2dExHNm4rOG9v?=
 =?utf-8?B?V1dQK3cvVkVBNTdmT1V4Y1VjVzhmVmtsUGp3UEQyMnRldzM2VXNuU1R1cGRm?=
 =?utf-8?B?b0ZxRHZmWTFNdjIvSmJPVVhTaWcyOFhRNmc0L3h0TW9veEJqaWgvblArM0F2?=
 =?utf-8?B?WkEvZG9ISU1tZWV0WEtVQzBDQ3FyZk0vRTFLR1dPNmFZVWs0K1VyQlJNRTVM?=
 =?utf-8?Q?DEecixE+d7ciOCB8hJBjWxGZU02Ssnc3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlNBUFZkK2syYS9NZzZ1cXNKSHcxemI5aHYwUjVpL3dpZDAybFZDRXhWYjJv?=
 =?utf-8?B?NzNiV0QxeDJRNFl1UEZ1eEJ2TlZZQnhuNUFvNkUyUnlQbkFKRlRmZy9IVXJp?=
 =?utf-8?B?M25Nd3BKbWp1bFF2WFhzc0NnRzV0eEsyWno5c1BvekZ3ZGNFYjJldTNDRzhu?=
 =?utf-8?B?azBGbGFMVGRNS0ZJZFAzQUV0M1VjaFUrM0ZjS3ROUENUaVo5QkZrYzhmMlAw?=
 =?utf-8?B?SUh3NVIxdlRiUFNSV2xWdDZzbWRBdThSWm1OVmQ3UDhlQWl0UzJlbEJVTDJ4?=
 =?utf-8?B?NkhKMHQ0bWlNakEwQXdQQWZTczVnTDVNbzhXZmNua2tMOEF0U1FXTlpsb3o2?=
 =?utf-8?B?Zm41ekRyejlod1JVZWhxclMxejFod2JqY0lDKzFoMDg4Q1F4dnMreW1mUjUx?=
 =?utf-8?B?eHY4bU9vWGNYUVp5d0lJV2c5TmxGU2lTUlBsVXpEdVpYSUVsaXh6SElzWWlS?=
 =?utf-8?B?TVJ3SkJ3VklPeWdGSzlyMTN0YlR6ZTc4UXlIbU5MN1hVOHp6TkFrQkkzVndv?=
 =?utf-8?B?Sld5alpFTkY5K0oyUWx5U3VkTnJoVk5udEoyQm1kcTMvWkZKc0E2amp6NlE2?=
 =?utf-8?B?cDg2R0VOeFZ1UEM2a2tWNVhSRjJhNjI4RzU2TGNDSnRWRWNZN3YrdEhzUUVP?=
 =?utf-8?B?UnQwSVM5Ym1iVVg4Z09ZQjNKb0JMRnN1TjBqTGZYblJUazBHcnI5S3I3WU1R?=
 =?utf-8?B?NXQ0TVo2b0RieW5XTUhJZG9CTy9BdVZ3YUlkS3lPUjNteGhqRmZYVGRpVlIz?=
 =?utf-8?B?RndNZmxwVG1uR0NHTVViK2Fyb2xXaVF1aUJwR1ZUUVcxS3Z4SWx4dUN1d2hY?=
 =?utf-8?B?eXNJVGJnQzVrUjFkZFlOVVRPRks1bHUxbGlVQmlyMERYLzF4RldBZkRqK2NO?=
 =?utf-8?B?emhrNk93VWpVUkFLS0NyakZIWHRpdkY2bGpOY2FuRG1CekxtTGhVdXdVaERq?=
 =?utf-8?B?d0todzU4QjRQd0tieXlVYWNpcitDeXowbEtMTHlqTVVGVVlwa0VsOVc4L1R2?=
 =?utf-8?B?akhGMGFmVE1uMEFyZDVSM3lNTU1Sc2l3eXpQVkxzMGViQW10NC85NFhTZTNp?=
 =?utf-8?B?YmRiTndHb2pwYmtWM2g1TU13aE1qTU9pQk1rWGtLRGN1c3d0ekhMZWNzOGJF?=
 =?utf-8?B?ajB4ejRkK085Uzc1TGN0c2xNZlRmZXVscjdYTWY1M0h6cnNrNnU4b2wzZDJS?=
 =?utf-8?B?ZDhmZlBXbEZKbmpQRloycFlINjBRZ0pNU1VwMk1zOVZNc3A4NERaMXRhclZn?=
 =?utf-8?B?UkZENE1jQi85azNQcWdpM0Fqd1JlVUhBUW5rbitscDZEdGlmZE5EMUtHMDlm?=
 =?utf-8?B?ZjI1UUk2dU1qUUR5clZnQnJtSmtqNkw0V0VwMS8zWUlPdGtqYXZiSVNPVlJ0?=
 =?utf-8?B?ak1mZUF4eVFIQTBlS1hMMndPVjgvNVkzeXhXdUVKZ1JISm5HNktKaDFPeVk3?=
 =?utf-8?B?QnBvSy9WcCtJaDVPeE5BQ0t6Q3EzZVREU0xadGNBK0F1c09DbEpydVYxRWp1?=
 =?utf-8?B?eGVVbWJKVXJwb1hnK1JlR056RWlVbThqWElsalVsMWppSGxNWlRucXV5RzZr?=
 =?utf-8?B?QmF0bmRkdVhSV05IdXpOdko0K2d5WC9JdzE0ZWZ2S0VMTDIzVkhsSVdyUm9Z?=
 =?utf-8?B?K3BibGc0TVB1N2VvSW85REZITTdVRFRqQlRUcGM1aFZIWE90SjF6ZU1PYmRq?=
 =?utf-8?B?V3BVTUFJUVpxREpCSkFmNnFvTHc3bWE0WmNVR3dXeS9HUXYzSFVmNDgveWdP?=
 =?utf-8?B?RjJVM3NvY2dnRTZXbFJLeXFzVytpMHVybU5uandDSTNZY2VVVytlV2NWMG1G?=
 =?utf-8?B?YlRZaWJjZjZVNlNFcWc4QitwUG5aWEFHdUQxVndCYTZZZDA0RHdRMDEwOG5S?=
 =?utf-8?B?Y1BRN0R5a0FYb0YwQzlPZzNUUmw4bmh6YVFLaWc4M08zMU83QWR6dnZJR2M2?=
 =?utf-8?B?NkxVNEJHSzBWZFRBcGRKa296YlhyNzVvYWpMOWl3UXJJbEpRbTFYM3JBN1pw?=
 =?utf-8?B?U0tXV0QwQW4rN2JOSC81UVMwMWpTOFJIaGluUTdHR0krTVJ1QWdlUG05WFB4?=
 =?utf-8?B?U1RhN3UrM1RvMDRYOTE4V3Z0eGpGSnBUaHhpR1hpQkVPRnVaOWsrMnowNjZJ?=
 =?utf-8?Q?3f71L/B3RMTKmCFzlbDOXoTKM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a0eb52-d614-47de-e435-08de31846f08
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 09:23:20.5112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPPGcUoSODYIPDtoPcfI4Jj1+OXEpMpwruzBN7YBUrusO7EoikKcEwLCsRnabK3PEaf7XSlKAZPtiXJ3BuyKYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8870
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

Hi Thasleem/Pranay,

On 12/1/2025 1:35 PM, Samala, Pranay wrote:
> Hi Thasleem,
>
> I mean split the patch logically if possible. For eg, add the subtest/fixture in one patch, and then add functions like primary output detection or so in 2nd, then thread executions in 3rd and so on.
> It will be easy to review the patch.
I agree on the split part as this patch is a little bulky, but cannot 
split functional parts separately as mentioned by Thasleem. IMHO we can 
move out few of the functions to lib, called it out below.
>
> Regards,
> Pranay
>
>> -----Original Message-----
>> From: Thasleem, Mohammed <mohammed.thasleem@intel.com>
>> Sent: Thursday, November 20, 2025 8:47 PM
>> To: Samala, Pranay <pranay.samala@intel.com>; igt-
>> dev@lists.freedesktop.org; Poosa, Karthik <karthik.poosa@intel.com>
>> Cc: B S, Karthik <karthik.b.s@intel.com>
>> Subject: RE: [PATCH v4 1/2] tests/intel/kms_pm_vrsr: Add test to validate
>> VRSR with system suspend
>>
>> Hi @Samala, Pranay ,  This is a new file with one subtest. Is there a specific
>> rationale for splitting the patch into multiple submissions?
>>
>> -----Original Message-----
>> From: Samala, Pranay <pranay.samala@intel.com>
>> Sent: 17 November 2025 10:49 AM
>> To: Thasleem, Mohammed <mohammed.thasleem@intel.com>; igt-
>> dev@lists.freedesktop.org
>> Cc: Poosa, Karthik <karthik.poosa@intel.com>; B S, Karthik
>> <karthik.b.s@intel.com>; Thasleem, Mohammed
>> <mohammed.thasleem@intel.com>
>> Subject: RE: [PATCH v4 1/2] tests/intel/kms_pm_vrsr: Add test to validate
>> VRSR with system suspend
>>
>> Also Please split this patch into 2 or more.
>>
>>> -----Original Message-----
>>> From: Samala, Pranay
>>> Sent: Monday, November 17, 2025 10:14 AM
>>> To: Mohammed Thasleem <mohammed.thasleem@intel.com>; igt-
>>> dev@lists.freedesktop.org
>>> Cc: Poosa, Karthik <karthik.poosa@intel.com>; B S, Karthik
>>> <Karthik.B.S@intel.com>; Thasleem, Mohammed
>>> <mohammed.thasleem@intel.com>
>>> Subject: RE: [PATCH v4 1/2] tests/intel/kms_pm_vrsr: Add test to
>>> validate VRSR with system suspend
>>>
>>> Hi Thasleem,
>>>
>>>> -----Original Message-----
>>>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>>>> Mohammed Thasleem
>>>> Sent: Tuesday, November 11, 2025 11:30 PM
>>>> To: igt-dev@lists.freedesktop.org
>>>> Cc: Poosa, Karthik <karthik.poosa@intel.com>; B S, Karthik
>>>> <karthik.b.s@intel.com>; Thasleem, Mohammed
>>>> <mohammed.thasleem@intel.com>
>>>> Subject: [PATCH v4 1/2] tests/intel/kms_pm_vrsr: Add test to
>>>> validate VRSR with system suspend
>>>>
>>>> This test detect primary connected panel and also adds a test for
>>>> VRAM Self Refresh (VRSR), focusing on display flip and power
>>>> management efficiency. It handles transitions between power states
>>>> like system suspend. The patch includes validation of VRAM residency
>>>> and power state transitions, ensuring accurate testing of VRSR
>> functionality.
>>>> v2: Add skip check for output and primary plane in device struct. (Pranay)
>>>>      Remove primary plane structure declaration from cleanup. (Pranay)
>>>>      Use igt_sysfs_open at igt fixture. (Anirban)
>>>> v3: Add spaces between concatenated string and rename variable.
>>>> (Pranay)
>>>> v3: Refactor VRSR test into common function supporting system suspend.
>>>>
>>>> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
>>>> ---
>>>>   tests/intel/kms_pm_vrsr.c | 563
>>>> ++++++++++++++++++++++++++++++++++++++
>>>>   tests/meson.build         |   1 +
>>>>   2 files changed, 564 insertions(+)
>>>>   create mode 100644 tests/intel/kms_pm_vrsr.c
>>>>
>>>> diff --git a/tests/intel/kms_pm_vrsr.c b/tests/intel/kms_pm_vrsr.c
>>>> new file mode 100644 index 000000000..5a96eebfa
>>>> --- /dev/null
>>>> +++ b/tests/intel/kms_pm_vrsr.c
>>>> @@ -0,0 +1,563 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright © 2025 Intel Corporation  */
>>>> +
>>>> +/**
>>>> + * TEST: kms pm vrsr
>>>> + * Category: Display
>>>> + * Description: This test to validate VRAM Self Refresh
>>>> + * Driver requirement: xe
>>>> + * Mega feature: Display Power Management  */
>>>> +
>>>> +#include "igt.h"
>>>> +#include "igt_sysfs.h"
>>>> +#include "igt_device.h"
>>>> +#include "igt_device_scan.h"
>>>> +#include "igt_pm.h"
>>>> +#include "intel_common.h"
>>>> +#include "lib/igt_syncobj.h"
>>>> +#include "lib/intel_reg.h"
>>>> +#include "lib/igt_kmod.h"
>>>> +
>>>> +#include <dirent.h>
>>>> +#include <limits.h>
>>>> +#include <fcntl.h>
>>>> +#include <string.h>
>>>> +#include <sys/ioctl.h>
>>>> +
>>>> +#include "xe_drm.h"
>>>> +#include "xe/xe_ioctl.h"
>>>> +#include "xe/xe_query.h"
>>>> +
>>>> +#define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
>>>> +#define KMS_POLL_DISABLE 0
>>>> +
>>>> +#define MAX_N_EXEC_QUEUES 16
>>>> +#define NO_SUSPEND -1
>>>> +#define NO_RPM -1
>>>> +
>>>> +#define USERPTR (0x1 << 0)
>>>> +#define PREFETCH (0x1 << 1)
>>>> +#define UNBIND_ALL (0x1 << 2)
>>>> +
>>>> +/**
>>>> + * SUBTEST: vrsr-system-suspend
>>>> + * Description: Validated VRSR during system suspend alongside
>>>> +active display flip
>>>> + *
>>>> + */
>>>> +
>>>> +IGT_TEST_DESCRIPTION("This test to validate VRAM Self Refresh");
>>>> +
>>>> +bool kms_poll_saved_state;
>>>> +
>>>> +typedef struct {
>>>> +	int fd_xe;
>>>> +	int debugfs_fd;
>>>> +	struct igt_fb fb_white;
>>>> +	drmModeModeInfo *mode;
>>>> +	igt_display_t display;
>>>> +	igt_output_t *output;
>>>> +	igt_plane_t *primary;
>>>> +	struct pci_device *pci_xe;
>>>> +	struct pci_device *pci_root;
>>>> +	char pci_slot_name[NAME_MAX];
>>> NAME_MAX is not defined anywhere.
>>> And since a PCI slot name has a known format (e.g., "0000:00:02.0"),
>>> you can use a fixed size.
>>>
>>>> +	drmModeResPtr res;
>>>> +} device_t;
>>>> +
>>>> +static pthread_mutex_t suspend_lock = PTHREAD_MUTEX_INITIALIZER;
>>>> static
>>>> +pthread_cond_t suspend_cond = PTHREAD_COND_INITIALIZER; static
>>>> +pthread_mutex_t child_ready_lock = PTHREAD_MUTEX_INITIALIZER;
>>> static
>>>> +pthread_cond_t child_ready_cond = PTHREAD_COND_INITIALIZER;
>> static
>>>> bool
>>>> +child_ready;
>>>> +
>>>> +typedef struct {
>>>> +	device_t device;
>>>> +	struct drm_xe_engine_class_instance *eci;
>>>> +	int n_exec_queues;
>>>> +	int n_execs;
>>>> +	enum igt_suspend_state s_state;
>>>> +	enum igt_acpi_d_state d_state;
>>>> +	unsigned int flags;
>>>> +} child_exec_args;
>>>> +
>>>> +typedef enum {
>>>> +	SUSPEND_SYSTEM,
>>>> +} suspend_type;
>>>> +
>>>> +static void setup_primary(device_t *device) {
>>>> +	igt_plane_set_fb(device->primary, NULL);
This will not take effect without a commit. Is this required?
>>>> +	igt_create_color_fb(device->fd_xe,
>>>> +			device->mode->hdisplay, device->mode->vdisplay,
>>>> +			DRM_FORMAT_XRGB8888,
>>>> +			DRM_FORMAT_MOD_LINEAR,
>>>> +			1.0, 1.0, 1.0,
>>>> +			&device->fb_white);
>>>> +	igt_plane_set_fb(device->primary, &device->fb_white);
>>>> +	igt_display_commit(&device->display);
>>>> +}
>>>> +
>>>> +/* Assumption that detected panel is primary display gpu */ static
>>>> +void detect_primary_output(device_t *device) {
>>>> +	igt_display_t *display = &device->display;
>>>> +	igt_output_t *output;
>>>> +	enum pipe pipe;
>>>> +
>>>> +	for_each_pipe_with_valid_output(display, pipe, output) {
>>>> +		drmModeConnectorPtr connector = output-
>>>>> config.connector;
>>>> +
>>>> +		if (connector->connection != DRM_MODE_CONNECTED)
This check is redundant and already covered with 
for_each_pipe_with_valid_output.
>>>> +			continue;
>>>> +
>>>> +		igt_display_reset(display);
>>>> +		igt_output_set_pipe(output, pipe);
>>>> +
>>>> +		if (!intel_pipe_output_combo_valid(display))
>>>> +			continue;
>>>> +
>>>> +		device->output = output;
>>>> +		device->mode = igt_output_get_mode(output);
>>>> +		device->primary = igt_output_get_plane_type(output,
>>>> +DRM_PLANE_TYPE_PRIMARY);
>>>> +
>>>> +		break;
>>>> +	}
>>>> +
>>>> +	igt_require_f(device->output && device->mode, "No valid connected
>>>> +output found\n"); }
>>>> +
>>>> +/* runtime_usage is only available if kernel build
>>>> +CONFIG_PM_ADVANCED_DEBUG */ static bool
>>>> runtime_usage_available(struct
>>>> +pci_device *pci) {
>>>> +	char name[PATH_MAX];
>>>> +
>>>> +	snprintf(name, PATH_MAX,
>>>> "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/runtime_usage",
>>>> +		 pci->domain, pci->bus, pci->dev, pci->func);
>>>> +	return access(name, F_OK) == 0;
>>>> +}
>>>> +
>>>> +static uint64_t get_vram_d3cold_threshold(int sysfs) {
Could this be moved to lib?
>>>> +	uint64_t threshold;
>>>> +	char path[64];
>>>> +	int ret;
>>>> +
>>>> +	sprintf(path, "device/vram_d3cold_threshold");
>>>> +	igt_require_f(!faccessat(sysfs, path, R_OK, 0),
>>>> "vram_d3cold_threshold
>>>> +is not present\n");
>>>> +
>>>> +	ret = igt_sysfs_scanf(sysfs, path, "%" PRIu64 "", &threshold);
>>>> +	igt_assert_lt(0, ret);
>>>> +
>>>> +	return threshold;
>>>> +}
>>>> +
>>>> +static void set_vram_d3cold_threshold(int sysfs, uint64_t threshold) {

Same here.

Thanks and Regards,
Karthik.B.S
>>>> +	char path[64];
>>>> +	int ret;
>>>> +
>>>> +	sprintf(path, "device/vram_d3cold_threshold");
>>>> +
>>>> +	if (!faccessat(sysfs, path, R_OK | W_OK, 0))
>>>> +		ret = igt_sysfs_printf(sysfs, path, "%" PRIu64 "", threshold);
>>>> +	else
>>>> +		igt_warn("vram_d3cold_threshold is not present\n");
>>>> +
>>>> +	igt_assert_lt(0, ret);
>>>> +}
>>>> +
>>>> +static bool in_d3(device_t device, enum igt_acpi_d_state state) {
Same here.
>>>> +	/* We need to wait for the autosuspend to kick in before we can
>>>> check */
>>>> +	if
>>>> (!igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED))
>>>> +		return false;
>>>> +
>>>> +	if (runtime_usage_available(device.pci_xe) &&
>>>> +	    igt_pm_get_runtime_usage(device.pci_xe) != 0)
>>>> +		return false;
>>>> +
>>>> +	switch (state) {
>>>> +	case IGT_ACPI_D3Cold:
>>>> +		return
>>>> igt_wait(igt_pm_get_acpi_real_d_state(device.pci_root) ==
>>>> +				IGT_ACPI_D3Cold, 10000, 100);
>>>> +	default:
>>>> +		igt_info("Invalid D3 State\n");
>>>> +		igt_assert(0);
>>>> +	}
>>>> +
>>>> +	return true;
>>>> +}
>>>> +
>>>> +#define MAX_VMAS 2
>>>> +
>>>> +static void*
>>>> +child_exec(void *arguments)
>>>> +{
>>>> +	child_exec_args *args = (child_exec_args *)arguments;
>>>> +
>>>> +	uint32_t vm;
>>>> +	uint64_t addr = 0x1a0000;
>>>> +	struct drm_xe_sync sync[2] = {
>>>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =
>>>> DRM_XE_SYNC_FLAG_SIGNAL, },
>>>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =
>>>> DRM_XE_SYNC_FLAG_SIGNAL, },
>>>> +	};
>>>> +	struct drm_xe_exec exec = {
>>>> +		.num_batch_buffer = 1,
>>>> +		.num_syncs = 2,
>>>> +		.syncs = to_user_pointer(sync),
>>>> +	};
>>>> +	int n_vmas = args->flags & UNBIND_ALL ? MAX_VMAS : 1;
>>>> +	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>>>> +	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
>>>> +	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
>>>> +	size_t bo_size;
>>>> +	uint32_t bo = 0;
>>>> +	struct {
>>>> +		uint32_t batch[16];
>>>> +		uint64_t pad;
>>>> +		uint32_t data;
>>>> +	} *data;
>>>> +	int i, b;
>>>> +	uint64_t active_time;
>>>> +	bool check_rpm = (args->d_state == IGT_ACPI_D3Hot ||
>>>> +			  args->d_state == IGT_ACPI_D3Cold);
>>>> +
>>>> +	igt_assert_lte(args->n_exec_queues, MAX_N_EXEC_QUEUES);
>>>> +	igt_assert_lt(0, args->n_execs);
>>>> +
>>>> +	if (check_rpm) {
>>>> +		igt_assert(in_d3(args->device, args->d_state));
>>>> +		active_time = igt_pm_get_runtime_active_time(args-
>>>>> device.pci_xe);
>>>> +	}
>>>> +
>>>> +	vm = xe_vm_create(args->device.fd_xe, 0, 0);
>>>> +
>>>> +	if (check_rpm)
>>>> +		igt_assert(igt_pm_get_runtime_active_time(args-
>>>>> device.pci_xe) >
>>>> +			   active_time);
>>>> +
>>>> +	bo_size = sizeof(*data) * args->n_execs;
>>>> +	bo_size = xe_bb_size(args->device.fd_xe, bo_size);
>>>> +
>>>> +	if (args->flags & USERPTR) {
>>>> +		data = aligned_alloc(xe_get_default_alignment(args-
>>>>> device.fd_xe),
>>>> +				     bo_size);
>>>> +		memset(data, 0, bo_size);
>>>> +	} else {
>>>> +		if (args->flags & PREFETCH)
>>>> +			bo = xe_bo_create(args->device.fd_xe, 0, bo_size,
>>>> +					  all_memory_regions(args-
>>>>> device.fd_xe) |
>>>> +					  vram_if_possible(args-
>>>>> device.fd_xe, 0),
>>>> +
>>>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>>> +		else
>>>> +			bo = xe_bo_create(args->device.fd_xe, vm, bo_size,
>>>> +					  vram_if_possible(args-
>>>>> device.fd_xe, args->eci->gt_id),
>>>> +
>>>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>>> +		data = xe_bo_map(args->device.fd_xe, bo, bo_size);
>>>> +	}
>>>> +
>>>> +	for (i = 0; i < args->n_exec_queues; i++) {
>>>> +		exec_queues[i] = xe_exec_queue_create(args->device.fd_xe,
>>>> vm,
>>>> +						      args->eci, 0);
>>>> +		bind_exec_queues[i] = 0;
>>>> +		syncobjs[i] = syncobj_create(args->device.fd_xe, 0);
>>>> +	};
>>>> +
>>>> +	sync[0].handle = syncobj_create(args->device.fd_xe, 0);
>>>> +
>>>> +	if (bo) {
>>>> +		for (i = 0; i < n_vmas; i++)
>>>> +			xe_vm_bind_async(args->device.fd_xe, vm,
>>>> bind_exec_queues[0], bo,
>>>> +					 0, addr + i * bo_size, bo_size, sync,
>>>> 1);
>>>> +	} else {
>>>> +		xe_vm_bind_userptr_async(args->device.fd_xe, vm,
>>>> bind_exec_queues[0],
>>>> +					 to_user_pointer(data), addr, bo_size,
>>>> sync, 1);
>>>> +	}
>>>> +
>>>> +	if (args->flags & PREFETCH)
>>>> +		xe_vm_prefetch_async(args->device.fd_xe, vm,
>>>> bind_exec_queues[0], 0,
>>>> +				     addr, bo_size, sync, 1, 0);
>>>> +
>>>> +	if (check_rpm) {
>>>> +		igt_assert(in_d3(args->device, args->d_state));
>>>> +		active_time = igt_pm_get_runtime_active_time(args-
>>>>> device.pci_xe);
>>>> +	}
>>>> +
>>>> +	for (i = 0; i < args->n_execs; i++) {
>>>> +		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
>>>> +		uint64_t batch_addr = addr + batch_offset;
>>>> +		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
>>>> +		uint64_t sdi_addr = addr + sdi_offset;
>>>> +		int e = i % args->n_exec_queues;
>>>> +
>>>> +		b = 0;
>>>> +		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>>>> +		data[i].batch[b++] = sdi_addr;
>>>> +		data[i].batch[b++] = sdi_addr >> 32;
>>>> +		data[i].batch[b++] = 0xc0ffee;
>>>> +		data[i].batch[b++] = MI_BATCH_BUFFER_END;
>>>> +		igt_assert(b <= ARRAY_SIZE(data[i].batch));
>>>> +
>>>> +		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>>>> +		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>>>> +		sync[1].handle = syncobjs[e];
>>>> +
>>>> +		exec.exec_queue_id = exec_queues[e];
>>>> +		exec.address = batch_addr;
>>>> +
>>>> +		if (e != i)
>>>> +			syncobj_reset(args->device.fd_xe, &syncobjs[e], 1);
>>>> +
>>>> +		xe_exec(args->device.fd_xe, &exec);
>>>> +
>>>> +		igt_assert(syncobj_wait(args->device.fd_xe, &syncobjs[e], 1,
>>>> +					INT64_MAX, 0, NULL));
>>>> +		igt_assert_eq(data[i].data, 0xc0ffee);
>>>> +
>>>> +		if (i == args->n_execs / 2 && args->s_state != NO_SUSPEND) {
>>>> +			/* Until this point, only one thread runs at a given
>>>> time. Signal
>>>> +			 * the parent that this thread will sleep, for the
>>>> parent to
>>>> +			 * create another thread.
>>>> +			 */
>>>> +			pthread_mutex_lock(&child_ready_lock);
>>>> +			child_ready = true;
>>>> +			pthread_cond_signal(&child_ready_cond);
>>>> +			pthread_mutex_unlock(&child_ready_lock);
>>>> +
>>>> +			/* Wait for the suspend and resume to finish */
>>>> +			pthread_mutex_lock(&suspend_lock);
>>>> +			pthread_cond_wait(&suspend_cond,
>>>> &suspend_lock);
>>>> +			pthread_mutex_unlock(&suspend_lock);
>>>> +
>>>> +			/* From this point, all threads will run concurrently */
>>>> +		}
>>>> +	}
>>>> +
>>>> +	igt_assert(syncobj_wait(args->device.fd_xe, &sync[0].handle, 1,
>>>> +				INT64_MAX, 0, NULL));
>>>> +
>>>> +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>>>> +	if (n_vmas > 1)
>>>> +		xe_vm_unbind_all_async(args->device.fd_xe, vm, 0, bo, sync,
>>>> 1);
>>>> +	else
>>>> +		xe_vm_unbind_async(args->device.fd_xe, vm,
>>>> bind_exec_queues[0], 0,
>>>> +				   addr, bo_size, sync, 1);
>>>> +	igt_assert(syncobj_wait(args->device.fd_xe, &sync[0].handle, 1,
>>>> +				INT64_MAX, 0, NULL));
>>>> +
>>>> +	for (i = 0; i < args->n_execs; i++)
>>>> +		igt_assert_eq(data[i].data, 0xc0ffee);
>>>> +
>>>> +	syncobj_destroy(args->device.fd_xe, sync[0].handle);
>>>> +	for (i = 0; i < args->n_exec_queues; i++) {
>>>> +		syncobj_destroy(args->device.fd_xe, syncobjs[i]);
>>>> +		xe_exec_queue_destroy(args->device.fd_xe, exec_queues[i]);
>>>> +		if (bind_exec_queues[i])
>>>> +			xe_exec_queue_destroy(args->device.fd_xe,
>>>> bind_exec_queues[i]);
>>>> +	}
>>>> +
>>>> +	if (bo) {
>>>> +		munmap(data, bo_size);
>>>> +		gem_close(args->device.fd_xe, bo);
>>>> +	} else {
>>>> +		free(data);
>>>> +	}
>>>> +
>>>> +	xe_vm_destroy(args->device.fd_xe, vm);
>>>> +
>>>> +	if (check_rpm) {
>>>> +		igt_assert(igt_pm_get_runtime_active_time(args-
>>>>> device.pci_xe) >
>>>> +			   active_time);
>>>> +		igt_assert(in_d3(args->device, args->d_state));
>>>> +	}
>>>> +
>>>> +	/* Tell the parent that we are ready. This should run only when
>>>> +the
>>>> code
>>>> +	 * is not supposed to suspend.
>>>> +	 */
>>>> +	if (args->n_execs <= 1 || args->s_state == NO_SUSPEND)  {
>>>> +		pthread_mutex_lock(&child_ready_lock);
>>>> +		child_ready = true;
>>>> +		pthread_cond_signal(&child_ready_cond);
>>>> +		pthread_mutex_unlock(&child_ready_lock);
>>>> +	}
>>>> +	return NULL;
>>>> +}
>>>> +
>>>> +/* Do one suspend and resume cycle for all xe engines.
>>>> + *  - Create a child_exec() thread for each xe engine. Run only one
>> thread
>>>> + *    at a time. The parent will wait for the child to signal it is ready
>>>> + *    to sleep before creating a new thread.
>>>> + *  - Put child_exec() to sleep where it expects to suspend and
>>>> +resume
>>>> + *  - Wait for all child_exec() threads to sleep
>>>> + *  - Run one suspend and resume cycle
>>>> + *  - Wake up all child_exec() threads at once. They will run concurrently.
>>>> + *  - Wait for all child_exec() threads to complete  */ static void
>>>> +test_exec(device_t device, int n_exec_queues, int n_execs,
>>>> +		  enum igt_suspend_state s_state, enum igt_acpi_d_state
>>>> d_state,
>>>> +		  unsigned int flags)
>>>> +{
>>>> +	enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
>>>> +				     SUSPEND_TEST_DEVICES :
>>>> SUSPEND_TEST_NONE;
>>>> +	struct drm_xe_engine_class_instance *eci;
>>>> +	int active_threads = 0;
>>>> +	pthread_t threads[65]; /* MAX_ENGINES + 1 */
>>> Avoid using magic numbers. Better to define the max_engines as a macro
>>> #define MAX_ENGINES 64.
>>>
>>> Or can we derive number of engines and assign?
>>>
>>>> +	child_exec_args args;
>>> The args struct is reused for every thread.
>>> This creates a race condition because, the first thread might not read
>>> args.eci yet, meanwhile the parent overwrites args.eci for the next engine.
>>> Allocate separate args for each thread.
>>>
>>>> +
>>>> +	xe_for_each_engine(device.fd_xe, eci) {
>>>> +		args.device = device;
>>>> +		args.eci = eci;
>>>> +		args.n_exec_queues = n_exec_queues;
>>>> +		args.n_execs = n_execs;
>>>> +		args.s_state = s_state;
>>>> +		args.d_state = d_state;
>>>> +		args.flags = flags;
>>>> +
>>>> +		pthread_create(&threads[active_threads], NULL, child_exec,
>>>> &args);
>>>> +		active_threads++;
>>>> +
>>>> +		pthread_mutex_lock(&child_ready_lock);
>>>> +		while (!child_ready)
>>> Here parent checks whether the child is ready or not. This works only
>>> if you have ONE CHILD THREAD.
>>> But you are creating many threads (one per engine). That means ALL
>>> threads try to signal that they are “ready”, but they all write into
>>> the same single flag
>>>
>>>> +			pthread_cond_wait(&child_ready_cond,
>>>> &child_ready_lock);
>>>> +		child_ready = false;
>>>> +		pthread_mutex_unlock(&child_ready_lock);
>>>> +	}
>>>> +
>>>> +	if (n_execs > 1 && s_state != NO_SUSPEND) {
>>> Suspend only happens if n_execs > 1 - why this requirement?
>>> In the main test, vrsr_suspend_test() calls this with n_execs = 1, so
>>> suspend never happens in test_exec()
>>>
>>>> +		igt_system_suspend_autoresume(s_state, test);
>>>> +
>>>> +		pthread_mutex_lock(&suspend_lock);
>>>> +		pthread_cond_broadcast(&suspend_cond);
>>>> +		pthread_mutex_unlock(&suspend_lock);
>>>> +	}
>>>> +
>>>> +	for (int i = 0; i < active_threads; i++)
>>>> +		pthread_join(threads[i], NULL);
>>>> +
>>>> +	active_threads = 0;
>>> This variable is no longer used further.
>>>
>>>> +}
>>>> +
>>>> +static uint64_t get_mods_count(char *pkg_data) {
>>>> +	char *e;
>>>> +	long long ret;
>>>> +	char *s = strchr(pkg_data, ':');
>>>> +
>>>> +	igt_assert(s);
>>>> +	s++;
>>>> +	ret = strtol(s, &e, 10);
>>>> +	igt_assert(((ret != LLONG_MIN && ret != LLONG_MAX) || errno !=
>>>> ERANGE)
>>>> +		   && e > s && *e == '\n' && ret >= 0);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static uint64_t read_mods(int debugfs_fd) {
>>>> +	int ret;
>>>> +	char buf[256];
>>>> +	char *mods_ptr;
>>>> +
>>>> +	ret = igt_debugfs_simple_read(debugfs_fd, "dgfx_pkg_residencies",
>>>> buf, sizeof(buf));
>>>> +	igt_assert_f(ret >= 0, "Debugfs dgfx_pkg_residencies is not
>>>> +present.\n");
>>>> +
>>>> +	mods_ptr = strstr(buf, "Package ModS : ");
>>>> +	igt_skip_on_f(!mods_ptr, "Package ModS is not supported.\n");
>>>> +
>>>> +	return get_mods_count(mods_ptr);
>>>> +}
>>>> +
>>>> +static void cleanup(device_t device) {
>>>> +	igt_plane_set_fb(device.primary, NULL);
>>>> +	igt_display_commit(&device.display);
>>>> +	igt_remove_fb(device.fd_xe, &device.fb_white); }
>>>> +
>>>> +static void vrsr_suspend_test(device_t *device, int sysfs_fd,
>>>> +suspend_type type) {
>>>> +	uint64_t orig_threshold, mods_prev_value, mods_curr_value;
>>>> +
>>>> +	detect_primary_output(device);
>>>> +	setup_primary(device);
>>>> +	orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
>>>> +	mods_prev_value = read_mods(device->debugfs_fd);
>>>> +
>>>> +	/* TO DO: Created fb >300MB instead making 0 threshold. */
>>>> +	set_vram_d3cold_threshold(sysfs_fd, 0);
>>>> +
>>>> +	switch (type) {
>>>> +	case SUSPEND_SYSTEM:
>>>> +		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE,
>>>> SUSPEND_TEST_NONE);
>>>> +		break;
>>>> +	}
>>>> +
>>>> +	mods_curr_value = read_mods(device->debugfs_fd);
>>>> +
>>>> +	/* Restore threshold */
>>>> +	set_vram_d3cold_threshold(sysfs_fd, orig_threshold);
>>>> +	igt_assert_f(mods_curr_value > mods_prev_value,
>>>> +		     "Mods residency is inaccurate: %" PRIu64 "\n",
>>>> mods_curr_value);
>>>> +
>>>> +	cleanup(*device);
>>> Cleanup will not happen if the test fails early.
>>>
>>>> +}
>>>> +
>>>> +static void kms_poll_state_restore(int sig) {
>>>> +	int sysfs_fd;
>>>> +
>>>> +	sysfs_fd = open(KMS_HELPER, O_RDONLY);
>>>> +
>>>> +	if (sysfs_fd >= 0) {
>>>> +		__igt_sysfs_set_boolean(sysfs_fd, "poll",
>>>> kms_poll_saved_state);
>>> This kms_poll_saved_state is never actually saved
>>>
>>>> +		close(sysfs_fd);
>>>> +	}
>>>> +}
>>>> +
>>>> +igt_main
>>>> +{
>>>> +	char buf[256];
>>>> +	device_t device;
>>>> +	int sysfs_fd, ret;
>>>> +
>>>> +	igt_fixture {
>>>> +		memset(&device, 0, sizeof(device));
>>>> +		device.fd_xe = drm_open_driver(DRIVER_XE |
>>>> DRIVER_INTEL);
>>>> +		kmstest_set_vt_graphics_mode();
>>>> +		device.debugfs_fd = igt_debugfs_dir(device.fd_xe);
>>>> +		igt_require_f(device.debugfs_fd != -1, "debugfs directory not
>>>> accessible\n");
>>>> +		igt_display_require(&device.display, device.fd_xe);
>>>> +
>>>> +		ret = igt_debugfs_simple_read(device.debugfs_fd,
>>>> "vrsr_capable", buf, sizeof(buf));
>>>> +		igt_require_f(ret >= 0, "Debugfs vrsr_capable is not
>>>> present.\n");
>>>> +		igt_require_f(strstr(buf, "Y"), "VRSR is not enabled.\n");
>>>> +
>>>> +		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
>>>> +		device.pci_root =
>>>> igt_device_get_pci_root_port(device.fd_xe);
>>>> +		igt_device_get_pci_slot_name(device.fd_xe,
>>>> device.pci_slot_name);
>>> You're getting the PCI slot name but never using it in the test.
>>> Remove it if not needed.
>>>
>>> Regards,
>>> Pranay
>>>
>>>> +
>>>> +		/* Always perform initial once-basic exec checking for health
>>>> */
>>>> +		test_exec(device, 1, 1, NO_SUSPEND, NO_RPM, 0);
>>>> +
>>>> +		sysfs_fd = igt_sysfs_open(device.fd_xe);
>>>> +		device.res = drmModeGetResources(device.fd_xe);
>>>> +		igt_install_exit_handler(kms_poll_state_restore);
>>>> +	}
>>>> +
>>>> +	igt_describe("Validated VRSR during system suspend alongside
>>>> +active
>>>> display flip");
>>>> +	igt_subtest("vrsr-system-suspend")
>>>> +		vrsr_suspend_test(&device, sysfs_fd, SUSPEND_SYSTEM);
>>>> +
>>>> +	igt_fixture {
>>>> +		close(device.debugfs_fd);
>>>> +		close(sysfs_fd);
>>>> +		drmModeFreeResources(device.res);
>>>> +		igt_display_fini(&device.display);
>>>> +		drm_close_driver(device.fd_xe);
>>>> +	}
>>>> +
>>>> +	igt_exit();
>>>> +}
>>>> diff --git a/tests/meson.build b/tests/meson.build index
>>>> 9736f2338..6e913cb07 100644
>>>> --- a/tests/meson.build
>>>> +++ b/tests/meson.build
>>>> @@ -269,6 +269,7 @@ intel_kms_progs = [
>>>>   	'kms_pm_dc',
>>>>   	'kms_pm_lpsp',
>>>>   	'kms_pm_rpm',
>>>> +        'kms_pm_vrsr',
>>>>   	'kms_psr',
>>>>   	'kms_psr2_sf',
>>>>   	'kms_psr2_su',
>>>> --
>>>> 2.25.1
