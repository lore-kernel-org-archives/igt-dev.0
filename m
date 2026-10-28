Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F730606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 10:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WDrde9OL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042FF10FB26;
	Wed, 28 Oct 2026 10:16:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999CE10E626
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 10:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793182506; x=1824718506;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2ph4a0c82q8DVbV98QESP4u2/MU6llKsKMajpD5770U=;
 b=WDrde9OLJw0cEIEOEY3/b2dYxxqKZUbAmSXTWJ2BBqrFMS1T0MaICGx/
 IroDp6NyNoH+11Kas3CGxvvpZsUJL8V/arYu+BXRLhQ1YEu88iVXsQNrv
 v7efCFNlf+GyaHPD/HGmMQvDHXTmlRAOiCrLCK9CEmIRZaFp+0sEx8ro5
 jsO+GYjTgeLB61OuWO0NI/WPOojju+YAYpQD2BbmajoXXMTawqSPgBYNO
 OVc73GANd0pO52YFNCkMg6oMWVc/++TBBIajQQLvXjbJfLmBdVWSeVdPu
 FOSkYPSP9pyOyHccJWeHO9omUPhI13TTAYsg01hxmkHMQ8/4urKAQfOoD g==;
X-CSE-ConnectionGUID: Y67rdcoYSZKY5OaRvgYT3Q==
X-CSE-MsgGUID: WITAl9TPQJyozPYbMrSkgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1990405"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1990405"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 03:15:05 -0700
X-CSE-ConnectionGUID: W0CxHBryT0ujbJf9Dg630A==
X-CSE-MsgGUID: n2n60EHES9CHp4bA1nyyFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4695538"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 03:15:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 03:15:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 03:15:04 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 03:15:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XG6JJreCNAzCjnkODymtgd6oMPG5BG6he37lBvd3DShmGPfsjvhhhE/Z+BHGZ5p/7DLqkz5jxCu0tiMFOeIJ6KLpRr8DBxFvivAs9rXEq4z81H2wOyucptYiRCbb845aFDXtjy2nbrlYCZ25rsHr625YEct9QwyLn4yzCs58HqCwFxL7dlfNYp3kRi2B92UpOCDW0NsU5cC87Qw4IUPFPpvDNRzSMzdV5Yifv71/icjja1zNm/U/OSgAC+ubbACvK3FWtV1DHfWfqHChwSSCup6p12FARnUzhkAGAZKlyIHjqk9wJCAo3+ZsceBAM017gezKZLJEaIbaj1PKp2Hmtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXeZyFEcMk48yRPuDnR1QIPJV2WlQGAWWq5SmGgz4Og=;
 b=S09SE7pdL+dO04QqOndCtTm3OI4DewHnxW0nZWp7SV3q/cnvPEvsJ5A4nhX8XX1DjFwi+rRQnFp3+lJvebfjRUZ89UPk9TqOxTPQesMwk5MEsNRYUTwiE/815XpHGXTpKC/HAKDQFS1De2qoTFkSKRHfTfSNyMPV9ieNXUdMScXM7bD94l7lE1gLOEu9ZILOFx3o4RldBt0AJ+9qjROGu9Mi5V7XtFwJxqtXbvhX3mHYe6WMhK/Vft5u6ZdjEZC+QSkshUDDtfQYonfcQH9H847kCkX7NbMCr+4w8pdZLSe64liXjIQkxxkwwoiVs0LJx1MEX582aXcSRziAyKrUnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5028.namprd11.prod.outlook.com (2603:10b6:303:9a::12)
 by DS4PPF2A0C3F85C.namprd11.prod.outlook.com (2603:10b6:f:fc02::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 10:15:03 +0000
Received: from CO1PR11MB5028.namprd11.prod.outlook.com
 ([fe80::a6c2:1db1:3753:d949]) by CO1PR11MB5028.namprd11.prod.outlook.com
 ([fe80::a6c2:1db1:3753:d949%6]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 10:15:02 +0000
Message-ID: <339f693d-189e-4ab4-8a9e-2fc01e9c0581@intel.com>
Date: Wed, 28 Oct 2026 15:44:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_survivability: Reload audio
 driver on exit
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@Intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Anirban, Sk" <sk.anirban@intel.com>, "Grzelak, Michal"
 <michal.grzelak@intel.com>, "B, Jeevan" <jeevan.b@intel.com>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
References: <20261015140035.2686997-1-chaitanya.kumar.borah@intel.com>
 <20261015140035.2686997-3-chaitanya.kumar.borah@intel.com>
 <BL1PR11MB5413188823D4E12C92070E0FE2642@BL1PR11MB5413.namprd11.prod.outlook.com>
 <BL1PR11MB5413239E7CA4C069551AD3A8E2642@BL1PR11MB5413.namprd11.prod.outlook.com>
 <0dca3537-6ec6-4412-aa87-a4002712b144@intel.com>
 <fd707ea6-f501-4b2c-82e8-c3ad9055138a@Intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <fd707ea6-f501-4b2c-82e8-c3ad9055138a@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::14) To CO1PR11MB5028.namprd11.prod.outlook.com
 (2603:10b6:303:9a::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5028:EE_|DS4PPF2A0C3F85C:EE_
X-MS-Office365-Filtering-Correlation-Id: 57819f6d-728d-4542-4e21-08df34dc5438
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|4143699003|5023799004|11063799006|56012099006|261022105027099003|261009223027099003|261026140227099003|261026121527099003|261021123027099003|261021121427099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 3NUK3y0WbTR9eZ4oQSyy32D+NYfTYZhQa757RXLJVDlJt1iLGxZinKkTj7W6sgR6kNMjagG6XM0EzT6az0x8VruX8a8maUSqE6zNQk+RTlsiHN1jvqhTrfzy9w42ydFSe8YYEPQR+wtI6XffxPJIEQQVz1qlDontuORrHj40cwFeYDOybnR8X9P2ZbqHDrdVe4uqlg2zpiHbLTpVCFQvpFrktDuqVHqGsvTN8jF0jVxzgj/z4Z+YyDdOs/4vzUTYnoXSkxOSeWSoqdyTaf3ltlESfsOARbu6GNcNYS7X1AOLPwI7bRN6Av8LUn90NLyi9nKOfM/S/NXlbvTb56NSYtO6M9gYISw7haMTlPZh6DZF/DnKbgEz4T5zCph+WcLIG4qaF4VMudOSO3Ez/RRKwISyZY466anYhw186/ciQmbpZEcDEVPyv0aTiHj+UwNpoVTcUQY79yi1RNbQI/LtUvY5kGF3/BNK68BuY+gBNO5aAWtPF4j4ARhJPOZREgFVOJ9/g9VH/Q7akOw453KyJZt257BfUYO9fZA+DRtkG70j6fN06ZTQxgoB8ClrQ5JL2iQOHWYA6G1jTdtE+kPLDpnjP5KBaCbJHlzPI8i12rTM9E5NCTe2DfhCGOWYyWYCt833CdKqN3aCvvmQClezh67qIkXCG9fRGRSEzHLG87c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5028.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(4143699003)(5023799004)(11063799006)(56012099006)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261021123027099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWluRkNHNUZ4MzNsNExuZkN3TkVtL2FzSUloaUwxOUlOcUdKY2dISjIybitS?=
 =?utf-8?B?cXVOa3YyVjRVMER5ZHpMRmR4c2luUjRjSkszazlmcnR0U2lMSGV0ZmQzNUds?=
 =?utf-8?B?cC9DK2xWZmZKTWdJRHRkTGFhM2ZjQ3lHL2FUTURBM1BDNXVzUEhqNXNqdGRq?=
 =?utf-8?B?V1h2d2RRZmFDL1pwRWt6RXZIaG14R0NydlM0QmVLeTRtTjQvNW9wZWM3dHRT?=
 =?utf-8?B?T2lmZ0UwVi93R0VaRVozSEpacmtzb29DSlBNYzNBeUhFRThTMGFseWNvUDFV?=
 =?utf-8?B?Sjl3dXYydC9ORGlSQXBaTzkwUjhoSFpsa3hWdkk1MWJYWThsRkRUdzB6K3Vm?=
 =?utf-8?B?UGpoeDVETXo4OGhsSUw4YzRPaXFycUZMTFlRVy9CVW53Vmh6WVhnSFA5TTlE?=
 =?utf-8?B?bVlPQ1pyc3JBbkM3T2ZrTFlCa1ArUm1QQnFYRVJnd3ZZZUd4M2ZmY3d6OExC?=
 =?utf-8?B?YkxiSkkwUFZBVVZNQ1A0cG1LWUlQZmVLYUw5My9TMWliMW94cjhOWTdrd285?=
 =?utf-8?B?SWxoNTF3c0crWEgvTUtpUDBvS1lIMHI0ZE8xc1oxMmRlbTF2UEFaenZQeXAx?=
 =?utf-8?B?c2Zjd3V2TWNaTlRVdjBOOTZwbFlJMG80Vnd0QncxbGRFeDYzTUxuV280UGJ5?=
 =?utf-8?B?RjdOM3F6bjNqZmlGWld4R24yOGtaaGFtenA4VFpKYUdLejFDMXJHMDlnVW9H?=
 =?utf-8?B?SFhqdXlpcWpqVU9JeWJRR3RGcytDc1NDbWFjb2VESStnNlRCQm4yOHo0aERW?=
 =?utf-8?B?VE5aWXZiSmNFS3RDZkJnQ2tISW9OOVI5WkFrQjNudDFuZDduTFFFRVFSdVNT?=
 =?utf-8?B?RWc5VU1MQXI5TkJUVkliR3oxUjcvaHlPNTIyL1hoU2YyY1FHTDlGTUZqSlJ3?=
 =?utf-8?B?RWN0aTFlZUx4M3VzVnpiM3QrSUJPbkpoYmVQOEV0RjY0S2R3alVDSkFNc09Q?=
 =?utf-8?B?MWNPTHowSDdxck5DbVRwQlB0b2VUMGdnVGtyanIwbmVqeUxoY1l2NEIzdktO?=
 =?utf-8?B?MnJLcnErcmlqNXhSb2FxRC9KWVJITzlaQzhXY1ZSRkEzUnJGZm5NQWdyRkRz?=
 =?utf-8?B?ZEF2Mk16cUVoUmFPdDZpaFVldnViSUpiUVNTQnBWZzl5TW9XVFQya0J5cXM5?=
 =?utf-8?B?b2hxelV3Um1Kbm9EUWdQeHBvUXZZN0szL24wN3F0YnEwZEp5dVh3QytqTDNv?=
 =?utf-8?B?SEk5djhMRmVRMlRseXZodUJ5eE5wUlVCdHVOa3JOWHJUZVo1c3J5TEpSRis4?=
 =?utf-8?B?SXRwcFo4eVRXSVFGb2dSRXBXdnp0QXVhN0QzbG9KUTlkMEQrTHlkTEY2NDJ1?=
 =?utf-8?B?UVRITVJtbVBHR3l2enJHUzFaUDZBazFnUnlhMy9qbks0aStoL2svQXhpL0Nz?=
 =?utf-8?B?d3dWak5XR2VlSVo5aHp2NHdRSmFBV0x1dzZGcCtGbGtsTHp6ZU9pMThGNS9U?=
 =?utf-8?B?VUtMVlgxRXhkek54WCtNK0JXMysyYjRWZkk2aFE4YjVBMFV4VmVyazV6SVVY?=
 =?utf-8?B?RVgrclR6c2FKV09EcmVqbFd0TnF0c0NWcVkyZHV3WHlyOUNrNWwzaHN6d2dh?=
 =?utf-8?B?T1ZhcHFOZmVHaWhoQllCWm4vL2tRdjJtTjU2SWlYOFhjTGFGV2NoT3Y3aVE0?=
 =?utf-8?B?cTB1UFNwRDc5SWlrTEVuYktsdGFiYUIva0pjTWZsV1UxK294TnpzUitjUThO?=
 =?utf-8?B?M2ljMFM0bm95cjUyUjZ5RERYOGl1Y0kzYUlid2EwV2FqRVJ3K21SMm1CeUlI?=
 =?utf-8?B?ZGcwYTZUUktmd0NBYUMvWldEMEVjY3BXT0ZEYmYydEdlVDh5TGtHLzFGL0Jh?=
 =?utf-8?B?bUN6QmdQcThiaVByVE94eHNQcFJBdkhiY3grVnpTMEY1Y0FhLy9JSko3QnNU?=
 =?utf-8?B?WGxyM3NaWVd4OHdIYTNReVg0bXpBUzlVbW8rVmlvaXVNcUNhdCtycDZEcVdj?=
 =?utf-8?B?Qll6TllxM0haZDNpTFNhV0lrdjRqV3FIdUxQUVF6ako1dzBhV01FdlNZMTFT?=
 =?utf-8?B?eFlEOSt5cGRyZm94blMyamNpWWdmVUY1aUlWcnlUSXRNaUx2R1VVOXFFY214?=
 =?utf-8?B?RDZhcVkvSDBSWFlGM0E1WXJ0SWEyMEVraDNXeldRVlZiaXB6eFlTMXNESHVX?=
 =?utf-8?B?YlFDKzZnRmJEdGxod1JTSnl5eHZxVzBXTFUzZWxvUWVRcEFVbjFLeDdXekp2?=
 =?utf-8?B?NUFYR0IweFVPYmU0NzVDZlRjZ053OHZ2TTFLS3QweHpOVUw1aWxVbnZEL3pY?=
 =?utf-8?B?cTk3Tko0cFBpb0x4bzFnejRrZGhYUWhLTmJhZ1pWWXZJZlczeXNGZWF3TWdv?=
 =?utf-8?B?SUZ2RmNsaTkydDE0UGc0b1pQT3VxR0IzeVBpamxpWklDTTFoUkxwQ1VvS3A3?=
 =?utf-8?Q?izG52I0WWAtaWplw=3D?=
X-Exchange-RoutingPolicyChecked: R4UQSMx1ysbnEa2qyczrH4cNz464FZyzPDswdlWMnSQYom7S9KdhxCUn9HNiQLQiUFoRlhephM1fWLtGaBQg1rWjCILSUrIHYZaZepPHhCnqcXDZ8KQg9rT2XkxrWzKrfVM87xD/MIi9fmuVy7hzSLFeEnwvdeZpQjnOi90uVyV/ulrlCvZTnUhIyCHUU6UMzKV40XriiCiq1onLXXkirJ6u9rkwsi5jaV1HhT8YdgKddCGH5WNrNKEjBTFGETo7ZDG3Qz175E4R0nKfT3FTcYbRI/FR7RBmRbMTcoeiHEY7HkX/S7oTeORHVPk3XI6tS6oti6WlqsXXWn6DzAap6Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 57819f6d-728d-4542-4e21-08df34dc5438
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5028.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 10:15:02.3102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yTeWM18fxPANYyZ1PNv132lKMK9KGzsdUcre6xUFLImOmQXUNC8wcdSXlhZ0vTONbIMfZ51vP7yGFWNEhaU8hFsQMHYWFU212rWmdx+1Xno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2A0C3F85C
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



On 10/28/2026 1:43 PM, Dnyaneshwar Bhadane wrote:
> 
> 
> On 27-Oct-26 4:25 PM, Borah, Chaitanya Kumar wrote:
>>
>>
>> On 10/23/2026 10:58 AM, Bhadane, Dnyaneshwar wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Bhadane, Dnyaneshwar
>>>> Sent: Friday, October 23, 2026 10:32 AM
>>>> To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>; igt-
>>>> dev@lists.freedesktop.org
>>>> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; 
>>>> Anirban, Sk
>>>> <sk.anirban@intel.com>; Grzelak, Michal <michal.grzelak@intel.com>; 
>>>> B, Jeevan
>>>> <Jeevan.B@intel.com>; Sharma, Swati2 <swati2.sharma@intel.com>
>>>> Subject: RE: [PATCH i-g-t 3/3] tests/intel/xe_survivability: Reload 
>>>> audio driver on
>>>> exit
>>>>
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>>>>> Chaitanya Kumar Borah
>>>>> Sent: Thursday, October 15, 2026 7:31 PM
>>>>> To: igt-dev@lists.freedesktop.org
>>>>> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Anirban,
>>>>> Sk <sk.anirban@intel.com>; Grzelak, Michal <michal.grzelak@intel.com>;
>>>>> B, Jeevan <jeevan.b@intel.com>; Sharma, Swati2
>>>>> <swati2.sharma@intel.com>
>>>>> Subject: [PATCH i-g-t 3/3] tests/intel/xe_survivability: Reload audio
>>>>> driver on exit
>>>>>
>>>>> Commit 117e9ecbdd1d ("xe/igt_kmod_unbind: release audio before
>>>>> unbinding
>>>>> xe") made igt_audio_driver_unload() be called before unbinding xe to
>>>>> avoid the audio-component bind warnings/errors that happen if xe is
>>>>> unbound while snd_hda_intel is still attached. Both call sites in this
>>>>> file passed NULL for the unloaded driver name, so it was never
>>>>> tracked, and nothing ever reloaded it afterwards.
>>>>>
>>>>> As a result snd_hda_intel/snd_hdmi_lpe_audio is left unloaded for the
>>>>> rest of the boot even when every subtest passes, since xe always ends
>>>>> up rebound by
>>>>> restore() but audio never does.
>>>>>
>>>>> Capture the unloaded driver name and reload it wherever xe gets bound
>>>>> again in restore().
>>>>>
>>>>> Cc: Sk Anirban <sk.anirban@intel.com>
>>>>> Cc: Michał Grzelak <michal.grzelak@intel.com>
>>>>> Cc: Jeevan B <jeevan.b@intel.com>
>>>>> Cc: Swati Sharma <swati2.sharma@intel.com>
>>>>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>>>> ---
>>>>>   tests/intel/xe_survivability.c | 11 +++++++++--
>>>>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/tests/intel/xe_survivability.c
>>>>> b/tests/intel/xe_survivability.c index
>>>>> bae9eca27..2be8e9ec0 100644
>>>>> --- a/tests/intel/xe_survivability.c
>>>>> +++ b/tests/intel/xe_survivability.c
>>>>> @@ -39,6 +39,7 @@
>>>>>    */
>>>>>
>>>>>   static char bus_addr[NAME_MAX];
>>>>> +static char *snd_driver;
>>>>>
>>>>>   static void ignore_wedged_in_dmesg(void)  { @@ -158,7 +159,7 @@
>>>>> static void restore(int sig)  {
>>>>>       int configfs_fd;
>>>>>
>>>>> -    igt_audio_driver_unload(NULL);
>>>>> +    igt_audio_driver_unload(&snd_driver);
>>>>>       igt_kmod_unbind("xe", bus_addr);
>>>>>
>>>>>       configfs_fd = igt_configfs_open("xe"); @@ -167,11 +168,17 @@ 
>>>>> static
>>>>> void restore(int sig)
>>>>>       close(configfs_fd);
>>>>>
>>>>>       igt_kmod_bind("xe", bus_addr);
>>>>> +
>>>>> +    if (snd_driver) {
>>>>> +        igt_kmod_load(snd_driver, NULL);
>>>> Hello Chaitanya,
>>>>
>>>> Would it be possible to have a helper like igt_audio_driver_load(), 
>>>> so we don't
>>>> have to maintain the driver's name in multiple files ?
>>> Something like default to "snd_hda_intel" if passed with NULL.
>>> int igt_audio_driver_load(const char *who)
>>> {
>>>     const char *drv = who ? who : "snd_hda_intel";
>>>     int ret;
>>>
>>>     if (igt_kmod_is_loaded(drv))
>>>         return 0;
>>>
>>>     ret = igt_kmod_load(drv, NULL);
>>>     if (ret)
>>>         igt_debug("Could not load audio driver %s (%s)\n",
>>>               drv, strerror(-ret));
>>>
>>>     return ret;
>>> }
>>
>> I would prefer keeping the exposure of the change to per file/test. I 
>> think "load back what I unloaded" is a good semantics to have instead 
>> of maintaining the driver name globally somewhere.
>>
>> But I would agree that there is a scope for a helper which can help 
>> get rid of the repeated if (snd_driver) {...} code block.
>>
>> I am thinking of something like.
>>
>> int igt_audio_driver_load(char **who)
>> {
>>      int ret;
>>
>>      if (!who || !*who)
>>          return 0;
>>
>>      ret = igt_kmod_load(*who, NULL);
>>      if (ret)
>>          igt_warn("Could not load audio driver %s (%s)\n", *who, 
>> strerror(-ret));
>>
>>      free(*who);
> Hi,
> Unwanted behavior if the order is igt_audio_driver_load(snd_driver) -> 
> igt_audio_driver_unload(snd_driver).  Freeing this will loose the audio 
> driver name.  Let testcase decide when they want to free this 
> 'snd_driver' mostly on testcase cleanup on exist.
> 
> 

Good catch. The memory handling of the string should be left to the 
caller. Will fix it in the next revision.

> 
> Dnyaneshwar,
> 
>  >      *who = NULL;
>>
>>      return ret;
>> }
>>
>> ==
>> Chaitanya
>>
>>
>>>
>>> Br,
>>> Dnyaneshwar,
>>>>
>>>> Br,
>>>> Dnyaneshwar
>>>>> +        free(snd_driver);
>>>>> +        snd_driver = NULL;
>>>>> +    }
>>>>>   }
>>>>>
>>>>>   static void set_survivability_mode(int configfs_device_fd, bool 
>>>>> value)  {
>>>>> -    igt_audio_driver_unload(NULL);
>>>>> +    igt_audio_driver_unload(&snd_driver);
>>>>>       igt_kmod_unbind("xe", bus_addr);
>>>>>       igt_sysfs_set_boolean(configfs_device_fd, 
>>>>> "survivability_mode", value);
>>>>>       igt_kmod_bind("xe", bus_addr);
>>>>> -- 
>>>>> 2.50.1
>>>
>>
> 

