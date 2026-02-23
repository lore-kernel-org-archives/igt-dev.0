Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574EFE909BC
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 03:09:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DBCA10E038;
	Mon, 23 Feb 2026 03:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SCK8d178";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3790B10E038
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 03:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771816185; x=1803352185;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ORzzSBAgiauiHZ0gOLT0fKimJQpHMxjLEY5VEvecIF4=;
 b=SCK8d178hys1x9k9azhAQjONEUUfJMbQcTiSldDSVtTDb7bGq1P5jw3m
 j9LIWaicza78WXqEj4Dj1EJq4anCXaTjkmciBYEHWodAmrv+KWLtvJwSo
 nRu2MiRwblq0SpY1rar+2JCQlJPYMHUXW6wMfN2za7/9WJGQ8qvpYkfS1
 lbiqOh23ZTn3BE1gwSTNT0qsdOveof5DAVto34pVrBJgwrDn8uHJzQv8K
 N7Zy7eMo7gdeYghXTBaSrrXDOWD3/4/SX4WmmcE5r2Z4iqtE6C3pJnma7
 gpLL4cUsj4tX6Y7z8JYxL1LbkZnoe0L3WtHlGWrw7PvDUYmMQnp2Bdxvl w==;
X-CSE-ConnectionGUID: VzTfW/Y0T2qMF6b5LhZdTg==
X-CSE-MsgGUID: Ez4dobKCSzKOKwn1NDHvQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72909051"
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; d="scan'208";a="72909051"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 19:09:44 -0800
X-CSE-ConnectionGUID: 9Alxp582RvqVKf2PnYDVug==
X-CSE-MsgGUID: BWh/kNvoRLK37uOmNUIGRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; d="scan'208";a="214663204"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 19:09:45 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 19:09:44 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 22 Feb 2026 19:09:44 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 19:09:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQaNZsy5uTW8R+RhmPYCsZGYXIXHFu6hW1AaNj7aZ+i41SYTueD75HGjO4zjKC4zr18mGnAl5roaqPWvkTBdltQsPrZWBoVoYMiB5y1+28HHGyUxat2AbH0nvqz92ijri7hU/T1HbJS5OgrBsY9D9oYOJyAtm0iTlJoUhv1H1GHjEjjo1kfSfcisXXHTK7q/TsyR84KJ333QH8bIvm3PZe5p7GHjGQmJzc6rBn+VhpN3D/1uwt7m4CxXMnH6yoZU1GATnXRo4+zctouRI/2CxNeA0NU9+vaQRt1JGpw0813+luSQ47jhDA69Mcu2c1obw2k6O6YG+Ha7mI/AjP0vCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6iI2gINUVo3l+hrIqHWGi0KGxQt7Rhoq93nd5q2NYU=;
 b=hjay4ckCtesF8yxY0YHoqmtIkTso2vzicN9cExskW8YeClAtyYiJpyCSTfbTryeOmJpOp4JkYvHmEuB2cTgMs1PgfWIeuWnW67hUvCjuTjkW4/ixnlpUj0EKuYlSZkNT6V6OwN7lKY0pojapzt5pUaIaLSSKfj0twN3Vx6abUZek5IdWp9B4Zg1j3IXAAnbhe1dOgP3Y7nW49i/Nm30kjjxD6G+sAbB0VjwGmUX2rpySh1kMV3HLwddpt874qJz7LJdliHrVng2mNfCdo7g0XPiY/4H81JZwk9k07YyUslW5JfXBCIyGby4B1TLvOTQtiAE1Rh6twZ9T5oQ1J5nWiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA2PR11MB5162.namprd11.prod.outlook.com (2603:10b6:806:114::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 03:09:36 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 03:09:36 +0000
Message-ID: <f7e2c4b0-57ba-4a61-a7c0-a2c3e4e8676b@intel.com>
Date: Mon, 23 Feb 2026 08:39:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 04/23] tests/kms_concurrent: Actually run the
 test over all connected crtcs
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Swati Sharma <swati2.sharma@intel.com>
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
 <20260221032003.30936-5-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260221032003.30936-5-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0037.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::17) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA2PR11MB5162:EE_
X-MS-Office365-Filtering-Correlation-Id: 64298a67-77c7-42b8-b3ab-08de7288f973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|42112799006|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVZxbHZEeXg0czB3V0ZEWmlUVjdneXpoV0xRdnY5NzhVUnZ2eTFuTUIrTlFq?=
 =?utf-8?B?VjVjb1RMU3UrNTQ2bFZ6MnpWWDZyNlNiWnhZUTB0dGdWS2xYMEtWVk1ITFJn?=
 =?utf-8?B?Ny9TU2ZwdjkzMFF1RkE2T292RE1Da29WbURRdTN4L0k4Q0JQZkFqR3NldExO?=
 =?utf-8?B?eGVhYzBoQ3dZVG5kMllhSm5zbUlnM29CaGFPK3BMSUxQWlFnMS91TUplTWVo?=
 =?utf-8?B?TGRJeTB6K2Q0NFhTWlFkZjlrUS9EalphVzJvZ2IyQVh6VXVqZmNjcmpGWG9p?=
 =?utf-8?B?NUZhSGlWZjIvbGRoSUhSb1J3WDhuanNuc1FGRk5aT0k0eHYrOTQ3ZU5XY0I1?=
 =?utf-8?B?T1llMUFSbEhRRytaekgxVnZmMjVxdVhTdWlTQlpIbTJEdU9rQzhsNVhBZkhX?=
 =?utf-8?B?V1dvSW1scnd5UHpmTHRHcUpLWjlmUmJ0dU5FZUxYZkJNSnpvbGpYU3pwUG1G?=
 =?utf-8?B?ZDk3aDB3NWFYYzVuT1QzR01GL1pGbG1HN05lUlphT29sRkpzRy9RSTJ4ck10?=
 =?utf-8?B?ODQxaHdCQmVEcTBlUmFxdSt5ZkhpbFZ0aktpbU9aVXg4Z083Ullnd2UySXJP?=
 =?utf-8?B?MEtHaDZqRTE3d1dxWHFwb2JwVGQ3aGtGK2lKclMya0VRREg4L0ZPd082VUVm?=
 =?utf-8?B?SXc4MjBBMk9RMk5XWitKRTZlK0lJYXNNbnJwYlVGdjJHM3lXWGlwNlFGWElv?=
 =?utf-8?B?L2tLWkV1b2JhenhVdkhTN2VxQWFvZHByUmYvUW5nRVBwaUxYL085Tzl5NE9N?=
 =?utf-8?B?UU85RTlwbyt0aUE5S0UxM0t5dld0aWpCeUVnb3FvYm1LSGdrM1lGYm5HQWNK?=
 =?utf-8?B?ZFU3M0FrZ1FoUWF3dHgzQ1BZczNZa2w1MVdDb3Nvd3Z4SXFSZ3dHcFBJaVMx?=
 =?utf-8?B?WHFaT0ZPa3VwdFhHZTZvd1k3R0hreXRHWXBKZENIL2orS1NIcGxNc3l5d29V?=
 =?utf-8?B?MzNnb1lYZERoeEY4Q09aQXNYcTZNck5GR1haUHVRb3NKNml3S1gwSWQwU1NE?=
 =?utf-8?B?UW5XeWFYKzV0aWREeWhJRzV1V0MvalJCY1BscG1YWlN5YWNJOGVVNktWYTZR?=
 =?utf-8?B?blJGUE00YkJVQ0tMczJlaGIraCt6RkhaOURRUkROMG9kY1MwbzlIbkR3b3ky?=
 =?utf-8?B?Z2F3U0I0UHhkSnRRNmtsRzBIWHllR0dJRDFIU1hmRjNPNUp4M3FnQmdIc1Rt?=
 =?utf-8?B?QXk2aHNSa1NSSkZrbHlYOXo4Nzk1Sng5ZFcrcWFScFBFRWtnOWpTUjlIKzM5?=
 =?utf-8?B?eFhOUEtQMUFpRWJSMVY2SHdXeTdHcWdzdHZxb1IrSStyRjhzeU9MMkk2YVFw?=
 =?utf-8?B?aElUOVAzK29FVkJnNDN4SHdxQmhaUTU1d2dDM2wwWG1BNFQzVHRkUjVWVVFR?=
 =?utf-8?B?WjF3Um0xSVZNcmdET0tyeTU0WVRjUjRlbE42WVJaK1oyRmJ4RjNPM0t1RXZF?=
 =?utf-8?B?OW5EQWdxZXhaNjZNZG53L3RGRE1CWFVaRmRVanNhbkFNakxaS29Edy9pM1l3?=
 =?utf-8?B?eHgySnFxSnFyS2VMTG9HSVFOMGN1T0ZsMnBwc0lQTTg4OUxZT2Nma1N6MTVn?=
 =?utf-8?B?U0J5dmZ4aVNCUkRlK3VNVGVtYkdiVk9xSnExSTFmenJleFNMS0JQRE5Qb0E0?=
 =?utf-8?B?Mnk3UVdSU25OODlKMmNiTG5xeFFwZVVLdVNPeGNQcnhMYmIwWXgzMVdzRUUv?=
 =?utf-8?B?d0Vrc3pXemdrQ0V3TEpldDR6UHNwU0pwMVMwd2Q0UW03SmRKek1SM3MyYUMx?=
 =?utf-8?B?TnR2L0dYL0U0d1lVUUhraTllTmpEYjByUllub2YwZE1QYytzRGk3ZTlNVGxI?=
 =?utf-8?B?VDluZ1pJenNyZWd3RVhSS1Z3TzZTU0NkQXF1N3VCUnAzSXNzWWh4S0dlKzBY?=
 =?utf-8?B?WHJTL1VESlNRMTRHdWxaQ00rM1lXeUs5L0RQOG04RVFzRHorRXdzQzFwVldn?=
 =?utf-8?B?UlVsQ2diODBTQUVUSkNhVnJiaUVyODlXZXpEVGxycTEyNmdMTElnc1pMeU05?=
 =?utf-8?B?N2lUcmpidXhab0xVb28xRktMeW9GcFozcWExaEJZMkVOR1RjVWUvTERiWGhr?=
 =?utf-8?B?Q0FrOUtVNnNBWkl5RlNVeG9IZ1ZXU0UxUzJmWnVaS0ZDSDdiY05qWEswakRp?=
 =?utf-8?Q?/4K0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDU1NXo0RGtjb3Vkb2drNjJsUWw0NmwzdVZNem9vV2dFSk5vN3lDNldRY25C?=
 =?utf-8?B?WjFnU3dxQXc5b3E3WlQyWkFkV1dyakQ5TW1UeVR4dkFyMmVKUERsT2FPNHFE?=
 =?utf-8?B?bExHM1lkYklKNHZUbFdBbUhmblByQjdUWkNOTkNPWjlYdVpzK2p3RUptL1da?=
 =?utf-8?B?dFhPZDE5bkJQSklVampGMlpnMVU0SVJjZVJydGlSZFlqd1NkbDRueERsR0tv?=
 =?utf-8?B?dUZJVHNtNkpVVjZ4c1NRaElPKzdmU0lvMHZTeFpvV0lyRWRzWENlM3hVWUhz?=
 =?utf-8?B?Y3Raalpzc0hyWHVrSmVXSllRVkMvWlhOVkg0WHJjeXpPUVJ6N3BlMEZEUUE1?=
 =?utf-8?B?TWdGRldxZE9iQ293OEVBbjc0aFVxTXVQS2ZNbk1LOHhDeGR6R250bGNqejJT?=
 =?utf-8?B?QzIyQzl5bVF4WTJHU2N0aThVYlA0aDlIQTBpMmEreXNJbjBhaEFHWnJuRVhX?=
 =?utf-8?B?bHduZ0tyeEVRWTN1YXBNeUc5SnRkZElpeURJSXUwUVMzd20xTHFKTk4yanJB?=
 =?utf-8?B?SzhqKzZaREJLcXltalg1RHF5ZkZHeGVrMGh5S294OG93UUV4QjJKMGswVmp6?=
 =?utf-8?B?aGVXRjNGYWhBZnltQk9sdmNTQzJMQ2dzYUQ3Y1krNDZ5R1EyRFJMT21TZHZw?=
 =?utf-8?B?NzVSRjB3eG1iY1ZPOE5GZnkyejJMMWVaMExqc1ZCWFhIRnA0Z2ZISXRCbDNV?=
 =?utf-8?B?aXh4SnpVQ1RpR0pSaWpQUGhUN1ZTdHR1Y1BMVzlrazhXSjZHZi8zVVZlOXJY?=
 =?utf-8?B?eWJUUk8wSHZXcmsrd3Q3TDgrNVhxWVI5SVMxcEJHVUxpeGloVjhxZ2g0dHdE?=
 =?utf-8?B?N2xldWVHL0VYanIyYm4xdzdoM09keHZoK2pTL3BhRm9pNW5UV1UxTjhvS0xH?=
 =?utf-8?B?dEtGWnMrK3pKQ2RiSk1xb3Q5OXdhcUN1cHQ2U2kxclpKcnFBOHRyVDhSSmVs?=
 =?utf-8?B?ZFFPU1BjN1djYkJ6cjQ3TEVJb0hnSjgxY0syNDRJWk1hRk5OZS9CSE85Yjgz?=
 =?utf-8?B?NVlMLzJUSitNdFFEM1hIaXNqNTJYbjF6d0k1dmJwME52RGtwVG5uVnZUWExl?=
 =?utf-8?B?ZHhkSEFzN0Y3Z2ZyRk5EKzZpU0x4RGZTNWxMYk9zMjYrT1EyaEFDTjJvUUhO?=
 =?utf-8?B?akZEMHVQYzVhKzNxL1ExVWU5QzEyUGtza0RsbE5ORWNlZlhFZy9FTUVnVlNk?=
 =?utf-8?B?WnhKdHpCWFVnWkRlbXpodVcxUExaV25NK0RwaS9zMHVoL2YwQUwrT2h5M2Js?=
 =?utf-8?B?M2VLV0NZZzlUQmxrMDdManNIOGVXbGhvN29KUzhLWG5CSDN6WW1xOVF6MUs3?=
 =?utf-8?B?K2VNTVYyM1UzVXNkb05qVVVOek1JYlFoRGFqK2xDZmdnWGlSbSthbmt6ZHEr?=
 =?utf-8?B?YnBuMzFhRmxRZ2UvVnJHQW1YdjJOUGlIK0ZzR2JNSjVHNWpqVkRGTjEva0RM?=
 =?utf-8?B?L2R3UU9BalBMd2RUeFBEQ1FTL0VNbHRJUTdySHAwOEFWS2QvUnBLRERxVE84?=
 =?utf-8?B?V0pNNkJSNEJHOWhETjlpdjdaWFNsd2NvdnJOZnVwSGphNnRZWVdsR0dXRW1P?=
 =?utf-8?B?NzFhcW5KWExjS05iYnozMlZ0emFKU2ttVHJVTjUzWlNUaFpOTUNnRURCWEw2?=
 =?utf-8?B?OWN4WTBHcWZ4Y2R3YVNmcUJlMm9ueUxPdnhGQjIwSHU4SElpSHA0RG9KSDdY?=
 =?utf-8?B?Rmh6ZnBPampjYVV0VFl0eEUxQi9IY0J1cVRqYk4rcGhGUzJLdUpNeXFyQ0p5?=
 =?utf-8?B?K2RQRW45b29XNXE5dzRjU0VrcEZJbnMza0c3NStsUzE4NExLeDEvTVIzaDZp?=
 =?utf-8?B?ZWE3Z1JUS1d5RDVseGo0OVFrV3RGU2grZzgxNGlrbi9OOVpubzBJRDNMZm1u?=
 =?utf-8?B?UnRjMytUY3Vrd0ZyR1JuVWpOQ25ON2VjbTNVS2U5Rndvc25sbGxKKzVpV0ZK?=
 =?utf-8?B?RzRpcHJEaWorMGpYMU1OUGFqQVI3R0pJbXBvdmNRMGdHbkdoODF0TW1ISDc1?=
 =?utf-8?B?RUczbGJaSkIrQnhNaG81a2ZXVU9QWTFNeGhlaE12S1JBOVZMQ21jenJIME5F?=
 =?utf-8?B?MlJMVU1iclIyK05XTllZVW5iWHdYSGZka2xvQjdmR2VZaGxaUkVHWjhqZFNI?=
 =?utf-8?B?aDlMTzZVWUtDRkNTUjBvNWZsTnhpWVNHTmxLcVRmaGl3RUlzNVFETXNxblQ4?=
 =?utf-8?B?OUdJaWw4bzZzNHpRUkptcStBRkdueGhJVENJUEFMRmJUSjkxc1FXZE5lRVlY?=
 =?utf-8?B?MW1pcExkUUVIRVk2d2lzendTUEQyZEV5cVc0TSt1cjErUjdkaU9jNFhLOU44?=
 =?utf-8?B?ckMrMGhNZHlUQll5aGpBdjI5b0RsWCt3amcraTdiSEwyRFFiWkpzUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64298a67-77c7-42b8-b3ab-08de7288f973
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 03:09:36.2770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PluVjIyH65vFzAaf14BNBu/P/NS7FWeQRDhajXJOVKMZyegEPfqTyzH41PvivK/JaxFVaug9q9Jsjq4IorhoXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5162
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


On 2/21/2026 8:49 AM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Currently kms_concurrent uses for_each_valid_output_on_pipe() with an
> uninitialized pipe (meaning it probably contains stack garbage). The
> actual intention seems to have been to use
> for_each_pipe_with_valid_output(). It's even mentioned in the offending
> commit message, but the actual code was never changed to match.
>
> We no longer have for_each_pipe_with_valid_output() so we have to switch
> over to for_each_crtc_with_valid_output(), which also means we end up
> doing the pipe->crtc conversion in one go.
>
>   #include "scripts/iterators.cocci"
>
> @@
> iterator name for_each_valid_output_on_pipe;
> iterator name for_each_crtc_with_valid_output;
> expression DISPLAY, OUTPUT;
> identifier PIPE;
> type T;
> @@
> - T PIPE;
> + igt_crtc_t *crtc;
> <+... when != PIPE = ...
> - for_each_valid_output_on_pipe(DISPLAY, PIPE, OUTPUT)
> + for_each_crtc_with_valid_output(DISPLAY, crtc, OUTPUT)
> {
> <...
> (
> - igt_crtc_for_pipe(..., PIPE)
> + crtc
> |
> - kmstest_pipe_name(PIPE)
> + igt_crtc_name(crtc)
> |
> - PIPE
> + crtc->pipe
> )
> ...>
> }
> ...+>
>
> @@
> identifier DISPLAY;
> @@
> - igt_display_t *DISPLAY = ...;
> ... when != DISPLAY
>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Fixes: 6958319123d9 ("tests/kms_concurrent: remove pipe dependency in subtest name")
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_concurrent.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index bbc988aa2000..f31992a514a0 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -344,24 +344,24 @@ run_test(data_t *data, enum pipe pipe, igt_output_t *output)
>   static void
>   run_tests_for_pipe(data_t *data)
>   {
> -	igt_display_t *display = &data->display;
>   	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>   
>   	igt_describe("Test atomic mode setting concurrently with multiple planes and screen "
>   		     "resolution.");
>   	igt_subtest_with_dynamic("multi-plane-atomic-lowres") {
> -		for_each_valid_output_on_pipe(&data->display, pipe, output) {
> +		for_each_crtc_with_valid_output(&data->display, crtc, output) {
>   			igt_display_reset(&data->display);
>   
>   			igt_output_set_crtc(output,
> -					    igt_crtc_for_pipe(display, pipe));
> +					    crtc);
>   			if (!intel_pipe_output_combo_valid(&data->display))
>   				continue;
>   
> -			igt_require(igt_crtc_for_pipe(display, pipe)->n_planes > 0);
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
> -				run_test(data, pipe, output);
> +			igt_require(crtc->n_planes > 0);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output))
> +				run_test(data, crtc->pipe, output);
>   		}
>   	}
>   }
